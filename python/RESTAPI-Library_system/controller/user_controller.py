from flask import jsonify, request
import json
from werkzeug.security import generate_password_hash
from model.models import *


def create():
    """
    create user and detail user
    """
    try:
        # user
        _username = request.json["username"]
        _password = request.json["password"]
        _name = request.json["name"]
        _status = request.json["status"]

        hashed_password = generate_password_hash(password=_password, method="sha256")
        new_user = Users(
            username=_username,
            password=hashed_password,
            name=_name,
            status=_status,
        )
        db.session.add(new_user)

        # detail user
        _address = request.json["address"]
        _phone_number = request.json["phone_number"]
        _email = request.json["email"]

        detail_user = DetailUsers(
            address=_address,
            phone_number=_phone_number,
            email=_email,
            users=new_user,  # user_id
        )
        db.session.add(detail_user)
        db.session.commit()
        return jsonify({"message": "registered successfully!"})
    except Exception as e:
        return jsonify({"message": "Duplicate Data username or email, please check again"})


def get_all_user():
    """
    Return all user
    """
    try:
        return [Users.json(user) for user in Users.query.all()]
    except Exception as e:
        print(e)


def get_single_user(_id):
    """
    Return a single user
    """
    try:
        data = Users.query.filter_by(id=_id).first()
        if not data:
            return jsonify({"message": "ID is not found"}), 404

        get_data = singleTransform(data)
        return jsonify([{"user": get_data}])
    except Exception as e:
        print(e)


def singleTransform(values):
    """
    Get data Users and DetailUsers
    """
    data = {
        "id_user": values.id,
        "username": values.username,
        "name": values.name,
        "status": values.status,
        "detail_user": singleTransformDetailUser(values.get_detail),
    }
    author = []
    for i in values.get_author:
        author.append({"name_author": i.author_name})
    data["author_created"] = author
    return data


def singleTransformDetailUser(details):
    data = {
        "address": details.address,
        "phone_number": details.phone_number,
        "email": details.email,
        "created_on": details.created_on,
        "updated_on": details.updated_on,
    }
    return data


def update(_id):
    """
    Update name from Users
    Update address, phone_number, email from DetailUsers
    """
    try:
        _name = request.json["name"]
        users = Users.query.filter_by(id=_id).first()
        if not users:
            return jsonify({"message": "ID is not found"}), 401
        users.name = _name

        _address = request.json["address"]
        _phone_number = request.json["phone_number"]
        _email = request.json["email"]
        details = DetailUsers.query.filter_by(user_id=_id).first()
        details.address = _address
        details.phone_number = _phone_number
        details.email = _email
        db.session.commit()
        return jsonify({"message": "Successfully update data!"})
    except Exception as e:
        print(e)


def delete(_id):
    """
    Deleted data Users and DetailUsers
    """
    try:
        users = Users.query.filter_by(id=_id).delete()
        details = DetailUsers.query.filter_by(user_id=_id).delete()
        if not users and not details:
            return jsonify({"message": "ID is not found"}), 404

        db.session.commit()
        return jsonify({"message": "Successfully delete data!"})
    except Exception as e:
        print(e)
