from domain.producto import Producto

class ProductoRepository:
    
    def __init__(self) -> None:
        pass

    def getProductosFromDB(self) -> list[Producto]:
        return [
            Producto(1,'Coca Cola Antenni','Bebida gasificada con azucar',1,1),
            Producto(2,'DRodriF','Pastillas con sabor a menta',2,2),
            Producto(3,'Caramelos Don Feli','Caramelos masticables',3,3),
            Producto(4,'Gomitas Masuyama','Gomitas con sabor a fruta',4,4),
            ]