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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion_alternativa` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `foto` longblob,
  `estado_civil` varchar(1) NOT NULL,
  `sueldo` float NOT NULL,
  `fecha_contrato` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleados_usuarios1` (`usuario_id`),
  KEY `condominio_id` (`condominio_id`),
  CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_empleados_usuarios10` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,13,1,'saul','bass','1932923','1980-03-02','cabudare','9434935','23434',NULL,'s',2000,'2014-02-01','A');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arboles`
--

DROP TABLE IF EXISTS `arboles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arboles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `texto` varchar(40) NOT NULL,
  `vinculo` varchar(40) NOT NULL,
  `padre` int(11) DEFAULT '0',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arboles_roles1` (`rol_id`),
  CONSTRAINT `fk_arboles_roles1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arboles`
--

LOCK TABLES `arboles` WRITE;
/*!40000 ALTER TABLE `arboles` DISABLE KEYS */;
INSERT INTO `arboles` VALUES (1,1,'Propietario','actualizarpropietarioview',1,'A'),(2,3,'Administrador','administradorview',1,'A'),(3,1,'Area Comun','areacomunview',1,'A'),(4,1,'Empleado','empleadosview',1,'A'),(6,1,'Inmueble','inmuebleview',1,'A'),(9,1,'Novedad','novedadview',1,'A'),(10,1,'Pago Empleado','pagoempleadoview',1,'A'),(12,1,'Servicio comun','serviciocomunView',1,'A'),(15,2,'Pagar condominio','ingresoview',2,'A'),(16,2,'Reservacion','ingresoview',2,'A'),(18,3,'Condominio','condominioView',3,'A'),(19,2,'Cartelera','carteleraview',2,'A'),(20,1,'Registro usuario','usuarioView',1,'A'),(21,1,'Menu','',0,'M'),(22,2,'Menu','',0,'M'),(23,1,'Cartelera','carteleraview',1,'A');
/*!40000 ALTER TABLE `arboles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_comunes`
--

DROP TABLE IF EXISTS `areas_comunes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas_comunes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `costo` float NOT NULL,
  `costo_invitado` varchar(45) DEFAULT NULL,
  `capacidad_maxima` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `formato` char(50) DEFAULT NULL,
  `foto` longblob NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_areas_comunes_condominios1` (`condominio_id`),
  CONSTRAINT `fk_areas_comunes_condominios1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_comunes`
--

LOCK TABLES `areas_comunes` WRITE;
/*!40000 ALTER TABLE `areas_comunes` DISABLE KEYS */;
INSERT INTO `areas_comunes` VALUES (1,1,'AR1','Cancha','Pa las caimaneras',200,'10',50,'10:00:00','05:00:00',NULL,'����\0JFIF\0\0\0\0\0\0��\0�\0	\Z\Z\Z&\Z$\Z/ #\'),,,150*5&+,)	\n\n\Z\Z,$$),,,),,,),,,,),),),),,,,,)),),),,)),,,,,,,,,,,,),,��\0\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0C\0\0\0\0\0!1AQ\"aq2�����BR��br�#3���SC���4�����\0\Z\0\0\0\0\0\0\0\0\0\0��\0&\0\0\0\0\0\0\0\0\0!1AQa2q\"3���\0\0\0?\0�)��Zqs\Z�Տ1�\"*�m�JT�(2Y���N��jN���,k���P\0 ���Ԙ�(�R��W�̖�t\n���SL�\"���\ZG��{8�����=�Ƥ,�MH=��]���\\� �+gHUo!(��,**�+KQ�K)Q(H,��R�K��7PX�8�mv�p�c.��=wL�+�\0�!��ѳ��%=R��R�!����9�U4]Q)���\n��T��MCcJ���pi(\\�^Ji���+SQN���8t�R��X�B�c6���~҈b�\'B�-[�({3K8���TNJ$�8�#�� �LٗN$�^ b^�\n���*�N�g����/9Ȁ_���e��h�/�j�Ս�lpל�=5\"��Ɛ��\Z��9\ZhF�&BA\ZdA#ă@�<+�	v��D�`h h�4����FЍ�v+T���h\Z+����ey�3q>����-�Sm\n	���UvS0���QC��q��r�}ˊP�_���	�\Z<�mJ�	D����y��M�,�K3��K�6���\Z���{�s0	��Z�������C`���D{/g�2e�NД�aS�\\�Ķ�$��O�(O.7jY��-F}�Of�\0��AjزԲWp(��<���0G)ԛiכGRBVJ��K8��{�R���ps��Ձq���G�Ò��\nBH�eX�0(���Uw2���TÓm)WVE��j��N	b@<H`]�`M�>�/-�R��������	v�1SN\n\nX��.��R3R7�\\i���d�� ��,�\Z�Q��z!��kR!���,�q-O�,`��;\'SP�P\Z�I��>�WuRAt�Y�!?\ZЬA��W5BV��0�C�Լ��|Iʧ�4&�Hd)A7_�Y`C�I5}_W$��ԣ0�����C���	b^�]�D \"PE�I>���s�x5Iz#���Q�Do�z�%�7�j9���Ef�&�%�`,�C��×��:�мC��W���`b3>��Mb��sA\0���D:�5%Ì2�4m�z\0� @��<���\r,��B�$V�X!\"\'4\r\0�A�\ZV(�!�R�ڣ$<�F���n�,Ώ,�]X\0d\0zr�Ѝr���6�l�:ge\0=[\0�3d����Q��\0��\0�zq��Z�3dɻ}wZ�`n���|�v�ʻ��K���J�=�9�N^��<q��r�3�+�\nQ�W\nSy\"��C�0G�f_Z�������yA�H�@A)?��\0UB�X:,PIu��m\n�p��F��`��2\nV�Ji���\'�~D֘�n�L\r�5@�+TX��8cxǲ�Z\\&J섓.q�EB4���H$K�\'�Pr̆��3g���=Z/�D�@,��&������LH�V�\07iId����§�j5\Z�KK=�S4M뙤#��������GZ�QUĐe�����a*aŁ.��ev�����\0��7�B����KR�$��&��& �Ơ#P\r^�M4\nsP �G�&s�ޔ�|��u�	RMtr�8n��ީ~�E,xf5Ӻ;Y������R���bq)�֠���6��\n��,Is����\'�S-C��\0\00F�4C%wR�P[�Ӿ׍���[4���3����L��#��4�2�Mj�.ΥȬĔ�kם@��v�n�-7���:�k�Ga�r�	&R��(��Ffbx�L��t�6�OA5���\rj��S���G��;:�6�6ZTo8��S��.�Ӄ���=L��0 �I��EB�Ea�\r\nА��j���x	��\"恉��ͳ��gMj��N�G:���M���$\0���55c#��KBs�z� b��\0p��J�F3Q��<�NTi��|�`��\'�~ԧ�������?^��� W�����p�Wҙ�\'�1�Β�����Co+_�HU�ម�y��m�]���ҩ�*B�D�,���%���#U��,;&�&z�L������t�^����L�R���0$Uz�펬Dr�e�7çx��fDĔLJV�P�@y�^���wUzZS|=�M	,	=�vM��e���CyMe�FJ�����:Sٿ�>�R��|�1`B� ��;A\rE�k|}U�/i[%ͺ�1(IP)V%dd�� ��� P�h��\0V�n��z/��`c��[�!���q;Ֆ��7{5f���[fߜ�-KZ�PH��p�J�xa�gs]�eɊ+k�.�������9�l�[���)��\n���.�phZ������<Ĥ2�^eA����<�Fܝ(����G)N	9^Ŀ8�Ի�T���R\0+mĥ�i�P.�w|y�[2be����*5�4��\0��υ\0#8�$�*��I\n.�\r֥?.$�$�a��5�\nR�R�g�s�:?1�+�N�l�(�޾E�H%8���Ir��Ԕ�(��ю��C�>�x�&�!Ee\"��\r�ƏK�1�6ң<�@V�A�w�L�Vi�2K\0	r(��sۦ�KQGhz�<��l�9HZ��n( �����\0�sB�JSx�E[�-�*Z��WZU.{\"jI\Z\0��|�1H�^,�HJz�).�4�j�\\�r;FG\\���K�����\"%؋�L���V�v��q���U&�:I:ڤKR�O����uU���l�6b	K̖�-�9 n��j�aV�h��\0U�U�1JHc�V���>�2P�yE)gJ��q����]�Ӌ=�\0%e��$P�RI�[J�oGv�f�MՕ�5.[�gv9=c�m�&J�RQt\'\'�%Ȯ�&RLl�[i�4��+J��@ ���R�0��>_Q\n��_#�OK(P��������$1L��W��ѵ����K��m�K@Z��8]�ʫ�$O)D�d���ޔ�R�)U\n8��kfޒnJ\0˕.�7���b�u��s��\"Z��eb��+E�\\0/�ұ�,�T��}=���G�t+���Y�fV�n���V&�<�7���������*8�/z3�d͔��-S%���T���!�4} �)���\"�P�nR�IQ\'��{ag�J����?��JW&�<ɓ)K)��2ar@!)b�S�0�ވl�=�J�Q1\nB��J����f���GT�2a$������әÎ:FV����$Y%ui$�RԶ�N���a��ضY���Y�%l��!�R��0*h���S��Z�xꜽ�қ�r09��_��\"،IM0�a�:>���fR�J7�K�+Y���GMu�]g��&P�u�AK�W�k�QN<X�W�5d�H+N�3�#B|\"E�*Z�#��l�Xܱ�ĩ`	IN5�\"�Gf�������u)ĳ�+\r^p��g�r�b\nU�姄ktn�i��W̗\nQ)����Ե�q]U�ɼk�	gw\n1�b���6�!) 4�T�(P�H�h�Ӎ��ěZ��R��C������i��*��j��q��7p��ɲ�M���~c_bp	!4 ��������ڟ1�x����V$�,1��o����q\"��\"��P������H@��+��e�P�0�E��z����\'M8�rJ�����R~N~��#$o�TG�5ж�g��H*(5FO�9��f��	��\nSB���͵�g�E�W���x��A�\0�UQ�8(������͟��	4)):�W��i��4-��ph_��2�y�$�M���G�M�\0��He���D�H��8D�$h\Z��R�}�\0B��>�^�+� L*P\0a@!�Ѩ���M8�*��x�3mIn���KQ\nUN:���1B��5O�b���TOevV���O�|�pD��+��kЙĪ{�\\�\0\\p��L9\nq󍽕�&Y����*%C���c,�FP�����f� :0%����;��2�\nH2�\nS�:��^L����咡�M�F\r�,�E����KI�Ș�ƪ�\Z���s��W�����UOiY�c�=J�R?��#��h�u�΂�.T1s{���=,�.oT�+Jw\\�n�\\�/ɒ�!�R&TK��7���r]&��IH���\0ZHuI>|����HYU�����Tr/�4�9[W�����8���a�ɹ~}s����͗%ip���.]����zBؐs�?����;�\\Lp�vl��Y��u8EM�G�e6Z[�b�*MJA0D�&�=g�Q�����$����Z\'�D�MӉ=�R�/�1��Ķ9�&\\\0R�\0,d�y�Y՟P��[Gm ���mƘ�>����4JI��A\'\\��� ��ej=9p�T�Ӿ���_�3��h��t���*,��S`.\r��h/]U�)�X��~͘���g.��hs�^\r����H��$���84�]4Ss;�DETҥ�1\0>|��3�|��q��ĵ9q�`���������9��7%�t�Z�\"��%�\'���8�~8N�Wۜ��^����C\rYQ�\0�k���\0��^�1�F�X��{�~�$������o��Z���O�gQ�	���Y��S^.�\0�.�2��o�Z��?�<!��N��0	GC�-^�ڭG�~�T.*Y�9�C\'[֦�J��ذ��G����E�Z�4��B�(�<\0���S��0P�G���Z�Y�y�S\ng\r�\\�3����������������bV�2p=�P=Xp�\Z\'��~�?��}�:����\\�ʷ\\7��:�_Hd��Z����I$$�N%�\"�����\0��|���!����u=*��n�����].��\0��ҟ�s�c�\n�BR|�\0튤���1��\0��\0J�9�S�ߴRݗ�r�-�	����В�^�wi\rM�I�+Ao�)$�[���2�	��d�J�0�����N��e#-!�({�TĖ2˵x��8�c4���W�E�E.u�X�Vӄ����*�h>��C�1�Mu��i,]�x���fV�҃Q��Ʀ#������\r_���ɼ;ZD�!�a����q�.�絎�� \n��\0M�C�ȭ~2*K=o^�+u���%���\0�U	z$��\'Y��I��RY���\r`�\\a+*\"LBV`�����Fln��(�@aB�#���\0����i�����N�+��|!��JU�%�X\0�\01<��evi<�=\\�\0�>\"\Z��3	m$6�K�Wl��h�U�u��T�#!0���ë�	��U9_�q�RJ��\"��+[��ss^<^-X�馉RS�(�v<I�\r|j\"����^I����-�\'K��\Z��E+8�l�ް����y��_*�5�>p������ ���ǛE)��~~�ڜ�h��J���J\0KJ]�8�e�J.�)\\TI�&*_h���hk���DǊ�SE�>�Z��Kk��\Z�EL�\"݅U���C��\0z�a���n~��mYr�J����o+�t���Wh\0�w¦�\"�����G���{_6��\'��E �\r��_/XAj1U��j[�I���1I*�_��������T�ͤ�I��gt\nT�?u�~/�U�hҲ�9��(�kd��u3�C�Rj:��m\'�4?e�Y����I�x�k��ɗ%�S��yB��kmv,�\Zz��:�|�\r�y��<NUf��z�Jw%�\0y��v����y�RΪ.ܟ����*��y],�Bd$�\0�DqYuy�d�j�]J$�ɩ�fp���/ٶ$�Jn$�[��V�D�V��.Y6dٕ�\rU��b|�NŲ�˪E叉yr��b�XN>#~q�����+$�o�ViU��sHV6S�R(P}~���_P}>���r ��8i�1��zN�<��9�sn4�8d���τ_��&�D\'UP�7q��v|�g|Qޕ�\Z�|�K�LyR���};#��8ԗ�+!LT�Z��%��$2\0l��0���MgC�B\Z�߭iJ�(T�1;�h2����ʫv�]I�FQSs8�A_:A�}+��f7��/��W@�8��\\��OzC��9�c���>ԭ��-���w�B�9�n9v�Ɛ� L�<bA2C_ن�*H!J�rX9:_(زtbz���G�4���*�S,�!BI�&�������{�U=MD���\0TG7��H�g��)�/*��᣷�9]�AR�%��n�:��V[$���O-ٖ.���Ԋd#*}�s�R�1\'��7���n+�w?����\0R�\0�N�ћj�&�bԣ��O���Hj��!g�@HI��u\0�G!���7,]%��0��~��E��=0�K\'�1�c��ŀ���:\n��!�k�i�\Z@�L�̚��S���p��7OF:Qʵ��*Oa5\Z�|~�nd����\rL�N��}\"%I�|��.��/��MPj���\"�	g�\\;�f��@�\'���\n9��᫠��0���b4�I!.I mH�} fI�A�ff#�H��^��+�H!�ܟ����<ߺ���Ý��[�׻ϛ<��.��EU�<0�):w�\\�3��i��,��Rq��eCL	�+cC�d��\r\Z!\n~BO�8�&D�.2ǌiX�JP+{����d6^1$��Ji�_9�Kxϥ���x�\0�QU�h+gL�E�P\n\ng,b�:,����D��x�nC��3lLrǇ˖Tn��τmX��&OP� O���%!FWR/1\Z���\nO��Jq�vZY�jf��Ylr��1S�1L�ԟ�?M#\ZӴ&L��Tx���\\\n�TP.��J[-�j<��m\\��R�u$�r�/Eڹ��Ê�+�L��B�����߿8�g�ɓ���O�p<���?G�/��\0�\Z�\r7��˟�Y&�S!�b��1�e��N�չ�4�ďՖ�̆\r�\0��9���F��8�� !��$BL$�\n`يx��Ǜ��\0�1�N�p\0-SN^�(��|�*��!\rL�v̚xC�������A\0��h1\'����h�q�����B��p��ZE0�x��64-�P�G��\n�.��KyDSmiAl���MHӋ�L�I	$O3�R�۫wZ=.�\'(a�&�E	Xn<�	�J�K%�H��qx�Z��5��=\'T��H\'V0ED%\00Qa�*�of��\0&�s����3�#��G�p	\r�.yp�v}�9lD�1 C\n�S��;d!�ME�{ �q#6��1���F��aL�\\\0��TX}����ZGS%ՙ]j0��5�Vݱ6bܪ�!��5h}i�\"Yi����1s���|2�	:u���HQY��j3��0��{��¸7��HLK]{Vl��tHލ^�ʟiR��I\'�,m\'�|�͢�m ��]��-�W�L��!�XU(r���-}��ũ�*F����x���k/F��\0U��l���vR�����\Zt�9����rb�[���mY:?*UJoU_�e۫��\0Մ\'_�_��X�!be���>8yV!U�+��ɋ�Osy�=3���[\Z\n4-���_�^q%�8~��+*e���O\0�E$�w��D%�fA|��p������a:[�s�^CHbHg�\nyz�����>Z>\\3?Rs�f#�م���( \n�����Co\'x����������	`�^�E[-{�6XJ��_7��_V�n��z��CX��~�N#�f�T�2`\0�<��y�V��T\n2 �˵^q~ϱ�/�����\r羥�$n��R�Av��tΏ͖Qy`���⺁Չ��T_?H�ӭ�7�rǵH)����-�`�$��q-t�$)�Ă\\��^����K\\������X|H��pK��\\��̶\Zf2�(�tv����`5���{��(�+!��x��7�gI�r���g\0�5vq�8��fѳ�?Õy�*̜˼a&a��>0�U\\��V?���lLXb��`�>�/f;��^f\n��xGn�}��$v�L�Lt�I�3�B��\n}<�I��(�k�����}���/��\0=�B\ZA�G�\Z6ĩH\0/��ٶ,�{tN`q�=�8ܩ����,S&���2h8߳�Ii�h�	�.\"rAl8~�SQ�β�\\�.s���ݝ)�����ʶ��}��cI�\0Tp�2V\'�8%�&�N58�{�e*q��xB�Yz{�B\r�,ߴI1\0�yFr�yu#����M߯�1P9R�_\r=�I���\0���?hz���~Zd�O/���&2�.��8�Q#�rg7���j��9�H!�5:}���K{�D�:�H�g�e�nӾ�� &��-�bK�Б�b)�����$$�Ǉ���8ǔ�ѷ&�I]@EhZ�4S(�ر!� ���N�RE�7H	������A1\Z�X�1�c:e�7�����Mc��c�ᜦZSm��]QBR�)\"�Ơ�b+\\\\��j�s��M�����t�%�����W�D�\nU��?V�M$$������\\WH�T�̧���й�]iI�B��@fI ��h��P�Y�y����x&���O&��f���%�T�a����c��L���E���.��0D�7��OH �\"��8g���A��9]��¯�`�	���}!���	�>�!}�s�����Keø���C�#R�;J�Ibԇ�Hn�$W�*�!��B!�Z����;�,@�J<�ⵂ�A�Q����5���\' ���Nc��$)җ����%���#�$����������d�#V���Y��C�^x�>̚z���#���\0�\\�\\�j�����0�(��\nU2����/_��Ya\\�A���','A'),(2,1,'','Canchita','caimanera',1000,'12.0',33,'09:00:00','02:30:00',NULL,'����\0JFIF\0\0\0\0\0\0��\0�\0	( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z,$,,,,,-,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0A\0	\0\0\0\0!1AQa\"q���2R��Br#$b�����3��CS��4s���\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0%\0\0\0\0\0\0\0\0\0!1AQ\"2��Ra��\0\0\0?\0��,!V��K@ nR{P�ުFrIUgNY�����5	�*G#d7��H`%�Ek�[)�\'�m�=\"Scl|f�\\�vkXI;\Z�5��{޺�G#R��JR��;sjS���A?(�#���&&�[��/{*<�B1�N,W�y_��\'\'�M#ǧ�f�i��cY��[s��l�9��\"�-��N��n���r5;O��Ӗ������ӕ��❿��]�:� \Zn\\���?u�9�m��^��cH8����[�\0�ɽ���yz%=�����|��1n��9��\"�E*E8��-0�yhD�λA�I�5�� 4Ϛ��ceV ��mB�T��ZX.P��\n$�\ZD��`\r������a�Gi�p*oTc X��X\n�6B�����H\nGܧ�ܦ/�f[�b�ZPZ�SD���	��+D�b{5`�T���f�e�);dJދ[%\rj����J��aW-����s�������QVD�ԙ$/dl8�?�4��|D���es��>K ��p7�N(鋍��\'=�&�6蔜�ڕ�H�cc��C|���0�p�\Z-��-��s�9��@{�vBĀM��K�O�l�g�ă���6����ɗ�K�s51p-h6�s�1��\Zi�aT�{����7�AE��b��E��č}ӶR��k���/5.I���Q�2�\0�uͻ���Lk\"��1{_�r�%+�]�r��5&�镽���!+fs���1\ZXb3l�+�_D�����:�H�9�q�a#X�~Yf�$�H��\"�)N�q���*�GB��b��2d�C%Њ�3 rĀ8z#^����*LT>��b����� ��ʂ\'�]�����l�V��K�������u�7�Y9+��o���O��J��\n<.&�E�����Ex�0�\Z���4��ݲv�:M��8�O#e���\"����Mh����;d�ƀ8j�SN�h=|���:�Y)��TZEv����sݡf���G�9�6�=��\Z��t]<G����27\Zܓ}�%�znG�F�%���)�d�.��2M�(\Z�)�(��mhM;$���,�U�RS�\nK���Y�cu��\"������62Q�N�FНD˭a�Ȕ�o=��2[���Cº���*fܮ����;\\�e��#{�#��R�:ˤt&K�l3k�����x�֏o���xmM�,�����Hp�R��F1N��i4~�{X�����S�7���ͣ\Z�!��0a�A.\\�Զ��d�,u�򹥧�UQ�1F�dx��.!����.7�6���Û�\\�nI}�p�+�Q	�r߅�:�squ�6�1�\0�#[�W��kh)n�g\0�6u]=f��]9�fD7\\�qs�5�b��3I�QW&����ɮ>8M�$5�P��\0���&�xoRt�%�\ryϺ�Zo���(����h#��\0��S��.�7/��\0ER���#�v�qq�M�%\Ze�(��r�64^�?e=�eb��tG{�d�[�΍nX��\"�P�&7�,X(�c�\Z��%�Ԏ6�l`+&��餱VJFӎ\"0�\'�ޥ�i,��\0	Nb�8���aQ�M>i��3������U����+Ѯ�:�� �9� G��i�ڡkhKM���q�~�?\"���X�#$�\Z;�\0g���V:M��|�\'Ӽz��ޙ�м������;�%��^��x�aNY5������v\'����\r��2vY��-l.ҏ�f��B�h����V~�rF���YD�*�M%�Ê��f9^�dZ��1�i��YsͯR���F��7?@��&�\ra�u�f�%v�qŷ9|��1���0��&l�=z�����c��\'�����;\Z����FY�\n�F�V\'�\Z�8�Y8�)���e��3Ú��2U{���2�N��,- V�L�NY%�_u#��\0�5�=��JDy��h�\r�쓙��lQ7�p�\r��\0ԞJ:�������^�E�3;i��\r�(Ό��S�7fNiB�F/����L�B�]�as��H\0t�\r�7\08zGb\Z��ڰڢp��\'���ت��f18�I1�o�����!����k.6�3<�eэ���C�\"ǁ���N��㢋al/.�s�p��U��J��\"6�.ns86���{���.ũ�c��\0k�I���D�i�������Y��ϝ�SwO�Ň}�m���QMu��n�V�\\�$�}Ϻ���[J����8*��دS�	3�͝e�k�-EiHkQ\0Tf(�9\r�m+wIaJ�`;ٳar�m�A[@��Kh��rL�1�W�K��c�L��Wp�cu7����(�,��~V[������s\Z�����!0��8���+��\n��a��Iw��\'<�G�]�e�OF���Ԑrk����y�9+�<\rcCֱ�X5�5�p\0dY\Z��7G�UT�v����G!a/�ZX�e�Y��q}���N@�7�LK\Z@h�\"��!���Y�̝��n&�/A���l��Ƌ��~&�>-�{��kgv����6�]KoQ���o���C��/7<z���W�.Я���6��a�a��p��e?=#$nv7P&؝��ÆV�t��u^��Uq]���wۘ���T���֙m��8���ʅ��M���76�BO�\0}\\������ۋ�WW�sXg���ÃG��{���v�Q�R�E�Ө�>#\"�խ�vn�uu,���p{�\\�@��s&7hs�m�W\"�t���d�s�g1����{R�tx1�V1aE	\r	`,�\r�)��� F��E@ib±1���iL2H�n�?a��\0^����f�6<����x��f�F����O�3`�8$�sA�G�Hͱ2ذ���uv��2CWZI�D�*\n\n�B�Y Z��s�#��l����T�:�~����w*�GXS5�������..�u�ur�	 }x��7�uY�$�@ƴ��%TX]ք��������mNٕ����\'3�{�:�ެ��=�e�,��r�,{D�N�.�\0�Q�l����|FVRݕ��ki�#3T���C��b��������W��^�{���\0N3�.���p|޺��h�pڮ�+�+�}���؟ ;�_�ӳ]�S��4�^98�|۞Y�s^�`��3&Yd�����\r�~�P�=�,J<Ȏv���m�~&�ݹOl���q���i���&O��]*�e^�u����͝�tN���\'�]c⠂���ǀ�b�\0�G�s�u8��]�Dn�Ӹ�\'���Zx+�\Z�����ٲ��b�7� �/> ���\\(�B̉!Ɩ��X�J�꽑B�!�|1�4s����s楛����d���R2ǈ&Ą��>�G�s\"b˂/��tO�9]K�RFh\r77�G9�aI!l��J@\n9퓗)�e�fN>��o��+������eT��_6��\\>�<��nOvEF]���4iJ�;%�T>	�����&y�u��Eh�9���op�@�����H�tƵ�T8�����n��{J��k�4�2\\{���\0)�+�C�l\0�>�}_�B:\np�b�����J��v��)�q�8�%��fW���ҙ��-kLk\0ot\\�{��#r%�Қ��c�h�n?����f��\"�!�-�R<K�\n�Dmm�OU��&Jù�sPy�����J`g��4����-�\0��q�Q܉E��� �R�]+�ތ�*ET-kb�\'���.K��់O�ޘs�%1����c�J9�.g�(��A>#B�d�<��,�� �N`筐ce����Ǧ@j�#@�l��D)�K˒I)���5\0��v��<���pm��^~��F��D>\Zx\Z�nW�ۓZ�~ew�W`��=ֱ�w�kI?E���Lw�O�]z��7�J�Z�G�\0m�Z��s4�B��W5������cǈ�u��z&�lMk��\n��F�6���bB��6��)}��L/Zķ�*ɈH[X�	:$�B���ܛ����Kh��ӝ�ںIa?�&3�V�L>�z��\'0���udB�t��\'���\\�=��=s��fN;f�&ҷ�����4S��mb�O_�b��[��4ů 皓�x!&+���.�Vֵ�8�87�����B�1��\n&� ��i��NW\r���z$�P�u�>\0��;�y����v\"�Df��\Z��;�v|Dy�-Ĥ�v�Gx�Af&�q�zCYh��$�e�*�6b7��G��ؕ�6ؼ4���=,�/^�V��;�sb>��w�q��٠�^=��\'�C����½�]��y�W\0�W��y���6̇Lo!����\0��O�ٮ�\'Ɇ�\Z��h�ߦ!H�D\'꘍cY$��Nnm�GA��$�X�q���>�B��ڢ��\0�\0�M�\\���1�\'���W:�ڈ2��߈L�����G݃�t��	s�;�9�Q�*W_���	�j[���~�/����bZZz볲,Yi�T��% �\r�]��q��?��R�Oq��a�r	�2�����L�؀E��5��A�ݒa�\r��A�c�]p���]!�)�i���zV⩂/�<�r>�H��������S}h�v�N��\"���.P��\0�[�C�C�Ԗ�l�uw�8[��>A��\n펥 �w�\\��l���=���~�_zQ�ة��$��э9��ol�\n$��.6Y���!Q]����_�Zl�:ؚH���)K�4ք�qC�ۊeUSl�`9s�v��E�sny�Qu��8˾#�����>�t���lo�<�>\'4|�Z�Ht�w)�c.��|V8���[��R�ɚ�\';���f��I:�����7O�s���ų~Ybw���\0�_��pU���l�����\0���옏3�b�b�b=�+nrS��KZ.rLCx���Lǽ�ܑ�s��Z7��w������~~?U��� ��Q��W@(ߞ�H�ަ;A9�\\A\0�_`n��(>�V�4U2ol����r�6�_k<�����I~Oyp�!;��|�呴��@C@��4�4p:h�P�?weHş1�2p\0|��wlퟍ���t�k2,\ZX��dV�Ժ��h�N=��jꬶ��������$�6��ۍC����2���a#]�dÚ[F��~$��tr9h����%aq��p-ݾ���	0�KOW<B���=��f�w+�-~t��cz��a�v�4�T��\0c�ȏUfs�\"����{�}U�pC�\r{%�,\'-E����&����V��n�-?nEVї�,��d�T�d��zs8�o��f�WB�lh��\ZM��������%�I�_b-�I�qqqT�\r����5�[�K-�@����z^ֆ����x�6�S��s11��z�&�Xr��|s>W9���>�Q6zͭ,�H�}ɵK˞{\\پ�>��%4�p�#���r�!���p��P���E� �?��6�\"�H���\rZGen�I����=����fq�ǡ\0����}�E^\r���ݬ�G�c��W�l�_5��B8�)��o���*[;m5Π���t,p�Ļ-�G���]{�RBcP���d�;F>C��.%�p�:�U���lH��E�y�F������ww�R����ѝ� ����L��\0\0��\nf�Y*�s�n�gZ�����}\'��.�1��l�3.���\nǶ\\���v��=�B@8�����\'i�΋Ii[Sf��߄��� ��w��OF�7�FW�#��d:�8���)k�\0喂��>گ��v#�}�Q�,���Ai��8��Z�%�d�l�sM� Zy�����uE��x�d���\"�\r\'	ۢpiȭ�u�)R�d}�/�E���j�����1����*Xj�26[r�2HcV�RQ�\Z�f�K&�Q�g����<��x0VU7�D��\'�;��m�*y�;��ұh��~����sA�.��5�~��&�����v�����Z��6�Hu�g�n��C#��<$6����M�AR{>L��6666�\0����y؄9��[c���E#^y��ɸ�Tǘ#qZ���QɈ[z\03[pP_K��)J� 2�\'\\ux���\0�l�K�>�j��R�C�ps�E�`��/n�w�K�=2{����1寐��&�\0\ra#V�Z܊NIhj-���Œ�\"����X�\r����m�&)f�\'�&A&�1���1�s��s:_D�CH�}\'؁➥�>�~w� ��:{�\rP�*�!n\'cc�]kd\0��\0��z���k� �k�&4��`���~t�m����G=؟���Ž��`m~g��r]��[6��@ѹz\"�F�\Z��UJ���7R�mϐt�\r�#�\ZA����pG�F\Zh�I����m�ִ��ϳJ�]\"��Y�^��@����g�:n�9yY\\#i[&)z@�UG%�2��9�#Ю��6�yŻH4�\r�Cu߶%h�p�us��C��ޟb]�;�l�,� ���-t��p��*Eɷ��*�Я/<���T��?n.q��L�hC@ݝ��tP�e���z�e������}�,�E��R�����h��7�ݶ��5��	�b-2�8z�?��v���~m7\nR��@����N��I�E������ӈy�NzI�\0\n7�_��7�X�);��z;͈<S;���r\\X���#���\r����eם�����<�_�:��fU��0�\'��w����5�\\��\Zc�(xw\r��m�x�iԀ*s?�l���I�j�j[L�odm�+��C�\0�:��;��\0UҺ=�{\ZJ��.-nM�lo3�g��eK#��z���M�e0����:��>EM�!ݼ�6�״S;��4�\0Y�cI���}WZE�8�@́l��<��8�#lI���Z�:�>��LHi7Q%��2�a~Ds]PZ2���Ȏ	�X�dW\0�G�2s9���y�Ĭ:��\0�%q:�<��� �����Ъ�tq;xof|Y��X��:�GU�m4q���^�e�����`������ܟ0�ـ7b��-����K@���(�>�䠱c�a��\0)�DNsH�9i�[s��4������>��E#+�#�vV���cZ�4��Ab���� �Z��v���\\s�z,B��','A'),(3,1,'AR3','Caney','para los baby shower',200,'10.0',50,'12:45:00','02:30:00','data:image/jpeg;base64,','����\0JFIF\0\0\0\0\0\0��\0�\0	&$/ #\'*-,,150*5&+,)	\n\n\Z\Z)$$-,,,,)*,,*,,,),,)),,,,,,,,),,)),),,,,,,,))),,),),,��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0D\0\0\0\0\0!1AQa\"q��2��BR���#b��3r���DSc��Cs���\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\0)\0\0\0\0\0\0\0\0!1AQ\"aq2���#��\0\0\0?\0�B\0�!\0B\0�!\0B\0�!\0^J�\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B\0�B��́�s��KH���?w�����\0�c�g�i���w-F�����l��^p*\0	l��L���<CuyF�)��C4!P`!B��4h���Zt��4=���kOU3R\0���]��C�ǀ~軏�P�}�8ڋE1����l<�JVU�\"��)�n��k7=9��i�|8vj?y�������=l���	q��n$��@�3N��7>Se~��e�,�Y�[Z�G��-k]��`ޜU���&!q�v�����t��+�2��8�K1<#� >j�i����9B����Ľ���U	������f\r�0�X�8��>�rDw��)��h��~�(������,�WݞU\'�ivǨN���\0�k���\01��-��e��_t<ogbB�`�����M����\Z�:���*Հ�iWn�Ok�Cq�7j%�q���)�^2Z�B�/tOO�����i�\Z�gX ��쫑U��У���C�h05}��o���{,\'j�T\0�k��m}��>�s\\�\'���k@.��\"Orw�m<6[�fX�\rJq�8�:��g;HC��D�M��=����$��q$��ߒ��Ҫ�j�P� �B�3��Ԝ�mC~Gp|���ƻM��M�ް����݃�||�<}\'�dj؏�-�<\\�.��d��\r�Q�#�.[�N˻�\0�r�������v��\0t�;��;����\nyWւ\\��8�\0����9�l8��W7��A{�H$�m��Oh�6��=��ic1ƫq\rѡ��p\'F�0ҥc{GX�C*>� � �¬�*�C1$�w�4��{=��2w�s�V,d�3��),�$H�4ʆVM�L�[ �N�\"\0��~|T\n� �M��Y1t�0���E�Ԁ��*\0���opA$���˛\"��\ZqA�>%�p�m��?��Y^�}^\nÊ�K&ǀ�Lp��G��{z~.I͏�T\rMh-�-x;�nH��Dm\nN���W�4j2�i��q�\n_�?��e//%�~�\0{���J��槱.i��{�{�o���F���R�,�p������ꭸ�J�tΗI���&Â�ܢ�o��x2�b؈���`��=�$l����x6a)�2s\\��O\0��v!K9]0C\0`,\'k��^U�k\0#�(R�S�E�!��[ŋ�h�\0[G�z.���6�C���H-2�W�11�h�j���yMǿL�-�t���B���ǫ�47&]���9�{O\rOS�ٌ���\'a̛*����bj\n���h��CK����7<ce\'	�=�\r|Wz��}�b	\0y�nfwMK����򸲕^�� -���+�\rk\Z@2�=�ּ�<��e����۸o��H�`Л�*uA4�c���IjN��-���n���3����XZ�g��R2��ͥ���k�l���c�$Ȗ�w�n��wg�L���5�Ox�XC������2T�T�B��(ԯ:�S`���tG#�7-���v2�:�Z�-/k�A���gJ�g�J����1\0�4|!�_Ud�JU��ipA�G�᳧�쫥��J������P�x.c\\@7�)�B��\"��O�=�����D�6o \'�wH*��p@��dYٳ.���������^4��!�f`�f���������tn$��[j֡@K�M��kixM3쨹�4��k�pD8;�A�Ug����8ۀ7�oq�Xs�L���.��$��`��d\0wX6������\"f�Y�д������s�n�x�p����$E�à?��(���ț_n=7�Km&;���s02\":��+*ytpWVd�� �G���5)` .�0�-�_�wvQ�����\"8�\0U&�[��D���z\'��`C��Źj&?Q���(��Qv�UQ�-U2�QjӋ�,�(�5�K���t.�v]�Q���O��oQ;��ANqt�8�F��q��)�\r��˗�,�IE?������S�A��]��i�\Z��#I�1�ǎ�j����I���GR�cjT2�/Ae�w#���-�}����{A6���\0�J�i���Ѧ�	�A���*�S�,]x�H��y�C}MϐW��{:�B��Ya�\0q��Z1d�0ɻIB���v���v���{۝�+`T������xq����o���]�[��杲�=�EP����N���_��J{Z_�b�W��p{Z|��J���\0j�:��s�Ȃ�5�;��\Z�s\ZA�@3�d۫B�c��LӇ`*�%����R�V����Z~n\nR���^������#��wi���A�����v�J�g�k�x�;ػ�GP#�R3\n%�hp�_49�u8���g�\\o>*}��{Ϗ`O�WXMH�v,�a{u�q��]O��Fh�\0�m�2�U$q1����\n�F�����\'�ۤZ?�.ϰT��~��$u�X��>\\ݸ�]��Uk����\0\Z\Z�tK�v�\Zz�Z2cQB�\\��\\��p�3����YS�=��;�x�t��w�\r<�$�&��k*�\'�;xx%$�H�&��t�Ygf�L�I�D�|1ˊ����E�f��.htUl�&k+i`�#o�aiTp!�$��p�M��wE~�rvV!�Z񳛿�AW%{i���nf� ���\\��eto��8�c��H���T\Z�10�dԪ�i�[�a!�Χ\\�\0���x�l�U�Ѿ�n�q��K�MV��~H�=W	V*����D���&� M�q7�x�����Oi���-��?�^JB���i�y���������V�b]��Ɠ��$���_�揨I��8���n�R�QD���;��/�����i���͓�P�c1�v�	�[k�[r����\'��KZH�eG�Åi��>w�����ǵ��axf�\"S�;���PU�pf8��,puJne\Z�4�\0�L �u���V��D�1�#[��\"&�Q?�\\L�c6��¥(�\Z;m�e*�Z�\0-��|M����\\鹌T���-%�Ö���j{j�sZM�4�$���wv uH1ݲ�w��>�$�\\c)><q���-9>b�D�A�\r�\r#x�A\\;5�\n�̆�KIw~�����bf��\"d�d�6��L����1�i�&G\"�ˏ��Ml�r~��\\�/�t��7�q�lOu��h��d>��Z�#�;GT�(��0Z$��=�H߂�akG,3EpƗ8�@�N�\r��9�n�V � ��7�\'�lN�j�۬��0�A7�-\'p�;�\'�,����`�gw~�N���\'+Ъ�0��7���t�9�o��&�%�E�̫\n[*�#(�����������E���|�V,.a�]��N.�&�G��%?��!3�L�\0i�m׻�`��>�r�Tk����OJhF��,i�\')[�Y>[�����x�c����N�T��jP|\0&V�]/me��%8��Y��T����MJ�Q\"���D��&qh\"n\0�A��[j�Q*�Lx�=4C�xj�a��\\6u��4L����J�R�f�o���T\\EV��\"�?����kҒ��4nx_o>��-��-ӊ�4Uh�^�60��	v�ߙUl�\Zڎ.kt2\0kx�%�^9*/�>�Z)<N\nٝs������_{��bV�EM0/\"dO6�o�ࡌ(\'P����.[��b�^����T��Z���kH��3�+�v��ŭe6��X\0�\'��-x�<_@���2L��%L8�7�;��]?�b�V�T���tK@��7m�O	�tsl3iTg��u<�P���$��%T��mJB�e�^�\"`���e\rz���N��&�M;��������Sn��8�w���63�*+�t8�$\0x��c��q�tV����^�@��6߮�x#���EU�b�~��}Ý~��	��\0\'�<��m1ꢻǻ�U�@�N3qf��ރ�e�!�k*42� �q�I1�1�J�~ȳ͑���\0������@h���:�ܲJ��z.;�l&w�>k�{>�N*���ѣ�H�Ȁ�C�I�����K�.Y[gx0�\r\Z��.�1�UO��+��(����US�0��t�҉.���\\²`�Q�./	�:P��H�S���9�I�V?�_��Zvˎf��Ea�\0V��ܶ�w6+6�7Э��J�I<�>iE�p��`�.�h��@�%o�x�&y��u���T�`�R\\�Hii�N���v_�V��i�\r-/���`����\\�����o��{�׵���Hs�m��rZ4�qI���ܞ��\0.{O�M41me��K�Y~К���Ԭ�B��B�\r�*�Q+UZ�VQ*�M�J���|9��nO\07��V����0��E2��ƥGH\\���99,v�a��*b����{�:rZ\0c��������lsk�]&�Ճ+N��#�@�/+�r\\$�;����^4��I��Fd�������G�7�Ku2|z3�li�pq��;��9S�x�N��OA��־b�X��_?�0���s�L8�}�Yz�5�]���ٳ�I���!tOe=����*Ut5�[~�p$��$槲\\���b+0��#�KvV��ex��Jtq{^�dԉHd\r Z�Rv��iS⽙�I\r�I։�W+�H@�Q�}�>V+��a��\03=V_��\"}�H��U\Z���1�ͱ��,4�&��\\�\nÐ�m#5+�s1�+��1��	c��1e!7n����,(�s.&�St!�[g�ބ�:p�B�\\��\Z�}f��A�3�\0��+�T�\0�g��1���/\r�&���64���Ú���Ќɵ�^WN�����u��boh���7Z����ľ���X$�K!���oHU�Y��A����psci��P2��W��T�}�M���Ǻ�����	9~5��,�7uSZj���#\'��@k$\\x�ڃ�\\&�BN�{��#��ED��t�L�t��v��o\'�	��CK�G�r/��\'~��nOBJ�&�F)�u6�\\�2��:���\\u�UZ�A�kI�x�]��js�L0�a%Ӫ�\0�z^<���+�\r�E��֞,�ɡ��&m����ؤ��X������S�>��j,Q]El��Y��S-y=�5�\0Y�:�J�R��q0A�A����/7�?�Z�)&/eX�x�nm�a汪�7��e��\rO:v7����W��O���^g$\Z�ӯ$�/��Ԯ�ӥ�e�e1�M���s�	�M\"�=�[�\\Y@	�cn\n��7�9ASj����2)�54FϪ;�����~D�(�S{ESYG5t���#���%�D��a�G�݌�����$�[z*�j쮝�\Zj����IK��#i�~��U�?�?�y\'��m�Z;�����%\'eڠB��B�!x�B\0S��6�CN5�;L�k��{n�~��5�{���q�ɗ|��F�t��=�b�5�7:�q-�Z�9�1ă\n���[T<�p!�L�=�q<\0����^I�#Wkti˰?��I�4�T`P�]�piú\r���vb�!M�/..:��5�7�ɵ�ɓ�S8�P���{OtY��� A#��D��]�͘疑\'b㹎�JRv�U��EEI��e �9È����?ʻ(*8�����%ܷ��Hq�ga�����]`ʚ�Ԑ���t�Z��L���O��\rE�Cȱ� ��x��,��\no��y=<=c���\r3��j�m�����y�5�\"\"\0Z�nc�5�ڂ��Y����ǌH�1~!!�_�V	#V�{�cnKg�$�f��f������S�?���~��-�Z|��A�q�����A�G�c�B������N���iv+�2�\"�0���J؅\rؾ2���J�B\'��	5q�71�x,�P��$�o��e,}T�֣M�tL���;���q��j��g[�g+��K@\0��R�Ro���\\ڀ�;x�\0E�Zf���\'n�r!�|7d�p��n���P�i&\0���\n6[P\Z��s1�fXkA���Zc%Ft�GB�z�JM..ia-g�\ZO}�g��$���I�f����o��ip\";��CH$;\nN���|q�Q�J2z��F�pp�ވ��j�c�9UGUf��A��a�O6T&`�B�Т��m��8R��\0��ae�m �Y�c�]1��6�vCڌsŉݣf��b|���XW4�K)\0��}+j�t7x܎q�.�h;C�z�!0�!V+�ls�a�I���6�K��ց$�\0�;E�N���a�tH�P��]��$�����O;�rڍeV9��zZ�8�m$���[F�X]X��$�	\0ߙ>�u��,=��=��\"-q��E��,$�-��[[1��ʌ��\r�w0L\rDH�S�\0�{�֙��6�������e��.q{�H\0!���\r����`��$ܮ�XuP�W̛J�F�\Z�u�A�{������C��:L���#������`��5�P��NA�}T��(ys��7A4i�`I��c5�l��\\�zx�\\�ǆ{��\0��\0~#�^�a�ԣ���:��5*8�ߩ��o���E����;8���>5<rt��q 8\r��8<	�Q�\0{�N��O��#/!�(ѫb����TQ��<x��S�a��x~�o�����;����(��� �9O�V�\Z����˚ɯ�V�a!�6J��鋫h��:%J�����w^�^�g���D������>���+}*�-	���`k(��u��Iy��d�-��&$�}����t����InW2jL\0 u&�[�;����Υ?���q�X��̨cM7>�>~dʌ�Ȫ^e�4�\"$���G$����%�C�:�\n�Y[vtl�W�i�q?��թ��VA���1h�Tl�1\Z��F�x��o�*�ʎ��-�Q�X�[\'�Yi:\n8V�i8�8�,|Hk��>鹑pV�}�牤#��x)�s���x0�;���%�?������*ґ��R�����<!M�r*8z%�s�q��#Tp7��-�p�\0���V��M���[d�Ȁv<>�NWkCq�e��xf=��Aiau��4��Lz+kB����&E��3f�d�č��	�!\nH3˙^�����>DlT� ڜ��\Z���E2�[VI���TGx[�H�U��H#T�~b�Wҹ�QKLӬ�Q����������i�L<���s���ު�!�%j���T%�~��?Ӧ�4؅�\n-h�\Z�/:�6�8D�c�\ri��`�˜��� �A��;��2;t�;�pB��z0otX�	\r���-�q����Tzt����>\r�.X�M��#��\'�>�*��6���+�`��o����}S�q��6��`w����\0e���EA4�@�9�,wѩ�-\0ʝ��J��+i׬�6�$�܈k�GOB�<n����sVMAhMQ�*js\\v$��l�=*V�T�Ov��i�d��fꍏ�1�4��sl�z}�oB7�K*��1+��)��,�h1.��ʩU�{�b1��C׾ɯ/]!>Gd���5TW�\Z8�N�E-�ca��~\"8�����z�}S�x}�I3��cc�^�\Z0�7���.k�Kn\r�&dn�[s���Y��V�\'i�9$Z5wL�q%��R5M���Mɕ++�jbj��:��a�h����l����qy���f�Sެ�E1�O�wF���3�>�p�e=4F�����tu��>i�\n6�x˲��*;^ S%�|,l�YO���>\n���朙%� ��oP��j!�-pAH �����#�:�\0�;�\'�mMNؓ���A*����Hp�����@�;�Ƀ�J��[Zڦ}�R/&�Zy�-�;LU�����8=�`�H�!6�vK6�!�p���Gk\rʴ��!E#{鱷5�ZU�.m�K\'�xpZǗ�ki�����%ćs��u^���)�9��cz���wa$����3]Z:�M7k\r��@�I�`�gI�}�6��,���e��A\0�@��Ǳ�K1�K\03�����]U;�v��) � \'�nZqJ�E���o$����cT���i-�KH��I�섛կ\'�[eҡ{	+�6>nv��O��1�S��Q�5ho����8��ӤƟ�����>��^e\'\'m���^B��>�v/�n�M&��\rx��o�^.<.:.E�o�>b.��[S��ú�=+�!�9�e��RF\"�j}KN����>�-��Ƙ\"�&��#ZM\\%��4�>�J\0�������s*w�#G�_P�o�����\0��\0�\0�a�K��~�~*�\"$;�YިO ��y��0����qV����1�O09E\Z\"(ҧLZ��l��#�A���>��Xw~%�|�#Q�]S���pxx~$�UA��M z0w�%Ӵ�T�k�E�hk@h\0\0\0\0�\0�,�A��[�����P�1�d���iH<@L�� ��C0�)ѧ:)�4j��&��N�!\0F7ڴ�M�k�ZxY�\r�� ���,\r#N����D�ɘx�\0t!\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B\0�!\0B��','A');
/*!40000 ALTER TABLE `areas_comunes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asambleas_juntas_condominios`
--

DROP TABLE IF EXISTS `asambleas_juntas_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asambleas_juntas_condominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `codigo_asamblea_junta_condominio` varchar(5) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `puntos_tratar` varchar(155) NOT NULL,
  `acuerdos` varchar(255) NOT NULL,
  `archivo` longblob,
  `lugar` varchar(45) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asambleas_junta_condominio_condominios1` (`condominio_id`),
  CONSTRAINT `fk_asambleas_junta_condominio_condominios1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asambleas_juntas_condominios`
--

LOCK TABLES `asambleas_juntas_condominios` WRITE;
/*!40000 ALTER TABLE `asambleas_juntas_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `asambleas_juntas_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas_inmuebles`
--

DROP TABLE IF EXISTS `caracteristicas_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas_inmuebles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_caracteristica_inmueble` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas_inmuebles`
--

LOCK TABLES `caracteristicas_inmuebles` WRITE;
/*!40000 ALTER TABLE `caracteristicas_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas_por_inmuebles`
--

DROP TABLE IF EXISTS `caracteristicas_por_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas_por_inmuebles` (
  `inmuebles_id` int(11) NOT NULL,
  `caracteristica_inmueble_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`inmuebles_id`,`caracteristica_inmueble_id`),
  KEY `fk_inmuebles_has_caracteristica_inmueble_caracteristica_inmue1` (`caracteristica_inmueble_id`),
  KEY `fk_inmuebles_has_caracteristica_inmueble_inmuebles1` (`inmuebles_id`),
  CONSTRAINT `fk_inmuebles_has_caracteristica_inmueble_caracteristica_inmue1` FOREIGN KEY (`caracteristica_inmueble_id`) REFERENCES `caracteristicas_inmuebles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_has_caracteristica_inmueble_inmuebles1` FOREIGN KEY (`inmuebles_id`) REFERENCES `inmuebles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas_por_inmuebles`
--

LOCK TABLES `caracteristicas_por_inmuebles` WRITE;
/*!40000 ALTER TABLE `caracteristicas_por_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas_por_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_junta_condominios`
--

DROP TABLE IF EXISTS `cargos_junta_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_junta_condominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `codigo_cargo_junta_condominio` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_junta_condominios`
--

LOCK TABLES `cargos_junta_condominios` WRITE;
/*!40000 ALTER TABLE `cargos_junta_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos_junta_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_por_juntas_condominios`
--

DROP TABLE IF EXISTS `cargos_por_juntas_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_por_juntas_condominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_junta_condominio_id` int(11) NOT NULL,
  `junta_condominio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cargo_junta_condominio_id` (`cargo_junta_condominio_id`),
  KEY `junta_condominio_id` (`junta_condominio_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `cargos_por_juntas_condominios_ibfk_1` FOREIGN KEY (`cargo_junta_condominio_id`) REFERENCES `cargos_junta_condominios` (`id`),
  CONSTRAINT `cargos_por_juntas_condominios_ibfk_2` FOREIGN KEY (`junta_condominio_id`) REFERENCES `junta_condominios` (`id`),
  CONSTRAINT `cargos_por_juntas_condominios_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_por_juntas_condominios`
--

LOCK TABLES `cargos_por_juntas_condominios` WRITE;
/*!40000 ALTER TABLE `cargos_por_juntas_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos_por_juntas_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carteleras`
--

DROP TABLE IF EXISTS `carteleras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carteleras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_publicaciones_id` int(11) NOT NULL,
  `usuario_emisor_id` int(11) NOT NULL,
  `usuario_receptor_id` int(11) DEFAULT NULL,
  `codigo_cartelera` varchar(10) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descripcion` varchar(512) NOT NULL,
  `fecha` datetime NOT NULL,
  `archivo` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartelera_tipo_publicaciones1` (`tipo_publicaciones_id`),
  KEY `fk_cartelera_usuarios1` (`usuario_emisor_id`),
  KEY `usuarios_id` (`usuario_emisor_id`),
  KEY `usuario_receptor_id` (`usuario_receptor_id`),
  CONSTRAINT `carteleras_ibfk_1` FOREIGN KEY (`usuario_receptor_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_cartelera_tipo_publicaciones1` FOREIGN KEY (`tipo_publicaciones_id`) REFERENCES `tipo_publicaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carteleras`
--

LOCK TABLES `carteleras` WRITE;
/*!40000 ALTER TABLE `carteleras` DISABLE KEYS */;
INSERT INTO `carteleras` VALUES (1,1,13,16,'C01','Cuidado','Estan guarimbeando las calles','2014-01-03 00:00:00',NULL,'A'),(2,1,13,16,'C02','Urgente','Problemas con el agua','2014-01-06 00:00:00',NULL,'A');
/*!40000 ALTER TABLE `carteleras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_egresos`
--

DROP TABLE IF EXISTS `concepto_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `codigo_concepto_egreso` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_egresos`
--

LOCK TABLES `concepto_egresos` WRITE;
/*!40000 ALTER TABLE `concepto_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_ingresos`
--

DROP TABLE IF EXISTS `concepto_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `codigo_concepto_ingreso` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_ingresos`
--

LOCK TABLES `concepto_ingresos` WRITE;
/*!40000 ALTER TABLE `concepto_ingresos` DISABLE KEYS */;
INSERT INTO `concepto_ingresos` VALUES (1,'Pago Cancha','P01','A'),(2,'Ingreso por caney','C02','A'),(3,'Pago Condominio','CI02','A');
/*!40000 ALTER TABLE `concepto_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condominios`
--

DROP TABLE IF EXISTS `condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_condominio` varchar(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `rif` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominios`
--

LOCK TABLES `condominios` WRITE;
/*!40000 ALTER TABLE `condominios` DISABLE KEYS */;
INSERT INTO `condominios` VALUES (1,'sia1','Villa roca','Intercomunal barquisimeto-acarigua','J-644382-2','0403293','villaroca@siaco','A');
/*!40000 ALTER TABLE `condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NOT NULL,
  `concepto_egreso_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codigo_cotizaciones` varchar(5) DEFAULT NULL,
  `monto` float NOT NULL,
  `foto` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cotizaciones_proveedores1` (`proveedor_id`),
  KEY `fk_cotizaciones_concepto_egresos1` (`concepto_egreso_id`),
  CONSTRAINT `fk_cotizaciones_concepto_egresos1` FOREIGN KEY (`concepto_egreso_id`) REFERENCES `concepto_egresos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotizaciones_proveedores1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cotizacion_usada_id` int(11) NOT NULL,
  `concepto_egreso_id` int(11) NOT NULL,
  `condominios_id` int(11) NOT NULL,
  `codigo_egreso` varchar(5) NOT NULL,
  `fecha` date NOT NULL,
  `banco` varchar(20) DEFAULT NULL,
  `cuenta` varchar(30) DEFAULT NULL,
  `referencia_documento_mercantil` varchar(20) DEFAULT NULL,
  `foto` longblob,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_egresos_cotizaciones1` (`cotizacion_usada_id`),
  KEY `fk_egresos_concepto_egresos1` (`concepto_egreso_id`),
  KEY `fk_egresos_condominios1` (`condominios_id`),
  CONSTRAINT `fk_egresos_concepto_egresos1` FOREIGN KEY (`concepto_egreso_id`) REFERENCES `concepto_egresos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_condominios1` FOREIGN KEY (`condominios_id`) REFERENCES `condominios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresos_cotizaciones1` FOREIGN KEY (`cotizacion_usada_id`) REFERENCES `cotizaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo_empleado_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion_alternativa` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `formato` char(50) DEFAULT NULL,
  `foto` longblob,
  `cargo` varchar(45) NOT NULL,
  `estado_civil` varchar(1) NOT NULL,
  `inicio_jornada` time NOT NULL,
  `fin_jornada` time NOT NULL,
  `numero_hijos` int(11) DEFAULT '0',
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleados_usuarios1` (`usuario_id`),
  KEY `fk_empleados_tipo_empleados1` (`tipo_empleado_id`),
  KEY `condominio_id` (`condominio_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_empleados_tipo_empleados1` FOREIGN KEY (`tipo_empleado_id`) REFERENCES `tipos_empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inmuebles_id` int(11) NOT NULL,
  `concepto_ingresos_id` int(11) NOT NULL,
  `codigo_ingresos` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `abono` float DEFAULT NULL,
  `pagado` tinyint(1) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingresos_inmuebles1` (`inmuebles_id`),
  KEY `fk_ingresos_concepto_ingresos1` (`concepto_ingresos_id`),
  CONSTRAINT `fk_ingresos_concepto_ingresos1` FOREIGN KEY (`concepto_ingresos_id`) REFERENCES `concepto_ingresos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresos_inmuebles1` FOREIGN KEY (`inmuebles_id`) REFERENCES `inmuebles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,1,2,'S01','2014-02-18',2000,10,0,'A'),(2,1,2,'s02','2014-02-18',100,10,0,'A'),(3,1,1,'s03','2014-02-18',100,10,0,'A'),(4,1,2,'s04','2014-02-18',100,10,0,'A'),(5,1,2,'s05','2014-02-18',100,10,0,'A'),(6,1,3,'CO02','2014-02-21',200,100,0,'A'),(7,1,3,'C02','2014-02-23',200,0,0,'A'),(8,1,3,'C04','2014-02-23',200,0,0,'A'),(9,1,3,'C04','2014-02-23',300,200,0,'A'),(10,1,3,'C04','2014-02-23',300,100,0,'A'),(11,1,3,'C03','2014-02-23',100,0,0,'A'),(12,1,3,'C05','2014-02-23',400,100,0,'A'),(13,1,2,'C044','2014-02-24',300,0,0,'A'),(14,1,1,'C03','2014-02-24',300,0,0,'A'),(15,1,1,'C04','2014-02-24',200,0,0,'A'),(16,1,1,'C04','2014-02-18',400,0,0,'A');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `codigo_inmueble` varchar(10) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `alicuota` float NOT NULL,
  `saldo_a_favor` float DEFAULT NULL,
  `solvencia` tinyint(1) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inmuebles_condominios1` (`condominio_id`),
  KEY `fk_inmuebles_propietarios1` (`propietario_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `fk_inmuebles_condominios1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmuebles_propietarios1` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,1,1,16,'3','s01',0,100,1,'A');
/*!40000 ALTER TABLE `inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junta_condominios`
--

DROP TABLE IF EXISTS `junta_condominios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `junta_condominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condominio_id` (`condominio_id`),
  CONSTRAINT `junta_condominios_ibfk_1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junta_condominios`
--

LOCK TABLES `junta_condominios` WRITE;
/*!40000 ALTER TABLE `junta_condominios` DISABLE KEYS */;
/*!40000 ALTER TABLE `junta_condominios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedades`
--

DROP TABLE IF EXISTS `novedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_novedades` int(11) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `placa_vehiculo` varchar(8) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `publicar_cartelera` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inmueble_id` (`inmueble_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `novedades_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `novedades_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
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
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion_alternativa` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `formato` char(50) DEFAULT NULL,
  `foto` longblob,
  `estado_civil` varchar(1) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (1,'Vianel','Rodriguez','19591778','1990-01-07','cabudare','54343','3213',NULL,'����\0JFIF\0\0\0\0\0\0��\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQRO��\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO��\0] \"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0_��}�G�rN\0��c#��zP\\�3Ͻ\0k������\r����?�C�L21�zc�\0i�~�u?�J����Z�����R�����\0^��0���J��8�ӊ�c\0�ڭ�GL��������N;qP+��GN��3�br3�@T�0G�Y\0\0���7�?NiV|�׊\0�{��l�\0)�x�ֳL����%������\0���qן�=�����T\r/�}�@�r��Tfv�d�5Y��pN1ߚB݉��@��<�TL�N21���9����r\0qڀ���4�<u�Oڣ��$�#\"�#�s�Jx���{Ԝg Ӑ��@\r�`K�c8��q�c����O��38����������\0���q���?�����8����(��?�<q�j\0�9����#|�@�������	��Q>3�u\0�}y�&�1��R`g�zb��`u�Ҁ\"�A�¤PzӑN)�����y��ǧZ�T�\09���>� ǧN�\0���.1���\0<�H�MQ�=*@�ϵ.8�}��)>�>�>�J\0cc>��8�Ԏ�p?^�̌��\0@S�?�\0c�4�g��F>��\07���;s�iރ#?J��(\0t�������T��Z\0r��ZF�E/Ls�A �h6�n�����Ʀa���CQc�<};�q��=W�cԘ��N##4\0�\09>����=�pN9�������\0v?�Hx�8�Lc��P��{\Z\0��w����E\0&���r@�dt����~\"�;t����R\022H�t�\0�;G��K���Rt\0g�Jw��@\r?��)�O`z\Z\0�vx�Z�`zv沠�F�{A�8�@�=Ozя$��[�>�+E:��	�\0�Ӹ��=)�z�\0:\0?�w�h�c׵\0!��Hx=�K������J��1R��~U~\r\0W��Ɏx�U�\0�\Z�\'\\�R@0{�H��i���$��\0Ν>S�Y�G�H�iǩ�8��c�~T� ���CӽX���U��\0��M(�8�G�7����;�r}?*\0�m��>ƶ�+X��{b���\0����o؀H�5u�������U���\0Z�9�R&s��\n`���E�q��<��۵4㯥8��Zi�p3�@	���}x��\\��� ��\0N�g�H�\0#ʡ�z`}{SԞ:\Z\0��<��T�>1ק�j�����Ԡ�8���@LĜ0<�Pd��T\0���JX�9�\0Y���� sUCr>a�>b9��P�9��Q���>��I�S�����\0!9<�9�I��0y��#���\0c�\0@#���;hA��T����98\0�p01�����\'֘I���֍�@�h���~a��Fz�4�(E��4񎂚��r)��\0���\'�a�0\r=���0��H����pMI�v���Hϥ\0 A�9�H�?<SF������ր��=��c<c�;�\\sI�{�:�-���0�l�;Ԍ���\ZL����_nsOX����#jeA���<�����8�U��7�M+�r(��(P6����+�)0q�G�j\0j�ޞ:r?�Ԙ?��^�<P�����	>��#���&Lb�\Z@�8��H3�N#=p)\0���\0�\0��N�\0��w�=h�A���ޜzt�<�ր�Jz���i�9럥=s�3�\0<8S�>�6@��zqJ8�҆��@�=EF@�:T�x$\n������\0֧/��4���{{S�ր�aJz�ғ�3�jl�Ҁ�`i�c#4���鿍\0 �p\r\0c��N�օ�Gz\0M���Q�;�)�oJ?�\0��}h\0ا�ON��c�\Z0=ix�ϭ.у�ڌc����������8�<�y�\0\ZgB3�hſ;H��ֽ����\0�s��k^�=�f�`zV�`S�T-�\0U������?�M9������s�jO�jN�F\0)�ɤ�JQ��R�\0Q��܎i�9�ۭHG���=(��בUe�j�&}*���h�q���\\z���b���k�8�\nS}��ҳn8�9�ZW��q�J\0ϗ���U	�}�Ԓ���*�\0��=�q����\nPFz��l��y��#�z�jŵ��<dV՚���\0ٷ��d��yq���ҳ����W���\0A���x�H������QR.}��(�N\0��ӥF��xQOb8���lps���\05�#�sQdc�ڇ<�$�3����㚑q��p}*5� ��R��S�\0H�G��O6����?�~�\"��x��Nۓ��{T�@8c��=(th\n6��=�y��\'��@`s���<� �EB�=�ԫ��{���t��c1B�:��={Pm���6\'��{�3�Σn�{�\r\0E��i3ǷN)�\0����\0��c�H�9�O:�}I�zu�\0J���N�1�1AI>��1��@q�yǥ1���Ҝ~b	��GNA�|Px\0�B;�Ni�c�:xP�#��( �dw�#y^=(�z�?*\0��<�����yϥ,���Ҥ��\0��O���3��\"�+�<�Ҕ/=��0��I�AWm��[�F㝸�\nq�� ��U��s�V�U��1� \0/\'�R�d(�s�\0��\n��4�cle������JH21�sH�/��g���\nCO����}�)l���G��ⵣ��/�<a�i�+>7\'���3�i��$p{��Ŭ@�c�ÊO����,���h})�+^[+`�\"�\rE&� Pa0c����߮jIcx�������\0�(�N�����ڌ��?oc�w�~�\0��_ʤ\\�=&\0��=F3��րCd��S�9��i�q���9��Q2x�T��1�=*\"r(8��\0zQ���G�����\0:\0^��(8�����3��1��Q���p1��`z�j\0\0�QN�����28�)�(GA��\0Z������qN9��\0�c�Rw8�R��9��)8���Oz\01�c�){�z\0�~���L�P�J�����N2rj#�z\Z\0�	\0s��g��1�>��o�`�şl��\r�pF2:������ON��\'8�>��	;s�S�ښ�q��.}s�\0/oZ8��Gz_�ހ�}h�9�F@�zN�����:S�c�1�~T]���U��J�Ǯx����r9�\n��p8�t�郎��V�x��L~?��@�#��+.���Z�=���M��\"�3%���ϥC��Υ��֡#��\0{`v�ݎF9�����R�c��ڀ.Z���g����j0q�s[�_w��@\Z�����<t��UKr0:��x�c u��R�:���B��(�:}h�ۓ�:z��[��J��1��P0#����f��M^�ߕ:^����U�1@\"��oJ��隍FF{c�N����\0K�9�/��ҝ�0=:P�z��4� d�S�G�9�E\04�~����\0� ��A���\"��Z�:r~�\n稩���\0J8�u���:�3A>��Ã�\"�`y�!�08�R6Ns�@0���4��u������s�jQ����rA�#�xS��Z\0zpq�:S�x�1<\0I�AVc�X\r�l_?/#��;iퟠ�)�(�ܒ����D���o��Ҁ*�9���\0Z�#�y\0��4�$�C p@\'���13+��\0\0{�h��x�}�h���J��nan�B?w�rq֤�܄$!~�PE���U\r���\'�BLtsRyeo���=IB};�@���|�F\0� T������*G4�]�(J��#a),c��,F�J�\n�px#�w�\0���?��c8��ϥLd9.2	���P�r�ʸ t\'�\nK�J�C�\'�)`ɼ�8��C�=�\'\0��&S�����}ӎ���ޜbi�|��\0��e�T�R:c4ߴ0)P�\rB#�`��t�T,�e��=h�w���~�0!�o�52O=	�x��������JO���:�SY�XF���i�~������l�Lڒu_�/�\0b�o,G�\\���<T`{�����;�pyR8j�5�J�Q\n��\0g�\'>�c\0��f��7��u�i�=}z��}i�:���\np���\0�����1�>�S��|\nku?�\0D�}�s�2��z\0A�׎;��ǧ�.O�\0[�g��N�ǵ\0\0��}��N\0�߭!\0��\00�����v�b�~T\0�u�\08�m\'ޗ\0�{\ZP>��@�(=	�E;i� �L�\0\n\0\0��=�S����J��(��A�Ԏ�����z�Pɀy<PG篵G�q�Jz������ր\'��w�{08��`�F3�ֽ�<�\0ض�\0���U\\\Z����\'���i��Ҕ\n\0p�:�1G~pi8�R�h\0�f�Nj^�4�מ�\0�����S�\n��=}�=�8�\0�Շ�gך���W�\0D�=�Q�;b���F�??J\0�pp�<q�VU�N@���Z�^��r��@2gw=��-���ެȍ��ϵF#`���P`\Z]�q���J\"`:qҔF@�&�#�[Vy�d[)�zٳ9�5`�#�Z�j��r1���00(G�\0�O:�Fq�Z9�:|`�{Uy9��*y2:� |�9�\"� q��4�;d�4�9})P``��\"��Ԫ�z��ڣ^嚔d{P�=���c����4cm9Nq�v\0�\001�Қ㓟Z�r�$�X\Z\0�i��J\\q��4�@��FߔA�(֦@r1���#&�S@��@�4`�����>�����!�=}�iܐx��Fq�PpG�dg#�4�>\\q��҅�Rx�� �5$q\0�=iܰ����D��q�F\'�(ҴP������5Z[�I	wsQ�6��rOl�)Q�y�?w���-ă\n��!Y��׭30��1H�(`J�{�3@?�IS��\"�Y%�~�n�L�J��oҞ7�|�Rq@$��XU�9\np*��$1�A<:Ux���#�����5Ɍ\0���]�<��1�a7�\n\0+��P\'�9��\0p*彰v\n���t\0��2̎��XT��h�U+׾jE�*��x�r*�1�\'8�zPD�v�dr\n�\0c5#i�N�s֮ƈPO&�����Z\0�od=�~���q�vn<�\0�=EL�Fwq���J\0��qޫ�T�����Z\nv��\0a��ڀ*���NݻSO��\'���Ƕ(ێ���\';H8�S�K\Z���o�dp0EE$`���@�v9�J��qě{㱭�nI*3���������b�2�DK\"�>ԮVl:����V���Lc*N0Fi����l�C@�#u�\'烏�Y��Onw��=GJߖ-ţp�ʣh����H�{\Z\0��zp�c�ZԻ�\0&[r6�3��U���}(�?�1�鎜Ԥ8��Tl;�\'���4�}����qM�zPs���N؊@	�7=�@{�i1ڦX� ����c��@����(�C�U�jz�9�T�j����zq��Ad�j-�m>Ƥ[<\n\0�[s�*�m�M���϶Ε2Y\r�\0�׊\0�[F��4�hz�Ҷ���p3O�!�6�ʀ9��8�W�:\n�f� }�}���~�\"��\'#��q	㡪\'\0�<�f��ޕ�f\0�\\�k&߷&��A��Ҁ5������z�#�*��㿵\0?���9OSA��qN����׌��hǷ���\0�{R{�R�}�ښI�\0\"�ϵD����Trg=?PL{df�I��c��Ry=}��r�\'�OZ\0Vlr5n1P�q���L2�ph&e=oʨN89ȫ2ɐy�VF$g�\0P�:�\0�Jn�AS��$~�M��^�����9� J�\0u���{��jڮ9�֨[��<֝�7��~z�\'<�D#�N�k2H�@�P㌎ކ�PzP�8�~��EB��\0���\0�*&��\\zP\\�����z~���\0v�)S��G�\0L��{��z����s��	dP�#�Ӈ=�\0Jb�6?*vI�ۊ\0�G��F=�})P�ґ�A��Fx�)J��}1OǷ�9����PJ�?Jx�<���K�3��G͓��P��JC�Q�R��\0���q�\0cvx�)0Ĝ��Q��rqG$��=(\0����� 8%�AҚp\0�\0�����e�\0ɽ���\"���n���E\",q�7���;��;�B����Zth�Be�]�2[�\0X�K��[GL��J�3��G�e*��m�N�H�q�zP�*����R�MĞ:�QF�@��U�w`@#�P�������o�2��UQ�p���5<r6�:7\0��U�^9n(��Чi#��v���R;��#��T@C�6�c�j��ˀB��B~�/=����	>�hѣ\"s��ך�\"�Ar�SaU��}jH�ڣ�\0���Kg֦H��M\r�3߁Owt�\0�s�)�����u�PFx��=�)�y\'$���K��\0r��3�*,��(�<\Z\0��Қs�{Rn�$\Z\0UP;R��H	�zS��@p�^k(�NP�*��_zLd�2Zݖ<?8�}*��W�=��պS+�Uy��/�(���ȁ���A�ǿ|\'�nW=��ũ�\n���<.$�bn����hY\0�\Z,���V�ۆY0C�Q�<��\0b�|��7� 8�-�B�x��A�\\q�����8��U��H8#�����U����\0Q��=��XK!������==����?\Z\0�KLA��S-��զ��Jw�3Ӛ\0��\'�N��l��Z,u�J��nAcҤ[|@��V{})B��(��ޔ�:�z�F})b�(��p+6�1���̽+.��^��^�����_ֵ�	9\0\n��@���ۚٴ#ұ��[��4�\0u�U����S����}*Ҝu #��q����֝���t�(�1I�?�.>�������������y����#��^N:\n��Uis���Nf��1ֳ�$�#U������r1@4�FG_J��9#8�0��z��F�#��\0�H�Q�$��Ҥp�O�_�\0V�H�~��=�}*ߐ߯jp�lP/+��T�	=[�ا-�������g�n�#�{Tq[��O<\Z�X^����\0�?\Z�@�)�s�y���(3�qA��ґ���68�@|䎧��P�<��3�O\"�l���\0����ޜ���!vG4��I�\0���H���H�J�i@?^hE����ҏ��r>��3�{t�	W��S��\rF��{T�{�Fy�h@�<�\Zv�W���(���ا�c��Pz�c�ƞNݟ��l�\0fހa�L�^������\r0���q@~bs��cop\r4p���֣{��H۷1P\'�`��r3� �5��Iq19��s0)�K4�\'��*ź��:����\r�9�}-U��$�@��h9�!���,p:u$g���Gn(�gv��zҭG��~=y�f�C��8@\"�g�fo��\0H�����?J��3`l�#\nǐ6����0�FC�\\7J\0���3�s�^�cb�-�v5M#p~b�t\0՘N{�-BB.���x�#�${�x#\\g�U؃�㎜���D�#=��	�8�*�d�$�*x���(��\'1Ng9a�U2�3�4��r{�\0�$=z҇$pz�P�H���8Jc��\0[�؃G���c\"��	�)��W�(�l��Nx���N1ր&��4��S~T��\'�8�0pi��=?*\0z�^i���B�y9�i�ڀ&\r�pnx�P��4�o�ր\'��SXd�i���N�PD��ӡ����V@�F8�_�<sڛ�����\nC.\n�0�1J��T�s֬�\0x� ��G�ѲNE\05�\r�{�&%j�m*2���MeG�@#N2*X�\0�*@�gޜ�ϷZ\0�8�98Q�)����A��j\\c�&Fi{����t��h�4J\0L��K׿�GC��F0F(\0��Mr>��{���E#`��@J�u�+&�N���\0��\ZǼ�\ny����I�k,���Wn�98�#��.����+^��*ǁ�z���l�9���늲�2;����x��A�\'�a����UEn���l����t��)1��z��}h\0�n���\Z_S�ԙ��#�B��0��+��|���P��=�ڶ�O�U���y(�7�Ӆ�{V����#җ����=m���~T�n1��QZV)|���۽\0Q[u������)�\04G���Zw�q��*�@})6��ڀ+�@9#���5)��&�=h\0^N�\0�@ϥ7 r1�jc>=�\0�ʫ�Ǟ�i��vz�,�8�\n\0�_��5zb�l���b��#�PaNy��RF0@1�&>b��H�������I���J}I�)�#�z�\n\0xힹ��00����䎔���9�	��Bp=*E㯯_z�gΗv\0��@��T�p;�U��v�F}q�j\0vx�*6�zyrG�Lby<g4\0���Ӧi�=G��;Ө��v�� &OLf��f�\\l��p��՛�;c�?�j�9�/���x=��,9�r}��P��Y�����q�Ğo�!苎�ƚNY�)��\Z\0U�aϒ�v����m����n������Hݏ�za�eb�/c��\'��T��n0��#��٥Y�NTc���q�r͓��Iv��񞃡���b~fm���\\��F������d,�[���1�6��#���s���;.jչ\\}�\0�(B\r�Q�������T�T����\r��H�\0��\0���e���o&�B��i7�{�/���`*o0g�ǵg,�$\0�Ԣ^6���\0Z-�p3�)7\0@a���ހ�{�i�t\'t�.�rF(�A�aTC���)�npr9�@\Z\"A��.�ک$܀je����� �N������!$`��+6�\0Y\r��S�\Z�9zӓ����^�8�)�����@\n�������;�����$�J�R�o@}�n�J�=)�H�֜�\0&9�G,{�T�����\0R��eX�N�($1N�\r�zrGQP���=h�94�����Kq�:�J�g�\0X���P�N8�U 8��\0?8�(�i��/����1I�03��Ϡ�}(\'<v�����8����Uy(�Y����Gj\0�u\'���}?�1W�X�{\Z��f8�Ҁ �M�~��cwNi�9�>�����#�@\"8��8��fB:tAW���E\0hF�t�z���U�9��*�`��n3�}}*�g��*�c���j2\0�@���҂G^i��z��N(��P8��D_�ր������{PO�Q�����=�\0*\0���ʃHd�Ɨ��\0�\0�8�֐��\rDf��OJg�=O9���Ґ���:UC?�1Ly�������C���^NI&�ͻ��\0[iG\'��F3�j��W��q�*&��1ހ/GA���M3�A�uA�2z�5���\r����:t�-1=	ǽD��8��1��v��M����.x�XpO\"�1��~�����ޘ?OJ\0P��1R(�F1�����*U���\0�>CӑUX�ǧ^��̙���U�\0��\0=pt�L�T���qP�=��Jz����\'��{ӗ�#ޘ��)�;�y�	c�9?J��02\0Z�%�F�9� h�`j6��{���FJ�E+�PSׁ�ǥ4�3ۮ\r8��CU�$��H�\0���rXaF��z����L3u�]?��x�2��۹��\0LdP���Ny݂1�㚆5�O�󳑚��)����a�X�Qҝ�C�\0�<�UrI㢎)70�8�	�`�o֧���U}sU�=��8$՘�F��rzP�[<\"�;���;\0[�1Q�Q��q��f\'Bَ��M\0K�1W��o�ӱ�-�P�Ƽz��F⋟J\0�\\�6v�L���`q��<�|�o�jB��N\0I8�y��w*�d��d+�@j&va�Ҁ&V� �椎el���Jͻ�(|�w��\\�=OQHJd8�4��˷<ӆ�28&�<��	R��\'���K��QNs�����ĐW��L�;���V݁�Oҟ���q�oƦV���֩+m�N{եo����c���O��?L�Ԫ}x��	�s�R��\"�V�j@@\'#��0F(�(�\0��4����q�\0?zS��\Z�z�O�\0v9���@iz�\08<Uy���T�w`�?�# ��)$��P)Q�@��+���nsQ��y�\0]C���t��p:җ�\0Nz���ӊ���4�/�\0Y�)\\Us.O�f}h�|8�3�֡�sւ�<��@g���W2\r����?�J�R9�ڀ2o��\0�6	5�|O$�Տ+{�@6�׭u���4��z\Z�,n��@-��j҆<7�*���+R��}��I�ۊ�(=��Sc�z�8��@^1ڦG��J��Ў)\Z`::\0��zv�Fy�Pk�z�D�6H�\0h��9`�y�r1Y�c��e����\0��s�}i�h\nz���~lg�J<�~��\0�7#�׭DnΩ����3~:�@\Z�f�i��\rW$���7��\\}y�	��������C��1ڂ8��	�<z�4�Gc�dg������4�F3��@X�Iɤf���\"�:�ӥ&��\"�!f!zRg��c��ޛ垀~�$ex��hۑ�v�S�����B�\0S+���x�^_�_�qH����U�S�9ǡ�6@�SW9�(E��1R(���jj�y�S�3�PR?�T�n�qȫ�)����8�\\P(�N��g�h��c����@8�D�ǹ�B�׊�\nd��\0Y��g�s�Z�J��g�]Q��J\0�\"�����\0S�V���@+>�q�~��S��8<U+�9�6��U�ɬ��؜�W�ڀ(�([�.1��*.d�-��	�&��%A�*h����t��4\0�	6(\\~uY��BJ��r�,Dk��a�8�%<�����8�I�*DC�\0-�O&�,��~���N.�wj\0��\0/+�¦Lcj��M@� ���M	��~F(p����z��r��3���HP���ԑa�Tg�(�l~�zq��2���VT\0��H��V@1�%��h]�^0}y��A�S%r@�(��Mt<|P���y�5 \0����US ?w�\ZUbB�q��	��楉�3��{�l�4�rh�\0d��)RLq���VV�@\'58c��\0<���NW8�}*�n �� n2q��K��{Ѽ+.OJ�(\'ޜ�1���\0��)����ҦWPĒq֪FB�m\0�j��܁���\0����J�9W���Bv�Tjx&2�	��^9�NyV��;w�H�Ohen;�Ҝ�5�8�n���)�\0�ӷ�����=1Nʟ�ހ��>�@:>9�p\\�\0��\'ȥ�E��¸Ͻ�Ġ�(l�zҜ\ZbH|�i߅\02Xı#���\0��H�{֗���[`���\0p݆ht`FA��Mrs��ޣ�5e�Ǡ�HFGn=�?���JR>�𞘠�K`f���<҅��\04\0��lҲ��ۊ1���+H?�*��H�V��#�Q���8��y�\'��~�y�øS��J\0��c�K_j��q��b��g��\r+~��ф���zVu�A�*�}Q@Q�=�R4��#�R>��w\0<��uϥ4�q��z�XlG?J�!�\0�P�s�L��֥�	�*QnȠ\nd���I��ү}�����[^ƀ*���8.}x5pZ�n)�n=>�D!8�I����Lq�_�G`?\n<��p(���1�i�A\'ү,c#�}i�X��E\0gy�ڜ c��\0��0?\Z��PU�w����g8�\'<�w��\0F\"�X���ئ�r8��1�ӎzS]8�.G�)�a��hȟN�i�=���BC�_�3�\0I�y�Q��/���\0CMy0���zPÏ_zE��$�ý0������3�z��9ǽW\\)�֥^�#�\0:O�NzU9�X�*��\0s�j��\0{=h5_�^)�}1�R��\\s@�v�	������ک�z�qW�9�~�c�ҭ�;3�N*�@�*�T.zPB�A�Vt�0�ך�p�x���Fs�@7L���zʿ;F	l��\'�{�ڲ�\07,�x��\0Vd� xs\Z�Y��``�O?��H��� ���\\}�Bnpr\\��K,�1#\'��J�O$�v�\0��h�4ϩ>�4\0����CלT��}�ϩ5\Z��X���I��FG�\0H�\r�\r��6A㿵B�~0I�ҧ��9�;��z�j�$^���ҩP?�:�\Z��z��,�6K��zT �MRE,�\n�\'�Y\\�\r��w�>f܆8� <n�D;8�4���v�p(ubF܎�irFZ�\0�`�q�O��ϭ\0H[\0�Ӕ�g8Zc1\'�x�[��1�P���\n�<pyj�m�d��SG �z�&\0z��ڀ{�M�矠�) �+P�秭H|���.��`�D���zPJ����O���+q��pI9��9�F���4\0�]�	$��(81���u���\rH�&Gz\0���\0�h!�\0�:zҕ|�dP�8�4g��B��7�l�&I�	u��?�DL���c <&hRv���)�?\Z�y�S�R3��\0�\0g�<8�G�UwE<�Z\0��c�}jEc�O�U�g��)�w��ހ\'9QQ��\'��#�����rF��O4�+�I�s�\Z�2��P%GU]�ԓ�\Z���ۚ\0���`U?0�=)�yO4o�CK�:�A?~:Qq�ڀ-�֌��V�G��@�I�@��䊥pF8�9�Z@r=괬<��U���X���#�n�(��ȹI�9�(9�\rRB9���*tJ8�(���_�v �R�`8�J��0N=hd�8��\'-�j� =:T��\\�\0����y��Il�v�jx�\0qVR>��@V�g��R8�V�\0���m\0@�ό��G�Q�U �\0JLq�\0����(1�Y m�)�b�+\0Ni�\0T��<ګ�p�q@.1��8#�T`��Ӊ�\0��꼌GJ��;U� ��\0טv8�Zq�;�튩<���ƫ�rܐր4|��=�A��E[9�Hzu?�\0X�=�M��\Z���;#v:@�LS���1����	<c6�)�x�jf�p29�e|ߨ�@�x��4{ʜ���H�N(S��L��>����?�=}9\0�FO�y�y��<�L��ӟZ\0��y�cڝ��\0��<���\0��U��M8=;U�a�4~&\0Z�������/�Jd�s�?�\0,�=�ިJı�\0\Z�W��s�:�h�\0n�+v2]H���+g��;f��K�Prx��5�v�R�#�Qw��\0>��ap�/�V�H-�bg%�Lq�\0T\0�\0\0�Ҝq�l`T�T���8���9��@\0f���j@G;����\'%���ڜ\0Q�6���	���8Px����r[��T\nܷ�\0����u#����	�p$T�@�O5[x\0�~�֟:d�ƀ-�\'��8���c֙��T�2�9���+�`7�M�p�$�T��ѽ=��><��4 p	Ǧ*E���>�� �b�p�\0�p{Rdd�<f��`�?$�ӑ@)9<f�)��?Z����S!9��#��R�=3�Uh�Z�_�t�h�+q߭YE?/={UD�t��:HJ�:zP���S��1�UI3�\"�G9�΀%��W�jP�P;R\'̸+Ӹ4�b�P� r)�G�+�1�����q�\0�.Aǥ(PF;Ԡ.1�6�z}(\r��N�\\Ԙ?�#�\0�pT�n�´��M�|��$\'��җ�q�X�8`OJv��\0F2�n]����Ob)�x���b��ƀIk)A*v��h�b0@�GPU�n��q�n�8o�>��p�e���lGcYwe� /�\0��(l�N�;\'n�ҟ.zP|c��I�*_-�HS�,��\r9N�3�֍��iQNr\0!b9���c�u�r�9⣖1��\r\0fܶG��M�rx���5�t99\0�\0�F�:!�w����I2>�r�c��~8��\0��|\'�\0�W�|����\rFO�VPqӚ��3�U�=:��@��::T1�q�T�@�Joj` qN<�c��#�:S�O�5�(�1��z�?�<�i���M\0Wa�U�x㷥Yl�@�����\0u�=pސ�9�`�=h��1޳��ns�+JA�g�*���(\"���1�5L�-�CS]1Gᚬ��;z�\0Z�Goʯ���V�^h��#XǦ=���V[�*>��\"���&�\'�Ly<u�4�s@0 {\Z�.�1W�1QN�v�0�����T��~�)z�4��{v�\0\0����={Q�v�F�?J\0B\0�k`��pE��^�����\0U\0&@&������\r&����E�9��=�@á뚭��i���ր.=�9�����c����OZL�H+� ��׎��s����#�Zny�����U�;�LUX��?�9�\"��\\� ��qUd�-��U�NF	�e���b6(����y��s��� �@@�{���,2J���/���)�y��q��n8�@�Zb��H��\0U�yf큓OU<���b�b80:Ӳ������Z���j`�F:1�OP�O�@\0�H<�@�H1?� �9���8#>��\"���K�W*�v槌��Ҁ&^���z�	݌�����zԠc9�#�\r\0L�����R�9#�CYz���T�s����@t���J���MW ���͜���T���\rE�+� ��F�{P�/52FO�Q <�v�S�����X�3��Xm\0��*����sR#�$cҀ\'P�<��2���U&!�8��ǜ�\0ҍʜ��T��U��z�ΊB	�簫+ e�<��H9��H�jΊNqSy�c�@ԯR1OI$g֨�����L��{P���@��d�ZvF{�v��ҟ�����\0M�4�?Z0���\0aI��N�u�q��R��FG�\0)�5*Al�֤=3A��c��j�ʆt$dt5`�`c�E?�=��HW����&��O�+ޗ8=1FE\07f@(	�)��O\0ݨ2��5����\0Z��8^n���\0e](�~U�w��;V�����ֱ.�	㠠\n����jD>��D��Z�X�\0XS�8�3S�&�׌UPǹ��@|0�x�\r�y�3W�`�\0�jĆBZv͜�P�|���8�j�	�R���2(@��g�v�s��\\�OΏ4\n\0�[�FOrj�����3���@g�B;~U�����\'��\0��Q�`�\0����j���s�\0.�޴����2z�	�M\0,��qYW�s�^�vi@^�+.�A�(��<UD���{T�R\r��8�	\'�@v�1ןCZq����+i@���jA0�>��\0[a��Q�c�Ps������@�\"�G����\0�q�ҁ �sҀ>\\���SL���zP_��F���׷z\0��?J#�oơ�\\�h�g=�|��\nin��w�4ɀ9��(|�>��������z�z7�y�\0Nzz�vN\0#5lu���0;{P�>�ԥ��\0�U}���\nu�=h]��8��@���T9�4�8�	���j��r=�@O��KϿ\0���x� ��n襜.��{��S|lm�$Qe\ZA�(or>�(��H�\n㹨���zqW.���|�ʿ9P;�b������iTc�n1��s�u��`G�\0v��f䞝q�C�t\'��K�2@��\0����hȡO\'$q�����})zaW8=�?�ҀA�Ҥ	�c�4g�Ԙ䑑�(�2qR\0F0>�\Z��:g�jy8^�0$����U���Pn9�����=A\'�ta�Ԉ�c+��Wvx���i۷~\\s@�7`q�T�t�<�T�����{���x�ǥ\0ir�j��v��ڳ��*1&Ӟ�U�y��hJMA�Xq�t��\0hg��=�޳��H��t��н$H楏P#��`��~&�\\�H��@(�9��YK�ry��Vrz�8�5(�#�=3ր:�0¸l��VU�\\�w�.O�j�\Z�=y��Y��`z��rb-��I�YK��(efA�S��9$c��$s^��Q������GʤYr�����|��I��I9�\r0z��n� ��T���\ZP�=y�E�C�:�O4c��lt\'{�O3�Pw��O�F	�\0]���qA�nE@��jul�G4\0������&;VH�C ��\n��A����*����(s�cS��\0_� �Қ�Hd�#� �\0<S�\0�8��P�YG~�`��{�y��҆���Uyd��TJ�q��+������u(�Ԋþp�Xq��\Z8�}}*Um�<���!�G|f���#8�@���9�S�\"�9Ƞ0u�֝�<g�Zͅx\0�+F�t��(R6��So���?�=��8����U�`:��M��S�Y���\Z\0��HN3J.��I����ߏʠ7����p9��]��>�9��2/_�Jz����(��H#�QQ���k���j6�8 ���� c����۰k�7�$n�j�ﾀ7��%H@$\nι��z� Vk_�r��W��=�P�$��z��������K��?�C�T���H��J�\r�^I��XBO|T�p@��[�����}�ӥa��q��\0�q�����\r�u�\'ߚ_��ߧJ�Y���K��W\'\'�nps�TR��A5�n9䑎9����[ր���:qғx��qQ��\"�?�\0?wl����u<})����MǶ8�����b���8����\0g�P\0	�>�sԜq�i��ޗh\0���Ҁ�3��F�p9��m�<c����B���v��9��J�G<� C�1@�u�=)�.�*�8�0Uc�V�^��Dח۩��h��Bǁ���R*�P�`�\0,o�lj~�B^��+���85�VKt�]H$���4\0�q�wc��VI8m��N3Sy3N�j��ʭ]���1���H��3�\r\0d�^r}8�$�>`A��E,�S��t�����8�q@�v[o0:FM=b����� ��3��!��P3��4���q@	md�\0���E=,-�auKB}I�R�S�	=�(E%��냊\0�]$��w��?����n�\Z�\0u�s�@��=zZ�F	�#�ht�W�r!<zj&��&	2}J�I�U�.&8��zj7с��o�\Z\0��[��0�}1N0J����j���0��K���i���uM��Ǫ��ь��⛿�q�J^�l�����@8�N�n�d	���	Z`���뚬�s�q�5f9��8bS�R�����h4�8�A�ғ�8���Lt�#ia\'r:�.����\'�(;x��}���`1�@+H�@ĈE5����@&�3���zc��&�8%��~}�˅1�����@9��?!@��O���;1����c�<�HT�瞸�P�)�A<S���\rC�1�ڗԎ��\0\\���ح(n� ��Sۯ�Fjtb�>�����9��^���=k��c��9����`3�hv\'�y=�Xf�������S�`}�\0h����qJ%�8\'>�Q[\01�i��:�f�,��q��\0�@�k5��8=( �?:\0�2`�)�*�<*�{���>�-�����@���5:K�<V\Z]�PC��ަ]@)�q�\\��n�=)d\\�+u��~�xl��J\0�|�U����du�ګ��h�C�9�g����۽\0j���Q��ߜ~��������^��?Nhe�x�?QGڇ���|�N���L�D�Cj��;�Z��w<�0i�j�����.]ρ�ڳ.�s\0���jW�\n�@ϽA,�G��dzP���S�zq�T8�q�SŌ�w���;\n�\nבU�1�sZ�\0��@ELu�p!���!Vc^�44`t�^2�*���)͍��@g)��d]��mN�t�x����sp\' q�T^���}x�Wk�ノ�� �?�j\0�����ߵ�J��=��j3��\0�P�{��qM2��O֘H���\0���G�MϹ��ϿQG|�\0�\0&N\'�~�t���}����!��t�9�rx�n���T�\0a�{�G?�8��xqM�:�튑�;��O:b�e\'�9�⚲6r�u����y�`�@�	 ��(��z�Q�{��b�O#�J�E��\0By�,qO�8{�y]�\0��8�:�Xc��~���׵\08�$���7<~�!����\0�N��\"�8�����늈g$Tё��\"�x�8:zD��җ#Z\0^�\0A��;<�q���)��\0�P1��W��;qQ�*Uq���zP�����{(V�D�w����b��b�H�K~�bb^8T���=z��T/$u������*�G���1^@D����ϫ�l�?\Z�\r���O�\0M���5��q,3�w��@ڕ�3Ld�0��|���sP����\0�I5�w���Nx�Ҁ\"��#��i˂é��}}�\0v�����V^����6>l��g��F��?�9�8�?�#�����@\n�e2pݱӥ���pG�?JN3�GN��=	ldwn�\0�a�I�<�A�����׃K�224\0���=3��|�9�����9������\0�\0.;T���ol\n����@������+�n8���|���ڣ*���q����0Ϧ9�\0>���x�@Q�\0���������z\n�򊓎98�!q\0�_��\0fH�7��7<{�iI\n@�N?�Zt�,��)I�}�KM\"�\\�@I\"Y2�|T�wv���������q�N��H�{v�\0@���#���_���W����֖�m��(\nN+vo�:�dP(u�q����Z��N�2��V��\Z������<����U����Z\0O\"�L�W\0��%���\0q��4Ʊ�7�r�F\r�,6�_�\0++)!�\0����8#=�N[�x�! ��i��!�����	�ls�8�v��ʳ��z����3�y\'ހ5\"lz������;sV��q�����aP;��g��VW8��*9��\0�܀z��T���qU�%�rN}+:Y���4�%�NCq�*�l�x5�Y��=�W��߯4���\0/SӵK���Kz\0`�O�i�f��\n\0��Sc�J�k$[p�\'��v9�1׎*�\\�WwP:t��k�ÇBN:�%��YJ�\0���˹Ct��߲�Y�z���	^�c�F�`���ZF��b�.5��rO��4�<�ǵW����r�\0K���BiVL6sPOΞ�\02x��y�?���Q�1�=jE���@\n�\0x+۽Bq�z�ҥ�`��\0i�g��+N�t�f[c9��Z\09�v%�1�U��0@�b�z`}*�q�=(U^jVp(8��c��cڀ+Nr+�ON�ҵ�#���xp>^;�9����{zV\\��z\Zֽ#9��@���(ϯ�\'�0}������⏩���$\n2XchI�9��N9ZF ��?J\0q##�|Px��ǃA c�=(��>�)x��L�ޝ��\0�3���Gz���q�)��j\0��� h�>�GN���aO�n�����(xS=p:c�[�a���A#�i��8��PG\0�qҝ�s���´�g�N��\0���@�H�==� �ө<{�A\0�J\00{q��&�Sߎ:T�E��J�I��\0TǸ;Tˑ���/n��\0�j��� �<��v�I��������HX�c�\0�y��t��==�Ur;zS���x(ڿ����	��T���@s��\0���;w������ד�Y��q�p:�r��	�\\��cOG 	���9\'�?�)����<��K)���Ӟ����A�s�\'�j�w���|3��\n\0�c8�?֛��ʃ�ҧxnl/Q��S�R�@��\0T`�=1���,g\'h0z՝�$��� 囷A@$;����r*D�RA,*EP��{S����ۭ\01,��A �*AcrI�ȩՀNqR�+c�\0��Q�qӧ$ж���[#��c4��=�\0Pcn���j3\Z���=*�8+�ڡu�={q@|�aq��i�\Z�{���d�3�q�����}�\n\0��p21���l����\0�U��~|c�U�R3���@Eˀ8���\\�P6�PB�/<s�T�@�9\0�t��	�rs�*�l�t�������<	rOlc�\0j$ʃ9�Zڳ�\"[&|���8lg��8���2[��@��$Eʅ=k:YR`FF3Y��/��q�\rDd9ʒ1���w��c�8�j²H���z�U\'d$n7+RD�	��\0uŚ�\0g��/��xǽi�#���EC \r��}\0� ���e$g�kV�d��N5�\"mf �=�����dr���\0��@}�J��T�dV.��G*�`���q�k�e��#=���s�ҩ�>�OP�Z�#\n@���mB`IP@��,��߿�A��d�ju]͌�U�m)\\��cՏJ\0�Q���B��q����l� Kr\\�1jO���@K��@�܁�2\0�kb�ҧ\Z���3�N)�\0�\Z~H) �(*O4�V�H9�5tK�Jy�H�=�����@7��cڀ*�#�`��n����Xb�8�i�J�YJH1�MR��T¼l�8�ހ*�rz��z1��s�S�`g�ߥ\07i~�т:���;oS�\0F��9��<=�B��8����\0�c�?*���:J?���w���Ќs�T#ڧ��q�P��p>��n0F\rdZ��8�Z�����@\Z��9�N�5|EN��\0J?��7���40�~\\`@JN:�Y��5�63��������y�OJ˓=y�i]�qǧ�g�h�RO�yd���ϯ8�ێ�׊\0��`:���#8�:բ�21�S\n��\n�`�t�I�gu�1S�Jn�8��ϊN88��6}8�j]�g�������c=0\0�;\0q������@	�:v�����>��<g�v����H9p1��\ZR=�3Hs������\0�8�Z��|�\0f�bn9���iG��8;��zv���(\0\Zq��\0hz�)���Ҝ�f�1ۥG�pA�� 0��(�j\05j8�\\�QD\0<�2}j�X�g�4\0������T�P	�^��G�A��|TρМdP8���S=�F��t�Bs@���K���7\0�	�����s�@�{Rq�q�S�ьc �@ǂv��T-��8�⤸#\0ӱ�Q/,8��\0&2OӧAMfU7�S��	\0�i�n�0pE\00�������\'�FE$�O�I�x�(���c��O��P3�\0�K��#��aT���\n� 2$c�q@`m�8S[\0��zt�p=���(	�w��m�����A�4��q݆9>�0\0��N�|��)�<���X�}(�9׵*���?҅#p9\'=jD�GNGq@����fq���t��AP0|�\n��h)�\'��jQ�A��b\0��EV�!����@�8���灞��U��@�s�{U\0�}j\0�����❷�\'�\n�o\0�p:c�����@}����g� d��F�KrO����qE�i&�)�\n��&�W(An9\'+Jhw�FZ��2rCp3�(��3��ϩ$1���ez�EK���ZЎ���@��_\0q�p;T�+�q�����7/���U͹�B��ʀq�>ԎpH���ݱ�z���!�e3��Pdc�ؚ�/\0Ꮶj�����N\0�����_��n-�$��p{VI\0t��烴�G(VMk�\'10���]���V�u,j�}�>�J8�.s�@�~v���\0�B��7��1�rs�7o����V�U�%yo������9ۓڵ`�,������A޳�����Z�����\rDҬ���9�H|?f�V6`{V9�T%٘�J��R��_v1�hK�\Zg��2�J�UN�YKC*69��{�mcMhdn���\\3Z}�����\"9��^�r� ��i���þ��\"�Gia5ԑ�GV��)u�2$�h�}��\0�\0�ơe*�\0��c���jd�����.��d��w�,��%�|zb��m�x���%��\r�F8+�C��z�u��վ<������y5��]۬�8ܼ\Z\0~�t8�*���;f����1�i���	84<m\0�T�h��rq�;8��Q���=H�9��GAS�0@�Pg���X��84�k�c�jێ��j:sZ�c���/��8��U�^��P�ߊx=2hm����#q֢�G\"�;v5�u�N?kFR~�\0�f]s���k��w�z��\0{��z����&2z�E\0*��1�=TS^���I��4\0ݿL�4�	�j`�.y��\Z2�zPV@�SvsҬ��ZO,�;�p�ݨفߊ��8�)Ld�+m�����U������1�4\\�?Z���y��d��lUw��~=���:t����Ґ�z���+�����>s�aVc�޳�ӷI�OYpq�J\0�Y���)>��S���~RG4��a�E\0\"���Φ�\0Á��Q�<s��S��G�����0��W#F�5�2�֬}���8��ʰ�p~b+.F,Ğ��B��9���9�#��<q�TD�1S��G�S�\0נA<{w����\\:�߇z\0hRH�)@�N;�p���4���Pyљʌr3L�zN*ă������]HS���s�\0��䌀=�5$�t��Yp}����1�A(3�����O�[�|i�&�<\r�sIݐ0Np9��Ԁz�b�G���f́O r;�\0�Z�!�yP��=x(nI���2;r)m�}8�ܖ<�d�c!�9�S@�8��\\�x<T�[�8q�֢^9�c�9H��{���G\\JU���j��y#=�Iq���u4er���*\'8��T*rS�9�V��8��\"� G�j���s��A�2�a���;��Ҁ0�Cqڳ�.rt��H��a����q�3@\Z@eA��x�`�ߎi�d�#ޜP���\Z\0@��>����f\n�b�F�8��@�܊��o��[�@�� �sI�X��ZC���h��!���1n1�cڥ.1��j<�\0�}���rx=8���3Ӱ�ÅϦ1G��I�}���J��z��\0���֬�e�Xu�T(���)�����@���d{S�%��ϡ�-�\r<��rh[K.[<��hɢα���kwG�D!}����6B\04�w4D�j�z�Wu�}V����\\I$t�9�\0>��r緽[�\"2Fx�:tJ�C���ڬ��*�7_s�\0WeQ�aY�����������r;`V]�L�s�	��4OF���uoZ��Gpr;S�s�Ա�db8�{�P.�!�b�ƮYH���\'9�*W\0�$���kU,>\\u��Mw*;y�1�)5��#�?�&�2��`�{Ry��A�q@�P�q�y9_L�T5�`O1S��g*��t��c%���8�P`���`��W൏���;9`�\r�-�/��qoG�p]�G3/\'�Z��\'��#�q�������d�Nk]x�\0����A��ƀ�q�1��@:��8����\0*�63�zU�s��\0iZ��ӚՃ�����9�X@��@ۊPy��H���.8���w~��-�qL�ץrOҀ\"�$g5�s�d�V���}+:�px�(\Z��*�BX�j���>�S3��@�#�~�b8�@\0�jx`��sWc�� c(?�4yLN;֨���ޔ[���	�I��ֿى8��G�H��\0��9=�Q�	��k����ڐ;u�7���j�����WE5����w����1�c��0������G�Ҵ.�O<zU�b�!�>���Jn�9{g��zS8ݜ�&�z���\Z��?M������I?Qހ�ؿ=�H[��҃�<��F��<g��ր-��t��N�����8�R�����	��9��ϰ��)���ޅn~��\0IӲ�)�ЌP:u�\'ݳ@\r\'�S:��u���(�#��\0�OqQ���\nvx��(��?��PH���L���N$g9��z\0��\'~�`��S��ܸ�⭨<�x�Ew���2�<cN=)cP9e3���s�#�NԌv����O��8�ڧ�<G�zqQ(�ݺs�SV���3�\n\0���zzS��x���p	�ҕA���\0�)��A�q@�qJ�Ԓh�Fx��9<�:Ѱdc={��\'�	\0�\n\0a��A�t�6\0E#g��>��cԯ<�@��^:T�N�Տ�B��w�.0N�~�r7�;ʬBF1*�m��j�8?�J\0��\0ʧ���\n�}7Vbc��@MW����`�q]f�u�=��D�d��@�xx1����U��+{J˰�d�=�\0\"�����z`~��#�S�������y��Ua�E\0F�a�L�䎼����	�ԢP��\n\0E�\'�T\nI6(�sI$�}2i�6�x�u������*��R\"��2�����W�<VU������4ʑ��ps\\�̞l�㧽\0G����>��h��s(�y�� �y(<`WAl�p1�\0ݰ�|����\"�}럱a�Mt0ٟJ\0e�bD*�*z��F�����׭�k��_o�jbL:�Ps*NpGaR��ӏ|���j��ҕT��{P�3trH�Ȑ̞�=�;h+����1�PG�	ĩ�ֶ-4(�=��q�\'��� =I�=*e�\'����������q�܁��Q�(V�O�͞}*�ٿz�w�6A\0=��x�L9x�����������Jsր+�����O����ŧ�.�8d�O?Z��W\0[[[dp�\0�\\�1�*�VnT�:`i���,q���J�_\0�8��@\r��XN��>��Y�*��nĊ\0��8����<c�l��)�?LP\0@@�5f\07������v�P��9��\0�`v�Y��=jA��^=(��s�v9��0)�1�?Z\0fAc�{�t�{��w�Cg�z\0�7LVu�S��+Ja��J͸��(*\\o�3K\0�1�i%$7�\"?4����Є��Z˂@:d{քR���4h(�\0����1Qy�Ri|�3�\0I�8\0Pg�E�pz���@��#�(�;C�p{Pg��\0:\0l�;�\reݨǧִ&�qֳ/%q��v\0RG�Y�g�5�væk9���8�\0B��8�F)�v�p@�OJ{c\'�����T��\0�q�����Rm9\'�)I�#�F:�Ӂ�q�{P6N�^��&3���q�K��98�\0\nNz�sבҀ,�t��jE=�ڠ�>���8�\Z\0�	�֜��}=j�2	��?Q@c�b���H_�N ���(&��4�^��Ԍ>��F@�x�y�p9�;���� �iv���8�����%����Z��뚖��a�ڀ߿`H<��>�rH̱����F�G���U��-�>��,N$=���Q��rõhF7ɇ�=�Y��A��P+6���ե?/u�*����ԑ1 �q���P����O۴t�65ߌ��?���ր)\0�>������АN1�ޔ9\'��\'�ߞhby�\'�2?N����5\04���`���J��a�M�é�#\'9�=A�.TN\0?�x�����( ��2hT\'�21�T�Il����N�a�:�@U��j�r�2zU�\'�*D$NhMr���A;�C��1U��͜Z��#���sS�6��Pv1��ҭX^��G)+���$��VG^��;�&XO�+�(�(S��nQ�z_�r��cZ�R���v��{�Y�mnQ@XJ�\'�sR$��r8��\"ە`I�ҬƥS�0}��[��G�57���ǵJT���HOb1�OJ\0�ѕ$�Z�$�P�`\0j��T�˜��X\Z��$M(E\0�4<��\0U��31D?(�u��mZy0T��-���N�Pv���,�)��䪨^��j�wn�K\"���6���@/�WIh�$�{�-fN:}+O|�z���j��mn>���Z� �X^)�����r���(���� ԙ��Zg��;In�⥸�h_�q�\0i�����Ѷ���)L��_Ҭ,jˌ���\0L��ʭ���r@�Ek�i�i[�8<��t��=����O��n��s��P�yd��s��� ��\0s88�R\"� �Z�q���u<b�%!�z{�������\'$��ڭ�Hc�h8ϽgD�rǜ�\0U\0Z��(�)��x�TY8�y�����@�� 8�#����^1�����ڀ&^�/\\�qQ �G\0T��8��֬��U`\0~Oz�\0�g��@\Zv�9��h���k*�`s�j��c�P��{\Z�\0\0�8���q�sRE\05T�HT`��Rm��x��f�)�:���ː0kZq�V]����(�m<�T�q��Sݏ���A�+p��\r��=��w>��kJW�Z>я�~t���ӡ4�tq׏j�7/�s���\r�J\0��O��/�x��5�����\0�R�����\r�s����i�8��c���qLi�v�\r�.��3Tg��L{�C;`��*\'r���������;x����\0�v3��ph<�};S0qЀG���2a����\\���\04��/������^�<{�`�7c���\0֠\0��Q�2��N��<�x�Nh�1�\'���	z�O^��8�Oƌ���N�����	s���5<|c$qڠ�@ c��	�t=3Ҁ%\0�{`ӽpq�)���t�/^A8�LP	���!����ғi\'���@������:ԛ_�O�օM�N�����s��B\0�A<��N*sӿ�3�� �:+[�����	�m��VP�p*�:��|���z��ļD�$��P	�T$�g�1f^�����\'�=��r)W=~�R�Ğ��T0�B�玝�́�A�F�@� g�	����#dH�R��_�4��\0�AR2pq�BGbq�($c s�E\r�����\0�~`O#�ҕA S���#�<\ny��w9��A�Pzz���\'i�}{3@����oZx^�\'�Ҁ�#�P �ʤ�/q��4�g�9P�;N�\0J�AԨ0Fzu�G\Z}�J��\08p1�q֦\\�>n����1S*�F9�w�<�0I��R��[�i�ߌӰs���P.,mnW���Q�Yw\Z!&�`��Z�X�I�������P��Z�	 u�H���\\<����H s��Y�\0����?��N:f��3�c�Ps�F�����8�(6$�\0�3f����\"瀃-�����#����%#*O�)(�?���V8�\0�R����Ϡ��_�9��a��s�\0LH�<T����;J�����j�,�3��@�T�t�j�B�\"���ڷ��ր4��Wԭ�֮�p�EX��&����%��X�`F�Q]�[Cu�\n��+Ŷ��Q�G1֨�:�X��q��\'����֎�KFx�l�#�Ev1�d��F�)�Y���:�9�yN�3�VŒ��|��{ԧM�:c�*D�f9��P(Wi<uZ�<V�=��r	�������;���PO�\"NT=;s@�9����\'�x��s�W�=R�nL��@2��>��\0\n\0�<�y�`v\r�T�6�t�� ��\'ߵ8/S�^�\0���ӽ?�qF?��Zpz���U��zc�H�c��t�A���Ҥ�	�\09q�*L���8�8�pG�\0\0�=��=�׵V�,�՘z��\rKaӜqZ��~�k���Z�g\0�\0[A�52���`z�@H�zP����SX`�5\"�\\f����@\'�q�k*��ִÃ�Ywc�Z\0���\'�������N�s����N{�\0�\0D@=�H��T�I=���X�@��Z6�T�O�oJL�1@\nG�9G���~�Ҕ�\0����Me#�����G?QQ��s@�#��cv犜�Á��F���@߁�#ڠc�F=?\n��=sP7��M��)���>�ǥ<�tSq�i�|\n\0o��GPOҚqǶ)�0:61Њ@������\0i��>���AN\npx#���X��ǚ\0�h�N��Ojn6���\0b�:��s@G���M�`�	�8�M<zw8�4���E3�zҜ�cހ�Jz�����ʚ���Z�\\f��8���ozz)�Oj���<P_/<\0x�MX�`\0�*�����y|�{qҀ+΁�̧�N�r��8ڣ?�_P0y�EM��v��>���[��*����=��!<r=�I �.\n�A SH�?�e�T�jS�۠�u<��@\0����ϥG�x?�@�8�qI���9����@\nH�>��\'$��4�H�랔s��	���CO\0`j!�����=	��������?�8/C���\'$�=I�N�\0 ���qJ�3�sӽ9���zp)s����UA����1���>��\'��i�r�?.�ag!x�R�c�|z�1�}*u���@(�z����Bic\0�rG�M��@�\0D\nF#�j;�s����@{sSy@��ɠ\n�\0������ uȫQ����N�>�JH�n�UK�UA9r�P��x�a��K�\02I��y8��6ѦAl³�%ߟ��5�k��9�@\Zl�di�h	<}M	b�����ڀ3^ݐ�W�a��z�\n�1\0��ޫ��8�P�^�\'�e���ְ�^T��g� ����lsӏZ�p*\0GQӽ	\'���\0a��2����c�����cB����\\�7Zsc�NEqJ2A�\Z\0φ�T��� ��J����w�����rAȧ��m��T�Eү����(N-gL�r�+�\'��e>\\����y<d�0�J���5�e�-S�B�P��pү�kS��[ָ�P@p(o]��_Q\0�5�6��M$o!r�Fh]F���\0s\n��\n��k9\" �s�/�X(���6�Q����@��G>��z`u�s��^F)?1��q@\n9��1��\0ꦀq�^��������ϥJ�`�=j5��(�\0�}=LӺ���I��J2@�4\0����0�5Ty��V`��ր5mr\0�ҵ`�Zʵ�SZ��s�j\0��c��Ҧ\\c⫧ҥ?�\0N���v�Ն8��S��y�h�ǟzʹ�ӑ�jM���]�9��t����O�W�r	�MrX�q@X�q��\0�XH�3��)�GӯZ��:�E��n���(���Z%�ޛ�s�P1��銼юr8�������Cg94�8���VJpN1�\0����ު̿7���g��?�T�?�1Ҁ2��8��*O�f`A�#𪭜~�\0��x�ni�r:�y9펃֛��{�(��G��ˍ�\08��B�v�s��ۜq�\0�Ҁ\r�\0�w\Zj�c��ۿ�\0^��/\0��⑏�ʎ�$�\0X\0`��R��i��>��y\'�z\0z��8�jd^8���c䌎�ڦ�������=(>�zu���#Jq�q�E\0\n:|�\rY�z�u�b1�~�b1��Ր��sQG�=;\Z��\0���@;�@�ҟ�u\'����PJ��1ڣ��[���Ã�V�9�j0K��}�;��v�<�N�p��k���x�&�?+Ⱞ����b��A�O.\ny�K��9���@����3��^1�ԇ�~^GP����3<��9��O#���L\0������2r;�N$�����O��S���;P��q��i�`{\ZvA8 ��O��=(Ea����#�\"�roQSF0G�,g��i���ңB89�je9\\��4\0�\0g<�z�FX���!8P@��������@�I䎽3�r�сץD�`m�{S�l��㩠	���#��`L\Z��c�Z�H�{���\'�֭G�}�T���Q��\0YU�H���� ܜ�T���z���Q��T��?��pj��O\0�@.�\'8<t�k����3]��[�\\���W#��Pq�I�֯���g=;g�e+��jq!\\�d��\\l^N:�H� �=+�;G-۞zR���7OJ\0��d�~�Řtnx�X���p��U��8��\r�|9\"������m.��n�;\Zص�ڣ�\0m��.r{P��ֳ��X�z����P�H���qz��S�5+Gj���!��\\��dRR!Gz\0H�I8�j��\'o����X��Z0��8��\r�Y��Uޫ��e[�� ��\ZЅ�9=;Ps�ܩ�k��t�7\'.{�פLt�\0`W�K�����Pi2z��,9��\rL�<dT0p8�8��1�� �s���)#�t�\0�q�q@\n������֚�=8��z��\0�=8�L��W����t�?\n��T\0�aq��K�8n==(�=��FrG�(\0�?�Z�r1UG��:ը\0&�5��g�+Nv��h8~G�\n���\0��-&x�\r��j�8�84���h� ��ҝ�x�y�*�8�$Ԡ�h��󬻮��iɌ��z̻����@wY�\0J��1���=\Z�͌�\rp;����t�T\"��*ビ�\0XR:f���ޡ���I��ڀ&8\'w�(��3�L���P1���������{g���(dQ�=�T.;sWY�:���7z��ۏ�\"��B�g<�jrCҪ�����7�遑�8�0��A8�Ǟ��0�����\0�3�#4��*FF1��(\0����#:�@x�<`�}��Ѓ�^��;\0�������W��8���P3�\'ڛ����)����$@2=z�@q���N}����N� �O`)N:��})��u4���߃@\n��_¬C��G�WC��V\"���(��<������j~����_A��I�q�#=�1NL�v���@�\0� t���,H};R���\\\0���Y�7���	{��@�}��#gwZ�|�B����<d2˂x85�<�H�#gZ\0h#���c��+�$n3����P�ƀv$��]�>k���@���)��=�b���\'��JnF����_�h�>���t�[�����ӧ\\Q�3�sҀ$,Gw��3�~a��l�q�J^�J\0p\'��1R�q���B8~P1�����Ҁ\'ボs�T���N�dZ�~�*�\'�?J\0��X�t�\\��_�5[�@��]�����ހ3����9�ƣ���q����?�\0H�#9�\n��q��ҫ���S��P����z9`�T\n}8ǥ<7s��-�&\'������`W1�ڧO���=�`�S��$p#�\0���7VP��Gz\0�e@�r;W5�E���N+��$)\0{��K��N9�\0`�n��`���^\r\\�-���J��9 ��\0f��$�c����8��ҲrF��<~]9�	�]���A�	 >�z�z���#��5�����m���Ճ���qȩ�A�q@�񌎽*�W7�\0Z����	���4�h�zf�:��IL�zv��i.�C��:V��/?1��\\���P���P0� �ޯ���V\\\'�*�\'�3ڀ5�%y V�n\n�{V��(>�5�����.�sm �\0dכ���~دDߺt5�o�:��\n�}�B�g��8?.sҠn=}(���P�y�h8^��zP0p}(@8�1ǥ=A��;S�u�R($��t��9��򧁃�M\\}3NG�@�4q�x��{v����g�8���9�����Q�]��a�(V���jDq�<j˶n;qWc ��@�s��w�y��j��?�U]��p>���g�U�n܊ʆl�Ʈ�&x�&�\'���8����}��|��g�;�%�S��@�c#���7>ت,?Ҁ$G��S���U�=09�g��P���ÌR��8������zq�j\0���s��CI��W��8�G_ր_x��+u<{T8�9��\n}#���T�|�*v~~�����_�@�8Rj�\0;��n�<��08����Pc��9�1� ��@�py�Ji7��ӵ\0\"�1�/\0�\n:a�.;�z�4���d`Px�9��9�d�ҞGA���#��♃��(�\\�cБ��0\0`\n^��\\dv*c�0Z�0F}B�8��S�\'Ӂ�4\0��\'�)r3��;t�)ǃ�z��H��V\"�\0�x�Q�rz�Mv<��J���PD	O�\\X������\05\"yl�\'�BFUr���5��F����U���$���(��K�6�tFw���\r��5��W��7���t�2����Z	t�hd���ywo%���#ڧ��t\r�u�\r/4y`�N=+6s��o~x�r+�qPI��h0�������1�\\�ls�ք��\0=:P(��{t���<\Zi�鎜�>\\��@1��R�p9�5����K�$��ր�y��ڕ6��=�3�FA\'��$���\"�.054d������qORs�\0�\0LP{s�iˆ?(5\Z�=�8z��r1@��sOV\\c\'���Cv�����ƀ%L��ڦa�`��N8<T�	z}(d�;��o ~)�H�{R�\r�>�2���c��8����0��zS�$��}q@��]���K睻I��MV�H����rhĒ��tZ�(�q�)Z^H�$�8�g�\0�r��s���2D�8�V����?\n��<���s&A<�ޣ(=��x��$���;��Og\'��ۧ�K�dq�=���y;B�iJ��PfS��\0�W�`��7=�L��=5�F:��\r;m:&\0�j¶-��Z��E\nl\0��j�01�/Qހ �c�j��ܸ���&���z����Z\0ˑrױ�S���y��o\'�^sޙn����@\Z�6~�#ڮB���w�Ȝ��x�ү��FG4���p.Fx������e��G����=3�\0� �r=j#gӵN�;t�ϵ\04����(�x��O_lҮs����	A�s�R�c��*%�>�:�(��<P@^����\0����@��4ӏqJ~�=i�\0N8���!�_J�PH<s�RO�ޮ��s@\Zpt�ZY0	�Q1\n:�T� c�>�\0�JA����n0q��SN�&��\'$�@\Z����|��qX֣���a�@��F耿N�t���J�y���\0Ź�=ǽT<���j��}X\0s��\0*�;������	9�J��Ƞg�ӭJ�1��R�G)�8������)�\Zk�#Z\0f�:t����c�J�\0D���U��\Z�Þ��T�=(:^�A��?�S͞�����p8�8�I�L��;��H#�\'q����\0 \0���t?QҐ���A�c�^H�\0��H�\n2\0�縠`p9�4��F�y\0�0,S[��<��\0M��ڟ���Rdt\r�{�4������	#�F���:���WN\0�늕O�׷49?������=0�z3���	��<�X���)<UX�9!@oLV�k\nӐ�����n�)e�;⋫�H\n�S��!�M�r�[�oZϸ��@1����(9���x9#8�W�`�q���^�g�0�8�Ur�#˂8��9����i>��@�\0>��N�Fއ���U�6>���\0U\n�,Ì�ZUb�.ӚG���9�4��;06�1�\0\\�@�p*&q�rzzTq���`�N�6K�/lw��	x9<��0H�:�����\0סG˸��@s�R/�ʃ�ʜ���8��G����z�P�����F�I�I�ZQ��p\\�����\'`R�a�J`�r�����H��\0=pG>��@yo^�\0�\0�\0��=��\0J8��8�<}�1��g8�QK��<�\0�tϽ(A8���=�MJ�s��Ҁ$V�@�527�~��;\Z��~\r\0I��<�iq�I���\0<�c\r�m�oJ\0�3��S��y�*��Frzz��y�	bA���@\Z^��D�ldt�rO�T&S��B_n1�R��#��[���ʞ1OYI��\0\\w��|�T-�`�\"����i�̠����rs��R�,\0�i0�hP\0<~=(0Gp�4�) zd�)�1�9���XȠ=�l���L��:ջut ���\r�v%A���ҭG:��I\0�����b��r\Z��F[t�	�T�r*�s+��j�iT.	��T���	����j�>�Mq(1�q�NsUc>�P����҄��Ʋm�\0�8�	�px�Z��4��<�>�Ȱ���]a�b��\r��ڹ�8�u\0U����lu�ۧJ�L�<?\Z�G=FoJ\0o��r��8���:����J\0�>��槌g�*(���O\'�P��8��H@�)�`�B1����n��R�8��l98#ڀ�pOz\028�5E3�5vp2y�\r@ dv���UV&��܊�x�� �{����y��U�[�#��U�3���a�:\Zַ$/l�qX�7��e�@���P����S4�ݏƨ�I�gހ3.:�j�$��\'`rx�K\0��@�F=x��V������85~��\0^�+��\'8�ښ�\0���>��@�\0Qh�S�>�]�?@+A�A=\rC$g�3�MG�\'��@��OsϵX1���\0S*1�q��r��c��j�u8�]/V�\0b�9�v�뚀��qǽY�<�UϦF{PX��w������\0�O��q���r3�q@\r8+���i1�8�K��p��	�+q��4\0�r��t�I��s��p>^���֛�c�Nz}(q���e�ǭ\'}!�G<P�N���q�g�PI\\�U�\r>k���@<\Z\0���=EiXi���jZӷӡ�P��Xp\r\\�ͻ�׃�c4\0�a��J�*��*��g�@���m� ݒgsQ,�gtjź�4\0��3w��2l�G�:T�N��F��&�@<ٕ�*r{��\nm�PǮ)�[�*`Oj��Do�ʟ@)��iż��w�<&@�z�ީ�u��x銲�ː���֛3�v�@\0����z�L��c�֬��$��\nG_66���3;\n@�5(ےN��lS&�� .2:���;�����	�8*I��)���z�c֙��m$7\\\n~v�<zu�\0n=9�� ��h���hpI�^s@\r xnp=)A^�8�8A9��g�9��\08p��8c�S�b��B�����Gc�\0I�#ӁJ���=�\0�pyǭ9r��<�v�݂A�jn\0���\0w91@�d��R���GAی�a�@��ާ��:�g��L��N9��͌tu��\0:P�\09>�����OP	�sQO�Aր*L�����E���Jtŗ�lqUdc��\'یzP� �1�j-����{d$�c�t�$N�q�Z\0�9���N2rq��W��rz��f@8�P�e#�<ҩ�*��䑓�(��g�@�H�`�Ns�j�K�=?Ɵ�qӏJ\0Ҍ��:���*:\r�G����3��r9�a��P�[��\Z� ׿�f��\'}��*�:P���hq�����8� �y���N9<栖�]���\r	���#�g$u�Ŕ����ը�<�Ҁ.H�����N��	\r޸��Y��T�=�\0X�/L��h[�\0��gҳ���\\V��	��\Z��W���%���+��Fl���P���4B@9�����=�U�x={Uf�Ԋ\0g�9p3���=�)�0~�he9��c�XE���<t�XA�4 �?JaRA�Rv�M1����Lg�Ң#�q�R�8�=:TMЌ���P��1�j�m�21UG\r�zr�J\0ҍ��>¤�����zK��/��΀-H��}zT,�\0j��I�Q����~9@���ڭ�s�p�X��:��M��ǵ\0k��s��Uy&�֩���y�1��\0=����֦�����n�ǷZ��ڀ5 8�\0f���\0�VL2}9�U���~�{~n�o��*�����N�\\g��\0<��5���䟥��P�J����zUEn���)p��\06B=>�B��է~�9�r���\0f\\����V`H cެL�,8⫷-�3�\0av1�M�$q�q�N$�#Ss�`s�J\0E���N1ړ��LzR�s����R��)<�q@\r�.��1L$N�iޜ�q@�y�t��	��\0���1��_,�uSS�[3�緧J\0��X��\ZQ�2y#�tM�;#���Z�Ɋ�8-8?;������`y�\0Y��ٶNTF�q���S�>XI�\Z���Y�\\�[����6�Nh�J�0r�j\"�#e$�F>aT�F	)\0����I!�����\0Nכ$ew-���F�2@�Ud�?�z���T/�3��4bY���qP�(����{w��0b�>�Ta��Pn�8=�\0L�y�og�id\nɹH�8��Bd�@�)ZV�6J\0>V�e@�Gz�˫\0�#u��HT�۾����2;���@\'W�ķ^8�U�:H�AZ{W�^��M\0bFh�8\'��)��}���@	V�H�-֜�黩��@��9��\0���=8�Q�$v���?�\0 ��R��2sI��7=�=���n��Ҁ$@?�p�)���S��J�Nz��Ƥ|���Ԁ~f\0�T�{* @9�9�jH��OJ\0y;�����C��i��g�)\0$��c<b��yc�jX� z{T#�`W=*Q�F?�|�� ����*p�\r��}*�dz��������<���1��)�9\'��9��i�����(:e�2;�\ZC��u=�V�[m9��o��\\t�@�A��Q�ҔF��^*m�O.�@�\0@m���}����\"�<9�*�0��@�f���M4Y��x��&�)�?��OJ\0���!��:�C�ʠ�8�V�Nʸ�Ҭ�20p>���I�A\0��I���d�V�AI�2j`#Lq�����,�zz��4d��	��kId�p�<h\n��4�I��g�Q����s�]E�6�^ư�c��P<c.�8�Kx�>c���S�I��եG����^��S\0�#�@;}j=�q��&�؞�殃���z���CW_F1�@e�9=�U	�==j��zU	F8�\n\0�.U��>�U�W��ګ����@\r8bz���=�4�A�Jr��8�\'��3�=*�ÿ�A�8�V#�@�\0H1�\0�4���뚐z~&��88��\n�O����j���TM��j\0i ��:Q��Jkprz�78�ӭ\0I�������Nj,�ˌP��?*\0�p�G�ڌ�T{��׽)�s�\0q<t�t��ӌz�i�y��ǥ\0I�u��� os�S2sש�<py��	���F�Ȫ���T�ߗր/G\'=y2O�sTT��=�T���O\0�.	�df��=����鏥#�\0�@��1Hd�`��b�?x�w�C@��������:�����P�ù�hvp:c�3�L�֞�{����é�ך\0��ʡ<�=��ϒI&�rps�ˠ���M4�F=>����#�i28���րr:.;w�ppz������v�:_Z8����n�\0���!��7���OLt��C�r3H\n0:��@[�[_����|���\\�>����#�4�.����Ҁ\Z�m�m�����6� �1ܚlbC����SR*�*P���@�U;Cv�����f%����{r�(�y\r������w3ڀ+��E�g�P�����um�(��\0��t�c,�Y�\0��\n����N��/��J��+`w�R�Ua�r��A@�2�sM�w��q�^�2��8�O\\�)$����t��Vn��jx\0���Ҝ<�!<�\0	�MbUy`x�j\0�HU��?x����*ffݜt�� :�{�h���d`f���n	��O�|�,��5W!�7Z\0�q\0nFAީ���d�:��d�Zλ�t?AY�K��`�=G4\0��*��ȧ�qװ�W�랃�j�[\'#9�A�>����?�������i����ڝ��`��\0K`��i�F#�3���c�Ooo�\0�Á�#�&RO__�Ia{u9=jl`�w�U2g�ڀ\'��F1�M6@9��H��8�����������/A��M\0�2^��)�)�8�@�9�v��ޙU:�\0.�v,��N3�\Z\0�@Q���H�=��Lݎ��i7��#�<Pۦ�\n��sLW\'l{f�	$c��@<`H�D	�x��e�b\0�t�T)�\0FYv�Z�v�q��,O�q�hq�<�A�\0^�xc�<�����#��RY\0��Z�LJ�p}�\0N����\r8d�n�=x⪇�>iL��j\0҉�)��iŔ��k3��✒�s���@\Z���v�m��z�Y��]��A��<�7R2y�e\\Ƹ#qZj���T.�9�\0�X�lGn�r!��F3�P�n\'��U�$t�	�Gަz\0G�����5r�\r�j���И��� cڤ|�ԌF2:v�d�:�?\n\0�/=�3���{�Z��*�Ċ\0�62pr}j��I�;\n�&s��U�=1��p3���_�����Q��:Z�dz�ƀ&Lv<b�\'J���8��<(�\n\0��\'�1�v�}F>�Ӟ�p@��=j�\'��C����@��\0c�PO~s�cQ�8�_�9���G�\0��c�ҀFq���K�ɨ�8�SFI9�\0J0�ҝ�9?Z�v>���\0�րӟ��\'S֚~�0?\Z3��E\0;#��\'\0����$��g4\0��϶<H��	�O�\0���g>�a\\q�\'��`qU���㚑_ڀ,�\01��@�w�P� g=�Ѽ��	I���ZM�=z\Z���>��\\�R(}�\'�������U������Ҁ%c�Gj��=py�F���0���=I�7\0��#�����pJ��q�FrA�ǭ\05����x���=^E;={g������{P\02�y���Sx�	����`�1�<�FyQ����\Z����M�p�1ݒG8�=s�^zR\r�y��=��{�v\'`�H�՟,������QIB�eNx�U�ݤ�]��8�\rhn�n�b�>�������Z�j�`�ܠ$\n�%%���Fއ����ف��I�M�������yV+�p:Q�E\'��Ñ@	+F�8���43�c9���w��,t�o�Cg�LrM\0\'�1��=���s�v��[��=i�\"�gq\n9\n\0K5�(a�9�qPp�H�HH�z���$�sn�ր%I���J|�`����҄�+}ރҥ�6�ބ�P`�$W�d�)�����=3�iK�?9�wd;����\Z�1���fM�Lt�$&<�$�9�}�n�^�\0�a���g�V��WN�:b��An{�=j\ZX�s�\0b�n=�Ұ9#�j�{�Y�;X���A�ׅ��\0*7<�ls�Ɯ\n��@���Fs�W<��)�Ob���H�.2\0#?\\��x(��zL���03G*8*E\0J�@#�����R�mOJ�p�A�g��R+\0ϰ�\0>�iH#��{t#�z�Ȫ���p������~(r���4�9��8�Q��y�9|����P��#���Y��	�sT�/�1�*ʰ���L\0(p��s�� �회<c��g?�\0H	$��S�$�zw��\0J�B�?�\0*��/�3�6Uݐ1�ЁR� gJF\0t8���\0gȻz��T�lw��)#�x�Rt%�9�\0D����ԁ��>�݇:PO�t�	s� t�An�O�4͌�R�1�h���\ZU;q��ZnN8>�*H��s�@��$�ֵ�����C���lAl�@�ߚ\0S��\nȜ�I�5�����#�`�Ab1�ހ*�K`��)s��:R�#��֕p͎�J\0�fp1�ּCˈ*@�V��c=�ڜ�ry�@\nq�������`v�i�O\"�s�@���:��3�U��޵Fc���\0� �8�B@�EK)�N*�ǰ\0�djz�Jf@��pi�q�q@��=*�d��5QN3��S�1��\0�c#�\r1��2>�d��ǥ\0E!#����<u�O��8##�C!�~8�9�x�y4���>�1���Zi�������z��x�H�1ҌH�v��y���\r<t��D�(��Ozz��j\0q�](oq��g��G~�\'ڀ�o_�\'C�}:�{����\0���v��}=��pLq�i��:��J��(]���O�P��$����� �\0J�3�(\'���a��	ǧ>�\0� gښI�:BG_�s�I�s��t�\'�9�:ʛ���\r��\0��)��`�3@#\'<���ӾO\0���#�c=�qN������\"���3қ���pí�:d�I��g��\0nqG��N9�\0>Խ09#���p;�\0�ͷ���)�\'4�t�cv������M\0tN���wꤑ��g�3g? �j�,�8`F�	m�B���:�Hv]UI���U\"�Q�5�����j\0j�l�\0���OL��Hܒ�T8����X�x\'�h]�.9r	(�C����H�Ġ�ۿ��:RV�g�К\0\\ī/=��(,[�e��\r>$�5l.��O5�߬)��J\0NI;�#*�k�.�Oӕ�C�A��i�_�j*�x�,c�;�U�0끜q�c�[�� `)�����P�}�8�RF�x8s��U-�ɥX��@�\0Ld�w����a��l`���:��\" \0����MV��Nj���h\"���2y��P���>eڬH�RҶ8�#�9PG�����@o\"Wc�aY.����מչ4a#�@C��&C�xs�c�\0���|�#9<晵�A�~�Xs�����x 1\'���\0נ_��\0w�AK���ry�L�C|��1�0(�$m gQ@R����q�piː��@�j2�A�n=�Fp1��\0YN�$�t�CI��9����t��\r�1�\0��ddw�sMT(�zC��O������*���*��\0�P��\\�¨!�\0�?�?J�YNz`c�\0\\ݷ��#m<=�U�����T�����\0\n\0��I��N���>�Je>�U��:\0p:P��zb�T��qLG\0��M{}(M��t��X��v�$\nqק݅���a@&Ջch�����P�[j�\0?N��C�\0��)���8�N�v8�ЬHx��J#T�@�z�\Ziro#ykB�If!x�֊�e� �Uax �t�\n�؈� �~�*� ��S�S����\nO/�n�V���5�LrN0885�jr,VG�`��\\�b���@\nrˁ�{�#N3Q4�屁�L\r��c�\0jD������U��h����*9���(��@w�=*$9����n1�8��\\�{f�#u��Z�1�<�j��\'�Z��q�\'�@I�\n�u�#�\\�Ê����\0&q�1��(%s�C��4_�\0H�tw�Ո q�Ud���U�q��}���c7$t��ہQ7x�\0�n?\n�䞜t�8��LTd�1��P=0O����t��q��N@c��\00`�I�#4��׎}�J�z`zPT�r=:P��=)s�ޓ����N\r\0d`�9�*f1��S���\0.O7\'�1ڗ��ޓ�O��8�8ɧ���d���	<c�4\0��ݺ�4�=�y���A�P9�\0�����c�S@�BG�A\'?ʀ�q���%�{␎��G=q�\0���!�1�Fx����^�\0�=\0�(� ���w�1ϥ\'�?�\0|���M`3�q�y�?Ji��ӵ\00�Ͼr(��$w�=ix��9$w��\0��@�t�JS��H��u�ZC���9�$�0G��8g����N�c�d�s�����\0C��N|�,ˌt���&C!�0_ST��ے���++�����3)� ���I\\���M�\"���4u�UT�8�X�eʅ$�=h��t��`Ia��f c8\"�\Zo��v(<�y4٥x�dS�q��=6��늏����O���\0A���^*i>h>e\\��*ƻt	��cۂ�`�1@2����#�)�v\0G�<�Ibw��<Rs�����9��b��sI#d�ӓ�ސ��/�^��^T�G�h\0���X����V?+\n���#F�9$R\r�6!ܤ�Z\0|N\"�����)i	g\nz\nP��	��z�ZY�FC/>��@�@�\n{w�S��FO���7(���@�CG#(�mQ�M\07�m��8�$#�b�=�ZTa�䎙��`Uzc�\0eKI�*202GA��њ ��?@z�6���s�\0��\0Uv�ҙ�>R0x�zU�$�c��;�\0g�@�Hg�4��z`��֓ }O�3�d��t�hN�\0nԊs��{T+���\0>J�?Ŏ�3@���rz�ۚB>P	�9��+��>���)Nv����&�#��$�5*6x�#9�^�X����ݎ���@��s�zTѱ�#�U%f�:�y��b���P?����#�[\\d{Vb2����r\'nzc84y�\n߀i	0}�Eg����Z�)�n��@7�`��Ҧ	�UU�d��S����@\nA�O����m������\0N@�R*�F;qP��c�qOV��8�\0X���92��(�)�\\8�9>��.�\0=\0M�@3�=�Ry�%py�8�<����Q��8?�\0S��\"�0y$��rUw����d�\n�qY�\'9��X���ǧjr�=?,RzsȤ�q@��&�1�U�t�y��K���\0LX�sۮ:S�<�����GzB�g��\0{ׯ�<d{T�x���G��X�ʙ�;w�J�iϡ��qߟ΀\"�})�O��O����=M\05x�@��q���ҝ�z��������?�#q�Ҧ�B9��L*@�p(����I��v�3)�1� ^=s�@��ϯ?-!���j�o_c��i8��\0G��c�Q�7g\'ڞÐ0F=iy���\0� ����m<��߮)Á���\0��c�JB;�qҜq�ǽ\'S���@	�;dJi�:�|S���=9n��(\0�)ܓ��)�d����/b3�P�1�zR`�|R�s�=h\\)�?\Z\08�@^j1�0?*N�{cގ1���P�	?���A��)8��A�I�\0g��~�)�)܁���4����u�\0�=x�\n��c���P8�#��@\r`1�1�)�N{g�S��q�LoEf�P`��sI��(�_����M&Nx���\0 ���E$p1J8\0�q�#c#n�\0O�8�z})����L\n�����=�@!��ĕ$v5�@�h�M6V@v��t�`��>�\'�\0CtQ�B?�W����%��§��۴�tr���\0چUw�bJ�f�a��\0�EP��Rȸ�RAV�	�1~��t��/�\0�l�x�	Rۈ��0�ӒZF�=)���\n�P*�F\0�q�@�d^})�#�b@b84�2XrN8=�0��9��<P��b��Ԁ9\0R>�ؓ\0�q�S�ʅ²��h�.Q�l\08�e$3��<�g���M���x�hU�S��\'����n$���ǩ*;w����(I#�{P�t-��J���� �Ie�NzT�ˤ��3�\"y�If8�P�p�;;�@�v�m\r�玕U��J�n��А:�t�(U�¶p9�;!��Ƣܥ�	�����#!C�Čt�s�s��S�#�d\Z�U��z�k����9ϥ\0e���\ZFO��c�nX@��������\0Wua��~�~��:�H����Px��@�ta�\0�>�\'�l�@<S�OQ�G\0v�0�F���>��y�=2(_��@�#����r{�����@\nC�\0�#O�M��x��zt�\0��/^i�r1׎=(\0����Ҟ��g��#�?�FWi���:�T�p�x8<\Z\0��T`zU����Z�V8 q�ҦG��{g�P�s�޸�I�O�k9&���M��$��R�@	 դ��r8��c�3��q�ڬ,�@\0hM���\0Z���rz�(����Mi�$g�ؠ\r/�c��(rMd���ӂ{R,����ј�?7~)�F\0����@\nG��#�8�����e���i�U@�8������Z��I���\n҂�;��=*6��s�j�P���:��pJg��z�Z.���)�>��ǥ\0Q���I?ΐFF>�G�Z��v#8�厸��j\0��H��SY	\0�5l�1��}�tKnA���ބ�P��)�:��\0�S؁қ���U��c���c��_n9��Q��8�c�ZC���@��i�=H�()�z��<����1�����O�=���\'�49�#3M��Y�c�})��51������\0B��t�GϿ�L�^��\"�?C�\"��q�:S��@�N��@��jF�H㞝���Қ� ��ր�X{����\0����G��K���@�?�/N�:w�ێF\0��?j\0N��֔u���p=s�\0{��\0�����]��lb����\09_Q�ԇ��Z^���Rt��s@s�qۑA���@ӧ�JO�=9�@\n�G9��:`w��H��iq�c9��8���l�v�p=G�J��\0y�\0`�랔����>���/��ӥ!\\t����Tp1ۧ�\r����t�\0�N��`���\0�<�����A\0�6Ұ8����4��.��\r\0[%w6��5*����W���H�G8�:���|�q���Pyy�\'5�8En\0`V���s��B�����	-&܅��0x⮃	m�1��x5�m#mۻ�֊0�8�z\0pxٶ���Ԓ\0P�z}��Th�@.�=>���lFN�c��Q��r@1Jg��M��ȢB� ���=������I$\\<\Z%������R�\0����W=��9U��Fb��\\�R})����[���G�n���z�\nY[8�h\'�ĕ�3�<`Ӥ���qҟ,Q��U��\0*�2�~�\0���@�R��N���Q��̄t�������S�@��c9�>���W��p$���%d�G<w��{!P`{�c�h�xҬ�o���N�F�s��D�[{t�,2��U�Q�ަ*����ƣ�E;�D�9+/�/�ހ*m�����v�Ӡ\r�	��V��j\r��R��A��l�v��2o_JF�����M\"\0��}\0Q�.:g=8�̡����8�FL���ګ�\0�8�\nhF�\\pjE��5�j��S�H�]�<v�P��;d�ԧ���4�@�A�j~H�n9!�4\0�#��J\08�3�*S��/_��R��0�(�x۸�t�6yn0;\np�c�稥�\01\'�sڀ\\!$�u�Q��j� �GPx�(���@��o�8�L�l�	*���{�\Zr��y�3�J\0�n3�$�4<�=H�����A��@~l{c�@�<�;�R,� g�z�2A��ڦ��9��,����R@�Ա�)������s�֊yh0�Lu\0P�6@96t�pDHm���P�2m@o�օ�Da�S��)�#�z\n�r?ZԖ5�A�?J�Ѹ|0��1@�c���L���NU����#ʀ!(A�\0�SL|c������h���\n\0�Ɏ�qHў�h�a��s�ʀ*���^��Ҝ1�N�݃�ߞh��z?�!�~b���\'�!��*�\'ޛ��׭[�3��)<�Lq@<��~��A��V|�v�Mh��{Pb�#�Jf�Ӧx�ҭl��})�Y����\n�N2	8�N0��%8�\0<��s�@��^��e �Uݘ�9��E\0�&�)0 w�c�����Z�\"q�U9G?ϥ\00`�p@�Q��\0=i��Q�(�:΀1���j1����=(\0�08��S���o�Ӂ����������)�Q߮s��P\0x��4c����A?N\r���\0��(�Q�/�=�QۑҀ��\0��׿�8��z�`P@>�Ez�ߊv2�G���\0/�����h�;Ҏ���\0C�<�8���:c����sLr3�p;���l���~��Ozv���\r\0�1�JC��N@�1�v�����q�О�\0��d��u��N\0�Ҝzc�dzP\0�Ҁ6<��\'��1q��ڝ��ߴ�����w�����Ӯ*���X���W��\0��p1���\0*���\0\n\0ύ�db��+N9d\\� ��c�9�g�*���#\' �\0*\0����!���\0�S�2��\0�1�S#�6]˸`�1O�0\r�\0:�\0H���H����P0F���BG\0v�)k��,3���^F~l�\ns,�L���&��Z�e�=OJz/9���p(�2Ł($Uq��,\\b��Dʈa�Nzb��6^@�Ҁr[�t-���b�fIc�T�#��G�;�Dl�6����PRV��6\"D�K����ҡd��%y�֢w%���@�17!�=�1K+.�=i��h�hU\r�w*�\'�\0s�Ӹp��Vv�t�s�Sf߸\rÏ�P���\0�a@ѷ>b�ǭ+�L�!�8�UK���90U!��:������?�Y�.`P�\0��G1O�MXs R�y#�\n \0+�s֡\0�zzj���݀��j��Q�\0t��#9�ҚT��*Aʞ3�PFs��JH�`\0s���U�)����Pc�z�\"�H<Pr�v��1J�d�@錎~�,��P?^8��p\0z�\0��6�����R��`�=�sQ	\0\'=I�:��\r�x�L`���9�=��z6y��*,���F1�oj�q׌z`Pá�y��8���f���89<Sԕ#�q���@\n$)�X�_L�ڎG�4��O�J\0M����Ҫ��\nx�r}Nx��}(V<�A�U���*��9�<T�`�#�4z7���#8�\n�bz�VX�L�Պ>q�*��[�٠Q6��\0d�=�N1���n�\0v��b�#D���T��F �c��\n\0ӊ!�rѓ��nV�F�@8S�Im#�cڥ3�jIb-@@���h�ƥ@�GZKT������nRna�X����Z\0��H�?�G��\\�ԘdW%x���(�br��@���Gl�J���ϔw\n��a ��@�����zq���	<��ϰ�;�A��(l�H����x�)�p=��8��FNF?\Z\0���@�Ҽ{�z��QJ���_ozM��O�w�HW��h�C�:Rl<�f�\0>����u=��\n�~*�9��N:`�PȾ��@��\0�z�.A�1�Z�)�OaT%J\0�s��iGA��ކ]����\0��(��ǥ\'�q�^zޚpGN�\0�۞{�Cq��!�׃L\'�c#�9�	�dqЊ7�\'=�\"y�<�g�i����1�\0H	�qO\\���� �����=��\0F��*v\\�U2��ݍ.�s��~G_�ZLO�Vdv����\0���8����v:{u�*}(��>�ԁ:sHg�񞞴8�z�sS��>�ƌzq@s�\ZL��橌g���M��q�PC�n���0v�qR�d��ߚiR[��J\0`���J1�������9��&��9�9�@\Z�M�2��zt�dv��:ϥ<G˹;x�i��3�J��:�cpg��B�(7l`ӑT����:��h�Xك8�@7�wu��D�g���;��d����U�A���>�?J\0ѳp���Ԫ�_s.���G�<aJ���XUg*K��\0Z-�v\r�Ozq�~H��y튖#qln��C./5���\0���r�z�àѦ�x��k�?��n5r�X�cz�$��88\0�˱w��y����PSkc\0W$��\Z&��n��tlO+��8�`Č�2A8�F�̀O<\r�N��^����%z���9�\0�cH\r�>��Zz!;_v8�k��\'�\'�dx�7�eA!��9�|\njh��k��u�J$� eO�8�e�	\0�9�ӒA��Ud��\0�o�X��f��$F�U����I!X��\0\0��\'�B��-���`�D�v�(a�����p����F��?:R���\"���I����H�1\"Ȋ�rW�U-�����e?�n#�cy-�Y��#i0G��v{<����\0���>l��\\��c����+��G��cd,҅�@r�\n�Xga�;rA U�ʯulF٭���rN���\\r~�Oj\0� ?{�:◁��շm�mBu�f��U�ϴ��# �\0�+C��-�v�h<�aB�B�2�	���x\'ph�+I�\\��>���#�pē늾4T֦�$��g��$��)|���ӯ̠�.t�M�s=��M�JrvR����{�o4\0$����Q���p���>{��쑖\0�|F��l\'�2:d�T���J���K$)���EFr3���[��8����yeml���sP��3��M&���Y�hdM�yîH���=)]J0�q��Z\0�_�q���ޝp�W ��D0ӟ���Aϧ\\��{�+����	��y���c9�\n�Q�dt�@ЮyQ�毐�q�:��0�\0gIn�2{�Z�3&{��V�G�s�5���}zJ\0���S�u*y�N:^x��\01�0:}(�;g�g�lP�qۿ\Zpl���\0\n�F�$�9��ǽ=N��a��kq�Aޤ8\0u��s��qϨ此,���\"��?�RC�8H��}:U�k,��=o[D�&�q�@��k��,�&]��+![i�Rs]f�Oi��q��*�s�\\��=�`ţ^���Q��HH1���p�˓>�	8�PHY����V�H��C�x��M*�icc�%�0nf��>}ч\\r2�8�{T�.	��9���:��,Q�7�6�A*ͼ�\"6�F\r�1����|�H���!�)��[�r3����}+F�Kr�� qu$+���p�c��A=2:�2\0ybH�V���}�@	������W����2��	·ʬ@6�O�\n�����<����P��y��߿ր*�L�	AӓޭM�P�ZB�i��- �\0�PF6��׶9�m��������P�1���g�(	f&�%��S(?8���v�ɍ�|�\'��%xR2�?CCٴ�\ZE��b-�\0��3�zc<g�4��yr1M�%f��Gҧ�N��Y�u~p\n�={:����j8OJd��,��Np8�?�\0T�1���:c��ҵZ�G��6`�Bg;��H=;����d�,EԸجO�<�9���@9��F:*^������@\0�\n�:���qK�:\nS�:\0a��:P�H��S�|�RQ���q���4�Q��8�����j\0n1��`��֜E��\07��/|{b��?>��]��\0�,|t��2�׎��\"��s�9�J\0ʑ9�{�T@`�r@�_�1�U77Cǧz\0oo�Қܜc��)g�{R�H��p�����\0��Z����Jk&{P��y���H��|u��)�B���LT�|\Z\0�5�u�V�N���L3�W!Ls��\0���1�G^�ac���q�L���Lx�{U���ޛ�\Z\0��c��1Fο�*��1�!@0G�@|�rG�J۽Y�q�<zSv�ǭ\0V����� \n��@�jO/��Sa�!<��\0�V�c\'���yC�4S�#�)�^;q����QǱ�(����\Zo���گyx�;Ry]��PA%�ne{.{Q F�^:Ҙn^I�7Ojs*��c?Z\0U@�H�@8%MD��%6�*V\"�x�x^@����\n�H�<S����L��-���֌ɒI\'t��[����w�\0h��T(A�z�T���뚣��%A�eeu�)\0��\rT���BְJ����RDl@���8��3��F����2��>d��R��j���hD�����Tg\0#$�����ݻ�Q[���k�+0���\0R�E�X/�\'����-���VpIw;s��~���g���$���b4\\\0Fy�M\0k���o4K��$J������6�H��9<�T#�%��K?.������F���sU��7>26�Λ��Tw���ws�2IG C���b0J� ��8<g8�����Acı�v\"��@�\"}�\'$����8�b�,`���\0Y]Nxm�)\"�TD\n��#!��c<��0���i�j��]���e�*�������AT�m��00j�`\0ې��j��v�ZA<�]��C;J�9�u�=*���ַ��B���6z�Q����)\n�,��穦���89>�~\rE�\Z9!K���G�U��\\6v���똚����<ʾRDQ���UQ� ��G~Ċ�+����:����\rv՝����͒F?6Ht�א@?{<�$�%Օ�涖���tj�l!6)���w��rq�99�Vk=���0,�`g��5u3Zľ\\ov�H�;&4��������G�j�kr��\\ke�Q �U��Ր��pp�p�Fq�p1�}\"��.8��^����X��l�\0�G��h�X��3\Z��7<���*M�DUd��:��\"G�.;��V �I\Z\0��)!��j�+�m�|U��$���FzTS����P}�=q�?J�@�MH~]�:�\0� A�#�9����9\n8�\0@c�9=:UK�B[<�\0=3Z;1�zJ��]��pz��\n[Xgp\09�A9�#4�r1���Q�y�2~��s��	?�=J���5P\r���dР\r����>��o\n�\r��+Z��1<{��y�@N�<z�Η�H��S�ץ\0t��s����@E���5�F�5:6��ހ1|F6� u�+2{��D����%��c�:���6_\'���\0�5��i<Ķʁ�8� 3`s��=��=�PC�1�!m�	�0�+�q����}��p�|�Z�|�ĒNy#��	�f�3\'=I�����\r��\0֟P�k������ӓ��g,}I\'�hI���wߓn�;�9Q�;s����k���<b��#A��@��;4Sh��?y��B��@20x����5)J���2(U3��1ӌݫ�;�I!��W��E3 E*�@\Zr]G�+B�He\\�T��?�Z��Q�́�12�s��6��y���5W���¥H9�\'8�\0h�]#��?��q��!�2z�N\\��ԷN� �,R&���\0\0��+��vu����K��E\0hE{4�>���b�?!=���u�q�rCp�1�X�1�	v���z�G�@[���y�N�q�Z\0����B�BpB�`�9�\0q���P���I\n���#gи��>ࠎ��殲�E\nq@�!H�*7FN\n��ՖϘs����;Po��;������x���8�o�\0t?қ���as@	ӑ�&=�~������\0N;�JNq��)�zv�<��\0�~���<c�4��\0CI遌�N�U�N8���7#r=*��9\n\0Ν?�UJE�o^;U�OOƨɌ�:PD}>���3��?��J�@����8���A�Ϛ�Pjh�6N�P ��:���}M\\1.�{b��qӟj\0H�G�\\�:~�c5i��\'�(@�S�9�1@FG�;��4\0£�����qR��ZA��\n�:SH�9��N��w4���PW�J�!RG\0ݹ�1�I�F?�jv:�T��xg�\0&�\0�I�z�ә��Z@wc4\0�x�\n���}9�-��=)x$.8��j6�A�]�h\'�F���','s','A'),(2,'jesj','skjd','j183293','2014-02-21','jkk','94','34',NULL,'','','A');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `codigo_proveedor` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `recibos_pagos`
--

DROP TABLE IF EXISTS `recibos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recibos_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_id` int(11) NOT NULL,
  `inmuebles_id` int(11) NOT NULL,
  `codigo_recibo_pago` varchar(5) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `banco` varchar(20) DEFAULT NULL,
  `cuenta` varchar(20) DEFAULT NULL,
  `referencia_documento_mercantil` varchar(20) NOT NULL,
  `monto` float NOT NULL,
  `formato` char(50) DEFAULT NULL,
  `foto` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recibo_pago_ingresos1` (`ingreso_id`),
  KEY `fk_recibo_pago_inmuebles1` (`inmuebles_id`),
  KEY `tipo_pago_id` (`tipo_pago_id`),
  CONSTRAINT `fk_recibo_pago_ingresos1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibo_pago_inmuebles1` FOREIGN KEY (`inmuebles_id`) REFERENCES `inmuebles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recibos_pagos_ibfk_1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pagos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos_pagos`
--

LOCK TABLES `recibos_pagos` WRITE;
/*!40000 ALTER TABLE `recibos_pagos` DISABLE KEYS */;
INSERT INTO `recibos_pagos` VALUES (18,5,1,'0',2,'32','32','12',12,NULL,NULL,'A'),(20,5,1,'0',1,'Provincial','99438298','812938298',300,NULL,NULL,'A'),(21,5,1,'0',1,'Mercantil','33333','222222222',200,NULL,NULL,'A'),(27,6,1,'0',2,'Exterior','321','23',100,NULL,NULL,'A'),(28,6,1,'0',2,'Bancaribe','023030','2302302',300,NULL,NULL,'A'),(29,6,1,'0',2,'Banesco','39939439','01293239',300,NULL,NULL,'A'),(30,6,1,'0',1,'Vzla','03032','11111',300,NULL,NULL,'A'),(32,6,1,'0',1,'bbva','9349392','394939',200,NULL,NULL,'A');
/*!40000 ALTER TABLE `recibos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_id` int(11) NOT NULL,
  `area_comun_id` int(11) NOT NULL,
  `fecha_reservacion` date NOT NULL,
  `codigo_reservaciones` varchar(5) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `fecha_uso` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `numero_invitados` int(11) DEFAULT NULL,
  `lista_invitados` longblob,
  `observaciones` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservaciones_ingresos1` (`ingreso_id`),
  KEY `fk_reservaciones_areas_comunes1` (`area_comun_id`),
  KEY `inmueble_id` (`inmueble_id`),
  CONSTRAINT `fk_reservaciones_areas_comunes1` FOREIGN KEY (`area_comun_id`) REFERENCES `areas_comunes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservaciones_ingresos1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES (1,5,1,'2014-02-18','r1',1,'2014-02-28','08:00:00','03:00:00',2,'��]','nada','A'),(2,5,1,'2014-02-18','s03',1,'2014-02-26','06:15:00','00:45:00',33,'��]','asd','A'),(3,14,1,'2014-02-24','R04',1,'2014-02-26','07:00:00','00:30:00',300,'��]','readyyy','A'),(4,16,1,'2014-02-24','R04',1,'2014-02-27','07:00:00','01:15:00',400,'��]','dsad','A');
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rol` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1','administrador','administrador','A'),(2,'2','propietario','propiestario','A'),(3,'3','root','root','A'),(4,'4','empleado','empleado','A'),(5,'5','junta','junta','A');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_inmuebles`
--

DROP TABLE IF EXISTS `tipo_inmuebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_inmuebles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condominio_id` (`condominio_id`),
  CONSTRAINT `tipo_inmuebles_ibfk_1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_inmuebles`
--

LOCK TABLES `tipo_inmuebles` WRITE;
/*!40000 ALTER TABLE `tipo_inmuebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_inmuebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pagos`
--

DROP TABLE IF EXISTS `tipo_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tipo_pago` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pagos`
--

LOCK TABLES `tipo_pagos` WRITE;
/*!40000 ALTER TABLE `tipo_pagos` DISABLE KEYS */;
INSERT INTO `tipo_pagos` VALUES (1,1,'Transferencia','A'),(2,2,'Deposito','A');
/*!40000 ALTER TABLE `tipo_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_publicaciones`
--

DROP TABLE IF EXISTS `tipo_publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_publicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inmueble_id` (`inmueble_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_publicaciones`
--

LOCK TABLES `tipo_publicaciones` WRITE;
/*!40000 ALTER TABLE `tipo_publicaciones` DISABLE KEYS */;
INSERT INTO `tipo_publicaciones` VALUES (1,'TP1',1,'Informatica','solo para uso informativo','A');
/*!40000 ALTER TABLE `tipo_publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_empleados`
--

DROP TABLE IF EXISTS `tipos_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tipo_empleado` varchar(5) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `sueldo_base` float NOT NULL,
  `prima_por_hijos` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condominio_id` (`condominio_id`),
  CONSTRAINT `tipos_empleados_ibfk_1` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_empleados`
--

LOCK TABLES `tipos_empleados` WRITE;
/*!40000 ALTER TABLE `tipos_empleados` DISABLE KEYS */;
INSERT INTO `tipos_empleados` VALUES (1,'8',1,'Conserje','limpiar',2000,4,'A');
/*!40000 ALTER TABLE `tipos_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_roles1` (`rol_id`),
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'admin','123','A'),(2,2,'propi','123','A'),(3,3,'root','123','A'),(13,1,'saul123','123','A'),(14,4,'cristina','123','A'),(15,1,'mata55','123','A'),(16,2,'robin','123','A'),(17,4,'rooney','123','A');
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

-- Dump completed on 2014-02-25 23:08:03
