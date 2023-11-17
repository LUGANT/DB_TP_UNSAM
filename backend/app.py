from flask import Flask
 
# Initializing flask app
app = Flask(__name__)
     
# Running app
if __name__ == '__main__':
    app.run(debug=True)