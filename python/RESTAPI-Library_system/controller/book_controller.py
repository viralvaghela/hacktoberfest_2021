from flask import jsonify, request
from model.models import *

def create(_id):
    """
    create book
    """
    try:
        data = Author.query.filter_by(id=_id).first()

        _title = request.json["title_book"]
        _publisher = request.json["publisher"]
        _country = request.json["country"]
        _synopsis = request.json["synopsis"]
        _author_id = data.id

        new_book = Book(
            title_book=_title,
            publisher=_publisher,
            country=_country,
            synopsis=_synopsis,
            author_id=_author_id
        )
        db.session.add(new_book)
        db.session.commit()
        return jsonify({"message": "book successfully added"})
    except Exception as e:
        print(e)


def get_all_book():
    """
    Return all book
    """
    try:
        return [Book.json(book) for book in Book.query.all()]
    except Exception as e:
        print(e)


def get_single_book(_id):
    """
    Return single book
    """
    try:
        data = Book.query.filter_by(id=_id).first()

        get_data = singleTransform(data)
        return jsonify({"book": get_data})
    except Exception as e:
        print(e)


def singleTransform(values):
    """
    Return value for single book
    """
    try:
        data = {
            "id_book": values.id,
            "title_book": values.title_book,
            "publisher": values.publisher,
            "country": values.country,
            "synopsis": values.synopsis,
            "author": author_book(values.author)
        }
        return data
    except Exception as e:
        print(e)

def author_book(datas):
    """
    Return value author name for single book
    """
    try:
        data = [{"author": datas.author_name}]
        return data
    except Exception as e:
        print(e)


def update(_id):
    """
    Update book data
    """
    try:
        _title = request.json["title_book"]
        _publisher = request.json["publisher"]
        _country = request.json["country"]
        _synopsis = request.json["synopsis"]
        _author_id = request.json["author_id"]

        book = Book.query.filter_by(id=_id).first()
        if not book:
            return jsonify({"message": "ID is not found"}), 401

        book.title_book = _title
        book.publisher = _publisher
        book.country = _country
        book.synopsis = _synopsis
        book.author_id = _author_id
        db.session.commit()
        return jsonify({"message": "Successfully update author data!"})
    except Exception as e:
        print(e)


def delete(_id):
    """
    Delete book data
    """
    try:
        book = Book.query.filter_by(id=_id).delete()
        if not book:
            return jsonify({"message": "ID is not found"}), 401

        db.session.commit()
        return jsonify({"message": "Successfully delete author data!"})
    except Exception as e:
        print(e)