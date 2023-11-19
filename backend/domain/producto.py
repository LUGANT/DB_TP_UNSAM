from domain.gondola import Gondola
from domain.presentacion import Presentacion

class Producto:
    def __init__(self, id:int, nombre:str, desc:str, idProductoReemplazo:int, idFila:int)-> None:
        self.id = id
        self.nombre = nombre
        self.desc = desc
        self.idProductoReemplazo = idProductoReemplazo
        self.idFila = idFila

class ProductoJSON:
    def __init__(self, producto: Producto, gondola: Gondola, presentacion: Presentacion) -> None:
        self.id = producto.id
        self.nombreProducto = producto.nombre
        self.gondola = gondola.nombre
        self.descPresentacion = presentacion.desc