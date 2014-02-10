CREATE DATABASE  IF NOT EXISTS `condominiosiaco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `condominiosiaco`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: condominiosiaco
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `foto` longblob NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion_alternativa` varchar(255) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_culminacion` date NOT NULL,
  `sueldo` float NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_88` (`usuario_id`),
  KEY `fk_relationship_92` (`condominio_id`),
  CONSTRAINT `fk_relationship_92` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_inheritance_3` FOREIGN KEY (`id`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_relationship_88` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_comunes`
--

DROP TABLE IF EXISTS `areas_comunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas_comunes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `costo` float NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_20` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_comunes`
--

LOCK TABLES `areas_comunes` WRITE;
/*!40000 ALTER TABLE `areas_comunes` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas_comunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asambleas_de_juntas_de_condominios`
--

DROP TABLE IF EXISTS `asambleas_de_juntas_de_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asambleas_de_juntas_de_condominios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `lugar` varchar(60) DEFAULT NULL,
  `puntos_tratar` varchar(60) NOT NULL,
  `acuerdos` varchar(255) NOT NULL,
  `archivo_adjunto` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asambleas_de_juntas_de_condominios`
--

LOCK TABLES `asambleas_de_juntas_de_condominios` WRITE;
/*!40000 ALTER TABLE `asambleas_de_juntas_de_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `asambleas_de_juntas_de_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caraceristicas_tipos_inmuebles`
--

DROP TABLE IF EXISTS `caraceristicas_tipos_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caraceristicas_tipos_inmuebles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_50` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caraceristicas_tipos_inmuebles`
--

LOCK TABLES `caraceristicas_tipos_inmuebles` WRITE;
/*!40000 ALTER TABLE `caraceristicas_tipos_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `caraceristicas_tipos_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas_por_tipos_inmuebles`
--

DROP TABLE IF EXISTS `caracteristicas_por_tipos_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas_por_tipos_inmuebles` (
  `id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`,`caracteristica_id`),
  KEY `fk_relationship_4` (`caracteristica_id`),
  CONSTRAINT `fk_relationship_5` FOREIGN KEY (`id`) REFERENCES `tipos_inmuebles` (`id`),
  CONSTRAINT `fk_relationship_4` FOREIGN KEY (`caracteristica_id`) REFERENCES `caraceristicas_tipos_inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas_por_tipos_inmuebles`
--

LOCK TABLES `caracteristicas_por_tipos_inmuebles` WRITE;
/*!40000 ALTER TABLE `caracteristicas_por_tipos_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas_por_tipos_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_juntas_condominios`
--

DROP TABLE IF EXISTS `cargos_juntas_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_juntas_condominios` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_juntas_condominios`
--

LOCK TABLES `cargos_juntas_condominios` WRITE;
/*!40000 ALTER TABLE `cargos_juntas_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos_juntas_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_por_juntas_de_condominios`
--

DROP TABLE IF EXISTS `cargos_por_juntas_de_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_por_juntas_de_condominios` (
  `usuario_id` int(11) NOT NULL,
  `junta_condominio_id` int(11) NOT NULL,
  `cargo_junta_condominio_id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`usuario_id`,`propietario_id`,`junta_condominio_id`,`cargo_junta_condominio_id`),
  KEY `fk_relationship_77` (`cargo_junta_condominio_id`),
  KEY `fk_relationship_78` (`junta_condominio_id`),
  KEY `fk_relationship_89` (`propietario_id`),
  CONSTRAINT `fk_relationship_90` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_relationship_77` FOREIGN KEY (`cargo_junta_condominio_id`) REFERENCES `cargos_juntas_condominios` (`id`),
  CONSTRAINT `fk_relationship_78` FOREIGN KEY (`junta_condominio_id`) REFERENCES `juntas_de_condominios` (`id`),
  CONSTRAINT `fk_relationship_89` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_por_juntas_de_condominios`
--

LOCK TABLES `cargos_por_juntas_de_condominios` WRITE;
/*!40000 ALTER TABLE `cargos_por_juntas_de_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos_por_juntas_de_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carteleras`
--

DROP TABLE IF EXISTS `carteleras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carteleras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `archivo_adjunto` longblob NOT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_63` (`usuario_id`),
  CONSTRAINT `fk_relationship_63` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_relationship_62` FOREIGN KEY (`id`) REFERENCES `tipos_publicaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carteleras`
--

LOCK TABLES `carteleras` WRITE;
/*!40000 ALTER TABLE `carteleras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carteleras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condominios`
--

DROP TABLE IF EXISTS `condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condominios` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `rif_condominio` varchar(20) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominios`
--

LOCK TABLES `condominios` WRITE;
/*!40000 ALTER TABLE `condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `producto_id` varchar(20) DEFAULT NULL,
  `fecha` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_32` (`producto_id`),
  CONSTRAINT `fk_relationship_32` FOREIGN KEY (`producto_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_egresos`
--

DROP TABLE IF EXISTS `detalles_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_egresos` (
  `factura_id` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`factura_id`),
  CONSTRAINT `fk_relationship_68` FOREIGN KEY (`factura_id`) REFERENCES `facturas_egresos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_egresos`
--

LOCK TABLES `detalles_egresos` WRITE;
/*!40000 ALTER TABLE `detalles_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_facturas`
--

DROP TABLE IF EXISTS `detalles_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_facturas` (
  `factura_id` int(11) NOT NULL,
  `servicios_comunes_id` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`servicios_comunes_id`,`factura_id`),
  KEY `fk_relationship_57` (`factura_id`),
  CONSTRAINT `fk_relationship_58` FOREIGN KEY (`servicios_comunes_id`) REFERENCES `servicios_comunes` (`id`),
  CONSTRAINT `fk_relationship_57` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_facturas`
--

LOCK TABLES `detalles_facturas` WRITE;
/*!40000 ALTER TABLE `detalles_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `factura_egreso_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_67` (`factura_egreso_id`),
  CONSTRAINT `fk_relationship_70` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_relationship_67` FOREIGN KEY (`factura_egreso_id`) REFERENCES `facturas_egresos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `direccion_alternativa` varchar(255) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `cedula` varchar(10) NOT NULL,
  `foto` longblob NOT NULL,
  `empleado_id` varchar(10) DEFAULT NULL,
  `tipo_empleado_id` int(11) DEFAULT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `numero_hijos` int(11) DEFAULT NULL,
  `inicio_jornada` time DEFAULT NULL,
  `fin_jornada` time DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_2` (`tipo_empleado_id`),
  CONSTRAINT `fk_relationship_2` FOREIGN KEY (`tipo_empleado_id`) REFERENCES `tipos_empleados` (`id`),
  CONSTRAINT `fk_inheritance_1` FOREIGN KEY (`id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sub_total` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_56` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_egresos`
--

DROP TABLE IF EXISTS `facturas_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas_egresos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sub_total` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_egresos`
--

LOCK TABLES `facturas_egresos` WRITE;
/*!40000 ALTER TABLE `facturas_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_extras`
--

DROP TABLE IF EXISTS `gastos_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos_extras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_gastos_id` int(11) DEFAULT NULL,
  `inmueble_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_71` (`inmueble_id`),
  KEY `fk_relationship_72` (`tipo_gastos_id`),
  CONSTRAINT `fk_relationship_72` FOREIGN KEY (`tipo_gastos_id`) REFERENCES `tipos_gastos_extras` (`id`),
  CONSTRAINT `fk_relationship_71` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_extras`
--

LOCK TABLES `gastos_extras` WRITE;
/*!40000 ALTER TABLE `gastos_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_65` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `alicuota` float NOT NULL,
  `numero_apartamento` varchar(4) DEFAULT NULL,
  `propietario_id` int(11) DEFAULT NULL,
  `estado_solvencia` varchar(10) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_48` (`propietario_id`),
  CONSTRAINT `fk_relationship_9` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_relationship_48` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaces`
--

DROP TABLE IF EXISTS `interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfaces` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaces`
--

LOCK TABLES `interfaces` WRITE;
/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
INSERT INTO `interfaces` VALUES (1,'ActualizarPropietario','ActualizarPropietario','A'),(2,'Administrador','Administrador','A'),(4,'AreaComun','Area Comun','A'),(6,'Condominio','Condominio','A'),(7,'Empleados','Empleados','A'),(8,'Factura','Factura','A'),(9,'Inmueble','Inmueble','A'),(11,'Licencia','Licencia','A'),(12,'Login','Login','A'),(13,'Novedad','Novedad','A'),(14,'Pagarcondominio','Pagarcondominio.','A'),(15,'Pagoempleado','Pagoempleado','A'),(19,'Reservacion','Reservacion','A'),(20,'Sancion','Sancion','A'),(21,'ServicioComun','ServicioComun','A'),(22,'Sugerencia','Sugerencia','A'),(23,'MisionVision','Mision y Vision','A'),(24,'Noticia','Noticia','A'),(25,'Cartelera','Cartelera','A');
/*!40000 ALTER TABLE `interfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaces_por_roles`
--

DROP TABLE IF EXISTS `interfaces_por_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfaces_por_roles` (
  `rol__id` int(11) NOT NULL,
  `interfaces_id` int(11) NOT NULL,
  `vinculo` varchar(60) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`rol__id`,`interfaces_id`),
  KEY `fk_relationship_93` (`interfaces_id`),
  CONSTRAINT `fk_relationship_94` FOREIGN KEY (`rol__id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_relationship_93` FOREIGN KEY (`interfaces_id`) REFERENCES `interfaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaces_por_roles`
--

LOCK TABLES `interfaces_por_roles` WRITE;
/*!40000 ALTER TABLE `interfaces_por_roles` DISABLE KEYS */;
INSERT INTO `interfaces_por_roles` VALUES (1,1,'actualizarpropietarioview','A'),(1,2,'administradorview','A'),(1,4,'areacomunview','A'),(1,6,'condominioView','A'),(1,7,'empleadosview','A'),(1,8,'facturaview','A'),(1,9,'inmuebleview','A'),(1,11,'licenciaView','A'),(1,12,'loginView','A'),(1,13,'novedadview','A'),(1,15,'pagoempleadoview','A'),(1,20,'sancionview','A'),(1,21,'serviciocomunView','A'),(1,23,'visionView','A'),(1,24,'noticiaView','A'),(2,14,'pagarcondominioview','A'),(2,19,'reservacionview','A'),(2,22,'sugerenciaview','A');
/*!40000 ALTER TABLE `interfaces_por_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juntas_de_condominios`
--

DROP TABLE IF EXISTS `juntas_de_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juntas_de_condominios` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_66` (`condominio_id`),
  CONSTRAINT `fk_relationship_66` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juntas_de_condominios`
--

LOCK TABLES `juntas_de_condominios` WRITE;
/*!40000 ALTER TABLE `juntas_de_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `juntas_de_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `estado_solvencia` varchar(60) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones_por_roles`
--

DROP TABLE IF EXISTS `notificaciones_por_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones_por_roles` (
  `rol_id` int(11) NOT NULL,
  `notificacion_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`rol_id`,`notificacion_id`),
  KEY `fk_relationship_105` (`notificacion_id`),
  CONSTRAINT `fk_relationship_105` FOREIGN KEY (`notificacion_id`) REFERENCES `notificaciones` (`id`),
  CONSTRAINT `fk_relationship_104` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones_por_roles`
--

LOCK TABLES `notificaciones_por_roles` WRITE;
/*!40000 ALTER TABLE `notificaciones_por_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones_por_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedades`
--

DROP TABLE IF EXISTS `novedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novedades` (
  `id` int(11) NOT NULL,
  `cedula` char(8) NOT NULL,
  `nombre` char(60) NOT NULL,
  `apellido` char(60) NOT NULL,
  `placa_vehiculo` char(10) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `entrada` date NOT NULL,
  `salida` date NOT NULL,
  `inmueble_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `publicar_cartelera` char(1) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_53` (`inmueble_id`),
  CONSTRAINT `fk_relationship_79` FOREIGN KEY (`id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `fk_relationship_53` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedades`
--

LOCK TABLES `novedades` WRITE;
/*!40000 ALTER TABLE `novedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `novedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion_alternativa` varchar(255) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `foto` longblob NOT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `direccion_alternativa` varchar(255) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `cedula` varchar(10) NOT NULL,
  `foto` longblob NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_64` (`condominio_id`),
  CONSTRAINT `fk_relationship_64` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_inheritance_2` FOREIGN KEY (`id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios_por_asamblea`
--

DROP TABLE IF EXISTS `propietarios_por_asamblea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietarios_por_asamblea` (
  `propietario_id` int(10) NOT NULL AUTO_INCREMENT,
  `asamblea_de_junta_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`propietario_id`,`asamblea_de_junta_id`),
  KEY `fk_relationship_46` (`asamblea_de_junta_id`),
  CONSTRAINT `fk_relationship_46` FOREIGN KEY (`asamblea_de_junta_id`) REFERENCES `asambleas_de_juntas_de_condominios` (`id`),
  CONSTRAINT `fk_relationship_45` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios_por_asamblea`
--

LOCK TABLES `propietarios_por_asamblea` WRITE;
/*!40000 ALTER TABLE `propietarios_por_asamblea` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietarios_por_asamblea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` varchar(20) NOT NULL,
  `con_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_31` (`con_id`),
  CONSTRAINT `fk_relationship_31` FOREIGN KEY (`con_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibos_condominios`
--

DROP TABLE IF EXISTS `recibos_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibos_condominios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `facturas_id` int(11) DEFAULT NULL,
  `inmueble_id` int(11) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_59` (`inmueble_id`),
  KEY `fk_relationship_60` (`facturas_id`),
  CONSTRAINT `fk_relationship_60` FOREIGN KEY (`facturas_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `fk_relationship_59` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos_condominios`
--

LOCK TABLES `recibos_condominios` WRITE;
/*!40000 ALTER TABLE `recibos_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibos_gastos_extras`
--

DROP TABLE IF EXISTS `recibos_gastos_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibos_gastos_extras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gastos_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_74` (`gastos_id`),
  CONSTRAINT `fk_relationship_74` FOREIGN KEY (`gastos_id`) REFERENCES `gastos_extras` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos_gastos_extras`
--

LOCK TABLES `recibos_gastos_extras` WRITE;
/*!40000 ALTER TABLE `recibos_gastos_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos_gastos_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inmueble_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `fecha_reservacion` date NOT NULL,
  `fecha_uso` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `lista_invitados` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_18` (`inmueble_id`),
  KEY `fk_relationship_19` (`area_id`),
  CONSTRAINT `fk_relationship_19` FOREIGN KEY (`area_id`) REFERENCES `areas_comunes` (`id`),
  CONSTRAINT `fk_relationship_18` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','hola','A'),(2,'propi','propi','A');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanciones`
--

DROP TABLE IF EXISTS `sanciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inmueble_id` int(11) DEFAULT NULL,
  `tipo_sanciones_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_realizacion` date NOT NULL,
  `condicion` char(1) NOT NULL,
  `estado_solvencia` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_15` (`inmueble_id`),
  KEY `fk_relationship_16` (`tipo_sanciones_id`),
  CONSTRAINT `fk_relationship_16` FOREIGN KEY (`tipo_sanciones_id`) REFERENCES `tipo_sanciones` (`id`),
  CONSTRAINT `fk_relationship_15` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanciones`
--

LOCK TABLES `sanciones` WRITE;
/*!40000 ALTER TABLE `sanciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_comunes`
--

DROP TABLE IF EXISTS `servicios_comunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios_comunes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_servicios_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `recibo` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_55` (`tipo_servicios_id`),
  CONSTRAINT `fk_relationship_55` FOREIGN KEY (`tipo_servicios_id`) REFERENCES `tipos_servicios_comunes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_comunes`
--

LOCK TABLES `servicios_comunes` WRITE;
/*!40000 ALTER TABLE `servicios_comunes` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios_comunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soportes_de_recibos_pagos`
--

DROP TABLE IF EXISTS `soportes_de_recibos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soportes_de_recibos_pagos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recibos_condominio_id` int(11) DEFAULT NULL,
  `recibos_reservacion_id` int(11) DEFAULT NULL,
  `descripcion` char(255) NOT NULL,
  `banco` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `validar_pago` char(1) NOT NULL,
  `comprobante` longblob NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_61` (`recibos_reservacion_id`),
  KEY `fk_relationship_75` (`recibos_condominio_id`),
  CONSTRAINT `fk_relationship_75` FOREIGN KEY (`recibos_condominio_id`) REFERENCES `recibos_gastos_extras` (`id`),
  CONSTRAINT `fk_relationship_61` FOREIGN KEY (`recibos_reservacion_id`) REFERENCES `recibos_condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soportes_de_recibos_pagos`
--

LOCK TABLES `soportes_de_recibos_pagos` WRITE;
/*!40000 ALTER TABLE `soportes_de_recibos_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `soportes_de_recibos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sanciones`
--

DROP TABLE IF EXISTS `tipo_sanciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_sanciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `penalizacion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_17` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sanciones`
--

LOCK TABLES `tipo_sanciones` WRITE;
/*!40000 ALTER TABLE `tipo_sanciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_sanciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_empleados`
--

DROP TABLE IF EXISTS `tipos_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_empleados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `sueldo_base` float NOT NULL,
  `porcentaje_prima_hijos` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_12` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_empleados`
--

LOCK TABLES `tipos_empleados` WRITE;
/*!40000 ALTER TABLE `tipos_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_gastos_extras`
--

DROP TABLE IF EXISTS `tipos_gastos_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_gastos_extras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_73` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_gastos_extras`
--

LOCK TABLES `tipos_gastos_extras` WRITE;
/*!40000 ALTER TABLE `tipos_gastos_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_gastos_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_inmuebles`
--

DROP TABLE IF EXISTS `tipos_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_inmuebles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_49` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_inmuebles`
--

LOCK TABLES `tipos_inmuebles` WRITE;
/*!40000 ALTER TABLE `tipos_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pagos`
--

DROP TABLE IF EXISTS `tipos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_pagos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estatus` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_102` FOREIGN KEY (`id`) REFERENCES `soportes_de_recibos_pagos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pagos`
--

LOCK TABLES `tipos_pagos` WRITE;
/*!40000 ALTER TABLE `tipos_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_publicaciones`
--

DROP TABLE IF EXISTS `tipos_publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_publicaciones` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_publicaciones`
--

LOCK TABLES `tipos_publicaciones` WRITE;
/*!40000 ALTER TABLE `tipos_publicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_servicios_comunes`
--

DROP TABLE IF EXISTS `tipos_servicios_comunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_servicios_comunes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` char(60) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_relationship_54` FOREIGN KEY (`id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_servicios_comunes`
--

LOCK TABLES `tipos_servicios_comunes` WRITE;
/*!40000 ALTER TABLE `tipos_servicios_comunes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_servicios_comunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `propietario_id` int(11) NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_86` (`propietario_id`),
  CONSTRAINT `fk_relationship_91` FOREIGN KEY (`id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_relationship_86` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-10 17:53:48
