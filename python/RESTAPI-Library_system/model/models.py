from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from setting import *
import json

db = SQLAlchemy(app)


class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True)
    password = db.Column(db.String(50))
    name = db.Column(db.String(50))
    status = db.Column(db.Integer)
    created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    # one to one
    get_detail = db.relationship("DetailUsers", backref="users", uselist=False)
    # one to many
    get_author = db.relationship("Author", backref="users")
    """
    backref: digunakan pada saat insert query di tabel lain.
    (tabel yang memiliki ForeignKey)
    """

    def json(self):
        return {
            "id": self.id,
            "username": self.username,
            "name": self.name,
            "status": self.status,
            "created_on": self.created_on,
        }

    def __repr__(self):
        user_object = {
            "id": self.id,
            "username": self.username,
            "name": self.name,
            "status": self.status,
            "created_on": self.created_on,
        }
        return json.dumps(user_object)


class DetailUsers(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    address = db.Column(db.Text)
    phone_number = db.Column(db.String(15))
    email = db.Column(db.String(50), unique=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"))
    created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    updated_on = db.Column(db.DateTime(), default=datetime.utcnow, onupdate=datetime.utcnow)

    def json(self):
        return {
            "address": self.address,
            "phone_number": self.phone_number,
            "email": self.email,
            "created_on": self.created_on,
            "updated_on": self.updated_on,
        }

    def __repr__(self):
        detail_object = {
            "address": self.address,
            "phone_number": self.phone_number,
            "email": self.email,
            "created_on": self.created_on,
            "updated_on": self.updated_on,
        }
        return json.dumps(detail_object)


class Author(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    author_name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(20))
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"))
    created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    get_book = db.relationship("Book", backref="author")

    def json(self):
        return {
            "id_author": self.id,
            "author_name": self.author_name,
            "email": self.email,
            "user_id": self.user_id,
            "created_on": self.created_on,
        }

    def __repr__(self):
        author_object = {
            "id_author": self.id,
            "author_name": self.author_name,
            "email": self.email,
            "user_id": self.user_id,
            "created_on": self.created_on,
        }
        return json.dumps(author_object)


class Book(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title_book = db.Column(db.String(50))
    publisher = db.Column(db.String(50))
    country = db.Column(db.String(50))
    synopsis = db.Column(db.String(255))
    author_id = db.Column(db.Integer, db.ForeignKey("author.id"))
    created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    updated_on = db.Column(db.DateTime(), default=datetime.utcnow, onupdate=datetime.utcnow)
    
    def json(self):
        return {
            "id_book": self.id,
            "title_book": self.title_book,
            "publisher": self.publisher,
            "country": self.country,
            "synopsis": self.synopsis,
            "created_on": self.created_on,
            "updated_on": self.updated_on,
        }

    def __repr__(self):
        book_object = {
            "id_book": self.id,
            "title_book": self.title_book,
            "publisher": self.publisher,
            "country": self.country,
            "synopsis": self.synopsis,
            "created_on": self.created_on,
            "updated_on": self.updated_on,
        }
        return json.dumps(book_object)
