from domain.producto import Producto

class ProductoRepository:
    
    def __init__(self) -> None:
        pass

    def getProductosFromDB() -> list[Producto]:
        return [
            Producto(1,'Coca Cola Antenni','Bebida gasificada con azucar',''),
            Producto(2,'DRodriF','Pastillas con sabor a menta',''),
            Producto(3,'Caramelos Don Feli','Caramelos masticables',''),
            Producto(4,'Gomitas Masuyama','Gomitas con sabor a fruta',''),
            ]

repositorioProducto = ProductoRepository()