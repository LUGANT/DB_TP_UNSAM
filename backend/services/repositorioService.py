from repositories.repositorRepository import RepositorRepository
from domain.repositorio import Repositor

class RepositorService:

    def __init__(self) -> None:
        self.repositorio = RepositorRepository()

    def getProductos(self) -> list[Repositor]:
        return self.repositorio.getRepositoresFromDB()