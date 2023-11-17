from repositories.productoRespository import repositorioProducto
from domain.producto import Producto

class ProductoService:

    def __init__(self) -> None:
        self.repositorio = repositorioProducto

    def getProductos(self) -> list[Producto]:
        return self.repositorio.getProductosFromDB()
    
productoService = ProductoService()