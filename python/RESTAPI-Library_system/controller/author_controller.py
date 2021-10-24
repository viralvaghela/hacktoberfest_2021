from flask import jsonify, request
from model.models import *


def create(_id):
    """
    create author
    """
    try:
        data = Users.query.filter_by(id=_id).first()
        if not data:
            return jsonify({"message": "ID is not found"}), 401

        _author_name = request.json["author_name"]
        _email = request.json["email"]
        _user_id = data.id

        new_author = Author(author_name=_author_name, email=_email, user_id=_user_id)
        db.session.add(new_author)
        db.session.commit()
        return jsonify({"message": "author successfully added"})
    except Exception as e:
        print(e)


def get_all_author():
    """
    Return all author
    """
    try:
        return [Author.json(author) for author in Author.query.all()]
    except Exception as e:
        print(e)


def get_single_author(_id):
    """
    Return single author
    """
    try:
        data = Author.query.filter_by(id=_id).first()
        if not data:
            return jsonify({"message": "ID is not found"}), 401

        get_data = singleTransform(data)
        return jsonify({"author": get_data})
    except Exception as e:
        print(e)


def singleTransform(values):
    """
    Return value to Author
    """
    data = {
        "id_author": values.id,
        "name_author": values.author_name,
        "email": values.email,
        "created_by": createdBy(values.users),
    }
    book = []
    for i in values.get_book:
        book.append({"title_book": i.title_book})
    data["book"] = book
    return data


def createdBy(datas):
    """
    Return name value from Users to Author
    """
    data = [{"name": datas.name}]
    return data


def update(_id):
    """
    Update name author and email by id
    """
    try:
        _author_name = request.json["author_name"]
        _email = request.json["email"]
        
        author = Author.query.filter_by(id=_id).first()
        if not author:
            return jsonify({"message": "ID is not found"}), 401
        author.author_name = _author_name
        author.email = _email
        db.session.commit()
        return jsonify({"message": "Successfully update author data!"})
    except Exception as e:
        print(e)


def delete(_id):
    """
    Delete author
    """
    try:
        author = Author.query.filter_by(id=_id).delete()
        if not author:
            return jsonify({"message": "ID is not found"}), 401

        db.session.commit()
        return jsonify({"message": "Successfully delete author data!"})
    except Exception as e:
        print(e)
