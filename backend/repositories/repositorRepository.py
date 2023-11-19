from domain.repositorio import Repositor

class RepositorRepository:
    
    def __init__(self) -> None:
        pass

    def getRepositoresFromDB() -> list[Repositor]:
        return [
            Repositor(1, 'Gabriel'),
            Repositor(2, 'Javier'),
            Repositor(3, 'Manuel'),
            Repositor(4, 'Miguel')
            ]