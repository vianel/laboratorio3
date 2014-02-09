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
-- Table structure for table `ADMINISTRADORES`
--

DROP TABLE IF EXISTS `ADMINISTRADORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMINISTRADORES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CEDULA` varchar(10) NOT NULL,
  `FOTO` longblob NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  `RIF_CONDOMINIO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `APELLIDO` varchar(60) NOT NULL,
  `DIRECCION_ALTERNATIVA` varchar(255) NOT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) NOT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `ESTADO_CIVIL` char(1) DEFAULT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `FECHA_CULMINACION` date NOT NULL,
  `SUELDO` float NOT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_88` (`USUARIO_ID`),
  KEY `FK_RELATIONSHIP_92` (`RIF_CONDOMINIO`),
  CONSTRAINT `FK_INHERITANCE_3` FOREIGN KEY (`ID`) REFERENCES `PERSONAS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_88` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_92` FOREIGN KEY (`RIF_CONDOMINIO`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMINISTRADORES`
--

LOCK TABLES `ADMINISTRADORES` WRITE;
/*!40000 ALTER TABLE `ADMINISTRADORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMINISTRADORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AGENDAS`
--

DROP TABLE IF EXISTS `AGENDAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENDAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `JUNTA_CONDOMINIO_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA` date NOT NULL,
  `HORA` time NOT NULL,
  `LUGAR` varchar(60) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_76` (`JUNTA_CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_76` FOREIGN KEY (`JUNTA_CONDOMINIO_ID`) REFERENCES `JUNTAS_DE_CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENDAS`
--

LOCK TABLES `AGENDAS` WRITE;
/*!40000 ALTER TABLE `AGENDAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AGENDAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AREAS_COMUNES`
--

DROP TABLE IF EXISTS `AREAS_COMUNES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AREAS_COMUNES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `COSTO` float NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_20` (`CONDOMINIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AREAS_COMUNES`
--

LOCK TABLES `AREAS_COMUNES` WRITE;
/*!40000 ALTER TABLE `AREAS_COMUNES` DISABLE KEYS */;
INSERT INTO `AREAS_COMUNES` VALUES (1,1,'Piscina','Area para pisciniear',200,'A');
/*!40000 ALTER TABLE `AREAS_COMUNES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS`
--

DROP TABLE IF EXISTS `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FECHA` date NOT NULL,
  `PUNTOS_TRATAR` varchar(60) NOT NULL,
  `LUGAR` varchar(60) DEFAULT NULL,
  `ACUERDOS` varchar(255) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS`
--

LOCK TABLES `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BANCOS_EMPRESAS`
--

DROP TABLE IF EXISTS `BANCOS_EMPRESAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BANCOS_EMPRESAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BANCOS_EMPRESAS`
--

LOCK TABLES `BANCOS_EMPRESAS` WRITE;
/*!40000 ALTER TABLE `BANCOS_EMPRESAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BANCOS_EMPRESAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARACERISTICAS_TIPOS_INMUEBLES`
--

DROP TABLE IF EXISTS `CARACERISTICAS_TIPOS_INMUEBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARACERISTICAS_TIPOS_INMUEBLES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_50` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_50` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARACERISTICAS_TIPOS_INMUEBLES`
--

LOCK TABLES `CARACERISTICAS_TIPOS_INMUEBLES` WRITE;
/*!40000 ALTER TABLE `CARACERISTICAS_TIPOS_INMUEBLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARACERISTICAS_TIPOS_INMUEBLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARACTERISTICAS_POR_TIPOS_INMUEBLES`
--

DROP TABLE IF EXISTS `CARACTERISTICAS_POR_TIPOS_INMUEBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARACTERISTICAS_POR_TIPOS_INMUEBLES` (
  `ID` int(11) NOT NULL,
  `CARACTERISTICA_ID` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`,`CARACTERISTICA_ID`),
  KEY `FK_RELATIONSHIP_4` (`CARACTERISTICA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`CARACTERISTICA_ID`) REFERENCES `CARACERISTICAS_TIPOS_INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID`) REFERENCES `TIPOS_INMUEBLES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARACTERISTICAS_POR_TIPOS_INMUEBLES`
--

LOCK TABLES `CARACTERISTICAS_POR_TIPOS_INMUEBLES` WRITE;
/*!40000 ALTER TABLE `CARACTERISTICAS_POR_TIPOS_INMUEBLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARACTERISTICAS_POR_TIPOS_INMUEBLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARGOS_JUNTAS_CONDOMINIOS`
--

DROP TABLE IF EXISTS `CARGOS_JUNTAS_CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARGOS_JUNTAS_CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARGOS_JUNTAS_CONDOMINIOS`
--

LOCK TABLES `CARGOS_JUNTAS_CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `CARGOS_JUNTAS_CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARGOS_JUNTAS_CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARGOS_POR_JUNTAS_DE_CONDOMINIOS`
--

DROP TABLE IF EXISTS `CARGOS_POR_JUNTAS_DE_CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARGOS_POR_JUNTAS_DE_CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `JUNTA_CONDOMINIO_ID` int(11) NOT NULL,
  `CARGO_ID` int(11) NOT NULL,
  `USUARIO_ID` int(11) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_77` (`CARGO_ID`),
  KEY `FK_RELATIONSHIP_78` (`JUNTA_CONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_90` (`USUARIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_77` FOREIGN KEY (`CARGO_ID`) REFERENCES `CARGOS_JUNTAS_CONDOMINIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_78` FOREIGN KEY (`JUNTA_CONDOMINIO_ID`) REFERENCES `JUNTAS_DE_CONDOMINIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_89` FOREIGN KEY (`ID`) REFERENCES `PROPIETARIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_90` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARGOS_POR_JUNTAS_DE_CONDOMINIOS`
--

LOCK TABLES `CARGOS_POR_JUNTAS_DE_CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `CARGOS_POR_JUNTAS_DE_CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARGOS_POR_JUNTAS_DE_CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARTELERAS`
--

DROP TABLE IF EXISTS `CARTELERAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARTELERAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `USUARIOS_ID` varchar(10) DEFAULT NULL,
  `TIPO_USUARIO_ID` varchar(10) DEFAULT NULL,
  `FOTO` longblob,
  `STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARTELERAS`
--

LOCK TABLES `CARTELERAS` WRITE;
/*!40000 ALTER TABLE `CARTELERAS` DISABLE KEYS */;
INSERT INTO `CARTELERAS` VALUES (1,'Aparte para mi babyshower','2013-03-05','1','propietari','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�>a�\0\0 \0IDATx��y�d�}���e����s�c����ł @<E����������#)�a�����?�,۠��$زD�9QaR�L\"B4�Xp�8v��sv�tw]������|���gw��wg{��7���ի��}�w�/EU9Z?��C��H��\0𨪞N\0�<�5�M�9��~/��ҍk=���C�oEz����|�Ře�A�?\0 ̈��/\0�|���7?፣�+\02�Ox��^�dv��\r(�}����A=4M�k\Z�y�w�kD�x��w��Q��!�+��l�۟wx�v��~�;�E仇+ˬ_giu���G��{�����)�t��5�U4e�w\r���\0c@lnԹ�:׼W�~��ED�P��|��v������c�\'�s��s,[\'/\nhj�t2a:�P�%�9Ă��`@�RquuA�Š���\Z6/P����Ó흿���Ě���鯾Kz�\0����������N�;��s���1�3Oq���=�^�w�44UE3�c\0P�x�\0��\0�X���v�$�9��\\�#7.]�]��gĘ�ݳ_~�t����s�/�:���{��pmA0Y�d<cww�\"�W���k\Z\\��T%�@PU4��\0U%8J@�<��!+��kgN���ů�_uY�g���rJG\0��;��<q�x�=� /r������\Z1+VN���!Fp�QU\ruYS�ʠ�=x��M����~#��`���P�P�dE\Z\0d�������\Z��s���b��|�{HG\0�9�z�#���x\'�Zl\0��1�7��\'Op��2`�ڭظ1�����h����7S[�X�D����\"\'�s\\U3��b��I�~����,Y>q����^�����-��1�7���!U\0<��g/�߻��$�2�^N�lnM������滟<��r����-���&e�[Y���1�콽���\nF�\r���s}1Bv�@���j6^~���JQN���{ZD^|����d��89�>�zb��\'��]��EF��3��\\x�8�՟~7?���y���a�#�<pz�^���0�E�Oou��գ�AD�^�zp�4dE�ұUF[[LwG������1��C����>���{96wJG\0��c6�~�o{��p�XK1�S7���?�Ï�GW�S7���1-M�[K�{��u>���qt�����5�i1��ؽ���g��lw̃�y\'�X�?�K��~�;��7yXLG\r\0�;��>|��gO�9�eV:��x�w?�~ӛ��<�+/���[RUM��9��Q����K(M���\r�Xe��N=|?�PN��<��;���=_2���X��}�}�<��1�ݛT�E���\0ߙ����_���o��Ww�ٙRNK���)+�����Q׸��{���+��tpM�hs�e;��^��MSSM���;�����{���<<�#ez���ɇ��_^j�2�T��賱S�o����g�T��WJ�ya��.�9b:�PMK�YISVԳ2eIS��U���Q8�0����YQ�[\Z�7._a�u��uj�ްϱ��1�����?y�G����\0@Uߓ�����;�v�̦M�P7�W�M�5�g3�ڱ=��ٞ2\ZM��&���tB=�RMgԳM�Ys>7�o�ֈ�^/D�\Z1���*�W7(��0�#\"��8N^��wνGD�zS���\0���p��Z��p���s�ɸ���lZ��9bw\\\"b��SU5�,��zZREƗ�)�tB5�EP�h���>W�kC4���\'!d��ɍ���.��%P�f���r1ں�o���-���\Z;6wTe�xw�-zT��yfւкnMU�⾚ͨ&��T�)uY�W\\U�б��!��f�ɍ]���7��W�_Yf���b��<�𖣣\0Փ�����è�s�����ɔ\\T[���G����*�YIU���\0�r:�Oi�n�*�9�T�B�k�&S���XbȊ>R����,p�\r�C�#\0�\'�8n󂺬Q�ԔUE5���o\Z�f���q�Rҧj��j:���(�S�ۘ��_Dc,��n D\r�S��cՀ�ɰyoMD���7d`��\0T�]�zF��*>�z�Ʉ�l��[e1��m����U���皃Uw�W�ƃ�`A�`�,����{��@�>��7pW��P��xMU��x&�M]��Z� ��G�npUM]V4eISU�Vk�@�|�q��X�h�Vvx��#����������\0��c3\\�x��U����`�\r3E�v$@CSW�Vn��~�����\0j��j��1����;\n����y�G���H\0@DN�BS5!9�=�tLwG��dy;�\0B�F��߮�w��f�I�c�`Lxl���� �M�`�BI�\Zo\0\"1n�B.?�wU�����ݝ�n����g�l�1y`��\0�P;�\0�\0�\0  ����o	\0\0Ѫ<��:�\\����]1y��6����(&�R�̥�)�<�\0\n������=�G	��\Zs�Ab06��H���\0\"&�f�Jɒ ��y��~8:\0P�ބ��j(�8L�H�#&��o�`\0�,H�4�;�@2�lj�#���[R�]�`L�J��Z����}�\0��D/��]0�ڪ#�^+�pO�H\0\0x޻�4�\0h(�:\n�8Gl�}GD�٣\n��\Z������S��\\W\\\"	\0<��k(��a�� Y�2|��E�V��,�����\n�\\̫�_:�o��ё\0\0\"_��f޹>��1�#���o�s����|����u\rbI\n�n�<��A�CG\0�z��}s�V�ȁ�<b3���b~/� �1H�$i���]�P���v�q�tT\00}V�?f�\r�{ ���\\���������=`�*�� L�����R 䌧�3�9�MG\0�C���\0���A�$�tD��L����P$1\0�\ZkcL �lW�_��\rpH�,�!��J\0Y`tL��1y���Dm�G\"tb��\n�H�H���(2%\0|<��z����*Ƅ\0��b�gn���7�c0ڮ1�u\r㪣�S�9�����Q�3�:t9=q�Cۉ�f����EI�z{]�y�(��3�\n�ļ��i����y �h�\Z�e��*�A0HĴ�6��E�m�a�iE�>B�0�\ZLb~|��i����[��\0j�	\0�5��J��Y�;���ßg���� 2\\2����\0����	\Z�\n6@l�<�g�+o��=%\0\0|1t�����,�B]�Z���C����#��>{��\'��M��ܐ��Y�4Jj��\Z\ZkC�\0I*@.?\r�,��Q�������5s���@����N�54��r<f6�0�Η�G�/f�R1�\\�ƜMFa�yn�d]�6jk%�p4�G5\0<���S\'Ή1\\���Lwv�yF�+Ȋ�\'��T�xJ]�h�7_}������sPd�} 6�d���6I�,H�8	�%��t�\0p����+�ؾz\r�e���j�2��d�^\0D��k<�w5���P�<�bmlߚ��g1������PÖz�|��v�\0�����T�k���]ҝ��F\r���G>X��^A7um���/r0F��	�ckҬl&sU�CP\0U�ò{o�����@���ӝ�/�^��õUL��·U@e��s4�C)�=����κ��Z�s���Tn�� M&$Ma�*P	���뱺:z\0�L=�}�7�`��IN_xh�(���dL]68\'x� SȂa� 켸3������K��M��ͽ��^�S�z�n��\0����_k���^hg����q��j�E��,�\n���V\\�\Z,�j;i[!����1&څ��I\Z���D�n�\n�?�7Cs�t���J9(+��zZ�1c�A��o\Z\nk�����mξ�Ի[�%B{���!�ŘxnR0�~c��z�n��T���D�u�����f�;\n˶�AL\\�K|�ϙ4�cO!���Sȉt$C��3�M�H�<\Z\r�H�?!;yC��.`�M:JG\0\0��;�|5�0���fYd��M$\Zz�fk���`Z̙�x$�Kd<�r\"�$�1�\0��㑹#:�\0q���}�jx����K�DB��^K���睧�&̄�5��^F��)Q�f��\0��U���h#t�4�=���3]f\"�)��`��:�g������z}E}\\��&��\0�?�f��/�J�h�I7�j���P������y��>H^�k�#��/�1m���/n._b��in�\'��vѰ���a���H��(�\n;���Nw	���{�J9ھ������\0\0��/l���zV���C�6��<��CH��o֨��ݦ���#\"�=,�3f���*����!&���\\{�4�k_��4�m��տy��{�\0ઈ<�^��կ�ȩ��\n����WT]di��# 	�\Z���F�9��G��)gO��x�k/��������O蒱�����Kϱ��S̶B8��������\0|�z�p�ŗ8v߹��C�����48�a��s�0��=W����O\r��O��>�mciEhf\\9�}���p��\Z�v\0��!�NW�l��*k�Oa{}|+�M;����$��>�\0x/�J9������ۯQn^���\n|}x�?\"B���^��N\0x	��c�����,�<I����U�� ƷLN�_�G�GM`|�\0xOU	gNd����꯳�ɋ����G�-���D�2�\0�`0�6����q��`u{�|`rw֣.����jX������������?I�p�>_��N\0XhĠ1:#�0�)��s�k:�}>�U]�C��ge����糟�,���A����\\�g��������p�z�MUS�f���0����P���Ǔ���,?�\'��ԧ��\'����m*��罥�}���l�}�dWW,-Y?�ʍ�����j04 ��f�kP��L���8���������+��Y(\rTq�Ҿ���\0<��EԳ��E�_��cg�U���3�y\ZZ�7U	V�9�2.>��O��ü��\n���6��O����2���G��N\0X�6e�B4�\\ޠn<��w<q���%���F(z\'O,����y���<u�������3_bi`ArH����:�ޢI�Ѡ#\r�v�~X\'���fЭ�`����)���N��%�_�̙c�?�����,/�+G�ˏ��|�|��W0Z��w!�����P�3|w�jpo�f`��#��#������@ڮ]݊�ƹ�+��\\�2�O���}aOAG�ÕB�hlG�1��� �8b>^�7�#�|8�\0���jL�r��<0:�x\'��mߚ��=`n8�`1G�v!�D�QB���z�KZ�wW�u�\0@Q�Αe�dm~bެѤ��w[�%��7tm��Z���ƌ�\\�w�������_Q�>&&�2��v���t4�����d?l�kߓ��W��<�KG�[g���sG��ә����:NLok�6@�\r���~�V���3�����h��@O�|\01?a���gõ^�|;X�3��-ZҊ�XڭLj�}L�}���4vQ�q.�\n��U��C򵳙�&����ݾ�����)�_>�7��������0�����L�_A�>��U3�yo��|ʼ_K+���ʞ��n�O+	�5m�Z%$�Ɠ�L��3�XFLn��}�k�o�7	��_~���Tx�`	�qু�����E04U�4�z�L�xY�C�f�2���g��S��\nR{zU�������P���f=����\\RW�$�����c`��\Z�;��\Z\0��)��G iKXt��*4c�γ�0�.l�_^��yddX��Ѓ$nQ!�7���>DP�n\\��NZG��U-&8�64+B���U_�}��A>\n����C��[\0O\0?�p�=�:�a¼�h9�E����\'����@���˼����&uD���+&�/S�G�u�1�$&V����t���Q�����D��#򏀏��0�9�K\0�G����u�.[��QDK����z4�L\0��kf�; ��u�Z��e�\"��]O���[�ɔ���ԓQ��>�AP#���QA?w25�	��QW���oʟ��?��� ���3�@�\0Ȁ~ :��Yʜ�,��q}_kѧ��z>�����jw��9K\'��W�x����f�i�W\'��jb|�����;�^��:�݂)�%Q	�6���(C�(b2�{����P��O�k�c�_#�w�ʛd0��\0������=!P��o$f���6x���$R>��\Z	\0���{\\]2���oj�Ng��:ٱ�zws��n�j�!����PMf�r���Wp�,\\$�h�H�M&h�5\"���$m=y�[\n=���%|=3���_����ӈ�M��foK�\0�AU���-vޏ\'�칛6�]k}n��6Ѓ���\ZŮU�u�t{�j2e������,�Xg��P|�f�x��A�\0V����-n��*����Db:RI����[b�Pےs�N�:��\n>�6Q������%�\Z�K�������u�7�9o,\0�oQ�#Ƙ� ����l�7*8�hj�k\\�\\{б���5��a_��3JQ��0��dvc���!+\'�X?���������4��5�hs�����{eWW \Z���j��}��}h,��x�=^0��Z��G�S��*���}���6%n��-ڔ��4\"?��a��\r�����Ho0\\���_Y&���Y�񝧩�YM9-��U�ʍ�;e1�&]����0q�!�M�V}����{�t{�t{��W�X=������\\e��+7®�bd��22W*\n��WPf�ZL�KQ�1m��-D\r�i��Ge�\nL> ���j���|���_!�/��a��\r��~�Z����uVN�d��Joi��(0֠Ni�:2��K�N)�U����2�}kw�0�4�dק%`I�2W7�q�\\�e����l�n�qm��7�G<��H��I���#5�#�!JL0)QJ��B��`�дZ�[���d����G�I���W�\0���f��+\'O�v�,K\'��~�gάbl�d�0\Z͘NJ��l�b�^p��\Z���˿�L��b���n�p��7_�8�6�����0 v�^������=�f	#��IU��3�UK.܇��]X���1\"y�و1��)��u\\9������a���cb�ϯ�<����9�O��G��0Ｐʵ�O>����bsc���4��U��<^�y�noH��b����-\\��Q����)*e����L�<�io\"�̽\0M��.�[��^H��Fcãz0i-�G�#j@�EL?|���V��X����U|9�K���/�-�\0=��//?��}��|�.��C?�$ｸ\n�#g\\9^�:cwTc��7����56�i\Z�yN�\'�);ߛ\'�yk�y]���V&�wn�yR \0��ڤP|��4�\n�\" C��e�.�{�9\0�!�;�R<���)��T�E�P1���2��ºz�g@�Z\Z\0T�O�\"������_^b��\Z�y�������ø���[i�v��O%m��@�i�\'��h(v7iLc.�>�ތ�^�>�_`�S#��@�����y�i�q����\\=�i�/��jb�A��҂%Z��!��X=�l�򏈱��]���\'Tx��	�ǎ��,��!&�ϔ�A�����Oy��	�Y�T�:=MGJ�tt��n]tAҝ�	��S����� �D��\Z|40�s)���sU��yA�\Z�D�bF��-P�(���\ZՍk+�\'.�=(\n\0�O}����O��{GVc�ƕ)���-�;���v�3/�y�Ҙ鸢�B\0�5J�q��䝚��ۻA�=ߔ�YL�v�P�`�\\�w��z��C\0B\\s�����r�h��X�f���Fp����.����.��UK�\r��`��CWU�!r�\0�\'�<\\O&��1@�k���~�PU�L*��٤���TeCU:����<H��)6U�$��y�g��Ix>��6H3����\'��e�_��B֩�麗�W��c�<&74.I׸��\n�MG�� �c� �X��-�K9����o�\r�\0O 27x��SMkFvJY����!S�\rլa6��Mj����%VN��m[Y��b6��*M\ZB��k���\ZM����t<��/�vS3�wK�w��x�׹sfk�tg���D�Ƈ��E��Ѱ`5�k�S\'�[�B�R��w˸����`�5��.kf�U�*��x�7��rT���t��=�4[vv�]\0\0IDAT���若!C��<���vJ����k��{Z�8��FCv0iQY�l��v\r:��������ϯ��&��bĢ�߀xڽ��UT��A���\0��jrq?#�N��\0 �������\n5��N���)M��^YZ��9�I2.�T��%�\'6d\n�\0��\0c:��&;xA�\Z�7�op��v�0�|���5|���������$Ҍ�����{@�\nKR�����~��\rBڀr��xU�����C\\9~R�0=(�	\0�0&�K�lZ��P54�b�h�A��a:�e:�pMr�g|X��F�$��1&���9�B�������x	]@Dp�s����T\0H�(8\"\ZԆӹ������)��a��K�D� �]b~�xA�2J�,���������z8�]lQ�\0X?�!�r�db2��3�8Y��� M��Cز5ks�&Vhk��6h������nkm\\f��z��\nB0 ����tm���Z\r��M�>ї����kH������`bv+\r<b��&Mu�d�P�KͭbfQ�b�e@����K\0\0C����HV b�N(g����۸�Ƙ�j8W5�7شc�a������s�^N�˰y��#\0b*X%F�}\'�h�&�̹��+` 1}�X4�d�G��HG\rtD�FC3J\0U��dҬ����/sO�\rw%�x��U�@�?��$\\�`+�Q�>	�2�� ��d�P�C�b,�EU�{#6�Ia��4loX��(y8zy/i�4{�tt��Ρ>z�)�n�ܗv�N(�u���Y��I�4z^1��I��� Ф��7��I�w%B�*6��U\'&Z�s�/ޠ(����u�#��ڇ�\Z\0\"�bR��\ns>�R=U�U͙����{��h�u&�����I5l�kD���\n7��0F醍_7اD�\'�>m\0�s>E��*�;U?�;��\0p��E�I\Z��T�(��G|�A�Z5�i֛�/��^�B��U_���6�xXĊ��9�]:M��t4�u��,M�qNۙ.�\Z�I�\'A꣸�n8�����^�>�H;6]\0̍6�OH�<�hA���d`>�\n8�p�!�s	=	M0���\\�K�T)�>0��B��#��(��Q��&�!��2s�E����֓\"�����\0\0�Dv4�q����FiXQ�5UgZ+��^�&(1���>}~��%H#t���o���:���kx��\r��&��I-x76��!�\r��t��%��?�3~�|U�`B��V�f��	)=���1��\n��+O��U\0�d9&�&��vݚ�~&��P���������a6%#O���Y˺���s �\n4���x�tߤ\Z�\'�YpC9qFG�(���R�����JSy�Zq�ǹ`p��w$\\�;yJm��^�|W���ͧ/`@�o=;X�w�	�\0������Mޏ;kgw���b��,d���y��2�G: �3�f����m���x��Zu�4�o4nاɠV������΋!�h3 ��Qr��/�\Z���TJ]j��J�^��� 	Y�v��v;��\n�c�;�\n�x��X0��{8�\'pw@�\0�C&��[��n�Ƌ�� �,��*�����Y�&�l�ħ��L������0��p��˨�x���oFG�x��%�E�������pI`)E3M���J5�T�R���7\Z\r�P\'�I�i�}H���X��c)$��mpk_�[p�	��2wi�U:�0Y�W���ˆ�gɊ��AC�՞��Iuo���k�:=%}��:�(y�[��fZ������ε���v�g��E?�ƽ��ʙ��*��\Z|��E\\0⃱���K�|X��S0�U\\5�x���&�+\0�F�6/��u��76�ݼ,���f7��k,��o����]�ݭk�m�4�����s�-\Zw��;�����D���W���깔\'��}|����`iŰ��1��5F/|�l�D���c� 4���\0|k��\r֩w.?�~��ܸ�w���+\0(����1�p��+Y�&��Z�\'ۨ����q�mJ����1C�%�-��i���!&�����R��=_xq����=�\0��Z牶��:o���ZOC�\r��.�\ZQ��ԑ\r����\'_;����bW�1v���gQ=�\'pW\0(��Z:~)��\"Lb��of��|5	V�)p��BS׌�F,v�s\r�]��!���;�;�E�,�%��{���O��4��6.�纶cО���M\rt�H��5��x\Z�i��f|�j�&�\"���;u��M�%X����l�<]~�7\0y�q���� l\n��+4�M��;0B������8�L�pke4i\'��Pyk��6��T�|z�T�����O�nT�u^k]�[\\�z���T��c��lӔu��д�%$�|5e���]{����8q|p���-@ݻ��\Z�|_:0\0���O��{�Eɇ���T���1b{`���@����Ƙ٤+������4�;�]���LhA�\ZTe�}��O��O���[�����^��?��H�M6�C��\0.X�a��fW���ߡ�U�/|/�;<�d���}{?n�\0��[1�� �b��zxW1��%|S��P�dk^��0��g����\'V��r\Z#�1�=F`G��Y�t}�٭��p�@r뙛(1I������^L-�1���0>�.�n]�\n�0/�Kkb���x��?D]�����C�`\r�������T?�M:�Ё1œb��M��+_�WcL�\'������!;%qx[�n�[Y^���uw�j�9���k����=����^&Ƈ��3�_����k���k[T�YP�B�,q}D���\'7;�3����)�x/��	D�Aְ��m�c`^��}�o���b�L�_�h�7B$0V㶋6څ	\0�yEm�پ���ayX:\\�ԍ�q�@;�iZ\'���C�k���yK�&��o���zn>�2��dv�݂Vo���Cp�s��k����n�Cm����K_D���:�]76���]:��ԓ-s�_?֊�n�~�&_b5�������Wn���,k#l�$������ܛ�O�^��wTF�Jׅ��C	{�@��}���S����=�v�l1۝ ��]���ә,���w�idhS�&��מ��}#&��iR��@Ju�o��巼o�o�\"k^{�Y����B	h���I�ƫ�3&�i���3�� Ϋu:/���@��3�ou0�,Iugx�Kh�8���v�G:�Y��+�ㄙ�yHF��]��[Z�jLƍ/��x��\Z��FO��Q�򃪀)ؗ�����y���ʛ\n�NB�m�?&�7��F���\Z�[3v7&���@�4�^��Bw������V��_��{���[�/�U@�ν���w>s�}��W�SϪ��]{������og��	��U�j����E�;Z+x \0�~�^�����?�z���n�sy*6Ø� 7e��پ�*u3�W\'���6Q�՟�uDoW�vu𾀈͝��9??��������.h��I��}y����ld��`A�\r1\rX�`�149�N��/v�ڗѻ��A6\"on��&�\r|2q�N��⧮\rv.|��\'(V�X���x	?��v���+�?I���ߺ21�C�D�\'O�?��t�`>�I��N�.��}˝���	�{��9i���cn\\�\r~�&�D�i�]�:+�ރ�U�(D��w4��Ͷ_yy��ҧ\\=��`>�%�O��.f��\'��l\0π���1�z����K��_����G�������\nbL1 ��l|�7A�~_(h�ET���q��5�򚙻Jq�RuP�d:�n�>����|�}���\\����@����D�ݘr��nx�Rn����^y�f���#cs�l�j���xs�\Z_�TO6��~�90O��2�20��_t���;����\0��(��\\������g�+Yo%�\\{�U���X��;͉w���B&��#9�\Zˆ�UC�(s:��-,�����\Z��xSP\'��s.�R\nt�����f�hc��ס��oµ�Sn���W���s�|i*��7�X��͋ σ}�Y����JՃU��5\0��`�����p������A� �Bu�d+�K��-k���w`{��\"�c�B,򢳐Sh�	 �b�\"v{��p؇�{����so��Rv6\Z�q	���1\r hS2�z��~��W>?U?��7�����A��\r���%B����d�o\0�SCh�����!aK�AZ��$T�Cq����������w�/#+\n�(��,W�^��Y\0�~`�E@,\\�-|�w]w�+Att\r�nlAB��t�LvBBb���f�����}����ʗ���|\r��2���6�K�;��	Ī��W{�K����x���>ǀ��\n�c��|xzup�������Ŭ��@��J��am(�^���\0�&�.0p��0����7۴����ԅY?�AS �5�f�������MF��p\\�._��9ȟ�<A��ќI<OW����-\n�.e����0`�u��8\r�$��?��|xle��K+����0X:u�[Y%��[�ٹ��wg:.��5���Rwv����=\Zq�Q��q�z�*�ݸR��<�=����/n֣+�PnA�*dρ|����� �\'���a�4����G\0\0]\n�\"��&P$0	���)pǠ^�#��|���tꁵ�3.-�:��r���کA6X��`�,�+.�K1���n�u�&2���-�x�����-����S����&�v��^�\Z_{qs�����+�Սw��@���5��fw:7əק���(�9s{a	XN�?�\n�\0������fy��~by�乵���l�:쯝\\\\���)=[r1y&63b2Z��օ�t�w.����]���s�l��٬�쌫��h�qy����v���W_�^�n�x_���.��)���N�aQ�7��X�z;\0`���#���x�h���\\�G�S�9��R�vx���K}�8�����+���������x��2u��\Zo\\�m�Ru3�4S�z��S�m���o�1��3�3�\r��୲ḙ(�^�x� &_���	��z�9�-Ԗ����\\�Iї����!�,?�C�HC��upi�4�����7�M|��&����ma����\0\0\0\0IEND�B`�',NULL),(2,'Aparte la piscina pa hace una rumba pero laaa rumbaaa','2013-03-10','2','Empleado',NULL,NULL);
/*!40000 ALTER TABLE `CARTELERAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPROBANTES_PAGOS_LICENCIAS`
--

DROP TABLE IF EXISTS `COMPROBANTES_PAGOS_LICENCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPROBANTES_PAGOS_LICENCIAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LICENCIA_ID` int(11) DEFAULT NULL,
  `RENOVACIONES_ID` int(11) DEFAULT NULL,
  `BANCO_ID` int(11) DEFAULT NULL,
  `CI_RIF_DEPOSITANTE` varchar(12) NOT NULL,
  `NOMBRE_DEPOSITANTE` varchar(60) DEFAULT NULL,
  `NUMERO_DEPOSITO` varchar(80) NOT NULL,
  `FECHA_DEPOSITO` date NOT NULL,
  `FOTO_COMPROBANTE` longblob NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_83` (`LICENCIA_ID`),
  KEY `FK_RELATIONSHIP_84` (`RENOVACIONES_ID`),
  KEY `FK_RELATIONSHIP_85` (`BANCO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_83` FOREIGN KEY (`LICENCIA_ID`) REFERENCES `LICENCIAS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_84` FOREIGN KEY (`RENOVACIONES_ID`) REFERENCES `RENOVACIONES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_85` FOREIGN KEY (`BANCO_ID`) REFERENCES `BANCOS_EMPRESAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPROBANTES_PAGOS_LICENCIAS`
--

LOCK TABLES `COMPROBANTES_PAGOS_LICENCIAS` WRITE;
/*!40000 ALTER TABLE `COMPROBANTES_PAGOS_LICENCIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPROBANTES_PAGOS_LICENCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONDOMINIOS`
--

DROP TABLE IF EXISTS `CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RIF_CONDOMINIO` varchar(20) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONDOMINIOS`
--

LOCK TABLES `CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COTIZACIONES`
--

DROP TABLE IF EXISTS `COTIZACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COTIZACIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PRODUCTO_ID` varchar(20) DEFAULT NULL,
  `FECHA` date NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_32` (`PRODUCTO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PROVEEDORES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COTIZACIONES`
--

LOCK TABLES `COTIZACIONES` WRITE;
/*!40000 ALTER TABLE `COTIZACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COTIZACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETALLES_EGRESOS`
--

DROP TABLE IF EXISTS `DETALLES_EGRESOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DETALLES_EGRESOS` (
  `PRODUCTOS_ID` int(11) NOT NULL,
  `FACTURA_ID` int(11) NOT NULL,
  `CANTIDAD` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`PRODUCTOS_ID`,`FACTURA_ID`),
  KEY `FK_RELATIONSHIP_68` (`FACTURA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_68` FOREIGN KEY (`FACTURA_ID`) REFERENCES `FACTURAS_EGRESOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_69` FOREIGN KEY (`PRODUCTOS_ID`) REFERENCES `PRODUCTOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETALLES_EGRESOS`
--

LOCK TABLES `DETALLES_EGRESOS` WRITE;
/*!40000 ALTER TABLE `DETALLES_EGRESOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DETALLES_EGRESOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DETALLES_FACTURAS`
--

DROP TABLE IF EXISTS `DETALLES_FACTURAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DETALLES_FACTURAS` (
  `FACTURA_ID` int(11) NOT NULL,
  `SERVICIOS_COMUNES_ID` int(11) NOT NULL,
  `CANTIDAD` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`SERVICIOS_COMUNES_ID`,`FACTURA_ID`),
  KEY `FK_RELATIONSHIP_57` (`FACTURA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_57` FOREIGN KEY (`FACTURA_ID`) REFERENCES `FACTURAS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_58` FOREIGN KEY (`SERVICIOS_COMUNES_ID`) REFERENCES `SERVICIOS_COMUNES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DETALLES_FACTURAS`
--

LOCK TABLES `DETALLES_FACTURAS` WRITE;
/*!40000 ALTER TABLE `DETALLES_FACTURAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DETALLES_FACTURAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EGRESOS`
--

DROP TABLE IF EXISTS `EGRESOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EGRESOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FACTURA_EGRESO_ID` int(11) DEFAULT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_67` (`FACTURA_EGRESO_ID`),
  KEY `FK_RELATIONSHIP_70` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_67` FOREIGN KEY (`FACTURA_EGRESO_ID`) REFERENCES `FACTURAS_EGRESOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_70` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EGRESOS`
--

LOCK TABLES `EGRESOS` WRITE;
/*!40000 ALTER TABLE `EGRESOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EGRESOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADOS`
--

DROP TABLE IF EXISTS `EMPLEADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLEADOS` (
  `ID` int(10) NOT NULL DEFAULT '0',
  `NOMBRE` varchar(60) DEFAULT NULL,
  `APELLIDO` varchar(60) DEFAULT NULL,
  `DIRECCION_ALTERNATIVA` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `ESTADO_CIVIL` char(1) DEFAULT NULL,
  `CEDULA` varchar(10) NOT NULL,
  `FOTO` longblob,
  `EMPLEADO_ID` varchar(10) DEFAULT NULL,
  `TIPO_EMPLEADO_ID` int(11) DEFAULT NULL,
  `CARGO` varchar(60) DEFAULT NULL,
  `FECHA_INGRESO` date DEFAULT NULL,
  `NUMERO_HIJOS` int(11) DEFAULT NULL,
  `INICIO_JORNADA` time DEFAULT NULL,
  `FIN_JORNADA` time DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_2` (`TIPO_EMPLEADO_ID`),
  CONSTRAINT `FK_INHERITANCE_1` FOREIGN KEY (`ID`) REFERENCES `PERSONAS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`TIPO_EMPLEADO_ID`) REFERENCES `TIPOS_EMPLEADOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADOS`
--

LOCK TABLES `EMPLEADOS` WRITE;
/*!40000 ALTER TABLE `EMPLEADOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPLEADOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTACIONAMIENTOS`
--

DROP TABLE IF EXISTS `ESTACIONAMIENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTACIONAMIENTOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NUMERO` varchar(4) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_13` (`INMUEBLE_ID`),
  KEY `FK_RELATIONSHIP_14` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTACIONAMIENTOS`
--

LOCK TABLES `ESTACIONAMIENTOS` WRITE;
/*!40000 ALTER TABLE `ESTACIONAMIENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ESTACIONAMIENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURAS`
--

DROP TABLE IF EXISTS `FACTURAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `SUB_TOTAL` float DEFAULT NULL,
  `IVA` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_56` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_56` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURAS`
--

LOCK TABLES `FACTURAS` WRITE;
/*!40000 ALTER TABLE `FACTURAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FACTURAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURAS_EGRESOS`
--

DROP TABLE IF EXISTS `FACTURAS_EGRESOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FACTURAS_EGRESOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INVENTARIO_ID` int(11) DEFAULT NULL,
  `SUB_TOTAL` float DEFAULT NULL,
  `IVA` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_66` (`INVENTARIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_66` FOREIGN KEY (`INVENTARIO_ID`) REFERENCES `INVENTARIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURAS_EGRESOS`
--

LOCK TABLES `FACTURAS_EGRESOS` WRITE;
/*!40000 ALTER TABLE `FACTURAS_EGRESOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FACTURAS_EGRESOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GASTOS_EXTRAS`
--

DROP TABLE IF EXISTS `GASTOS_EXTRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GASTOS_EXTRAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TIPO_GASTOS_ID` int(11) DEFAULT NULL,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `COSTO` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_71` (`INMUEBLE_ID`),
  KEY `FK_RELATIONSHIP_72` (`TIPO_GASTOS_ID`),
  CONSTRAINT `FK_RELATIONSHIP_71` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_72` FOREIGN KEY (`TIPO_GASTOS_ID`) REFERENCES `TIPOS_GASTOS_EXTRAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GASTOS_EXTRAS`
--

LOCK TABLES `GASTOS_EXTRAS` WRITE;
/*!40000 ALTER TABLE `GASTOS_EXTRAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `GASTOS_EXTRAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INGRESOS`
--

DROP TABLE IF EXISTS `INGRESOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INGRESOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `RECIBO_RESERVACION_ID` int(11) DEFAULT NULL,
  `RECIBO_SANCION_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_65` (`CONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_95` (`RECIBO_RESERVACION_ID`),
  KEY `FK_RELATIONSHIP_98` (`RECIBO_SANCION_ID`),
  CONSTRAINT `FK_RELATIONSHIP_65` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_95` FOREIGN KEY (`RECIBO_RESERVACION_ID`) REFERENCES `RECIBOS_RESERVACIONES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_98` FOREIGN KEY (`RECIBO_SANCION_ID`) REFERENCES `RECIBOS_SANCIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INGRESOS`
--

LOCK TABLES `INGRESOS` WRITE;
/*!40000 ALTER TABLE `INGRESOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `INGRESOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INMUEBLES`
--

DROP TABLE IF EXISTS `INMUEBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INMUEBLES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ALICUOTA` float NOT NULL,
  `NUMERO_APARTAMENTO` varchar(4) DEFAULT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `PROPIETARIO_ID` int(11) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_48` (`PROPIETARIO_ID`),
  KEY `FK_RELATIONSHIP_9` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_48` FOREIGN KEY (`PROPIETARIO_ID`) REFERENCES `PROPIETARIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INMUEBLES`
--

LOCK TABLES `INMUEBLES` WRITE;
/*!40000 ALTER TABLE `INMUEBLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `INMUEBLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTERFACES`
--

DROP TABLE IF EXISTS `INTERFACES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERFACES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTERFACES`
--

LOCK TABLES `INTERFACES` WRITE;
/*!40000 ALTER TABLE `INTERFACES` DISABLE KEYS */;
INSERT INTO `INTERFACES` VALUES (1,'ActualizarPropietario','ActualizarPropietario','A'),(2,'Administrador','Administrador','A'),(4,'AreaComun','Area Comun','A'),(6,'Condominio','Condominio','A'),(7,'Empleados','Empleados','A'),(8,'Factura','Factura','A'),(9,'Inmueble','Inmueble','A'),(11,'Licencia','Licencia','A'),(12,'Login','Login','A'),(13,'Novedad','Novedad','A'),(14,'Pagarcondominio','Pagarcondominio.','A'),(15,'Pagoempleado','Pagoempleado','A'),(19,'Reservacion','Reservacion','A'),(20,'Sancion','Sancion','A'),(21,'ServicioComun','ServicioComun','A'),(22,'Sugerencia','Sugerencia','A'),(23,'MisionVision','Mision y Vision','A'),(24,'Noticia','Noticia','A'),(25,'Cartelera','Cartelera','A');
/*!40000 ALTER TABLE `INTERFACES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTERFACES_POR_ROLES`
--

DROP TABLE IF EXISTS `INTERFACES_POR_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERFACES_POR_ROLES` (
  `ID` int(11) NOT NULL,
  `INTERFACES_ID` int(11) NOT NULL,
  `VINCULO` varchar(60) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`,`INTERFACES_ID`),
  KEY `FK_RELATIONSHIP_93` (`INTERFACES_ID`),
  CONSTRAINT `FK_RELATIONSHIP_93` FOREIGN KEY (`INTERFACES_ID`) REFERENCES `INTERFACES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_94` FOREIGN KEY (`ID`) REFERENCES `ROLES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTERFACES_POR_ROLES`
--

LOCK TABLES `INTERFACES_POR_ROLES` WRITE;
/*!40000 ALTER TABLE `INTERFACES_POR_ROLES` DISABLE KEYS */;
INSERT INTO `INTERFACES_POR_ROLES` VALUES (1,1,'actualizarpropietarioview','A'),(1,2,'administradorview','A'),(1,4,'areacomunview','A'),(1,6,'condominioView','A'),(1,7,'empleadosview','A'),(1,8,'facturaview','A'),(1,9,'inmuebleview','A'),(1,11,'licenciaView','A'),(1,12,'loginView','A'),(1,13,'novedadview','A'),(1,15,'pagoempleadoview','A'),(1,20,'sancionview','A'),(1,21,'serviciocomunView','A'),(1,23,'visionView','A'),(1,24,'noticiaView','A'),(2,14,'pagarcondominioview','A'),(2,19,'reservacionview','A'),(2,22,'sugerenciaview','A');
/*!40000 ALTER TABLE `INTERFACES_POR_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVENTARIOS`
--

DROP TABLE IF EXISTS `INVENTARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVENTARIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) NOT NULL,
  `PRODUCTO_ID` varchar(20) DEFAULT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `NUMERO_FACTURA` varchar(20) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_26` (`CONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_30` (`PRODUCTO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_26` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PROVEEDORES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTARIOS`
--

LOCK TABLES `INVENTARIOS` WRITE;
/*!40000 ALTER TABLE `INVENTARIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVENTARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUNTAS_DE_CONDOMINIOS`
--

DROP TABLE IF EXISTS `JUNTAS_DE_CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JUNTAS_DE_CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_39` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_39` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUNTAS_DE_CONDOMINIOS`
--

LOCK TABLES `JUNTAS_DE_CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `JUNTAS_DE_CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JUNTAS_DE_CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LICENCIAS`
--

DROP TABLE IF EXISTS `LICENCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LICENCIAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TIPO_LICENCIA_ID` int(11) DEFAULT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `FECHA_SOLICITUD` date NOT NULL,
  `FECHA_ACTIVACION` date NOT NULL,
  `ESTADO` char(1) NOT NULL,
  `TIEMPO_DURACION` float DEFAULT NULL,
  `COSTO` float DEFAULT NULL,
  `CEDULA_PERSONA_CONTACTO` varchar(8) NOT NULL,
  `NOMBRE_PC` varchar(60) NOT NULL,
  `APELLIDO_PC` varchar(60) NOT NULL,
  `DIRECCION_PC` varchar(100) DEFAULT NULL,
  `EMAIL_PC` varchar(60) NOT NULL,
  `TELEFONO_PC` varchar(14) DEFAULT NULL,
  `CELULAR_PC` varchar(14) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_81` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_81` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LICENCIAS`
--

LOCK TABLES `LICENCIAS` WRITE;
/*!40000 ALTER TABLE `LICENCIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `LICENCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICACIONES`
--

DROP TABLE IF EXISTS `NOTIFICACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICACIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ROL_ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA` date NOT NULL,
  `STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICACIONES`
--

LOCK TABLES `NOTIFICACIONES` WRITE;
/*!40000 ALTER TABLE `NOTIFICACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICACIONES_POR_ROLES`
--

DROP TABLE IF EXISTS `NOTIFICACIONES_POR_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICACIONES_POR_ROLES` (
  `ID` int(10) NOT NULL,
  `NOTIFICACION_ID` int(11) NOT NULL,
  `ROL_ID` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_105` (`NOTIFICACION_ID`),
  CONSTRAINT `FK_RELATIONSHIP_104` FOREIGN KEY (`ID`) REFERENCES `ROLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_105` FOREIGN KEY (`NOTIFICACION_ID`) REFERENCES `NOTIFICACIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICACIONES_POR_ROLES`
--

LOCK TABLES `NOTIFICACIONES_POR_ROLES` WRITE;
/*!40000 ALTER TABLE `NOTIFICACIONES_POR_ROLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICACIONES_POR_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOVEDADES`
--

DROP TABLE IF EXISTS `NOVEDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOVEDADES` (
  `ID` int(11) NOT NULL,
  `CEDULA` char(8) NOT NULL,
  `NOMBRE` char(60) NOT NULL,
  `APELLIDO` char(60) NOT NULL,
  `PLACA_VEHICULO` char(10) DEFAULT NULL,
  `DESCRIPCION` char(255) DEFAULT NULL,
  `ENTRADA` date NOT NULL,
  `SALIDA` date NOT NULL,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `EMPLEADO_ID` int(11) DEFAULT NULL,
  `TIPO_NOVEDADES_ID` int(11) DEFAULT NULL,
  `PUBLICAR_CARTELERA` char(1) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_42` (`TIPO_NOVEDADES_ID`),
  KEY `FK_RELATIONSHIP_53` (`INMUEBLE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_42` FOREIGN KEY (`TIPO_NOVEDADES_ID`) REFERENCES `TIPOS_NOVEDADES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_53` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_79` FOREIGN KEY (`ID`) REFERENCES `EMPLEADOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOVEDADES`
--

LOCK TABLES `NOVEDADES` WRITE;
/*!40000 ALTER TABLE `NOVEDADES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOVEDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAS`
--

DROP TABLE IF EXISTS `PERSONAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CEDULA` varchar(10) NOT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `APELLIDO` varchar(60) NOT NULL,
  `DIRECCION_ALTERNATIVA` varchar(255) NOT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) NOT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `SEXO` char(1) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `FOTO` longblob NOT NULL,
  `ESTADO_CIVIL` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAS`
--

LOCK TABLES `PERSONAS` WRITE;
/*!40000 ALTER TABLE `PERSONAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTOS`
--

DROP TABLE IF EXISTS `PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTOS` (
  `ID` int(10) NOT NULL,
  `TIPO_PRODUCTO_ID` int(11) NOT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `CANTIDAD_ACTUAL` float NOT NULL,
  `STOCK_MINIMO` float NOT NULL,
  `STOCK_MAXIMO` float NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_25` (`TIPO_PRODUCTO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_103` FOREIGN KEY (`ID`) REFERENCES `INVENTARIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_25` FOREIGN KEY (`TIPO_PRODUCTO_ID`) REFERENCES `TIPOS_PRODUCTOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTOS`
--

LOCK TABLES `PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTOS_POR_COTIZACIONES`
--

DROP TABLE IF EXISTS `PRODUCTOS_POR_COTIZACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTOS_POR_COTIZACIONES` (
  `PRODUCTO_ID` int(11) NOT NULL,
  `COTIZACION_ID` int(11) NOT NULL,
  `CANTIDAD` float NOT NULL,
  `PRECIO_UNITARIO` float NOT NULL,
  `PORCENTAJE_DESCUENTO` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`COTIZACION_ID`,`PRODUCTO_ID`),
  KEY `FK_RELATIONSHIP_34` (`PRODUCTO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_34` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PRODUCTOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_35` FOREIGN KEY (`COTIZACION_ID`) REFERENCES `COTIZACIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTOS_POR_COTIZACIONES`
--

LOCK TABLES `PRODUCTOS_POR_COTIZACIONES` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS_POR_COTIZACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTOS_POR_COTIZACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTOS_POR_REQUISICIONES`
--

DROP TABLE IF EXISTS `PRODUCTOS_POR_REQUISICIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTOS_POR_REQUISICIONES` (
  `PRODUCTO_ID` int(11) NOT NULL,
  `REQUISICION_ID` int(11) NOT NULL,
  `CANTIDAD` float NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`REQUISICION_ID`,`PRODUCTO_ID`),
  KEY `FK_RELATIONSHIP_36` (`PRODUCTO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_36` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `PRODUCTOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_37` FOREIGN KEY (`REQUISICION_ID`) REFERENCES `REQUISICIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTOS_POR_REQUISICIONES`
--

LOCK TABLES `PRODUCTOS_POR_REQUISICIONES` WRITE;
/*!40000 ALTER TABLE `PRODUCTOS_POR_REQUISICIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCTOS_POR_REQUISICIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROPIETARIOS`
--

DROP TABLE IF EXISTS `PROPIETARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROPIETARIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) DEFAULT NULL,
  `APELLIDO` varchar(60) DEFAULT NULL,
  `DIRECCION_ALTERNATIVA` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `ESTADO_CIVIL` char(1) DEFAULT NULL,
  `CEDULA` varchar(10) NOT NULL,
  `FOTO` longblob NOT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `USUARIOS_ID` int(11) NOT NULL,
  `CARGO_JUNTA_ONDOMINIO_ID` int(11) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_100` (`CARGO_JUNTA_ONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_8` (`CONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_86` (`USUARIOS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROPIETARIOS`
--

LOCK TABLES `PROPIETARIOS` WRITE;
/*!40000 ALTER TABLE `PROPIETARIOS` DISABLE KEYS */;
INSERT INTO `PROPIETARIOS` VALUES (1,'Juan','Mata','Cabudare','3242','2342','sjds@gmail.com','M','2014-04-02','C','23423','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0�>a�\0\0 \0IDATx��y�d�}���e����s�c����ł @<E����������#)�a�����?�,۠��$زD�9QaR�L\"B4�Xp�8v��sv�tw]������|���gw��wg{��7���ի��}�w�/EU9Z?��C��H��\0𨪞N\0�<�5�M�9��~/��ҍk=���C�oEz����|�Ře�A�?\0 ̈��/\0�|���7?፣�+\02�Ox��^�dv��\r(�}����A=4M�k\Z�y�w�kD�x��w��Q��!�+��l�۟wx�v��~�;�E仇+ˬ_giu���G��{�����)�t��5�U4e�w\r���\0c@lnԹ�:׼W�~��ED�P��|��v������c�\'�s��s,[\'/\nhj�t2a:�P�%�9Ă��`@�RquuA�Š���\Z6/P����Ó흿���Ě���鯾Kz�\0����������N�;��s���1�3Oq���=�^�w�44UE3�c\0P�x�\0��\0�X���v�$�9��\\�#7.]�]��gĘ�ݳ_~�t����s�/�:���{��pmA0Y�d<cww�\"�W���k\Z\\��T%�@PU4��\0U%8J@�<��!+��kgN���ů�_uY�g���rJG\0��;��<q�x�=� /r������\Z1+VN���!Fp�QU\ruYS�ʠ�=x��M����~#��`���P�P�dE\Z\0d�������\Z��s���b��|�{HG\0�9�z�#���x\'�Zl\0��1�7��\'Op��2`�ڭظ1�����h����7S[�X�D����\"\'�s\\U3��b��I�~����,Y>q����^�����-��1�7���!U\0<��g/�߻��$�2�^N�lnM������滟<��r����-���&e�[Y���1�콽���\nF�\r���s}1Bv�@���j6^~���JQN���{ZD^|����d��89�>�zb��\'��]��EF��3��\\x�8�՟~7?���y���a�#�<pz�^���0�E�Oou��գ�AD�^�zp�4dE�ұUF[[LwG������1��C����>���{96wJG\0��c6�~�o{��p�XK1�S7���?�Ï�GW�S7���1-M�[K�{��u>���qt�����5�i1��ؽ���g��lw̃�y\'�X�?�K��~�;��7yXLG\r\0�;��>|��gO�9�eV:��x�w?�~ӛ��<�+/���[RUM��9��Q����K(M���\r�Xe��N=|?�PN��<��;���=_2���X��}�}�<��1�ݛT�E���\0ߙ����_���o��Ww�ٙRNK���)+�����Q׸��{���+��tpM�hs�e;��^��MSSM���;�����{���<<�#ez���ɇ��_^j�2�T��賱S�o����g�T��WJ�ya��.�9b:�PMK�YISVԳ2eIS��U���Q8�0����YQ�[\Z�7._a�u��uj�ްϱ��1�����?y�G����\0@Uߓ�����;�v�̦M�P7�W�M�5�g3�ڱ=��ٞ2\ZM��&���tB=�RMgԳM�Ys>7�o�ֈ�^/D�\Z1���*�W7(��0�#\"��8N^��wνGD�zS���\0���p��Z��p���s�ɸ���lZ��9bw\\\"b��SU5�,��zZREƗ�)�tB5�EP�h���>W�kC4���\'!d��ɍ���.��%P�f���r1ں�o���-���\Z;6wTe�xw�-zT��yfւкnMU�⾚ͨ&��T�)uY�W\\U�б��!��f�ɍ]���7��W�_Yf���b��<�𖣣\0Փ�����è�s�����ɔ\\T[���G����*�YIU���\0�r:�Oi�n�*�9�T�B�k�&S���XbȊ>R����,p�\r�C�#\0�\'�8n󂺬Q�ԔUE5���o\Z�f���q�Rҧj��j:���(�S�ۘ��_Dc,��n D\r�S��cՀ�ɰyoMD���7d`��\0T�]�zF��*>�z�Ʉ�l��[e1��m����U���皃Uw�W�ƃ�`A�`�,����{��@�>��7pW��P��xMU��x&�M]��Z� ��G�npUM]V4eISU�Vk�@�|�q��X�h�Vvx��#����������\0��c3\\�x��U����`�\r3E�v$@CSW�Vn��~�����\0j��j��1����;\n����y�G���H\0@DN�BS5!9�=�tLwG��dy;�\0B�F��߮�w��f�I�c�`Lxl���� �M�`�BI�\Zo\0\"1n�B.?�wU�����ݝ�n����g�l�1y`��\0�P;�\0�\0�\0  ����o	\0\0Ѫ<��:�\\����]1y��6����(&�R�̥�)�<�\0\n������=�G	��\Zs�Ab06��H���\0\"&�f�Jɒ ��y��~8:\0P�ބ��j(�8L�H�#&��o�`\0�,H�4�;�@2�lj�#���[R�]�`L�J��Z����}�\0��D/��]0�ڪ#�^+�pO�H\0\0x޻�4�\0h(�:\n�8Gl�}GD�٣\n��\Z������S��\\W\\\"	\0<��k(��a�� Y�2|��E�V��,�����\n�\\̫�_:�o��ё\0\0\"_��f޹>��1�#���o�s����|����u\rbI\n�n�<��A�CG\0�z��}s�V�ȁ�<b3���b~/� �1H�$i���]�P���v�q�tT\00}V�?f�\r�{ ���\\���������=`�*�� L�����R 䌧�3�9�MG\0�C���\0���A�$�tD��L����P$1\0�\ZkcL �lW�_��\rpH�,�!��J\0Y`tL��1y���Dm�G\"tb��\n�H�H���(2%\0|<��z����*Ƅ\0��b�gn���7�c0ڮ1�u\r㪣�S�9�����Q�3�:t9=q�Cۉ�f����EI�z{]�y�(��3�\n�ļ��i����y �h�\Z�e��*�A0HĴ�6��E�m�a�iE�>B�0�\ZLb~|��i����[��\0j�	\0�5��J��Y�;���ßg���� 2\\2����\0����	\Z�\n6@l�<�g�+o��=%\0\0|1t�����,�B]�Z���C����#��>{��\'��M��ܐ��Y�4Jj��\Z\ZkC�\0I*@.?\r�,��Q�������5s���@����N�54��r<f6�0�Η�G�/f�R1�\\�ƜMFa�yn�d]�6jk%�p4�G5\0<���S\'Ή1\\���Lwv�yF�+Ȋ�\'��T�xJ]�h�7_}������sPd�} 6�d���6I�,H�8	�%��t�\0p����+�ؾz\r�e���j�2��d�^\0D��k<�w5���P�<�bmlߚ��g1������PÖz�|��v�\0�����T�k���]ҝ��F\r���G>X��^A7um���/r0F��	�ckҬl&sU�CP\0U�ò{o�����@���ӝ�/�^��õUL��·U@e��s4�C)�=����κ��Z�s���Tn�� M&$Ma�*P	���뱺:z\0�L=�}�7�`��IN_xh�(���dL]68\'x� SȂa� 켸3������K��M��ͽ��^�S�z�n��\0����_k���^hg����q��j�E��,�\n���V\\�\Z,�j;i[!����1&څ��I\Z���D�n�\n�?�7Cs�t���J9(+��zZ�1c�A��o\Z\nk�����mξ�Ի[�%B{���!�ŘxnR0�~c��z�n��T���D�u�����f�;\n˶�AL\\�K|�ϙ4�cO!���Sȉt$C��3�M�H�<\Z\r�H�?!;yC��.`�M:JG\0\0��;�|5�0���fYd��M$\Zz�fk���`Z̙�x$�Kd<�r\"�$�1�\0��㑹#:�\0q���}�jx����K�DB��^K���睧�&̄�5��^F��)Q�f��\0��U���h#t�4�=���3]f\"�)��`��:�g������z}E}\\��&��\0�?�f��/�J�h�I7�j���P������y��>H^�k�#��/�1m���/n._b��in�\'��vѰ���a���H��(�\n;���Nw	���{�J9ھ������\0\0��/l���zV���C�6��<��CH��o֨��ݦ���#\"�=,�3f���*����!&���\\{�4�k_��4�m��տy��{�\0ઈ<�^��կ�ȩ��\n����WT]di��# 	�\Z���F�9��G��)gO��x�k/��������O蒱�����Kϱ��S̶B8��������\0|�z�p�ŗ8v߹��C�����48�a��s�0��=W����O\r��O��>�mciEhf\\9�}���p��\Z�v\0��!�NW�l��*k�Oa{}|+�M;����$��>�\0x/�J9������ۯQn^���\n|}x�?\"B���^��N\0x	��c�����,�<I����U�� ƷLN�_�G�GM`|�\0xOU	gNd����꯳�ɋ����G�-���D�2�\0�`0�6����q��`u{�|`rw֣.����jX������������?I�p�>_��N\0XhĠ1:#�0�)��s�k:�}>�U]�C��ge����糟�,���A����\\�g��������p�z�MUS�f���0����P���Ǔ���,?�\'��ԧ��\'����m*��罥�}���l�}�dWW,-Y?�ʍ�����j04 ��f�kP��L���8���������+��Y(\rTq�Ҿ���\0<��EԳ��E�_��cg�U���3�y\ZZ�7U	V�9�2.>��O��ü��\n���6��O����2���G��N\0X�6e�B4�\\ޠn<��w<q���%���F(z\'O,����y���<u�������3_bi`ArH����:�ޢI�Ѡ#\r�v�~X\'���fЭ�`����)���N��%�_�̙c�?�����,/�+G�ˏ��|�|��W0Z��w!�����P�3|w�jpo�f`��#��#������@ڮ]݊�ƹ�+��\\�2�O���}aOAG�ÕB�hlG�1��� �8b>^�7�#�|8�\0���jL�r��<0:�x\'��mߚ��=`n8�`1G�v!�D�QB���z�KZ�wW�u�\0@Q�Αe�dm~bެѤ��w[�%��7tm��Z���ƌ�\\�w�������_Q�>&&�2��v���t4�����d?l�kߓ��W��<�KG�[g���sG��ә����:NLok�6@�\r���~�V���3�����h��@O�|\01?a���gõ^�|;X�3��-ZҊ�XڭLj�}L�}���4vQ�q.�\n��U��C򵳙�&����ݾ�����)�_>�7��������0�����L�_A�>��U3�yo��|ʼ_K+���ʞ��n�O+	�5m�Z%$�Ɠ�L��3�XFLn��}�k�o�7	��_~���Tx�`	�qু�����E04U�4�z�L�xY�C�f�2���g��S��\nR{zU�������P���f=����\\RW�$�����c`��\Z�;��\Z\0��)��G iKXt��*4c�γ�0�.l�_^��yddX��Ѓ$nQ!�7���>DP�n\\��NZG��U-&8�64+B���U_�}��A>\n����C��[\0O\0?�p�=�:�a¼�h9�E����\'����@���˼����&uD���+&�/S�G�u�1�$&V����t���Q�����D��#򏀏��0�9�K\0�G����u�.[��QDK����z4�L\0��kf�; ��u�Z��e�\"��]O���[�ɔ���ԓQ��>�AP#���QA?w25�	��QW���oʟ��?��� ���3�@�\0Ȁ~ :��Yʜ�,��q}_kѧ��z>�����jw��9K\'��W�x����f�i�W\'��jb|�����;�^��:�݂)�%Q	�6���(C�(b2�{����P��O�k�c�_#�w�ʛd0��\0������=!P��o$f���6x���$R>��\Z	\0���{\\]2���oj�Ng��:ٱ�zws��n�j�!����PMf�r���Wp�,\\$�h�H�M&h�5\"���$m=y�[\n=���%|=3���_����ӈ�M��foK�\0�AU���-vޏ\'�칛6�]k}n��6Ѓ���\ZŮU�u�t{�j2e������,�Xg��P|�f�x��A�\0V����-n��*����Db:RI����[b�Pےs�N�:��\n>�6Q������%�\Z�K�������u�7�9o,\0�oQ�#Ƙ� ����l�7*8�hj�k\\�\\{б���5��a_��3JQ��0��dvc���!+\'�X?���������4��5�hs�����{eWW \Z���j��}��}h,��x�=^0��Z��G�S��*���}���6%n��-ڔ��4\"?��a��\r�����Ho0\\���_Y&���Y�񝧩�YM9-��U�ʍ�;e1�&]����0q�!�M�V}����{�t{�t{��W�X=������\\e��+7®�bd��22W*\n��WPf�ZL�KQ�1m��-D\r�i��Ge�\nL> ���j���|���_!�/��a��\r��~�Z����uVN�d��Joi��(0֠Ni�:2��K�N)�U����2�}kw�0�4�dק%`I�2W7�q�\\�e����l�n�qm��7�G<��H��I���#5�#�!JL0)QJ��B��`�дZ�[���d����G�I���W�\0���f��+\'O�v�,K\'��~�gάbl�d�0\Z͘NJ��l�b�^p��\Z���˿�L��b���n�p��7_�8�6�����0 v�^������=�f	#��IU��3�UK.܇��]X���1\"y�و1��)��u\\9������a���cb�ϯ�<����9�O��G��0Ｐʵ�O>����bsc���4��U��<^�y�noH��b����-\\��Q����)*e����L�<�io\"�̽\0M��.�[��^H��Fcãz0i-�G�#j@�EL?|���V��X����U|9�K���/�-�\0=��//?��}��|�.��C?�$ｸ\n�#g\\9^�:cwTc��7����56�i\Z�yN�\'�);ߛ\'�yk�y]���V&�wn�yR \0��ڤP|��4�\n�\" C��e�.�{�9\0�!�;�R<���)��T�E�P1���2��ºz�g@�Z\Z\0T�O�\"������_^b��\Z�y�������ø���[i�v��O%m��@�i�\'��h(v7iLc.�>�ތ�^�>�_`�S#��@�����y�i�q����\\=�i�/��jb�A��҂%Z��!��X=�l�򏈱��]���\'Tx��	�ǎ��,��!&�ϔ�A�����Oy��	�Y�T�:=MGJ�tt��n]tAҝ�	��S����� �D��\Z|40�s)���sU��yA�\Z�D�bF��-P�(���\ZՍk+�\'.�=(\n\0�O}����O��{GVc�ƕ)���-�;���v�3/�y�Ҙ鸢�B\0�5J�q��䝚��ۻA�=ߔ�YL�v�P�`�\\�w��z��C\0B\\s�����r�h��X�f���Fp����.����.��UK�\r��`��CWU�!r�\0�\'�<\\O&��1@�k���~�PU�L*��٤���TeCU:����<H��)6U�$��y�g��Ix>��6H3����\'��e�_��B֩�麗�W��c�<&74.I׸��\n�MG�� �c� �X��-�K9����o�\r�\0O 27x��SMkFvJY����!S�\rլa6��Mj����%VN��m[Y��b6��*M\ZB��k���\ZM����t<��/�vS3�wK�w��x�׹sfk�tg���D�Ƈ��E��Ѱ`5�k�S\'�[�B�R��w˸����`�5��.kf�U�*��x�7��rT���t��=�4[vv�]\0\0IDAT���若!C��<���vJ����k��{Z�8��FCv0iQY�l��v\r:��������ϯ��&��bĢ�߀xڽ��UT��A���\0��jrq?#�N��\0 �������\n5��N���)M��^YZ��9�I2.�T��%�\'6d\n�\0��\0c:��&;xA�\Z�7�op��v�0�|���5|���������$Ҍ�����{@�\nKR�����~��\rBڀr��xU�����C\\9~R�0=(�	\0�0&�K�lZ��P54�b�h�A��a:�e:�pMr�g|X��F�$��1&���9�B�������x	]@Dp�s����T\0H�(8\"\ZԆӹ������)��a��K�D� �]b~�xA�2J�,���������z8�]lQ�\0X?�!�r�db2��3�8Y��� M��Cز5ks�&Vhk��6h������nkm\\f��z��\nB0 ����tm���Z\r��M�>ї����kH������`bv+\r<b��&Mu�d�P�KͭbfQ�b�e@����K\0\0C����HV b�N(g����۸�Ƙ�j8W5�7شc�a������s�^N�˰y��#\0b*X%F�}\'�h�&�̹��+` 1}�X4�d�G��HG\rtD�FC3J\0U��dҬ����/sO�\rw%�x��U�@�?��$\\�`+�Q�>	�2�� ��d�P�C�b,�EU�{#6�Ia��4loX��(y8zy/i�4{�tt��Ρ>z�)�n�ܗv�N(�u���Y��I�4z^1��I��� Ф��7��I�w%B�*6��U\'&Z�s�/ޠ(����u�#��ڇ�\Z\0\"�bR��\ns>�R=U�U͙����{��h�u&�����I5l�kD���\n7��0F醍_7اD�\'�>m\0�s>E��*�;U?�;��\0p��E�I\Z��T�(��G|�A�Z5�i֛�/��^�B��U_���6�xXĊ��9�]:M��t4�u��,M�qNۙ.�\Z�I�\'A꣸�n8�����^�>�H;6]\0̍6�OH�<�hA���d`>�\n8�p�!�s	=	M0���\\�K�T)�>0��B��#��(��Q��&�!��2s�E����֓\"�����\0\0�Dv4�q����FiXQ�5UgZ+��^�&(1���>}~��%H#t���o���:���kx��\r��&��I-x76��!�\r��t��%��?�3~�|U�`B��V�f��	)=���1��\n��+O��U\0�d9&�&��vݚ�~&��P���������a6%#O���Y˺���s �\n4���x�tߤ\Z�\'�YpC9qFG�(���R�����JSy�Zq�ǹ`p��w$\\�;yJm��^�|W���ͧ/`@�o=;X�w�	�\0������Mޏ;kgw���b��,d���y��2�G: �3�f����m���x��Zu�4�o4nاɠV������΋!�h3 ��Qr��/�\Z���TJ]j��J�^��� 	Y�v��v;��\n�c�;�\n�x��X0��{8�\'pw@�\0�C&��[��n�Ƌ�� �,��*�����Y�&�l�ħ��L������0��p��˨�x���oFG�x��%�E�������pI`)E3M���J5�T�R���7\Z\r�P\'�I�i�}H���X��c)$��mpk_�[p�	��2wi�U:�0Y�W���ˆ�gɊ��AC�՞��Iuo���k�:=%}��:�(y�[��fZ������ε���v�g��E?�ƽ��ʙ��*��\Z|��E\\0⃱���K�|X��S0�U\\5�x���&�+\0�F�6/��u��76�ݼ,���f7��k,��o����]�ݭk�m�4�����s�-\Zw��;�����D���W���깔\'��}|����`iŰ��1��5F/|�l�D���c� 4���\0|k��\r֩w.?�~��ܸ�w���+\0(����1�p��+Y�&��Z�\'ۨ����q�mJ����1C�%�-��i���!&�����R��=_xq����=�\0��Z牶��:o���ZOC�\r��.�\ZQ��ԑ\r����\'_;����bW�1v���gQ=�\'pW\0(��Z:~)��\"Lb��of��|5	V�)p��BS׌�F,v�s\r�]��!���;�;�E�,�%��{���O��4��6.�纶cО���M\rt�H��5��x\Z�i��f|�j�&�\"���;u��M�%X����l�<]~�7\0y�q���� l\n��+4�M��;0B������8�L�pke4i\'��Pyk��6��T�|z�T�����O�nT�u^k]�[\\�z���T��c��lӔu��д�%$�|5e���]{����8q|p���-@ݻ��\Z�|_:0\0���O��{�Eɇ���T���1b{`���@����Ƙ٤+������4�;�]���LhA�\ZTe�}��O��O���[�����^��?��H�M6�C��\0.X�a��fW���ߡ�U�/|/�;<�d���}{?n�\0��[1�� �b��zxW1��%|S��P�dk^��0��g����\'V��r\Z#�1�=F`G��Y�t}�٭��p�@r뙛(1I������^L-�1���0>�.�n]�\n�0/�Kkb���x��?D]�����C�`\r�������T?�M:�Ё1œb��M��+_�WcL�\'������!;%qx[�n�[Y^���uw�j�9���k����=����^&Ƈ��3�_����k���k[T�YP�B�,q}D���\'7;�3����)�x/��	D�Aְ��m�c`^��}�o���b�L�_�h�7B$0V㶋6څ	\0�yEm�پ���ayX:\\�ԍ�q�@;�iZ\'���C�k���yK�&��o���zn>�2��dv�݂Vo���Cp�s��k����n�Cm����K_D���:�]76���]:��ԓ-s�_?֊�n�~�&_b5�������Wn���,k#l�$������ܛ�O�^��wTF�Jׅ��C	{�@��}���S����=�v�l1۝ ��]���ә,���w�idhS�&��מ��}#&��iR��@Ju�o��巼o�o�\"k^{�Y����B	h���I�ƫ�3&�i���3�� Ϋu:/���@��3�ou0�,Iugx�Kh�8���v�G:�Y��+�ㄙ�yHF��]��[Z�jLƍ/��x��\Z��FO��Q�򃪀)ؗ�����y���ʛ\n�NB�m�?&�7��F���\Z�[3v7&���@�4�^��Bw������V��_��{���[�/�U@�ν���w>s�}��W�SϪ��]{������og��	��U�j����E�;Z+x \0�~�^�����?�z���n�sy*6Ø� 7e��پ�*u3�W\'���6Q�՟�uDoW�vu𾀈͝��9??��������.h��I��}y����ld��`A�\r1\rX�`�149�N��/v�ڗѻ��A6\"on��&�\r|2q�N��⧮\rv.|��\'(V�X���x	?��v���+�?I���ߺ21�C�D�\'O�?��t�`>�I��N�.��}˝���	�{��9i���cn\\�\r~�&�D�i�]�:+�ރ�U�(D��w4��Ͷ_yy��ҧ\\=��`>�%�O��.f��\'��l\0π���1�z����K��_����G�������\nbL1 ��l|�7A�~_(h�ET���q��5�򚙻Jq�RuP�d:�n�>����|�}���\\����@����D�ݘr��nx�Rn����^y�f���#cs�l�j���xs�\Z_�TO6��~�90O��2�20��_t���;����\0��(��\\������g�+Yo%�\\{�U���X��;͉w���B&��#9�\Zˆ�UC�(s:��-,�����\Z��xSP\'��s.�R\nt�����f�hc��ס��oµ�Sn���W���s�|i*��7�X��͋ σ}�Y����JՃU��5\0��`�����p������A� �Bu�d+�K��-k���w`{��\"�c�B,򢳐Sh�	 �b�\"v{��p؇�{����so��Rv6\Z�q	���1\r hS2�z��~��W>?U?��7�����A��\r���%B����d�o\0�SCh�����!aK�AZ��$T�Cq����������w�/#+\n�(��,W�^��Y\0�~`�E@,\\�-|�w]w�+Att\r�nlAB��t�LvBBb���f�����}����ʗ���|\r��2���6�K�;��	Ī��W{�K����x���>ǀ��\n�c��|xzup�������Ŭ��@��J��am(�^���\0�&�.0p��0����7۴����ԅY?�AS �5�f�������MF��p\\�._��9ȟ�<A��ќI<OW����-\n�.e����0`�u��8\r�$��?��|xle��K+����0X:u�[Y%��[�ٹ��wg:.��5���Rwv����=\Zq�Q��q�z�*�ݸR��<�=����/n֣+�PnA�*dρ|����� �\'���a�4����G\0\0]\n�\"��&P$0	���)pǠ^�#��|���tꁵ�3.-�:��r���کA6X��`�,�+.�K1���n�u�&2���-�x�����-����S����&�v��^�\Z_{qs�����+�Սw��@���5��fw:7əק���(�9s{a	XN�?�\n�\0������fy��~by�乵���l�:쯝\\\\���)=[r1y&63b2Z��օ�t�w.����]���s�l��٬�쌫��h�qy����v���W_�^�n�x_���.��)���N�aQ�7��X�z;\0`���#���x�h���\\�G�S�9��R�vx���K}�8�����+���������x��2u��\Zo\\�m�Ru3�4S�z��S�m���o�1��3�3�\r��୲ḙ(�^�x� &_���	��z�9�-Ԗ����\\�Iї����!�,?�C�HC��upi�4�����7�M|��&����ma����\0\0\0\0IEND�B`�',1,0,1,'A');
/*!40000 ALTER TABLE `PROPIETARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROPIETARIOS_POR_ASAMBLEA`
--

DROP TABLE IF EXISTS `PROPIETARIOS_POR_ASAMBLEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROPIETARIOS_POR_ASAMBLEA` (
  `PROPIETARIO_ID` int(10) NOT NULL AUTO_INCREMENT,
  `ASAMBLEA_DE_JUNTA_ID` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`PROPIETARIO_ID`,`ASAMBLEA_DE_JUNTA_ID`),
  KEY `FK_RELATIONSHIP_46` (`ASAMBLEA_DE_JUNTA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_45` FOREIGN KEY (`PROPIETARIO_ID`) REFERENCES `PROPIETARIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_46` FOREIGN KEY (`ASAMBLEA_DE_JUNTA_ID`) REFERENCES `ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROPIETARIOS_POR_ASAMBLEA`
--

LOCK TABLES `PROPIETARIOS_POR_ASAMBLEA` WRITE;
/*!40000 ALTER TABLE `PROPIETARIOS_POR_ASAMBLEA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROPIETARIOS_POR_ASAMBLEA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROVEEDORES`
--

DROP TABLE IF EXISTS `PROVEEDORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROVEEDORES` (
  `ID` varchar(20) NOT NULL,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `CELULAR` varchar(12) NOT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_31` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROVEEDORES`
--

LOCK TABLES `PROVEEDORES` WRITE;
/*!40000 ALTER TABLE `PROVEEDORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROVEEDORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIBOS_CONDOMINIOS`
--

DROP TABLE IF EXISTS `RECIBOS_CONDOMINIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIBOS_CONDOMINIOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FACTURAS_ID` int(11) DEFAULT NULL,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` char(255) DEFAULT NULL,
  `FECHA_EMISION` date DEFAULT NULL,
  `FECHA_CANCELACION` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_59` (`INMUEBLE_ID`),
  KEY `FK_RELATIONSHIP_60` (`FACTURAS_ID`),
  CONSTRAINT `FK_RELATIONSHIP_59` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_60` FOREIGN KEY (`FACTURAS_ID`) REFERENCES `FACTURAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIBOS_CONDOMINIOS`
--

LOCK TABLES `RECIBOS_CONDOMINIOS` WRITE;
/*!40000 ALTER TABLE `RECIBOS_CONDOMINIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIBOS_CONDOMINIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIBOS_GASTOS_EXTRAS`
--

DROP TABLE IF EXISTS `RECIBOS_GASTOS_EXTRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIBOS_GASTOS_EXTRAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GASTOS_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FECHA_EMISION` date DEFAULT NULL,
  `FECHA_CANCELACION` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_74` (`GASTOS_ID`),
  CONSTRAINT `FK_RELATIONSHIP_74` FOREIGN KEY (`GASTOS_ID`) REFERENCES `GASTOS_EXTRAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIBOS_GASTOS_EXTRAS`
--

LOCK TABLES `RECIBOS_GASTOS_EXTRAS` WRITE;
/*!40000 ALTER TABLE `RECIBOS_GASTOS_EXTRAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIBOS_GASTOS_EXTRAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIBOS_RESERVACIONES`
--

DROP TABLE IF EXISTS `RECIBOS_RESERVACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIBOS_RESERVACIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RESERVACIONES_ID` int(11) DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL,
  `FECHA_EMISION` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_96` (`RESERVACIONES_ID`),
  CONSTRAINT `FK_RELATIONSHIP_96` FOREIGN KEY (`RESERVACIONES_ID`) REFERENCES `RESERVACIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIBOS_RESERVACIONES`
--

LOCK TABLES `RECIBOS_RESERVACIONES` WRITE;
/*!40000 ALTER TABLE `RECIBOS_RESERVACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIBOS_RESERVACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIBOS_SANCIONES`
--

DROP TABLE IF EXISTS `RECIBOS_SANCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIBOS_SANCIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `SANCION_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `FECHA_EMISION` date DEFAULT NULL,
  `FECHA_CANCELACION` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_97` (`SANCION_ID`),
  CONSTRAINT `FK_RELATIONSHIP_97` FOREIGN KEY (`SANCION_ID`) REFERENCES `SANCIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIBOS_SANCIONES`
--

LOCK TABLES `RECIBOS_SANCIONES` WRITE;
/*!40000 ALTER TABLE `RECIBOS_SANCIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIBOS_SANCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RENOVACIONES`
--

DROP TABLE IF EXISTS `RENOVACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RENOVACIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LICENCIA_ID` int(11) NOT NULL,
  `FECHA_RENOVACION` date NOT NULL,
  `COSTO` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_82` (`LICENCIA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_82` FOREIGN KEY (`LICENCIA_ID`) REFERENCES `LICENCIAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RENOVACIONES`
--

LOCK TABLES `RENOVACIONES` WRITE;
/*!40000 ALTER TABLE `RENOVACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RENOVACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUISICIONES`
--

DROP TABLE IF EXISTS `REQUISICIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUISICIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PROVEEDOR_ID` varchar(20) DEFAULT NULL,
  `FECHA` date NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_38` (`PROVEEDOR_ID`),
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`PROVEEDOR_ID`) REFERENCES `PROVEEDORES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUISICIONES`
--

LOCK TABLES `REQUISICIONES` WRITE;
/*!40000 ALTER TABLE `REQUISICIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUISICIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVACIONES`
--

DROP TABLE IF EXISTS `RESERVACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESERVACIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `AREA_ID` int(11) DEFAULT NULL,
  `FECHA_RESERVACION` date NOT NULL,
  `FECHA_USO` date NOT NULL,
  `HORA_INICIO` time NOT NULL,
  `HORA_FINAL` time NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_18` (`INMUEBLE_ID`),
  KEY `FK_RELATIONSHIP_19` (`AREA_ID`),
  CONSTRAINT `FK_RELATIONSHIP_18` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_19` FOREIGN KEY (`AREA_ID`) REFERENCES `AREAS_COMUNES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVACIONES`
--

LOCK TABLES `RESERVACIONES` WRITE;
/*!40000 ALTER TABLE `RESERVACIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES (1,'admin','hola','A'),(2,'propi','propi','A');
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SANCIONES`
--

DROP TABLE IF EXISTS `SANCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SANCIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `TIPO_SANCIONES_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA_REALIZACION` date NOT NULL,
  `CONDICION` char(1) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_15` (`INMUEBLE_ID`),
  KEY `FK_RELATIONSHIP_16` (`TIPO_SANCIONES_ID`),
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TIPO_SANCIONES_ID`) REFERENCES `TIPO_SANCIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SANCIONES`
--

LOCK TABLES `SANCIONES` WRITE;
/*!40000 ALTER TABLE `SANCIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SANCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICIOS_COMUNES`
--

DROP TABLE IF EXISTS `SERVICIOS_COMUNES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICIOS_COMUNES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TIPO_SERVICIOS_ID` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `COSTO` float DEFAULT NULL,
  `RECIBO` longblob,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_55` (`TIPO_SERVICIOS_ID`),
  CONSTRAINT `FK_RELATIONSHIP_55` FOREIGN KEY (`TIPO_SERVICIOS_ID`) REFERENCES `TIPOS_SERVICIOS_COMUNES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICIOS_COMUNES`
--

LOCK TABLES `SERVICIOS_COMUNES` WRITE;
/*!40000 ALTER TABLE `SERVICIOS_COMUNES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICIOS_COMUNES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOPORTES_DE_RECIBOS_PAGOS`
--

DROP TABLE IF EXISTS `SOPORTES_DE_RECIBOS_PAGOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SOPORTES_DE_RECIBOS_PAGOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RECIBOS_CONDOMINIO_ID` int(11) DEFAULT NULL,
  `RECIBOS_RESERVACION_ID` int(11) DEFAULT NULL,
  `RECIBOS_GASTOS_EXTRAS_ID` int(11) DEFAULT NULL,
  `RECIBOS_SANCION_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` char(255) NOT NULL,
  `BANCO` varchar(60) NOT NULL,
  `FECHA` date NOT NULL,
  `MONTO` float NOT NULL,
  `VALIDAR_PAGO` char(1) NOT NULL,
  `COMPROBANTE` longblob NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_61` (`RECIBOS_RESERVACION_ID`),
  KEY `FK_RELATIONSHIP_75` (`RECIBOS_CONDOMINIO_ID`),
  KEY `FK_RELATIONSHIP_80` (`RECIBOS_GASTOS_EXTRAS_ID`),
  KEY `FK_RELATIONSHIP_87` (`RECIBOS_SANCION_ID`),
  CONSTRAINT `FK_RELATIONSHIP_61` FOREIGN KEY (`RECIBOS_RESERVACION_ID`) REFERENCES `RECIBOS_CONDOMINIOS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_75` FOREIGN KEY (`RECIBOS_CONDOMINIO_ID`) REFERENCES `RECIBOS_GASTOS_EXTRAS` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_80` FOREIGN KEY (`RECIBOS_GASTOS_EXTRAS_ID`) REFERENCES `RECIBOS_RESERVACIONES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_87` FOREIGN KEY (`RECIBOS_SANCION_ID`) REFERENCES `RECIBOS_SANCIONES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOPORTES_DE_RECIBOS_PAGOS`
--

LOCK TABLES `SOPORTES_DE_RECIBOS_PAGOS` WRITE;
/*!40000 ALTER TABLE `SOPORTES_DE_RECIBOS_PAGOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SOPORTES_DE_RECIBOS_PAGOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUGERENCIAS`
--

DROP TABLE IF EXISTS `SUGERENCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUGERENCIAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INMUEBLE_ID` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `FECHA` date NOT NULL,
  `LEIDA` char(1) NOT NULL,
  `PROPIETARIO` char(1) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_51` (`INMUEBLE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_51` FOREIGN KEY (`INMUEBLE_ID`) REFERENCES `INMUEBLES` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_99` FOREIGN KEY (`ID`) REFERENCES `CARTELERAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUGERENCIAS`
--

LOCK TABLES `SUGERENCIAS` WRITE;
/*!40000 ALTER TABLE `SUGERENCIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUGERENCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_EMPLEADOS`
--

DROP TABLE IF EXISTS `TIPOS_EMPLEADOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_EMPLEADOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `SUELDO_BASE` float NOT NULL,
  `PORCENTAJE_PRIMA_HIJOS` float DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_12` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_EMPLEADOS`
--

LOCK TABLES `TIPOS_EMPLEADOS` WRITE;
/*!40000 ALTER TABLE `TIPOS_EMPLEADOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_EMPLEADOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_GASTOS_EXTRAS`
--

DROP TABLE IF EXISTS `TIPOS_GASTOS_EXTRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_GASTOS_EXTRAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_73` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_73` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_GASTOS_EXTRAS`
--

LOCK TABLES `TIPOS_GASTOS_EXTRAS` WRITE;
/*!40000 ALTER TABLE `TIPOS_GASTOS_EXTRAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_GASTOS_EXTRAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_INMUEBLES`
--

DROP TABLE IF EXISTS `TIPOS_INMUEBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_INMUEBLES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_49` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_49` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_INMUEBLES`
--

LOCK TABLES `TIPOS_INMUEBLES` WRITE;
/*!40000 ALTER TABLE `TIPOS_INMUEBLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_INMUEBLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_LICENCIAS`
--

DROP TABLE IF EXISTS `TIPOS_LICENCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_LICENCIAS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) NOT NULL,
  `COSTO` float NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_101` FOREIGN KEY (`ID`) REFERENCES `LICENCIAS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_LICENCIAS`
--

LOCK TABLES `TIPOS_LICENCIAS` WRITE;
/*!40000 ALTER TABLE `TIPOS_LICENCIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_LICENCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_NOVEDADES`
--

DROP TABLE IF EXISTS `TIPOS_NOVEDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_NOVEDADES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` char(60) DEFAULT NULL,
  `DESCRIPCION` char(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_52` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_52` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_NOVEDADES`
--

LOCK TABLES `TIPOS_NOVEDADES` WRITE;
/*!40000 ALTER TABLE `TIPOS_NOVEDADES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_NOVEDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_PAGOS`
--

DROP TABLE IF EXISTS `TIPOS_PAGOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_PAGOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `ESTATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_102` FOREIGN KEY (`ID`) REFERENCES `SOPORTES_DE_RECIBOS_PAGOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_PAGOS`
--

LOCK TABLES `TIPOS_PAGOS` WRITE;
/*!40000 ALTER TABLE `TIPOS_PAGOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_PAGOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_PRODUCTOS`
--

DROP TABLE IF EXISTS `TIPOS_PRODUCTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_PRODUCTOS` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_44` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_44` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_PRODUCTOS`
--

LOCK TABLES `TIPOS_PRODUCTOS` WRITE;
/*!40000 ALTER TABLE `TIPOS_PRODUCTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_PRODUCTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_SERVICIOS_COMUNES`
--

DROP TABLE IF EXISTS `TIPOS_SERVICIOS_COMUNES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_SERVICIOS_COMUNES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` char(60) DEFAULT NULL,
  `DESCRIPCION` char(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_54` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_54` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_SERVICIOS_COMUNES`
--

LOCK TABLES `TIPOS_SERVICIOS_COMUNES` WRITE;
/*!40000 ALTER TABLE `TIPOS_SERVICIOS_COMUNES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPOS_SERVICIOS_COMUNES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_SANCIONES`
--

DROP TABLE IF EXISTS `TIPO_SANCIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_SANCIONES` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CONDOMINIO_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `MONTO` float DEFAULT NULL,
  `PENALIZACION` varchar(255) DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_17` (`CONDOMINIO_ID`),
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`CONDOMINIO_ID`) REFERENCES `CONDOMINIOS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_SANCIONES`
--

LOCK TABLES `TIPO_SANCIONES` WRITE;
/*!40000 ALTER TABLE `TIPO_SANCIONES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIPO_SANCIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIOS` (
  `ID` int(10) NOT NULL,
  `LOGIN` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_91` FOREIGN KEY (`ID`) REFERENCES `ROLES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES (1,'admin','123','A'),(2,'propietari','123','A');
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-09 10:35:15
