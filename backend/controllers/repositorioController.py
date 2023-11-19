from flask import Blueprint
from domain.repositorio import Repositor

repositorioController = Blueprint('repositorioController', __name__)

@repositorioController.route('/repositor')
def getRepositores() -> list[Repositor]:
    pass