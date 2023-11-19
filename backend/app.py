from flask import Flask, jsonify
from flask_mysqldb import MySQL

from db import Database

# Initializing flask app
flaskApp = Flask(__name__)

flaskApp.config['MYSQL_HOST'] = 'localhost'
flaskApp.config['MYSQL_USER'] = 'root'
flaskApp.config['MYSQL_PASSWORD'] = 'masu'
flaskApp.config['MYSQL_DB'] = 'tp_basededatos'

db = Database(flaskApp)

@flaskApp.route('/productos')
def getProductos():
    # productosJSON = fromProductoToJSON(ProductoService().getProductos())
    # return jsonify(productosJSON)
    pass

@flaskApp.route('/productos/sector/<sector>')
def getProductosSector(sector:str):
    return jsonify(db.getProductoSector(sector))

@flaskApp.route('/productos/repositor/<repositor>')
def getProductosRepositor(repositor:str):
    return jsonify(db.getProductoRepositor(repositor))

@flaskApp.route('/productos/db')
def getProductosDB() ->  None:
    cursor = db.connection.cursor()

    cursor.execute('''select * from producto''')

    datos = cursor.fetchall()

    cursor.close()

    print(datos)
    print(type(datos))

#---------------------------------------------------------

@flaskApp.route('/repositores')
def getRepositores():
    return jsonify(db.getRepositoresDB())

#---------------------------------------------------------

@flaskApp.route('/sectores')
def getSectores():
    return jsonify(db.getSectoresDB())

# Running app
if __name__ == '__main__':
    flaskApp.run(debug=True)