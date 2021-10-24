# class Authors(db.Model):
#     __tablename__ = "author"
#     id = db.Column(db.Integer, primary_key=True)
#     user_id = db.Column(db.String(50))
#     author = db.Column(db.String(50), nullable=False)
#     phone_number = db.Column(db.String(13))
#     email = db.Column(db.String(20))

#     def json(self):
#         return {
#             "id": self.id,
#             "author": self.author,
#             "phone_number": self.phone_number,
#             "email": self.email,
#         }

#     def get_author():
#         return [Authors.json(author) for author in Authors.query.all()]

#     def add_author(_user_id, _author, _phone_number, _email):
#         new_author = Authors(
#             user_id=_user_id,
#             author=_author,
#             phone_number=_phone_number,
#             email=_email,
#         )
#         db.session.add(new_author)
#         db.session.commit()

#     # def delete_author(_book, _author):
#     #     Authors.query.filter_by(author=_author, book=_book).delete()
#     #     db.session.commit()

#     def __repr__(self):
#         author_object = {
#             "id": self.id,
#             "author": self.author,
#             "phone_number": self.phone_number,
#             "email": self.email,
#         }
#         return json.dumps(author_object)


# class Book(db.Model):
#     __tablename__ = "book"
#     id = db.Column(db.Integer, primary_key=True)
#     author_id = db.Column(db.Integer, nullable=False)
#     title_book = db.Column(db.String(20), nullable=False)
#     publisher = db.Column(db.String(30), nullable=False)
#     country = db.Column(db.String(50), nullable=False)
#     synopsis = db.Column(db.Text(), nullable=True)
#     created_on = db.Column(db.DateTime(), default=datetime.utcnow)
#     updated_on = db.Column(db.DateTime(), default=datetime.utcnow, onupdate=datetime.utcnow)

#     def json(self):
#         return {
#             "author_id": self.author_id,
#             "title_book": self.title_book,
#             "publisher": self.publisher,
#             "country": self.country,
#             "synopsis": self.synopsis,
#             "created_on": self.created_on,
#             "updated_on": self.updated_on,
#         }

#     def get_book():
#         return [Book.json(author) for author in Book.query.all()]

#     def add_book(_author_id, _title_book, _publisher, _country, _synopsis):
#         new_book = Book(
#             author_id=_author_id,
#             title_book=_title_book,
#             publisher=_publisher,
#             country=_country,
#             synopsis=_synopsis,
#         )
#         db.session.add(new_book)
#         db.session.commit()

#     # def delete_author(_book, _author):
#     #     Authors.query.filter_by(author=_author, book=_book).delete()
#     #     db.session.commit()

#     def __repr__(self):
#         book_object = {
#             "author_id": self.author_id,
#             "title_book": self.title_book,
#             "country": self.country,
#             "publisher": self.publisher,
#             "synopsis": self.synopsis,
#             "created_on": self.created_on,
#             "updated_on": self.updated_on,
#         }
#         return json.dumps(book_object)