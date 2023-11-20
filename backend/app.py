from flask import Flask, jsonify

from dbMySQL import MySQLDataBase

# Initializing flask app
flaskApp = Flask(__name__)
mysqldb = MySQLDataBase()


# ---------------------------------------------------------

@flaskApp.route('/productos/sector/<sector>')
def getProductosSector(sector:str):
    return jsonify(mysqldb.getProductoSector(sector))

@flaskApp.route('/productos/repositor/<repositor>')
def getProductosRepositor(repositor:str):
    return jsonify(mysqldb.getProductoRepositor(repositor))

#---------------------------------------------------------

@flaskApp.route('/repositores')
def getRepositores():
    return jsonify(mysqldb.getRepositoresDB())

#---------------------------------------------------------

@flaskApp.route('/sectores')
def getSectores():
    return jsonify(mysqldb.getSectoresDB())

# Running app
if __name__ == '__main__':
    flaskApp.run(debug=True)