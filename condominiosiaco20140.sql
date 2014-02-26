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
INSERT INTO `areas_comunes` VALUES (1,1,'AR1','Cancha','Pa las caimaneras',200,'10',50,'10:00:00','05:00:00',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z&\Z$\Z/ #\'),,,150*5&+,)	\n\n\Z\Z,$$),,,),,,),,,,),),),),,,,,)),),),,)),,,,,,,,,,,,),,ÿÀ\0\0Â\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0C\0\0\0\0\0!1AQ\"aq2‘¡±ğBRÁÑbrá#3‚’ñSC¢Òâ4²´ÂÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0ÿÄ\0&\0\0\0\0\0\0\0\0\0!1AQa2q\"3ÿÚ\0\0\0?\0õ)‚Â’°Zqs\Z¤Õ1ˆ\"*ÙmÅJT¤(2Y¦šŞN‰ÉjN»ä‘Ú,k˜¤ÌP\0 ”ïÖÔ˜¬(ÎRø¾W¤Ì–ït\nƒ–SLğ\" ƒÄ\ZG¢{8°å›ª=«Æ¤,æMH=Ù] õ†\\º Õ+gHUo!(Òö,**Ì+KQµK)Q(H,«´RŠKƒ¼7PX¸8ëmvp¢c.Ú=wL°+•\0¨!²ŒÑ³¬Ò%=RšãR¾!ñœÕê9…U4]Q)êÔè\n˜ÜTÇøMCcJé„ªpi(\\µ^Jiº á+SQN¶ÈÄ8tëR”İXßBšc6èøÀ~Òˆbé\'B“-[É({3K8–µíTNJ$Ò8—#«Ú —LÙ—N$°^ b^‡\n£½ë*èNògÀÒÔ/9È€_º•e¤£h¢/¦jÃÕ†lp×œÌ=5\"ÃÆ­à\Z‡â9Â“\ZhF…&BA\ZdA#Äƒ@Ğ<+Â	v°¯D—`h h‘4ÃÚ°ØFĞÁv+T »h\Z+Äéë©•eyÈ3q>¦‘äı-ÚSm\n	–’”UvS0¿À„QC•îqëÛrÃ}ËŠPö_’ü	­\Z<ãmJš	D´º—¹yª¢MÖ,K3ŸÌK6¬Íş\Z†—ú{Ñs0	óÉZü°ª‚¡‰®C`é†¤D{/g‰2eÊNĞ”óaSŞ\\÷Ä¶š$×OÂ(O.7jY‚ç-F}ÂOfñ\0ĞßAjØ²Ô²Wp(š<‡§0G)Ô›i×›GRBVJ‚‹K8¨–{‡RÀ­ps¬ÊÕqƒËºGüÃ’ÔÌ\nBH‰eXÑ0(õŠÉUw2ÈşêTÃ“m)WVEéŒéj¤¼N	b@<H`]‡`M£>è/-·Rš™£¡±ÅÁË	v›1SN\n\nX–¢.¨‚R3R7\\i»Îd¨ß ‰Š, \ZáQ¤¶z!ğâkR!–‰¤,Üq-OÖ,`…‚;\'SP£P\Z¬I€Ÿ>ĞWuRAt–Y !?\ZĞ¬A‘ÅW5BV†»0€CöÔ¼çâ|IÊ§³4&ÎHd)A7_ãY`CœI5}_W$ÉêÔ£0¤‰„×áCŠ¢¿	b^]ÅD \"PEîµˆ˜I>ëÖâsÇx5Iz#†ÙËQÚDo¦zİ%±7±j9Ï¼™Efê¯&á½%ñ`,êC³™Ã—Ë:öĞ¼C½W€­êœ`b3>¹ŸMbô¹sA\0Š‚D:ô5%ÃŒ2‡4m‘z\0¨ @Šğ<¢¼\r,ˆĞB´$V¨X!\"\'4\r\0‚A¡\ZV(Ø!ÀR°Ú£$<ˆFŠÍ©nÆ,Î,Ï]X\0d\0zrºĞr©Ÿ·6²l²:ge\0=[\0¯3dßõ†ËQºÿ\0¯ÿ\0ézq±¦Z¬3dÉ»}wZñ`n¨±¤|á¶v¢Ê»–‰K—¥áºJ°=Æ9êN^<qÛÌrõ3Ó+Ş\nQ½W\nSy\"ñ°¶ÍC€0G—f_ZñÇÇÔöùÅyAÖHë@A)?óÄ\0UBŒX:,PIuâm\n¼p»ùFï¯`’ü2\nVÑJiš¬©\'¨~DÖ˜án…L\rã5@Ğ+TXÖò…8cxÇ²ŞZ\\&Jì„“.q®EB4¡Äá…H$K×\'«PrÌ†ÌÌ3g¤©=Z/¡D†@,¼Â&¯–†º»…LHšVÓ\07iIdä”ÑÏÂ§©j5\Z³KK=ÒS4Më™¤#ı°ù£“ÉGZèQUÄeœÀ’•¾a*aÅ.õ…ev„©’…\0½×7ĞB®îÎKR­$éÓ&©º& ‹Æ #P\r^òM4\nsP ±GÌ&s Ş”¡|ä¢Ïu†	RMtrÖ8n´ÄŞ©~şE,xf5Óº;Y“”Éê…ªRûÀ¸bq)ÔÖ —â 6æ\n,Is‹’Åñ\'œS-CÓ€\0\00F‡4C%wRÕP[¤Ó¾×áö[4‘¡„3¯´ı Lô¶#ÓÖ4’2úMj›.Î¥È¬Ä”°k×@İñvÑn—-7–´¥:¿kÜGaÚr­	&RÂÒ(‡ÌFfbx±LşŠt•6ÉOA5˜ì\rj—ÄS¸ÆãGí;:ì6±6ZTo8º—S .Óƒ°©Ò=LÀ 0 ßI¢ˆEBˆEaš\r\nĞ„Ãj„„x	ŠÕ\"æ‰™ŒÍ³¶ÑgMj³ÙN¯G:âíõM˜²ê$\0–ƒí55c#·§KBsç¨z· b´ÿ\0pûÄJÛF3QıÂ<áNTi™ñ|ü`êˆÁ\'¸~Ô§³¼óñèı¦?^‚­¿ W¬ÁœğÈpˆWÒ™â\'1ÅÎ’«¨¡ÀäCo+_„HUÒá˜©y³ôm§]»›Ò©ç*BüD¤,¤Ğİ%¾Ôâ#UãË,;&Õ&z¤L–ªµİô±t¨^À‡ñÖLéRœ€„0$UzÀí¬Dróe£7Ã§x†ÕfDÄ”LJV…P¥@yƒ^Ôé¤ÉwUzZS|=âM	,	=ÍvM¤©e§‘üCyMeFJÁ´ã«ç:SÙ¿é>ÍR‰ê|“1`Bõ ‰;A\rEk|}U“/i[%Íºƒ1(IP)V%dd‘ò ¨ö P¼hËÚ\0VêƒnŠŞz/æÄ`cÌæ[¦!–®Êq;Õ–“7{5fÉôÂ[fßœ“-KZ’PH–Äp½J¸xa¬gs]íŠeÉŠ+k®.Š´€¯„äÊ9ŠlÂ[­ŸÄ)–õ\në®âÉ.şphZ¬ã‹‘·ç<Ä¤2–^eAª’Ôæ<ô‚FÜ(€ß–“G)N	9^Ä¿8¬Ô»»TÀ”¥R\0+mÄ¥™iãP.‡w|y[2be§¬–ê*5½4àä\0÷’Ï…\0#8¹$Ÿ*úˆI\n.ª\rÖ¥?.$ñ$æaéé5¡\nRÊRÊgÃsÏ:?1Æ+NÊlÁ(€Ş¾EíH%8°şIrğöÔ”í(«ÓÑªîCá>ñx&´!Ee\"éÃ\rÇÆKÇ16Ò£<­@V’A›w†L„Vië2K\0	r(çÔsÛ¦¨KQGhz<òÛl›9HZÊÂ×n( »ã«Ôÿ\0ÖsB‚JSx‚E[Š-Ö*ZéWZU.{\"jI\Z\0Áë|Ÿ1Hº^,©HJzÅ).–4¡j\\Œr;FG\\²²’Kîİƒ§ì\"%Ø‹¨L±ºÀV¤v«q‰™ªU&Ú:I:Ú¤KR‰Oº›¥²uU¸—úl¡6b	KÌ–ã-œ9 n©ªjôaVŞhç°\0UàUƒ1JHc‹V˜å›>Û2P»yE)gJÒqŒãÀÚ]¡Ó‹=¥\0%e¯‹$PæRI¥[JçoGvªfÊMÕ•†5.[âgv9=cÏmû&JˆRQt\'\'—%È®ƒ&RLlô[i‹4²–+Jà@ á‰ç“Rï0°Ş>_Q\n©Ç_#œOK(P¿öŒ±·Ìå$1L¤¨W”ÚÑµåœ¢•K±¶m´K@Z”é8]íÊ«§$O)DÀd¨½å¤Ş”ÉR”)U\n8ğŒkfŞ’nJ\0Ë•.ñ7¥‰½b°uÉâsŒí—\"Z¦©ebà¤+EÎ\\0/‰Ò±Ë,¥T»é}=³©ê±G“t+ô“åYúfV•nï«V&ª<Ã7ÈÚóì¥®»íº«Š*8É/z3°dÍ”‘Ö-S%¤õŒTšÌı!Å4} Ë)›Â\"ùP›nR”IQ\'ü¹{agœJ’ö†¸?ºÆJW&Í<É“)K)ú—2ar@!)b€S­0Şˆlû=©JQ1\nBüÂ’õJ’êÂ†‡f­ëóGT¡2a$ïõÏöˆÂÓ™Ã:FVÓÚÉë”$Y%ui$éRÔ¶ÍN­×ĞaæÅØ¶Y²’µYå%l›à!ÀR’•0*h±æ´SŒÄZxêœ½¢Ò›¨r09âë_“Ä\"ØŒIM0ŞaÎ:>‘®ÏfRÔJ7’K™+Yª”õGMu‹]g…“&P»ušAK¸WÎk†QN<XóW§5dÚH+Nò3 #B|\"Eµ*Z€#´¦lëXÜ±íÄ©`	IN5ü\"ÆGfÅıµ³»‡½u)Ä³¸+\r^pí®g˜rì‚b\nUñå§„ktn­iüÉWÌ—\nQ)»Õü¤Ôµã†q]UËÉ¼k	gw\n1bèå­©6„!) 4àTÉ(PŞHõhÜÓÍÚÄ›Z”RC„»³äæ¦­iš¹*êÊj€qÆè‚7pÕæÉ²¨Mˆ§Ê~c_bp	!4 àáú¶ÏôäÃÚŸ1·xş¯ËìV$³,1Èüo‹ñáåq\"¬Á\"ğİPø«æöĞH@˜”+òàeŸP®0ÉE‹z¿‡òœÉ\'M8’rJˆ¹‘‹°R~N~ñ#$o•TG˜5Ğ¶˜gÉéH*(5FO9¥óföÆ	Š¾\nSBıòÈÍµĞgÊEÇW‚›x‚ÜAñ‰\0ÜUQ‘8(ü¤æÍßÌÍŸüÒ	4)):ŠW‰¼iãª4-ˆùph_ÃÂ2íªy¥$‡MÂã†½GŞMÉ\0İŒHeøDÇH÷Ş8D¯$h\Z¦àRª}å\0Bİô>^€+ë L*P\0a@!áÑ¨€”ãM8Â*ĞÔxÄ3mInĞñŒîªÙKQ\nUN:˜’Å1Böò¨•5OÊb²ÖëTOevV¤¨ùOç|µpDÛó+ÄÇkĞ™Äª{ş\\ÿ\0\\pˆ±L9\nqó½•¶&Yæ®â’·*%C…ÕãŒc, FPÈéìÕÄf± :0%»Ÿı;´©2í\nH2È\nS:ÅÛ^Lé×æÙå’¡¼MÒF\r,ùE‹µå¡KI”È˜Æªß\Z– îŠs¸¨WñÀ™§­UOiYñcè‰=J¿R?úò#“™h³uä®Î‚å.T1s{¹=,•.oT‰+Jw\\€nÖ\\¶/É’Ü!ËR&TK§›7ŞÖœr]&ÛéIHêÌÀ\0ZHuI>|¢¼¾”HYUûÄü¥ÒTr/º4Ò9[WìúÃÇÎ8î’ö€aüÉ¹~}sŠıé¤ÅÍ—%ip¢×È.]ÈÊÒÛzBØs±?ş±¼;ä\\Lpîvl¡øY ñu8EMœGáe6Z[ûb“*MJA0D‚&=g˜QüÌÍîÃ$“‘ãçŠZ\'¥DéMÓ‰=­Rß/Ú1¯±Ä¶9À&\\\0Rí\0,dµyÇYÕŸPğù[Gm †•mÆ˜>•ˆ¥í4JIÉÅA\'\\ôôÏ ½çej=9p‚Tâ®Ó¾„åƒ×_Ú3å•ähªÛt•„Ì*,û´S`.\rŞğ§h/]Uì)ùXœ„~Í˜•±¯g.¶Ÿhsï^\rËæãÏH¼™$´†Ğ84Í]4Ss;¾DETÒ¥š1\0>|Ëæ3¬|©Äq÷ûÄµ9qÚ`ü‡‡ùáœÌòÖ9ÌÍ7%ítêZ±\"­‡%ı\'ï’æ8Î~8N¦WÛœç’÷^¢™äßC\rYQÿ\0˜kù€ÿ\0óÈ^²1ºFùXÏÌ{æ~â$ÖşŠŠ½oØéZêÉäOÖgQÁ	ı¢¯YÌÚS^.À\0à.¤2òŸío¤Z¸Ä?‹<!¨ªN¬û0	GCş-^ÄÚ­G‚~ÑT.*Y‚9ÂC\'[Ö¦¼JšØ°Ğ„Gø“ÃÀEÂZ‚4ğÔBş(<\0ôŠ‚×ùSçô0PùGŠ¿î‰ZÇYÀyçS\ng\rë\\¨3È«ø‘òùŸ«Áø”üªşïübV³2p= P=XpÒ\Z\'ğÅ~¹?›Ä}¡:Ôê¯÷‰\\®Ê·\\7é:ƒ_HdÙéZŠ–¥I$$’N%Ê\"¥áóíÿ\0Ê¨|ÃÀı!äîËëu=*œ•n€À…€].´ÿ\0¸ßÒŸ´såcæ\nûBR|ÿ\0íŠ¤îËë¢1´ÿ\0¹ÿ\0Jí‚9ë¼Sıß´Rİ—Örä-Í	©¼áşĞ’ç^«wi\rM¦I¡+Ao”)$÷[¸ıİ2Î	şÙdäJŠ0Öø¹ã¶ÙN±e#-!ë˜({ô†®TÄ–2ËµxÌ¸8Åc4¥ÜÌWúE¶E.uîXÓVÓ„šŸ§Ò*¦h>ÛüCÑ1¨MuÈÆi,]ÇxÔğãfVğÒƒQ÷ˆÆ¦#Óö‡ ÕÆ\r_¸šÉ¼;ZDÍ!ıaŠ×áÁqÃ.Üçµ¶¶ \n…¿\0MÖC„È­~2*K=o^²+u†­å%¶ÿ\0¬U	z$µŒ\'Y‚¡IöñRY…½¯\r`¿\\a+*\"LBV`½´¤ÂÄFln£ß(’@aBš#–²¢\0“€Éäi££ëçÈN³+¹Ô|!ˆ“JU‡%ÔX\0ç\01<³‹evi<ó©=\\¿\0ë>\"\Z½¹3	m$6ÀKóWl÷˜hÒUìu¦³T‰#!0›İÒÃ«Ä	²‚U9_ŸqúRJ•â\"¤¹+[‘¼ss^<^-X¶é¦‰RSó(–v<Iå\r|j\"úƒ†×^I–‘ •-‡\'KøÁ\Z©èE+8¾lŞ°±ª–üy¸¹_*Ï5ä>pˆ¶·Àƒ¡ ¨ŠÓÇ›E)¡Á~~‘ÚœÚh­ÁJ®÷J\0KJ]ß8e­J.µ)\\TIó&*_hà¬•hk¦¼áDÇŠéSE›>ÏZÆêKk€æ\ZµELò\"İ…UáéûCäì¤\0zÕaÀ¶n~ĞÅmYrÁJ¿®œo+™tÃ‰³Wh\0šwÂ¦Ğ\"­ ï‰ùG±åÊ{_6¡¬\'âøE ¨\r¬®_/XAj1Uà‡j[üIÖø®1I*‡_Š’ßâ ƒµ‚üT–Í¤ÂIŠ¢gt\nT—?u†~/ŒU¼hÒ²ì9óë…(Íkd¡µu3÷CµRj:ûåm\'Æ4?e—Y³ŒÓòIï˜¯ xÒk´³É—%°SÌçyBíˆkmv,û\ZzÅâ:´|ó\rÄyÔ÷<NUf’åªzóJw%ÿ\0y•İv­¢¹Šy‹RÎª.ÜŸƒ¬öæ*…Ãy],šBd$ÿ\0¶DqYuyÆdËj”]J$œÉ©Šfp×ßŞ/Ù¶$éŒJn$æ¬[ôŠÃVÔDä‰V–Î.Y6dÙ•ì\rU¦ b|£NÅ²åËªEå‰yrı¼bßXN>#~q­®øèı+$©oºViU—ªsHV6SÒR(P}~‘‹â_P}>ğ‹šr Óß8iŞ1ˆé¼zN<ŸÒ9²sn4Õ8dª€çÏ„_“°&«D\'UP7qñ‹Òv|©g|QŞ•”\Z|µKÃLyRŠÎï};#‰Ó8Ô—°+!LTÜZƒÆ%µí”$2\0l€¼0ŒÉûMgCàB\ZÆß­iJ‘(T°1;Øh2ğŠÓöÊ«vƒ]IĞFQSs8ŸA_:Aº}+ø½f7Ôê/Ï´W@Ç8’Â\\šçOzCƒÖ9÷cÆû©>Ô­ã¼-±‚Ïw¤Bâ9Ïn9vÆÂ LÍ<bA2C_Ù†À*H!JáˆrX9:_(Ø²tbzÅå„ÊGÍ4İòÆ*³S,!BI¦&”—åŸ†±É{óU=MD ¥ÿ\0TG7¥ŠH»g–‰)à/*¹•á£·ê9]AR%§æ˜n:Ÿ‘V[$®ÜÕO-Ù–.¡ø¬ÔŠd#*}±sÌR”1\'ÔÄ7ƒÀ¸n+¤w?öò¥Êâ\0Rÿ\0¹NİÑ›jÚ&ÖbÔ£ù”OøŠƒHjŸÂ!g•@HIÊÕu\0©G!õËÆ7,]%ŒÕ0Æê~ªûEµ=0…K\'†1¯cèÔÅ€¥­:\n«¿!Ök¹iş\Z@ÕLïÌš˜•S“š¼pğÎ7OF:QÊµ’Á*Oa5\Zª|~ÑndÇÏÏí\rLàN‡Ô}\"%I¥|»Ì.Ñ”/ßïMPj–Óö\"¼	gÃ\\;¡fÊ‚@ñ\'…ª\n9áíá« ½¼0œø¥b4ÌI!.I mH±} fI÷A„ff#™Hã^©Ô+ßH!†ÜŸ›Ï÷‚<ßºÒúÍÃ›Ò[‰×»Ï›<ªª.ĞEU—<0„):wñ\\å3ÛÍi„ß, ¿RqûÄeCL	…+cC„dßŞ\r\Z!\n~BO8•&Dö.2ÇŒiX¥JP+{§ƒñî¤d6^1$´ƒJiİ_9ÔKxÏ¥ ¡x\0QU„h+gL˜EÄP\n\ng,bÚ:,´€©ëD¤çx¹nCÁã3lLrÇ‡Ë–Tn¤€Ï„mX¥&OPÃ OÎéŒÌ%!FWR/1\Z·€Â\nO³ôJq—vZYİjfîõYlr€½1S”1L½ÔŸê?M#\ZÓ´&LªÖTx—ˆŒ\\\núTP.Ùå¦J[-åj<ãÓm\\ÂëR”u$År¸/EÚ¹“ïÃŠ¢+âL¤ÁB’õ£Ëß¿8ŸgìÉ“ª„İOÌp<µë?G/«¬\0»\Zİ\r7œËŸ³Y&ÌS!‰bÁõ1·eèÀNôÕ¹Ñ4‰ÄÕ– Ì†\r¥\0îÎ9â§æàF©ß8Ë !¥¤$BL$—\n`ÙŠxáÇ›°î‡\0Ø1âNºp\0-SN^ƒ(Šà|Û*×Ã!\rLç¨vÌšxC€ÍñÄã´‰A\0„³h1\'‰Âœøhˆqõˆ„àîB€åp¨ˆZE0ºx¨Š64-ÆPGÒÉ\n .äüKyDSmiAl•úMHÓ‹ÈL¥I	$O3„RµÛ«wZ=.ò\'(aµ&·E	Xn<¢	ëJK%ªHâùqxùZšó©5é‰Ê=\'TõH\'V0ED%\00Qaƒ*of´ÿ\0&±sŞò‡ Ñü3ë#ÃĞGÙp	\rÎ.yp‹v}‘9lDµ1 C\náSË½;d!æMEà{ ¿q#6†1ÈËüF‹aLš\\\0”äTX}âø½ZGS%Õ™]j0ÅÎ5îŠVİ±6bÜªé!Ú5h}i‘\"Yi“Áù‚1sÅó|2ã	:ušåÙHQYøÔj3§¦0øø{åÊÂ¸7¿HLK]{Vl¤²tHŞ^èÊŸiRª¥I\'Ö,m\'İ|ŸÍ¢™m Æ]‡…-˜WÁL€­!§XU(r‡Ùä-}„“Å©ã*F³¨‰’xœ±ôk/FÉí©µ\0Uù¼lÙì’åvR‘ÇâñÆ\Zt9öÀ±ôrbû[‰ã‰ämY:?*UJoU_¢eÛ«ºÿ\0Õ„\'__Ê‡XÂ!be°¦>8yV!U +öĞÉ‹ÌOsy¼=3‚±º[\Z\n4-„»_^q%àª8~ğÒ+*eã‹ğÖO\0ÚE$àw»÷D%ÕfA|šp·¸ûçœøa:[Ùs®^CHbHgĞ\nyzÂ‰€âˆ§„>Z>\\3?Rs‚f#“Ù…èş´( \nåî„º­˜Co\'x„‹÷¯”€‡¨”¢	`Ì^±E[-{­6XJ•_7ˆß_Vn§µz†CXñê~³N#üfäT™2`\0¸<óñŒyÒV¥T\n2 —Ëµ^q~Ï±§/´´¡ÍĞ\rç¾¥”$nƒÚRÏAv¸‡tÎÍ–Qy`…¤«âºÕ‰…ÉT_?HùÓ­—7“rÇµH)¸¿‰Á-È`Æ$–‘q-t—$)´Ä‚\\ˆÙ^Àš¾¬K\\²™¯¼°×X|HŞ”pKŒ£\\¢ëÌ¶Â„\Zf2Î(ÏtvÄÄÁæ`5ºšê{ Š(Ú+!ú°x¿Ş7â‘gIØr’‹Óg\0¡5vq8ğ‚fÑ³Ë?Ã•y†*ÌœË¼a&aÍÛ>0©U\\ˆûV?¦£lLXb» `—>µ/f;³ç^f\n«ûxGnú}ÏÒ$vºL¼LtçIÃ3ìBæú\n}<ëIôæ(Ôk‰÷ïî}òõ€/Ì÷\0=ùB\ZAÊG¡\Z6Ä©H\0/€ãÙ¶,Õ{tN`qÅ=µ8Ü©­İåÙ,S&ÔÓ2h8ß³ìIi¯hâ	Ö.\"rAl8~ÑSQ¦Î²ô\\ë.sÕë€İ)é©¥´ŠÊ¶œê}ã¬cIÿ\0Tpº2V\'Ë8%Ë&¡N58÷{Ùe*qÏÛxB®Yz{ñˆ¦B\r,ß´I1\0âyFr–yu#ŸÃİä°Mß¯¾1P9RÅ_\r=ãI–”Ğ\0”èÔ?hzæ÷Ÿ~ZdÍO/ñõô…&2€.”‡8‘Q#rg7‡›Äjšô9H!5:}¡«šK{áœD•:ˆH®gïeËnÓ¾§æ¤ &¡È-ÜbK¹Ğ‘Üb)…°ü´‡$$ùÇ‡õªŒ8Ç”–Ñ·&•I]@EhZ¡4S(‹Ø±!Ú •µŠNâ€REÀ7H	­ƒ†¢íA1\Z¨Xà1å…c:e‰7·¯ÍÜÎMcåÄc—áœ¦ZSmó‡ò¦]QBRå)\"ŒÆ ±b+\\\\—«jÚs„°MÀ›ª¢ïtÌ%’ø°ÇW»D«\nUÌ×?VµM$$’ÄàûÀ\\WHŞTÌÌ§±ôºĞ¹]iI–B’’@fI ì†ÀhÖP—YæyœññŠê‘x&ğ´O&áŸf—Š€%ÜT³aç˜ÂâcéLÌöšE¼”‚.±Ñ0DÅ7û“OH ¬\"§ë›8géğAöÙ9]”÷Â¯ú`‚	“‰ä}!§Ïé	ñ>ş!}Ğs»õ‚š‡KeÃ¸ÅôšCÒ#RëŠ;JˆIbÔ‡ÊHnï¤$W´*¦!©ıB!ôZ§ëµâ;½,@”J<’âµ‚¥AÑQÍñ‚ Ê5şãô‹\' …’¸Nc˜‰$)Ò—®ó‚ã­ü%§ê¦#¶$¥ÃÂÁœö²èéêdÊ#V›ŠÁY¶úC»^xÆ>ÌšzĞµì#èèÿ\0®\\²\\œjÁ²Á0Ä(…¨\nU2¢´…‚/_ñ„éYa\\„AšÿÙ','A'),(2,1,'','Canchita','caimanera',1000,'12.0',33,'09:00:00','02:30:00',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z%!1!%)+...383,7(-.+\n\n\n\r\Z,$,,,,,-,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0ı\0Ç\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0A\0	\0\0\0\0!1AQa\"q‘¡2R±ÁBr#$b‚’¢Ñğ3²áCSÂñ4s³ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0%\0\0\0\0\0\0\0\0\0!1AQ\"2‘RaÿÚ\0\0\0?\0¯,!VöK@ nR{PáŞªFrIUgNYû›¥5	…*G#d7¥¤H`%®Ek“[)—\'£mĞ=\"Scl|få\\èvkXI;\Z”5¡¦{ŞºãG#RÈôJRµ¨;sjSÀÛÈA?(¶#àÒÛ&&Ø[×ä/{*<ÕB1’N,WŞy_ªÃ\'\'ıM#Ç§²f¿i‰¤cYÂâ[søl€9Äê¡\"ö-³¬N˜ßnõóÓr5;OàÜÓ–®ĞŞÛÅóÓ•Îòâ¿…„]Ù:ç \Zn\\¹Û?uÉ9¹m‚^ªácH8­Æ[ÿ\0ÍÉ½Ğî¾yz%=…ğ¾î¹µ¸|“1nàì9–ó˜\"ÇE*E8‘ò-0©yhDÎ»A¤IÈ5­± 4Ïš‡ÃceV ÁÉmB¬T‰ôZX.P÷©\n$Û\ZDæÎ`\rÍ¹€”–Ïa’Gišp*oTc X¤©X\nÄ6B‰µ¶›œH\nGÜ§“Ü¦/Õf[“bšZPZä°SD°à­Ù	¨­+DÉb{5`ØTù…ªfÉe¤);dJŞ‹[%\rjš¢åJ“¢aW-˜óÁ¥sçÊäèêããQVD×Ô™$/dl8Ã?ó4ÜÇ|D›‘ÌesÇ>K ’Úp7óN(é‹›™\'=ş&Ë6è”œ˜Ú•àHãcc„äC|…‘İ0³p€\Z-¨Ï-úêsÉ9š†@{ìvBÄ€MˆÓKßOªlúg¶Äƒ¼‹Œ6¿¿ªÉ—ÒKàs51p-h6¸s†1ÍÍ\Zi¢aTĞ{×¹°±7âAE³ïb×æEğçÄ}Ó¶RÜÚk÷Ì/5.I åâQ2¹\0·uÍ»Âäå Lk\"Îã1{_›rû%+±]·rËİ5&àé•½·ø­!+fsƒ£1\ZXb3l‡+×_D•œıƒ:§H™9éq½a#X“~Yf´$±H¢\"Ô)NŠq½©*ì±GB´—b’Ñ2däC%ĞŠ£3 rÄ€8z#^š‚”×*LT>…êbêš—ƒ ”¤Ê‚\'î]¢‰ç—İ–lóV¡³KèŞæÙÆß¹u²7öY9+ÙÓo«¢O¾JİÑ\n<.&ÃE³éîğ×ExÙ0à\Zı–çª4âãİ²v©:M•­8ÃO#e–¤\"¸¡éèMhˆ¨èİ;dÄÆ€8jSNÛh=|èÍÓ:¶Y)¶öTZEv²•¢ösİ¡f¹öæG­9Î6è=«À\ZğŞt]<G³“Å27\ZÜ“}Å%ÅznG“F±%°¡¶)ôd•.¾2M›(\Z©)¤(š¦mhM;$ÂûŠ,ÑUÒRS¡\nK©ÖıYÉcuˆ¦\"–ÈÒêÂÁ62Q™NœFĞDË­aÈ”èo=“à2[ìì—CÂº‘Ÿ*fÜ®‰°­ú;\\Äe€¾#{á#ÚëŸR›:Ë¤t&KÆl3kïı¾ãÉxÙÖoŒÊó¶xmMÚ,ÒÒëÂâHpõR²¼F1N™ëi4~‘{XàßÆäìS‡7šæ“òÍ£\Zº!£é0aïA.\\üÔ¶Èédœ,uŸò¹¥§ßUQ²1Fàdx–÷.!¶µ°á.7Í6ƒ£ÌÃ›œ\\ÄnI}õpĞ+¨Q	ärß…Î:‘squ¶6Ü1ÿ\0©#[®WÏÑkh)nÓg\0ñ6u]=f—Ê]9±fD7\\ïqs—5œb¥©3IÊQW&£¤”îÉ®>8M”$5P¨ÿ\0¶Âë&àxoRtû%÷\ryÏºĞZo¸‹(µ„àh#Îÿ\0•¬S¨‘.Î7/ÿ\0ER¾¬Ë#äv¯qqóMÑ%\Zeé(³Ærù64^Í?e=’ebÓütG{ƒdò[¦ÎnX¬æ\"ÉP±&7Ü,X(c‘\ZäÜ%ºÔ6‡l`+&¢Şé¤±VJFÓ\"0É\'¿Ş¥éi,¤Ù\0	NbŞ8£‘ÈaQ²M>iÄÁ3„ÙÊ©— U°–›…+Ñ®:÷ ‹9§ GâŒiƒÚ¡khKMÂáäqş~î?\"‹œ»XÏ#$Â\Z;Í\0g ÜïV:M¢ô|Æ\'Ó¼z³şŞ™ıĞ¼Œ±§£×Ã;Û%¢€^‰…xïaNY5›’«‘¬v\'“¬â\r…·2vYİé-l.ÒöføıB£h‘‚àæ²V~rF÷ºÙYDì*¬M%·ÃŠÃĞf9^êdZª×1¬i°ÀYsÍ¯R‘»ÜF›€7?@®½&®\raİuÊf«%vğqÅ·9|ìÎ1é‚0ˆÛ&l™=z×Áãõc‚ä\'¡¹é¢—;\Zˆ²ÔŞFY\nËFéV\'»\Zœ8¬Y8š)Ñ¶µe°µ3Ãš²ì¹2U{©›2ÛN¬Ë,- VÈLã¨NY%×_u#›­\0•5–=éÍJDy¬¤h‰\r”ì“™éÏlQ7Şp´\räı\0ÔJ:—ğ´• ¸ú×^èE3;i‡í\rı(ÎŒüÇSä7fNiB˜F/µ•£±LÇBÂ]ÙasóH\0t„\rÃ7\08zGb\Zª›Ú°Ú¢píï\'ÉÂãØªµêf18äI1óošùÙí³è!¤‰™‰k.6Ü3<ÊeÑú¸ÛCİ\"Ç¾ı¬NµÆã¢‹al/.³sã¼p¾£UèêJ×ı\"6.ns86÷ìÚ{‡Š.Å©ÄcìÚ\0k¬Iå¼îÏDëiÎÉ¶½ğüYŞ÷ÏıSwOÙÅ‡}®mºúæ­QMu½n—V÷\\¹$´}Ïº£‚­[Jîó·îà8*ÜÑØ¯S	3ÂÍe›kÁ-EiHkQ\0Tf(¡9\rèm+wIaJ²`;Ù³arÚm¬A[@†ËKh´”rLá1¾WKİècİLìêWp¯cu7´¥Âç¶(İ,ë~V[À®‰²úªs\Zù˜î±Îä!0¤ı8œÒ›+ÑÊ\nŠ§a§†IwÖ÷\'<÷G™]£eõOFÇö•Ôrk†‡‹ïy’9+å<\rcCÖ± X5 5 p\0dY\Zğ—Î7GÕUT€v¯ŠÂæG!aî¬»/ªZXìe’Yñq}ŸºèN@‘7–LK\Z@h¨\"˜!‘´Y­ÌçÅn&İ/AÅ©½l¨ôÆ‹Œ~&á>-Ì{è©ûkgv­ÈÙÃ6]KoQö°¸oæø…C‘¹/7<zÎşÏW.Ğ¯¢³±6ÅÜa˜a‘™p¿ïe?=#$nv7P&Ø½Ã†Vèt¸áu^¡ÛUq]†ÆÙwÛ˜ôµÖTÑÑÖ™m’‚8ÁÊÜÊ…ÙÕM–­±76ÚBOî\0}\\ÕÚò–ÑßÂÛ‹«WWsXgçÚÃƒGÂß{ŸñÃv§Q¦R«E®Ó¨¸>#\"ªÕ­Ívn”uu,¸¦¤p{œ\\ç@â®s&7hsÜmâW\"ÚtîdsÓg1ÀµÀó{RŸtx1‡V1aE	\r	`,\r”)œ„ç Fˆ…E@ibÂ±1¡£’iL2Hó…Œn®?a¼\0^—ê÷£fÓ6<Œ®³æxÏ„fùFƒÂú•Oê3`¶8$«sA’GØHÍ±2Ø°ğ»¯ü¡uv¶é¡2CWZIƒDœ*\n\n¶B–Y Z„Ósæ•#ĞÚl‹¶öüTÙ:ï~¸­òw*ÍGXS5Àş†×í®..ùuçurš	 }xú®7ÖuYı$³@Æ´ğ¸¹÷%TX]Ö„˜¾ğğ±ÓÆèÑmNÙ•ÍğŞö\'3å{®:ùŞ¬ı®=¨eş,­ÏrÇ,{DßN’.•\0îQólşÔ÷†|FVRİ•Òêkié#3TºÍŠCÀ×bäéœ¤ ­€è·W±¾^Ş{½ÿ\0N3.ùİÄp|Şºµ¶hÁpÚ®¹+Û+Œ}ˆŠıØŸ ;İ_úÓ³]çˆS¸›4‡^98‘|ÛYÜs^„`¢3&Yd•²ı²€\rñ¾~ûP½=è,J<ÈväÀmò¼~&òİ¹OlÈìÓq¾ãÑi¯’Ò&OÓË]*èe^Ïu§ñŞÍ—tNáŞü\'÷]câ ‚öš×Ç€æ‘b×\0àG¡s›u8ÇŞ]DnÔÓ¸Ú\'õ»ğZx+²\ZàšÈ¶ÕÙ²ÓÈb7Å ü/> èáÌ\\(ÉBÌ‰!Æ–€ÙX´JÄê½‘BØ!|1°4s°Ìø“sæ¥›±ÖÙdÎ˜ñR2Çˆ&Ä„Àû>ÜGºs\"bË‚/½tO¥9]K’RFh\r77ôG9†aI!l”’J@\n9í“—)ë‹eÚfN>„o÷ô+¬¸ª‰éÂeTˆ›_6“ø\\>€<Ø÷nOvEF]¦¹Ü4iJÚ;%ğT>	†´ïÏ¾&y¦u´ÒEhæ9±ÈóopÂ@ÄëºÛôHÓtÆµºT8åøÛüón©{J£³kŸ4‡2\\{­ø\0)ß+ÙCŞl\0÷>Ñ}_ôB:\npÛb•àÏå€J—ÁvÚÛ)êq­8ë%ÏàfWüßØÒ™°â-kLk\0ot\\¦{”³#r%“Òš‹³cähùn?¨ÁfüÊ\"Ë!»-¶R<K’\n¢DmmŸOU¢&JÃ¹àsPy…ÃúÅê–J`g¡Å4åÑô±-ÿ\0¸ÏqÏQÜ‰E§“È ÆR‰]+®ŞŒˆ*ET-kb›\'†‹Ì.KˆıáŸ‹OÌŞ˜s–%1‹®¨ÎcÅJ9ª.g(ÙA>#BŠd»<½ø,•¹ ÀN`ç­ce‚Ëİ¶Ç¦@jŒ#@‰l”¬D)’KË’I)Œ‡é5\0––vØÙ<¶âöpm¼À^~ë¤F ÓD>\Zx\Z×nWˆÛ“ZÑ~ewî”W`‘î=Ö±ïwåkI?Eæ’üLwÏO²]z†7×J÷Zì‡Gñ\0mæZ»üs4èBò×W5®Šµ…¦×cÇˆ°u¿¥z&–lMk†ğ\n‹§FŠ6¬ÆbB€‡6ş¾)}š¢L/ZÄ·*ÉˆH[X	:$·B¶Á‰Ü›—‹¿áKh‹¯ÓŠÚºIa?£&3ÂVœL> z•æ\'0Œˆ±udBõtæï\'€°ó\\­=‹ú=sÜÑfN;fğ&Ò·ù»ßÆˆ4S˜±mb¢O_öbàó[–ã4Å¯ çš“§x!&+€Ôà.šVÖµ 8„87˜ÅİÚêB•1Ö\n&¦ ÷ái½¬NW\r÷ø¸z$…P·u>\0©í®;ãy´”˜Æv\"ßDf”Á\Z ;áv|DyÑ-Ä¤Ëv¾GxóAf&›qÇzCYh•…$ e®*Œ6b7áÊGµ§Ø•Á6Ø¼4îıÂ=,»/^ÕV¥†;üsb>±ßwµqí¤ßÙ ä^=ĞÄ\'¡CöÈüşÂ½°]ú–yıW\0èW«£yúºô6Ì‡Lo!ïšÅşÿ\0Á¼Oä˜Ù®Ô\'É†Í\Z”ıhŒß¦!HäD\'ê˜cY$¶ğNnmËGAŞû$ÚXğ°qú“™>·B•öÚ¢Èí\0ÿ\0ĞMª\\ÂãÁ1“\'‹‰°W:ëÚˆ2šßˆLö“¿¾ÌGİƒÑtŸ	s±;â9şQ¸*W_ñşÃ	ùj[ïƒî”~Ç/£ƒ­¤bZZzë³²,Yi’T¢Å% é\r“]–ó‘qÆš?”âRªOqÖáaâr	Ã2µ´µ€L³Ø€E¹¢5à¥öAí±İ’a›\rˆA¥cŠ]pµˆ ]!å)¥iÉáızVâ©‚/’<r>ßHÕ©·¥“İ÷S}hÖv»N£ƒ\"ÀÁê.P²ÿ\0ñ[ÊCôC×Ô–Ælõuwı8[‡ó>A¯“\ní¥ €wï\\·¨lú·î=‹ˆí~¡_zQÒØ©äìƒ$ŒïÑ9‹olò\n$ÒÛ.6Y ‡²!Q]ÛÑÕÆ_ÚZlö:ØšH¸½¹)K¡4Ö„ÌqC²ÛŠeUSl‚`9s“vÌ˜EÎsnyõQuõæ8Ë¾#ú¹ÆÁ>Øt¥±çloï<>\'4|ƒZ¸Ht¾w)•c.æÇ|V8ŸÃ÷[÷òR¸Éšï\';”ôíf™I:“¼¡‚û7OÍsş¼ãÅ³~Ybwõáÿ\0É_¤—pU¶©±lª‘Áÿ\0Èö»ì˜3İbØbÚb=‘+nrS ¶KZ.rLCx£¹ãLÇ½–Ü‘Ïsñœ£øZ7“©wµ‘¯Š‹§~~?U•°Ü ÚßQâÌW@(ßœHÄŞ¦;A9‚\\A\0™_`nˆö(>™Vö4U2olù°ßr›6­_k<²Şı¤²I~Oypö!;£§|´å‘´½Â@C@¹Ó4ã¢4p:hÛP×?weHÅŸ1Ş2p\0|¦êwlíŸ±³±t€k2,\ZXåñdVÈÔº¥³hãN=›Ñjê¬¶™â¢ñÈú‚ü$6´’ÛC“š¾2®º¢a#]ÌdÃš[F†Ä~$®‰tr9h¡ª‘ò™%aqà€p-İ¾€•ı	0—KOW<BÀ–›= Üf¶w+-~t‘¥cz…ÙaèvÈ4òTÂì\0cÏÈUfs—\"§¨ª¥{¥}U¯pC\r{%·,\'-Eâ¯ıÛ&¥€–ŒV½ÚnÇ-?nEVÑ—â,˜¥d¥TÙd£¤zs8ºoØĞf¼WBélh¿ë\ZMø™ôºµµ¡¹%‹I×_b-ıIìqqqT‘\r¬›É5ô[“K-Ã@ÁõÓz^Ö†©›İ xà6÷S‰½s11Àïz‹&XrŠš|s>W9ŸÊâ>ËQ6zÍ­,ŞHß}ÉµKË{\\Ù¾—>ÀŸ%4æp¢#€š¢r³!°üÏp¿³Pœ­³E´ »?œ¿6Ÿ\"›HË· \rZGenÉI„Ùöâ=Â‘©©fqæÇ¡\0 û‹®}×E^\rœæŞİ¬±GãcÚéW°l¹_5¹ÒB8Ë)ñ¬oû€*[;m5Î Ÿ«t,p‘Ä»-’Gèİø]{ÛRBcPÆöõdí;F>C‰®.%Ípñ:ïU÷¼€lHÊŞE£yÎF€±Íõ²‡ww¤R¤ªÙÑ§ ¦‚ğÇLÒÿ\0\0¹ó\nfšY*ásÃnÃgZÖÓ²…Ø}\'µ.¤1ˆÙl’3.İùµ\nÇ¶\\ÀÈÙvµÒ=­B@8™èÕÉ\'i¶Î‹Ii[SfÜØß„Ü˜ ›ç–w¿ºOFö7èFWÃ#›ƒd:Æ8ÜĞã)kµ\0å–‚ÇÀ>Ú¯Ææ»v#À}–QÌ,‘¸šAi¿‘8ù­ZÙ%ÖdÍl¬sMş Zy¥ÓøuEÑúxœd…™\"Î\r\'	Û¢piÈ­áu³)Rğ•d}ï/¸E²‰‡jşĞÈòï1÷ñî‘ô*Xj¶26[r2HcVÈRQ´\Z³f”K&›Qög‰²€½<ÃÒx0VU7…D¾ï\'î±;éÛm´*y¼;ù˜Ò±h¶ˆ~•­«sA°.ğÕ5è~Òı&ŸôÉÑv„†µöÄZÇâ6ÜHu¹g½nÊöC#£¾<$6Ù÷“M¸AR{>L™6666ÿ\0µı”ŒyØ„9İğ[c³÷ôE#^y ğÉ¸­TÇ˜#qZ•©QÉˆ[z\03[pP_K…ú)J” 2¸\'\\uxöÿ\0¥l·K¤>ÏjîûR¬CäpsƒEÈ`Äâ/nëwKÎ=2{§­©œ1å¯–œ&ø\0\ra#V÷ZÜŠNIhj-îŠãÅÅ’ö\"¡¾¿ò•„XÛ\rşŠÅÑm&)f’\'²&A&Ç1®Ø1­s€Äs:_D›CHé}\'Øâ¥ƒ>à~wá æñ:{•\rPÉ*«!n\'ccØ]kd\0¶À\0üÎzÖÚékŸ ¥kû&4½Ù`Ğö´~tÄmıäº§–G=ØŸƒáÅ½­ã`m~gŠâr]Íé´[6„¸@Ñ¹z\"ËF˜\Zğ¡UJ†Çâ7RÔmÏt¶\rÒ#é\ZAÂãáÌpGÛF\Zh»Iø‰àò›mšÖ´ÌÏ³Jä]\"ÚÆY^ââ@¾€ —gË:n’9yY\\#i[&)z@çUG%ó2·È9Ö#Ğ®Å±6áyÅ»H4‡\rÄCuß¶%hòpÕus”C—‰ŞŸb];Ñl‡,À ö…Ã-tÓÅp‚ê*EÉ·ù¸*îĞ¯/<†ƒîTœû?n.qôöLªhC@İ³âtPÛe¤‘ÁzÉe¶„œÙş›}–,ëEÖÚR•±èî±hš£7éİ¶ü„5¥§	íb-2´8z¬?»â¡v›ğ´Ó~m7\nRğ@ÃâĞğN˜ÎIE…ùä€ğ™ÌÒÓˆy§NzIÍ\0\n7‡_ŸÕ7ÜXê);®Ëz;Íˆ<S;¥’r\\X¸#ïéÏ\r¼× é”e×·ıàĞç<ı_ë: ·fU‘¾0Ï\'½¬w³Šóç5†\\Éû\ZcÉ(xw\r›Óm—x¥iÔ€*s?Âl¤öÇIèj©j[LÌodmÅ+››CŞ\0î¹:—Ÿ;†ÿ\0UÒº=²{\ZJ§â.-nMÃlo3‰gƒÓeK#‘Óz³éÛM˜e0µÅÖÌ:‹ß>EMÙ!İ¼Ù6“×´S;´ö4¬\0YÍcIşŸ¢}WZEš8®@Ìl½Ö<†£8Å#lI´Û²Zç:ü>êÉLHi7Q%½Ï2¤a~Ds]PZ2›Ù·È	ËXçdW\0G¿2s9Ÿªî»yØÄ¬:¤ÿ\0ó%q:ä<¸ìË ¨©¸®İĞªìtq;xof|YİúXù®:»GU´m4qİæ^áe¤–ŒÓÙ`…–Í÷©ôÜŸ0½Ù€7b×Ğ-ÆÜÉàK@ú¸ñ(’>×ä ±cşaéÿ\0)µDNsH¸9iô[s·‘4½…Ï>õ±E#+İ#ÇvV´´ócZÇ4óüAb·õäĞ „ZäÌvñú·\\sĞz,BÿÙ','A'),(3,1,'AR3','Caney','para los baby shower',200,'10.0',50,'12:45:00','02:30:00','data:image/jpeg;base64,','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	&$/ #\'*-,,150*5&+,)	\n\n\Z\Z)$$-,,,,)*,,*,,,),,)),,,,,,,,),,)),),,,,,,,))),,),),,ÿÀ\0\0Æ\0ş\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0D\0\0\0\0\0!1AQa\"q‘2¡±BRÁÑğ#b‚á3r¢²ñDSc’ÂCsÒÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0)\0\0\0\0\0\0\0\0!1AQ\"aq2‘±#ÿÚ\0\0\0?\0îB\0„!\0B\0„!\0B\0„!\0^Jõ\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0B\0‰B¯öÌ†s‹‹KHˆÕŞ?w»Í†éå\0®c”gÍi³ªĞw-F£ø˜ûúl¯™^p*\0	l‹Lµßá<CuyF¼)½C4!P`!BÆç4h–¶­ZtËÌ4=Á¥ÇkOU3R\0õ–æ]¡¡CûÇ€~è»ò…PÍ}¢8Ú‹E1÷ŸÑĞl<åJVUÉ\"ñÌ)Ònªk7=9ª¦ií|8vj?yàü­Üùª=lÁõ	q¨şn$Çà@¶3NÉ7>Se~©ïe§,©Yõ[Z½G’Ó-k]À`ŞœUßŠÖ&!q§vİìøÖõt¸+§2íö8»K1<#¡ >j“iç×Óè9Bù•½£Ä½Á•±U	»µÀ¸‘«f\rÌ0êX—8´™>÷rDw„‹)Çşh™~İ(•Àóó„©,­WİU\'¬ivÇ¨N°Ôê\0Ğk±óÿ\01Ÿê-ˆñ•eÛ_t<ogbB¥`½¤ÓÒÏMÁÆÄÓ\ZØ:ıèò*Õ€ÍiWnªOkÇCqâ7j%qşäÆ)Æ^2Z…Bæ/tOOÆöï÷ºi¶\ZÒgX »Ëì«‘UŞÙĞ£îúºC„h05}ÑÎoı¢Ò{,\'jÛT\0Øk‰¼m}´>æ¹s\\›\'ªşøk@.³°\"Orwêm<6[¨fX¬\rJqÀ8¶:·âg;HCêİD¿Mê­ä=¥ æ†ê$Íşq$€ïß’±µÒªÕjP„ €B€3ÀŠÔœÃmC~Gp|Š–„Æ»M‡©MçŞ°—‰Üİƒ¼||¯<}\'ÚdjØâ-ã<\\ä.½›dôñ\rÓQ³#ú.[ÚNË»ó\0é›rğ”ØÉ¥’v••\0tõ;ƒÀ;Ÿø†ı\nyWÖ‚\\àĞ8’\0ù®†Ä9»l8’W7¨àA{œH$‘m”õOh•6´É=¯Êic1Æ«q\rÑ¡Øp\'Fâ™0Ò¥c{GX³C*>œ ‡ íÂ¬â*êC1$ˆwª4ŠÛ{=«Œ2wçsæV,d™3úú),¤$H¿4Ê†VM÷LŒ[ ƒN\"\0È~|T\nô ›M§ÕY1t´0µ¼EÀÔ€«õ*\0îñŞopA$¿‚Ë›\"íÑ\ZqA±>%·p‘m‰ã?¯’Y^}^\nÃŠÃK&Ç€êLpáÍGı‹{z~.IÍô‹±T\rMh-°-x;ËnH´Dm\nN³Œ¨Wï4j2ÇiÛâqŞ\n_ì?¦ñe//%­~\0{ğê¥JÈæ§±.i†Ä{¶{àoÀîéFÚÆã¢RÌ,»pÑÄğ·ğê­¸‡JâtÎ—I–‚˜&Ã‚ˆÜ¢¥oµİx2ãbØˆ½ãê´`—É=’$lŒ“î«Ùx6a)¾2s\\ÂúO\0Óäv!K9]0C\0`,\'kóó^U¥k\0#ä½(R¦S«E¯!öœ[Å‹Íhÿ\0[GÔz.‡†Å6£C˜àæ¸H-2èWÄ11ì‡hñjÁ´¿yMÇ¿L“-€t»ÊüBÏÉáÇ«œ47&]”ìì9Ş{O\rOSä¸ÙŒ©îä\'aÌ›*«†Ëêbj\nø«‹h§öCK£Àç7<ce\'	•=õ\r|Wz¡Ö}šb	\0ynfwMK¯üÃæò¸²•^¤Œ -¶¨õ+Ú\rk\Z@2Î=üÖ¼î<ş¥e‚­ıÜÛ¸oæÕH»`Ğ›Ù*uA4ÀcßÄìIjN»¥-­Àn©õï3ÈîÓè®XZ¶gˆŸR2ÔøÍ¥²²ökµlÅêcš$È–wànŸªwg°L¥Ä5£OxÄXC¯·§ª¸…2TôT‰B¨¼(Ô¯:ÇS`¦’ÈtG#Ö7-ö…‰v2¥:´ZÊ-/kšA†‚ãgJ®gİJµŞú†1\0Ø4|!¾_UdŠJU¡ipA×Gá³§Ğì«¥ÇÍJ¥™ÁàPÜx.c\\@7)‹Bİê\"ÇğOñ=–¤ÂÇë¨D¾6o \'ôwH*°·p@àŸdYÙ³.Àîèşö‡ğïÉ^4ŞÈ!á°f`…fÊèÀ‚§ÓËØøtn$Äˆ[jÖ¡@KÜMİéºkixM3ì¨¹µ4º‘k§pD8;¬AõUgàä†’8Û€7êoqÑXsÜL²‹í.¿É$Š`ğd\0wX6­—›ş\"fÌY’Ğ´°“ ˆÑÃsÔnúxã¼pà´èé$EÃ ?ìá(¶¦–È›_n=7ä³Km&;ï¡s02\":ğó+*ytpWVdôØ G™çÆ5)` .¬0©-œ_‚wvQ«äúÌ‡\"8ÿ\0U&†[îÚDÌşŒz\'˜Ú`C€ØÅ¹j&?Qú…«(ÃÀQvìUQª-U2°QjÓ‹Ñ,„(¸5¢KŒÌİt.Ív]¸Q©Ğê„OØÀoQ;ª†ANqtº8ŸF•Ğq™ƒ)ê\rÇÒË—õ,IE?±§‡·÷²SŸAôŠ]ÍiÒ\Zà#I1©ÇŞj«œööIóåüGRÅcjT2ç/AeÈw#¢£ù-õ}¡½¾î˜{A6¾Æÿ\0ãJĞiĞêÑ¦Ö	’A±‹‹*îSÙ,]xÓHµ¿yãC}MÏW³Ù{:½Bã÷Yaÿ\0q¿ÑZ1d·0É»IBµšøv¯…å­vú»¢{Û¹+`TÜã…ÊÀ÷xq©Àëo±—º]Ä[ª¯æ²Ä=úEPÆ½´Nï‘É_µ°J{Z_¹b«Wİæ¤p{Z|àüJ¸Æÿ\0jÄ:¨½sŞÈ‚ö5Æ;“æ»\Z s\ZA@3âdÛ«BòcèıLÓ‡`*ó%§ü±å±RÔV¿÷®»Z~n\nR¥‹á^¤«ÏÆ‰#ûÇwiâÏA¿¢’¬¯vŸJµgÑk¿xÁ;Ø»‹GP#ÕR3\n%Çhp·_49Æu8¸™’g¼\\o>*}š„{Ï`OÃWXMHÏv,Âa{uÌqøò]O³ØFh \0Ãm•2†U$q1ı‘µÍ\næF–¦Óé\'ÉÛ¤Z?–.Ï°TëÔ~€±$uæªX¼è>\\İ¸ú]¼UkÃ–¬ÿ\0\Z\ZßtK·v \Zz±Z2cQBÅ\\ñÚ\\ÖÔpÕ3¼³åºYSŞ=ä;ıx©tòİw§\r<¸$Û&¡ßk*\';xx%$ÉHÃ&ìùt®YgfƒLÛIàDÌ|1ËŠ›€À†E‚f×Ù.htUló&k+i`Ü#oè”aiTp!±$€ép¼M¬ğwE~ÍrvV!ÆZñ³›¿šAW%{iÖĞõnfÎ Ü÷ğ\\ÙãœetoŒ£8õcªHØŞİT\Z±10£dÔªÓi¦[Üa!„Î§\\“\0™ÓÀx­lÈU‚Ñ¾ânÓqÁK£MVªÎ~HÉ=W	V*æÖ›DÄşº&® M q7ıx¥ø…ÒÇOiˆ—î-®À?¯^JB§º±i´y‰ú¥Õ½ÍçïÊVÅb]˜á±Æ“õ¶$§ª_˜æ¨I¨ç8ïÓÑn®RÌQDø˜³;š¶/ú™áşÖi­™ÆÍ“üP•c1Ïvç¬	ò[k«[rºÕª\'½»KZHŸeGÇÃ…iş«>w·şëìÇµ¿·axfµ\"S¯;ù›¿PUÉpf8ªØ,puJne\Z­4ê\0üL ˜u­÷×VÅûDÃ1®#[ôï\"&ÃQ?õ\\L½c6‘ØÂ¥(­\Z;mŒe*ØZ•\0-¬È|Mıèõ\\é¹ŒT´¸á-%ÑÃ–ş‰§j{jÌsZMÌ4$¹Àˆwv uH1İ²ãw»‚>¿$™\\c)><q„¾ú-9>bÜD“A°\r—\r#x¹A\\;5›\n”Ì†¶KIw~ĞôŸªã¸bfÀü\"dîd‰6Lğ˜úŒï1îi&G\"‚Ë—ÛMlèr~’”\\á/ğt¼«7¨q¯lOu¤ñh™d>ÇÍZ×#È;GTâ(ûÙ0Z$Ûâ=âHß‚ëakG,3EpÆ—8Ã@’NÀ\rÊä9înìV Ô èÖ7ø\'ŒlNşjÍÛ¬áÕ0´A7ò-\'pÙ;\'É,¡—¶‹`ügw~óNŠ­™\'+Ğª–0“ğ7ù©t°9·oÌ«&Ñ%ĞEÓÌ«\n[*‘#(£´ù¨ıª­¥ôéEÇÄØ|V,.aä©]¤ÄN.§&ÃGò·ó%?Š¯!3ÔLÿ\0i÷m×»¶`æò>ƒrTkíæòOJhF¦õ,i\')[‰Y>[¦ŒááŞx¨cÆŞŠN²T×àjP|\0&Vñ]/me³ß%8Œ²Y¬´T¨µš«MJÈQ\"èö¥D¾¥&qh\"n\0‚A±¸[jÕQ*ÕLx£=4C•xjÅaØÂ\\6u„›4LÀ˜¹±JñR±fÇo¯êT\\EVÎâ\"í?«£ô¥kÒ’©ë4nx_o>ŠŞ-µç-ÓŠ 4Uh‘^é60Ğ×	v–ß™UlÇ\ZÚ.kt2\0kxé%ñ»Œ^9*/¨>ÚZ)<N\nÙsºƒ‡ªÂà_{íäbVÌEM0/\"dO6‚oéà¡Œ(\'Pöà™.[ÌÔbè^ŠÜÕşTñôZº¤îkHÚ3Õ+Æv±Å­e6³øX\0Á\'ÇÀ-x¼<_@ùì’×2Lü%L8®7ò;›—]?à´b©V©T¹¯¦tK@¸7mîO	è­tsl3iTg¹ªu<»P©Şß$ëóŸ%TÀ×mJB£eº^é\"`Ííä·e\rz¥­¯Nˆ‰&µM;Ì‹«ğê¥úSnÌñ8¦w Îğ63á*+ñŸt8ò$\0x²cœöqô‹tV¥‰Çî^Â@æñ6ß®Éx#†ÃÒEUìbÉ~™}Ã~©Ë	‰à\0\'»<„ìm1ê¢»Ç»¿U´@ûN3qf†ƒŞƒáe!Ïk*42Ò ·q«I1°1ÑJŒ~È³Í‘éÉÿ\0±ƒª¼¸Ã@h¼Èæ:ñ…Ü²Jåøz.;šl&w˜>k{>ËN*»ØéÑ£¾HîÈ€İCºIïµµ°£KÃ.Y[gx0½\r\Z´é.1ÊUOÂã+¡â(‡´´ìUSû0µätÌÒ‰.ÁÎş\\Â²`°QÜ./	•:P†ÉHôS·¢å9½IÄV?õ_ş¢ZvËfŒEaÿ\0V§úÜ¶ğw6+6’7Ğ­²ŸJ¿I<¦>iEÜp¸º`Ú.Óhë¦@â%o•xÄ&y™çuèáİTÒ`ÓR\\àHiiØN¨ÍÊv_›V©¢iÒ\r-/íöÒ`Íø­˜\\¾‹õ² oÅâ{İ×µÀÉïHs¤mè¶ârZ4ßqI èæÜ„ô\0.{OµM41meŸ¿KˆY~Ğšà†µÔ¬¡BÖüB•\r’*ÕQ+UZêVQ*ÖMŒJ¶ê¨ø|9ªènO\07’µV¬¶šš0µßE2ÖÎÆ¥GH\\‡ø•99,v‹a‚É*bÎĞæÍ{:rZ\0cˆ“³šçµğÓlskŒ]&ÄÕƒ+NŞ#Â@ù/+´r\\$ö;•¨èÃ^4ŞäI™Fdù¬°æÄü”G™7åKu2|z3li†pqÒî;›´9S©xŞN©ÆOA¯ªÖ¾bûXíÁ_?°0•©ÁsçL8Ë}œYzª5¬]ÑÀ±Ù³âI‘ô!tOe=ˆ¥˜á*Ut5ì®[~ôp$›ñ$æ§²\\©ßŞb+0òÔ#ÄKvVŞÃex®•Jtq{^ıdÔ‰Hd\r ZÉRví‚iSâ½™»I\r§IÖ‰ÍW+öH@¡Qà}Ø>V+®Òaÿ\03=V_Ûô\"}ëH¯ôU\Z¤ÑÄ1Í±¸İ,4&‡û\\ò\nÃûm#5+¸s1ë+«á1Œ¨	cƒ€1e!7nÅìÕ,(ƒs.&äSt!Ñ[gŠŞ„…:p³B\\‹´\ZÜ}f¹ÚA©3ñ\0ñó+¬TÄ\0¹g´—1˜¦Ô/\r¦&÷–’64ş‚ÙÃš„İøĞŒÉµ¢^WN–“¥ÀèuÜêboh—ÏÊ7ZòüøÕÄ¾ˆ¨àX$»K!ğàÛoHUºYó€¢A’òÀè‘psciØñP2¬ìŒW¾ßTÌ}©Mí½á³Çº§÷ƒŒå	9~5ü—,·7uSZjÔ“´#\'¼Ò@k$\\x”Úƒ‹\\&µBNÖ{±»#ÏEDìîtÚL¬t—¸v±ïo\'õ	ÑíCKÜGÓr/Óë\'~ÉÙnOBJ&‹F)Ïu6’\\æ2Öé:Ÿ¬‹\\uºUZ³Aî“kIâx¨]›Îjs©L0Ôa%Óªó\0ºz^<ÖÌáš+¼\r¬EÉî–´Ö,ûÉ¡¡Ñ&mı£ªÅØ¤¸ÕXš‹¡Õ¬—S£>ªÒj,Q]ElÉÏY»×S-y=×5Í\0YÄ:J‡R²Œq0AäA½öéÅ/7æ…?ğZş)&/eXxĞnmåaæ±ªñ7™åe¶µ\rO:v7˜µ÷Wú¨OŒóñ^g$\ZóÓ¯$²/ØñÔ®·Ó¥Ñe‡e1M„œâsÖ	åM\" =Ñ[²\\Y@	æcn\n»—7¾9ASjÙÑúÙ2)¤54FÏª;öŠš·Ô~D‹( S{ESYG5tñßÍ#÷©í%áDÛôaïGè§İŒ“‹¥¹ü$ï[z*›jì®ƒ\Zj—ÀãÀIK—ƒ#i—~ËüU¯?õ?Œy\'ê¿ÙmêZ;´ş‚°%\'eÚ B¤€B€!xçB\0SŸ‡6CN5†;LÄkƒ§{n¾~şÏ5æ{·º¡qîÉ—|››Fät…Ò=¯bê5Ô7:íq-ÖZÛ9·1Äƒ\n“€¤[T<‰p!ÀL˜=éq<\0›œÂ^IÕ#WktiË°?¾«IÌ4êT`P‚]ÜpiÃº\r¬±Åvb¥!M¬/..:…´5·7Éµ†É“ªS8“P¸½î{OtY¦À— A#Šò¾DíÙ]„Í˜ç–‘\'bã¹—JRvÜUšçEEIÕêe Ş9Ãˆï·ãÑ?Ê»(*8º¦¢Ş%Ü·õòHqØga´º¡¤â]`ÊšİÔ°çt×Z³±L©ß÷Oª×\rEÀCÈ±û Æâx¦ãµî‘“,“µ\noşğy=<=cîÁ¦\r3ââj·mÉàéê´çy5ß\"\"\0ZËnc…5Ú‚ôÛY±½ÆÅÇŒH·1~!!Ï_§V	#Vñ{€cnKgÓ$²f—ğfçÅáÁ÷²S±?«­´~¿Ù-‹Z|·ôAÄqßäáù¯AÑG˜cûBÁø„±ø«NãüÁiv+ˆ2¨\"¯0ÅõÔJØ…\rØ¾2£ÔÅJºB\'‘¿	5qœ71àx,›P’$Úoãâe,}TÙÖ£M¿tLÍí;™óİqş£j¤½g[é¹g+‹ñK@\0‰óR™RoÇê¼Ê\\Ú€;xÿ\0EåZf› ü\'n…r!ú|7d©p±nè¤âñPãi&\0¹³\n6[P\Z¡‡s1è§fXkA¹ëóZc%Ft¶GBúzÍJM..ia-gÃ\ZO}Àg€à°$Ÿ‰ŒIÒfóûÁùoº‚ip\";ÎîCH$;\nN€Óà|qÆQòJ2zÏF˜pp‹ŞˆƒÇj¦cæ¬9UGUf¹³A¥ÍaÓO6T&`îB¤Ğ¢İÈm£ì8RÒà\0†“ae¤m ğYóc]1Øò6í£«vCÚŒsÅ‰İ£f÷b|öéÕXW4ÊK)\0ãŞ}+j¿t7xÜqÄ.”h;Cä¶z„!0¨!V+ÚlsŞa­IàŠÅ6›KŞàÖ$“\0Î;EíN“œÖaÜtHÕPµÂ]«à$Úò¢ŸíO;¤rÚeV9ï÷zZ×8m$Àá¹[F‹X]X¹Ï$€	\0ß™>‚u°«,=¯Ì=ãÍ\"-qÔâEŞÓ,$’-½Ê[[1ÒÀÊŒ¹€\ršw0L\rDHÒSÿ\0‰{ŞÖ™‚Ò6Ğâèûİù“e˜ú.q{ÚH\0!„´ì\rÆûä`¬™$Ü®XuPë«WÌ›J³F \ZÃuˆAÕ{ÁâıÆçÍC¤—:LïÆ#è°Äà‹À÷`Éî5‡PÔíNAØ}T¬¯(ysıå7A4iè`Iü“c5l–\\ŞzxÖ\\ûÇ†{±İ\0ö§\0~#Á^èaèÔ£‡ÂÓ:šİ5*8‘ß©¤÷oİÒçE€ŒªÛ;8ñ‚Æ>5<rt´ßq 8\r¬­8<	¡Q®\0{¡NÒ¤O©Ù#/!É(Ñ«b““×TQ¦Ò<xÄùSÄaµ’x~šo‰¯öñ;àŞÈ(ôûÓ Ç9OæVŞ\Zø£ŸËšÉ¯±VÄa!Ò6J‰ıé‹«h¥·:%J©‰¹Óêw^^ËgÏ¯D³‰Š–Øî´º¼>ÆÊ¯+}*ï-	èÉ«`k(­u½Iy‹¬dê-Ôğ&$ß}¸ì™âêt·€ãóInW2jL\0 u&Ö[ê;çşë‰ÍÎ¥?àëñqüXíıÌ¨cM7>¡>~dÊŒŸÈª^e4À\"$ÔG$¯œ¹µ%ÆC·:š\nöY[vtl³W½iãq?Å•Õ©õÅVA³Áõ1hñTl1\Z„›FãxÜÔoá*ÒÊ™-QÄXß[\'ÅYi:\n8V¨i8–8ê,|Hk¡¢>é¹‘pVÚ}‰ç‰¤#«¸x)¹sšúÍx0à;ÖÜ…%õ?ûÕÊÊãê*Ò‘±Rı¡ƒ¡î™<!MÌr*8z%Ïs€q°§#Tp7-›pÿ\0ò›æØVşÁMÅÍÚ[déÈ€v<>ÒNWkCqªe£±xf=¤èAiauÈ 4ƒÏLz+kB«öŸ¹&Eôí3f€d½Ä•¥	ı!\nH3Ë™^“©ÔµÂ>DlT¤ ÚœµØ\Z¦›˜E2â[VI÷ÓTGx[»H•U¦öH#Tï~bıWÒ¹®QKLÓ¬ÁQ‡çÌÁêí·³º˜ïiÍL<‹ıºs°©Şª­!«%jçT%Î~¢ğ?Ó¦î4Ø…å\n-hÒ\ZÒ/:6ä8D‘cÍ\riğ´`êËœĞÒĞ ’A´‰;ì¹ù2;tü;ØpB£Ùz0otXé’	\r´Äú-”qÁŸŸ×TztƒŒñó>\rÓ.XíMÖİ#¢\'È>©*Éù6¼¸°+Ò`ñîoï»¼À}SqïÔ6ºÓ`w¹û­ÿ\0e³ØìEA4Ø@›9ğ,wÑ©°-\0ÊöJ†¼+i×¬§6±$‘ÜˆkGOBÜ<n»‘ÃæsVMAhMQ•*js\\v$¼ƒlÈ=*V÷TÃOv»ˆi’d¸‚fêí¾1¯4ê¸Óslêz}ÙoB7õK*ç¥÷1+«)æ·ã,Öh1.ñ°é½Ê©U¯{”b1³ÅC×¾É¯/]!>Gdƒ‰ä°5TWâ\Z8­NÇE-æca¨°~\"8¥ïÅ§öz€}S¨x}şI3ÎÒcc^Ë\Z0Ö7§Öé.k›Kn\rÈ&dnö[sìÍÒY¤·Vä‚\'iÒ9$Z5wLq%ıR5M¯ãŞMÉ•++Êjbj²•:£Şa­h¹ü€ælƒ±¾Íqy‹‡ºfŠSŞ¬ğE1ÏOßwFùÂú3±>ÏpÙe=4Fªú¯÷tu¿Â>iå\n6ÙxË²ªÕ*;^ S%Ä|,l‚YO ¼>\n¿–ãæœ™%¢ ‘«oP»õj!Í-pAH îâö‰’#ê:\0Ì;…\'ÑmMNØ“¦Æ×A*Âç”ÃØHp‡´Îıİ@¸;ÉƒßJ£Ş[ZÚ¦}ÕR/&ÚZyñ„-ì¾;LU£‡ÖÇÌ8=‚`H!6ÀvK6§!˜p·ÔúGk\rÊ´¦Ú!E#{é±·5ÚZU‡.mK\'çxpZÇ—Õkiµ£İØê%Ä‡s‹u^Êæõ)–9ŒÒcz”æÆwa$ÍûÃ3]Z:›M7k\r½@ê¡IÇ`ãgIö}˜6¯½,Õ»e¤—A\0Ø@Šä¹Ç±ÒK1‹K\03¹Äüˆõ]U;Ùv¨„) „ \'ínZqJÔE‹ÛÄo$á•ÑöcT¦ i-‡KHñ¼İI£ì„›Õ¯\'“[eÒ¡{	+º6>nv«±OÀû1ÃSøQı5hoı¬€¬8†…Ó¤ÆŸ½ïûŒ•>š’^e\'\'m˜”‘^B’¢>Óv/nœM&¸\rxîÔoø^.<.:.EÚoı>b.À×[ÂS¡şÃºï=+½!Ç9×e±¸RF\"…j}KN“àáİ>©-×ÛÆ˜\"Å&Çö#ZM\\%“¹4™> J\0øæ°¾¬¯ìs*wü#Gø_Pä°o±œ¬Ãÿ\0ÿ\0š\0ùa”K¶ø~Š~*©\"$;ƒYŞ¨O ÆÜy¯ª0ŞÌòêqVûÅÎ1òO09E\Z\"(Ò§LZßô…lùŸ#öA˜âÈ>åÔXw~%Ú|Ã#Qô]S²¾Ápxx~$œUAÁÃM z0wó%Ó´¯T’k¥E¬hk@h\0\0\0\0à\0Ø,ÁA„ê[Ú…˜Ê¡P¸1úd°€éiH<@L€ äÙC0Ô)Ñ§:)´4j¹&çÍN„!\0F7Ú´ßM÷kÚZxYÂ\rÖô šìÅ,\r#N¢ÒíD¼É˜xØ\0t!\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0B\0„!\0BÿÙ','A');
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
INSERT INTO `propietarios` VALUES (1,'Vianel','Rodriguez','19591778','1990-01-07','cabudare','54343','3213',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0\r	\n\n\r\n\r \' .)10.)-,3:J>36F7,-@WAFLNRSR2>ZaZP`JQROÿÛ\0C&&O5-5OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOÿÀ\0] \"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0_·ä}áGÛrN\0öÍc#«œzP\\ğ3Ï½\0kı·œĞúÓ\rñÀ‘æ?¯CéL21îzc¥\0iÉ~äu?ŸJ‰®»ŸZ¢¸˜éR£óéÈÍ\0^‰œ0ÁëÇJ²ƒ8ÏÓŠ£c\0óÚ­ÆGLĞÅëÈíøŠ‘N;qP+€½GNıè3¨br3é@T0G¥Y\0\0½ë7í?NiV|ƒ×Š\0Ô{ëšl·\0)ÆxëÖ³Là¸õ¨%ºàüİèì—\0ôæªÉq×Ÿ§=ê›ÜãÓÔT\r/¾}±@rÙúTfvädã5Y¤ÎpN1ßšBİ‰ãé@˜ô<ûTLÌN21õ¦ó¹9ô¥ÛÆr\0qÚ€ØÉÎ4õ<uëOÚ£¡âœ$ş#\"€#ØsŸJx‹œ{Ôœg Óïï@\rû`K´c8§•qĞcò¦¹Á áOùÅ38†•ˆÏÈô¨÷Ô\0óĞäqõ¥÷?şºŒŒ8§¯Œç®(àğ?<qÇj\0Î9  â€#|…@àçïØÔÍè	éëQ>3ßu\0Î}yÍ&Ş1éëR`gèzb¼`uéÒ€\"ÚAàÂ¤PzÓ‘N)ÏËü©áyäæ€Ç§Z•Tà\09¦¢ã§>• Ç§Nô\0ôû¤.1´ğ\0<HïMQÇ=*@€Ïµ.8Î}øÅ)>‡>”>ŸJ\0cc>ƒÎ8äÔÀp?^´ÌŒ“š\0@SÓ?­\0c×4¼g§éF>Ÿ•\07§¤Æ;sìiŞƒ#?Jõı(\0tõ§´ÁÇT‹Z\0rçŸZFÆE/LsƒA Îh6ÀnØ±¨ˆÆÆ¦aÉíÏCQc°<};Ğq½=WœcÔ˜ëéN##4\0à\09>´½¸ç=èpN9ô¥ô ôÆ\0v?HxÎ8íLcßùPßï{\Z\0ãò§w´Ş¦E\0&Ü×â”r@£dtş”ìœ~\"€;t÷§ĞR\022Hæ”tÔ\0£;GåíKŒãäRt\0g§JwÏé@\r?ˆ¦)äÂ˜O`z\Z\0vxëZÖ`zvæ² ÆF­{AÈ8é@İ=OzÑ$Ôæ¨[Æ>+E:‰ 	ÿ\0ëÓ¸¦ş=)àzÿ\0:\0?”wÆhçc×µ\0!ëíHx=óKÁöâ›øĞJ†1RŒä~U~\r\0W’«ÉxúU™\0éŒ\Z«\'\\öR@0{â«H¾Õiñõ¨$éëŠ\0Î>SíYóGÎH­iÇ©ê8¬ëŒcœ~T› ù½…CÓ½X—öşUŞÔ\0ƒ§M(è8ÀG¥7¿ãÍ;ør}?*\0±m÷‡>Æ¶ì‡+X¶ß{b¶¬ÿ\0‡Ã±oØ€Hô5u¡†©ÛƒÄUÈÇÿ\0Z€9úR&sÈĞ\n`ÉüêEáqÉæ€<ÄãÛµ4ã¯¥8ç×ZiÏp3í@	Ç¦}x¥É\\¨É õíŠ\0N„g­H¬\0#Ê¡Îz`}{SÔ:\Z\0¹ƒ<‡ŒTé>1×§¯j „ñÈàÔ €8ôõí@LÄœ0<ûPdùºT\0ç°öéJXã9Í\0Yø£Ï sUCr>aš>b9ÇøPÍ9ÉëQ³Àç>´IŒS‚¸ïÈÅ\0!9<†9íI´0y©–#Óí ç\0c¥\0@#Ïğç½;hAÏøT‡¸À‡98\0Ğp01‘ô£©¨\'Ö˜IÇ©éÖÇ@ühÀşà~a•Fzã4ñ(Eú·4ñ‚š€r)øÇ\0ÖÀç\'éŠaè0\r=¸¹¦0ôüH ¾”€pMIÜvõ¤üHÏ¥\0 A’9Hª?<SFäş”õôÇÖ€ø=©¤c<cµ;·\\sI{:Ğ-‘Ô¥0¯l;ÔŒ¤ôä\ZLäş¦€_nsOXñÁø×#jeAŒ÷ <±ŒÂåİ8úU‡7åM+r(¸Å(P6¾¢¤+é)0qèG§j\0jãŞ:r?úÔ˜?şº^™<P‘Áü©	>´¸#¸õÍ&Lb€\Z@ô8ÇåH3éN#=p)\0íü¨\0¥\0ÛéNÿ\0õÒwÀ=hìAô¦‘Şœzt£<Ö€JzƒÓ½i£9ëŸ¥=s3Å\0<8S‚>´6@äòzqJ8ÏÒ†éë@Ç=EF@½:T¬x$\nŒõö ÿ\0Ö§/Ğç4Şüğ{{S¹Ö€ÇaJz§Ò“è3jlãÒ€Ç`i¼c#4îşİé¿\0 ìp\r\0c×ëNï“Ö…ğGz\0M£û¼Q€;¦)êoJ?”\0Üã}h\0Ø§òON´câ€\Z0=ixÁÏ­.ÑƒïÚŒcŒûâ€Ãëô¦ãæã8Í<ğyÿ\0\ZgB3€hÅ¿;HÏÔÖ½˜Ã×‘\0åsk^Ì=èfÜ`zV‚`SëT-ñ\0UõàúĞƒ¥?ïM9æÊ÷ àsÇjO§jN”F\0)éÉ¤äJQ×ÜRÿ\0Q “ÜiŒ9ëÛ­HG©¨Î=(¼ƒ×‘UeÏjµ&}*¬™Áh³qÜõ¨\\zŠ™ùb¾µãkÆ8 \nS}ÑÏÒ³n8‚9íZW¯™qÆJ\0Ï—ï¹şU	Æ}ºÔ’Ÿ˜ò*ô\0¾¼=éqÁçñ¦ƒú\nPFzĞ»lŸ¦y­›#÷zjÅµäş<dVÕšàŒóŠ\0Ù·û dş•yq··çÒ³íóòñW¼\0A Œ’xÍH ££õÏQR.}¹ı(ÌN\0éÇÓ¥FØÆxQOb8øÔlps“Ÿ­\05#¦sQdcƒÚ‡<ã$ã½3¯íŒĞãš‘qœp}*5É óåR ÏSÅ\0H½GõéO6‚´ˆ¸?ı~µ\"¯èxôéNÛ“Éú{T@8cµÈ=(th\n6äâ—=²y¦¡\'Çá@`s‚¿¥<Ó EB§=úÔ«Óè{Ğúút£Œc1Bó‘’:ô§={PmŒşê6\'üñš{ğ3ŸÎ£n½{ğ\r\0E¸çi3Ç·N)Ø\0ŒæÜã\0€ŸcÅH£9¦O:•}IèzuÅ\0J¸ÓéN1Í1AI>´ş1Ğó@qyÇ¥1±»‘Òœ~b	ÏçGNAÇ|Px\0ŠB;ÇNiàc¦:xPÃ#©ı( àdw©#y^=(Øzò?*\0ÁÉ<õàĞŒ‚yÏ¥,˜ÈéÒ¤òË\0ÊêO›¤Æ3ƒ\"€+ã<ñÒ”/=ºö0·‘I§AWm´ø[æ–Fã¸ \nqƒÓ àúU¸àsÈVÜU¥Š1ò¤‚ \0/\'ëR„d(ùsŠ\0©ä\nñÛ4¿cleŠõ«ÅÂJH21sH /úÅg«Á \nCO”…Î}ª)l§ïGòöâµ£ÚÒ/…<aià+>7\'ı— 3¨i÷â“$p{ÖÕÅ¬@Œcé’ÃŠO°—Œà,˜é´òh})Ç+^[+`Ù\"÷\rE&• Pa0c  ²µß®jIcxØäŠŒõç½\0(ïNïÅ÷À ÚŒã…?ocœwÎ~”\0Ñô_Ê¤\\Æ=&\0Ÿ=F3ƒÛÖ€CdóüS9Çîi¬qßÔã9ÈëQ2xúT§’1Ï=*\"r(8ÁÀ\0zQÏçGòõ¥ãÿ\0:\0^øà(8ã‘éÅúš3Ç¨1õúQéÀ p1Ô`zŸj\0\0ÇQN¢™’28§)¾(GAÏÿ\0Z—¢õ×ŞİqN9üè\0àcùRw8àRƒÆ9Èı)8ÀëÏOz\01Ücü){Ÿz\0Ï~ÜÑÇLúPúJŒõõô©N2rj#Ôz\Z\0³	\0s g­‹1è>•oÔ`ÖÅŸl÷ \r»pF2:ÕèøüúÕON†¯\'8ç>ù 	;sØS±Úš¼qéÍ.}sÅ\0/oZ8õëGz_ÇŞ€¶}hè9ëF@çŸzN¦€ú•:Súc¥1óœ~T]ıóéU¤ÇJ²Ç®xªÏĞär9 \nÇïp8ştÇéƒıªVÎxÏãL~?‹@÷#Œ+.ëŒçƒïZ×=ñùÖMÂã\"€3%ûÙéÏ¥C“ŸÎ¥—ç¿Ö¡#  \0{`v¥İF9õ¤½»RŒcÓ×Ú€.ZíÏµgãõ‹j0qœs[–_w¸í@\Z¶äøÕÅ<tãØUKr0:‘x«c u ôR®:÷íÍB¾Ã(Æ:}hÌÛ“Î:zô¨[ÈJ°Ê1ÈíP0#‘ÓØĞfê“M^œß•:^Øñõ¤UÎ1@\"÷ç§oJúéšFF{c½N™ôôÍ\0Kì9§/ÕçÒ0=:PŒzõô4Ö dúSGÓ9ìE\04~”ºÿ\0ë¤ îÆAô£§\"ôãZ™:r~µ\nç¨©Ğ¿­\0J8äuÍñŒĞ:ğ3A>şæ€ÃƒÛ\"£`yõ!Î08úR6Nsë@0Æ¥4ò§Ğu¦àãô ÇsjQÔö¤ÚrAÇ#ŠxSÎ¯Z\0zpqı:Sòxçµ1<\0IÏAVc…X\ròl_?/#·¥;iíŸ «)ö(‰Ü’ËÇğñD—ÏoûÍÒ€*•9û€ÿ\0Z‘#‘y\0Ï4°$ÆC p@\'Œô«13+’·\0\0{h¸‹xà}êhìÉåJœnan¦B?wŒrqÖ¤ıÜ„$!~¤PE€ÄøU\rõ©Ò\'ÚBLtsRyeoù—¥=IB};ƒ@ÒÒä|ÆF\0ç TàÛÌù‹À*G4ğ]Á(JÉ˜#a),cÉâ€,FĞJ¬\nìpx#Šwï\0ÁùÀ?ˆ¨c8ãäÏ¥Ld9.2	àñÔPŸrÊ¸ t\'­\nKJîC×\'¥)`É¼ç8Áæ’C¡=Á\'\0õ†&S–ıéŒÑ}Ó”Ò»Şœbià|ØãŠ\0›ÏeÚTîR:c4ß´0)Pé\rB#—`úàt¢T,ÙeÁÏ=hÖw›æô~´Â€0!ŒoÓ52O=	©xÁ÷ô ¸€JOš¡°:¯SYòXFùòßiÏ~õ¥ÍÌŒ•lóLÚ’u_Ş/¥\0bÉo,Gæ\\Œıå<T`{•¶°±;ápyR8j§5²Jå£Q\nöÍ\0gã\'>Ôc\0‘ùf¤’7Œ•uÚi‡=}zâ€‡}iİ:ö¦óŒ\npéÔş\0£åééÍ1>¼S¸Ç|\nku?­\0DÜ}¦s‚2§z\0A™×;ô Ç§­.Oÿ\0[€g·ëNƒÇµ\0\0öÍ}ÇçN\0ñß­!\0ş½\00ç—¡ääv§b“~T\0Üuÿ\08§m\'Ş—\0{\ZP>¹é@¶(=	üE;iÏ ŠLô\0\n\0\0¨¹=úS‚œñëJ¸ı(ƒéAİÔÔı‡œäzûPÉ€y<PGç¯µGqÅJzœ÷¨ñóÖ€\'ƒïw­{08Éâ²`ÎF3ùÖ½§<Š\0Ø¶Î\0Ç¯¯U\\\Z¾‡´\'ô¥îi£Ò”\n\0pÆ:ı1G~pi8úRçh\0¼fšNj^Ø4Ó×”\0×ğ¨ÛƒÔSÎ\n²=}è=â«8ÿ\0õÕ‡úg×š¬ÙèW\0DÉ=óQ¾;b¥Àç¥Fì??J\0£pp¸<qøVUÎN@½ëZã¡^••rœƒ@2gw=½ê-¼ç×Ş¬Èœ‘ÏµF#`ÃÓÔP`\Z]§qÁ÷ÅJ\"`:qÒ”F@â€&µ#ë[Vyã­d[)§zÙ³9â€5`Ç#¥Z¯j«ìr1šµÆ00(Gÿ\0­O:ÓFqÏZ9 :|`û{Uy9ïİ*y2:ŸÂ |ç9ç\"€ qÈç4ª;dş4¬9})P``ç”\"ùúÔª½zõíÚ£^åš”d{Pˆ=ÉöìcƒŸ§¥4cm9NqÉv\0¤\001ïÒšã“ŸZr¹$ÓX\Z\0‡iŒJ\\qßÛ4ò@ÇåFß”AÎ(Ö¦@r1Ïò¨À#&¥S@™Ğ@ô4`¦‘²>˜ô œÍ!Ç=}iÜx¦FqùPpGôdg#¯4à>\\qœúÒ…ÏRx Š 5$q\0ã=iÜ°çîûñD²¬qìF\'€(Ò´P‚¡ÀÀùˆ5Z[°I	wsQª6İÁrOlğ)Q†yŸ?w° Ã-Äƒ\n˜Ç!Y›ç×­30ö†1Hï(`J’{€3@Â†?™ISã\"¥Y%~än¿LÔJÊÀoÒ7ª|œRq@$¼îXUÆ9\np*¼$1óA<:UxÊïÉ#‘Øãõ§5ÉŒ\0±¡Ç]Ã<Ğœ1Œa7ï\n\0+óëP\'9ä‘Ï\0p*å½°v\nÃçşt\0¨ñ2ÌøèXT‘€h£U+×¾jEµ*ÊÁxèr*ü1í\'8äzPD‚vdr\n÷\0c5#ièNœsÖ®ÆˆPO&¤ÚØ‘ÇZ\0£od=¡~¦¥€qŒvn<ä\0½=ELªFwq“ÀÇJ\0¨¶qŞ«ÜT‚Õ€«ÅZ\nvúĞ\0aãÚ€*›ŞNİ»SOŒ¡\'š¾«Ç¶(Û™ ã§\';H8ªSÙK\Zã¨éÅo²dp0EE$`®ßç@ò‡…v9ëJª¾qÄ›{ã±­³nI*3ôª“éêÁ¶§b€2äDK\"¶>Ô®Vl:ùëëV¼‰¢Lc*N0FiˆÖàlùC@#uÙ\'çƒ»Y—–Onw¯Í=GJß–-Å£pŸÊ£h¼£…åHå{\Z\0æ€îzpéœc·ZÔ»Ó\0&[r6÷3ÈúUòù}(˜?1éœÔ¤8ÈãTl;Ğ\'§§­4}¾´÷ÎqMÆzPsƒôíNØŠ@	©7=±@{òi1Ú¦X‰ ãœ÷õ·c€å@‚öçü(ÏCœUÑjz…9úTÉjÄô ázqüêAdã¥j-‘m>Æ¤[<\n\0Ê[sŒ*‘mM¦µ–Ï¶Î•2Y\rÙ\0ñ×Š\0Ç[FÈÀ4ñhzÇÒ¶ÒĞäp3Oû!Æ6Ê€9ö·8ÅW’:\nèf¶ }Ş}ª…Ä~‡\"€Õ\'#š½q	ã¡ª\'\0ö<ãfßïŞ•±f\0Á\\ç¾k&ß·&µíAÈãÒ€5­ñÓùÕÕz§#è*âôã¿µ\0?¿9OSAöúqNéÛô ×ŒÑÜhÇ·ãŠ´\0‚{R{úR’}óÚšIÿ\0\"€ÏµDÇéäãœTrg=?PL{df«IÜcš–Ry=}Àªr¿\'§OZ\0Vlr5n1P™qœ‡ƒL2œph&e=oÊ¨N89È«2ÉyÇVF$g½\0P‘:ÿ\0JnÀAS°ç$~éMÈş^”Ì  Æ9© Jñš\0uºüİ{ôÅjÚ®9ÉÖ¨[©ã<Ö¶7¾”~z´\'<æ«D#§N•k2Hï@ŒPãŒŞ†”PzPœ8ù~éüEBÙÏ\0Š•ÿ\0ı*&Æï\\zP\\ñÛÛåÎz~”ÖÏ\0vı)SØğG­\0L¸Ç{ÓÆzş•ã“øsš‘	dP£#§Ó‡=ÿ\0Jbœ6?*vIçÛŠ\0•GŒæšF=})PúÒ‘ÎA¨Fxü)Jœ}1OÇ·­9—ĞPJÆ?JxÈ<ÉíK3ÇçGÍ“íøP¹ÇJCÇQúRœÿ\0´Üqõ\0cvxı)0Äœ‘šQ€½rqG$Œö=(\0 íÔæÂ 8%AÒšp\0Á\0“Ôö¨îe†\0É½Ûğâ€\"¹•ó·nçãÑE\",qò7ÏèÃ;ªº;¶BÉÜ¿ZthæBe‘]Î2[µ\0XûKÌê[GLáJÅ3ÁÏG¨e*§ämßN•H¦qîzPô*ÇíœR‡MÄ:ã¥QFê@ÇĞU”w`@#ÔPÈåŒüÄôõ§oÜ2ÌUQ’pªÜö5<r6¶:7\0øÊU‡^9n(‚¶Ğ§i#¨¨vœãËR;Õè#ÊòT@CÒ6¢c¿j¶–Ë€Bãñ¥·B~ë/=ªÚÇÆ	>ÛhÑ£\"s’§×š°\"ÚArûSaU÷·}jHğ¹Ú£Ğ\0°»KgÖ¦HÀƒM\r3ßOwt…\0Œs‚)ã§óö¦œuŠPFx €=ò)»y\'$æóíKøŠ\0râ”ğ3*,Œç½(“<\Z\0‘Òšs{Rnæ—$\Z\0UP;RìñH	èzSÁï@pµ^k(NPê*èÇ_zLdâ€2Zİ–<?8è}*³ÆWå=ÇÊÕºS+ŒUy­Ã/¦(…‰¶È“¡µA¦Ç¿|\'ånW=êÍÅ©ó\nƒõ<.$bn½¨hY\0Ó\Z,öúŒVä¶Û†Y0CëQ‹<€½\0b›|Ÿ¥7È 8½-ˆB xÉÍAö\\q·ò ¥°8íØUˆíH8#ô­µ U¨í€ã\0QÏ=³ÍXK!“òş•§¿==ªÒÀè?\Z\0ÊKLAôéS-  Õ¦°Jw”3Óš\0Îû\'·NÔñl·áZ,uéJĞĞnAcÒ¤[|@ééVÂ€{})Bñè(¸„Ş”Ä:ã·z°F})b€(ËÚp+6ê1´úÖÌ½+.ï·^ÔÎ^©ãµ•ü_Öµµ	9\0\nÉß@­øíÛšÙ´#Ò±àë[¹À4«\0uúUÅû£­S…¹ëÎ}*Òœu #¡¼qßğ¦“ÓÖøö tü(Æ1IÛ?¥.>¸ äóÏ©¸ÁëÀ¥üy¤éÏò #µ^N:\n±ÔUis†àöNf±Î1Ö³î$Á#UÉÁÇ•—r1@4ıFG_J‹Í9#8Í0îÜzõéFÆ#îĞ\0òHíQ±$‘Ò¤påOò_µ\0VÚHä~£Ë=º}*ßß¯jp¶lP/+óúT‹	=[¬Ø§-¡“Çò à„Œg£n˜#Œ{Tq[àO<\Z»X^œĞ‘¯\0?\Z°@Ç)¨sŠyàñÆ(3ÇqAÆÜÒ‘‰üª68á@|ä§õéP¶<şµ3ç®O\"¡lú‘Š\0…±»ƒŞœ½°¥!vG4õÎIÔ\0ñõÅH¸¯ãH¨Jçi@?^hEëÁàúÒ©¤r>‚œ3Œ{t 	W¼SÂó’\rFœ®{TŠ{’Fyìh@Á<ú\ZvĞW×±Å(ÎîşØ§àc¸ãPzõcŸÆNİŸğ¤Çlš\0fŞ€aŠL^©äã×ê\r0“ƒÔq@~bsõ§cop\r4p…ºãÖ£{»HÛ·1P\'`Ír3œ õ5òIq19äçs0)·K4ø\'Èè*Åºûª:ûĞğÉ\r´9Æ}-UÚó$„@¼çh9Å!§“,p:u$g€ôŞGn(ˆgvêÀzÒ­G¿Ş~=y¡f’C€¥8@\"£gçfo¡Í\0H‘¶ßõ¸?J°°3`lç#\nÇ6ÂçêÕ0†FC\\7J\0°–¦3ó«sÏ^µcb…-Œv5M#p~bÜt\0Õ˜N{â€-BB.ĞÕÛx›#ä${Õx#\\gœUØƒ¨ãœĞ¸ãDÏ#=¹«	€8Æ*œdã$ç*xä®(Òî\'1Ng9aÅU2€3Ó4™Ür{š\0¶$=zÒ‡$pzÕPáHçğÍ8Jc§¥\0[İØƒG™“óc\"ª‰	ç¶)ËÏWü(ÈlŒƒNx¨ííN1Ö€&İÇ4˜ºS~T¡\'€8¥0pi‡Š=?*\0z·^iÁ­B¥y9ÆiÙÚ€&\rŠpnxëP†ã4äoÃÖ€\'íĞSXdi»±ïNœPD¬€Ó¡ô¬û‹V@²F8µ_”<sÚ›ŒŸ¨ \nC.\nŒ0ì1J±¸TäsÖ¬É\0xÇ ôÍG‹Ñ²NE\05à\rÈ{Ô&%jóm*2½ùéMeGá@#N2*Xâ\0ı*@¤gŞœ¸Ï·Z\0’8Æ98Q€)‘ã×ó©A ·j\\c¥&Fi{çúĞŒt¤ühã4J\0Lã·éK×¿ëGCÉéF0F(\0íïMr>´¬{àõÅE#`ôí@JÜuè+&öN¼ÕéŸ\0Ä\ZÇ¼“\ny ‹æÜIòk,»üñWnä98ª#¨æ€.Ûà½+^×ê*Ç†z•«lø9ş”«ëŠ²¬2;˜ªÈÆx÷«A×\'ó a»ö©œUEn™©£lúĞàäœt¥ã®)1ÀÆzÑú}h\0Ïn´€ú\Z_SÔ™õ #½Bàã0Àè+úĞ|ÑñÅPšß=ó‘Ú¶™OåU¤y(ì¿7ÔÓ…®{V™„ƒÓ#Ò—Éñü¨=m± ~Tán1¿QZV)|³ƒÛ½\0Q[uÎ©‚®ğ)Á\04GÈéÇZw’q*á@})6ÛÚ€+ˆ@9#š‘·5)ÀÇ&=h\0^Nÿ\0•@Ï¥7 r1Ÿjc>=µ\0ŸÊ«ÈÇ½iîãvz¯,£8ä\n\0â_ñÛ5zb¤lãĞúb£ş#œPaNyôéRF0@1Å&>b¯µH£Áö òƒIùñíJ}Iı)™#zú\n\0xí¹§‚00¨” ä”õ÷î9 	“§Bp=*Eã¯¯_zˆgÎ—v\0ç¿ç@®ÜT™p;‘UÔóœv©F}qj\0vxÎ*6ç·zyrGáLby<g4\0ËÓ¦iŒ=G·¥;Ó¨¦œv ä &OLf³ïfó\\lûŠpƒÔÕ›Æ;cï?·j¡9İ/–­÷x=è©,9Ær}êÀP©÷Y˜ö¨©„qÙÄoÍ!è‹´ÆšNYœ)é…ê\Z\0UµaÏ’½vƒ“Š™m­ãùÃnÇ÷ª˜™‘Hİ§za¸ebæ€/cİò\'ààTÑîn0øª#åÙ¥Y¤NTcùĞ¬q€rÍ“ß§Iv®Üñƒ¡¬´–b~fm¸ïÅ\\…€FİÉŒúĞ†d,»[¸©á1‰6‚Ç#ğªĞÊs³åÎ;.jÕ¹\\}ÿ\0ä(B\rÇQœÕåÊõ÷ÅT·TûÁ¸«\r½Hõ\0ö—\0…Á¡eÛôªo&ÒBıi7{â€/£ƒÉ`*o0g±Çµg,¹$\0úÔ¢^6³¿\0Z-Îp3)7\0@aµ¶Ş€{ši˜t\'t€.‡rF(‘AÏaTC¿ïã¦)Ânpr9ï@\Z\"AëÅ.ñ»Ú©$Ü€jeô € óNßëÀõªË!$`ö§+6¥\0Y\r¼S¿\Zƒ9zÓ“åœĞ¸^Â—ß8¦)ôåéíë@\n¥àŒÒ‡­;¨÷ õ¥$JŒRço@}èn¼JÃ=)ŠHéÖœ½\0&9ÅG,{†Tâ¥éõ£¥\0RŒ²eXçN•($1Nš\rãzrGQPüËÇ=hç94¡¶ŒúÓKqî:ñJ¸g­\0XŒæ¥íPÆN8şU 8éÅ\0?8ü(üi£¦/ ÷£¶1I03ô¤Ï  }(\'<v¦çß…°8 ºãúUy(©YªœïıGj\0§u\'•…}?¦1Wï¦Â’X‚{\Zç®åf8İÒ€ šMÌ~¾µcwNi§9î>”‘»¨#é@\"8À­8ãµfB:tAWíóşE\0hFütÇz²§½U9íì*ÂƒØ`Ğ¤n3}}*Ôg¦*Œc‘Ÿ§j2\0@§ëÒ‚G^i†zÒ¿N(ùºP8íÍD_Ö€à úĞùç¦{POëQ¼Òùƒ=ÿ\0*\0“Ûò¨ÊƒHdÔÆ—´\0¥\0ç8çÖŒİ\rDfàó€OJgš=O9ÇéÓÒ°íÎ:UC?Î1Lyøõ ¡–ÈCƒõª^NI&‚Í»ïÅ\0[iG\'Ûó¦F3j™™W«’qÆ*&¹ì1Ş€/GAŒ÷íM3AşuA®2zô5Ÿ© \rŸŠŒÌ:tª-1=	Ç½DÓß8 ï1Çävª“M™ªí.xŒXpO\"€1›Â~ô÷éÓŞ˜?OJ\0P¼€1R(ùF1üé¨¾½*UÉô\0Œ>CÓ‘UX€Ç§^ıªÌ™‘•Uÿ\0¯­\0=ptÏLúT‹qP©=¿ŸJzóÛñ€\'Œ{Ó—¯#Ş˜÷Î)ê;y 	c°9?J°ª02\0Z%®Fœ9â€ hÇ`j6Éí{ÕÃÊFJ†E+øPS×ŸÇ¥4ğ3Û®\r8ÎCUï$ÀÄHãš\0ªårXaFÕÎzÔª‘ïL3u¦]?ú»xı2ŞôÛ¹´ã¥\0LdPÛæåNyİ‚1¤ãš†5’Oó³‘š°‹)¸®é¼ĞaXQÒ…C…\0ß<ÓUrIã¢)70Î8 	“`ÉoÖ§ÁÀU}sU’=Ä£8$Õ˜°FÔ¼rzPê[<\"ò;š°±;\0[1QÁQ€òqèÕf\'BÙÁêM\0Kş1W¡ØoËÓ±¨-äPÜÆ¼zš·Fâ‹ŸJ\0™\\€6vL¤·ß`qØÕ<ä|ƒo¶jBäğN\0I8Çyõ¨w*œdâ—Ïd+Ÿ@j&vaÀÒ€&Vã öæ¤elû÷ªJÍ»µ(|Œw ¹\\ã=OQHJd8ê4‘‡Ë·<Ó†À28&€<³	R±ç\'¹¨KÙ·QNs…ÀúĞªÄW·½L§;—§­VİOÒŸ‚˜Áq¸oÆ¦VÏ×ëÖ©+mêN{Õ¥o”ŒĞ„cÓéêOª²?LÄÔª}xô 	ÃséRŒã\" VÎj@@\'#·¤0F(à(\0 ©4şõÏqÅ\0?zSÇ\ZzóOŠ\0v9À£Š@izĞ\08<UyáÁóTàw`ã?# õ€)$ÜÊP)Q@ô—+äå…nsQ¡êyÅ\0]CÏıÜtªèp:Ò—ã­\0NzÒîëÓŠ©çÀ4á/½\0YÜ)\\Us.Of}hÁ|8¦3ñÖ¡ŞsÖ‚Ø<çë@gÁõªW2\r¼ûÔÒ?õJå¾R9éÚ€2oŸ‚\0‰6	5©|O$Õ+{ç@6ã×­uööÍ4ıìz\Z’,nöé@-ÇÇjÒ†<7¶*…ºò+R€ò}èÌIƒÛŠ˜(=³úScÆz­8½ñ@^1Ú¦Gëò‘J­æĞ)\Z`::\0»¿zv¦FyÅPkzã½DÓ6HÍ\0h™€9`ÒyÀr1Y†cõâšeàœ‘ëš\0Õóºs}i¿h\nzŠÎó~lg¿J<Ö~ƒŠ\0Ğ7#Û×­DnÎ©ù¥3~:ñ@\Zãœf¢i½ğ\rW$£½7æÇ\\}y 	ŒÀ÷¦ùÜúã¥Cƒ€1Ú‚8÷ 	¸<zö4†GcËdg¹¦„ã‘Ğö4¡F3ƒï@XIÉ¤fÏŒõ\"Æ:‘Ó¥&Îø\"€!f!zRg¡ªc¨ãŞ›å€~Ğ$exÀühÛ‘œvëSˆ¸ç”ñB\0S+Éõ¤xÈ^_­_òqHĞü½ U‡SŠ9Ç¡§6@çSW9è(E1R(Ç£jjyíSğ3úPR?­TnıqÈ«òŒ)ªŒƒæ8Ç\\P(çƒNëØgšhääcò§¨à¨@8æ¬D™Ç¹…B£×Š·\ndô•\0Y·„gŒsíZÄJ‚ÜgÅ]QÁJ\0¯\"ü¹Á¨Î\0SùV„ØÇ@+>àq~´SÓ8<U+Ü96ÉĞUÃÉ¬ÛæØœáWÚ€(Ë([ƒ.1‘ı*.d“-÷²	õ&•Æ%Aã¦*hÏÙãÜt‡ 4\0’	6(\\~uY±ÖBJ”Årç,Dkúša‚8Ô%<úŒçğ –8ùIç*DCÿ\0-ç¾O&£,¨§~¸ÏéN.Ùwj\0¶˜\0/+Â¦Lcj©¬M@‡ ƒéÍM	ÜÙ~F(p„£Ÿz·®r­ê3š¬ÒHP÷ÉäÔ‘aTgß(Ôl~ózqŠ±2œã¸ÍVT\0ÌHöíV@1†%½Æh]Ù^0}y¤ŞAàS%r@Ã(°ëMt<|PÀ’Àyõ5 \0­‘úUS ?wœ\ZUbB’qÁ 	½‰æ¥‰†3“{Õlã¹4ìrhò¿\0dóÆ)RLq‘õÅVVØ@\'58cŒ½\0<ÈØàNW8Æ}*»n ô§ n2qô K·®{Ñ¼+.OJˆ(\'Şœ¨1Œúš\0²’)ÈÈõéÒ¦WPÄ’qÖªFBœm\0j±üÜœŠ\0”ºçŸJš9WĞçÅBv’Tjx&2 	Ãí^9©NyV›Î;wÅHOhen;ƒÒœÈ5ã€8õnã€’)ÿ\0ëÓ·Œõ¨Ğã=1NÊŸáŞ€Ïõ>•@:>9éšp\\ÿ\0úæ€\'È¥EµˆÂ¸Ï½ÙGÌ‡ê(làzÒœ\ZbH|½iß…\02XÄ±#‘ĞÕ\0éÀHê{Ö—Ğâ²õ[`²¤è\0pİ†ht`FAİïMrs‘ÓŞ£·5eÜÇ ÍHFGn=è?âæœ·JR>”ğ˜ ‚K`f´ö<Ò…î´ğ\04\0À¸lÒ²Š“ÛŠ1¦€+H?Î*ÂHúV›©#¥Q¸ÈÏ8 á€yæ±\'ëïµ½~yŠÃ¸SßJ\0¯øcµK_j‡qÓğ©bûÀgô \r+~ØëŠÑ„ƒŒzVu¿Aî*ì}Q@QÆ=úR4€Ø#¢R>áùw\0<¤œuÏ¥4ÈqÔàzÔXlG?J!ÿ\0ëPœsŠLÇÖ¥’	ê*QnÈ \nd¹öíI´ƒÒ¯}œƒô¥[^Æ€*ÁõÅ8.}x5pZn)ën=>”D!8ÎIö¥òÏLqÍ_òG`?\n<‘p(•Î1iŞA\'Ò¯,c#¦}iŞXéÆE\0gyÃÚœ cªÿ\0•€0?\ZŒ PU·wü©ëäg8ïŠœã·\'<Ówõ…\0F\"ÅXŸ‘Ø¦ùr8ö 1ƒÓzS]8¥.Gï)¾aÉÁhÈŸNiêƒ=óùÔBC_Â²3\0I°yÆQ·/™“Ô\0CMy0¹îzPÃ_zEô©$Ã½0­ŒàĞÈ3ÆzÔê9Ç½W\\)ƒÖ¥^Ç#¥\0:OºNzU9†Xú*¸ÿ\0s¯jªÿ\0{=h5_§^)À}1ŒRÇ\\s@üv 	ôÏêä¹Ú©Äz’qW 9Ï~ÜcƒÒ­¨;3ÆN*¬@Æ*ÎT.zPB’AØVtä0í×š½pÜx¬ÙØFs“@7LôíÏzÊ¿;F	lšÓ\'œ{ñÚ²¯\07,¬xŸ\0Vdß xs\Z–Y’õ``œO?€¤HŒ›É õô¦\\}›Bnpr\\”K,¬1#\'œçJO$šví¤\0ŞÇhÅ4Ï©>ƒ4\0åÛ÷C×œT±Œ}ÕÏ©5\Z¡ÆXá±Ôæ§I‚¡FG­\0H£\r¸\rÄÕ6Aã¿µB¸~0IïÒ§ˆ¼9Î;Ğğ®zòj´$^Š¤ûÒ©P?º:äš\Zã‚œzô ,ß6Kìç§zT òMRE,ã\nÇ\'½Y\\œ\r¸úw >fÜ†8ñ <nÍD;8÷4õòv¯p(ubFÜ½irFZ…\0à`qéO™Ï­\0H[\0òÓ”äg8Zc1\'xæ‘[¨Î1úPØöú\nš<pyj¬mòdçëSG îzæ€&\0z‚ïÚ€{ŠMÜçŸ §) ä+PÔç§­H|Œ÷¦.çã`¦DòğzPJÄôëOˆ²ä+q×ñ©pI9Œò9æFáğ™4\0æ]î	$şµ(81ö¦ìu¨ëÆ\rH‰&Gz\0”“ŸÂ\0üh!ÿ\0º:zÒ•|ŒdPÁ8À4gœñB¡½7Ëlñ&I 	u§Û?…DLôÈèc <&hRvŸ)?\Z‡yçSR3‘Š\0²\0g¥<8‚GáUwE<åZ\0Ÿåcè}jEc÷OåUÃg‘Æ)Êw¤çŞ€\'9QQË–\'Œõ#ŒúÒä©ÃrF ğO4™+ÃIsÔ\Z˜2÷£P%GU]Ô“Œ\Z¬ÒÇÛš\0·¾Âœ`U?0ã=)şyO4o¶CK’:ÕA?~:QqÚ€-çÖŒ÷ÍVûG§ã@˜Ií@³€äŠ¥pF8ã9©Z@r=ê´¬<úĞUØÂó‘X·Éô#­nİ(ÁéŠÈ¹IÏ9ı(9—\rRB9ÅÉü*tJ8ì(õºã¥_Œv ­R€`8ÇJ¿è0N=hd8ãï\'-Ïj– =:Tê‹Ç\\š\0¨–ÙÎyö«Il½vjxâ\0qVR>ıó@VÜg…íR8àVÕ\0íõ§m\0@şÏŒãëG’QúUÂ ÿ\0JLqŠ\0«åñı(1á…Y mì)„b€+\0NiŒ\0T¯ß<Ú«Èpİq@.1Øâ—8#ùT`äÓ‰à\0˜ê¼ŒGJ™ò;U– Ÿ¯\0×˜v8¨Zq»;¹íŠ©<¤½Æ«™rÜÖ€4|şÒ=ñA˜ç¯E[9ç­Hzu?\0Xó‡=ñMóş\Zœõç¥;#v:@LS•º’1ô¨Àš	<c6î)xä€jfìp29¨e|ß¨ë@®xÉÅ4{ÊœÇë‘ïHäN(S¯½L¼>¦˜«È?…=}9\0FO¨yÎy©›<óLÀéÓŸZ\0Œİy£cÚÁëš\0Èã<Ğãê\0ïúUèˆ•M8=;U”aÛ4~&\0Z›ÌÀõ©¤Ÿ/éJdùsÇ?¥\0,Î=óŞ¨JÄ±ÿ\0\ZšWª¬sÆ:İh¹\0n+v2]Häçü+g‚î;f±°KÌPrx É5¼vëRÎ#¥Qw±\0>™«apä/¯VëH-ãŒbg%‡LqÍ\0T\0»\0\0ñÒœql`TîT‘·Ï8¨½‡9öé@\0fÇ‘Îj@G;¾è¨ÀÀ\'%¸íßÚœ\0Qœ6Àõ 	•ñÀ8PxŒÓÕËr[úT\nÜ·ÿ\0ª¸³u#ôÀö 	·p$TŠ@ÎO5[x\0¯~§ÖŸ:dœÆ€-‡\'±ü8§‘·cÖ™ÁêTÕ29É¸ +à`7µMÌp¸$şTÔÆÑ½=ÁÍ><Ç4 p	Ç¦*EÀÀ·>ÔĞ äb•pô\0ğp{Rddí<f›¸`?$ñÓ‘@)9<f¬)Àõ?Z¯ÁéƒïS!9ê #¯éR¨=3øUhøZ™_œtühÂ+qß­YE?/={UDtÈô:HJ:zP¨Æ“S¢‚1ÍUI3×\"¦G9Î€%òÎWüjP¸P;R\'Ì¸+Ó¸4äbäPÀ r)ÛG +®1Ğ÷§‚¤qŠ\0Œ.AÇ¥(PF;Ô .1š6€z}(\rŒN\\Ô˜?…#¥\0òpTšnÔÂ´£†MÃ|İè$\'ºãÒ—Êq÷X­8`OJvéÍ\0F2¤n]¾âŸÆí½Ob)êxÁúĞb²‡Æ€Ik)A*vìhÏb0@ïGPU‡n‚€q›nè8oá>†²pÄeâ¶”lGcYweã¼ /š\0ˆö(lŒNµ;\'nÔÒŸ.zP|c¯‘Iı*_-ºHS¨,°Î\r9Nî3ÏÖ˜üiQNr\0!b9Á¨¥cĞu«rÇ9â£–1ÉÆ\r\0fÜ¶G§ÖMÎrx­™Ô5t99\0Š\0ªF­:!ówæ½øÅI2>”rÜc•~8Áÿ\0õÖ|\'ÿ\0×W¡|Ôõ \rFOáVPqÓš©3ÔU´=:ñï@Æ°::T1äqøTË@àJoj` qN<Ğc‚•#ğ:SO¥5½(¬1ĞğzÓ?¥<ã®iÓüM\0Waò‘UÙxã·¥Yl@ÀôéøĞ\0uã­=pŞ¹9§`ã=h’Œ1Ş³®›nsÆ+JAòg«*ô‘(\"åÆì1Û5L±-ÇCS]1Gáš¬œ¶;zç¥\0Z€GoÊ¯ÇÉÅV¶^h¢Â€#XÇ¦=©›ïV[¯*>†€\"ÃõÅ&Ö\'­Ly<u÷4şs@0 {\Z¯.à1W†1QN£v€0ùàöö¡TîÇ~)z÷4õ€{vÍ\0\0Ç”§Ó={Q¸víFá?J\0B\0šk`“pEÙ¿^´…³Ÿÿ\0U\0&@&—§¨ô¤\r&ìôü¨EÀ9Ï×=ê@Ã¡ëš­¸çiÁñÓÖ€.=9¦´çûÜc¸ª›ÛOZL’H+¹ œã×ôÂsÇ÷¦–#¯ZnyëĞĞÊíUÈ;¿LUXäŠŞ?ï9É\"¦˜\\· ‘œqUd-¤ UÎNF	 e¹¸b6(£°â¢ŞyÏÎsÔô‰ ”@@î{šä,2JŸ â€/Œì)¬yÏĞqúÒn8ù@ç¦ZbåŸøHœŠ\0UÜyfí“OU<ÜĞbîb80:Ó²œĞŸãÂç§Zœ§j`ÎF:1íOPİOä@\0 H<‚@§H1? È9Èæ¤—8#>”\"œñÍK¨W*¼væ§ŒàÒ€&^‡“z‘	İŒô¨—†ã’zÔ c9Á#¦\r\0L‡‘··áR×9#¥CYzôÈúT€s“‘éí@tëÏéJ¸î¼ñMW äÙâÍœĞÔãT€îÆ\rE·+Ç ÔñƒFÜ{P¨/52FOçQ <œvúSƒ€ÜĞ”Xó€3ƒÅXm\0‘Æ*ª¶ÑısR#÷$cÒ€\'PØ<š‘2§¹÷U&!¸8÷§Çœš\0ÒÊœƒøTÅğU³€zŠÎŠB	Éç°«+ eÁ<Ğä‘H9©HÆjÎŠNqSy cë@Ô¯R1OI$gÖ¨¬¾™ëÍL¯{P’§Ó@Ç¡dÇZvF{Ğvã½‡ÒŸ…ô¦ãŠ\0Mª4å?Z0¸ô§\0aI íNàu£qŸÌRÁ°FGµ\0)‡5*AlãÖ¤=3Aô c¡Îj½Ê†t$dt5`ñœ`cµE?İ=¨ñHWÔ‘Å&€‚O¨+Ş—8=1FE\07f@(	ß)àñO\0İ¨2¼ô5‹ÿ\0Z¸İ8^n‡¯½\0e](äœ~Uw…Î;VÕÙàßÖ±.	ã  \nËÁéÆjD>¿•D‡ÇZ‘XÅ\0XSÆ8Î3SÇ&Ö×ŒUPÇ¹éí@|0Æx \r«y¦3Wâ`Ä\0ÄjÄ†BZvÍœŒPœ|àæ¥Î8Ïj¯	ïRƒ…ê2(@üàgŠvîs“Ï\\¶OÎ4\n\0°[ëFOrj¿šóÓï3¸íí@gŠB;~U“óüé˜\'ùĞ\0ËéQº`ÿ\0õéåÇj›®sÅ\0.ŞŞ´â Õ™Î2zÒ	ĞM\0,§ãŒqYW€sÇ^õvi@^ı+.òA‚(ïå<UDŸ¿¶{T×R\rÙõ8ª	\'Í@v¬1×ŸCZq·Œô¬+i@ÇùÅjA0Ú>Ÿ•\0[aÇãQœc†PsŒõ¦—·ë@ç\"šG ü¸¦\0èqÒ ÆsÒ€>\\ƒ¿SL”½zP_Ÿ¥FòÎá×·z\0ÃÜ?J#§oÆ¡ó\\ıh´g=è|äú\ninÙìwÅ4É€9ç½(|ğ>”›‡©üªüzz7ğyü\0Nzzæ“vN\0#5luõ¤Ü0;{På°>Ô¥øÿ\0ëU}Øõú\nuÁ=h]ÙÆ8Éï@ƒœT9ô4™8 	‹ç¹Çjàœr=Å@O¹éKÏ¿\0û‰ÆxÀ ô™nè¥œ.á÷{ÕéS|lmõ$Qe\ZA(or>ù(œ°H’\nã¹¨Èø²zqW.™å“ç|âªÊ¿9P;úb€¡¸§òüiTc–n1ØĞsøu§ª`G¡\0v •fäqŠCòt\'¯­K‚2@Çÿ\0ª”ïØhÈ¡O\'$qÇó¥Î°ä})zaW8=è?ßÒ€AÇÒ¤	ÇcÅ4gÔÔ˜ä‘‘î(Ê2qR\0F0>õ\Zü½:gjy8^£0$à¾ÔşU°ÀPn9ëÓô§†=A\'¨ta’ÔˆÀc+Á•WvxÏãèiÛ·~\\s@²7`qøT€tç<ñT÷²ƒŒı{Ñö‡xíÇ¥\0irÇjîvŒñÚ³ã*1&Ó•UîyÃç¾hJMAXqÜt¦ÿ\0hg…È=³Ş³Äó’Hæ˜òtàĞĞ½$Hæ¥P#¶­`¤ü~&\\ Hõí@(Ô9ÁÅYKáµryšåVrz·8ã5(¹#¿=3Ö€:ñ0Â¸lŒóVUé\\„w¬.Ojô\Z¯=y¨¥Yùà`zÓÒrb-ò¸ÜIÍYK•ê(efAëS¤¹9$cÔÖ$s^ù«QÎÀ÷À®®GÊ¤YrØôõš“|¹¥I±ÎI9 \r0zô§nã éTÃàà\ZPã=y EéCğ:ÕO4c©Ålt\'{óO3ÅPwíëO€F	Í\0]Ü¨úqAÏnE@²Üjul®G4\0„€şªòŒ&;VHÍC ãó \n’A¨óÀÆ*²²«¶(scSîóŠ\0_¥ ëÒšÒHdÇ#Ô ÿ\0<SÁ\0ã8ÇåPèYG~”`ıÜ{ÕyˆÁÒ†›ÀúUydàşTJô½qô¬+¶ûÜş•­u(ÛÔŠÃ¾p¾XqÔ\Z8}}*UmÇ<õôª!ñ’G|f§…#8ë@ÇÓó§9úSõ\"®9È 0uïŒÖ©<g¯ZÍ…x\0ã®+FÜtàı(R6èçSoõª±?=È§8 äãŸåUÚ`:ŸåM™ÈSëY·àú\Z\0ÑûHN3J.€ÎIö¬®˜ßÊ 7œŒŒp9 ˜]Œäš>Ô9û×2/_¯JzŞûş½(£ûH#¯QQ›•ëkêôìj6Ô8 ± ƒí c“Á¦¾Û°kŸ7ù$nıj¿ï¾€7¦¹%H@$\nÎ¹Ÿz÷ Vk_àrÇÍW–ë=ûPî$ñèzŠ¤ïÈõü©²K–À?­CüT¡ØêHÀÇJ½\rÉ^IÏáXBO|T«p@á¨¡[¿›©ôô}¯Ó¥a‹q¸ÿ\0…qïĞõö \rÃu×\'ßš_´óß§JÃYÏóïKö‚W\'\'´npsùTRÏÆA5˜n9ä‘9¨ÍÁè[Ö€øëÎ:qÒ“xéùqQäõ\"?\0?wlş”Òàu<})¤õïëMÇ¶8ö ïÇøbŒõı8¦ôâ¤\0g×P\0	è>”sÔœqiê¹ßŞ—h\0˜ëÒ€Î3ÏåFÜp9ô§mÀ<cñ¥úœĞBóøúv§ç9éÏJ‘G<õ Cè1@ìuè=)Â. *8Ë0UcŒVì^¸òD×—Û©äêh˜™BÇÜãéR*ˆP `ì\0,o­lj~”B^Êæ+œã85€VKtò]H$’ä÷4\0¯q¡wc¸ó…VI8m«N3Sy3NËj°çÊ­]è÷Ö1©šÒHÕú3ğ\r\0d¯^r}8¤$¿>`AŸ¼E,¥S£çœt ùˆŒã8èq@„v[o0:FM=bÓ÷–şÒ ôæ3Š£!ÃÁP3­4ã¯q@	mdÿ\0ó‹êE=,-ËauKB}I¬R¡S€	=ü(E%¸ƒëƒŠ\0ß]$°Ìw–‡?í÷©±nóµ\Zÿ\0uÅs›@ÇÊ=zZ‘F	Á#èhtéWÊr!<zj&²¼&	2}JÌI¥Uù.&8“Šzj7Ñ¶òo˜\Z\0½ö[”Á0¾}1N0J§æ‰ş›j˜Öõ0¹ûK“‡i©ã×uMßëÇª© ÑŒâ›¿äqJ^¹l‰¡…ùÇ@8¨N¡nè¾d	ë´ö 	Z` çåëš¬ós´qÛ5f9ôÙ8bSëRÒØö•Îh4¹8ÚAÇÒ“Ì8à“ÇLt­#ia\'r:÷.›Ÿİİ\'æ(;xÁÆ}ÁŒ`1Ï@+Hé@ÄˆE5ô›Œ’@&€3ÎÜòzc·¥&à8%ä~}´Ë…1÷õ¨Ê@9Œ€?!@Ãã’O¯èŞ;1ë×¯§cÓ<HTäç¸àP‹)é’A<S„ \rCŒ1éÚ—ÔŸ…\0\\ä¨ûØ­(n¸ šÄSÛ¯¶Fjtb¹>¨¢·¹9äç¥^Šãê=k‚c»¯9üªü†`3œhv\'ùy=ªXfÉşµ¹ÏëS£`}ï¥\0h‰¸ëÎqJ%Ú8\'>µQ[\01èiÁğ:şf€,ùãq§‰\0ù@êk5¥Á8=( ‚?:\0Ó2`ı)ë*†<*È{°§Ç>´-ğÛÉéé@ñÈã5:KÉ<V\Z]‡PCŞ¦]@)ÃqÇ\\Ğôn¯=)d\\ò+uî¾¦­Å~¬xlúJ\0¡|şUÑâœÓduéÚ«ëò°häCÎ9ÅgµáäóÛ½\0j™À±Q›ßœ~•÷ Éàô¨^û±?Nhe®xÁ?QGÚ‡¯õ¬|¯Nõ¾÷LĞD×Cj¼·;‡ZÅûw<0iŸjİÎáõ€.]ÏÁÚ³.›s\0¥ˆjWŸ\nÅ@Ï½A,†GÜÄdzPëïëSÄzqúT8äqíSÅŒŒw ‰ı;\n·\n×‘U 1ÜsZ§\0ç@ELu«p!àâ›Œ!Vc^™44`tç^2­*Œı)Í¿á@g)ïÍd]½…mN¼tx£Ó×‘sp\' qéT^ìóÎ}x«WkŒãƒõ Á?ıj\0İş”ßµğJ€ã=±Ÿj3Àÿ\0ëP¾{½qM2“OÖ˜Hõ ã\0¥‰îGáMÏ¹Çò£Ï¿QG|ÿ\0…\0&N\'¦~”tõü©}±ÇáÅ!éĞt 9ÎrxíŠnĞœşTÿ\0aÔ{ĞG?Ÿ8ÇÌxqMó:á³íŠ‘†;şáO:b€e\'¿9Àâš²6rÄuã”Ü÷yä`ñ@è	 Œö(’zœQæ{ôëšb®O#·JE‘Í\0Byƒ,qOû8{Òy]‡\0ıØ8ü:ĞXcéÔ~´íÓ×µ\08¸$¿•7<~!ûÀôŠ\0ÇN”\"8©—Œà÷ëŠˆg$TÑ‘ëÔ\"x8:zDÓßÒ—#Z\0^”\0Aôç­;<’qÈô§)´\0õP1š•Wå’;qQ©*Uq‘øzP•”é¶Ï{(VD¤wõ¬«½bæîbóHÎK~Íbb^8T€¨ƒ=zšÏT/$uçúĞµ¦§*·G°©§1^@D£ƒÈãÏ«…l‚?\Z½\rÂ‘ òOµ\0M§–Ò5•§q,3šw‰¼@Ú•û3Ld0¨€|«ëÇsPÎûãÁ\0I5w×ÊåNxÇÒ€\"ÜÀ#¯¶iË‚Ã©Âú}}ê\0v¥Ï¥V^áëô 6>läñœgüšFäÛ?9¸8Î?­#¸óÔõä@\nÀe2pİ±Ó¥¤’pGì?JN3€GNÔå=	ldwn”\0ìa°IÈ<âAõãó¦’Ã×ƒK224\0¤à£=3ô¦|£9åùÒä9¦î€ÜÔ\0‡\0.;Tğ„ìol\nØíÎ@ÀõéÓô§+ín8 ™|Œƒ»Ú£* €ªqÜæœü0Ï¦9ÿ\0>õûùxí@QÈ\0öÀô««§€ïÃz\n§òŠ“98­!q\0–_§¥\0fH‚7ØØ7<{ıiI\n@N?ÏZtò,’³)IÆ}³KM\"ç·\\‘@I\"Y2¯|Tëwv€•¸”œÔÑÅ·qÍNÈHò{vÅ\0@š…ğ#÷¯Ç_–¥Wº‡ºûÖ–Ÿm÷²(\nN+voÚ:£dP(u…q‰­”ÓZæÆN±2öàVôş\Z‹ìûÕÀã<ŠÀ’ÅUˆÎÒ¿Z\0O\"ÖLùW\0Üâ™%„«’\0qá4Æ±7Êr­F\rÄ,6¹_¥\0++)!\0ô§©Á8#=ñN[âxš! õèiÀÁ!ùÆı 	¡lsÎ8­vùÊ³‚ãŒzõ«¶ê3‚y\'Ş€5\"lz³æ§Š£Ú;sVæÆqúĞ¨ï“aP;ŠÜgƒÅVW8íÆ*9Ï´\0³Ü€zç­T’÷¨qU®%ÚrN}+:Y‰à‡4¥%öNCq*¿lğx5šY±×=èWÀéß¯4´—ÿ\0/SÓµKı¢í’Kz\0`‰O¦iÂfÄ\n\0İûScïJ³k$[pø\'õ®v9Ø1×*Ú\\€WwP:t ¢kï´Ã‡BN:Ö%ÕàYJò\0¨¼ıË¹CtÁâªß²±Yòzà÷ 	^ôc­F×`Õ’ÜZFéŒäb€.5ÈÆrO¨¦4ç<“ÇµWéÔĞÆr½\0Kç€ŸBiVL6sPOÎ¤\02x ÉyÅ?õïQ¦1=jE‘ïé@\nš\0x+Û½BqŒzñÒ¥„`·\0iÛgê+Nàtç­f[c9«Z\09÷v%Æ1ØU˜†0@¨bÆz`}*Âqê=(U^jVp(8ü¨còäcÚ€+Nr+õONŸÒµæ#•“xp>^;æ€9ûÁ´{zV\\ƒ’z\ZÖ½#9¬©@ÉÁü(Ï¯­\'ó§0}é™Àş¹ üâ©¤İÏ$\n2XchIç9¤ÎN9ZF â¸?J\0q##Ÿ|Px¦çŒÇƒA c¶=(ıÏ>İ)xÎëLíŞßô\0Œ3“íÏGz˜q€)•j\0…€Ç hã>GN”¸ÃaO§nôœã¨ü(xS=p:c¥[ŠaŠŠùA#¥iÁÚ8çĞPG\0qÒösŒÂ´â„g§N”ó\0åÇç@®HÎ==é ÑÓ©<{ĞA\0€J\00{q“Ó&…Sß:T‘E¸òJµI€\0TÇ¸;TË‘Ğô«/n®Õ\0j¬À† ö<ĞóŒvíI¸÷ëÏìƒòéHXûcš\0ŸyõştíÇ==³Ur;zSƒóêx(Ú¿¹Áö§	¿½Tƒé@sÔ\0ëÆß;wù¨Ûîõç×“ŠYº‚qÏp:ÔrŸ“	 \\“ícOG 	÷¨ù9\'·?•)ùº£<ô K)ÚÀ‘Ó½ê¹AèsÓ\'šjåwúô×|3Ü\n\0¬c8£?Ö›åŸáÊƒéŸÒ§xnl/Q‘ĞSşRæ@ôÍ\0T`İ=1œş”,g\'h0zÕ™$öô¥ å›·A@$;†°àr*DµRA,*EPƒŒ{SãÈäãÛ­\01,ãÆA ı*AcrIëÈ©Õ€NqRŒ+cŠ\0¢ÖQ‚qÓ§$Ğ¶±îç½[#ûœc4ÁÆ=¹\0Pcnƒ•üj3\Zƒ§=*ã®8+ÓÚ¡uÇ={q@|µaqùıi\Zœ{ıŞÕdá3qô¨ÈÆŞ}ú\n\0“p21œÔŸl‘¸ÿ\0ëU–è~|céUÏR3Œ‘ïƒ@EË€8ç¸íÅ\\ÀP6ƒPB¿/<séœTÆ@ª9\0útö 	ãŒrsÎ*Ôl t°¬ö—û§­<	rOlc½\0j$Êƒ9ÏZÚ³×\"[&|¦¹8lgŒã8¢ÎêŠ2[°ï@úèš$EÊ…=k:YR`FF3Y÷´/å¸Úq’\rDd9Ê’1×èèw‰¸c·8êjÂ²H¼¨ÚzœU\'d$n7+RDû	‰ïŠ\0uÅš•\0g©ª/ˆxÇ½iÉ#œÎEC \r‘}\0â€ †áâe$g‚kVÊd”ŒN5‹\"mf ã= ¤Œ˜Èdr¿şº\0ë¡Ï@}J¸¨TœdV.›¨G*ä`²ÆqÍkùe—å#=è…ñsëÒ©İ>ĞOPåZ»#\n@Ïô¬mB`IP@õŸ,ŒÍß¿­A´³dju]ÍŒ€U‘m)\\²¤cÕJ\0¢Q‰ÎëBÂÜqßÔÕÒl¢ Kr\\1jO¶éÊ@KĞó@ÖÜÎ2\0¥kb•Ò§\Z†ŸÚ3N)ÿ\0Ú\Z~H) â€(*O4õVÚH9ö5tK¥Jy’HÉ=ÔÓÖÖÒ@7©ÏcÚ€*Á#ª`ıßn´ûşXbÒ8«i¥J¬YJH1ÕMR»TÂ¼lª8éŞ€*rzñÇz1ÍäsùS”`gß¥\07i~¼Ñ‚:”ğİ;oSÅ\0FîÆ9§¨<=©BŒğ8÷§ªö\0¨c?*”¡Õ:J?Ë çwãùÔĞŒsŒT#Ú§ƒŒqøP•¶p>•­n0F\rdZöè8ëZÖøÀÀé@\ZôÆ9ÍN¹5|EN‡½\0J?úô7áôÍ40Î~\\`@JN:Y™ç¨5«63øô¬‹¾şÔ‹yOJË“=yçµi]ãqÇ§¥gÈh¹RO´ydõ¥ÛÏ¯8¥Ûƒ×Š\0ƒË`:ö¦•#8ê:Õ¢§21œS\nÓğ \nø`ÜtíI´guü1Sç§JnŞ8ÓéŸÏŠN88÷©6}8Çj]¼g© ÀÀÉõ§c=0\0ã½;\0qÏ×½úôí@	‚:vô¨Ûîœ”ó€>”Ç<gŒv ˆã¨ëH9p1Ôú\ZR=ı3HsœäĞ…¹Ú\0Æ8éZ–Ä|£\0f±bn9öô­iGÓ¹8;÷©zvæ³àœ(\0\Zq¸ÿ\0hzĞ)‘·¯Òœ˜fÆ1Û¥GpA©¡ 0äı(Üj\05j8É\\QD\0<‚2}jÜXãŒg¯4\0±®ŞÇğíT¯P	¸^¦µG¯AÏ|TÏĞœdP8àõàS=êFÀçœtÍBs@öíKÆàã¥7\0	§íÈÈÎsë@’{Rq€qúSÂäœÑŒc ñ@Ç‚v·œT-—à¯8Éâ¤¸#\0Ó±ïQ/,8¿\0&2OÓ§AMfU7ºSöç€	\0ıi‡nĞ0pE\00œœäŒôÒşé\'¶FE$¬OÊIÆxè(ÈÁÁc“ÆO€P3Î\0íKäã# €aT–Âú\n’ 2$cq@`mÎ8S[\0ıŞzt©p=±¨Ø(	ãw Ïm¹ç©õÚÏAÍ4†€qİ†9>Ô0\0õ¥N¸|Ø«)Ï<ƒüXü}(è9×µ*ÈÇ?Ò…#p9\'=jDÆGNGq@˜›¼Ôfqµºút«¥AP0|Š\n»ıh)—\'¡üjQ…Aö­b\0şEV’!‡ë@Ø8ôª¸ç€œUö@Üs•{U\0 }j\0²£äñĞâ·×\'Ø\n“o\0’p:c°¤ÉÀë@}üœñÕg§ dÅFKrO©Àõ«qE×i&€)È\nóÈ& W(An9\'+Jhw§FZ¢Ñ2rCp3(®ï3‘Ï©$1ùŒüez”EK´¦ìZĞ‰ïí@Œ»_\0qœp;T€+ó‚qëüªà‚7/æ˜ïUÍ¹ÎB¶ßÊ€qÏ>ÔpHïô§İ±×z‘Øæ€!˜e3ÏåPdc‚Øš±/\0á¦jºÈÁüN\0 _³Õn-ø$ºŒp{VI\0tõ§çƒ´G(VMkÌ\'10ı®µ]¯’Vßu,j–}ø>ŸJ8ş.sé@ú~v¾Ê\0ÍBìò7Ìò1àrsÍ7o¢óÏãV¢U%yo  ‚ÄÈß9Û“Úµ`Ò,¼­ÒÊÙÏAŞ³™¥ãüéZá×ˆ÷ \rDÒ¬‚üç9ÅH|?fìV6`{V9’T%Ù˜¯JÛR–¹_v1€hKÍ\ZgØó2èJñUN’YKC*69éŠİ{ËmcMhdn•âªÙ\\3Z}£åş\"9 ³^Ûr ôÚiëªßÅÃ¾áé\"×Gia5Ô‘ÆGVÁè)u2$Ÿh·}§¡\0š\0çÆ¡e*ÿ\0¤ÙcÆèıjd‚Îà¢Ş.ãÑdàÔwº,¨­%¸|zb±Øm§xäş»%„ñ\rïF8+ÍC·ÛzÖu½íÕ¾<™¤Æìş•y5 ü]Û¬ƒ8Ü¼\Z\0~Üt8§*ƒ;f¥ìî1öi¶±ş	84<m\0ÊTh‹ŒrqÅ;8éĞQŒÁ¥=HÏ9 ãGASÂ0@éPgñÀÍX‡¨84£kÈc½jÛ••j:sZ°c ö€/Çô8ô©U¾^ù¨PñßŠx=2hmŞù¡›#qÖ¢ÜG\"€;v5“u‚N?kFR~ÿ\0f]sœ÷ k£ówÇz ÿ\0{¿µzç©‘Š¡&2zE\0*à1Å=TS^§ÔáIíÈ4\0İ¿Lõ4…	Îj`Ÿ.yü©\Z2ĞzPV@øSvsÒ¬²İZO,ç¾;Ğpİ¨ÙßŠ›Ê8é)Ldæ€+môôâ˜ÀœU¦ˆõéôˆ1È4\\?Z³’yö©dÈÏlUwÆä~=è¹:t¤ÜÏãÒœzñÇó£+‘ÉäĞñ>sÇaVc“Ş³óÓ·IéOYpqÎJ\0ÖYñÏê)>×ÏSÇ™ç‚~RG4¡aE\0\"ôÀÏÎ¦Œ\0ÃéQ <sõïS ç€GĞĞ…¸Î0ÃéW#FÀ5™2çÖ¬}¥öã8 ²Ê°Æp~b+.F,Äô¦BÄî9ö¦±9É#ñ ›<qúTD1Sã¨ÅGSÿ\0× A<{w§ôâ…\\:ß‡z\0hRHç¾)@ÏN;Špëïô4£ÓĞPyÑ™ÊŒr3LêzN*ÄƒçİÇ©¨]HSİsŠ\0…ˆäŒ€=¹5$ÃtüéYp}‰Éö˜1ÚA(3•ù›°â•Oî[§|iÒ&Õ<\rÜsIİ0Np9 ÇÔ€zûb¬GÉçšfÍO r;ÿ\0ŸZ’!‚yP›¸=x(nIäşâ2;r)mœ}8 Ü–<Òdãc!ç9ãœS@ç8÷ \\€x<Tª[ 8qÖ¢^9àc¥9HüÀ{Ğ¥ÎG\\JUÁ“Çjˆ€y#=ÍIqœà¤u4erÊûÕ*\'8œúT*rS9íVó…8Áæ€\"’ G¯jªğåsƒÎA­2‡aòúÓ;“Ò€0¦CqÚ³‘.rt­ë˜Hêèa²„™²q‚3@\Z@eAíÆx¦`ƒßiñd #ŞœP•çù\Z\0@¤ò>Â¡ĞåÚf\nœb¬FÙ8Çë@­ÜŠ¼¨o¨¥[È@ù¢ ûsIµXÏZCîÂƒƒìhÆæ!Ò÷Í1n1ÂcÚ¥.1Ïj<’\0Æ}¨¡Îrx=8ö—3Ó° Ã…Ï¦1G•€IÎ}èœë’J“ŸzŒ©\0‘ÈñÖ¬¼eXuªT(ÉÇ€)Ü«ÇãÅ@¸àœd{Så%˜Ï¡Ï-¤\r<ª¦rh[K.[<ãÅhÉ¢Î±– ükwG´D!}«¥Ò6B\04åw4Dïj±zûWuâ}Všù““\\I$tã9Í\0>Òå™rç·½[\"2Fx«:tJ¶Cƒ–ëƒÚ¬¥ª*à7_sÅ\0WeQÏaY²‘¼œ÷ô­—‰×ør;`V]ÄL®s	 É4OF‘”uoZ€åGpr;SŠsùÔ±Âdb8ù{úP.õ!£b¤Æ®YHû˜í\'9ü*W\0¯$ñô«kU,>\\u÷ Mw*;y1Ü)5Ûï#í³’?Ú& 2º»`Œ{RyÏÏAèq@›P¿qƒy9_LñT5ò‚`O1Sùòg*Àút¨æc%¼Û8úP`éÔà`ôëWàµËıã;9`Õ\rØ-œ/¯ÓqoG·p]ĞG3/\'íZÖÍ\'#³q¸¬¸ÁädòNk]x”\0ñÀÇãAÈíÆ€àqŠ1Æé@:ã‘Î8©áäŒÿ\0*ƒ63zUˆsÇ•\0iZöéÓšÕƒ‚²íò9­X@ô @ÛŠPyÈéH£Ÿ¥.8ïÀ w~˜¥-’qLÇ×¥rOÒ€\"—$g5sódŒVŒ§Ó}+:äpxÎ(\Zë“ô*©BXòjäàî>„S3œ‘@#Ø~µb8@\0üjx`ÉásWc¶Ï c(?Ë4yLN;Ö¨µçßŞ”[ô £	IäÜÖ¿Ù‰8ïéGÙHşŠ\0Éû9=¿Qä	§µkı˜ûæ”Ú;u 7„ôÚj”ñôûûWE5±ÉÈàwô¬»¨1ÔcÔƒ0ÁäàŠ¬ÙGáÒ´.®O<zUœb€!ç>œõÇJnã9{göœzS8İœç&€zƒÀà\ZùÆ?MàË×ªI?QŞ€“Ø¿=ñH[òëÒƒÈ<çñF¸<g·§Ö€-¯ºtíÍN‡Ûò¨…î8íR†Ç¯± 	Áì9õ¥Ï°éÎ)ÈïŞ…n~ƒµ\0IÓ²)­ĞŒP:u¤\'İ³@\r\'œS:§×u¦“Æ(ã¯#üÿ\0‘OqQçëø\nvxã¯ê(ùÈ?şªPHöÇéLİùåN$g9ôÇz\0“Ë\'~¤`øÔS®ÕÜ¸Éâ­¨<äxÅEwòÔÂ€2Ÿ<cN=)cP9e3ÀâÈsÏ#§NÔŒv®æéŒĞOŒã8íÚ§Š<GîzqQ(ÌİºsÇSVØ÷ê3Ô\n\0”àzzS£Æxô£p	ÇÒ•A‘Œš\0“)ÀéAä®q@ÇqJãÔ’h»FxÎ¥9<ò:Ñ°dc={ö¤\'¦	\0œ\n\0aëÑAút¥6\0E#gƒÀ>¾ôcÔ¯<ó@Æç³^:TªNÑÕ¥B§Üw§.0Nî~´r7ê;Ê¬BF1ï‘*ŒmÀíj8?‡J\0¿©\0Ê§Ùòà\n¥}7Vbc‘“@MWîôë›Ô`ò®q]f²u«=öÆDÁdöí@öxx1œàŒU´+Â{JË°—dØ=ÿ\0\"µşéÁèz`~”#ŒS…¹õÁ†¥ÎyüªUaşE\0Fa²L¶ä¼Ôèİ	ãŒÔ¢P¸à\n\0Eˆ\'ÌT\nI6(ásI$ä}2i¢6¼xúu ÌöÅ¡ˆ* ëR\"Å2œàçŞÔWÊ<VUóüÄŞõ¯4Ê‘œœps\\õÌl§ã§½\0GÍÂõ>•Ğh¶s(Üyâ²ì óy(<`WAlÛp1Š\0İ°|Àšè\"á}ëŸ±a¹Mt0ÙŸJ\0eÄbD*Ã*zŠò½FÔÚŞËÎ×­°kÎü_oåjbL:úPs*NpGaR«‘Ó|ÒÁ“j§ÛÒ•Tîà{P‹3trH¦ÈÌ‡=Å;h+ôÓÚ1ùPG¤	Ä©ÓÖ¶-4(Ò=ÒËq¯\'µ” =IÆ=*eƒ\'æİùĞ¨µ¼º˜ˆq®Ü÷±Qê(VÅOÌÍ}*ïÙ¿z w¶6A\0=‰ xÛL9x÷ ÚÊğŠ´²œ‘‘JsÖ€+­¬»°¤Oº±ÖÅ§”.Ù8d™O?ZÄW\0[[[dpóŠ\0Â\\€1€*ÌVnTµ:`i–©—,q…éÇJ¼_\0í8Çá@\r··XNíÙ>ı…Y*ÔånÄŠ\0˜8õ¥ÀÀ<cÕlİ)İ?LP\0@@Á5f\07˜ªã¹ô«väP•¨9õ©\0à`vïY–½=jAÀÇ^=(Òôsšv9¦®0)à1?Z\0fAcı{Òtü{ÓğwéCgız\0¯7LVuÇS‘+JaÁÏJÍ¸Ïü(*\\oü3K\0ğ1îi%$7¥\"?4§ÁúšĞ„ŸZË‚@:d{Ö„RĞô4h(ÿ\0úô Æ1QyÀRi|à3Í\0I€8\0PgµEçpzâ—Îé@Ç#ü(Ú;Cçp{Pgúÿ\0:\0lÊ;ğ\reİ¨Ç§Ö´&qÖ³/%q»v\0RGãƒY’gÓ5¡vÃ¦k9ÈÉÎ8ã¥\0BÀ8ÆF)‡vîp@ÏOJ{c\'ı©‡®Tşô\0˜q· ïĞRm9\'ä)Iö#ÆF:ÑÓ‚qş{P6NÏ^‡½&3ÎÓìqéKÇê98ÿ\0\nNzås×‘Ò€,¯tÀìjE=»Ú ä>´áÀ8Ç\Z\0²	İÖœ¼}=jê2	©ã?Q@cŒb—½ñH_ëN ûõÆ(&±ç4Ï^£ÔÔŒ>¸ÍF@îxÆy p9ã­;©ÀÈæš êivü½ù8Ğ³ØÏ%¿úå·Z‡œëš–Ğâa‘Ú€ß¿`H<äõ>ÕrHÌ±’¾•FòG¢œŒU˜¤-Á>ÔŸ,N$=çåQ°ùrÃµhF7É‡Î=êY­A¸œP+6áëÔÕ¥?/uÆ*¥ÀÚÄÔ‘1 qƒ¼P€ÛÀëOÛ´tã½65ßŒ‡µ?³ÓÖ€)\0ö>ôÖã ü©­ĞN1×Ş”9\'¸ \'ƒßhbyÇ\'š2?N‚áä5\04ƒøÒ`àãßJ §aëMÚÃ© #\'9ã=A§.TN\0?–x¥œŒõÒ( ½2hT\'’21ØTÈIlƒšªÅN‡a²:ñ@UÊşjÌr2zUŒ\'®*D$NhMrœãëA;ÁCƒ1UŠ·ÍœZ°§#©ö sS±6³—Pv1àÒ­X^¬€G)+†¶$ÎVG^™¬;İ&XO™+Ô(ê(SìçnQ²z_³r­cZêRÛ³´v­‹{ëYûmnQ@XJ¯\'àsR$óór8â­Ä\"Û•`IëÒ¬Æ¥S0}¨¢[ƒG¯57“‘ÉÇµJTíÈíHOb1îOJ\0¬Ñ•$Z¯$Pœ`\0jÜåTËœıÑX\ZŒ£$M(E\0â4<Ÿ­\0U¾¹31D?(œu¨­mZy0Tí©-¬ŞæN›Pvõ­Ø,Ä)…Åäª¨^‡·jwnëK\"ô¤6çé@/ŒWIhà¨$Œ{×-fN:}+O|œzĞ¨Çjãümn>Ï¸åZ» X^)ƒÎÒåÆr °ü(²¬² Ô™±ÇZg‡Ü;Inç¨â¥¸·h_qš\0i™ü©Ñ¶ãÈı)LñÏ_Ò¬,jËŒ¨\0L”Ê­ÛÂ‚r@¦EkÓiÍi[Ä8<Ät Š=ùÊö¬O«n‹œsœ×P±ydô®sÅÊ· ú\0s88éR\"° Zq¼şu<b€%!Îz{ô¬›¹Úâä·\'$ƒÚ­ŞHch8Ï½gD¹rÇœÿ\0U\0Z‹åŒ(ì)ûxúTY8ÎyÇ¼úöë@óÕ 8Á#Š€›§^1š˜œãëÚ€&^˜/\\àqQ ùG\0Tœô8â€ÍÖ¬ÃÔU`\0~Oz³\0äg§å@\Zvİ9ô­h¹Çık*Ø`sÅjÁÇcøP¡{\Z\0\0Ç8ô¦¦qÎsRE\05TƒHT`äíRmÁèx¡‡f€)Î:ñßò¬Ë0kZqùV]Ğàõü(àm<úT°qÏçSİ›œçA‹+pÀ \ræÆ=ªÌw>ãèkJWZ>Ñï~t·ö£Ó¡4ãtq×jÁ7/sÓò£í\rÎJ\0ßûOùÍ/Úxïş5‰öƒÿ\0ëRı¡ºô \r“sƒŠi¼8ãcı¡ó’qLiÜv \r‰.Î3Tg˜·L{ÕC;`Œœ*\'rÇÓ ‰üæ©È;x©Ÿëÿ\0ë¨v3ph<’};S0qĞ€Gùæ2aÔÖÇ\\õëÍ\04Ü/åÍ·†ãè^ì<{Ò`‚7cëÿ\0Ö \0ŒœQô2ó¸ƒÏN˜¤<şxùNhÆ1€\'üö 	zã¯O^Ôå8ÇOÆŒàéïN“÷±ô 	s“¹5<|c$qÚ @ cõ«	œt=3Ò€%\0Ô{`Ó½pqÎ)«ÀÀtÅ/^A8ÏLP	±ñõ!ä÷ëéÒ“i\'¡éé@·ô œ‚:Ô›_ºOáÖ…MÊNÉÀ ¶óŒŒsÁ§B\0•A<ŸçN*sÓ¿¥3Ç× â€:+[ß÷˜Á	ÒmíÎVPİp*¼:„¨|—Âízš´Ä¼Dî$úúP	£T$¡gµ1f^×úô§È\'¯=€ªr)W=~”RòÄ€œT0 BÊçêÌ°A¥FŠ@Ç gó 	£ş¿•#dHàR È_­4ŸÏ\0ÒAR2pqŠBGbq($c sëE\r“Áà´\0â~`O#ëÒ•A Sœãæ#×<\nyÉäŒw9 ÈAÏPzz”…\'iÀ}{3@¨ô¥¯oZx^ø\'ŸÒ€¤#úP ŸÊ¤Œ/qïÅ4Œg¥9Pç;Nµ\0JAÔ¨0FzuÅG\Z}ßJ™¥\08p1ÓqÖ¦\\‚>n§Š¼ş1S*F9úw <€0IôéR»[ìi¸ßŒÓ°sÀàûP.,mnW÷¨ÇQëYw\Z!&Ö`¡íZìX‚I€¦‚Á±éøP“©Z	 uÍHšô\\<ü­’ìH süêYïŠ\0¤ºÔØ?èÌN:fë3cµPsüF­µ»°Á8¾(6$ã¦\0â€3f¼¿¼áœ\"ç€ƒ-œ‡ç#¯øÕß%#*O¥)(À?ìĞØV8£\0éR´ƒ­Ï ¬ğ_¯9§†aÁúsÅ\0LHÈ<T¨»”œ;J¥¸€òjÜ,Á3Ûé@­TŒt¹j…Bí\"°í³³ëÚ·­àÖ€4ãÍWÔ­ÄÖ®„pÊEX‡§&ë½Ï %ôÍXä`FçQ]£[CuË\n¸ê+Å¶—íQG1Ö¨è:ÛX¿‘q¹ \'¿ğĞÖÈKFxæªl’#óEv1ç…dŒ‡Fî)’YÄçÆ:â€9ËyNî3œVÅ’ùß|ôè{Ô§M…:c¾*Df9ÀÇP(Wi<uZå<Và=ºŒr	®•äûÀöî;ŠäüPOÛ\"NT=;s@ê9ãô©ä\'ëx‹’sµW©=RÔnL‹å@2ƒ¾>ñÿ\0\n\0§<†y‰`v\rùTª6®t¤ ƒ¡\'ßµ8/SÏ^ô\0òñŒãÓ½?¦qF?‹§Zpzã˜ Uçèzc¥Hœc¿Ğt¤AƒéÒ¤¾	Í\09qè*Lç§ƒ8¥8ŒpG¥\0\0å¸=êÌ=±×µVş,ãÕ˜zãŸğ \rKaÓœqZ°Œ~•këíéZĞg\0ç¥\0[AÇ52—¯`zæ§@HüzPééùSX`÷5\"\\f‘‡§å@\'èqık*ï„úÖ´ÃƒïYwcÇZ\0Á¹Á\'¹¬éÍÀüëNèsĞş³İN{ÿ\0\0D@=ëHªøT»I=ú÷¥Xñ@ïZ6úT¥O§oJLç1@\nG½9G©Øù~‡Ò”ç\0Ô—éMe#Á©ñÆG?QQàŒs@í#œãšcvçŠœ©ÃôÍFãÏå@ßÀ#Ú cÎF=?\nÆ=sP7œĞM×½)¸Ù>¹Ç¥<ŒtSqßiÏ|\n\0oğ‚GPOÒšqÇ¶)Á0:61ĞŠ@¼”Ÿ—ƒš\0i§Î>”™ÇAN\npx#›XğÇš\0›h±N¸ÆOjn6œôÏ\0bœ:ôús@GŒŒÍMä`Ô	8ã½M<zw8·4¤óÆE3zÒœúcŞ€ÏJz¨à“œÊš¾œZ•\\f€¨8§ùıozz)Oj›ËÀ<P_/<\0xíMXş`\0Î*»åöõ¦y|{qÒ€+ÎÊÌ§N•rÖà8Ú£?…_P0yªEM´Åvçå>Ô¢á[îŒı*Œñàã¡=©ë!<r=óI Ê.î¸ \nã¹A SHè?ÕeÔTäjS¿Û  u<×ó¦œ@\0÷¥º‘Ï¥Gœx?ã@è8àqI‘ç¥9ø£Ô@\nH>”£\'$ñÏ4ÒHÀë”s‚ 	‡ÜñCO\0`j!½ñíÍ=	éÜúĞŠ¼Áç?…8/CÇš¸\'$­=IÇNÔ\0Â Ÿ›ŒqJª3€sÓ½9»Œzp)sµ¹çñ UAÁàÔÊ1†ÛÇ>´Å\'‚ŞiÃrÎ?.´ag!xïRàc¯|zÔ1Ü}*u¯©í@(Úzõö§ÏBic\0€rG¥M·@µ\0D\nF#·j;ºsÀÔéÏ@{sSy@ƒÉ \nË\0ô©Œã uÈ«Q¦ÑÏåNÚ>”JH—núUK‰UA9râP‹€xÅaİÎKÅ\02I¹êy8ö«6Ñ¦AlÂ³¢%ßŸ»»5¥kÉã9ï@\Zl¤di¯h	<}M	b§Æüã×Ú€3^İ‚W§aš•zŒ\n·1\0ôëŞ«íÜ8àP›^£\'»e¹ãÖ° ^T•·g„ öúĞ¬lsÓZ™p*\0GQÓ½	\'ÏÀÅ\0aøš2§‘”cšã²„ÎcBÉà†½\\µ7Zsc–NEqJ2AÎ\Z\0Ï†çTĞåş ƒ‚JÖşãwÀ»„ÆÄrAÈ§ÛÎm„T£EÒ¯—ç¶ıÙ(N-gLr—+ô\'¥àe>\\ñóÓæ¬y<dã0ŞJ€¨5øeæ-SB¤P¬pÒ¯ıkSÒ[Ö¸–P@p(o]ù…_Q\0ø5…6œ±M$o!rŒFh]FöÙÿ\0s\nùÄ\nğ£ük9\" îsó/¥X(‘ª6Q·°éí@‘ÎG>´œz`uæœs‘Ç^F)?1¼q@\n9§®1ÿ\0ê¦€q•^ÔõÈëôâ€ ˜Ï¥J `=j5ßğ(È\0à}=LÓº©éíIÈ¯J2@Ï4\0á×«0ã5TyÏåV`àÖ€5mr\0ëÒµ`ZÊµÎSZ°sÎj\0¼ c ÏÒ¦\\câ«§Ò¥?\0N§àv¨Õ†8íúS˜yüh¼ÇŸzÊ¹ÆÓ‘ÍjMĞúÖ]Ş9ã…t ‘ŒÕOåW®r	ÇMrXq@Xòqÿ\0•XH†3®)ÑGÓ¯Z°¨:şE¡În¾´Ï(õÇåZ%ÛŞ›åsúP1íÂ—ËéŠ¼Ñr8ö¦˜³Œ´Cg94¢8õ«VJpN1Š\0 ÑÀíŞªÌ¿7°ö­gå?áT®?1Ò€2äã®8÷¨*OÕf`AÇ#ğª­œ~”\0ÃÆxÇni„r:Šy9íƒÖ›Œ{ı(¼åGò¦…ÇËÄ\08§B’vúsô¤ÛœqÆ\0éÒ€\rİ\0ìw\ZjŒcœóÛ¿ÿ\0^—ä/\0Øâ‘ËÊ¹$­\0X\0`öãšRÓèi¤õ>‚y\'z\0z˜8üjd^8ôõ¨cäŒ§Ú¦ÀäĞ¸ô=(>¼zu¤íÀ#JqÎqşE\0\n:|İ\rYˆz•uõb1€~´b1×ûÕƒàsQGõ=;\Z°¸\0à‘é@;Š@§ÒŸÔu\'ó¥œôúPJŒğ1Ú£¸·[ˆö–Ãƒò‘Vå9ıj0K¸Ú}¨;Âåv°<ƒN’p§­kÜÙÇx»&ù?+â°®ìî­‰âb££A O.\nyéKŸ—9ÏãÍ@¶ÓÜ²3…Ç^1øÔ‡€~^GP˜ôÍ3<Œ’9üéO#§ËíL\0’¬ÜĞú‚2r;ƒN$–ç·õ¨ÎOàûS‹“’;P°äqëÎi€`{\ZvA8 àŸOÂ›Æ‚=(Eaôô©¯#§\"¡roQSF0Gƒ,gŒîiã¾ßçÒ£B89èje9\\Øô4\0£\0g<ızĞFX˜÷Å!8P@Çè¹±™é@®Iä½3šrıÑ×¥D¤`mü{S¾lÍøã© 	£ûÃ#§©`L\Z­ÀcŸZ•Hê{Ğ˜Û\'‡Ö­Gó}áTâÇ«QŸ­\0YUã¥H«Çüê ÜœœT¸ùzĞç‘QÊûTõµ?¢äpj´îO\0ó@.ä\'8<tÆkå²ıùè3]–ä¦[¯\\ûÖ¡W#×ÔPq¶IïÖ¯ÛÍóg=;g­e+jq!\\ädĞÚ\\l^N:ç¥H· =+í;G-ÛzR‹¡Ğ7OJ\0è…Èdä~´Å˜tnxéXÑÜğp½êU¹ã8õ \rë|9\"µ­œ‡Šæm.öœnÆ;\ZØµ¹Ú£¥\0mù„.r{P²ó“Ö³¾ÖXòzÓãŸ¨äPí¼‚HŠ·¥qz”×S–5+Gjèíæ!ºñ\\÷ˆdRR!Gz\0H°I8ıjõ£\'oú÷¬¸XñéZ0¶Ğ8ö \r›YÇÉUŞ«Œ­e[Ã öä\ZĞ…ò9=;PsÜ©èkÎîtò7\'.{û×¤LtØ\0`WšKœ“¤œPi2zùÔ,9Àı\rLø<dT0p8Æ8 1Óã­ ÆsŸşµ)#ŒtÍ\0ıqq@\nØÓÀÁÇáÖš½=8©ÔzÔ\0å=8ÏLô©WéùšŒtè?\n¿ıT\0üaqíëKÎ8n==(§=ºÒFrGà(\0ó?­Z€r1UGŞÆ:Õ¨\0&€5­»g+NvÏ—h8~G«\nôÏÿ\0ª€-&xâ¤\rƒ’j¸8Ï84»ˆîhĞ àŸÒxÎyê*²8Ï$Ô äh’ãó¬»®‡µiÉŒœäzÌ»û§§ã@wYÿ\0J¨¼1â¬Üõ=\Z¦ÍŒğ \rp;óõ«àtéT\"«*ãƒ“Å\0XR:f—ÈãŞ¡Á IãÚ€&8\'w§(ÀÆ3ƒL–Ç§P1’÷ œÂ‘†šÒ{gôëê(dQ‚=åT.;sWY†:ô÷ª7zô Û¯\"©¶Bàg<µjrCÒª¿éÁô 7İé‘ß8¦0³A8æœÇŸ0ò‡§Å\0‚3Ç#4Ü—*FF1º”(\0…Á÷¤#:‘@xÁ<`€}©¼ĞƒŸ^Ÿ;\0Ïã×€üW¨Æ8çõ¥P3ß\'Ú›Ğñô§)ÉÇ‚€$@2=zâ§@qÓ“€N}ø©ãÀN´ §O`)N:Œ}) œu4æÁãßƒ@\n£Ÿ_Â¬CïÆG¥WCÏóV\"ëĞı(êØ<â¦üùöªñ½j~üĞÇ_Aô¡IšqÀ#=Æ1NL¶vƒÀí@Ï\0ç t§ªá,H};RùÑÅ\\\0Ùà‘Y—7…‘	{Ÿé@Í}¿#gwZ¹|áB Œ×<d2Ë‚x85§<¦Hã#gZ\0h#ì’áøcŒı+Æ$n3ƒ«P±Æ€v$ûÖ]Á>k‘“é@ëè)¸À=úb ô\'“ÎJnFáóÀã_òhã>¹Áät§[¦î¸ÀÀëÓ§\\Q3œsÒ€$,Gw¦‚3€~aÛ¤l÷qŸJ^§J\0p\'±ç1RòqœõB8~P1×õëò×Ò€\'ãƒœsÔT±°ÇNÜdZ¬~•*œ\'§?J\0°÷Xút¤\\“Ç_¥5[@úŠ]à¸ÁïŞ€3éŞÔğ¸9äŸÆ£ÉÛóqÂœ§Œœ?\0H„#9«\n q‘ßÒ«©ÏåSŒúP¤éòœ‘íŠz9`úT\n}8Ç¥<7sùæ€-‰&\'Â§‘ØÕ`W1íÚ§O»ƒÎ=è`¸SÅ$p#’\0ö¦¦7VP…Â€Gz\0†e@„r;W5©EÉëÇN+£º$)\0{ö¬K•ÜN9Í\0`Èn§çŠ`‘—³^\r\\š-§ŸJ¨è9 öçŠ\0fàÇ$Œc¸¤€ğ8û¤Ò²rFæšÃ<~]9 	Ö]¹œèA«	 >¼zÕzØÀ§#•€5¢”ç©§´m®ÜÕƒ”€qÈ©ÖAq@İñŒ½*ÔW7ÿ\0Z¹•—ğ	«–­4¬hÌzf€:¨®IL‚zv¬çi.ÚC“Î:V¥¼/?1ù\\öª·P§üP0³ ‘Ş¯Âá±óV\\\'¾*ì\'‚3Ú€5à%y Vœn\nä{V¼€(>ù5¡€ƒÁâ€.Îsm ÿ\0d×›°ÀÇ~Ø¯Dßºt5ço:÷ \nò}¥BÀg©¤8?.sÒ n=}(¸çùP½yÎh8^€ğzP0p}(@8Î1Ç¥=Aõì;SŒuéR($àût ¨9éÛò§ƒëM\\}3NGé@ã4qÏx¤à{võ¦‘óg8â€¿®9ô«õóªQà½]·Áa(VÓÎÅjDqÀ<jË¶n;qWc ×ï@ËsÀàw¦y£èj—®?ıU]çÇp>” ’gĞU„nÜŠÊ†lúÆ®Å&xÉ&€\'¹8¬ë¾à}ªã¿|õªg;Ğ%×S×ñ@óc#‚®Ü7>Øª,?Ò€$GÁëS¬¸ñU‡=09 gõàP†“ÃŒR¤§8ªÜñÈãñ©zqÇj\0¼sëéCI†µWäç½8‚G_Ö€_xô§+u<{T8õ9õ¥\n}#¿¿éT¦|*v~~ª´ÙÏ_é@¤8Rj»\0;Œn•<œİ08¨œPc¡î9¦1ü õâœ@ËpyÇJi7 ÏÓµ\0\"€1À/\0æ“\n:aÅ.;ºzô4„œúd`PxÎ9ü©9ädßÒGAƒÁã#§ùâ™ƒúı(À\\â”cĞ‘ü©0\0`\n^½Ç\\dv*c0Z•0F}B™8ç¿éS \'Ó×4\0ñŒò\')r3œÍ;tè)ÇƒÆzô HñëV\"Æ\0Æxâ QÈrzã¥Mv<ÈÇJ—¨ïPD	O­\\XÜÁÂõéÅ\05\"ylã\'ÚBFUr¬ÜÓ5ÌòFè íÈÁU¬‹¹$ùÉı(ÃKÉ6ìtFw•†ì\r¹è5¹ã’W·Ú7´ƒĞt 2“÷€ƒZ	thd”È¬ywo%±Œõ#Ú§·›t\rœu \r/4y`N=+6sûÆo~x©r+şqPIÁãh0Àœø¦œ¹—1š\\¯lsíÖ„ëó\0=:P(ôì{t§Ğã<\ZiËéœĞ>\\íû@1×»R€p9î5°ŞÇãKÓ$ãóÖ€ÑyàÚ•6çæ=ğ3ÅFA\'Çô$œ‡\"”.054d‘“ôáçÎqORs\0­\0LP{siË†?(5\Zô=8zÜr1@¡ŒsOV\\c\'•åCvõ©‘ŒãÆ€%LŒÛÚ¦aŒ`ŠN8<Tª	z}(dè;÷§o ~)ŠHÆ{Rç\rÛ>”2ºŒäc¥8¹ãê’0¼œzSã$“}q@•ş]¼ƒíKç»IÉÆMVèHšÌÕğrhÄ’–¿tZ§(ùqê)Z^Hæ¡$î8àgŠ\0«r™åsŒôª2DÁ8úV¤¡³ì?\n®è<úĞs&A<çŞ£(=¾•xÇÏ$Š£;¿Og\'ŒçÛ§éK°dq‚=»æ¬ùy;BğiJäùPfSÓÿ\0­Wì`Üß7=ªLô­=5‘F:ô \r;m:&\0ùjÂ¶-íÖZƒµE\nl\0ñèjò01ä/QŞ€ cÆjµĞÜ¸È¬Ï&Ü¸ÇzªÒòãŸZ\0Ë‘r×±éSÂıòyô¨o\'å^sŞ™nçû§é@\Z±6~ï#Ú®Bàœw¬Èœ ùxãÒ¯ÂÅFG4 µp.FxÈäô®İße¬¬Gğšâ¸=3Š\0¯ är=j#gÓµNç;tÏµ\04‘·§¥(ÆxŒÓO_lÒ®s“ÛÛ 	Aç£séR cŸ®*%è>•:İ(Ã¨<P@^İéê¤ÿ\0ê¦ğ¡ë‘@ÀÇ4ÓqJ~ï=i¤\0N8öô !ç¿_J»PH<sÅRO½Ş®ÁÔs@\ZptãµZY0	ªQ1\n:ŒTÙ c¨>Ô\0³JAïÁ¬én0qÏ³SNÇ&¨·\'$ñ@\Z³Œç§«| qXÖ£ô­‹aé@‰ã¡Fè€¿NµtŒ‘ßJ¡y§Š\0Å¹È=Ç½T<„Õjãï}X\0sÍ\0*®;´áàûÓÑ	9ÅJ°“È gßÓ­Jˆ1éRùG)Û8 Ï­¸êâ¤)ú\Zkã#Z\0fŞ:t¥ãõ§céJ­\0DÃØã¥U—Œ\ZºÃ˜ÍT¸=(:^ÆA¨¦?áSÍƒ°ôªìp8ì8 IúLàÆ;ô§H#¥\'q–ïôÅ\0 \0»Ğt?QÒàƒ€AÀcŠ^Hÿ\0€H¤\n2\0Àç¸ `p9çµ4€½Fëšy\0’0,S[É<óÍ\0MĞéÚŸÔõúRdt\rŒ{ã4«ìƒØô 	#ìF¾•:ÀÈ•WN\0éëŠ•OË×·49?¨ô àœ=0ñ»z3Ãñ 	Ç<ãµX´Á”)<UXÃ9!@oLVî™k\nÓù  Ñn”)eÚ;â‹«†H\nÇS€Õ!»M²r¥[¦oZÏ¸”¤@1ù³òæ€(9•¤Üx9#8ÅW”`°q½‡µ^–g’0»8œUr»#Ë‚8ÈÆ9 öã·i>´É@†\0>¸«N†FŞ‡¡ÈéUæ6>÷ŞÅ\0U\nÙ,ÃŒ÷ZUb¬.ÓšGÎ°Ï9Ï4Éã;061Í\0\\ˆ@œp*&q»rzzTq¹Úà`ŸN”6Kà/lwõ 	x9<ô¡0Hı:õ¤‰éÿ\0×¡GË¸Üó@sëœR/İÊƒŸÊœÃåå—8ÇÖG¯© œzûP¿îàã®ÑFàIÆIÏZQœãp\\óÔĞŠô\'`R‚a‚J`Ïr¼¾ôşHãÍ\0=pG>½ª@yo^•\0È\0’\0õÇ=¸Å\0J8ôÎ8Å<}ò1œãšg8ÆQK–Ï<Š\0tÏ½(A8¨•ˆ=MJ¬séÇÒ€$VÁ@¹527¯~Õ;\Z~\r\0I»°<iqI¤ù»\0<Šc\r€mÆoJ\03ĞĞS¼şyê*£ÊFrzzö¦y¬	bAöÏë@\Z^§¥Dó¨ldtªrOÁT&SÓå B_n1ÜR£ä#ôª[²˜ÈÊ1OYIä\0\\wÈÏ|úT-œ`¯\"™¿ÙiˆÌ äûĞ÷rsÁúR,\0Æi0ôhP\0<~=(0GpÓ4¤) zd)ê1è9õ§ùXÈ =´l°£·L¨:Õ»ut †Çó \rÛv%AçÛÒ­G:…ÚI\0ôö¬¸›bƒ¸r\Z•¥F[t 	îTr*´s+ò¸ÇjiT.	ÉÅT´¸ 	¯ËëÎj’>­Mq(1qŸNsUc>üP¹ÂñƒšÒ„ñóÆ²mò\08­	Æpx Z”…4¹›<ã>õÈ°Àäâº]añb‘ä\ríëÚ¹É8ãu\0UŒúâ¡luéÛ§JLç<?\Z®G=FoJ\0o›šróş8¦óè:ãÔå¿J\0‘>ğÜæ§Œg®*(ÁÏ…O\'ùPÀÆ8ÀéH@)à`ŠB1‘ô ¦n•íR¸8èÔl98#Ú€ßpOz\028Ç5E3»5vp2y \r@ dv©ñŒœşUV&ÂäÜŠ›xÆæ€ {ú÷ªyéúU©[¯#¯ãUò3øĞ»a:\ZÖ·$/lıqXğ7Óğ­eë@Éã•P»éÇçS4ÃİÆ¨ÜIÔgŞ€3.:j—$çñ©\'`rxéK\0ã¯ç@ÅF=xÈéVã€õ©–éÏ85~Çÿ\0^€+ùç\'8ãÚšĞ\0¡·Û>ÔÆ@Å\0QhşSÇ>Õ]ã?@+AĞA=\rC$g¦3ßMG \'—Æ@ãéOsÏµX1ü¸•\0S*1ŒqŠ¡r€àc“ÇjÕu8æ¨]/VÅ\0bÊ9àvíëš€úàqÇ½Y¸<‘UÏ¦F{PXÁàwæ›ÜƒŒãÿ\0×OïÔqô¤àr3q@\r8+‘ıi18éKµ”p½	Í+qŒ•4\0ŞrßÈtéIœİsÀ¥p>^¾ŸçÖ›´cøNz}(qè¤ô¥eã±Ç­\'}!çG<PŠN¼Š‘qœgæ¢PI\\üUë\r>k“¹@<\Z\0ˆ£Ì=EiXiåéÓjZÓ·Ó¡´PÏò±Xp\r\\·Í»˜×ƒ´c4\0è­a‡ıJã*´‰*Èşg’@õô©mî İ’gsQ,ÒgtjÅº±4\0’3w¨äŒ2l›GÎ:T³NÁ÷F¬„&­@<Ù•€*r{Ğ‘\nmŒPÇ®)³[îœ*`Oj®âDoÊŸ@)ªæiÅ¼•Œw <&@ÚzçŞ©›uÉÜxéŠ²ÇË¨ÊÇÖ›3™ví@\0¤à÷àzÔL›×c‘Ö¬»ü$Ü\nG_66Áç€3;\n@ã5(Û’NÜälS&„© .2:‚‘;ğÙüø 	‚8*IëÆ)ÈÊÊzúcÖ™“¼m$7\\\n~ví<zu \0n=9õ¨ •ãhè§³èhpIÏ^s@\r xnp=)A^¿8¥8A9À g®9‡­\08pñÍ8c”SšbîÎB¾éÈGcÅ\0IÆ#ÓJƒ£§=é\0àpyÇ­9r¦ <Ğvæœİ‚Aç·jn\0õôÍ\0w91@ŒdÇáR¨ÎĞGAÛŒÕa’@äó“Ş§‹ş:†gåÍL«ÎN9¨‡ÍŒtu©”\0:Pÿ\09>”’åOP	ÎsQO÷AÖ€*L‹ŒƒíÅE¼ÏJtÅ—¿lqUdcª\'ÛŒzPÍ Î1j-şÜúÔ{d$œcıtÒ$NªqZ\0”9Û×ïN2rqéÅWøårzô¾f@8ÏPÕe#¨<Ò©Æ* ˜ä‘“Å(˜úgó@—Hà`óNsÎj’K=?ÆŸæqÓJ\0ÒŒ®à:óÏ¬*:\r½G—ÈİÎ3ŸÇr9×açùPƒ[Š±\Z… ×¿¥f À\'}µ‡*ü:P¤ÒùhqØõ«ı«8È òyš÷®N9<æ –ê]ÀÇó \r	®‹š#”g$u¬Å”“œÄÕ¨Á<ñÒ€.Hàƒ‘ŸN‚–	\rŞ¸¦¬YïƒùTñ®=µ\0X„/Lõh[È\0ƒœgÒ³ĞñÇ\\V…°	ÉĞ\Z»ï™Wû¢²%¸õ­+“ºFl“ÍP˜ŸÓ4B@9àÓªíƒÀ=úU™x={UfãÔŠ\0g9p3ÇÏ=ı)Ê0~½he9Ààc¥XEçªø<tÅXAß4 Á?JaRAïRvüM1€Œ÷çLg§Ò¢#àqíR°8Ï=:TMĞŒ˜úP“®1jÌm€21UG\rŸzr·J\0ÒÎÇ>Â¤óû£úÖzKÇµ/›ÇÎ€-Hùì}zT,Ø\0j»ÊIëQÉûŞô~9@ÁÈãÚ­Ås€pÀXğ:šœMÉÇµ\0k›‚sÀëŒUy&ÏÖ©ùÙêyÍ1¥Í\0=˜äñÛÖ¦„ü§â©nÉÇ·Z³íÚ€5 8Ç\0f¯Âø\0äVL2}9äU´›¯~Ô{~nâ†oã®*§ÓæíNó\\gŸ¥\0<“Ç5•˜äŸ¥øúP×J”ŸçzUEn€µ)p«Å\06B=>ÕBäñŒÕ§~¸9Ÿrà¸Å\0f\\ §µV`H cŞ¬LØ,8â«·-’3Š\0av1‘MÈ$qÇqéN$Ó#SsŒ`sŸJ\0EÁÀÆN1Ú“¸ÇLzR’s»ÜR¼)<ãq@\rş.‡ê1L$N½iŞœøq@ÉyätÀ 	ûÿ\01üª_,ŒuSSÛ[3¸ç·§J\0·¤X‹‚\ZQ¶2y#­tM¶;#±ÆZ­ÉŠÒ8-8?;ãœÔİÜåÈ`yÍ\0YšåÙ¶NTF qŠ‚âSÕ>XIà\Z†æâYÙ\\‚[îÔ¼»6ºNhÃJá0rÈj\"˜#e$ÆF>aT’F	)\0œœÓ‘I!™¶÷éÍ\0N×›$ew-»åæ¢F2@éUdÂ?ÊzŒŒóŠT/‚3¸ç4bY‹ òqPÅ(²ó{w¦³0bÙ>œTaÆğPnÇ8=Í\0LÓy’og×id\nÉ¹Hô8¨–Bdè@è)ZVß6J\0>Vàe@ìGzË«\0¹#u©·HTüÛ¾‡šŒ’2;±“@\'WØÄ·^8ëU™:HÎAZ{W ^Üâ«M\0bFhğ8\'©Æ)àà}ÓíÅ@	VåHÉ-Öœ…é»©Áï@îÈ9ÛÆ\0âœØç¯=8ëQÈ$vâ¤à?”\0 ôúRÜı2sI‘Ô7=Î=©§§nŸŸÒ€$@?‡pü)ÙéÏSÉÇJˆNzÆ¤|§ØĞÔ€~f\0œTˆ{* @9Î9ÎjHÉìOJ\0y;—ƒŒúŠCœçiØŒgü)\0$Çc<b€€yc§jXÏ z{T#ï`W=*Q€F?Ÿ|Ğ¥ ‚¸Æ*pÄ\r­Œ}*¬dzŸÌõ©•ÁÉÙ<Ğ¥Î1»)“9\'‚•9äñ“i²åûôì(:eË2;ù\ZC“óu=»Vƒ[m9Èíšo•Æ\\tí@âAØQÏÒ”F¾Ÿ^*m›O.Ü@µ\0@mÇçÔ}ŒŒö\"¦<9Æ*Â0Ÿå@ïf¡ºÎM4Y‚Åx·©&¾)¢?—¯OJ\0£ı•!©ê:ãšC§Ê 8úV¤NÊ¸İÒ¬‰20p>´ƒöI²A\0óÎI”üœdœVôAIè2j`#Lq‘”‘, zzŠº4d’	íÆkIdùp£<h\náÎ4ÎI§ùg¥Q¼ˆ»Øs]Eî6•^Æ°ïcãàP<c.À8­Kx²>cÔô¥S‰IƒÕ¥G‘øĞè¸^úS\0‡#ò©‡@;}j=ÃqÁâ€&‹Ø˜æ®ƒˆÈ§z§ŞøCW_F1@eÈ9=ºU	²==jüÀzU	F8º\n\0¡.UØ°>¼U‰WÔñÚ«¸Ïë@\r8bzôèø=Ï4ŞAéJrà€8æ€\'¦3Æ=*ÂÃ¿µA®8ïV#ù@Å\0H1ÿ\0×4ÆÀôëšz~&˜ı88ö \nîOÓğ¨›§j™¸ØTM“Çj\0i ½ı:Q»ŸJkprzç­78ïÓ­\0I¿¨ÈúâşŸNj,ŸËŒPı?*\0—pÎGãÚŒàT{»ç×½)Æsš\0q<tşt„ÓŒzŠièyÍôÇ¥\0I¼uãòÍ osøS2s×©£<pyô 	”Œâ¥FÁÈªÙŒûTŠß—Ö€/G\'=y2OŒsTTûõ=ûTˆØÆO\0æ€.	»dfæ’=÷ª›¸é¥#ÿ\0×@£œ1Hdãœ`úÕbø?xÓwóŒŸC@„‡ ôô§™†:Š§¿åäœPÎÃ¹ühvp:còª3¿LñÖò{÷õª®Ã©í×š\0®äŸÊ¡<ô=ºÔÏ’I&¡rpsŸË  ×°M4ÎF=>”­Œã#èi28äóÏÖ€r:.;w¤ppzà×õ£v’:_Z8ÀÀÁÇnÔ\0˜Éş!Èãµ7ışOLtö§C‚r3H\n0:“é@[Ú[_œ±ö§|–ùÙ\\ô>Ôğœ¨#Ó4É.‘øàÇÒ€\ZÒmĞmô§ÔÒ6İ 1ÜšlbC“¹•§SR*°*P¹Çç@óU;Cv¨—÷²–f%ÁªÖõ{r‘(Îy\rÁªŒÓÄÛw3Ú€+ÌªE¸gƒP‚­€ä©şumŠ(Îÿ\0˜út˜c,ªY‡\0õ \nñ¨Şà©éƒNŸŸ/ƒéJªË+`wéR±UaµrÄç¯A@Ò2‡sMêw›µqü^µ2ñó8ÎO\\ğ)$ÚòğÀtõ VnüÇjx\0½óÒœ<¼!<ÿ\0	éMbUy`xÇj\0‰HUÛß?xÔºÄó’*ffİœtÀ¤ :ç{Ğh±üÀd`fƒ˜çn	ïÍOµ|¶,£§5W!à7Z\0«q\0nFAŞ©£‘´d:œdñZÎ»˜t?AY÷K±”`…=G4\0›¹*¹ÀÈ§«q×°ÍW¸ëƒj‘[\'#9ÏAÁ>ì¼Œ÷? ¦õ“ÁÎiªíĞóƒÚœœ`ş´\0K`œİiÈF#­3ƒàc®Ooo­\0€ÃÇ#ŸÂ€&RO__¥Ia{u9=jl`äwşU2gÓÚ€\'öìF1şM6@9À¡HÉÎ8§œ‡ñ ó‘œ´èú/AçM\0’2^™§)ä)Á8é@®9äŒv«ŒŞ™U:ÿ\0.Õv,’N3Ü\Z\0‘@QŒ÷ÍHª=ºñLİııi7÷Ç#§<PÛ¦íŠ\nƒ’sLW\'l{f•	$céé@<`H­D	ÎxúÕe¾b\0ätàT)\0FYvúZ‘v¯qùÔ,O®qŠhq·<AÅ\0^xc¯<ÔÀƒ÷¸#§µRY\0ŸZLJàp}\0NÃÁÉè\r8dŒnÎ=xâª‡ç>iL¬·j\0Ò‰Â)ÈèiÅ”€k3íüâœ’³s™í@\ZğÌÊvçm¥üzÅY‘Í]¡AÔ< 7R2yÍe\\Æ¸#qZj´“T.Æ9ïŠ\0ËXşlGnµr!ÆÒF3ëPàn\'±êUÇ$t 	ÉGŞ¦z\0GøÒ±ƒ°5rÊ\rï–jõ÷ Ğ˜âäî cÚ¤|œÔŒF2:v¨dÎ:ğ?\n\0­/=ğ3õ¬ù{ƒZôÆ*„ÄŠ\0£62pr}j±ÆIÜ;\n±&sĞéUÏ=1ùĞp3‘º¤_›ŒóÔóQ½:ZdzÆ€&Lv<b­\'Jª§8«ç<(ú\n\0—¿\'½1ºv§}F>´Ó´p@ëÆ=jÇ\'Š’C··åÍ@äç\0cúPO~sÏcQ’8Ç_­9›¯®Gÿ\0ª£cëÒ€FqÓñïKÉ¨É8ÇSFI9¥\0J0×Òô9?ZŒv>´ ã\0Ö€ÓŸëÍ\'SÖš~î0?\Z3ŸòE\0;#ş½\'\0Ï˜÷¤$àûg4\0ñÀÏ¶<Hşµ	ÎO\0§ƒØg>Ôa\\qÛ\'±©`qU•¹Èãš‘_Ú€,‚\01öæ‚@çwáP† g=»Ñ¼÷ 	IäàãŸZMø=z\Z…Ÿ®>¦š\\R(}Ã\'‘ÀÅ€ÈéåU÷ûô¤ßôÒ€%cGj‰Ï=pyïFãôÍ0˜õ=I 7\0€Ø#Ô÷¨˜àpJ‘qÅFrAõÇ­\05³“Éıx¦ƒ‚=^E;={g¦óÀíÏĞ{P\02»yä¹äSxÆ	Ïäçò§`ç1Ó<ñFyQ¾¦€\Zø±ÇçMùp 1İ’G8§=s^zR\rİyëÓ=è­{ûv\'`ÜHäÕŸ,±‘˜çéQIB€eNxÍU‘İ¤É]Øç8 \rhnÌn»bÜ>¹©İÂ…òÕÇZ¡jê`ùÜ $\n•%%Š¤ªFŞ‡ŸÂ€’¬ÅÙíïI¶MùçĞş”¥ÓyV+œp:Q¸E\'“’Ã‘@	+FÃ8ÉÉÍ43Âc9õ§±wÀş,t¤o•Cg·LrM\0\'œ1†Î=©Œ“sğv¥Ş[ªÊ=i³\"«gq\n9\n\0K5¹(a·9ÚqPp›Hã¥HH¹zŠ¬¤$§sn§Ö€%IÚàŸJ|±`¹àŸÒ„¸+}ŞƒÒ¥ù6–Ş„ç…P`ò$WØdı) “·…=3ÆiK¨?9Ãwd;ˆÀéæ€\Zæ1Ã»ò¨ŠfMÜLt©$&<†$³9Ÿ}—nß^ô\0ÕaÀïËg¥Vº·WNÌ:b®ìAn{ö=j\ZXŒsÅ\0bàn=‰Ò°9#·j±{ÉY€;XŠ€€AÏ×…Æ¥\0*7<–ls€Æœ\n…Æ@ÀüÍFs’W<Ÿº)ÊObÀà€H .2\0#?\\Òáx(™ÏzLŒ¸ğ03G*8*E\0J½@#§ÍÉïéR£mOJ¬pç·AŒgüñR+\0Ï°ÿ\0>´iH#àŠ{t#zöÈªêê¶p¤ÉÏŞïÏ~(rƒÁÇ4à9û£8éQîãyÍ9| ŒçĞP”È#€öÅYŒ€	ısTã“/¶1*Ê°ÛÁÏL\0(pùäœsÓ‡ ñŒíšŒ<c«òœg?¥\0H	$àñŒS“$zw˜¹\0J™B–?•\0*‚í¿/¦3Å6Uİ1ƒĞR„ gJF\0t8ãğÍ\0gÈ»zõàT¸lwô­)#ÎxÅRt%¹9ã­\0D­íĞúÔ±î>´İ‡:POÄt 	sÇ tëAn¿O¥4ÍŒŒRà1ç€hùïò\ZU;q§ZnN8>ı*HÈÈsë@¸$ûÖµªü‹Áæ«CšÜìlAlÊ@çßš\0S“ù\nÈœIã5ºËû¦Ş#¥`ÎAb1ëŞ€*åK`õÎ)s…ü:R…#îçÖ•pÍßJ\0šfp1ŒÖ¼CËˆ*@ªVêœc=êÚœúryë@\nq¯¨¨œœœ`vÎiå½O\"¢s‘@æéÎ:öª3UÉŞµFcƒŒŠ\0¥ Ç8ÅB@êEK)N*ã©Ç°\0ÜdjzúJf@ûÄpiÊqÜq@¡Î=*Ìdíç5QN3ŒñS‚1‘éŠ\0œc#\r1ˆÚ2>”dÓÇ¥\0E!#íõ¨õ<uéO‘†8##¥C!Ç~8 9ÎxÎy4ÌóÓ>´1õê§Ziç¯ò  ÁñøzÑÆxëHè1ÒŒHàv ‚yÈëÎ\r<téÅD¿(õÎOzz·¿j\0qş](oqúÒgåG~¹\'Ú€o_¥\'CĞ}:æ‚{çô¤Ü\0äõêvĞà}=Á§pLqÆi€‚:‘éJçğ(]Ä©éOPîÀ$ş”àÇ çµ\0JÆ3(\'œÔa¸ëŠ	Ç§>Ô\0æ gÚšIÎ:BG_˜séIsƒút \'Š9ì:Ê›œ§ò¥\r´´\0 ó’)¹ä`½3@#\'<´€óÓ¾O\0ÖÏÅ#œc=ºqNÏéŒ¨Ûê©\"€¹é3Ò›€êpiÍê:dÓIÀàg¹ \0nqG¸ÏN9ÿ\0>Ô½09# ¤Ïp;Š\0ÇÍ·åúÓ)Ë\'4¼täcv õà‘ÜåM\0tN¨…òwê¤‘ g«3g? ÷j£,Ç8`F 	m‘B²©Æ:æ¦Hv]UIû¸ïU\"“QÓ5¢‹† j\0j¬ló\0À ÆOLòíHÜ’åT8şï¦’Xåx\'®h]ß.9r	(â‘C’¹ÏŠH·Ä ÆÛ¿¼¬:RVêŒg‘Ğš\0\\Ä«/=¸¦(,[ÎeöÆ\r>$Š5l.áİO5†ß¬)†¿J\0NI;Í#*´k¶.OÓ•£C–Aæi†_“j*xâ€,cæ;UÍ0ëœqšc’[ˆÈ `)ñ±ù³ŒúP”}ù8ç‘RF¡x8sŠØU-‘É¥X¶œ@ç\0Ld‘w¸ƒÆša‘”l`¥Î:Ôé\" \0ÇíÁëMV‰®Njûöüh\"‹¬î2yÀéP²¯Ú>eÚ¬HëRÒ¶8ô#µ9PG¾îãÓë@o\"WcåaY.‡£ƒ×Õ¹4a#Î@CÓâ³&C³xsØcŠ\0«µƒ|Ã#9<æ™µAà~ñ©Xsƒïü©›x 1\'ûóÿ\0× _îã\0wÏAKäryïLÚC|„1Æ0(ç$m gQ@RØõçÆqşpiË£®@ıj2ïAÏn=©Fp1ôÅ\0YN˜$út©CIù°9æ«ãºt§‡\rœ1š\0™˜ddwìsMT(ızC–ùOç×ô¨˜Ù*Äãó *ØÆ\0«PÉÀ\\Â¨!Ã\0¦?—?JYNz`c¥\0\\İ·¸§#m<=ñUÀç©ÇĞT€îØöÿ\0\n\0¼ÆIÉÅNª¥À>µJe>¼UÈÎ:\0p:P¤ìœzb¤T¹êqLG\0Ÿ¥M{}(M£î¯tªÍXœvâµ$\nq×§İ…›œa@&Õ‹chàç¤û™P‘[j€\0?N´õC\0´Ï)ËôÇ8©N›v8ôĞ¬HxãëJ#Tå@úzĞ\Ziro#ykBÛIf!xõÖŠ•e‡ şUax ãt \n‘Øˆ— ~*Ô ÁÇSëS’Ğ\nO/ÇnÔVìşè°5ÏLrN0885Ğjr,VGŒ`ñë\\ÑbÄãë@\nrËŒ{š#N3Q4›å±íL\r¸œc­\0jDËÀÈàäûU€ÃhÁö¬è¤*9©„ (çé@wç¶=*$9éô¨šn18¨\\Œ{f€#uç¿Z¥1ç±<j•ß\'·ZªìqÓ\'é@IíŒ\n„uÏ#©\\óÃŠ„‚ÙÍ\0&qÎ1ƒÍ(%sšCÓ4_­\0H¸tw©Õˆ qùUdüıêUúqü¨}ç×ëŠc7$tâñÛQ7xÇ\0×n?\n„äœtÍ8Ÿ¯LTdğ1ÜúP=0O©£œätôìq‘N@cŸ¥\00`€IÈ#4˜ç×}©Jàz`zPT’r=:P×=)sŞ“Øõ¥‡N\r\0d`ò9§*f1ÀéŒS€·µ\0.O7\'Æ1Ú—ğãŞ“¾OÓñ 8Æ8É§¹¦ãœdô 	<c©4\0ìüİºç4½=êyïô¤AëšP9š\0Şã” äcŒS@ÏBGéA\'?Ê€Ğqü¨É%º{â§ëG=qš\0·§­!ë1íFxëÛ˜Ç^Ô\0£=\0ï(Ç ŞôwÆ1Ï¥\'¡?\0|§ƒƒM`3íŠqèyÆ?Jié‘ÇÓµ\00ôÏ¾r(çå$wô=ixÉÀ9$w¦Ù\0õí@ĞtàJSé‚çH¿ÈuÇZCŒ«Æ9æ€$½0G¦8g©ÏÓëNœcÒd¯sÁúĞû†\0C•N|„,ËŒtõ«×&C!Ã0_STä¤Û’ş¦€++·ö«¶¯3)¿ •ê‹ÆI\\Ï¥MŒ\"‰ 4u÷UT€8¡X¼eÊ…$ğ=hätà•`IaŸ—f c8\"€\Zo¶v(<òy4Ù¥xädS¹qÀÍ=6ËàëŠì‰æàÊOËëÍ\0AÛîÃ^*i>h>e\\îÍ*Æ»t	šcÛ‚À`1@2²º”¨#­)‚v\0Gó©<¥Ibw‘×<Rs‚øÀõâ€9ÉÈb‹ØsI#d‘Ó““Şˆí/û^´Ç^TğG®h\0ŞùÆXƒé¡äV?+\n‰Ø#FÆ9$R\rû6!Ü¤ŸZ\0|N\"ûœŒ¢›)i	g\nz\nP‡È	¡zŸZY¶FC/>Ùë@ì@™\n{w¬SÊÆFOŒÓŞ7(®«œ@ëCG#(ÂmQ’M\07†m€ó8¨$#Ëb®=…ZTa‡ä™¨¤`Uzcµ\0eKIç*202GAıÚÑš ñ†ş?@zÕ6İÁÏsš\0€ğ\0UvÛÒ™·>R0xùzU†$„c¨Ù;ô\0gë@’Hg¿4åÈz`ñïÖ“ }O‘3´dŸ”tÎhNœ\0nÔŠsëê{T+ÿ\0>J“?Åı3@ƒÈárzñÛšB>P	è9ÇÒ+Ø>¼àğ)Nv´óÇ&€#‘À$ã5*6xÁ#9È^•Xœöö¤İ§ùí@•ò½sÎzTÑ±°#ĞU%fÜ:yõúb§ÁP?´¡œã#Å[\\d{Vb2õóïşr\'nzc84yã\nß€i	0}Eg«¸óÏZ)ŒnÏã@7í`§ÓÒ¦	ëUUãdÂ“ÄSÃ÷é@\nAÍOª®üúmö§¬€´Å\0N@íR*àF;qP£Œc’qOVù¹8µ\0XÛÀÚ92¦ô(ß)õ\\8‚9>´ñ.Ö\0=\0M†@3’=ûRy§%pyç8¦<ÙÀéQ‡Á8?\0SñÁ\"†0y$±â°rUwŠ¿¬Êd½\nqYî¹\'9Ïò XääõÇ§jrõ=?,RzsÈ¤ïq@ûã&ş1‘UƒtêyôéK¸ôî\0LXòsÛ®:S¸<ôõ¨óÆGzBÜgóÅ\0{×¯‡<d{TŒxÁëœÔG  XßÊ™‚;wÏJ›iÏ¡úÓqßŸÎ€\"¸})»O …O´ş´=M\05xÉ@ô©qÁÁéÒ°zœô§ªö Ï×?…#qŸÒ¦ÇB9ééL*@èp(¡€íéI·ØvÇ3)ü1Å ^=sï@ÛÁÏ¯?-!Àúj“o_c“Ši8éÍ\0G—céQ7g\'ÚÃ0F=iyÉü¨\0Á ä÷â…Ám<ö«ß®)ÃÎúô\0˜ãc§JB;œqÒœqôÇ½\'SÀïë@	Î;dJiÎ:|S³Èâ“=9n½(\0ç )Ü“Àı)¼dääãÍ/b3ùPñƒ1zR`ñ‘|Rçs×=h\\)î?\Z\08Æ@^j1Î0?*Nİ{cŞ1ÔôãP	?€£¿AŸ¥)8ÈÏAëIÏ\0gùĞ~Ç)ü)Üòîã§4‡‘Ôúu \0=x\nöæ”c“ïùP8Á#¹ï@\r`11î)¬N{gØSÏ×qƒLoEfúP`‘ŒsIÎì(Ç_á§ô÷èM&NxÏÈÍ\0 ëÀíE$p1J8\0óœqÍ#c#nŠ\0Oâ8z})‡û§ŒL\nò™¦ü=ú@!ÜêÄ•$v5ô@‡hêM6V@v„ätÔ`—ù>ç¨\'µ\0CtQ”B?­W´•ƒ•%—Â§œÛ´ÖträÂ“ÀéŠ\0Ú†UwîbJ’fÌa€Ï\0EP…ÉRÈ¸ÏRAV£	´1~½·t ·/Î\0Çlâ¢xÆ	RÛˆÀã½0®Ó’ZFì=)ìà‡\nÀP*œF\0ëšq@Ûd^})©#¨b@b84Ô2XrN8=¨0Ñà9ÀÏ<PÖşb–…Ô€9\0R>àØ“\0qÔS£Ê…Â²×h .QŒl\08¤e$3çÔ<’g²¾MòÁçxãhUùSåÈ\'©…—Œn$´¨Ç©*;w¦´‰¹(I#‚{P£t-¼ÆJ¾”‹ óIeÆNzTƒË¤„ê3Å\"y…If8úP–pÄ;;Ù@â†vm\r„ç•UÜÊJn´›Ğ:œtè(U¨Â¶p9ç¥;!Ï²Æ¢Ü¥ğ	ù¸éÀÕ#!C’ÄŒt¨s¸sÉ…Sš#Ôd\Z½UŒîzŠk˜Ùğ9Ï¥\0e•ù¸\ZFO—œc•nX@“¡æ à÷ÁéÍ\0Wuaœò~~•Ü:¶HÇğÕÆPxÈÅ@ñtaÿ\0ê>´\'¡l@<SÆOQÎG\0v¦0ÆFÙÆ>”›yÆ=2(_›@Ø#©úŠ„r{óŠÀÀã‘@\nCí\0ô#OéMÉŞxÁÎzt§\0ŒŸ/^i¤r1×=(\0²¤âéÒ¤ägæÀ#¡?…FWiÈÇ¦:şTƒpÆx8<\Z\0·T`zUˆåäĞZÏV8 q€Ò¦GÛØ{gùP¤sŞ¸â¤IèO½k9&Àü…Mƒ§$Ğ¤R±@	 Õ¤‘°r8ïÅcÇ3Èêq‘Ú¬,û@\0hM©Çÿ\0ZæŒrzÕ(àïúñMi×$gØ \r/µc…†(rMd´üàÓ‚{R,ÜçŒĞÑ˜•?7~)ÂF\0‘ŠÊû@\nG¯©#¹8ÉïÇ¯¼e‰éÆiÂU@ç8õ¬µ¸ƒĞZœÈIÈ± \nÒ‚ò;÷›=*6ŒúsÏj¸PœÒÆ:ÀĞpJg—‚zóZ.ØëÆ)†>¤Ç¥\0QòùÎI?ÎFF>öG·Z»åv#8æ›å¸çÇj\0¨ÈH÷úSY	\0ş5lÄ1ÀÆ}étKnAãæšÈŞ„ñŠ¶PÇı)»:àŠ\0¨SØÒ›´úøU¢œcô¦ùc´_n9ÁúQ·¶8ŒcŸZCÜñ@ãİiø=Hı()€zã¸<úĞ’1ƒÀ¦•ïƒOÏ=é˜éß\'±49â¤#3MÀşY c€})„˜51Ôõ¨ÏùÍ\0BëØtÅGÏ¿İLÀ^•ô\"€?CÈ\"”‚q:S©í@ÇNŸã@çŒñjFÎHã¨ïíÒšØ õëÖ€’X{œœ÷¦\0ØõÀæœG ï“KƒŒä@÷?…/N¼:w¥ÛF\0¥Ç?j\0NüÖ”uÜö p=sÅ\0{ô\0½¸öèş]¨·lbƒÜôïš\09_QëÔ‡Ğç¯Z^œ¯Rtãùs@sĞqÛ‘AéÛé@Ó§§JOÓ=9é@\nèG9çà:`wïëH½²iqŒc9ĞÎ8ôç£läv©p=G·JÀ\0yãŠ\0`ã°ë”€‘Œ®>œ¥/ÈíÓ¥!\\tÀÁã¨Tp1Û§¥\r¹Ààt \0NôÜ`œíß\0™<ã‚öüéA\0ç‚6Ò°8èÍÇ¥4¨ş.¹ \r\0[%w6Óß5*¬•†W¸¥H„G8Ü:œö©|öqˆùíPyyÛ\'5Ÿ8En\0`V”€¼sĞõBàá³òƒÏ 	-&Ü…¬0xâ®ƒ	m½1ºx5—m#mÛ»úÖŠ0Î8Ïz\0pxÙ¶Œ©ï¸Ô’\0PÊz}áÜTh»@.õ=>”ıÙlFNÜcô Qäär@1Jg‡ÍM¼îÈ¢BÙ ªÇ=éó‚¡° I$\\<\Z%£’¾€RÆ\0ÜÍ×øW=é×9Uç Fb™ş\\R})ëåÈÌ[éÀÍG·nıÀŠz„\nY[8şh\'ØÄ•Æ3ü<`Ó¤Ú÷ŠqÒŸ,Q¢†U±Œ\0*¸2ç~´\0»”–@ãŒRìNÑééQØÌ„tÇ«ç•ˆÇSë@´àc9Ï>”‘W˜›p$”‘®%dùG<w©›{!P`{ĞcçhÆxÒ¬äoüÜÔN»FüsÔDï[{tæ€,2®àUÀQÛŞ¦*œƒßŸÆ£E;ƒDâ9+/È/ñŞ€*mÏÊÄãœvªÓ \r	ééVŠ—j\r½ñR½ A½¾lúv à2o_JFŒºíéÅM\"\0Ù€}\0Qš.:g=8ªÌ¡©õôè8­FL®ŞÇÚ«Ë\0É8ñ \nhFáŸ\\pjEí‘Í5×jÌSéH¸]£<vËP™í;dÔ§ƒ†Ï4À@ÇAÇj~HÏn9!¹4\0Ò#¯åJ\08Æ3Œ*SÀä/_ÇùR0Æ(›xÛ¸ût 6yn0;\npäcÀç¨¥Ç\01\'œsÚ€\\!$úu©QÆjˆ ÎGPxÅ(ôÈë@¬ƒo‚8ãµL³lÎ	*˜éË{\ZrîêyÎ3ÇJ\0¸n3•$ã·4<Ç=HçõªÀAúš@~l{cƒ@‡<;ëR,§ gŸz¨2AÀíÚ¦9Àâ€,‰§åR@ÜÔ±è)Öö‘¶€sŒÖŠyh0˜Lu\0PÖ6@96tôpDHm£¡íPÁ2m@o—Ö…»Da¸SÔæ€)•#Ïz\nœr?ZÔ–5•AÀ?J¢Ñ¸|0Éü1@öcŒóíLÙëÅNU—·¦#Ê€!(Aÿ\0ëSL|cÁô©ö˜hÀïù\n\0ªÉqHÑÕh¯aş›sÊ€*ñøÓ^ÜÕÒœ1ÏN”İƒÓßh‘Œz?•!Œ~b­ìã\'!€*À\'Ş›°ƒ×­[Ú3ò)<¯Lq@<³~”ÖAÏåV|¼víMhùç{Pb‡#œJfÃÓ¦xëÒ­lÁü})¾YéĞô \n…N2	8N0¹«%8ÿ\0<Òğsé@¶Ÿ^†£e äUİ˜õ9úÔE\0È&€)0 wàcš¬øİÏZ½\"qĞU9G?Ï¥\00`€p@ïŠQÀÿ\0=i‰ã¯QÅ(Æ:Î€1ß¿ıj1×õÅç©=(\0Æ08ãÔS—íŠoøÓÁÇèÄØƒÇ¸ã¡ü)úQß®sÔúP\0xçß4cùÏëA?N\rƒùĞ\0¸ğ(ÇQ/=ºQÛ‘Ò€Üÿ\0ú©×¿¥8ü¼zÒ`P@>EzçßŠv2½G·­Ó\0/“øÒö÷h†;Ò£ºš\0C×<ğ8ö¨:cô©ã†sLr3Øp;Ğølõ¦ô~§Ozv÷¦ú\r\0ü1ŸJCƒ€N@ê1Švõ¦‘qĞÔ\0„údäúu¤ÇN\0íÒœzcÜdzP\0İÒ€6<¦Œ\'Š„1q×óÚÉÌß´öô¦®Ğwèˆâ€•ó“Ó®*œ€ùXàéëW˜–\0‘p1š¬ÿ\0*²€Ø\0\n\0Ïİdbœó€+N9d\\‰ äÖc‚9Êgò*õ»î#\' ÿ\0*\0²Áİ÷!àôÿ\0õSÔ2²œ\0ª1ŒS#’6]Ë¸`1Oó0\ró\0:ç¥\0H±î…Hõ§¸ÂP0F¨¡æBG\0vÍ)k¸—,3 ã^F~lú\ns,‚Là…Ç&›ŞZ”eÆ=OJz/9‘±Æp(÷2Å($Uqªã,\\b¥–DÊˆaÆNzb™’6^@¡Ò€r[Ët-‚¢bÛfIcŒT#ÈÜGÆ;ñDl¨6•ÁÁĞPRVòÙ6\"D»KŸ—œœÒ¡dÚÇ%yãƒÖ¢w%¶çë@´17!È=Í1K+.ò=i¬Ãh†hU\rµw*ã\'š\0s¶Ó¸pô¤VvtÆsøSfß¸\rÃÔPÆÌ\0Éa@Ñ·>b«Ç­+±L„!€8ÕUK·Ÿ­90U!—è:ĞƒÄôÆ?•Y¸.`PÈ\0À¦G1O¦MXs R…y#ò \n \0+òsÖ¡\0€zzjà€Èİ€àj»¡QÛ\0t ø#9ëÒšTéı*AÊ3ŠPFsôJHÀ`\0sŒµUâ)Áş•ªPc§z¯\"ÁH<Pr—vÊ1J¤d‚@éŒ~•,‘¯P?^8ªûp\0zç\0”6ã÷‰ïÜRüÀ`·=sQ	\0\'=Iê:ÓË\rÛxÏL`Ğƒ¸9Î=©êz6yü°*,®ãÎF1Ïoj‚q×Œz`PÃ¡èyê•8œ‘øf˜¼89<SÔ•#œqÇé@\n$)ŞXÇ_LñÚG§4ìòO©J\0MŠ¤üûÒªÄú\nxÆr}Nx¥ú}(V<·AØU˜Ó°*Éô9Ç<T†`ƒ#æ4z7Áù#8•\nàbzŒVX•LÕŠ>q‚*í¬€œ[Ù Q6ØÈ\0dó·=«N1¢ù€nÇ\0v¬ĞbÚ#DÀÁêT˜ F °c†Œ\n\0ÓŠ!ğrÑ“Á¡nVâFŞ@8SíIm#åcÚ¥3ÆjIb-@@û¹êhÃÆ¥@ÚGZKTÁÁ‰¤‚÷nRnašX®ÈÀ®Z\0ªñH‡?¥GÈÏ\\ÖÔ˜dW%xôª¦(äbröí@ùãéGlã¯J´öÍÏ”w\nÓa ƒë@ãÏåŠÇÏzqë‚ëÔ	<÷¤Ï°Å;øAéı(lğHüèƒx¤)p=éİ8÷ëFNF?\Z\0”@”Ò¼{zQJÃôô_ozM¸­OŒwáHW¿æh±C€:Rl<àf¬\0>”˜Áàu=¸ \ní~*ş9«ÅN:`ëPÈ¾€“@’©\0ãz£.Aü1ëZ“)ÇOaT%J\0¨sÜıiGAõãŞ†]½¸ö¤\0ôı(ÜìÇ¥\'¾qš^zŞšpGNÔ\0¹Û{ÓCqÁÍ!ã×ƒL\'Ôc#×9 	ƒdqĞŠ7ç\'=ª\"yç<Œg®iàóÈÇ1Í\0H	qO\\öÏøÒ õõô©•=¹Í\0Fã*v\\şU2§İ.ÎsùĞ~G_¯ZLOãVdv¦˜ÈíŠ\0ƒ°è8£¯§©v:{u¤*}(‚—>üÔ:sHgŒñ´8â˜zsS”ì>”ÆŒzq@sëŒ\ZL’£æ©ŒgœùëMŒ®qĞPC–n™¦à0vŒqRùdÁéßšiR[Æ§J\0`ƒŸJ1Èùº¹§•9éß&®9Ç9ï@\Z¦Mç2“¼zt¨dvÉÚ:Ï¥<GË¹;xçiŒŠ3€Jö´:Ñcpgì­Bã(7l`Ó‘Tµ±ì:õ¥hâXÙƒ8ï@7Šwu÷§DëgÀ“;Ô×d„Ëàç½U‚A¹¸ç>˜?J\0Ñ³p¨¡†Ôªª_s.ÁµGÍ<aJªõÍXUg*K”ğ\0Z-öv\rOzq›~HÇÌyíŠ–#qln¥šC./5ˆŞÃ\0àÔrÄzõÃ Ñ¦¸x£Šk´?–Ín5r¡Xœczô$üİ88\0¢Ë±wó“Æy§¼¿ºPSkc\0W$Óî\Z&ÍnêªÇtlO+ê8ä¨`ÄŒ®2A8«F“Í€O<\rçN–ş^ı¯¼ì%z¿“9ç\0€cH\r¢>ÏZz!;_v8ÅkéÚ\'Ú\'‰dxÔ7’eA!ó”9Ç|\njh±‹k»“uÄJ$ƒ eOà8äe†	\0à9†Ó’AÀÅUdä©Ü\0…oØXÁöf¹½$F²UöíÆĞI!Xõ‘\0\0¤ğ\'öB¾¤-ƒ¶Ù`–DÜv°(a‹™Ép§€åFÑÎ?:RŒ„‚\"¶íôI¤”ÅÑH†1\"ÈŠí½rW…U-Ô’¸ãÜe?±n#cy-–Y¼Â#i0G—¿v{<“ƒ‘Ï\0çËØ>lÕ\\»Ëc±­Øô+‹ÅGµÚcd,Ò…’@rî£\n¨Xgaê;rA U§Ê¯ulFÙ­•‹¦rNÖ€Ç\\r~ŠOj\0¡ ?{¶:â—ÎîÕ·mámBu“fÖÁUÏ´‡…# Ø\0ç+C Ï-Ävâh<ÉaBÎB•2ª	ÏÍĞx\'ph¢+IÀ\\É>¦¬Ä#pÄ“ëŠ¾4TÖ¦¨$–âgŒ„$‚ )|¹ÏÍÓ¯Ì ä.tËMÍs=¼¡MÒJrvR»º¡Æ{ão4\0$É¥³QÅáóœp¨î´‹èá>{À²ì‘–\0ù|FÌ§l\'’2:däT¯áİJÙãûK$)–óÒEFr3·æá[”Ü8ëÈÈòyemlƒŠ¥sP°3ïÍM&ø¦‰Y’hdMñ¼yÃ®HÈÔÈ=)]J0äqÀÏZ\0Î_£qÛãŒöŞpâW õçµD0ÓŸËüæ€AÏ§\\ûÓ{+‘Û¡	ÁÆy§úc9 \n­QŒdtÅ@Ğ®yQÉæ¯¼qÆ:Ô‡0ç­\0gInÊ2{ZŒ3&{ãúV“G‚sÈ5¶ªÊ}zJ\0ª¯ÈSØu*yíN:^xŠ‡\01ç€0:}(Ú;gÔg·lP qÛ¿\Zpl™Áÿ\0\n®FÕ$¯9íëÇ½=NŞÇaôkq§AŞ¤8\0uª¨s½qÏ¨æ­¤,ÍĞ÷\"€Ï?áRC“8H¶}:U»k,òÃ=o[D‘&Ôqé@·škÙØ,ï&]ˆ€+![iÉRs]f¹Oiº¼q´’*ïs…\\‘É=…`Å£^”‹ÌQÊûHH1°Üüp£Ë“>›	8ÈPHY”ºƒéVĞH€®CİxÀ¤M*á¢icc%˜0nfÀã’>}Ñ‡\\r2à8´{T‘.	ıÖ9İÇ†:å”,Q€7ò6®A*Í¼­\"6åF\rŒ1¨¦…ì|çH•£!ù)´€[€r3‘‘Ÿº}+FëKr¶³ qu$+½¾ùp c¯ÌA=2:ò2\0ybH¾VòÊò}Í@	ˆ‡Œ³çƒéWì´ë‚öÏ2“…	Â·Ê¬@6÷O·\nö¬ñ³²<ÎˆÁPØÚyãËß¿Ö€*ÊL	AÓ“Ş­M˜PçZBßi„Â- Ş\0ÁPF6çø×¶9«m¥³ª”ÈŒœîPğ1èùúg¦(	f&³%»àS(?8ïõ«vÖÉö| \'æÀ%xR2Î?CCÙ´ï\ZE±¨b-Á\0Œ€3zc<g§4ƒÑyr1M%fİüGÒ§ƒNº‘Y u~p\nä†={:¸ëìj8OJd”À,ÙÆNp8ö?•\0Tš1çõ¨:cƒÓÒµZÎGŒ’6`¬Bg;€ÎH=;ı¾•údñ«,EÔ¸Ø¬Oİ<ã9ëúñ@9ğ¤ÆF:*^Ÿ½Œç@\0éš\n‚:‘éÆqK‚:\nS:\0a“:PİHçùSÏ|øRQÀúĞq…Áã½4QŠ“8À¦àñÇj\0n1ØÒ`ûãÖœEä…\07şµ/|{b§Æ?>”Ö]¿áš\0¡,|töª2Ç×µ­\"ªsÆ9ã§J\0Ê‘9å{úT@`Ár@Å_•1ØU77CÇ§z\0ooÃÒšÜœc§½)g®{RùH çpÀÁ¨öğ\0íÏZ‘—Œã¿Jk&{P§yëéÍH«Ç|uéÆ)BúôÇLTñ¯|\Z\0š5úuíV£Nô¨¢L3éW!Ls”\0İÎ½1‚G^µacö§•q×LÇßÓLxà{U½¾ÇŞ›³\Z\0§°c…è1FÎ¿¦*ÖÎ1Í!@0Gë@|¾rGçJÛ½YØqÁ<zSv÷Ç­\0Vòğ ¡ô \n³å@ÇjO/´Sañ !<ãÿ\0×VÌc\'ƒùÒyC¸4SÊ#ã)¾^;qüªè‹QÇ±ı(‘‹Ÿº\Zo“íÓÚ¯yxü;Ry]±øPA%Œne{.{Q FÆ^:Ò˜n^Iö7Ojs*¤äc?Z\0U@›Hù@8%MDêÙ%6Œ*V\"”xÓx^@ëëõ \n³HÆ<SÇùæ³òLãå-ÈİøÖŒÉ’I\'t¬ù[ƒ›œwÅ\0h«áT(AŸz‘T‚€øëš£şï%A•eeuÂ)\0ô \rTÔŞØBÖ°JŠÅÓÌRDl@à‹Ã8é×3ØëFŞêİå†2¢Ë>d‘¡Ríãjô ç®hDå¡Ú‹©úTg\0#$Ğ•­û­İ»ËQ[Àìík+0ÉÀ\0RÊEìX/Ú\'µ²É-µÁ¹VpIw;s“~àüÍg¢¬‡$€•b4\\\0FyÆM\0kÁ¬Åo4Kºè$JÌğûŒ¬¿6òHàÈ9<T#Ô%†ÖK?.…÷ÀüÛFä×sUŞİ7>26Î›®Twõ öwsÙ2IG C‘¹Øb0J• Œ8<g8‰®ççÎAcÄ±€v\"²@ğ\"}Ï\'$œÀÀí8œb,`œœã­\0Y]NxmÒ)\"‚TD\n¡Ó#!ƒc<‘æ0Áãi³j³İ]¦ù…eŒ*‚Ù–ï×÷‡ATåm„ñ00j†`\0Û¨új­´v’ZA<¨]¸C;J°9ØuÇ=*µÌÖ·Æí£BÛËÚ6z©Q”òé)\n”,»‰ç©¦ªåÀ89>”~\rE\Z9!K£½¤GœUÛ\\6v¼ãë˜šìı¼Ë<Ê¾RDQÔà…UQÈ ƒòƒG~ÄŠ§+·›ŒĞ:ŒóÁ \rvÕä …›Í’F?6HtË×@?{<ç$š%Õ•´æ¶–ÒÙ×tj‘l!6)”àwƒrqÉ99ÍVk=ª”³0,¼`gñæ€5u3ZÄ¾\\ovÑH;&4åöàà‚¯Gãj“kr¼Ò\\kešQ šU´¥Õ“’ppÌp»Fqp1}\"–ş.8íÅ^²´ÙX“–lš\0ĞG–êhÁX–Ş3\Zœ³7<ú±ı*M²DUd“€:Ôğ\"GÂ.;õ©V çI\Z\0¯¶)!³îj“+ómÏ|Uõˆ$ ğFzTS ‘ÜĞP}…=qÁ?Jˆ@ìMH~]ª:Š\0“ Aš#Ü9â“ø×ò«9\n8ç­\0@cÀ9=:UKÖB[<\0=3Z;1ÆzJÆÔ]¤”pzù \n[Xgp\09ëA9Á#4âªr1ƒØúQ´y»2~¹æ€s¸	?•=JçğÅ5P\r„œädĞ \rªû¤ç>ô£o\nà\r¸ì+ZÚØ1<{õÎy²@NÇ<zÖÎ—©HÌãS‘×¥\0tÀ€s‘•£@EééÇ5°Fã5:6Ğ‘Ş€1|F6Å uî+2{ûÉDÀÉşº%‰¾cÆ:°çï6_\'¿˜ÿ\0Ş5©âi<Ä¶Ê8¬ 3`s´=®§=¤PC•1Á!m¬	ğ0Ï+ËqşÛúš}¾¥på|ÒZä|ìÄ’Ny#¤	ôfê¾3\'=IëùŠ¬¹\r´Š\0ÖŸPkò›´çÓ“×ïg,}I\'½hIªİÉwß“n†;ƒ9Qœ;sÔôùækßüÃ<b¬Å#AûÜ@©©;4Shüè™?y´’Bã®@20xëÉÍØ5)J Ë2(U3ó¤1ÓŒİ«Û;²I!íW­œE3 E*ã‘@\Zr]Gå´+B…He\\œT“É?ÜZŠçQ“Ì¢12Äs‚§6ªyä£ó5Wùé–ÏÂ¥H9È\'8Å\0hØ]#ÈÉ?”çqÉ!2zòN\\ôúÔ·NÉ œ,R&ÀŒ\0\0ç¨è+×ÊvuÇËÈâ§KÇîE\0hE{4’>õ…Ébë•?!=úóĞuÎqîrCp‘1ŠX£1¶	vŒàğzòG¥@[÷ŠÜy©N»qÇZ\0½ö•…B°BpBœ`…9È\0qÜöïP›·šI\nªÍ#gĞ¸Áª>à „œæ®²íE\nq@Ù!Hè*7FN\nãĞÕ–Ï˜sš•”‚;Po©Å;©ôæ¬•½ê¾xÁ Æ8Ço­\0t?Ò›õìas@	Ó‘Í&=²~”«óíÍãŠ\0N;ÏJNqŒı)Àzv¤<´\0›~”˜ç<c§4îÿ\0CIéŒĞN¥U•N8Àõâ®7#r=*¤‡9\n\0Î?ıUJEÇo^;UùOOÆ¨ÉŒ:PD}>¹¥Ø3øĞ?™ÅJé@“¯8 ÅÇAŸÏšPjhĞ6NÜP ‹:ãôˆú}M\\1.ì{b„ŒqÓŸj\0H“G½\\:~•c5i ã\'¾(@ãŒS°9Î1@FG¥;ãÛ4\0Â£‘”ÜéqRàŸZAÊĞ\nı:SHÎ9üêNÇñ¤w4ÑíùPWJ½!RG\0İ¹†1éI´F?Ïjv:şTƒxg¥\0&Ü\0ïI°zúÓ™ŠZ@wc4\0›x»\nÀè}9¥-ò†Ç=)x$.8 ıj6Aíš]Çh\'“Fò ÿÙ','s','A'),(2,'jesj','skjd','j183293','2014-02-21','jkk','94','34',NULL,'','','A');
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
INSERT INTO `reservaciones` VALUES (1,5,1,'2014-02-18','r1',1,'2014-02-28','08:00:00','03:00:00',2,'•Ú]','nada','A'),(2,5,1,'2014-02-18','s03',1,'2014-02-26','06:15:00','00:45:00',33,'•Ú]','asd','A'),(3,14,1,'2014-02-24','R04',1,'2014-02-26','07:00:00','00:30:00',300,'•Ú]','readyyy','A'),(4,16,1,'2014-02-24','R04',1,'2014-02-27','07:00:00','01:15:00',400,'•Ú]','dsad','A');
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
