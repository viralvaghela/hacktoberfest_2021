from flask import Flask

app = Flask(__name__) 

app.config['SECRET_KEY']='Th1s1ss3cr3t'
app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///C:/python-projects/library-rest-api/library.db' 
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True 