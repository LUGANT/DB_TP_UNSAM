-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_basededatos
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_Empresa` int NOT NULL AUTO_INCREMENT,
  `razon social` varchar(45) DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Empresa 1','Cordoba 1234'),(2,'Empresa 2','Santa fe 456'),(3,'Empresa 3','Corrientes 678');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flia_producto`
--

DROP TABLE IF EXISTS `flia_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flia_producto` (
  `id_flia` int NOT NULL AUTO_INCREMENT,
  `desc_flia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_flia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flia_producto`
--

LOCK TABLES `flia_producto` WRITE;
/*!40000 ALTER TABLE `flia_producto` DISABLE KEYS */;
INSERT INTO `flia_producto` VALUES (1,'limpieza'),(2,'alimentos'),(3,'electrodomesticos'),(4,'computacion'),(5,'bebidas');
/*!40000 ALTER TABLE `flia_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gondola`
--

DROP TABLE IF EXISTS `gondola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gondola` (
  `id_Gondola` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_Sector` int NOT NULL,
  PRIMARY KEY (`id_Gondola`),
  KEY `fk_Gondola_Sector1_idx` (`id_Sector`),
  CONSTRAINT `fk_Gondola_Sector1` FOREIGN KEY (`id_Sector`) REFERENCES `sector` (`id_Sector`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gondola`
--

LOCK TABLES `gondola` WRITE;
/*!40000 ALTER TABLE `gondola` DISABLE KEYS */;
INSERT INTO `gondola` VALUES (1,'Gondola Fideos',1),(2,'Gondola Arroz',1),(3,'Gondola Limpiadores',2);
/*!40000 ALTER TABLE `gondola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gondola_producto`
--

DROP TABLE IF EXISTS `gondola_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gondola_producto` (
  `id_Producto` int NOT NULL,
  `id_Gondola` int NOT NULL,
  `Presentacion_id_presentacion` int NOT NULL,
  PRIMARY KEY (`id_Producto`,`id_Gondola`),
  KEY `fk_Gondola_Producto_Producto1_idx` (`id_Producto`),
  KEY `fk_Gondola_Producto_Gondola1_idx` (`id_Gondola`),
  KEY `fk_Gondola_Producto_Presentacion1_idx` (`Presentacion_id_presentacion`),
  CONSTRAINT `fk_Gondola_Producto_Gondola1` FOREIGN KEY (`id_Gondola`) REFERENCES `gondola` (`id_Gondola`),
  CONSTRAINT `fk_Gondola_Producto_Presentacion1` FOREIGN KEY (`Presentacion_id_presentacion`) REFERENCES `presentacion` (`id_presentacion`),
  CONSTRAINT `fk_Gondola_Producto_Producto1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gondola_producto`
--

LOCK TABLES `gondola_producto` WRITE;
/*!40000 ALTER TABLE `gondola_producto` DISABLE KEYS */;
INSERT INTO `gondola_producto` VALUES (1,3,1),(2,3,1),(3,1,2),(4,2,3);
/*!40000 ALTER TABLE `gondola_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gondola_producto_repositor`
--

DROP TABLE IF EXISTS `gondola_producto_repositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gondola_producto_repositor` (
  `id_Producto` int NOT NULL,
  `id_Gondola` int NOT NULL,
  `id_Repositor` int NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`id_Producto`,`id_Gondola`,`id_Repositor`,`fecha`),
  KEY `fk_Gondola_Producto_has_Repositor_Repositor1_idx` (`id_Repositor`),
  KEY `fk_Gondola_Producto_has_Repositor_Gondola_Producto1_idx` (`id_Producto`,`id_Gondola`),
  CONSTRAINT `fk_Gondola_Producto_has_Repositor_Gondola_Producto1` FOREIGN KEY (`id_Producto`, `id_Gondola`) REFERENCES `gondola_producto` (`id_Producto`, `id_Gondola`),
  CONSTRAINT `fk_Gondola_Producto_has_Repositor_Repositor1` FOREIGN KEY (`id_Repositor`) REFERENCES `repositor` (`id_Repositor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gondola_producto_repositor`
--

LOCK TABLES `gondola_producto_repositor` WRITE;
/*!40000 ALTER TABLE `gondola_producto_repositor` DISABLE KEYS */;
INSERT INTO `gondola_producto_repositor` VALUES (1,3,1,'2023-10-25',25),(2,3,2,'2023-11-05',12),(3,1,3,'2023-09-04',16),(4,2,4,'2023-09-19',18);
/*!40000 ALTER TABLE `gondola_producto_repositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion` (
  `id_presentacion` int NOT NULL AUTO_INCREMENT,
  `desc_presentacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_presentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'Gondola con distintos tipos de limpiadores'),(2,'Gondola con fideos'),(3,'Gondola con distintos arroces');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_Producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_producto_reemplazo` int NOT NULL,
  `id_flia` int NOT NULL,
  PRIMARY KEY (`id_Producto`),
  KEY `fk_Producto_Flia Producto1_idx` (`id_flia`),
  KEY `fk_Producto_Producto1_idx` (`id_producto_reemplazo`),
  CONSTRAINT `fk_Producto_Flia Producto1` FOREIGN KEY (`id_flia`) REFERENCES `flia_producto` (`id_flia`),
  CONSTRAINT `fk_Producto_Producto1` FOREIGN KEY (`id_producto_reemplazo`) REFERENCES `producto` (`id_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Limpiador desinfectante Ayudin','Limpiador de 1800 ml',2,1),(2,'Limpiador de piso Poett','Limpiador de 900 ml',1,1),(3,'Fideos Matarazzo','Fideos tipo tallarin',4,2),(4,'Arroz Gallo Oro','Arroz doble carolina 500gr',3,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositor`
--

DROP TABLE IF EXISTS `repositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repositor` (
  `id_Repositor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_Empresa` int NOT NULL,
  PRIMARY KEY (`id_Repositor`),
  KEY `fk_Repositor_Empresa_idx` (`id_Empresa`),
  CONSTRAINT `fk_Repositor_Empresa` FOREIGN KEY (`id_Empresa`) REFERENCES `empresa` (`id_Empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositor`
--

LOCK TABLES `repositor` WRITE;
/*!40000 ALTER TABLE `repositor` DISABLE KEYS */;
INSERT INTO `repositor` VALUES (1,'Masuyama',1),(2,'Gonzalez',3),(3,'Tartaglia',2),(4,'Antenni',3);
/*!40000 ALTER TABLE `repositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `id_Sector` int NOT NULL AUTO_INCREMENT,
  `desc_sector` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Sector`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Alimentos'),(2,'Limpieza'),(3,'Electronica'),(4,'Bebidas');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 19:13:08
