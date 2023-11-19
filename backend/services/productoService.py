from repositories.productoRespository import ProductoRepository
from domain.producto import Producto

class ProductoService:

    def __init__(self) -> None:
        self.repositorio = ProductoRepository()

    def getProductos(self) -> list[Producto]:
        return self.repositorio.getProductosFromDB()