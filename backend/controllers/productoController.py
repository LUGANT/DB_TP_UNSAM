from backend import app
from domain.producto import ProductoJSON, Producto
from domain.gondola import Gondola
from domain.presentacion import Presentacion
from services.productoService import productoService
from flask import jsonify

"""
getProductosEndpoint
"""

@app.route('/productos')
def getProductos() ->  list[ProductoJSON]: 
    productosJSON = fromProductoToJSON(productoService.getProductos())
    return jsonify(productosJSON)

def fromProductoToJSON(productos: list[Producto]) -> list[ProductoJSON]:
    productosJSON: list[ProductoJSON] = []
    
    for producto in productos:
        productosJSON.append( ProductoJSON( producto, Gondola(), Presentacion()  ) )
    
    return productosJSON
