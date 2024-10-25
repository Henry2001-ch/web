-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: invgestor
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Herramienta','2023-10-13 23:23:39','2023-10-13 23:27:36');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `iddepartamento` int NOT NULL AUTO_INCREMENT,
  `idempresa` int NOT NULL,
  `nombre` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`),
  KEY `fk_departamento_empresa1_idx` (`idempresa`),
  CONSTRAINT `fk_departamento_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalletransaccion`
--

DROP TABLE IF EXISTS `detalletransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalletransaccion` (
  `iddetalletransaccion` int NOT NULL AUTO_INCREMENT,
  `idtransaccion` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iddetalletransaccion`),
  KEY `fk_detalletransaccion_transaccion1_idx` (`idtransaccion`),
  KEY `fk_detalletransaccion_producto1_idx` (`idproducto`),
  CONSTRAINT `fk_detalletransaccion_producto1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `fk_detalletransaccion_transaccion1` FOREIGN KEY (`idtransaccion`) REFERENCES `transaccion` (`idtransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalletransaccion`
--

LOCK TABLES `detalletransaccion` WRITE;
/*!40000 ALTER TABLE `detalletransaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalletransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Brayan','Perez','Antigua','00000000','brayan@gmail.com','2023-10-01 06:00:00',NULL),(2,'Juan','Perez Lopez','Antigua','54782323','juanperez@gmail.com','2023-10-13 23:56:35','2023-10-13 23:56:35');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idempresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadotransaccion`
--

DROP TABLE IF EXISTS `estadotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadotransaccion` (
  `idestadotransaccion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idestadotransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadotransaccion`
--

LOCK TABLES `estadotransaccion` WRITE;
/*!40000 ALTER TABLE `estadotransaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('brayan@gmail.com','$2y$10$ceBYWKpaETE3fCC36HbRg.hZBqd7pdI4n/vfnZDSWNa8Yn519NA0O','2023-10-07 08:53:44');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `descripcionproducto` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `preciocosto` float NOT NULL DEFAULT '0',
  `precioventa` float NOT NULL DEFAULT '0',
  `compras` float NOT NULL DEFAULT '0',
  `ventas` float NOT NULL DEFAULT '0',
  `existencia` float NOT NULL DEFAULT '0',
  `idsubcategoria` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_subcategoria_idx` (`idsubcategoria`),
  CONSTRAINT `fk_producto_subcategoria` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategoria` (`idsubcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreproveedor` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `credito` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `diascredito` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'4567989','La Esperanza','Guatemala, Guatemala','25251414','laesperanza@gmail.com','1',30,'2023-10-14 01:13:02','2023-10-14 01:13:02'),(2,'457998','Los Tres','Guatemala, Guatemala','56341223','lostres@gmail.com','1',15,'2023-10-14 01:15:29','2023-10-14 01:15:29'),(3,'789453','Otros','Guat','54782323','juanperez@gmail.com','1',55,'2023-10-14 01:15:52','2023-10-14 01:15:52');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segasignacionopcion`
--

DROP TABLE IF EXISTS `segasignacionopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segasignacionopcion` (
  `idasignacionopcion` int NOT NULL AUTO_INCREMENT,
  `idopcion` int NOT NULL,
  `idrol` int NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idasignacionopcion`),
  KEY `fk_segasignacionopcion_segopcion1_idx` (`idopcion`),
  KEY `fk_segasignacionopcion_segrol1_idx` (`idrol`),
  CONSTRAINT `fk_segasignacionopcion_segopcion1` FOREIGN KEY (`idopcion`) REFERENCES `segopcion` (`idopcion`),
  CONSTRAINT `fk_segasignacionopcion_segrol1` FOREIGN KEY (`idrol`) REFERENCES `segrol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segasignacionopcion`
--

LOCK TABLES `segasignacionopcion` WRITE;
/*!40000 ALTER TABLE `segasignacionopcion` DISABLE KEYS */;
INSERT INTO `segasignacionopcion` VALUES (1,1,1,'1','2023-10-01 06:00:00',NULL),(2,2,1,'1','2023-10-01 06:00:00',NULL),(3,3,1,'1','2023-10-01 06:00:00',NULL),(4,4,1,'1','2023-10-01 06:00:00',NULL),(5,5,1,'1','2023-10-01 06:00:00',NULL),(6,6,1,'1','2023-10-01 06:00:00',NULL),(7,7,1,'1','2023-10-01 06:00:00',NULL),(8,8,1,'1','2023-10-01 06:00:00',NULL);
/*!40000 ALTER TABLE `segasignacionopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmenu`
--

DROP TABLE IF EXISTS `segmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmenu` (
  `idmenu` int NOT NULL AUTO_INCREMENT,
  `descripcionmenu` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iconomenu` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmenu`
--

LOCK TABLES `segmenu` WRITE;
/*!40000 ALTER TABLE `segmenu` DISABLE KEYS */;
INSERT INTO `segmenu` VALUES (1,'Configuracion','fa fa-cog fa-fw',1,NULL,NULL),(2,'Inventario','fa fa-check-square-o',2,NULL,NULL),(3,'Proveedor','fa fa-child',3,NULL,NULL),(4,'Transacciones','fa fa-check-square-o',4,NULL,NULL),(5,'Reportes','fa fa-print',5,NULL,NULL),(6,'Seguridad','fa fa-shield',6,NULL,NULL);
/*!40000 ALTER TABLE `segmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segopcion`
--

DROP TABLE IF EXISTS `segopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segopcion` (
  `idopcion` int NOT NULL AUTO_INCREMENT,
  `idmenu` int NOT NULL,
  `descripcionopcion` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `ruta` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `iconoopcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idopcion`),
  KEY `fk_segopcion_segmenu1_idx` (`idmenu`),
  CONSTRAINT `fk_segopcion_segmenu1` FOREIGN KEY (`idmenu`) REFERENCES `segmenu` (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segopcion`
--

LOCK TABLES `segopcion` WRITE;
/*!40000 ALTER TABLE `segopcion` DISABLE KEYS */;
INSERT INTO `segopcion` VALUES (1,1,'Categoria','catalogos/categoria','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(2,1,'Sub Categoria','catalogos/subcategoria','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(3,6,'Empleado','seguridad/empleado','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(4,6,'Rol','seguridad/segrol','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(5,6,'Usuario','seguridad/segusuario','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(6,5,'Reportes','reportspanel/panelreports','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(7,3,'Proveedor','inventario/proveedor','fa fa-square-o','1','2023-10-01 06:00:00',NULL),(8,1,'Tipo Transacción','catalogos/tipotransaccion','fa fa-square-o','1','2023-10-01 06:00:00',NULL);
/*!40000 ALTER TABLE `segopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segrol`
--

DROP TABLE IF EXISTS `segrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segrol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `descripcionrol` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segrol`
--

LOCK TABLES `segrol` WRITE;
/*!40000 ALTER TABLE `segrol` DISABLE KEYS */;
INSERT INTO `segrol` VALUES (1,'Administrador','1','2023-10-01 06:00:00',NULL),(2,'Bodeguero','1','2023-10-08 08:33:48','2023-10-08 08:37:16');
/*!40000 ALTER TABLE `segrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segusuariorol`
--

DROP TABLE IF EXISTS `segusuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segusuariorol` (
  `idusuariorol` int NOT NULL AUTO_INCREMENT,
  `idrol` int NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `users_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idusuariorol`),
  KEY `fk_segusuariorol_segrol1_idx` (`idrol`),
  CONSTRAINT `fk_segusuariorol_segrol1` FOREIGN KEY (`idrol`) REFERENCES `segrol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segusuariorol`
--

LOCK TABLES `segusuariorol` WRITE;
/*!40000 ALTER TABLE `segusuariorol` DISABLE KEYS */;
INSERT INTO `segusuariorol` VALUES (1,1,'1',1,'2023-10-01 06:00:00',NULL);
/*!40000 ALTER TABLE `segusuariorol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `idsubcategoria` int NOT NULL AUTO_INCREMENT,
  `descripcionsubcategoria` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `idcategoria` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idsubcategoria`),
  KEY `fk_subcategoria_categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_subcategoria_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
INSERT INTO `subcategoria` VALUES (1,'Llaves',1,'2023-10-13 23:43:44','2023-10-13 23:43:44');
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipotransaccion` (
  `idtipotransaccion` int NOT NULL AUTO_INCREMENT,
  `descripciontipotransaccion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `sumaresta` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idtipotransaccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotransaccion`
--

LOCK TABLES `tipotransaccion` WRITE;
/*!40000 ALTER TABLE `tipotransaccion` DISABLE KEYS */;
INSERT INTO `tipotransaccion` VALUES (1,'Ingresada',NULL,'2023-10-14 02:20:48','2023-10-14 02:20:48');
/*!40000 ALTER TABLE `tipotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `idtransaccion` int NOT NULL AUTO_INCREMENT,
  `iddepartamento` int NOT NULL,
  `idtipotransaccion` int NOT NULL,
  `idempleado` int NOT NULL,
  `idproveedor` int DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL DEFAULT '0',
  `idestadotransaccion` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idtransaccion`),
  KEY `fk_transaccion_proveedor1_idx` (`idproveedor`),
  KEY `fk_transaccion_tipotransaccion1_idx` (`idtipotransaccion`),
  KEY `fk_transaccion_estadotransaccion1_idx` (`idestadotransaccion`),
  KEY `fk_transaccion_cliente1_idx` (`idcliente`),
  KEY `fk_transaccion_empleado1_idx` (`idempleado`),
  KEY `fk_transaccion_departamento1_idx` (`iddepartamento`),
  CONSTRAINT `fk_transaccion_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_transaccion_departamento1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`),
  CONSTRAINT `fk_transaccion_empleado1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`),
  CONSTRAINT `fk_transaccion_estadotransaccion1` FOREIGN KEY (`idestadotransaccion`) REFERENCES `estadotransaccion` (`idestadotransaccion`),
  CONSTRAINT `fk_transaccion_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`),
  CONSTRAINT `fk_transaccion_tipotransaccion1` FOREIGN KEY (`idtipotransaccion`) REFERENCES `tipotransaccion` (`idtipotransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  `idempleado` int DEFAULT NULL,
  `estado` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'brayan@gmail.com','brayan@gmail.com','2023-10-01 06:00:00','$2y$10$8biTHtYIoVgwxEadyuDW1.pGMfhcZLSevCT7k21g/wA93nrPujQLS',NULL,'2023-10-01 06:00:00',NULL,1,1,'1'),(2,'juanperez@gmail.com','juanperez@gmail.com',NULL,'$2y$10$lrsn6r6Ivi3xa4cirvCBheTP1S2sfcG3dj1cG9aGSGm8q7nm05wMy',NULL,'2023-10-14 00:19:19','2023-10-14 00:19:19',1,2,'1'),(5,'juanperez1@gmail.com','juanperez1@gmail.com',NULL,'$2y$10$0SyhGI2J84/NB7/g7YOoFu8sr78RAXd9VTgRGVD6kcvYYFt66tcA.',NULL,'2023-10-14 00:23:37','2023-10-14 00:24:50',2,2,'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-13 20:43:04
