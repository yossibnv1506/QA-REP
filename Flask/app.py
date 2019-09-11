from pymongo import MongoClient
from flask import Flask, render_template,request,redirect, url_for
from flask import Flask
app = Flask(__name__)

@app.route('/')
def student():
   return render_template('student.html')

@app.route('/result',methods = ['POST', 'GET'])
def result():
   if request.method == 'POST':
      result = request.form["User_Id"]
      user = (collection.find_one({"User_Id": str(result)}))
      if user is not None:
            return render_template("result.html",result = user)

client = MongoClient()
db = client.test_database
collection = db.Users
Users = [{"User_Id" : "Yuval", "Message" : "dev"}, {"User_Id" : "Lidor", "Message" : "devops"}, {"User_Id" : "Tamir", "Message" : "dev"}]
x = collection.insert_many(Users)
collist = db.list_collection_names()


if __name__ == '__main__':
    app.run()


