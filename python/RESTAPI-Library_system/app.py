from flask import request, jsonify, make_response
from functools import wraps
from werkzeug.security import check_password_hash
import datetime
import jwt
from setting import *
from controller import user_controller, author_controller, book_controller
from model.models import Users


def token_required(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        token = None
        if "x-access-tokens" in request.headers:
            token = request.headers["x-access-tokens"]

        if not token:
            return jsonify({"message": "a valid token is missing"}), 401

        try:
            data = jwt.decode(token, app.config["SECRET_KEY"])
            current_user = Users.query.filter_by(id=data["id"]).first()
        except:
            return jsonify({"message": "token is invalid"}), 401

        return f(current_user, *args, **kwargs)

    return decorator


@app.route("/user", methods=["POST", "GET"])
def user():
    if request.method == "GET":
        return jsonify({"user": user_controller.get_all_user()})
    else:
        return user_controller.create()


@app.route("/user/<id>", methods=["PUT", "GET", "DELETE"])
@token_required
def user_detail(current_user, id):
    if request.method == "GET":
        return user_controller.get_single_user(id)
    elif request.method == "PUT":
        return user_controller.update(id)
    elif request.method == "DELETE":
        return user_controller.delete(id)


@app.route("/login", methods=["POST"])
def login_user():
    auth = request.authorization

    if not auth or not auth.username or not auth.password:
        return make_response(
            "could not verify",
            401,
            {"WWW.Authentication": 'Basic realm: "login required"'},
        )

    user = Users.query.filter_by(username=auth.username).first()
    if user.status == 1:
        if check_password_hash(user.password, auth.password):
            token = jwt.encode(
                {
                    "id": user.id,
                    "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30),
                },
                app.config["SECRET_KEY"],
            )
            if user.status == 1:
                status = "admin"
            else:
                status = "user"
            return jsonify({"token": token.decode("UTF-8"), "status_login": status})
    else:
        return jsonify({"message": "login as user"})
    return make_response("Couldn't verify", 401)


# Author
@app.route("/author", methods=["GET"])
@token_required
def all_authors(current_user):
    return jsonify({"author": author_controller.get_all_author()})


@app.route("/author/<id>", methods=["POST", "GET", "PUT", "DELETE"])
@token_required
def author(current_user, id):
    if request.method == "GET":
        return author_controller.get_single_author(id)
    elif request.method == "POST":
        return author_controller.create(id)
    elif request.method == "PUT":
        return author_controller.update(id)
    elif request.method == "DELETE":
        return author_controller.delete(id)


# Book
@app.route("/book", methods=["GET"])
@token_required
def all_book(current_user):
    return jsonify({"book": book_controller.get_all_book()})


@app.route("/book/<id>", methods=["GET", "POST", "PUT", "DELETE"])
@token_required
def book(current_user, id):
    if request.method == "GET":
        return book_controller.get_single_book(id)
    elif request.method == "POST":
        return book_controller.create(id)
    elif request.method == "PUT":
        return book_controller.update(id)
    elif request.method == "DELETE":
        return book_controller.delete(id)

if __name__ == "__main__":
    app.run(debug=True)
