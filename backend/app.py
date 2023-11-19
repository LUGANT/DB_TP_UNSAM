from flask import Flask
from flask_mysqldb import MySQL

from controllers.productoController import productoController
from controllers.repositorioController import repositorioController
from controllers.sectorController import sectorController

# Initializing flask app
flaskApp = Flask(__name__)
flaskApp.register_blueprint(productoController)
flaskApp.register_blueprint(repositorioController)
flaskApp.register_blueprint(sectorController)

db = MySQL(flaskApp)

# Running app
if __name__ == '__main__':
    flaskApp.run(debug=True)