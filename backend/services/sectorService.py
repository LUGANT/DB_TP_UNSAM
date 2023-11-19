from repositories.sectorRepository import SectorRepository
from domain.repositorio import Repositor

class RepositorService:

    def __init__(self) -> None:
        self.repositorio = SectorRepository()

    def getProductos(self) -> list[Repositor]:
        return self.repositorio.getSectoresFromDB()