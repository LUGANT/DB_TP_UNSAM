from flask import Blueprint
from domain.sector import Sector

sectorController = Blueprint('sectorController', __name__)

@sectorController.route('/sector')
def getRepositores() -> list[Sector]:
    pass