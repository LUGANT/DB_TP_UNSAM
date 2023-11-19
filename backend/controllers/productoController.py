from domain.producto import ProductoJSON, Producto
from domain.gondola import Gondola
from domain.presentacion import Presentacion
from services.productoService import ProductoService
from flask import jsonify, Blueprint

"""
getProductosEndpoint
"""

productoController = Blueprint('productoController', __name__)

@productoController.route('/productos')
def getProductos() ->  list[ProductoJSON]: 
    productosJSON = fromProductoToJSON(ProductoService().getProductos())
    return jsonify(productosJSON)

@productoController.route('/productos/sector/<sector>')
def getProductosSector(sector:str) -> list[ProductoJSON]:
    pass

@productoController.route('/productos/repositor/<repositor>')
def getProductosRepositor(repositor:str) -> list[ProductoJSON]:
    pass

def fromProductoToJSON(productos: list[Producto]) -> list[dict]:
    productosJSON: list[dict] = []
    
    for producto in productos:
        productosJSON.append(
            {
                'id':producto.id,
                'nombre':producto.nombre,
                'gondola': Gondola().nombre,
                'presentacion': Presentacion().desc
            }
        )
    
    return productosJSON