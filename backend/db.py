from flask_mysqldb import MySQL
from flask import Flask

class Database:
    def __init__(self, app:Flask):
        app.config['MYSQL_HOST'] = 'localhost'
        app.config['MYSQL_USER'] = 'root'
        app.config['MYSQL_PASSWORD'] = 'masu'
        app.config['MYSQL_DB'] = 'tp_basededatos'
        app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

        # Inicialización de la extensión MySQL
        self.mysql = MySQL(app)

    def _get_connection(self):
        return self.mysql.connection

    def getRepositoresDB(self):
        cursor = self._get_connection().cursor()

        cursor.execute('''
        select nombre from repositor
        ''')
        datos = cursor.fetchall()
        cursor.close()

        return datos

    def getSectoresDB(self):
        cursor = self._get_connection().cursor()

        cursor.execute('''
        select desc_sector from sector
        ''')
        datos = cursor.fetchall()
        cursor.close()

        return datos

    def getProductoSector(self, sector):
        cursor = self._get_connection().cursor()

        cursor.execute(f'''
        select id_sector from sector
        where desc_sector = '{sector}'
        ''')

        idSector = cursor.fetchall()[0]['id_sector']
        print(idSector)
        
        cursor.execute(f'''
        select gp.id_producto, pr.nombre as 'Nombre Producto', g.nombre as 'Nombre Gondola', p.desc_presentacion as 'Descripcion presentacion' from gondola_producto gp
        left join presentacion p on gp.presentacion_id_presentacion = p.id_presentacion
        left join producto pr on pr.id_Producto = gp.id_producto
        left join gondola g on gp.id_Gondola = g.id_gondola
        left join gondola_producto_repositor gpr on gpr.id_Gondola = gp.id_Gondola and gpr.id_Producto = gp.id_Producto
        where g.id_Sector = {idSector}
        ''')
        datos = cursor.fetchall()
        print(datos)
        cursor.close()

        return datos

    def getProductoRepositor(self, repositor):
        cursor = self._get_connection().cursor()

        cursor.execute(f'''
        select id_repositor from repositor
        where nombre = '{repositor}'
        ''')

        idRepositor = cursor.fetchall()[0]['id_repositor']
        print(idRepositor)
        
        cursor.execute(f'''
        select gp.id_producto, pr.nombre as 'Nombre Producto', g.nombre as 'Nombre Gondola', p.desc_presentacion as 'Descripcion presentacion' from gondola_producto gp
        left join presentacion p on gp.presentacion_id_presentacion = p.id_presentacion
        left join producto pr on pr.id_Producto = gp.id_producto
        left join gondola g on gp.id_Gondola = g.id_gondola
        left join gondola_producto_repositor gpr on gpr.id_Gondola = gp.id_Gondola and gpr.id_Producto = gp.id_Producto

        where gpr.id_repositor = {idRepositor}
        ''')
        datos = cursor.fetchall()
        print(datos)
        cursor.close()

        return datos