from domain.sector import Sector

class SectorRepository:
    
    def __init__(self) -> None:
        pass

    def getSectoresFromDB() -> list[Sector]:
        return [
            Sector(1,"Bebidas"),
            Sector(2,"Verduras"),
            Sector(3,"Cosas")
            ]