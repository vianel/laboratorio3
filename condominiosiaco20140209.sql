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
INSERT INTO `CARTELERAS` VALUES (1,'Aparte para mi babyshower','2013-03-05','1','propietari','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0Ã>aË\0\0 \0IDATxœí½ydÉ}ß÷ùe¾÷êèsîcÏÙÝÙÅ‚ @<EÉ¦‚¦˜ƒ”ƒ²#)Øa‡ƒ¦ÄÐ?²,Û ® $Ø²D†9QaR”L\"B4âXp±8vÀžsv÷tw]ïÈüùÌ|õª§gw¦§wg{¿˜7õºêÕ«ªü}ówç/EU9Z?õ¡C¹ÏHðð\0ð¨ªžN\0Ç<À5Mà9àñ¸~/¾ìÒk=Ðû²CþoEzåÿ½ª|ªÅ˜eÉAÒ?\0 Ìˆè/\0¿|ø ¹7?á£·+\02àOxïÿ^Èdv©è\r(ú}²¼ÀØA=4Mƒk\ZÔyœw¨kD½xõ«w«êQïÏ!ò+ÀÿlßÛŸwxôv€€~Ð;ÿEä»‡+Ë¬_giu•¢ßGŒÅ{¥š•”Ó)åtŠÖ5ÎU4e…w\r‚€Š\0c@lnÔ¹÷:×¼W½~ØùEDþPÞë|·ôvÀÞû¿òc«\'sæþs,[\'/\nhjÇt2a:P—%Î9Ä‚íå`@êRquuAÐÅ ÏÒú\Z6/Põ”ãÉÃ“í¿ãªú§Äš‰Èîé¯¾Kz»\0à»¦ùƒ¥á¼ãNœ;ƒÍsÄšÆ1Þ3OqêÉú=²^w×44UE3«c\0P¯xç\0²¢\0ÀX¡®°vú$Î9¶¯\\û#7.]ù]õþgÄ˜Ý³_~—tô ü”sÍ/Ÿ:¦÷È{ÞÁpmA0YÆd<cwwŒ\"×WÁðŠk\Z\\ÝÐT%Æ@PU4‚¢\0U%8J@ã<ý¥!+ßòkgN­½òÅ¯ü_uYÞg¬ý÷rJG\0ªÚ;ÿË<q¡xô=ï /rŒµˆµÜØ\Z1+VN£ßï!FpÎQU\ruYSÏÊ ë=xçñMƒ©³ð~#¨ó`„¦¬PçPõdE\Z\0dë†ã÷ßÇÒú\ZÏús½§bÌÁ|±{HG\0Ü9ÿzç#ÅÅïx\'ÖZl\0°¹1¢7ðŽ\'Opöô2`ØÚ­Ø¸1åÆö„éh†ªâ½Ã7S[ÄXŒD„äŠ²\"\'Ës\\U3ÚØbõÔIò~÷ž¦,Y>qŒ‹ßó^žþÄïþ-õþ1æ7ïé¨Ü!U\0<èšæ£g/Üß»øï$Ë2²^N–lnM¸ÿüÈûæ»Ÿ<ÁÚrÎõíšó¥-žúê&eí©ª[YŒ±ˆ1ˆì½½¶ª\nFè\r† °s}1Bv¬@½§©j6^~•ÁÊJQN¦¿ä{ZD^|“ÇãÀdîõ89ç>²zbý‘\'¾ó]ùEFÑï3žÖ\\xè8ÿÕŸ~7?þ¾ûyàô€ÕaÆ#ç<pz‰^¿ÀØ0ËEâOou¼âÕ£êADð^ƒzp×4dEÆÒ±UF[[LwGˆ—¾ú³Ý1ßúCïãÜ>â÷‘{96wJG\0ªúc6Ë~ò±o{’þp€XK1èS7ÊÊò€?õÃñžGWÞS7ÊöÄ1-Mã[Kß{÷u>üí¾qt£ãêêÂ5®i1××Ø½¶Á¥g¿ÆlwÌƒïy\'ÆXÎ?ñKÇÖ~Ò;÷Á7yXLG\r\0Ö;÷Î>|žãgO9ˆeV:ž¼x’w?º~Ó›ž½<ã+/¸±[RUMˆþ9‡QÀä¤£K(MˆÇÕ\rÆXeûòN=|?ªPN¦Ø<çü;ø‘±=_2‘ªþXÑï}ï}<¤´1ÁÝ›TäEÆêê\0ß™½‡§_œò‰ÏoñõWwÙÙ™RNKš²¦)+šº¦©âQ×¸ªÆ{¿ð™Þ+¾ñ­tpMÃhs›e;–¯^ÁÕMSSM¦¬Ÿ;ÃÒúÚ÷{çþä›<<¢#ezçÿìÉ‡ÏÑ_^jà¼2™T¬è³±Sóo¾¼ËÃgúTçWJžya——.í°¹9b:šPMKªYISVÔ³2eIS–ÔUµøQ8ç0ÃØïYQÐ[\Z’7._a²uƒá±uj…Þ°Ï±ûÏ1ÚÚþ³À?yóGéÎèÈ\0@Uß“åÙûŸ;ôvÎÌ¦MÝP7žW¯M˜5ð™g3ªÚ±=ªØÙž2\ZM™&”“ÕtB=RMgÔ³MëYs>7“oÎÖˆò^/D«\Z1†Áê*ÛW7(––0Ö#\"¬œ8N^äïwÎ½GDžzSêéè\0ÀûÿpéØZÑëpÃæŠsžÉ¸¤ñÊlZ²±9bw\\\"bðÎSU5Õ,ÌøzZREÆ—“)ÕtB5™EPÌhªúµ>W×kC4°®£\'!d½œÉšéî.ý¥%PÅf–þÊr1Úºñoàðè-­­¡\Z;6wTeÍxwŒ-zT“ÞyfÖ‚ÐºnMU·â¾šÍ¨&Œ§T“)uY½î‡«W\\U‡Ð±„Œ!€Áf–É]²¼À7Ž¬WÐ_Yf¼µóƒbó¿Ê<°ð–££\0Õ“ÆÚ÷ö‡Ã¨§sšª¡®ÊÉ”\\T[± ÞG«¾¦®*šYIU–ÔÓ\0‚r:¥OiÊn³*Ê9‡TõB‰k©&SšªÆXbÈŠ>R¾ÝØì,pé\r—C #\0…\'ó¢8nó‚º¬QÄÔ”UE5‚o\ZÄf˜”ÀqçRÒ§j½j:£žÎ(§SšÛ˜ù‹_Dc,€¶n D\rSšÚcÕ€ñ¨É°yoMD¾ø7d`Ž\0Tß]ôzF½§*>úzÓÉ„Ùl†÷[e1³ämÊì¹äê•U°¢ÁçšƒUw©WšÆƒñ`Aœ`¬,Î¢àÀ{¬@Ä>‰È7pW¤úP–çxMUÑÞx&ãM]ãÃZ» þÕG npUM]V4eISU¬VkÉ@Î|åq¾ÆXÉhšVvxªÒ#¦ÀØìÂáÆáÒÑ\0€Èc3\\Äx¯ÔU°¼½ú`¡\r3E½v$@CSWñVnÞë~¼µ‘ñ±\0jÅðjðŒ1Œ·§ñ;\n˜¢ˆyøGâÐéH\0@DN«BS5!9ã=®tLwG€Òdy;û\0BñFˆïß®‘wóÄfˆI‡c±`LxlÁ¼ƒ ÑM´`ÌBIú\Zo\0\"1nïB.?êwU¥©›½¥Ý¿nÊõÞÞgšl†1y`¼\0P;°\0‚\0‰\0  €Âæþo	\0\0Ñª<õç:â\\õŽöÆ]1y˜ù6ïÌüð(&‹RÀÌ¥Á)<„\0\nó–À€÷Š¯=ÞG	àš\Zs¯Ab06Œ·H¶ °\0\"&¼fÌJÉ’ ÕˆyËÎ~8:\0PïÞ„”¬j(Ò8L±H–#&›…oó`\0š,H…4û;¶@2ãlj¡#ù¦¸[RÕ]Ó`LÖJ€ƒZôû‘Å}¾\0ßÂD/ ý]0ì±Úª#Ù^+ÑpOéH\0\0xÞ»ï4Ø\0h(Ý:\n³8GlÅ}GDæ‹Ù£\n¢è\Z…ù¶£ûS¾À\\W\\\"	\0<ëÃk(ÏÇaÜØ YÖ2|ÎüE˜Vÿç,Ø’¼¤\nÌ\\Ì«‹_:„oú†Ñ‘\0\0\"_ñêfÞ¹>êñ1ù#·²ÿoã¦s¦§ÃÞ|ÐÎþ¼u\rbI\n´ná<é¥ÃAëCG\0ð’z¿å}s•V¨Èƒ<b3ŒÍçb~/ó ¢1Hë$i±—ù]ƒPºë¾v˜qØtT\00}V?f–\rÃ{ ö·Æ\\Ž‰ÁïÏÄÿ‚=`ƒ*Ö Lö€™†ºR äŒ§À3‡9‡MG\0øC¯îß\0†àAî$útDº‰L¥£ãÅP$1\0¡\ZkcL „lWü_ý¦\rpHô,ê!éýJ\0Y`tLò‹1yÇ÷ïDm±G\"tb¦£\nöHHŸ˜ê(2%\0|<Š‰zÿÎç¿Ä*Æ„\0Íb gnì‘âþ7¡c0Ú®1Øu\rãª£üSž9¸‘úæÐQÀ3ª:t9=qÇCÛ‰ê‘f­íè“EIÑz{]Äy€(„†3Ä\nÆÄ¼´i¨§ÞÂy àhà\ZðeÐï*ÜA0HÄ´âž6€“E‘mç†aƒiEý>Bô0Æ\ZLb~|Œºi¬¡ÁÔ[šŽ\0jà	\0Î5­˜J´÷Yæ;§½“ÃŸg÷ÄØØ 2\\2¹õ¿\0‚…˜	\ZÃ\n6@lü<Õg+oìÜ=%\0\0|1tìð––è­,B]†Z¿¦ªCŽ õÃ#‰´>{ŠÛ\'Ÿ½MñÊÜ›ÛY¨4Jj ã\Z\ZkC¢\0I*@.?\rò–,éÒQÀ¿óÞù¥õ5sþ‰Ç@ ž–¡NÐ54³’r<f6ž0¨Î—‚G¦/fòR1Ç\\´ÆœMFa›ynÀd]æ6jk%èp4šG5\0<ê•ÕS\'Î‰1\\úêóLwv°yFÞ+ÈŠË\'ŽÓTåxJ]–hŸ7_}žÀ™çõçsPd­} 6Ãd³‡ù6I€,Hõ8	%ßòtÔ\0pøùÀæ+—Ø¾z\r›eàš†jŠ2­µdý^\0D¯‡k<Îw5¦à¥Pî<œbmlßšŽÛg1¬‘ø˜ßƒPÃ–z¾|¯ëvè¨\0àßÎÆãTÓkƒÅÕ]ÒÀàF\r¥²¢G>XÂÚ^A7um¶¦/r0Føº	‘ckÒ¬l&sUCP\0UžÃ²{o†çÎèÈ@Œù×Ó‘/£^ÉûÃµULž¡Î‡U@e°¼s4•C)±=‹Íû´Îº‘ŽZè¦s÷¨„Tn¤õ M&$Maó£*P	úßÝë±º:z\0ùL=›}µ7¼`õÌIN_xh¾(³’ÙdL]68\'x§ SÈ‚a¸ ì¼¸3ÕùµÁÆÆK´öMëþÍ½€Ø^èS÷zœn—Ž\0€™«›_kêæç³^hgŒ¥Ñàq…™j°EÆÀ,Ó\n‡ºV\\»\Z,¦j;i[!ÕòÌí1&Ú…ŠˆI\Z£•ÖDñnù\nÂ?¿7Csçt€ˆüJ9(+ŠõzZŠ1cñA¼Ïo\Z\nkñÞàœ mÎ¾³Ô»[Ê%B{ø²!½Å˜xnR0Ì~cä÷zŒn—ŽT –DžuûŸšªfº;\nË¶AL\\­K|ŒÏ™4«cO!é®ñßSÈ‰t$C§Ð3®MÁHŒ<\Z\r€HÅ?!;yC„.`êM:JG\0\0ªË;÷|5™0ÙÞÅfYdˆ´M$\Zz’fkËÈÄ`ZÌ™¾x$ÆKd<ér\"Œ$Ë1ò¿\0ÏÞã‘¹#:º\0qö¿°}åjx¦ÍÌK²DBéØ^ï›¥Kö€´ç§á&Ì„×5¤þ^FøÛ)Qýf¥£\0€ÿUŒùøh#tî4±=Œ´Œ3]f\"‘)ûÂ`‘Ò:¿g—´µüÿšz}E}\\ü&¥£\0€?ï›fãú/…JáŽh¿I7Þjâ””P¡¿£žªy€Ã>H^Ék£#éì¡/Š1m÷úÖ/n._býìin¹\'öÖvÑ°ÞÆúaïëH•¶(É\n;êõÃNw	˜ƒÍ{ J9Ú¾êçúœ·\0\0þÂ/l¼ôÊzVäô—C»6ÕÀ<ßîCHÕ×oÖ¨ŠÆÝ¦ÁÄÍ#\"ó=,õ3fþ·*úÙÃú!&¦¢Ë\\{æ“4åŒk_úÚ4¯mîÿÕ¿y Ï{»\0àªˆ<­^ÿèÕ¯½È©’õ\nˆûÿˆWT]diÚÄ# 	ª\ZŸ‹ÕFñ9ÌGÃÎ)gOöÙxùk/×ÙòßÏúý¯Oè’±»—¾ÊÎKÏ±ùìSÌ¶B8Á½»¾÷­èí\0|áz×pýÅ—8vß¹°ÑC‘¨­à48îa¦‡sé0õ¾=W¼‚¯•O\rÐÉOÿæ¯>í¦£mciEhf\\9Å}²þàpîû\Zôv\0À×!èNWÕl¾ô*k§Oa{}|+ºM;û÷Îö$öß>¯\0x/øJ9ºàôŠçãÿÛ¯Qn^þªÉ\n|}x…?\"BÖÚý^ÞN\0x	‚¨cðãÆå«,Ÿ<IÖ´ý…UÁ« Æ·LN³_½G¼GM`|’\0xOU	gNd¼ëÂ€ÿê¯³ñµ§É‹þË÷úGß-½ÜÀDí2ì\0‚`06·˜Æqã‡Ð`u{ô|`rwÖ£.Ôú†ªjXîÞ÷«ü»ßùÿøú§?IžpŠ>_ÞN\0XhÄ 1:#Æ0)Ç¼s¨k:¢}>ÃU]†C½ÎgeÃêþÔç³Ÿú,Ÿý¿Až¥åß\\»g¿öèí€›Ìpõz½MUSÏføÈØ0ë³»€PïÛ×Ç“Š³Ç,?ó\'ÏòÔ§¿À\'ÿÉÇÈm*…Âç½¥—}Ý½l€}dWW,-Y?¾ÊŠ²¬±j04 ã’f½kP•ÜLø¾ï8ÃòÁùõßø¿ö+£Y(\rTq„Ò¾·¢·\0<ûåEÔ³³µE¿_ðøcg˜UÊîÄ3žy\ZZÏ7U	V±9—2.>¸ÄOüÈÃ¼ãÂ\nãïü6¿ýOÿƒ¼é2¿û™GšÞN\0X²6e—B4¯\\Þ n<¿Ÿw<q’µµ%Ä¨ªF(z\'O,ñø£ÇyàìÏ<u™ÿò¿þ¿ùú3_bi`ArHû†° :€Þ¢IåÑ #\r€vÍ~X\'ø¤ªfÐ­ë`žëßÞ)ùÌç¾NñÌ%Ž_áÌ™cœ?¿Îùóë,/ƒ+GüË¿Ì|ö|ãùW0Z±¼w!‹Œ¶ƒ¾PÕ3|wïjpoÙf`·¤#€Ø#ÀáÞ¿‹@Ú®]ÝŠÁÆ¹ê€+×Ç\\º2æ³O½Œ}aOAGžÃ•BÈhlG¡1õªð ò8b>^7Ñ#È|8Ò\0ÔÕøjL±ræ¢â<0:•x\'æïmßšÎÃ=`n8ô`1GÔv!éD»QB‘÷ûzöKZ—wW—ué\0@QïÎ‘e¿dm~bÞ¬Ñ¤â½ðw[Ç%±“7tm…½Z»……ÆŒÁ\\ïw²ŒùÊéÎ_Qï>&&û2ÂÁv¡¸‡t4 þ¢ÂÄd?lûkß“õ–WÛÞ<©KG·[gšõ©sGêáÓ™µÒ¡“:NLokæ6@”\rÆö×~ÁVåã›é3øæŸÿäàh€á@O¡|\01?aŠ¥÷gÃµ^¾|;X3³‰-ZÒŠßXÚ­Lj }L³}¯øî4vQßq.£\nððU…äCòµ³™¯&ïöÕèÝ¾šþ¼ºæ)Ð_>Æ7ÛÄÝàû€ÿ±0½þ©¬¿LÖ_Aò>ŠÁU3°yoØî|Ê¼_K+ú÷„ÊžšÀnÑO+	æ5m‹Z%$ˆÆ“L‚Ð3 XFLn´ž}»kÊoÇ7	ø€_~›· Tx«`	øqà§ï›“÷±E04U…4Éz˜LñxY¿Cåfñ¿·2˜ÛÌgù¢S¿ \nR{zUÏìÆ¾™§P‘à–f=¬±ø¦\\RWý$êøÈÿüc`û\Z¸;¥·\Z\0Îÿ)ðç€G iKXtçê*4cÂÎ³Ñ0ó.lÕ_^ÅäyddX°°Ðƒ$nQ!ª7ÿ‘Œ>DPï™n\\¥™NZGÂïU-&8œ64+BÊÕïU_ÿ}àçA>\nüïÀåC½Ð[\0O\0?üp†=â:ÙaÂ¼îh9ˆE®®™\'ô×ÖÈ@ÂûºË¼ö”Œ¿&uD¿ƒ«+&×/SG‹u¢1à$&V™ôõ‚t›ƒöQ×à›ò‚ºêDõÏ#ò€ÏÎ0Þ9ÝK\0ðG€ÿøÑu‰.[ÒÝQDKŠî™ºþz4ÊL\0¯kfÛ; †á±uÄZ´‰e¡\"˜Û]O¥óº›[êÉ”ÉõëÔ“QûÙ>þAP#ˆ³¨QA?w25Ø	’÷QW£ÍìŒoÊŸÅû?‡ðë øûå3Þ@º\0È€~ :íóYÊœÑ,øìq}_kÑ§‘òz>‡ªÁ»†jwŒ±9K\'×ÉW†x§¸ÚÅf£i¹W\'Þájb|ÖÏÉÆ;—^¥:ŸÝ‚)¨%Q	µ6¨­…(C”(b2È{×àëÙP›ÙO©kþcà_#òwÊ›d0¾™\0°À¢üð=!P“ºo$f‡ÁÔ6x“œ´$R>³ø\Z	\0±ŒË{\\]2½±…oj–Ngéä:Ù±ï”zws­ôn¹j¬!ïçØÜPMfì¼r™ÝËWpå,\\$hHM&h²5\"óçþ$m=y¨[\n=ˆ²ø%|=3¾ž¾_›êýÀÓˆüMàÿfoKÞ\0ðAUý‹ß-vÞ\'Íì¹›6ý]k}nÅÛ6Ðƒ¶¬ï˜\ZÅ®U¼uÍt{‡j2eº½Ëòéã,ŸXgýôP|í¨f×xŒŠAè\0V•ÊîÕ-n¼ô*³í¡°Db:RIðÑà³[b’PÛ’s•N–:­ò±\n>þ6Qƒµ¦·„Ö%®\Z¿K›ò¢ú³ˆüuÊ7‚9o,\0”oQô#Æ˜ÿ ï÷Éûl“7*8çhj‡k\\˜\\{Ð±®Ãñ5®ùa_’­3JQÁ€0ÙØdvc›Ýå!+\'×X?³ÆÒúµõ®ö4Ç5Êhs‡—¯±{eWW \Z€¦©j˜ð}Œà}h,¼xà=^0±ÜZ¤¨G¥S×*ˆ€ä}²¼6%n¶û-Ú”¿ü4\"?üÞa³è\r€ªþ´ùHo0\\¬®Ñ_Y&ï÷±Yªñ§©êYM9-©¦U¨ÊÑ;e1‚&]¯š0qÐ!ÉMºV}ðÞ€Å{Ït{Ät{Äæ‹W¬X=±ÌêÉœó\\e“í+7Â®âbd¾ð22W*\n’¤WPfºZL¬KQã1mÑÒ-D\rûi«®GeÔ\nL> Ïû¸j‚Ÿî|¯úú_!æ/ÿÃaòé\r€ª~ÄZûáÁ±uVNžd°¶Joi‰¬(0Ö Niê:2†ÉKÄN)§U”ñÚ2Ñ}kwæ0‹4Üd×§%`I÷2W7®qì\\ßeûúÙ×lØn¶qm×ô7ŒG<øŸHÌ¯IÜÏ•#5€#Õ!JL0)QJÅ×B”Ñ`Ð´ZÛ[ÁäÜd³ðÕä¿GÌIàç‹W‡\0ÕÿÎföÃ+\'O²vö,K\'Ž³~êgÎ¬blÆdÚ0\ZÍ˜NJÊÉl†bñ^pÎà\Z·ÁƒË¿õLœýb‚ÑØnÔp³‹7_ë8Ý6´õ—°¿0 vãƒ^‰÷´ÑÐŒ=Þf	#™ÖIUÆá3µUK.Ü‡àºÎ]X“ ‚1\"yëÙˆ1Èò)šñu\\9þ°ˆ¹üâa°ë°ðcbÍÏ¯œ<Éúùó¬ž9ÍOžçGßÿ0ï¼°ÊµíšO>µÉŸßbsc„ªà4’UŠ­<^›yÔnoHöÁbŸÈü…-\\ãëQ¢¤÷Î)*e‰²£›Lº<Úio\"ƒÌ½\0M‰ø.[ýÁ^HååFcÃ£z0i-‚GÅ#j@¨EL?|®úàVª‚XòåÓÀU|9þKˆù/Þ-Ã\0=õþ//?ÉÚ}÷³|â.žãC?ñ$ï½¸\nÀ#g\\9^¸:cwTc‹›7˜¬Áä56Ëi\Z€yNî«\'ý);ß›\'¶ykí†y]€îãV&ÆwnÖyR \0Á­Ú¤P|µÝ4å\nü\" CŒeç.ˆ{Õ9\0Ô!â;‹R<ªáóŒ)æ÷TŒEïP1ôÖÏ2»þÂºz÷g@îZ\Z\0TõOØ\"ÿ¶µó÷Ó_^béØ\Zïyç¾í±ÕöšÆÃ¸§©[i«v²àO%mÌÔ@’iÆ\'·h(v7iLc.Ì>åÞŒà^í>½_`®S#Š@£’²ƒéy±i…qƒúØÍ\\=‚i™/â¢Ñjb•AÐÿÒ‚%Z²Þ!¶ X=Álóòˆ±¿À]º‡‡\'TxéØ	†ÇŽ“õ,ƒå!&ËÏ”ÕAèÕ÷™¯OyæÅ	ãYÜTÃ:=MGJòttúÞn]tAÒÅ	Ÿ£Sø·Ëø… ­D¹Í\Z|40ñs)ÆáæsU„õyAÝ\ZDïbFÆä-PŽ(Íòá\ZÕk+œ\'.Š=(\n\0ÖO}¨‡ê÷OœÂ{GVcøÆ•)¿þé-î;ÑãÚvÍ3/yùÒ˜é¸¢®B\0Æ5Jã q¿Úäš¾¤Û»A¢=ß”àYLÿv¿P¸`È\\¤wÐzñ¹ÔC\0B\\sÑéïÅrËhõˆXÔf¨Ëð®Fpˆ„ÞÄ.Óóö´.¬UKâ\rêÙ`“çCWU!rï\0Ü\'Ö<\\O&èú1@¨kÇÕë~ïPUí™L*¦ã’Ù¤¢žÕTeCU:ª©£©<Hèú)6Uö$æ¤óy‘gˆ¸Ix>ÈÍ6H3·¢”Ø\'º¸eÜ_ÐËBÖ©Ëéº—WÓòcö<&74.I×¸‘ú\nõMGŸö Ìcì ®XŽ-‡K9áš„‹ÀoÝ\rã\0O 27xšÚSMkFvJY¹‘ó!S—\rÕ¬a6©™Mj¼‡¥µ%VN®Åm[Y‘ßb6¦ª*M\ZB©‚k‚£ç\ZMÉÁ¸Ñt<÷±/vS3ûwK“wáïx¶×¹sfkŒtgÿ¼ùD¼Æ‡¡ˆEÕâ›Ñ°`5ìk›S\'æ[ßB”R¿á£wË¸ÃÀƒø`Ü5µ§.kf“U¡*Œ±xÀ7ž¦rT³šªt–ô†=”4[vv®]\0\0IDATÃÌÕè‹¥!C˜<´¬èvJÑéì£ŒkÂØ{Z»8§¸FCv0iQYËl×v\r:íŠúýôþ¾³ßÏ¯Ñä&¯ÁbÄ¢®ß€xÚ½üÜUTõ­A¨ê±Å\0“øjrq?#öNèð\0 à¡žÖÌò\n5çÂN‰©Î)Måð^YZ’å9³I2.ÌTïÁ%»\'6d\nÛ\0Ïû\0c:ž‚&;xAˆ\Z®7±opèévû0Ù|ÐÂý5|¾ó¨çóÒ™ÿ¶$ÒŒ§ìÕý{@\nKRšÈÐÕô~†÷\rBÚ€r˜´xUÕÄ‡ÁäC\\9~R„0=(ã	\0ú0&ÃKÆlZƒ­P54•b²hÔAúÔa:Ùe:ªpMrÌg|XÙÓFö$®ô1&ôü9èB«÷ÐþÅÅð¬x	]@DpÅs› »©T\0HØ(8\"\ZÔ†Ó¹ûŸÖøäî)’Îa„ãƒKØDÇ ¤]b~¿xAš2JÁ,’ˆ¶†¡¦z8É]lQ×\0X?õ!‹rÁdb2šÚ3—8Y¥ëÚ MÃÞCØ²5ksý&VhkñÛ6h²°µ›ÉÂnkm\\f¼¶z¾ë\nB0 ÓóóÇtm˜ÍéZ\r¶¥M¾>Ñ—×ö¿ØkHµÃèù›æ`bv+\r<b´ë&MuˆdÁP®KÍ­bfQÄbŠe@–€‹ÜK\0\0Cà‚ÉúHV bðN(gŽº®ëÛ¸½Æ˜ºj8W5¨7Ø´c–a³Œ¢Ÿ“÷sò^NÞË°y†Í#\0b*X%F÷}\'»hð¹&€Ì¹ÐÕ+` 1}žX4òdþGÒ÷HG\rtD¿FC3J\0U­dÒ¬ŸÏô…Ù/sO \rw%ƒx¬ÞUÑ@¢?¨Ï$\\‚`+±Q…>	ò‰ƒ2ïî æèªdýPüC´b,ŠEU‚{#6”Ia¬„4loXÐö(y8zy/iØ4{£ttˆ¸Î¡>z‚)ånãÜ—vˆN(àu¦äó§Yž¤IÛ4z^1ªIàæ Ð¤ë£Á7ŸÉIÿw%Bí*6€»U\'&ZÿsÑ/Þ (¶¿†˜uõ#·ÃÚ‡î\Z\0\"òbRôÛ\ns>ßR=UÕUÍ™‡Žóø{ˆÎhèu&ƒë¨ÊàÆI5lëkD¢•¶\n7…„0Fé†_7Ø§D†\'Ë>m\0©s>E© *à;U?ñ;ª‰\0pú¦E¤I\Zø”TÃ(ÑçG|ÌA…Z5õiÖ›˜/ð^“BšØU_û‡½6†xXÄŠÉ¤9ó]:M‰»t4õuªò,MåqNÛ™.Ð\ZI\'Aê£¸×n8€®®³^ƒ>H;6]\0Ì6æOHê<¿hA›ðd`>¡\n8Špï!¨s	=	M0½—È\\KT)¬>0¸“BÅÕ#¼«(úÇQš &Õ!âÚ2s¼E¥ýšéÖ“\"æÀžÀ¡\0\0“Dv4¢q×úµÖFiXQ•5UgZ+éç^€&(1›Ôñ>}~²Ò%H#tÉõÂoí¦ÎÄ:™¿·kx§Ñ\rÏù&¸¯I-x76…ú!ô\rˆtºÑ%õŠ?ˆ3~Î|U‡`B©˜V±f’è	)=¶Æõ1Øþ\n¨¿+OàîU\0òd9&ë&˜vÝšÏ~&ˆÂP˜ôµà“û‡‰ça6%#OÓÔÁYËºçÅÁs \n4øûÉx“tß¤\Zö\'ïYpC9qFGÕ(ÎÇÀR­¸ÆÒÔJSyšZqµÇ¹`púÆw$\\§;yJm§èž^À|W’¸ÄÍ§/`@‚o=;X±wå	Ü\0Žß÷³‘‡MÞ;kgw«³ábÊê™,dÁ¬Åy¡ñ2ßG: ˆ3×f›§Íã–m¦Ã§xÕèZuÒ4Šo4nØ§É ï´Vþ­ÂýŸÕÎ‹!»h3 úé¾Qr…ª/š\ZªÊÓTJ]jðŠJ^ŠŸ« 	YÐv×ñv;²è\nâcÈ;ä\nèxÙðX0¼½{8\'pw@ì\0ÜC&ëÏ[µ™nÓÆ‹éå É,¡*ˆ²ÜÐëYŠÂ’&ˆl›Ä§ÖLçÁù°Ôû0˜Épô®Ë¨ýx¬óçoFGçŠx¾ï%óE¢èâõí°ÔÎpI`)E3Mˆ”J5õT¥R–áÑ7\Z\râP\'¡I¨iÃ}HáñÁXµƒc)$üÈmpk_º[pÌ	É‰2wiËU:€0YŽW‡±ÂŽŸË†¢gÉŠØÔACÎÕžªŒIuoÒÁÑkò:=%}ºú:ì(y‘[òþfZÔó÷íý ÎµóÇèvÞg€¢E?„Æ½³¸Ê™§š*“Ý\Z|…±E\\0âƒ±ãŒ‹KÎ|X…ìS0ýU\\5¹x›¿è&º+\0òF†6/ªu“Þ76Ý¼,¾œâf7ðãk,­ô‡‚o”ºôÉ]¦Ý­k¨mÔ4éáØÖàs÷-\Zwé´ý;¹ø·ËüDÉèÜW™Ÿßê¹”\'ÐÎ}|º¦ó¼Í`iÅ°¼ž1»þ5F/|–l¸D‘Ãcì 4 ò¼\0|kŠí“\rÖ©w.?¹~ú¿Ü¸úwïØ¸+\0(ú°±…1Åp¾Ä+Yþ&“¡Zã\'Û¨«¨§×q“mJ³Êîæ1CÔ%-“¯iæ§Ùß!&Ž¢¥ÝÎR­ú=_xqâÞÊÔ=§\0íûZç‰¶­Ô:oÐùíZOCñ\råî.¾\ZQ–ÈÔ‘\rŽ‘¯Ÿ\'_;ÉãêbW 1v°Ž gQ=\'pW\0(Ç×Z:~)†¤\"Lb±ƒoføÑ|5	V®)p±¡BS×Œ¶F,v¶s\rŽ]ç!Œ®­;å;ÁE—,ñ%ùð{¿ ºO¼–4Øçµ6.°çº¶cÐž×÷¤M\rtžHßÛ5ŽÙx\ZŒiŒ¿f|jç&ÿ\"½ãÓ;u›ðM×%X²¥“˜l°<]~œ7\0yýqŒÅäý l\nõö+4“M€Ö;0B˜ÄÔðèÆ8¸LÉpke4i\'®…Pykø”6ž»Tš|zÑT›¹íÛO¼nTðu^k]º[\\«zóù¢Tèèc˜îlÓ”u¨Ð´ø%$°|5eüòç™]{Žáýï¡8q|p³¥ãˆ-@Ý»€õ\Zß|_:0\0Œù÷O¬{÷EÉ‡Á°ÚT”Ïã«1b{`óˆö@—·†ÑÆ˜Ù¤+…Ú÷ƒµ€4û;î]ôû»LhA¡\ZTeçµ}ÖíOº÷O¥ƒÏ[ªˆ›„Ã^ÆÇ?º÷H¯M6·CÇ\0.XùaÒÄfWî²óÕß¡úU–/|/Ø;<†dÆöß}{?n‘\0‘÷[1ö‚ ÙbˆÉzxW1»ò%|S† P»dk^¼Æ0„‡gã’ÝÍË\'VçÖr\Z#ˆ1ó=F`G„¶YÞt}‡Ù­˜ïpÝ@rë™›(1Iöü½÷‹ê^L-Ø1Ýç÷0>¾.®n]ß\nã¥0/…KkbºÜæx”é¥?D]ÅÊãïÇCì`\r»Û—˜¼€ºT?é¹M: Ð1Å“b²¦M—«+_ÆWcLÖ\'Õú§¼ç!;%qx[—nÐ[Y^ ÎÀuwìj¹9Àôükèþîì”=¿–ÁÀ^&Æ‡î‡í3Ë_ñíçk†ãk[T“YP¡Bœ,q}D§ÜÝ\'7;ë3½üÙÊ)–x/ÙÒ	DäAÖ°‹Émïc`^ÿ’}©o²ÞýbóL›_h¦7B$0Vã¶‹6Ú…	\0áyEmÙ¾ºƒ÷ayX:\\£Ôçqý@;žiZ\'±ÖC˜k“ŽÑyKº&¦äo¢½©zn>ï2½ÍdvïÝ‚VoºíÞCpÎsãÕkÌÃÀóÂ•nŸCmì±³K_DðØá:ˆ]76ˆ›¼]: ÓÔ“-s£_?ÖŠûn­~§&_b5ŽâÛ†¦Wnû˜,k#lí$ìà¦û¼ÆÑÜ›ãOâ^»×wTF×J×…›íC	{ƒ@Ýó}”þÂS™¾ß=Œv¯l1Û Öâ]ƒ¤ÉÓ™,–Ìw›idhSá&›”×žÇæ}#&ïÝiRð€@Ju³oŒ®å·¼o´o´\"k^{ßY¼™úöB	hü¡³IÍÆ«Û3&ñiÁÀÚ3“Ó Î«u:/úÅ÷@Šî3«ou0—,Iugx÷Kh×8Ýïûv¾G:êYÍÖ+×ã„™¯yHF‹Ð]íÊ[Z‰jLÆ/ýÍxƒº\Z¾©FOƒÜQÛòƒª€)Ø—«ÑåßÙyõó¿ç›Ê›\nÖNB§mú?&”7ÇÄFœ½Æ\ZÆ[3v7&ñúÎ@¦4ù^±ÜBwÀ‰€ØÃýVä§Ë_ù{ïïÛ[µ/¶U@éšÎ½ýÞ÷w>sþ}•ÍW®SÏª…æ–]{©Ýöž¹øogÅâ«	õÎUšjôÉöôE;Z+x \0¨~¢^û‡Õäê?Ûzéßþn¹sy*6Ã˜í 7eû’Ù¾Ð*u3†W\'Œ·«6QÓÕŸí¸uDoWÿvuð¾€ˆÍõ¶9??Òûº¿Õ÷Øš.h»ßIŒ°}y›ÑæÉldô¼`A¬\r1\rX»`Ä149ªN§Û/v÷Ú—Ñ»ê÷A6\"on›î&´\r|2qåN³õâ§®\rv.|×ò™\'(VÎX±ÅÜx	?“©v® Ó+?I«äãßº21—CÑD·\'Oú?½tÿ`>ðI··N‡.¾±}Ë‚÷±	ö{î9i‰»›cn\\Ý\r~¾&£D¾i˜]ÿ:+çÞƒØUê(D°¼w4åÈÍ¶_yyºýÒ§\\=ú—`>æ%ÕOÜñ.f€ê\'¼Èl\0Ï€ º1ÝzöÅÙöKßÚ_à‰áñGÎöÖîëÙþ\nbL1 «§l|í7A«~_(hÀET‡¸q­Á5Âòš™»JqðRuPd:Œní>ÝÃïý|Æ}äÂÃ\\íý¼ý@‘¤ÁüDØÝ˜rãònx“Rn‘ï÷Œ^yŠf´Ãú#csÜl›j²¡õxs·\Z_¿TO6¿¢~ö90Oý2ð20º_t‰Þå;¼ü€\0àð(èÐ\\û˜±ƒóågó¥“+Yo%›\\{ÖU£—¤X¾ï;Í‰wþ½µB&Å#9Æ\ZË†åUCÚ(s:¼è-,¾Ôôî·\Z„ðxSP\'‘îs.ÜR\ntßâÅÃöfÉhc—‚×¡‡°oÂµÞSn½ÈæW‹éæs›|i*ØÆ7åXµ¹Í‹ Ïƒ}äYà„­ëJÕƒU†ß5\0ÚÉ`…Ððù¡pøûÁŸ·šAæ ëBuÁd+«Kçß-k¾Ÿá™w`{«€\"ÆcòB,ò¢³Sh“	 ·bò­\"v{µpØ‡Ù{ïÓý£so€ºRv6\ZÊq	ÚÄÖ1\r hS2Ûz~ŸÝW>?U?½ù7€¯ƒ¿ŒAÆÀ\rëÀ%B°ç¡‰d”o\0¤SCh÷¾¬ÇÇ!aKžAZœÿ$TCqºâÑüØÅ÷±úàw‘/#+\nÄ(††,Wò^¨²Y\0À~`€E@,\\À-|íw]w†+Att\rÂnlAB…Òt¬LvBBb÷õŽf²Éäê—Ø}ñÓõøÊ—®©Ÿ|\rò¯€ù2¡‹ø6°Kí;ó	Äª·îW{ K†Àô¥x¬ÄÇ>Ç€ ß\nÕcÀ‰|xzupò‘¥þ±‹•û¿Å¬œ¹@±¼JÞëam(^ðËö\0â&¾.0pñ‚ý0 ûý±7Û´÷’®¨Ô…Y?›AS Ã5ŽfºÅôê³Íè•ÏMF—þp\\._ƒæ9ÈŸó<AœÑœI<OWì»ßã-\n€.e„û‰0`„u‚ê8\rî$Ô‚?ƒõ|xleåüK+ç®ž»0X:uÞ[Y%ï÷[«Ù¹¸Ówg:.¨å5ÕÃëRwv§¿»¿=\Zq¡Qµ¡q†zö*žÝ¸RŽ®<·=¾ò•íñ¥/nÖ£+ÛPnAö*dÏ|°óù„ Ò\'†Ï›aß4Û÷ýŠG\0\0]\nÓ\"ÔÕ&P$0	’áè)pÇ ^Ž#ƒµ|°º²têµ•3.-Ÿ:¿´rî¡åÁÚ©A6XÉÅ`ò°,Í+.­K1€ùnÏuï”&2”®Ë-õxž¦Š„–-®®©§SíîÌ&—vÆ×^Ü\Z_{qs²ñâµÙÖ+×ÕwÁí@¶ÙÈ5àÂŒŸfw:7É™×§£€ý(ë9s{a	XN‚?º\nÍ\0š²¾˜ÁÐfy¿¿~byéä¹µÁêñ•l°:ì¯\\î¯ž\\²½å¾)=[r1y&63b2ZÂÇÖ…ßt´w.®Óóê]åðsÕlæëÙ¬šìŒ«ÑÖh²qy§ïìÎv·¶ÇW_º^ínîx_Ñé.èò)Ø˜‚NßaQ¤7¼†X¿z;\0`ßÛÆ#©•x€h´¯¹\\¾GÑSôŒ±9ÆæR•vxìÄÐK}×8òþ Èú+½Î¨µ†¦ÏÊÑx’÷2uõ´\Zo\\Ýmð¾Ru3ß4SÕzÕ¤SƒmÀ–áo™1×ã3æ3û\r£ƒà­²eÌ­(…^’xÜ &_ê›ä	¢¹zŸ9ï-Ô–°ºÏì\\ÞIÑ—¸òÀï!ô,?âC¯HCÐËupió4ƒÓãÊä7‚M|“Ž&ýÿêãma›úûâ\0\0\0\0IEND®B`‚',NULL),(2,'Aparte la piscina pa hace una rumba pero laaa rumbaaa','2013-03-10','2','Empleado',NULL,NULL);
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
INSERT INTO `PROPIETARIOS` VALUES (1,'Juan','Mata','Cabudare','3242','2342','sjds@gmail.com','M','2014-04-02','C','23423','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0Ã>aË\0\0 \0IDATxœí½ydÉ}ß÷ùe¾÷êèsîcÏÙÝÙÅ‚ @<EÉ¦‚¦˜ƒ”ƒ²#)Øa‡ƒ¦ÄÐ?²,Û ® $Ø²D†9QaR”L\"B4âXp±8vÀžsv÷tw]ïÈüùÌ|õª§gw¦§wg{¿˜7õºêÕ«ªü}ówç/EU9Z?õ¡C¹ÏHðð\0ð¨ªžN\0Ç<À5Mà9àñ¸~/¾ìÒk=Ðû²CþoEzåÿ½ª|ªÅ˜eÉAÒ?\0 Ìˆè/\0¿|ø ¹7?á£·+\02àOxïÿ^Èdv©è\r(ú}²¼ÀØA=4Mƒk\ZÔyœw¨kD½xõ«w«êQïÏ!ò+ÀÿlßÛŸwxôv€€~Ð;ÿEä»‡+Ë¬_giu•¢ßGŒÅ{¥š•”Ó)åtŠÖ5ÎU4e…w\r‚€Š\0c@lnÔ¹÷:×¼W½~ØùEDþPÞë|·ôvÀÞû¿òc«\'sæþs,[\'/\nhjÇt2a:P—%Î9Ä‚íå`@êRquuAÐÅ ÏÒú\Z6/Põ”ãÉÃ“í¿ãªú§Äš‰Èîé¯¾Kz»\0à»¦ùƒ¥á¼ãNœ;ƒÍsÄšÆ1Þ3OqêÉú=²^w×44UE3«c\0P¯xç\0²¢\0ÀX¡®°vú$Î9¶¯\\û#7.]ù]õþgÄ˜Ý³_~—tô ü”sÍ/Ÿ:¦÷È{ÞÁpmA0YÆd<cwwŒ\"×WÁðŠk\Z\\ÝÐT%Æ@PU4‚¢\0U%8J@ã<ý¥!+ßòkgN­½òÅ¯ü_uYÞg¬ý÷rJG\0ªÚ;ÿË<q¡xô=ï /rŒµˆµÜØ\Z1+VN£ßï!FpÎQU\ruYSÏÊ ë=xçñMƒ©³ð~#¨ó`„¦¬PçPõdE\Z\0dë†ã÷ßÇÒú\ZÏús½§bÌÁ|±{HG\0Ü9ÿzç#ÅÅïx\'ÖZl\0°¹1¢7ðŽ\'Opöô2`ØÚ­Ø¸1åÆö„éh†ªâ½Ã7S[ÄXŒD„äŠ²\"\'Ës\\U3ÚØbõÔIò~÷ž¦,Y>qŒ‹ßó^žþÄïþ-õþ1æ7ïé¨Ü!U\0<èšæ£g/Üß»øï$Ë2²^N–lnM¸ÿüÈûæ»Ÿ<ÁÚrÎõíšó¥-žúê&eí©ª[YŒ±ˆ1ˆì½½¶ª\nFè\r† °s}1Bv¬@½§©j6^~•ÁÊJQN¦¿ä{ZD^|“ÇãÀdîõ89ç>²zbý‘\'¾ó]ùEFÑï3žÖ\\xè8ÿÕŸ~7?þ¾ûyàô€ÕaÆ#ç<pz‰^¿ÀØ0ËEâOou¼âÕ£êADð^ƒzp×4dEÆÒ±UF[[LwGˆ—¾ú³Ý1ßúCïãÜ>â÷‘{96wJG\0ªúc6Ë~ò±o{’þp€XK1èS7ÊÊò€?õÃñžGWÞS7ÊöÄ1-Mã[Kß{÷u>üí¾qt£ãêêÂ5®i1××Ø½¶Á¥g¿ÆlwÌƒïy\'ÆXÎ?ñKÇÖ~Ò;÷Á7yXLG\r\0Ö;÷Î>|žãgO9ˆeV:ž¼x’w?º~Ó›ž½<ã+/¸±[RUMˆþ9‡QÀä¤£K(MˆÇÕ\rÆXeûòN=|?ªPN¦Ø<çü;ø‘±=_2‘ªþXÑï}ï}<¤´1ÁÝ›TäEÆêê\0ß™½‡§_œò‰ÏoñõWwÙÙ™RNKš²¦)+šº¦©âQ×¸ªÆ{¿ð™Þ+¾ñ­tpMÃhs›e;–¯^ÁÕMSSM¦¬Ÿ;ÃÒúÚ÷{çþä›<<¢#ezçÿìÉ‡ÏÑ_^jà¼2™T¬è³±Sóo¾¼ËÃgúTçWJžya——.í°¹9b:šPMKªYISVÔ³2eIS–ÔUµøQ8ç0ÃØïYQÐ[\Z’7._a²uƒá±uj…Þ°Ï±ûÏ1ÚÚþ³À?yóGéÎèÈ\0@Uß“åÙûŸ;ôvÎÌ¦MÝP7žW¯M˜5ð™g3ªÚ±=ªØÙž2\ZM™&”“ÕtB=RMgÔ³MëYs>7“oÎÖˆò^/D«\Z1†Áê*ÛW7(––0Ö#\"¬œ8N^äïwÎ½GDžzSêéè\0ÀûÿpéØZÑëpÃæŠsžÉ¸¤ñÊlZ²±9bw\\\"bðÎSU5Õ,ÌøzZREÆ—“)ÕtB5™EPÌhªúµ>W×kC4°®£\'!d½œÉšéî.ý¥%PÅf–þÊr1Úºñoàðè-­­¡\Z;6wTeÍxwŒ-zT“ÞyfÖ‚ÐºnMU·â¾šÍ¨&Œ§T“)uY½î‡«W\\U‡Ð±„Œ!€Áf–É]²¼À7Ž¬WÐ_Yf¼µóƒbó¿Ê<°ð–££\0Õ“ÆÚ÷ö‡Ã¨§sšª¡®ÊÉ”\\T[± ÞG«¾¦®*šYIU–ÔÓ\0‚r:¥OiÊn³*Ê9‡TõB‰k©&SšªÆXbÈŠ>R¾ÝØì,pé\r—C #\0…\'ó¢8nó‚º¬QÄÔ”UE5‚o\ZÄf˜”ÀqçRÒ§j½j:£žÎ(§SšÛ˜ù‹_Dc,€¶n D\rSšÚcÕ€ñ¨É°yoMD¾ø7d`Ž\0Tß]ôzF½§*>úzÓÉ„Ùl†÷[e1³ämÊì¹äê•U°¢ÁçšƒUw©WšÆƒñ`Aœ`¬,Î¢àÀ{¬@Ä>‰È7pW¤úP–çxMUÑÞx&ãM]ãÃZ» þÕG npUM]V4eISU¬VkÉ@Î|åq¾ÆXÉhšVvxªÒ#¦ÀØìÂáÆáÒÑ\0€Èc3\\Äx¯ÔU°¼½ú`¡\r3E½v$@CSWñVnÞë~¼µ‘ñ±\0jÅðjðŒ1Œ·§ñ;\n˜¢ˆyøGâÐéH\0@DN«BS5!9ã=®tLwG€Òdy;û\0BñFˆïß®‘wóÄfˆI‡c±`LxlÁ¼ƒ ÑM´`ÌBIú\Zo\0\"1nïB.?êwU¥©›½¥Ý¿nÊõÞÞgšl†1y`¼\0P;°\0‚\0‰\0  €Âæþo	\0\0Ñª<õç:â\\õŽöÆ]1y˜ù6ïÌüð(&‹RÀÌ¥Á)<„\0\nó–À€÷Š¯=ÞG	àš\Zs¯Ab06Œ·H¶ °\0\"&¼fÌJÉ’ ÕˆyËÎ~8:\0PïÞ„”¬j(Ò8L±H–#&›…oó`\0š,H…4û;¶@2ãlj¡#ù¦¸[RÕ]Ó`LÖJ€ƒZôû‘Å}¾\0ßÂD/ ý]0ì±Úª#Ù^+ÑpOéH\0\0xÞ»ï4Ø\0h(Ý:\n³8GlÅ}GDæ‹Ù£\n¢è\Z…ù¶£ûS¾À\\W\\\"	\0<ëÃk(ÏÇaÜØ YÖ2|ÎüE˜Vÿç,Ø’¼¤\nÌ\\Ì«‹_:„oú†Ñ‘\0\0\"_ñêfÞ¹>êñ1ù#·²ÿoã¦s¦§ÃÞ|ÐÎþ¼u\rbI\n´ná<é¥ÃAëCG\0ð’z¿å}s•V¨Èƒ<b3ŒÍçb~/ó ¢1Hë$i±—ù]ƒPºë¾v˜qØtT\00}V?f–\rÃ{ ö·Æ\\Ž‰ÁïÏÄÿ‚=`ƒ*Ö Lö€™†ºR äŒ§À3‡9‡MG\0øC¯îß\0†àAî$útDº‰L¥£ãÅP$1\0¡\ZkcL „lWü_ý¦\rpHô,ê!éýJ\0Y`tLò‹1yÇ÷ïDm±G\"tb¦£\nöHHŸ˜ê(2%\0|<Š‰zÿÎç¿Ä*Æ„\0Íb gnì‘âþ7¡c0Ú®1Øu\rãª£üSž9¸‘úæÐQÀ3ª:t9=qÇCÛ‰ê‘f­íè“EIÑz{]Äy€(„†3Ä\nÆÄ¼´i¨§ÞÂy àhà\ZðeÐï*ÜA0HÄ´âž6€“E‘mç†aƒiEý>Bô0Æ\ZLb~|Œºi¬¡ÁÔ[šŽ\0jà	\0Î5­˜J´÷Yæ;§½“ÃŸg÷ÄØØ 2\\2¹õ¿\0‚…˜	\ZÃ\n6@lü<Õg+oìÜ=%\0\0|1tìð––è­,B]†Z¿¦ªCŽ õÃ#‰´>{ŠÛ\'Ÿ½MñÊÜ›ÛY¨4Jj ã\Z\ZkC¢\0I*@.?\rò–,éÒQÀ¿óÞù¥õ5sþ‰Ç@ ž–¡NÐ54³’r<f6ž0¨Î—‚G¦/fòR1Ç\\´ÆœMFa›ynÀd]æ6jk%èp4šG5\0<ê•ÕS\'Î‰1\\úêóLwv°yFÞ+ÈŠË\'ŽÓTåxJ]–hŸ7_}žÀ™çõçsPd­} 6Ãd³‡ù6I€,Hõ8	%ßòtÔ\0pøùÀæ+—Ø¾z\r›eàš†jŠ2­µdý^\0D¯‡k<Îw5¦à¥Pî<œbmlßšŽÛg1¬‘ø˜ßƒPÃ–z¾|¯ëvè¨\0àßÎÆãTÓkƒÅÕ]ÒÀàF\r¥²¢G>XÂÚ^A7um¶¦/r0Føº	‘ckÒ¬l&sUCP\0UžÃ²{o†çÎèÈ@Œù×Ó‘/£^ÉûÃµULž¡Î‡U@e°¼s4•C)±=‹Íû´Îº‘ŽZè¦s÷¨„Tn¤õ M&$Maó£*P	úßÝë±º:z\0ùL=›}µ7¼`õÌIN_xh¾(³’ÙdL]68\'x§ SÈ‚a¸ ì¼¸3ÕùµÁÆÆK´öMëþÍ½€Ø^èS÷zœn—Ž\0€™«›_kêæç³^hgŒ¥Ñàq…™j°EÆÀ,Ó\n‡ºV\\»\Z,¦j;i[!ÕòÌí1&Ú…ŠˆI\Z£•ÖDñnù\nÂ?¿7Csçt€ˆüJ9(+ŠõzZŠ1cñA¼Ïo\Z\nkñÞàœ mÎ¾³Ô»[Ê%B{ø²!½Å˜xnR0Ì~cä÷zŒn—ŽT –DžuûŸšªfº;\nË¶AL\\­K|ŒÏ™4«cO!é®ñßSÈ‰t$C§Ð3®MÁHŒ<\Z\r€HÅ?!;yC„.`êM:JG\0\0ªË;÷|5™0ÙÞÅfYdˆ´M$\Zz’fkËÈÄ`ZÌ™¾x$ÆKd<ér\"Œ$Ë1ò¿\0ÏÞã‘¹#:º\0qö¿°}åjx¦ÍÌK²DBéØ^ï›¥Kö€´ç§á&Ì„×5¤þ^FøÛ)Qýf¥£\0€ÿUŒùøh#tî4±=Œ´Œ3]f\"‘)ûÂ`‘Ò:¿g—´µüÿšz}E}\\ü&¥£\0€?ï›fãú/…JáŽh¿I7Þjâ””P¡¿£žªy€Ã>H^Ék£#éì¡/Š1m÷úÖ/n._býìin¹\'öÖvÑ°ÞÆúaïëH•¶(É\n;êõÃNw	˜ƒÍ{ J9Ú¾êçúœ·\0\0þÂ/l¼ôÊzVäô—C»6ÕÀ<ßîCHÕ×oÖ¨ŠÆÝ¦ÁÄÍ#\"ó=,õ3fþ·*úÙÃú!&¦¢Ë\\{æ“4åŒk_úÚ4¯mîÿÕ¿y Ï{»\0àªˆ<­^ÿèÕ¯½È©’õ\nˆûÿˆWT]diÚÄ# 	ª\ZŸ‹ÕFñ9ÌGÃÎ)gOöÙxùk/×ÙòßÏúý¯Oè’±»—¾ÊÎKÏ±ùìSÌ¶B8Á½»¾÷­èí\0|áz×pýÅ—8vß¹°ÑC‘¨­à48îa¦‡sé0õ¾=W¼‚¯•O\rÐÉOÿæ¯>í¦£mciEhf\\9Å}²þàpîû\Zôv\0À×!èNWÕl¾ô*k§Oa{}|+ºM;û÷Îö$öß>¯\0x/øJ9ºàôŠçãÿÛ¯Qn^þªÉ\n|}x…?\"BÖÚý^ÞN\0x	‚¨cðãÆå«,Ÿ<IÖ´ý…UÁ« Æ·LN³_½G¼GM`|’\0xOU	gNd¼ëÂ€ÿê¯³ñµ§É‹þË÷úGß-½ÜÀDí2ì\0‚`06·˜Æqã‡Ð`u{ô|`rwÖ£.Ôú†ªjXîÞ÷«ü»ßùÿøú§?IžpŠ>_ÞN\0XhÄ 1:#Æ0)Ç¼s¨k:¢}>ÃU]†C½ÎgeÃêþÔç³Ÿú,Ÿý¿Až¥åß\\»g¿öèí€›Ìpõz½MUSÏføÈØ0ë³»€PïÛ×Ç“Š³Ç,?ó\'ÏòÔ§¿À\'ÿÉÇÈm*…Âç½¥—}Ý½l€}dWW,-Y?¾ÊŠ²¬±j04 ã’f½kP•ÜLø¾ï8ÃòÁùõßø¿ö+£Y(\rTq„Ò¾·¢·\0<ûåEÔ³³µE¿_ðøcg˜UÊîÄ3žy\ZZÏ7U	V±9—2.>¸ÄOüÈÃ¼ãÂ\nãïü6¿ýOÿƒ¼é2¿û™GšÞN\0X²6e—B4¯\\Þ n<¿Ÿw<q’µµ%Ä¨ªF(z\'O,ñø£ÇyàìÏ<u™ÿò¿þ¿ùú3_bi`ArHû†° :€Þ¢IåÑ #\r€vÍ~X\'ø¤ªfÐ­ë`žëßÞ)ùÌç¾NñÌ%Ž_áÌ™cœ?¿Îùóë,/ƒ+GüË¿Ì|ö|ãùW0Z±¼w!‹Œ¶ƒ¾PÕ3|wïjpoÙf`·¤#€Ø#ÀáÞ¿‹@Ú®]ÝŠÁÆ¹ê€+×Ç\\º2æ³O½Œ}aOAGžÃ•BÈhlG¡1õªð ò8b>^7Ñ#È|8Ò\0ÔÕøjL±ræ¢â<0:•x\'æïmßšÎÃ=`n8ô`1GÔv!éD»QB‘÷ûzöKZ—wW—ué\0@QïÎ‘e¿dm~bÞ¬Ñ¤â½ðw[Ç%±“7tm…½Z»……ÆŒÁ\\ïw²ŒùÊéÎ_Qï>&&û2ÂÁv¡¸‡t4 þ¢ÂÄd?lûkß“õ–WÛÞ<©KG·[gšõ©sGêáÓ™µÒ¡“:NLokæ6@”\rÆö×~ÁVåã›é3øæŸÿäàh€á@O¡|\01?aŠ¥÷gÃµ^¾|;X3³‰-ZÒŠßXÚ­Lj }L³}¯øî4vQßq.£\nððU…äCòµ³™¯&ïöÕèÝ¾šþ¼ºæ)Ð_>Æ7ÛÄÝàû€ÿ±0½þ©¬¿LÖ_Aò>ŠÁU3°yoØî|Ê¼_K+ú÷„ÊžšÀnÑO+	æ5m‹Z%$ˆÆ“L‚Ð3 XFLn´ž}»kÊoÇ7	ø€_~›· Tx«`	øqà§ï›“÷±E04U…4Éz˜LñxY¿Cåfñ¿·2˜ÛÌgù¢S¿ \nR{zUÏìÆ¾™§P‘à–f=¬±ø¦\\RWý$êøÈÿüc`û\Z¸;¥·\Z\0Îÿ)ðç€G iKXtçê*4cÂÎ³Ñ0ó.lÕ_^ÅäyddX°°Ðƒ$nQ!ª7ÿ‘Œ>DPï™n\\¥™NZGÂïU-&8œ64+BÊÕïU_ÿ}àçA>\nüïÀåC½Ð[\0O\0?üp†=â:ÙaÂ¼îh9ˆE®®™\'ô×ÖÈ@ÂûºË¼ö”Œ¿&uD¿ƒ«+&×/SG‹u¢1à$&V™ôõ‚t›ƒöQ×à›ò‚ºêDõÏ#ò€ÏÎ0Þ9ÝK\0ðG€ÿøÑu‰.[ÒÝQDKŠî™ºþz4ÊL\0¯kfÛ; †á±uÄZ´‰e¡\"˜Û]O¥óº›[êÉ”ÉõëÔ“QûÙ>þAP#ˆ³¨QA?w25Ø	’÷QW£ÍìŒoÊŸÅû?‡ðë øûå3Þ@º\0È€~ :íóYÊœÑ,øìq}_kÑ§‘òz>‡ªÁ»†jwŒ±9K\'×ÉW†x§¸ÚÅf£i¹W\'Þájb|ÖÏÉÆ;—^¥:ŸÝ‚)¨%Q	µ6¨­…(C”(b2È{×àëÙP›ÙO©kþcà_#òwÊ›d0¾™\0°À¢üð=!P“ºo$f‡ÁÔ6x“œ´$R>³ø\Z	\0±ŒË{\\]2½±…oj–Ngéä:Ù±ï”zws­ôn¹j¬!ïçØÜPMfì¼r™ÝËWpå,\\$hHM&h²5\"óçþ$m=y¨[\n=ˆ²ø%|=3¾ž¾_›êýÀÓˆüMàÿfoKÞ\0ðAUý‹ß-vÞ\'Íì¹›6ý]k}nÅÛ6Ðƒ¶¬ï˜\ZÅ®U¼uÍt{‡j2eº½Ëòéã,ŸXgýôP|í¨f×xŒŠAè\0V•ÊîÕ-n¼ô*³í¡°Db:RIðÑà³[b’PÛ’s•N–:­ò±\n>þ6Qƒµ¦·„Ö%®\Z¿K›ò¢ú³ˆüuÊ7‚9o,\0”oQô#Æ˜ÿ ï÷Éûl“7*8çhj‡k\\˜\\{Ð±®Ãñ5®ùa_’­3JQÁ€0ÙØdvc›Ýå!+\'×X?³ÆÒúµõ®ö4Ç5Êhs‡—¯±{eWW \Z€¦©j˜ð}Œà}h,¼xà=^0±ÜZ¤¨G¥S×*ˆ€ä}²¼6%n¶û-Ú”¿ü4\"?üÞa³è\r€ªþ´ùHo0\\¬®Ñ_Y&ï÷±Yªñ§©êYM9-©¦U¨ÊÑ;e1‚&]¯š0qÐ!ÉMºV}ðÞ€Å{Ït{Ät{Äæ‹W¬X=±ÌêÉœó\\e“í+7Â®âbd¾ð22W*\n’¤WPfºZL¬KQã1mÑÒ-D\rûi«®GeÔ\nL> Ïû¸j‚Ÿî|¯úú_!æ/ÿÃaòé\r€ª~ÄZûáÁ±uVNžd°¶Joi‰¬(0Ö Niê:2†ÉKÄN)§U”ñÚ2Ñ}kwæ0‹4Üd×§%`I÷2W7®qì\\ßeûúÙ×lØn¶qm×ô7ŒG<øŸHÌ¯IÜÏ•#5€#Õ!JL0)QJÅ×B”Ñ`Ð´ZÛ[ÁäÜd³ðÕä¿GÌIàç‹W‡\0ÕÿÎföÃ+\'O²vö,K\'Ž³~êgÎ¬blÆdÚ0\ZÍ˜NJÊÉl†bñ^pÎà\Z·ÁƒË¿õLœýb‚ÑØnÔp³‹7_ë8Ý6´õ—°¿0 vãƒ^‰÷´ÑÐŒ=Þf	#™ÖIUÆá3µUK.Ü‡àºÎ]X“ ‚1\"yëÙˆ1Èò)šñu\\9þ°ˆ¹üâa°ë°ðcbÍÏ¯œ<Éúùó¬ž9ÍOžçGßÿ0ï¼°ÊµíšO>µÉŸßbsc„ªà4’UŠ­<^›yÔnoHöÁbŸÈü…-\\ãëQ¢¤÷Î)*e‰²£›Lº<Úio\"ƒÌ½\0M‰ø.[ýÁ^HååFcÃ£z0i-‚GÅ#j@¨EL?|®úàVª‚XòåÓÀU|9þKˆù/Þ-Ã\0=õþ//?ÉÚ}÷³|â.žãC?ñ$ï½¸\nÀ#g\\9^¸:cwTc‹›7˜¬Áä56Ëi\Z€yNî«\'ý);ß›\'¶ykí†y]€îãV&ÆwnÖyR \0Á­Ú¤P|µÝ4å\nü\" CŒeç.ˆ{Õ9\0Ô!â;‹R<ªáóŒ)æ÷TŒEïP1ôÖÏ2»þÂºz÷g@îZ\Z\0TõOØ\"ÿ¶µó÷Ó_^béØ\Zïyç¾í±ÕöšÆÃ¸§©[i«v²àO%mÌÔ@’iÆ\'·h(v7iLc.Ì>åÞŒà^í>½_`®S#Š@£’²ƒéy±i…qƒúØÍ\\=‚i™/â¢Ñjb•AÐÿÒ‚%Z²Þ!¶ X=Álóòˆ±¿À]º‡‡\'TxéØ	†ÇŽ“õ,ƒå!&ËÏ”ÕAèÕ÷™¯OyæÅ	ãYÜTÃ:=MGJòttúÞn]tAÒÅ	Ÿ£Sø·Ëø… ­D¹Í\Z|40ñs)ÆáæsU„õyAÝ\ZDïbFÆä-PŽ(Íòá\ZÕk+œ\'.Š=(\n\0ÖO}¨‡ê÷OœÂ{GVcøÆ•)¿þé-î;ÑãÚvÍ3/yùÒ˜é¸¢®B\0Æ5Jã q¿Úäš¾¤Û»A¢=ß”àYLÿv¿P¸`È\\¤wÐzñ¹ÔC\0B\\sÑéïÅrËhõˆXÔf¨Ëð®Fpˆ„ÞÄ.Óóö´.¬UKâ\rêÙ`“çCWU!rï\0Ü\'Ö<\\O&èú1@¨kÇÕë~ïPUí™L*¦ã’Ù¤¢žÕTeCU:ª©£©<Hèú)6Uö$æ¤óy‘gˆ¸Ix>ÈÍ6H3·¢”Ø\'º¸eÜ_ÐËBÖ©Ëéº—WÓòcö<&74.I×¸‘ú\nõMGŸö Ìcì ®XŽ-‡K9áš„‹ÀoÝ\rã\0O 27xšÚSMkFvJY¹‘ó!S—\rÕ¬a6©™Mj¼‡¥µ%VN®Åm[Y‘ßb6¦ª*M\ZB©‚k‚£ç\ZMÉÁ¸Ñt<÷±/vS3ûwK“wáïx¶×¹sfkŒtgÿ¼ùD¼Æ‡¡ˆEÕâ›Ñ°`5ìk›S\'æ[ßB”R¿á£wË¸ÃÀƒø`Ü5µ§.kf“U¡*Œ±xÀ7ž¦rT³šªt–ô†=”4[vv®]\0\0IDATÃÌÕè‹¥!C˜<´¬èvJÑéì£ŒkÂØ{Z»8§¸FCv0iQYËl×v\r:íŠúýôþ¾³ßÏ¯Ñä&¯ÁbÄ¢®ß€xÚ½üÜUTõ­A¨ê±Å\0“øjrq?#öNèð\0 à¡žÖÌò\n5çÂN‰©Î)Måð^YZ’å9³I2.ÌTïÁ%»\'6d\nÛ\0Ïû\0c:ž‚&;xAˆ\Z®7±opèévû0Ù|ÐÂý5|¾ó¨çóÒ™ÿ¶$ÒŒ§ìÕý{@\nKRšÈÐÕô~†÷\rBÚ€r˜´xUÕÄ‡ÁäC\\9~R„0=(ã	\0ú0&ÃKÆlZƒ­P54•b²hÔAúÔa:Ùe:ªpMrÌg|XÙÓFö$®ô1&ôü9èB«÷ÐþÅÅð¬x	]@DpÅs› »©T\0HØ(8\"\ZÔ†Ó¹ûŸÖøäî)’Îa„ãƒKØDÇ ¤]b~¿xAš2JÁ,’ˆ¶†¡¦z8É]lQ×\0X?õ!‹rÁdb2šÚ3—8Y¥ëÚ MÃÞCØ²5ksý&VhkñÛ6h²°µ›ÉÂnkm\\f¼¶z¾ë\nB0 ÓóóÇtm˜ÍéZ\r¶¥M¾>Ñ—×ö¿ØkHµÃèù›æ`bv+\r<b´ë&MuˆdÁP®KÍ­bfQÄbŠe@–€‹ÜK\0\0Cà‚ÉúHV bðN(gŽº®ëÛ¸½Æ˜ºj8W5¨7Ø´c–a³Œ¢Ÿ“÷sò^NÞË°y†Í#\0b*X%F÷}\'»hð¹&€Ì¹ÐÕ+` 1}žX4òdþGÒ÷HG\rtD¿FC3J\0U­dÒ¬ŸÏô…Ù/sO \rw%ƒx¬ÞUÑ@¢?¨Ï$\\‚`+±Q…>	ò‰ƒ2ïî æèªdýPüC´b,ŠEU‚{#6”Ia¬„4loXÐö(y8zy/iØ4{£ttˆ¸Î¡>z‚)ånãÜ—vˆN(àu¦äó§Yž¤IÛ4z^1ªIàæ Ð¤ë£Á7ŸÉIÿw%Bí*6€»U\'&ZÿsÑ/Þ (¶¿†˜uõ#·ÃÚ‡î\Z\0\"òbRôÛ\ns>ßR=UÕUÍ™‡Žóø{ˆÎhèu&ƒë¨ÊàÆI5lëkD¢•¶\n7…„0Fé†_7Ø§D†\'Ë>m\0©s>E© *à;U?ñ;ª‰\0pú¦E¤I\Zø”TÃ(ÑçG|ÌA…Z5õiÖ›˜/ð^“BšØU_û‡½6†xXÄŠÉ¤9ó]:M‰»t4õuªò,MåqNÛ™.Ð\ZI\'Aê£¸×n8€®®³^ƒ>H;6]\0Ì6æOHê<¿hA›ðd`>¡\n8Špï!¨s	=	M0½—È\\KT)¬>0¸“BÅÕ#¼«(úÇQš &Õ!âÚ2s¼E¥ýšéÖ“\"æÀžÀ¡\0\0“Dv4¢q×úµÖFiXQ•5UgZ+éç^€&(1›Ôñ>}~²Ò%H#tÉõÂoí¦ÎÄ:™¿·kx§Ñ\rÏù&¸¯I-x76…ú!ô\rˆtºÑ%õŠ?ˆ3~Î|U‡`B©˜V±f’è	)=¶Æõ1Øþ\n¨¿+OàîU\0òd9&ë&˜vÝšÏ~&ˆÂP˜ôµà“û‡‰ça6%#OÓÔÁYËºçÅÁs \n4øûÉx“tß¤\Zö\'ïYpC9qFGÕ(ÎÇÀR­¸ÆÒÔJSyšZqµÇ¹`púÆw$\\§;yJm§èž^À|W’¸ÄÍ§/`@‚o=;X±wå	Ü\0Žß÷³‘‡MÞ;kgw«³ábÊê™,dÁ¬Åy¡ñ2ßG: ˆ3×f›§Íã–m¦Ã§xÕèZuÒ4Šo4nØ§É ï´Vþ­ÂýŸÕÎ‹!»h3 úé¾Qr…ª/š\ZªÊÓTJ]jðŠJ^ŠŸ« 	YÐv×ñv;²è\nâcÈ;ä\nèxÙðX0¼½{8\'pw@ì\0ÜC&ëÏ[µ™nÓÆ‹éå É,¡*ˆ²ÜÐëYŠÂ’&ˆl›Ä§ÖLçÁù°Ôû0˜Épô®Ë¨ýx¬óçoFGçŠx¾ï%óE¢èâõí°ÔÎpI`)E3Mˆ”J5õT¥R–áÑ7\Z\râP\'¡I¨iÃ}HáñÁXµƒc)$üÈmpk_º[pÌ	É‰2wiËU:€0YŽW‡±ÂŽŸË†¢gÉŠØÔACÎÕžªŒIuoÒÁÑkò:=%}ºú:ì(y‘[òþfZÔó÷íý ÎµóÇèvÞg€¢E?„Æ½³¸Ê™§š*“Ý\Z|…±E\\0âƒ±ãŒ‹KÎ|X…ìS0ýU\\5¹x›¿è&º+\0òF†6/ªu“Þ76Ý¼,¾œâf7ðãk,­ô‡‚o”ºôÉ]¦Ý­k¨mÔ4éáØÖàs÷-\Zwé´ý;¹ø·ËüDÉèÜW™Ÿßê¹”\'ÐÎ}|º¦ó¼Í`iÅ°¼ž1»þ5F/|–l¸D‘Ãcì 4 ò¼\0|kŠí“\rÖ©w.?¹~ú¿Ü¸úwïØ¸+\0(ú°±…1Åp¾Ä+Yþ&“¡Zã\'Û¨«¨§×q“mJ³Êîæ1CÔ%-“¯iæ§Ùß!&Ž¢¥ÝÎR­ú=_xqâÞÊÔ=§\0íûZç‰¶­Ô:oÐùíZOCñ\råî.¾\ZQ–ÈÔ‘\rŽ‘¯Ÿ\'_;ÉãêbW 1v°Ž gQ=\'pW\0(Ç×Z:~)†¤\"Lb±ƒoføÑ|5	V®)p±¡BS×Œ¶F,v¶s\rŽ]ç!Œ®­;å;ÁE—,ñ%ùð{¿ ºO¼–4Øçµ6.°çº¶cÐž×÷¤M\rtžHßÛ5ŽÙx\ZŒiŒ¿f|jç&ÿ\"½ãÓ;u›ðM×%X²¥“˜l°<]~œ7\0yýqŒÅäý l\nõö+4“M€Ö;0B˜ÄÔðèÆ8¸LÉpke4i\'®…Pykø”6ž»Tš|zÑT›¹íÛO¼nTðu^k]º[\\«zóù¢Tèèc˜îlÓ”u¨Ð´ø%$°|5eüòç™]{Žáýï¡8q|p³¥ãˆ-@Ý»€õ\Zß|_:0\0Œù÷O¬{÷EÉ‡Á°ÚT”Ïã«1b{`óˆö@—·†ÑÆ˜Ù¤+…Ú÷ƒµ€4û;î]ôû»LhA¡\ZTeçµ}ÖíOº÷O¥ƒÏ[ªˆ›„Ã^ÆÇ?º÷H¯M6·CÇ\0.XùaÒÄfWî²óÕß¡úU–/|/Ø;<†dÆöß}{?n‘\0‘÷[1ö‚ ÙbˆÉzxW1»ò%|S† P»dk^¼Æ0„‡gã’ÝÍË\'VçÖr\Z#ˆ1ó=F`G„¶YÞt}‡Ù­˜ïpÝ@rë™›(1Iöü½÷‹ê^L-Ø1Ýç÷0>¾.®n]ß\nã¥0/…KkbºÜæx”é¥?D]ÅÊãïÇCì`\r»Û—˜¼€ºT?é¹M: Ð1Å“b²¦M—«+_ÆWcLÖ\'Õú§¼ç!;%qx[—nÐ[Y^ ÎÀuwìj¹9Àôükèþîì”=¿–ÁÀ^&Æ‡î‡í3Ë_ñíçk†ãk[T“YP¡Bœ,q}D§ÜÝ\'7;ë3½üÙÊ)–x/ÙÒ	DäAÖ°‹Émïc`^ÿ’}©o²ÞýbóL›_h¦7B$0Vã¶‹6Ú…	\0áyEmÙ¾ºƒ÷ayX:\\£Ôçqý@;žiZ\'±ÖC˜k“ŽÑyKº&¦äo¢½©zn>ï2½ÍdvïÝ‚VoºíÞCpÎsãÕkÌÃÀóÂ•nŸCmì±³K_DðØá:ˆ]76ˆ›¼]: ÓÔ“-s£_?ÖŠûn­~§&_b5ŽâÛ†¦Wnû˜,k#lí$ìà¦û¼ÆÑÜ›ãOâ^»×wTF×J×…›íC	{ƒ@Ýó}”þÂS™¾ß=Œv¯l1Û Öâ]ƒ¤ÉÓ™,–Ìw›idhSá&›”×žÇæ}#&ïÝiRð€@Ju³oŒ®å·¼o´o´\"k^{ßY¼™úöB	hü¡³IÍÆ«Û3&ñiÁÀÚ3“Ó Î«u:/úÅ÷@Šî3«ou0—,Iugx÷Kh×8Ýïûv¾G:êYÍÖ+×ã„™¯yHF‹Ð]íÊ[Z‰jLÆ/ýÍxƒº\Z¾©FOƒÜQÛòƒª€)Ø—«ÑåßÙyõó¿ç›Ê›\nÖNB§mú?&”7ÇÄFœ½Æ\ZÆ[3v7&ñúÎ@¦4ù^±ÜBwÀ‰€ØÃýVä§Ë_ù{ïïÛ[µ/¶U@éšÎ½ýÞ÷w>sþ}•ÍW®SÏª…æ–]{©Ýöž¹øogÅâ«	õÎUšjôÉöôE;Z+x \0¨~¢^û‡Õäê?Ûzéßþn¹sy*6Ã˜í 7eû’Ù¾Ð*u3†W\'Œ·«6QÓÕŸí¸uDoWÿvuð¾€ˆÍõ¶9??Òûº¿Õ÷Øš.h»ßIŒ°}y›ÑæÉldô¼`A¬\r1\rX»`Ä149ªN§Û/v÷Ú—Ñ»ê÷A6\"on›î&´\r|2qåN³õâ§®\rv.|×ò™\'(VÎX±ÅÜx	?“©v® Ó+?I«äãßº21—CÑD·\'Oú?½tÿ`>ðI··N‡.¾±}Ë‚÷±	ö{î9i‰»›cn\\Ý\r~¾&£D¾i˜]ÿ:+çÞƒØUê(D°¼w4åÈÍ¶_yyºýÒ§\\=ú—`>æ%ÕOÜñ.f€ê\'¼Èl\0Ï€ º1ÝzöÅÙöKßÚ_à‰áñGÎöÖîëÙþ\nbL1 «§l|í7A«~_(hÀET‡¸q­Á5Âòš™»JqðRuPd:Œní>ÝÃïý|Æ}äÂÃ\\íý¼ý@‘¤ÁüDØÝ˜rãònx“Rn‘ï÷Œ^yŠf´Ãú#csÜl›j²¡õxs·\Z_¿TO6¿¢~ö90Oý2ð20º_t‰Þå;¼ü€\0àð(èÐ\\û˜±ƒóågó¥“+Yo%›\\{ÖU£—¤X¾ï;Í‰wþ½µB&Å#9Æ\ZË†åUCÚ(s:¼è-,¾Ôôî·\Z„ðxSP\'‘îs.ÜR\ntßâÅÃöfÉhc—‚×¡‡°oÂµÞSn½ÈæW‹éæs›|i*ØÆ7åXµ¹Í‹ Ïƒ}äYà„­ëJÕƒU†ß5\0ÚÉ`…Ððù¡pøûÁŸ·šAæ ëBuÁd+«Kçß-k¾Ÿá™w`{«€\"ÆcòB,ò¢³Sh“	 ·bò­\"v{µpØ‡Ù{ïÓý£so€ºRv6\ZÊq	ÚÄÖ1\r hS2Ûz~ŸÝW>?U?½ù7€¯ƒ¿ŒAÆÀ\rëÀ%B°ç¡‰d”o\0¤SCh÷¾¬ÇÇ!aKžAZœÿ$TCqºâÑüØÅ÷±úàw‘/#+\nÄ(††,Wò^¨²Y\0À~`€E@,\\À-|íw]w†+Att\rÂnlAB…Òt¬LvBBb÷õŽf²Éäê—Ø}ñÓõøÊ—®©Ÿ|\rò¯€ù2¡‹ø6°Kí;ó	Äª·îW{ K†Àô¥x¬ÄÇ>Ç€ ß\nÕcÀ‰|xzupò‘¥þ±‹•û¿Å¬œ¹@±¼JÞëam(^ðËö\0â&¾.0pñ‚ý0 ûý±7Û´÷’®¨Ô…Y?›AS Ã5ŽfºÅôê³Íè•ÏMF—þp\\._ƒæ9ÈŸó<AœÑœI<OWì»ßã-\n€.e„û‰0`„u‚ê8\rî$Ô‚?ƒõ|xleåüK+ç®ž»0X:uÞ[Y%ï÷[«Ù¹¸Ówg:.¨å5ÕÃëRwv§¿»¿=\Zq¡Qµ¡q†zö*žÝ¸RŽ®<·=¾ò•íñ¥/nÖ£+ÛPnAö*dÏ|°óù„ Ò\'†Ï›aß4Û÷ýŠG\0\0]\nÓ\"ÔÕ&P$0	’áè)pÇ ^Ž#ƒµ|°º²têµ•3.-Ÿ:¿´rî¡åÁÚ©A6XÉÅ`ò°,Í+.­K1€ùnÏuï”&2”®Ë-õxž¦Š„–-®®©§SíîÌ&—vÆ×^Ü\Z_{qs²ñâµÙÖ+×ÕwÁí@¶ÙÈ5àÂŒŸfw:7É™×§£€ý(ë9s{a	XN‚?º\nÍ\0š²¾˜ÁÐfy¿¿~byéä¹µÁêñ•l°:ì¯\\î¯ž\\²½å¾)=[r1y&63b2ZÂÇÖ…ßt´w.®Óóê]åðsÕlæëÙ¬šìŒ«ÑÖh²qy§ïìÎv·¶ÇW_º^ínîx_Ñé.èò)Ø˜‚NßaQ¤7¼†X¿z;\0`ßÛÆ#©•x€h´¯¹\\¾GÑSôŒ±9ÆæR•vxìÄÐK}×8òþ Èú+½Î¨µ†¦ÏÊÑx’÷2uõ´\Zo\\Ýmð¾Ru3ß4SÕzÕ¤SƒmÀ–áo™1×ã3æ3û\r£ƒà­²eÌ­(…^’xÜ &_ê›ä	¢¹zŸ9ï-Ô–°ºÏì\\ÞIÑ—¸òÀï!ô,?âC¯HCÐËupió4ƒÓãÊä7‚M|“Ž&ýÿêãma›úûâ\0\0\0\0IEND®B`‚',1,0,1,'A');
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
