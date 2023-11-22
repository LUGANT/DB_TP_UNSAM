from mysql.connector import connection

class MySQLDataBase():
    
    def __init__(self) -> None:
        self.user = 'root'
        self.password = '1234'
        self.host = 'localhost'
        self.database = 'tp_basededatos'

    def getConnection(self):
        return connection.MySQLConnection(
                                user=self.user, 
                                password=self.password,
                                host=self.host,
                                database=self.database)
    
    def _getNamesDB(self, docstring: str):
        connection = self.getConnection()
        cursor = connection.cursor(dictionary=True)

        query = (docstring)

        cursor.execute(query)
        names = cursor.fetchall()

        cursor.close()
        connection.close()
        return names

    def getRepositoresDB(self):
        return self._getNamesDB('''select nombre from repositor''')


    def getSectoresDB(self):
        return self._getNamesDB('''select desc_sector from sector''')

    def getProductoSector(self, sector:str):
        connection = self.getConnection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute(f'''
        select id_sector from sector
        where desc_sector = '{sector}'
        ''')

        idSector = cursor.fetchall()[0]['id_sector']

        cursor.execute(f'''
        select gp.id_producto as 'id', pr.nombre as 'nombre_producto', g.nombre as 'nombre_gondola', p.desc_presentacion as 'descripcion_presentacion' from gondola_producto gp
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
        connection = self.getConnection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute(f'''
        select id_repositor from repositor
        where nombre = '{repositor}'
        ''')

        idRepositor = cursor.fetchall()[0]['id_repositor']
        
        cursor.execute(f'''
        select gp.id_producto as 'id', pr.nombre as 'nombre_producto', g.nombre as 'nombre_gondola', p.desc_presentacion as 'descripcion_presentacion' from gondola_producto gp
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