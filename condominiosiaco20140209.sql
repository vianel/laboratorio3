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
  `condominio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_culminacion` date NOT NULL,
  `sueldo` float NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_88` (`usuario_id`),
  KEY `fk_relationship_92` (`condominio_id`),
  CONSTRAINT `fk_relationship_88` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_relationship_92` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'18560575','Jose','Jerez','Barquisimeto','(0251)-51125','(0414)-92012','jerez.uno@gmail.com','M','2011-01-10','ÿØÿà\0JFIF\0\0\0d\0d\0\0ÿì\0Ducky\0\0\0\0\0<\0\0ÿî\0Adobe\0dÀ\0\0\0ÿÛ\0„\0		\n\n\n\n\r\r\Z\ZÿÀ\0ÎĞ\0ÿÄ\0Ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n	\0\0\"2BRb#!1r3C$Q‚SA’cs“4%aqÑ¢ƒÓ”5‘¡±²³DTÒ£U&VÁáÂ„Ãdt´u…6\'7\0\0\0\0!1QAa\"2ğ‘ÑRq±ÁBr3¡áñ‚Òâ#$ÿÚ\0\0\0?\0á!×Hw`ğA°˜[#Û@8@-¤4[;b€H	Ca\0ÑmÊ²° ğA°}›ëßA°V,„ÀX²Ùá°€}ˆhô€k€Gì­‚ú¨,ìì 2ŞrxÈÈôÈ†Y»@,L‹[XøGÛ¸æRÛ³…Ü[sâºV,d‹vÖM`X‚e-»\"ÃñE{[°,9I·ôâ™	mµ-Ü-m:Ù­ÙE;l¾O•sJğ0ì)mUÔß•,ç²QBÇD¬EM›©Ï6àïªº=Š™C÷ô»¶ŠÅ©ë`¨Ú:?2>;—:ğlvùœƒŠ±=|Kpñ£Ş—3ƒ#b–DcjÅO¹ÕØ†óÙGºšì#C8{x z<½\0¯@<6\nô@=\0	\0¬CG 0`\ZWEópx Ø-•šö\0Ñıßiáö\0@$4[ÛH° û\rÂQ±`Aàƒ`û7ÖAè\0v–[?q\0Ò`@yÛX0ûû­ƒÖX€!¦n-¤¬¼´á{åçßì#)mÚÃGÙ¼ÖfRÛ³2³Š=´©”Ö¶HäïÚ 9cĞÏ½X\0hÈøÛ—î€&Ã\n_Ş×á–²òdÓ‚‘æ_Î,k?(ÊÛ1ÖÀpóùYÇ×ÛG©±ÂÙˆ¯†¶„ÁK·ğ›có<½œFö<¸/}™ûµW[y±,T¶eCtÁÖ¬VFÜ¥˜ãNñLy*e(O»¬³²2lljaãïş7ÃPßVM‰¼{r£ß°Ck°DCÑmæhôS]‰]Æ÷Wì!Ew+İŒa°(S[¢àŸP\0µ\0ô@=\0	\0¬µ\0ô4p«/™©rd%\r…–ËtĞ@<\nõ¦Î@z/ ä €}‹ÀƒÃmÂUHhfßA}‹- <†ÏÂúĞô¬¹\0à\rÄL·i\Zo•€•2š×j±˜FÛk3(-¹|€û	S)mpÒ$·vÅ†Â›Ï–ˆâ€g€œøŞéXk!İ‡iÛİ“eˆ&²\\²Ö€â<f›–2‰Ù éËûbŒŒª§C}ò°#X·]Ä³™X–#y±øŠšìKº?+ŒÑÅ#³4ìeŒàÿ\0Ş­ğ¸ú\\½ıVµbsV:\"iUÖgê2­‘\r¶Ó¤ÊªµÈOØÂv’?ÉÚµñ3;0yó69¢ğ€Á^t|EOocò°g?Á‘8 ıì:E»è/?Œ™{®‹ÌÙİËviS¨İ[W±ò­Ê¤µŞ•5ti·(¥É¸JTÕu# Nñ0ÔIyQêi›ˆËÏŒ‚óL2u`ëT²ÑèÂè±º€Á\0.¬¾n²ird¾áYl\0\0·	i²\r&€”^Aàƒ`Ù@1\0ğÛXx ØJ;_¸²ÂäA¶†`@^ƒ õ–Ï†°Ùà€ÕĞ‡¤\Z´j@Zã >éëØJ™gdµpa¶\'İ%L¹›n²\0m Ğ³2—¼õÇfÙıšTÈô1Ş{¿£¦ÂHÍğ†È­X€Ãfg}¥††2>)0#óZÿ\0&•˜cqÌ|!îYÊ	s À£#*™\"í…×­V­RY|ÎU¾©}uUh/fO$\ZÚö	]XÂ;NY÷ˆZÀlUVøKjdÉ}ƒ½¢ØGÆ÷8*è=ôzŸ=íÏvµ–\'fB;e^dŒ—5É6È¿m/2ÓróÜvÅÈ.åà½¾Ã‰S+ôTÈ“ßŠí—ƒ±*jİ6ávÖT\nûËZ\\Õu;˜/¾³½Jø¯pDyñö\r\nªö„mï%œ]Ä-€uˆ Õ@+Ğü6×UòĞÜyÈ/s;µa‚=†å(éÔ€ ×ÓJV½=$¦Û¶ÑlC«£F¸×ï|ÎgÏ¼Š÷+=F ãXVL*Z=5¥+ÓÓE{&gŞİZç_½3œr¶ä¿+es$$D&»¯8Mú\\¥kJ\r£_¡fÛmZuÖ¾ñ36Œ³\\ÛËµÁdœ„u§—\r§h5¸hA^ŠÛZÒ4[×yŸ%öuV\"¶¯‹(5¦¤>ËP º†ƒ`@m¡¢0Ô€V,e˜‚³¶Œ›}—##o£#\r)rœŞa“áaò\n„B1\nZé*Ô‹Ğ§™œâÒ”Š{ßÃQO&y–Š0şğ×ó¯3fıôıèeù?Í,7Sdí)NšÑ—Zp¿•¾¿ÉDr=´ÏÛ0ÅÎ*Ä.…imj%ÓJÒ´­=JúiTDälÕ5çÌ\01Ze*Ô“¯q\'‡ÕCÓÀ.Ø@8s`Òeí$t×;`\rér^Ûµ¸ø[¿œDÊ\rûò³îÆÀ©”>Ù2CÍˆÙp¥E²j¼ò\\+øZ?(i±\\‚‰\Z^D¾Ràˆù¬åäÊïËĞb…î•çöˆÉs#NHXĞ¬5æn[¬¬@ÀWxöÚ•Xª„ËDïu°UVú²òó5 ıUS[Û²™<«nŸ½xıµu5¡»/9ë]ÊØ¢[]TDåÖŠdQ=®oáÚYô{îWê¿}ƒÜlIßa¬ˆºWL	ĞA±q±ãql¿BÅ¤ú5|±ÄÀ¼‹ŒÔ¶…Ô²ÁÖq^=Øö·gÚ)oÃx)Ü¼Ãúâ•‡b÷_oÔz2’ñ²˜tÂn‹Ÿ6Rü8ñ¶ët¯^zåï¾ÄÌ0ÁY¨Á\"aLmålÓÌ>\0`—0éõû\0ûzÓg ì Ö@`)Z“”§IV½¥=uªê¾^±—lò1—bä\r·†­Ÿ„z¶××ép* Ùh›æêêµtV&9öş/|òfD¼“mÆ#µŠÇE:iOS‡ZúkZ/+h‹f^üV¶›V±Ï·ği<š¹¬,ÖËIĞãĞ©ü4¥Vby–·ÖcÖ\'ì«Ÿy“7š²b£İÊz¥B­iÓÓZz½Zï™ËÍ{lÕO_±“…’xª#N’ Öµ­)ü´¢mvÄÎlé^•Ìà+:û¢ÓZŒ½TL™ÄfSk¤ÚqVƒ€™OY·ş’şd¯ÇBÿ\0XóFs†í:×JÓÓJÓø+h˜àš¦“‰NÖyR‡Z€tî•kÓşªUbwUEzW˜û®Xú­/â¯óÒ‰_#Ùé^>‡\"SaR¥¥Ñéè¥kÓşÄ|ÏRÑF…\"@^WIW£ı(›á}{Z3äÅv9P\\¥=>ªÓÕUì[,ìÕ4]Ér¯ß´­=à?şÊ,©¹ÿ\0†?ÜÓùƒÏ^UšÈÆ ğç:|B¸İ6ıÍ¼ç÷šM­\'ìşå_-yĞSeY&Â¬•u<Ğn…+]«zj\'J¥˜òÍ5Òñø\'Ÿ¤¯üÌåØÙ<+¹Añ°è<g”ï˜*ĞzkZzê4­+ô\"òÑö½ëÛëş›Ò\\T >Zú\n”éõzúí[¯h{\\|‚ŸE+Õ­}(ö{`›ÇI¥:kQ§ğt×ù—Ğ÷ôÖû¤ÇğŠ¿û—¾Ğòzö*c^§¨‡ıÌ¼÷ƒ>	*±%ºÒ…ÑQ¯á¢ö\',_\\ÔlHÏ‘mk>º\\“–·‡¸ÍñK”;îµ—$Á ?ßJ™AnUNÏà\r¶•2n­yQKÊÜ}sû4Ù×€µÄá8öKÉÿ\0fÂTìÀj ½ğZjÀXÉS+\0e½‡Kú°FJ™2@v…[j²¯•ƒ,Û4*¬3S³Æ^èQX3ÕŸœôçıÖª©¬V~tgÊş)*éb.ÎKÃ`UÔ²©dF}òÖZt¶¢\rnL‹¦µ\ruúÏ»_¨˜N(q]îC¶qñ‘ÀnëÀ…dEGÓ0\Z¶û×†Åg\ZÑ=;	>9•vÂ0lY.>I´î´NŒ·]­D­¦EÌìu±*ku„¶be£ğ]¿á¸µ^§,kØ×áÌ6el^ª®Ì%µ2”ñ¬k0%©‡³q2[\02Ğ•0§L´õÀ´)jØóg¨…UDi­4q ´Ù$#oß1n­)Kéé¯Óø?Öº›ÿ\0$¾w£š¹ú¾åy<²x\\||o†®d\"ôÌ&Ù =ë¥J†å´©tV´¦ÒçWäEãdÍ³ë>‚¥Íå8Ò3”‡âª¨ø–(éÙÓ^M@ı=+ÙÀ¼Z.ºSâäà¤–ÃÑ‘!£şª5NšôÛu(!ÓøQ˜ÅœıàX|Ç–ùä)ê92zD+Ï²I½\"vkŸº?ÅEçcÄ\\«ËÄ^±‡+ıM0½ûa´b6ÿ\0gÿ\0\'ÅLÒAã¥j¡tzı*•Ì`¶Ø¥¢eôŸ$óæ{#ˆ“6x1Šh´.	‘P}U¸Î•è\ZziÑë­Ñ\'nêk­¢#3k9Ÿ›œ±XÁW£<<ÊŒ¨ÖìÚõziø4¹êşªÎ$Êÿ\0ûuÇóRpßòVr^Ë	“¢YWãÈpÀé¨×¦­¦ƒQ¯áúV+<<ìé‹ïˆŸ§ñÊ\\Ğÿ\0>VV39‰eÈà×O‰lJÑ*•)m*u:‰úziZà^Ää®Ç^:øµ-9WòÄè<ÍË³97&í‘º¸Éuè©U¶ëhú}5WGá\n¯#İ®ulµÿ\0WŸÛöä°0ãy{Ë2ó2Å³ÏJº<FéÑZM}?M=ŠˆøÆÈ¤qHåÃr¹‡²¹ŸpêíjdFézÌÊ½$_ËU¸® lİœWòÕ¿ò_§ïßO¯€ÿ\0û(³ö›oøcıÉüô¥+25+ÿ\0BÏÿ\0šq{™åá·û¿ø¹Ö4)I-Tiéôÿ\0£¢¨·†ºñø¡ôİû‚\\}¯¹õtúú|>Ÿáõ/>Æ#óÿ\0ïşj>{rµò¯–ºwx] %äø‡hÇbÿ\0ßş\'ãhë¾JLŒĞUÇ^’\"ÛaJ‘VST )é­jô‹Çÿ\0×ôò•ä|ß1àùŞ;ä©íĞ\Zz[v¦#ZTˆ ©é¥)éúW¹˜‚­¢—Ùi´â>¬Æ˜¹Ã™2xÌ~CäW¡º2ø@Ãôs…S UÂé­”­:.õt¬ÌÌ¨Ó£VªÚÕ¶sÇ˜l¹Ÿœ¹Ã•°ØƒÉÇ&¨á8-<åêeJK^PÒ«s2“WST×ñÛ×÷8ï<süÎtåäcÒ$ªt2ó#B*×HÖ•¡ô•§×J¬Ç3•v¥ukŠVsÊ|5Éhø$J]×á©tÛa®[\0•(2¢Èd¯®³{Ì¹/ÊÃÇßLƒ!kÅ7Ç¾”³m¬á|ÓİbRÚÃ¼HÅà²ˆ†pA•rï—Ğ\0›0DÉo–‹¿8†ªà>GŞ¡UliÃİMË.5Á`##*ïİ.³Z…Ê¶w,0&ªÓ¼™«/‘Æë±¡ş±Yªé¯E$¸İïó*fèoA1¬4×ÇEëßg”®Nûò8?4pÁoÈIp¨kZèMÌhÜ	·z6QîµÜƒ7âµ 7ıâBËr`XZ-Aš¸<4è=ÄIu…„G›Ğ†—*k\"ÂcñO°§Ù5ta5Ã÷Áú»‰UŒ>pJŠgx–x¯Õd{dØóø[wXi–*·j13Ûám^™º™uºÛ0½±³ÔÑuë³0‰ØÖØ`µdJØ“\"^ëXdÄ?lkJôÒ½§ª«·gÊWË·yoIdá®V#úŠµ­}?\næìˆ‹ğïSdÏ^³iÿ\0Wñ7ÏÒ‘p&L»H¬t×¢´étÑH‰¿\"û&4Zk8ŸoàÔy,Û`&Ö½&wF¸«é­kVËÓZ¬Ç™3u¿&gı?ÁjØî÷<z=Rdtş‹Ï«ËL|šÿ\0²\0ù›€Ëg9ÙÏµh*vÑÖÙ¥+^f¨úK:&±òE§Ü‹”òÆ¸~U‰˜–ß×¤Ò7p]\ZôPªU¯§§‡êèü(›ÛÎNÕ:m³ÒµñË¤/†äø<½™X0)&HÒµ¡›•­©[Dökhÿ\0\"1\"»-}“zFqÀ^lÇcsœ‹I‰8p5è½5>hà•kAõ\r¥ÓüÉæÓy×»Œ{¥Ãç²å™åE–EÌ]+CA­„-pÂ„t­kÒU¡zj½‰áåéXßéüÜÿ\0‰ÜçšÍ¿ÈñsX9k$xs@)KÄOM·ôt§Jt\"g†tk§Í4´~(ğãŞ^är½±ÍÃ«NRc!AÚğÈiôÒ£è¯Ò‹DF0}/k×g¿îk¿Ì#Ò˜È„VÜ¨¶›°?\0ñ\\*iü%JQ{™>«Ïéí1ægQ\rš6İ)E©–5×éŞL\r~ş¥)ª¼ÿ\0ÙEµU¿á÷5¼íÈÙiË­;¦Z,>N	TÓs¦–ú5Sğ¢bs˜{[Öµ˜´Læsş\nü\'“£\ZP9’Ñ²5¥IˆÜB©Ò•Ù©ÚWğôQ³>Gê\"#ğÆ?µeæo2Å<+.•PB=\r5ÓK[¯ĞG^GÑüh´ı:ÔÌÅ¿Óõ“ù‹?7å¬cU’mD`=l›.šÓ¦Óô/&8+M¢»ïíÇ“ë#ËU×ÅR‘ò\rÉiæ\0­.‡)$\nW×JÖÖîèGˆ{í;sä›9ÌyÌ!ây…‡DgÌu°uÊ€Ö•¡¥^­:=aEìÏ]+}¶×>#şÌÍ.`Ës397Í8Ğ@qÂe±¥c“Ô:)OGMß…Ş½zm®kXœGâşöÏÌÎuÏr~a¦qïQ¶(<cVÁÂ¸Ş6ıS³DLÎpNªëÙªoxÎ\'ø+¤¹Ì«³¤\roá¼gZPnqÂ¸«ÑOE=5X¾È¶\"±øk\rÄn,{a*\\½—‘ŸÂj÷t%IU–\nFIüRÆµ§ÍM†‚$?Ö½ãø‰Rdã%“¶é=[ÀÖ^p{hø†`>ş¹˜c0€wö¦F„0·Bk&=İ´e|°´vu£-e|Vû¨ÈÉ“™´VöPB’\\k‘Cb¬¾@\0HÀY¦å^Œû0}ÓUMĞŞ†å¬c@k\0ÊØ­ÕÃ?5Îìíšª©c™0µ×^ú‹T¹{ù/m.5å¹ÁÇğR½Ûß%^®FÈdàÊ°‡@\ZğÛpR5Ø‰{„¬ğÈo2Ö—/2³\0âÇ×­b±•O1/WÎ=ÚöÛJÛ³‘›|^áèc~–RX>Á[£á«Ğügã§ğ°“4ËuÙ‰nğÙ }«3±v:Û3Ó ö\"]î…‰±&Ä„>ÂÓGõĞØ—ÌCYÉüï‘åªÔà´ïAºİµ­‡ÑZAÒ´õÑK³Vg0èéìÒ)ézûFLæîyËsCÃY•7¥Iç-¥jÓQ\ZR”õÕÕ‰Ì¼İÙ­«éJú×9[rï™™¾]„LAuÆ/ QŞ*”è\ZÖúW£Ö±:§<JÔkµb/\\Ì\'oÎàÃÉE½ê5”39¡Ãb¼R:ZU©V—M)º¼ømõªÓ˜ŸIÍ|~ÙY5çß52Ëm§„\Z\0†‰^Š\r:)NšMQğÛêÄíëOš[öÿ\0Ø.SÎœîY¦œó¯·ğ’Ğ‚”p)Z	VÊjè¡WÑ_Bóâ·Õºv:ô™šÖÙ?»÷©ùÃÌ,ß3:ÈáÉé\"¢ÛuÆµ+DZ¥)ë/ZÕuó™/gfµ§¦˜šò7–¼ËÍàqÏEŠûI#@’4-¥G¦¼ZEkBôô/\'\\çƒc~»V>JÌÚ¿oí\'Fó;(Æü#Dàc¤MØ¶3ZV´¯O´¾›4õ,|sã&OgTÛŞk>ñû~Ü$Çy›™…‚Û†e]Ç‹ÃiÀ­N”¡t”©«ğ­{:çê>}V˜½«>ñû}TØ¬äˆÙ*ä¡‹ôtV¢MÖ•\núiÑ_Wá^Z­Ó~ffc‹æŞrÊó4‘vy“ïôÄ-· +ZĞh-Ğië¯­{Xûd»Z±_JF#*õSRÂû–¹§#ËïÒ\\*Ìr€i:t-r„+3\rÅ«5õ¼fGçg5‰Wæ\\­~šE‰ÿ\0ekÖßRæú#ı6ıÿ\0şA¦yÏÍ²«c&E:iZVÀb=}=¶†äzOÕçÉª<Rgûó,l‰y9òEù.YA+ÄµÚõİZ×ÓZ­DD3kìÙ13ÄGˆm0hsbÆ|…ŠÖî[B…_]Fÿ\0HôıJˆŸ±FÏŠüŞ?Ü˜üËæ`&‚Q›ÀÑt€ƒmO¯ ¥)ÓZz:kéZõúËÙZÇ_ï‘|ÌËÀGÃ¼éµ¡ÆPj”¥\n”­â4:ô__]Vpg½+i½køåM†Q\r·Z§A…hC_G¢£^šWÓè^Zr4b±ÊÛ™¹«7Ì³\Z<ÖT›¡p¶éFÄªt[ ÓhªŒı¥ŞiJzR1-Fj„å:\rOis÷ÎVNÉá´¨„Øeò~/-<\"EØ³¼q2 a3Üªx–‚\\]fñQin¸›%½µ- Èx«JûP2\">(¯1@ÊÈ#u+äC@ŒˆÉ¬dÙl e_àø®¬=J`Ø´v (¤j%“!_-”ÎYÍôø–dH~9½¾~í6$©e3;F£­ÒÇÀ¶?·{Z³ùmV\\Óé({ø–q#C4^TÌ~9²àÈ\rÃM¼åšpÕÇàf!ÿ\0Ì³ï;!u-şÃ>¢\"ÏpFë\rˆ™õ‡m#aõ	–¾,¦kK¹wxˆeúĞwk7ƒær¬àñïCß3¡\Zä©Œ)ä@á_`ëû5f´{EârN1 ?á©{:²«­³\rìsã°¡ÛWcEÍ\rûà•EÙa¾ÙûB€Àß¡v%óx\\RäØJN²Ëp™£AwˆoÖğ©ô!ç¬\nŸBÃ~¥ÑA@ÃÛ,ÂNŠ%Ixå¸KĞ•&ÁıCg‚÷èCXGhßêCÏX>Ñú0÷¡Nè¥}k æÀiølCŞŠ}E–SFë 4\\½¡;âOqbRö-†€lÒåÍ›eœæLÅ¡áÚ+Ş5äA˜Ë}ÃAÅ÷Æ›0Ú€72/ÖrÌ1 ŒÉÅèÁÙD²K\0ğ%‘ÌÆ\rôœa¦ÄaŒ“@Ø»¡\0æúÊ	HGêõƒBÎ;t¼ãhÙY2“™îl3²#q]VâYù0áà{´È’¥‡œÏ`3¾k¯ìºûµÆ¡š—uÕV*X]7ØVk—3±‰k†°¢º(Ù*f?\n©Øß4ïa7LäÜyÃÉÂZŞ6•ØŒ×¶[	Øáx˜şåïè(\"Ëğ¯³½°ÓbÃ¸,2Ñ¶µvêg0…ĞïF´»ƒá¤ü¼wº†·º\ZëÎVÙ6x{Å,I» ¥Ãâ‡?¬[®öm¡Hó:´*kod¶®\ZYŸ¸j]õ_Ö¿-/ûŠb³À´™‚yæ}T?½u¥óAµ´—&Â^ğ–\rl ØÀZĞ@-ô—¬´W xKÙ•“µ*M!©ÁÖ Ø{bÀ°Ù\Zö,¼?BÆ‚ãì\"eªJÂ<>+¡`¥L—¶í\\vxQÀ7Ò½œ½²|‡œ¶Æ†óG±u–›Ù…áe-¼ş#}EÑëNSö¶eš‰æDâz;zùC¯f«’ùŒ´ 1-ağÔw¢í7YæàãÆ\rµ\ráLÈ¾[ØàÚˆy¹ &[ØKléG«Y8»°Q“ONÊ&J¼Ã½;Ò¦\r‰!İˆf’‹!Aî³h¥aíeŸÈjvÄeMeXÔmN½Ô÷k3\"ÖSåƒOë¸©Ó)lÉc#qó }µfë2ÖÎŒß‚>À)¢ÁÍ$FÖëÖ®Æ›!´À³s_]+±c5Â\'£83%Ù¯Bö¶+uYùÅ‡j¦©£†×—¤ñağ~Áø‹záÖëX¤3Â$k²¢8pOú´‰ ²ÌŸ€6zŠ6Mº˜Ã¶×Oß9KÕ¾\Z‰ã°w‡¾\0½Cœ.Ù|¥Ä÷­Ÿ°‹KÚ…ÌãxZÁ7UÊÛP˜şéĞx?¬ZìNYÕÄ¶qã´uÌ˜Äºúm˜C‘fÛ\rôBÜ‚½6aÏmv%óp˜;irl%hßX6‚\r°¼  <=­•–ŠÍ(ì¯dAÉRl	gÙA°r\r‡ }¤€.4ŞÙXlßYxxjİ@NÏP*eœ´xÆxM_¾iS(wİk3òŠÀØMøÒí•ÃXĞŠ7‚>2©.{æo‹v9ƒ^çâ\'ôçõÈ~@òÇ—3¸—^”?Ö]°ºwİˆCzáŸ‰’ıÍæ	IKÆ_ggm\rëß—rÆObt00-ãí]8‘CÁ¿¡*ÜĞ2õÉ°–÷vìª}XöD{hõÁÌ.=	sb@ÈJ˜2$CZ£¥7c…Îšƒ¥…­\"Ğ]e—\Z–Ò¦²G\rÎ×qfd¯fK˜O„Ó¦j­2õYÊ×\nh×OÛf\Z<Ø[–}‹Õ³×7œÍ‘Zë®Æ›$´À³kI]‹ª—\ZviÛ¶v\\Ãm€ºz¼9¼<åÌµ©ûõÄ,éÙ°Éã\\·Œ™¦Îü+\"=l‹löIYÇÆ±–|âqÆ=šø†ŠYíáŠy—Ø¾;EÌ9Ş³9AJaµå¸×@?ÄPïœ.¥2	q‰NÇÜ½y¶F¥©Æc˜ÿ\0»J­ÍµY£dØ›aì\Z²\')6pĞcÛ\0ÔÛ£z¶ÊÊ@6M‰PéVU¦\Z/M…U‡<ú«­/˜„»IRdi\r¥\rH	»hlôXh¯@ 45	GaÁè–b\0K“b,m Ø<6ĞÌ¡Á!“5 f‹^h\\dn.»RÊÙf£ÉN€[`!ÌÙfª<>Ø´VM–Y¡,şCš8îï­VE˜sûó•¢Í‚ĞŞÌîÜê*ktÖ«#–•†hÎO!â,qÃûEeìto,²¼XÄiş0E;®¹º.êÙĞ\"İ¥)•À§`&Ar°kR·)ò#Ã\rëÌœ›ê¢ ZBË«¶¦İê•XihÃ} âˆ€ v‰¯,Ä+#Æâ»ØSXØ±ù6xM¢°Tòç™à2°\0vÕU•:x\\rœÎİ€XÛbö–pîg{f•RjÁdã]\ru©fbá£pš°Å+mˆK‡q»§mf¶?6Fá]u×ëYÌìB—ä›pÜÔ›ÛæéN%Û0ÆÜè¶ÿ\0¼_?³‰w&sÖs\Zì¦»€ÏúiırŠ x§]ğúÌ>]3v¼½öf¹†d¨/ğZhY\rµV¾P{a¥ä¹Ÿ/ÁÕ¬=ªáv‹dnMğ{`BÆ¹lD}qlê\Z6H‡sWï‚mlÍËŞØf•´kZèöÒ¡Ó¤«Ãa6R\\ëiu¥ó0”¤ÈÒLˆ †Î@#3Xh‚ô¶vĞÔPpwl]{-Äi*Lˆ?si`AÈ6C0`–ò\rƒÌÌ´!’@>õ—‚#³Å+7\Z¬&(ß \0ØûD´,ÜA€Û`!ÍÙe˜3¾´2g†»BUó Zk1K:Y-2ãÕ‡ÎyzÃ­:ô\"+ÁY«y´å¼gñÓe²é\rÿ\0f¦ìì3¯­Óq‡y©`Ù]²	\\¬âiÚTVQåd;5’³ñX²À-Snƒ5J†pp\nşºZò[µç€ŠÅå˜‘XæA¦ŒÍMb¦Ê|ô›š°pnXùñflì#*g†¯Âáxô^§µ‹Ú©Ì³û.8ø^¨š°¹–{ öÕ”³q8‘œám+mˆáµë5·/&tlĞö_­g7±S:gƒİµvÎa‰Ä»_,=i5Ôx/_?Ûâ]Í3˜]s)¼ŒP3lëmÅ>ü½³ÛÄæa<z\0İïcM½¡-¬Î<S\r1èåxØ™Òåû`? IE¤¾ıp»£lµyèÎbw®u%aGş£À‹È9®õ£ÜF«3uTvM©]‹Ól(»=@¾•©*ùwñlM…ô—7Ù]ÎÄ%h.A±	PÒS@{õ ä‚Pˆ<=¤—ZËP}— Ø+0”\0í@Áö,5lz’Õ—„€—¼+\0-BëçAß÷‰R›u\r\0\"´¢¹•ìv[\"M‚æGYhì £ˆ&€@`ZÔLµî¬ŠaİajTÈ÷Î5†¶Ó-aXfC	Œ¤‡£³SYUe®ÄÀ¶Í+5‚­+Û\0ESYMh+ÖbÏ0pOÛ$È°À†§°î€-k~ìú¦0»mª¬ƒ7h1Qîƒë,ü†\\k]ªX…Uì÷®¯JÚ7\'3„!7ĞUjÏää˜Ôª×±ğøò¬·}*Eå¢æQ\ZßX±\ZøUsu^‹ÆÓu\rœ°ï3Å€¶ïTI«¶a¸6L„W÷§]{o&KÏ\\OzìtÜÎÃ\0|àv×Nşè]{–äñq¡ùÃíyw4O‹ø±Z2Ø0\\jÇ/lÁsü±ŞÑzìu§„¶d|ÅÌ0ì‘.½ëïqµÔÓ7J¿’$¹mŸ£JìA½yu‰aÅ‹×¼\n!ÖWÁı]£=Í	± CAlÃE¤+å²bÿ\0`Ó5HîéeV³r°}„.×áÌAuœX‚ˆ=œwĞ íô†ÚQ±/A±†­Õ– àÒƒ`ôƒï@Á^°Ä<A°z•öÊÕ—„€9Ú¯%¹lù:€rÏ}.\\ÎÅ›ØŒèD9ó+ˆ€	\\È».^€¯vĞ\0È“ÂŞÖ•2×¢²FH÷	*dz+şmòÖHö7 Ã´ƒMèh£…¯BÖ\nÉH’Â20æ\0ï$E†½·z©±a€’ÍÆ:ßQf·kÕ6;™âØé_íª«#Õe!àwXl,n‚k*,³Ü&¬RÄ)¬‡ÇğÅ£x÷Å•’æq_¼Ğnªª¥½ÅÛZ“b\ZXŒSiR—lˆm¿” ,Yœ*¹İîêÎÅéº†¾YF‚âˆ}uDšÒ²ÉßbL…h³ŞšöŞL—9çCùƒì.ÇMÌì0±õHí®ü&×•ÊsR#ŞÚáö¼ºZåÒ0‡Åaí‚åàë+yĞ\0¡ƒÆ:Wh”¶p.c—â²ÇfÀhmw´Ã™¶VXÃ6¥Gy+±uåÙ`½ÇÆ´vîX¸SØxİ:CJ™ìoÄõÑi\0²lì~\"n©ã‡p`´«Y’Ïº.×áÍÃRë9I(\Z ,<ƒ¶lYhğíŠPJ:AÕCeí $±\0¬@%—‡ \rín„©cdºV\n+AØJ—7d´q¢Sá`Ì–Çl“bFøöúË9+Ôì¨u‘‘ê¤‘3‹ fMˆEeéSÄ¬â@p–¢‹ ØôŞ›TØ,¼–«¶Ëq¬%æIUƒb¡Íå¼3BjIŠ=Å«\\ÃZlU<kÂ¿\'‡}®ú8¦EMØ1*1Øé‰ŞdŞ‰0C„[isg€r\'ÂŠ\rSİ*s>÷BÈ ?œä±fÎ7ÊãBÍ³Òå5¼Çñ.ão™¢¾X²‹$İÅö,TÔí@±ÑŒ¤cBİËÖ¬ÄµMFï]>ÂšÅÊœùƒö×¿iÎUÎæz:·Òğ‹{(Â~?¶¯”Q·¶|,»Gvƒ7°éõáÒùlí`{ë²\\\';Ù÷°»]pÕİYC/›ş.­»—ĞUÍ³HĞ|¨=ÔJØ«K©òt>:€¸˜tu¬d;Ô56©6Â»²á,@WäCº>Á¦ÔÃ=[Ø÷Y²î\r\Zİ-no¾»zTÃa\0ô–,<„Í Ø9e£Á.ÊQĞxeB`öPÙÇ©\0Í¤6zˆØ€K/ï+CñY™ÜÛq*HÙ.›\"5\0\0¥K™²I«ÄVbZÁÆ#y’dHÀs˜áo,äz¢ğ×èÈõJ­%˜‘0³ÈuSb\n™Æ‡BÔÃPI¹*dØÖ¯>õĞ«Ksa|Iº ©ØËç97x!wÙZ¬7­œ‘Îvîñ´·»UVƒbãÏ1	ğdß¿´ˆªy¾]#’bP€^	±Ræ2~O—˜˜Ñ›Z\rbú\Z®Ö%ØoâfØîÂ†úÕVé²µxkS\r*xì¹k¦hS%‰ÇŸ³ ’Å—y96´,†ÙèK”Öò– 6Ó¡ùE|±f?›ï®jš¨n\'TØ]†–¬Äµ\0Ã¦¦±r§0·ocm{öœâœâfì§^»»]¾—„;Ôò½¯’\"\Z¸\'l¦Œ?&¹½.Ÿ^7¦Ç…r÷A·Îš¡Ÿç[LëÊù|ù™QĞºúZ9¶h\Z±¶v¶*ÒÜyk2èf[bäöã‡G[Pğ[(Ã®¹”“l 6‡°kPdî*mB¾ ZF·±î²v´`n–·5ØsÒ€ ¸°ÒPÒ€ZÖDBPA±ôö–Xˆ<Ä%Ö†àğÙAzÃd€vâ-äÖ‡¥ge\0ÃRÂVËŒk–œ³ß÷i2‡·fús6µ¡.\\ÊyT›ÖèßZ6ñ•Té&HŒ	ãwBÜf¯Šqñ¾İ	šÅ.ufÔÀ‹ä½j–×Á±«(Aãu6v5‚±Â$©°Èˆ0Ï‹zÜU‹X\\àpXMŠ¦³€‘Ş;ˆÂÌ¥äƒÆäã»‰šĞŞîÏ}]¢Pï‡=óc	‡Ãæ`Ãõ‹=Ú²+”Slåï™´èD”W‡Ú)whÊ­;ğïØlØJŠ‰ØÕõ–fØ0ßøis_gºíêÆÈÈ8ò…sf«µXÉÚGFú\\™`ñ,a«ş1¥ƒLøù ê2^2Ğw®k5†_3ßºÔÕ5…L¨çØD¼ÜÕê~úT¦ª®ouı‡º|™Ì,üèı—®æ	·–Í¾÷Ìò\Z\\3&QÚ;”;åv‡KÀ÷¸ïaqö·\n®w“n\"ğÛ½µOY6çÌ9ÇËÈ!ß5ôÔŸÂãZ?XË6ãO°¢¤ş\'BÑøV~\\=l÷Yí¨û•;DºD€Ö.edàÚ½bWºn¦›Ak»;‹PmN?é¦Âê9í–î®² €rÃG…ä€–Å“b\nûCB\rˆ<8—,±”Ä†`ô°Ù[ô¡³6½KÛ@;ƒÔ$°™¦w.hÑÉ°<.- I—³eMí:	.SjsÉÜÂãY#\r°ZS®2°ã¦¯\r‘ƒñ‡Â•í­À³eŒÊ›\rYv„ÈMdÙ9üXë6¾Fºa‘<Ô¶¦WRp–$À²ôEY´-`³ÇÙMim+6C„Ÿ#Øù|2i6*|„=W‚U úË)™‡:á”Å\\™MÕ%m†!˜ÊşÓ	\rßy…8cŞ5ù¥f¹G»^©Ò^bKR\Zi¸àgs¿ùETò–8v?,¹ÍÇ@#ºïæ×3±_W[]½a©í¿í¥iØ/­Y€šã¾‹Õî‹3’İÛ\r×~ Jc\0Z½×@Â#5ªÀÂ§\'¦x~iUX?–qŞúëì;¤­Î€ó7E\0J”Õf¹ºO ÀµÙb÷O“!Ç9„î€÷‹¹£ÂmÈ¯lšØò\Z.VÕ;åv‡@Ã½o•ËÚÜ)y½ïÙ\'~â§¬›s‡›?:{î¯¢¤ş&Ñø›#•0ì(©?‰Ò´~ü–÷˜Ì5ëŞõx/D»—4‡ö¯É\0ƒX€¯0ùƒM€XÊÖ Ú—6QÏtÑ	~ª\Z-ôÖ[ÂPÛ@ÂU“OïCY2ô™zÀ„Ş\rƒô!á w¶±\"«<$fåOh;ir^Û;n3†ÄP§o*.fÊƒÏVÚ=Tõ«‡\'<—$ë\'qŞª•˜ÃGËy.Ë»ıZTL¶Qá„¦¯Ö°d%ù±Ğ\Zå3S8½Éh5™j$$¸ëJ“bA\0Z·\Z^{A¦BmËWí„Äñİ=6$;¬ƒ¡²‚=İÔ3™ùU‰GÆhx2¾Ñ2›E¨äüÓËãß¦õv½é­¥/—²M‰BÉú;;3\rh«¼cæZbãÛ™\\¸	7´I†~t>ôŒ7Ò¥Ud…ºä¬2R„Ğ0TÀ#Ô!b+ÈL˜7âš0ßjÅUd©ÈakR€şÕg¹ù™³¥€8V)vøKf\'ŸåZfí³½UÖZ‡\"Ë=s e×]ŠÇ	·Ÿˆõ¿iÄqy>\Z£KÊ¤À7\rs{¨ÜAÓ4:–(öI¬×?Ì°ÎõïîÕ½XC¾Î;Íü‹Vìßè]Íşî¿–äè®êÜP:qáQ†{…œhÓ7ø+K¶Áâ:Åë‰¿Ê©=ÛÅ¤˜n%O#L£ö`È’0ïZ>ÂÍD«òg¨,%MWèsÀ]4gıTÑá°€ =•“ğrÕ—¥zÛĞÆHĞ2p,	·l²6_Y	\0¶b^µŞ^ÀâÏ9¸—(7ÙÒ§Lÿ\0ˆ•W\'_2åüÍ›qûÏsaµMjéë®yk„c\"å˜ß¸½’vnÀLœ9xÌ‘‰‡İ¥JµòÙá$Ëğ¡!¦œà|Gİ\rOE|oµ	bCäaÜ´:Áf[‰DÔÆİjÇvÒ¤ÈRÍ±Ø[ƒaa‰½¦5íšd&Ü¸kRcpn2Ùq¤Áº\0Û zR¢º—\'ÊPfm4)‘#, rXr¸­\n6ìËzêÑÇ†á\r€•NL²â<;Y\"YÀ)ÔJ‘œóF\r‰‘e´`Ø…K²[kê#QdÁÇâµ!­v\Z2TŸÉÚr=µ¾çæfÎ”l{û\n]¾ÙËüÂyÎ?°\nş´5O–;H×^±ÂmËqİê\Z\\µF»•™Ó_ZævQ­iŸšhúë3É¶ğÁy¤vc¢-·\\]”9›9×/³ÅŸØÕŞŸG–ÈvL-ÜPºqáUŒ³ï-i›ü¥Ú¹xî€õ•R:XZ)0ÌJ…àùóö Ø“ÏqyS%O™=@©ªı é£ÁX‚=(höµ %KÁ¹+õ#%zÖÉèÀÉ‹8)‘ƒbN\0CP›»±ÁX°Ùo õP	\0b^ÖØ‡PäØn³Ö—.GrÙ”\\Ó<ÚfûÚ¢¬h†&{6*»›ä4\ZÅºBfnŞŒ¸¦—Ì^R‰“i ŠÅó~Ñ{Ôßêç±çæ0¢ìqŸ´af¼:ÕÛ]`r¡+l¬4­œ“·¯ìÔ¡JˆM¯C`ŠóØ—¿\"¹ûîXkåai€ |«8ávÂÜBy‘aNÊlAS)~í»Aï­|cä3îÛwQñ‘Ã·abhØwA.h;»’š÷9¨Í´pòŞ±ÜB©Ó¹*MˆDgh ÈWÈÔƒa—Ï´ÕtêFXÛ!ù{6\ZàÈ-\ry³LÉu»UË1ƒêFÛ¾[‡»¨ •[!Ã‘sûÚ1ß5V9Sw*Î’îR8CuÆÍÜ7¶•¾x?CqÊ÷_Qp÷Ï+šÓJ9©¾Ñ2äm=ó ××]Îxs;ÊòØk3Un/G–Á ¹£ì–(ğ¬Çù#ö7ø#K±r™İ‹ú‹‰¿Ê©\\ºŠğª¨e…’ª¡Ú;€jÔª³;†©ªı>ÎÁ.™$¡üeîHÍEzÖÊPFRß©g%0^¼Á±)CJYğz\r‚Xl·Ğ	\0äØiär-GüâÌ§İlC®ğ[‹Y\rÀJ—m³,§8²e“\rÃY‹4C:¼Pì¦FÕØj¹%÷<£dÈ™ÿ\0ãEeÎíháÜ1&Ã±ÁàÛ5UaÂ¿á–?Ì\\$IÇh|h{»6ğ·­µÌ‘Æ>Q&_øiUåØ®Ş\Z¼&y¹Aaèy[RôÏF„©”¶¡Ì›‹Lú —`¾êºÆ3Üš¢!<Èë\r‚ÛLˆ.dğ6ÚÛ[÷yè…ÙíŠ=Ç¢½×®5<İ@G^¹¸E½ì%5è‰×­EL‡®D¨ˆí%I‘Ş=Äé Ød¹±ë@]xÌ‘¾\\ü2Vd¯¹tãVa»²ùe\'ÆB7®¸›u™²[¼±¶1À7Àë¬ºÃŠs»ÎvÜWõc“.æYV]×]ÊGnĞrÛ?¬3vÀ^ ß<¡Ò¹65ñ@ûk‡¾y\\ÔKgºê\ZU|•2ág½ÅÍa}7ôúğæö\'•.4İo^îv8wN©aÒ\nüK?µ${	›ü¥Öù À±ÚË`•RĞ|0°—…UŸ›ª}„*¨(áİ,Õ©Tå`5_¡Š5ÓNa l¬ÃÙ4Ó`©+îİC&ê@-Ä<„ h6ì¢[¥I ›ƒĞlâ$@/ª€è\\Šà1ãgîÔ²ƒ}šçBä¹@#nt\'cúÔIô–)–O(Ù$f›¿]Ä<{ ³â-z`g-_,óşJáQÇÑï„;ú¹oq9ˆî›æ‰»“:eIÍğÌY=¼o´\rÄ©º­;}ó\'+€”]´Y‡C^Ü´8>dnPØe­6õå fOQ)Á†|YH*aqç-\0O‹xâSbÂÙE‰³~ ]“vÚ\\Øz¢9+7ŒîFF™¸³‘CÆŒ›¶”Ö\r3@À\'ŒöÑ–ö‹Ó`0\\ß1YÒQv<9áŸzk±iáÌ—}òr1†·záo•¶jù†e¾ :€¡ÁšÜ‹™,}‰í²¯êùjğç“ƒc¶»”·¯ŞV;‰ÓúŠ>İ¸;K°`ãxl4~Ù¯ÙåT¬%½|pJÕ±0à\\şËŸ;ymë_MÓŞÄrdm¨¨·ƒèÓG³ÁèSYm\0òğqs2°µ·Á:]CÂæ¢ãíUf€6Bõ”ğ§:íè6íi½{\n(§Éğ,híN…Ôaô.ªr@?qfÉ†›I¨dÃ@<6ò}ÂPw‘-À¦R¤ÈL}„¦àğA°^Â+Ğ	,pâÈh|Ğ—…\r¦@w²ãl²ÌßK’¨cÑ´hˆ–âUù>^c\"ÅöØğ|DØ“\"ìÓ¡‘‹ñnû›ïâZŸï•Z¤È˜pœÅ’Üsøwï£Ó&Úæç0¯÷¢Gz&‰ãDJË–9Á¶2’@ØuÒ¦‰·u“=Ìğy’{°HleŸxáï¬Ã\Zc\n„¾>ükgŞjîÓaTß¼0± ;¥d ÷š’ˆ˜^Ç;½L.Ù;ZÔ³+dÒSbÃ\\3í,M”zšñ¥M‡ªÖòóyì+{×¯$dÈ„@w^{ˆo;v0\nCÖ¢“\'?p`0<Òfdº=XEØe,¹ÕvÉs%ô•Üc—ãõì½p¶ÊÛÌ3-jAïŞ—X3S™dâ“¶|eW\\ûÃ,-0Ó°ºQnŞ\Z>V€á\03o¾5fÜ5¥Ùr\0B„Èn.E¼ª“Ø_]Z˜áÆ¹™–&J9¬Ù7ÏÍ®çVxs;Ê°4‹AnÚm¼7F™ ¶\ZšËh•ÿ\01­mğN—Sä†~v@u×j«.¶NÎÚÊxVÈ0ì ØVø‹°¢ŠLê½»Ó¡u{õ.ÆÌ‘š0\\É¦w¬àD’0dIËL™bİôIXJè½*F³·­¢ @%I± óÀĞê­ƒí@$xÃ¶|s>º¶ã;Øà}…Ã“0³\0K˜*d&Bi¥Ì‘$Ô\"`˜tlQNå&öã•Ÿ“A‘½O/•kYë±o\'ÆÅc°Š÷XFMÃs¿/s7ûÅ¯ffæÇåŒ¬SwÂè÷´{7J±:1ñšjÉ_irÌíflÜb@ø~ÚTÜ©²ÖûFÅ‚ 9½©Â#yÄã \"3Yf ;Ï È€/<hm\Zä¼Ğºh\0e“[†”m23–g‹º­Ó)·FT±ñWL¢¦n–)‡Ğ¼±İXÚál‘Îfæw]ƒE Ø†) ºğ=ÃîÕõ6|´g<U–ë3±S[%İWBä¼mÙñíĞÏ¼\\íö6ÍŸ0½ó­2\nu)ùš…ÄŸoB£¥^Sî—\'®ÏMğ^Ğ»ŸbX”RÜ‹Lõ,İZVº±Oe5SâÌâóFî§m/K¯rşÖ0ë®Fï*¬µ;	ÓöÒ“Â½ï×NÁA°xÑUQdCO×TÕuüÍvğe½r0TÉÍ…Œ”ÈÁ±/;ËÖZM¸€fíè‘ƒÂòJ‘\0‰QzT™•\r’ë`Ã@5\0áşš­òFl%C\02Ö\ZmO0ç^\0;’¦^Fƒ L^›0ĞG™´¦¶vĞöjGz\n”;–[zÎ[Ì#ÙFL†xf.÷B³ìÜÜMÕ±ÅMÃœn;¶\0èXˆjl4 6Ğ&Å›#JÁ¯32+ÃÛ4 !¾ÔO\ZËQ\0]âo Ø„WÜ!“À4 Ø€A +$•¸iTìcuÛ\0S )3,›ƒ *ŠITŒ›Î€\0Ø‹Ü^˜uYfÛHì†úåÌ¦ˆaù’I‰´Ğª´Á‘û\'ó¦µP¡GÅqçñ÷1u£Ùíêé¼—ŠğpÊHÛxïms¶X«+ò\\•—m*¦êeüÂ™hB‰öÎ¶º]J\"İ,.=ë³3Lö/qt¯á4JWO‹”k>­\0ğ¶TöSV~Gu”•NÛà½.ÇÊâÍ\\#w•V]6ÈwÛJO\0ƒŞŞƒaX>õÔUEùîÛTÕuÔ×mÌÁ€\Z0•e¬ƒÀ4¬	CÙA°c¾Ê%ˆL×a*M×¹dÓÀÜÖ6@+:èh@<l¬¬d ùÆÒ¦\n˜uŞ^Ì1:(D•0æv(Ô×lÙ>;Ã$©bÄ´”;ir6@¶Œ‡Úõ &Í {á®”tÌ€-å˜‚yädÈ…\\#¦²bf£\0èÌ +¨6HY4¨wÚ€r\'h¨…|ƒA±À.;°dÉ;\'mÑ7“ ¹–]ÖNtó{q6Z¢ëŠ;Nú\\•±¦ÌŸ{Üˆcù¦ÁtÅ]¢\rˆeİ3Úxï,k†×Šãğ™ÛÖâ†òöòßsI±‡ÃGˆŞ,\'¯,><ø²\rãBªğÄód™Ì¯ùn\"êi‡;±Ë?ŒdíğZ©˜+Oñ‡ÅÉèŞn†Ì¿aC™|‰ÜøjßTÏ‚!Øù4şkf;z3°l4rÀcªb!M¼h6ìîßÛ^TõVX4õUWhsK{+¶eºí@Á¡¶²ŞX}ÿ\0QÁmï\"X„­T›@ê¬š@  Ø>ûP\nğ@2ô@:öï^L<¬4Ü¡=ø¦éŸf—0›uÌ‘e’+Ô±g;`É¦ÀÁŞ&íÕ‰a7.A×èÚ^2Mw 	ã¢’Ø zzN­9n!=r2dAÁ`­¼Kz\0WOñ ¯\r€NÉnå“Bq´ ÆÒ€gJ\0whD;Ë]¨2 \\HvŒ°\\Ë9/ißÇ-´È*eT?Œ•aëˆ›\'Ñ­Àd‚e–\r–%É{N“óFñ–€>ˆ`rÓÜÈÊ±«•Ú ØxÌ?S@{ïo,D:Ÿ\'cm”/Ã*ÊmÒ¡çüÁÎÊxp×­i· €Â[«oe ÏïLƒ»ìñgL9ÓÈø³\ró÷Š™‚§„XOÇµbVót6¯­E.er,üÀªgÁì\\šv3¨¹ƒa©ÌÙãS\nãA°¬gK¦Ê2ÕıuUWhrû5®ÉaûH*O±8v Ø>ÀCG\ZP\r+ö€T™	–[+ô $ÖvĞÑ €HYÛ^TJï—æ,ë¥í*WÙáqL6ïQÂ	ÎÜ\0‘¿ñ ¹h#äœ+Jğ4HÀ á%ÍFõŒ%	í£	|}ËC›ÈBo]¢åœ5ƒ@ûHÀÂ^0-û\"<•¨ööIc&üjù&ËaS“×%¼î¢0ƒÚQ†0Š\\ö\Zjó!z=Ë?;±¬JL¯¼ÕQÖÃÈœ6­GbÁ‚—uplNOˆñ°w›DYcÔg0eÀZ2=Y|x0ü«ä…E¥¹×†Ÿo‹¢õ-¤©áO–>áĞ2²ÿ\0ˆUË;gWßĞXt ãZñ2â.½X‚©ØÃ¢á Ú9›Æ¹Ûlİ›0yŒ&çŒµÙ{‰UKj¹æ0™5ÙÎïûµ›)×ó4Î.AöuQíå6~L%ïÍ5Ø‰Eenmëá¹ïb[ÈŞYgæ#ŸPÒ»R«E[9qµŞ ×+™as }µT‘‡VäßÔš2Ü5Ììyj³2|ı„‚*¢îø®í!M|+Ïõ…ì(²l¸p6S¡V—)í®Ûh­h*JıH–ÄØ†‰\0à±b^ÂPÙÚJ“ şğ–[{` ;Ùè	CP!£À\0„ï@E` ¢Ğ+Ê‰Œ{…(Òö•-™…›\n8A,æX8îƒ=DÈ.Wo<l@lD<¬é’$G6´2~ñ6*0µuçÇu#Î{ãºŒŞVõ–ïW6Ğ0cÙ»vÉo\ráï#wm#æpë-|cæ@ë#ã|ÃvòßÄ=ÌûÕ¾²>!îk3ÂíD±€(\'…èÀE#%h÷BŠÃV†k\'2ëî-Òª´MicòuÙn…ÓŠÄ İ¿\r¯—¼í9×Cèñ¬íM»¯“zıŒ¶ÏgD¡¼;\Z‹áYò*²|É¬Ûüd|#äR3Í¸¦‹‚.‰™ª-¥˜ìåk™+ÂGÜRÛQ‘ÊŸ™äË˜>­w¯tWmœ¬ù#“Æ|ô¡¾I£±Úõ*šrŞÁg‹ Lö×6Ö=[Î9\'&p±ÑKGüÂn§¾¦Ge¶ !¶²dCÎò\\|\ZÇ5¶ñØ®ÑTÛ¤&E–!°ÑüxŞ*©)ìÁÆû¦÷Û\Z¾šŞ[V‡t¦™ßPv¥ÓÕVÃ-Ö:äÛ1’[^ÚºXÃ¤r…ã\0/\\ÎÇ‘†Ã!¨€í×bBJ©o¶<ƒ>º×Â¿şhW°l™ÕÔèS¥Éìë®ÛrŠF„$×´†bkA±­a¢@8-¥\r)R/\r#@8€\0 vÚp\\öÖ0óáœ-Ô``Ë5oÜÜÙ‘Âó©ØTËdt ì)ĞÍ•F\rßÆí ©“Ò\ruì@ÊÑŸ8Å¶ñ 4f\r˜¬å˜\"6„dÈWã¢İ2Üñ;†)SS`<‡˜-ÔØ— æú¢™ôŠvp…:(ÄØ,¹‘nàéLŠ6W»&Va7Ğ¯bó°é#Ğ{,¢CØ“ÕHöÉ±²\'\ZÀë+Ñë“\"À¥åbºÑƒB@ŠêyhR%hvJªµKj+är©ºVãzf½‰g[Qå,rü<Œ·¹Šw„Ë¸ÙbçSœsj1™—à®8¼cá¹ÖUyO:ğ¥#sx‰{\ZŠ›`n7åÏÅæÂŞ8g]ùm9LÏ[Á­÷´.obm4Ì6ØÌP0ï\ZF·—/mİ\\30vÍ»=âUd©K/<Äæş\ZßÄXî<©!Û¬G YH“Âk^ÚÍ Y–wJvFø~¯ùÅu!-”¹é- â4W˜kâ»L¹—Ç3qGŞª™Kn¹O^SFÅë—Ûu!¶Î2ß…0>¢æSÉçò4º\ZWEë£òØ[‹Pï\rtƒ¸Zöˆ†~_ê®şu@½ø/ Ú›:Ë$\0\\\nªäûë¶Ô˜ar\n“Á›ÜB]ÄoÖX`ëhê¢[8¤=á©l»u\0Ë;+Àxi8jÁ”qã8îÃD~ÂÖüËXü·™-m0çâ£æ™Ì·~ºÌĞ©ŞaàeÅ=m\ZTĞ©ìÜŠ§*,\ZpwM\0Ù Ø? \0ë±Ù=ô–#-´ÓAÔ@Lñ€üTŒ³\nùo#&B±×¥á¥j…Q›ü[-$Ø©°ˆƒ\"E¡¢4ØÒU¶\rƒåï<eŠö˜&@úé±©-·µ¸Ï sä7ÍÈ*¨¢9ì®Úÿ\0/|²#óY;ÏÚLŠ=‘Ñ<„äµûãí’o¡_©Z‡’Ü«áìcb=êPŸ”XÑM˜°ÆÃì¬Û©‚©Û–7äà4íñH€>ÍKjá};2Åe¹?9¯¸É~ÊşUK°.õ¢^|¯}Ô¹hyÄEt÷§i©3`\'*@~ş0vÕ3¨©²Aä„¬ÁX›à‰¶OıŞ–øŞ\r#çÁS¯\" ò®VS¡Å`J¦êêâ]Š‰Œ£oí3±¹ØÓLBÎ÷¹gâ8¥µ”Ró`µdq¼ş}tİZJ•~24ìœ®3·~qjÒ\ZŞ35Á\rÅ5®R$ño5ª@³9“’Ä¦gï]HKfJ	¹3ÅŞ[`¯¤s1Ñœve›€’5Õ³äÖnÉ_núƒ¶ªŒğ[×2L‡9È~´º/]#²ÃØPï\r4ÕG°	DB†X[;fƒ ½$Òò\r©NÒ™§Bª¹U‹°0VvP0°†°]á\ZJ\0@Â[4í,I¥Şn%È<×²Œ›è•=Öµ2òg±§({¡×öiSrçlCGËŞ[çòÎû¯ÏÚ\Zn½O»¹t\\7”X8v=*é\'Û÷júu2ãîïrÑµ‡ÃÁ?—ŒßÔÙM;Nu“wªØI’¦êÙ`Ã@fí×‡]ge¤0üÂõ¬Û¬×3e—Røñ¯ëÍK“b\nXwà¸Œ›•˜Í–D=Ä.ÀÌƒi:\Z6VpÌA,ÔHÁ‘Í–İ-;a×EYõ\r­y	7ŸÙÇTÖÃÕdÏ5añßá¸¦ïûG»ÄßÔ3úPòüÂæwKºtc‡`QúúUljæ7vç8jhÜgèjï¼Á·ÜüdÈÜ?CSÃ=‘÷¥øË¬³ÙèÕkçlÌS’üd~²JŸéñûå¨Çù¯’²[MÈÄViîBô¦w2`3AeÃï³5Lí‹!¿^`&[–Ñ¼õF§v|·&mŞĞ˜\Z†ıEZ{˜s¬Ï)9WµuŸf•6ÂÏ—Ù’ËrÃšŞ…ty[|5VÎ|9SGò™°öä‰°æq®0z.yŸi&l«JÖ<özÃíŠšm“ü	Œ·]#Ky&\n^a÷Gƒ­…­tõd±ØãM-ÙpĞa«\ZĞ\n8 VKÊî5¬Ó\"€;²| ¶İ§i×Ë,ç¹lÛù<‘¼{îÛ]}5áÍÙc°ÇóFm‚/8kJú7#B‘!ÑïCyÊ™«OÊÂ›“ßÖ‘¼æÃ60w¨~ĞçRÀ	õi†?kØPï\r¿«ßØK\"ùÒÈ È7a¥ì7&dåÓ¡V—,±vÁ—î `ô7‚@Á a(l a2Ä‚\0ì¥Èïû¦‰+&Úë¸<ªg­ßÑ£)m¹£Ær“»ÂÇåªO²mİŒC¨`y8àô¦„ßû5}:¾Î>ŞäÄ­L<æ>Í68O;fÄ<amX™œ:}6mÕ­{/\"vÆô™6(§ËIâúLŞ(öYU!’|wLş.nË.¤3nó;RrlB±àˆNŞhÉ±×„¸ÓFæ6×Ä@ÀIy»t·­aˆ‡±Îsåy‘XŒ4í[^¢7eÃÔÃŒ•–şDG!†Ë–\" ¬J#e6 bPØk_-D{\Z–¦Å$‚I‰Y¸³1êòq\"ãäŸkd•Zv—=x–Ã–üÈÉ@;$]%³5^¿êß·ıœîÇG‹ŒÊàóñïB}™«õÛÙÌ¾ùÎUˆøâ7¥v:˜†uí—2æO6ÿ\0´\\É×‰tõos~cäÏ}£Á”íÎºŞ½ù–·kÃ+˜ÃÊğòµ€uÕÔ×ì–7z´¸ìŞ6eÅ®¥xQ]ùZ€EêŠTÛ\n«\\ˆñ´:¿f÷h;³ß·@’5ÓØ¾sëQ@‰§˜Šî‹y6(<Ã’}ûï-\0ª¦´{,ÇƒÀÕæjêUÌÙe·-Ã}ùàsï©ÂÎ»k™á‹@Èl‡\\åÓŠğ¸åY˜ánÀ,ï-­Í…ÑNÅÚÖGëFµi‰Ó8(w†¢wº³°–D)2L È	,.á/a¹E–zÖ:érı•Ø8Ä@?êØ€_YjZJ	r2éèiv±–³AŒåëõÈ5¬šÖj\"c@t\0¥Şù&ÖÂëŠ~d ­f™®“)íº!Öğ<±@üÑûÇn½\\8–Û•›Ú}µUc	mLzní¬^TòñN5®:†ôU[+Ã0ûd¦‰y«fT÷s]hÌ×ğÓ­ÛÁ‘­—ÎLâ›Pb•æ~ñÅ®¢ ÌˆD‡à	¼¦´›ÉK“¶£¬/f¾øpŒú€©¬ƒ¹Pé¬Ò#kYÚ€ÀAtï„¦OÊÂ<4¹‘‘¡(dğ×@ÉnÊC›(0Ùì d?(›V!¸”<u¦Á±!ü6ƒMËÌ‡à˜š22x\Z*Ì_#`æ‡ \r§H5²mÚ²êÜ§æ,\\ˆ„L­ ÷Ã}u:ı¨—Ja¢Ëaâ>Æ±LİÈ}½Ÿ›9lá¿}¥gÃqqwjÃ­×ìeËùŸ#~‘ñAı4î¿cĞÍÔösyØwâºzH>\Zêü™C·NÁæ<”b\0âh^|.Eü~m}İ²7ÂèFñ¼òˆ6D¿	‘Øîyÿ\0ŠZ¾gx Ê¸ì \0ĞøJ33à&u©ê›±eT(n>èC}ê­’V­.‹‰€Æ% ?Œk“Ù¿³­	r5ÂöÔÚ¨d4­§˜Ï°¥–¯&ó~Ğ\r»SD½sy­¶¬2®…‰¼ vÔ;ÊØÑä6”ğÌ3ùÊCA×Mƒ ×C½h«å°™³¶ğTÕv^»/I\0Íôì@+¥£ãƒ€7¥Èl°ØF#í¨­b­fš<m€©­dÖ²Âgİ\rfišé™+}±¯Êœ¸Æ:/ÿ\0Zy}W­Ë…»tå|÷t­÷Ê|`!£ø-¥™€y†”© öUNÃÅ•·¡.İlA´ØÄó*,07®Ø\\nÍq+©f~&7åÎ[¥aü6Ò=ÔD–Èh$dØ…&C†\"w’ÍaS(\0ÅÆzZ¦°¼`p±­X6\Zƒ$2á;Şí fe¬¬Œ•22 ´Ğ2F0Á(–÷Ğ2…Ğ@Ê/\rjC›+ÜH~\ré°lJ#fÔde	²ŒŒ¢à¦µ®˜Dlî#Ølœs}¢ÒV/tŞbI¶-¡È¼óp/$W†Ãn\ZëêÛ˜r;=LµYœSà°?ˆŸ»VaÎÓ8—\Zæş[r+§¦Ï³qq÷jÄ»\Z¯˜sÉĞâäÈãŸs4\Z¶ÌÄf9~Dwu\rµÓ×¹îª˜#>%eÉ™\"$@I|ÎÅîM‰®İkjàq¢ã\rˆÉ±UyÌuŞDzÒíR©Lµxl#xv<\\¯}öj[vR0—Çñæ†­gîÛXµ†‚74_×SZş¦Bã•‚ìÌƒ1ØÒËG,.hÿ\0KYy!Ÿœ\0í®‰µt[s­ûjål[d¿ì)á˜RKıj?¶›B^nÏh«åµeí³í¸©ªíßê®ËÒİÙ@ @Áàh.ÊU¥ãQËx{CÄ˜ëRÚ^û6Q!·fÊDìOk.\"CJ›&µ›MÂ©¾ ÇC+¯Ñ×‰s{=ŒÃ¡ì‡`sÄ8ö¾d%üS¼ÑƒQ—o#\0€4\0²ø–è©áº°ó£}ç—ğ÷|«:Ü\\ÎÅs*j~x\"Å‡²ßäÖ;z°v»f\\şY¶\"fë™N-Zò¤œº5¶h†Ì‰bq¥Zo_İ¶›\0sÜÈÛF´7¼ĞXš6³ˆ·vÒæu0Z¼y2,As\"0}u—™0ãZ“\r•‘”\\ºQ(7&(ôdæÊ\r‰Dl¡¼‡u”‡0ZxˆÀ´Ø–æI“áo&Ä•0ê|Í¿xµ÷DÒù ı]Ãß]·g.?g¯¼Ù„ñQLFğJîj÷M«g«çNÅKÇJŒ]{ËÚUÚÙSÄæH9¬”\"j™ë{«f½„‚øÂ/êÑ#Ñ[û·(]Ö6&Æáñ%gæ‹Ög²oÂ5®[qÒ\0uËJãÑfŠÆqB8ëûD¨œ™1…Vg7Å+pcVKØCË ã³Aã^v<3¢èÿ\0«»õk™+°+–Ù63·Yš7@\\`¦€ÂKÚœ õM…]/–ìkYîšÅl?&aâ»	CR°ıû>Ú\r°°g™à,Ñìyfsš,üuu.»›®±gî è3Xbaø©€şqKi.Î‘‡h…ŠkJ[Y{SÅHµ–Í›lô&Æ´¶³¥rö5¸xĞu˜w‹é:ÚâM³‘²Â d?¬Tl.ºòˆÁ?gQX”ÙnZI‹F\rmšVîªª$f1ŒäşQMÊš°üÉ•<œ«Üäv{9U¯VùÅ ´)µréë¶™¶ÖˆúÏí©rgªÏû´Ø	q8G\ZwÄ::şkvÛ0í¹¸\\4Í¢\ZW…Lˆ±Lˆ\0ÑzÈÉ†Da£ede²“.”F\Zl@Èse$9²ƒ\"C›=D7î…ÛïFZ09³×@h‰f$ÄØ“bŸaÖ¤E+%2w¶âoZØ”»ã0íX<Ûü|˜m˜Y!¾£‹±[eÂßLKù‹Ë`QİÓ Ô1øeºÛ/—3ÊÆed‚Ã].¾Ş\nÙ²ak‡˜ãƒÅºÏaO4YK´i@`]	3\nk\'œù}“³â,Æ³­*yÙƒfî´ØĞ–×(òx¦gvØ&Æ¬;²¯ï]ÚÍ2\'Leªå¸ÖÊiƒRö<,Ñ\rË§}s%~ãÌÇÜSGiĞ½MŒ0ı¹õÕ6tŒH]glÔÖ+b,Ï];†¥yûøöo Û,›ŠAÛ~…š=,3›c*Àê+¨éuÜèX¸/¬ƒ ÄQ“ÃVêVĞÙò6Æ¸Ûæ£Ù%Z[¨Œ…‰T”¶•Äpµgg)WÜ³Æe¨\ZÜWuuåû:)Ÿt¯¤ra›ûf½642VuĞ^KYê\\Œ+e˜0×Ò®—iõ†ë_irœ÷9¹šÉxäA\n1ûÎºävwòìu´ğÄÚ\Z:ë;Ä-²±\nÉsØa£¶Ób­I˜Hr²¹³úÇ:‰±RæÍC \"ÀØ\r\nY2eq¤¹•˜^+IÒï \ZP\nÄ6Z²Ñ¦ ÁA¹4Á(l¹eì0ÜAĞCaÌ.İ@è!¨†6$9‚òP˜\'@É¡¶µÉS\rG–Y»³r0Î—Êä5·Øqtú÷s;oy“Ü¬qí‚nú9šnùKÍ,	±<´‘£oª™§²“”ã¬}u­ÃUZ9`á:àjhtõ„É‡\n-›éº\nÙ,|î#®Ù¸®s6JÛ\r¨lÛàü4­¦êX5\"€<îßÙ¥ĞÛ-y8øù\'dÀ{·{il€î°:çzæJ™EŒ;¹­­Z/Z¸ÚÛg¸f-(®UöÂæ®©´ŸgBƒ¡¦KiMenYïz{éx7Zát¨V#bøÙÑíšÕ¬òç<ÂõÙGUÔuúÑÃ;¨\\­A{£\"1ì¸ü d¶‡SÃCá4\0;‹¶RÚZ8à•YMi¸·É6ğİòD{o/¡èëÌ9›rĞ{×oÜ]$PwÖA°ô;he	é@DoZ/%ŠÈo6ÀÎ»`%ÊªÃ“óï6¹:ø1Ä“ø€K“ÙßÃ­£¬ÊãÙm†8Q}·5Ç´û.ü«V¼+A×{ıÅ«²¢Ïdœ³º+Í\ZÂ„÷ìÓy™ûµtU«º¶;ß-ò<b?yä? ÚlU\rì¯‚Î…Ì•S+¨àv^•%L\r…¦@Jï \"0YhË\r²Ô=Êš`²lx-AÂä6ÃpĞÂ‰h2$ƒ‹ÈBiĞ2ˆÖfMˆ+ßbTImm²ê§MÒî£ºÇ’1ÑŞÛƒ¼üâéÚşÏšz¸¿›¼¼Å7€8¦´)Õwå°ğ²$uY¹UjĞA{‹}êXSUeëAÓ×zn„Û%•yç	ĞfÛÕÎfÉ]`^ğ¦{ïV	[Tê““¨ï¸ÿ\0(—Cl¾å\0ábİ{pÍ\'±áF–É÷G¸\0¹’¦UXç¿ó}ÍkW]2`QAEr¨Ìã£qsf}´ËIöošÒı@SZSY™Ïu Ã®™ƒuÃjv064O¦³B5Ï.Kœ;¦:}µuCÔ•Ñ\"	Á«W–%ªäèˆı\ZŠò\\ÙĞà³nõ\"	\\ĞAR5 7]iß4î­3)öÎ!Ô\"3À„Ôpê/ªëF!ÈÛ9‘ ‰¤ô<öÖ\Z ×¾ÃÔ‰-´<i\Z\'tâ\rˆörÎqæs˜éÇh´}˜.Fí¸—O¯¡ŠÆë÷šæË§…‡„6	%ÈÀIÒ[hl\rµ¨•(’¤hMˆ64åĞ¼ºäÀ”ñÎÊ³ı5w^¾®fë{ç)ç;8l¹¡¶ÔİËdÎ½CÄ\r\n%²kR\n‘!¥%5vÒw„h¼ ˆÌ\r\0Ãee¸Dah Ø|;4\nÈğ6€‚å¦ 9‚\r€®­\0î‚\0CX†ˆıÒtPä	ş+—dË\\S½µØÓgµUW˜@Ù@?Ë%vQóü°à:íƒ`\Z++-1çdW^4­°n¨RgÆšÖªëÂNÄ±ç\'Q[¡tâ\\ÙV^Û±fÆiZääü»OÁ‚–Ê¥®åf\\û¤;f íJÈ† ÎÙ\0ÏaCH6!Y†<ÂÑöÖ¬Ö×CËÈšÅÑS†gö¥ÿ\0]ešè;J”ÖdrÇû6E»æŸ*j»åmCû	R^Õì¾ ³=İHëùqÜ±üãªš¾ƒ¯áŒ¼×D˜=ÁÌ‡Ğ\0Û5›Ët¾^Àa PŞPŞÍ\\pØI*G€wH*W|§‹”ÜÕèS2¹8‡FÎòïããÄæRšö7iz¼õº,ÕUYìEhŞt¬SZÊkW\'çÿ\01[j=€DfÇ]A}ù_×Ğå˜Ì–UÙN¼DFo(otâ=ZˆœFšíšMÂYA¡¼ËZ\\Œ)o#\"Æ®³â8Ÿ&0Ğa¹yÇå58ŞóÇïb\nÆvqÄånWàµ¡ë,]>Õ}aÇÓois¦@È¯=õÃ½³.Æšğµ	lÊÁ lGB\n”Á¶†ß@#5@h	P\nğ@0ÏJ¾Â#–à=\\ƒaö@Gu 5¦¡ƒ{h6;´´»²€	íõˆijÑØN€ÔyO’ı¨ìøÁb»¯g3»UÇ?…Ø·@ô\Znä½wË3má¿¶•ª]+@xçuv·mj†wœçŞøƒ[\n­0åö%•ŞTÌ¹Ó+,yÚÓ·­ÙF•”CñP¾\ZÔ¶U.‡ÊÌ¶0#Ş¹}‰tb\0õÓİì^˜6 &$?oq®ÑzÅ˜ÚéX¶¯SXº+qúCÁÔîÑ&Y 3àb\r“+Â÷¥5™LÏøóO•5iy@áD¿¨•%í[fNÜ\\³ëè[©.?–ıhìTÕôH.‰0}è6±>ó\0‘y*òé¸ğ´7”7•ÀhFX™t¼ÁS-·!Æâ´ëİuÜşŸ\\K—Ø³oM\"º×åÍŸ(ŒÖ€WdÛ²€§Ïf>î‹Æ=³÷j~ÎÎi§.IÎüÔû¼L¢Ö«°mœºú´ğåOI=ÿ\0 ¯3÷k—F!¢ÃCá5Æ=f¦´›¶\r#ÿ\0m),B¼ã?:E€Z>ÑÄ´!±\r«:‹vŸw—œC¢ù{„á	äd5eşíµ×éêÄ8}­¼©ùÿ\01ã26\"¥wvp£«\\)â›kÊëò³¥d©\ZÑèAr \rÙAĞÂ`Ø@:û\nÄ@í4¿R#½e´(İYl9Ø€@!¨zGZ\r€î‚ÓAÏR\0GW\0Útù.yÃçvƒsŠÚ»B>ôeĞ<Íx doá£z‡\ZÏ+‚vßgvâ]aÕªÖm03Ø³qSX/c	™÷®ûK£^õWàM„#`¬Xú/° \rO‘°zSYv·EÃ zld=ÚäºH€À¥H>ÂØùöºÿ\0h¼»[;-`âÔWK\nüHpƒ|Í`Ù›’À:– ©QfBÜC@µ¬øjùLşB9õM¸¹…ïiºÍÑ¹~Oõ£WQÜÑ0‹¢DÙ¼Ğl:+@áE¾İf£¼¥¼¶±ÑPŞPŞV¨6QYbdŒt–¶ŞĞ©¬2ì·û»Ó;ÿ\0}ŠáÇİe™«“B¾CËĞõ\Z³›1NJŠÔ€ø*.ÍxS×ÙËç.lşG2ïH\r¶k‘j¾‡¯<+â2è^+•³\rDp¸4)m%L—ƒ7K]È8ñîTÊ×<I¨¯_x¬éêÌ¡ìou<œ–18c³GbgÒÉgT‡dÙšùŞÆÌ»Q\\,£ì%éäØäp\ZÁR68hAr 4‚A‡¶†²ä»¦€ˆöŞ€i•–Ì3ÑÛ@\ngrËaÏa½´5ŞA°ëÖšh$l¯ +Ïm::ìÃ‡ÍQŞWh#|eÖåÃ>byD¼(wùÄoCŒ9\'7ÀáO‘xì+…YÇf9àŒş¢ª°^ÆW-î¯=µd9{Ôå¤¶Sa\n$vV,}c¹óxË`Ö]­Ó±š°€õÚÍr] QÂß\Z}Dø“ĞuÍµåÚÜéy3»j+¥€˜´øİ@X6Qdõ4g¾zT«ù‘æí{ZÏ†£”øu…½D]6àœÂaÇ€4?Drç¹0¾C¾Úºîˆá‡ú«©TºäV27cAjVË\r’êÆ@ZÎ™Gi_5³¶•2šĞ7qyhö—šÿ\0AÈ¸’ñf=Ë+¯ÓÕ({[@\r}ŠD›GI \0Ñyo­1Ã½@Z²\Z¶FZğÂó¿•x¬ïÌG‰7í}C~®Whíú8¾g“ó8	H`¬ûp\\íú%ØÑØ‚ÇLµCí5]ˆ²é®‚^^r^9eŞ³ò†›¯¯”;áĞüºÃğ xç}ñèâ.×J®OvŞÊÿ\02²¶Çƒ¶i}û™ĞÖÅD\r+çİ•«@€-AR4ĞAr#km¥ºdğÏa€[ÚÑx\Z2;5¬ä0ÔŒƒîFN4Í½µ–ƒš‚å† ;¨:\ZÛİ@!y{ˆ)µæeQåºV\0M_¢Jß<>…Ã2Ã¼«ÀvÚWaÃß<¸ÿ\0>ÀùùK2E‘3¶n.Ÿ\\oUHfèæg¶Ÿ·ÆUVÕÀí‚l!Æ4›“uÃAŒ£í‚‡|ºzáÒñçn:=uÊU\n9÷³C·b\rˆÚÉGY¼µ¹Ô2:qÇÛPŞS@/i\0¸hÙ`*;?]2“˜NéKu>\Z¾Pÿ\0\r)[Sn–;¦˜\"èòÂæN×]¿®®£·£Ãk¨‹\\´|¡Šé¼¡ßa²]\":JŠeV\0is/p#ß2ú8iıXö’{C­rÎ5¼v,³Öâú®¶¨ˆ|÷cg+^´U$dtï@M í¼Z½\0dw®Û^Z0ÕyL`Ù\n\\ßm®ÙDIÍ2\Z€ş¯-ª&¯bk.aÌQkââàŸÙ®Wg§¿[»8e>äÊÁiĞ6„ÍŸy©AñawÊ½åŒc,qäJ¹œÃl7Õú#wíu3áÅ…Á.´ÓÖ˜·´¹6Oñ™³ê3¡|ï~ü¾‹¡¯€‘6W8Õ”{Ğ\0iÚAR”7lAr/Û@‚²ÔPÁáÛ@=+ Ã;viŸkZÎBQ‹fı(ÉÄa¦ı´d‘y…¶‘Â\0{Ö\Z„&:­°Ô\0NÙbòWÈÕ£}6¡‘çËÚÅáŞ«êÎe.ùáô—³åö=ïÉXºõMóËŸó»??.ÅÇ‡WC‡çpCƒÔ]>¸Ş8v§Â|eK5åjl!İ’Ã!Õ¶Œ›ª\ZX,Úìv­ÛPï—O\\:\0	Öƒ©ğ×=T@xŸó}suD0îÌµ§`Òo,îu\\‰ü’†òšX³>â!¢ã]0Ş=€ÈÖBOÛÖê|6¼±§\Z×RÄ­©·*¤jgÛEÑåŒæ3M]GoG†kÛ]=’†]•a¶ÄP½svIr×ÇÙQ\\©‘Ì…£zn¢¦ZEÅxì—ÑĞÊ¿úv©‰s»×Ì:˜¯©¯‡—ñÎÀYlp\0Ø€Ğ¹Ğ²=ÒG=	xÈonİ¤4_¶€Çg¹1‰N›Ñîeã÷¶Ô»õeMwáqÆøX îÛFX+nÌ›Ì3ø]> /{6Ä=éÓ—¿)×ºæ¾k³lËéµG£©bD­cé”È’äh,’xi4ºÖåäŞ“&A/A =í¬ƒô[$€Fh^†Ğ”K\r!4†Ğ \";Úéè@WÈ=Èjn^iµ6vg‰‡wØVõü§ß:÷Ó<W–«[&à.”8›ã•g7³tù¹W[Öp.lfÉ¥Ô5Óê[ƒwî,[‚5Í³[AŞªd%ìÔ>1“}İkwğO^¼µx÷6×äT7uëáµ\0qÙFúEÊÈE>`Ë®•2lŒÚà}´\\­Î—áø#\rÓ@ î£€ Ë«çIq¬L‡ºúL­œÜ\0ì&Øû:8X¿pÖòšÌûG|£íšmWËÌ‡ûDÁ[G_­á‘ÄÆñSÀ7»%Î—SÆ3m‹™²K–‚8)î–dYëĞ	ºÊ™uSÆ†3sÖ¾Ÿ««\'fùXHxİĞ\ní“„Ú DFxCÛ^²#B\0p¤ t;¤\0í ¡Ú@z\Z;Œhİ7¬ærU¸îš±Áºë–+²\\,k½sĞ¹ßÔ-ˆu:´åÎ£‚ù«[2íÒ8ZÇ\0±&$¹X5´›\\hÖ‰eÈØ·/ ÃI“ Óu¯A\0i@>õeèa	†”;ÂCeŞX€Õ†‘_©\0Ä6‹e\0;Û\ZÖÚ\nh\0Ì.ÖkÈj¼›Saœæÿ\0ğÓö½v7Çş]ÿ\0\"ÈÊ¸ºPáïEsc?9-r¶©ë8=3l¯®ªëXİÊ#=E£mY	ô°âÃÙÛL‡»ê)—–âÕü¢­/+$ìº‹bæÂ!üéê±ræVAñŞöÍ*dØ:[”kÛM¹[YÜĞŞ(nšÉâº\0ˆ2áù§Kãî¦@Ö§8@{‰¶>ÎøXm­Å5¼¦³?ÍÛM¢Šùb³\'ÅÈ»í«hëõ¼+ùFÎ›ÊÅœëxtŒxi\\ÉMeÔ@ÓzÍù)wËp<fPöŞ.—S^Pï³¢›Ú}…õ4¦ˆÎ›ÍHíkONÜ@DĞk@J{\Z\0ÚiM“¦€Ğô¯1â„wšŞ\nƒò/ZÖÊ2l9O>L3(ñşºà÷­Ã³ÔªŠ8.Úéİg-^C°e6‘ bFt ˆÒµ\"¯¢”¥?\nõ—˜ˆ™îfz¿q6,c¯ÌçeR´4¦×}Zÿ\0/B¯ORÖæx²ô×ù¿7ÒÏÏùsŒ{ÂKç‰’¥7N‡Ü‡1µC¥z+JW…_ö§Ï[L}­V›­q÷Ìÿ\0Ôç?+éNŞì·÷8ßØ¯>\r?{_ÿ\0ä¯ïŸâò¼ãåqzù»+_şN7ö(ı>¼|ÿ\0’¿¾‹Êó‡•µõóv[ûœoìQú}xøwÿ\0%|ÿ\0ığò·ÿ\0We¿¹ÆşÅ§Ñ÷½øwÿ\0%|ÿ\0¯7ùY__7e¿¹ÆşÅ§Ñ÷‡òW÷ÏñyûÛågáæìµù8ÿ\0Ø£ôú~ñğïşJşùş&şõySÿ\0«2ßÜãÿ\0bÓéûÇÃ¿ù+ûçø¼¯4ùQZt~öe¿¹ÇşÅ§Ó÷‡òW÷Ïñ{ûÕåOş­ËsıŠ?O§ïÿ\0ä¯ïŸâ|lç”òß)ÎYä}4£ÏÆ\rÒ¿‚êğ‘mÎ½ñô¯ïŸâ\';ËœÅ€`g¸Aœå÷†ˆCÓP¥iOKÍNŸNĞ¤oèMy¯05o¥ç–ßI\0Ì–Ÿh]dèãgN‘1ôÒ´\\éŒ1ƒMx<m¡ä=(:»b!ä\0xõ¦A°ÎsgøYªú~J¿†÷ü¹ÿ\0ü.mûW^|8}¯+izçİí®WbUõœ?Ÿ½ëëTô¥VÕe›J>›/i[”óÀKîh2\'Ï$Ë<!tíY‰gÕqË<F¯ß56é]¡³ˆÍ×Ô\\µ‰qás¦·Æ2e”ÜX³›‰gk¦²hRbY7_7qm­…Õ\" vĞ5«ã³ß»í¯%EšãÓ‹ìX—)lÏğš¿ó‰ô[®IgÅgÛWQÒ×VÂŠ×Jİg:Ş8€¦ªk,€ìf¼ÉVğÛr„7\ZŠgnÚú_éúó?fÜµÙâ›€º¨%jĞZ‚¥é­=#=(ÒÇ¥\0	é4¦Èö¡é¡Ä\"±fË6´Ÿb¡S™zÑÚSZM‡æG¼VdõlùÎİŸEÖ©GKBæÑNÕœp^C25M‚åSÎæèrÄÑ¥kN×¢½‚x)Z-+Ğ›«óAÏ¯ó/–Ÿ‰‰€å¼c•…†}—‰èÌwt!b­ƒmÖŞ¡×JëögˆğOôŠE¦×·6p\nR”§E=§ª”R;¯P{ü¿ã_®G%&DR¬GcyÆëÃ\":+iV–Ö´èü	Ú¡ÏïÛˆŒ7Í~jn#§\'”†-­xÙxh^š‘E=h›ÏÑåz´ÏrB‹$drhÅò¨ĞZ­+B­O¢£è¯[¦	.†cÊå¾Cç7jto0êÙXå(ÑVÒ¥)^Šú=}Zõ’ç}>°†\'(sLÇd3%çb\nHeZ¶}R¥=U^zËÙÛXó)‘ùÀä»0òÊC\"ëTh®rêkNë£ø—¾²óæ¦3˜Wå0Ù|SÔc\'\rèN•.\0|	º•>‘º”é§ñ/&0İoñ9¼h‹ü´gòÁÍÏòÿ\0ˆ#ÃÈ†ëåëRq£\nR¡Jú¦VîZ§­iÎêú«ñûãñeGb.˜âG\n5\Z6bcQÙ@ƒbzDiø)EÉîÆ65™šVgÌÖÚ‘á†‡ïi@WQ Él2üâ³MWÓòUü:/\0\ry},úî¸ºóáÃíyXsHpˆ=…ÅìJ¾³‰s \\é™õÕ])UµSÍìğ cŞì+:ó’;)Z¾¦´İÓ‚´ò²tûºóöÖ\"OµEã4´ÓÇ¶f¦İ&ënÀ;ÖŒöìP,(ö5Å@C„7\nm†±f76Ù3¹«-Ğ¦²hÛ»Ãµí¸âÛ[äûÙû¬È Ù»!y*,¹œvã¬ì%Ê[(e¸ãöèèë†\nõu=pİã#Z\0¥ØãÚZà—D¶‘Qq÷Áß4ş¶JßlC¨Aáa´éºÓëşew…§Zl^ú¥ã6[)±¶Ã2Kx†<=;	äà^Íbç&¥Ï#äÀwvV[E}ÈäõDg®›\0iéC2ÍfäÚ©KºÊtÕÇŞ3~k¯v×Ëm—ÒQa*’6,½e™\ZÈ8‚¥QÏéåi…Úgş8&éüğ[óÇíöÿ\05ã\\·ÿ\0á¥ÿ\0Äev;^`¿è¿–ßÛæáªWl¿È.dÊJnF	â\nãñÌñ#\r”*¯T‹¤¿¤êŸª~Ç3½®#ñ}²¢Îæ|èËâ$ã²‡«\n@ÒÛ£[F´-¯Á²³3i6”ÓYÌO?ÚºÏAå|¤şWÅÊ*c³¿vÀ•\"]\'½5÷G¦•îôÓ^à®¦\"pU-jÅ¦9®gÿ\0)ÜËe\Zæÿ\01jcí³üˆÍ‡Amê0\0Ò½}ªzQeç¬zSµ]ÈÓ1uòï-:N[&Ìçå6yY‘jU.ÕÊÑ¾ÓQ^ÖµúW•ğŞèŸ’\"\"1rÁA•„çkÌ“Û\n#šœ¦\ZÖ­¹R©M\rÇiZ[Aéü(¯‰åæÌÅ«øcíğÏy­0 @Çr“²¤å\'ãŒ¤=”—NŠ¼:ªÖ¦UŠı?ƒı¿ĞŞ¬ffş\"~Ç6KZH¥ş[?ÿ\0Mÿ\0öé?ï²Ÿ×üÎgõøöóX:]ÕÍş¹;ş\"å÷ÿ\0äı¾¬WòSı\'»±Dñ	ì!˜a¥ÀI\ZVš…d”¯8ÿ\0‡«úåYÔü—ÿ\0õËAöÎ®œxqû>Ró~¬‰³ÔÌŞn‡ç&[)@´h\\Ÿà[Ëñê+ºÒ›{)‰†f:÷8j²4.2p-i¨áÔH¥Ù\"Òš\0ØdJÛa®Wtğë71T¼?#ØA‹—™ù FÖw5Y·¸Pïµ*‰a[ËÀ|1ï¢[Ø–G¿úér5ˆÆÌK^\\İ²#2vÅ\0E\n¬3Y—œ\\[ŠèÑŠÈ\r]…ÔtØ,Ú\n]¥p;‰tMihùNoÇ@.—ZRvíˆkBgŒ‡-@ğ~ÅFŞÇ«›NW9çĞ¦÷ÚuÒçµ/-W7æ™ùŒfGïh¯•—ÙÀøiSÜ—O©¦&\\~yÇqÍ<cßw«[.~ı86G2>mŸvÖÈÑ§*ùÜí:)Ø¯XÙıFgöÿ\0²]<¬¹{™âf£ƒÁx¼lÕİ]ŞÉ{=\\-MX•é@&™¸ï4CÅƒ i°\r–}Ò%ˆòÄóL	Ø\\ÎÅ>½\\Â 8¾kd»tYGÑ¶•YYµ¸¶Ì\r(*Ce1ŒäñÏÁ:ÔAêSPúèCZ×ù\n”ªÕm‰Ët¿¬åeÍa9Ÿ—|Èb¬<Íh8şgè\'E´\'>Ì‹z…¦«­¯³M‘‹y.ºí®Ó}?ßV*wù}æN-—Æä 9K™“W¨Õj5¯£¦5§OGĞµ:\'ì••ş©OõVÑ!¿úçßúŒg÷¡^|kÿ\0´Õô·î[òï•^nrãï?†Éc\"ºøĞ.3.t+ÓJt8\'Jz~…¨Óxğ^Îş‹şh·î^9€ÿ\00n6yìe@éQ*tÄôÒ¾Šü%ï¥ş¥~§­ü¶ÿ\0«7–òsÍ,»‘œÈNÆ<pØ‘ëÇh-eªÖ :(==WÓ_JÌé´Oê\Zkâ-û“±åO›¬»9àÊcªöN=aÎpä4dë\ZFµ:vFš©éş|7y=ı-ÇÜŸ—|·ó——yœ6W¹Ctx¬9ÒCNŠW¥À>ä^Æ«Ç‡›;º/ù¢É2>_yÕ’Á7-ŒtrM´ÌÚq#í°DmÓHRÛHë³Ñü(W—•îõã‹qıªì¯“Şiå‚ ägãdxi1íPÅ¡õ\rLiB.Õj¼6–ëıCMsˆ·?r¿ÿ\0§ş}ÿ\0¨ÆzçÁfÿ\0ûM_K~äÑËß9¸øŒ¼†2$M\\‘Wèå´§f•¢ö:öyoêšñÄZ¹°Ãd¹7ËÆ^ÉNaægÀBnaÊü»_‡¢áôtzvÓô¯/¾šce&ÊlìNv~\n}‘ö¨1ñdŸvKÕ‘6[Ç*dŠÓ¢÷¯I—E=\\MÛföÌ¨´ÇÙâY¥)”;ˆfÂ\r€R4­5\nÇÃ!Îš hWõÊ³´yEÆ¹&æ…Ó?gÈNg?Ú.õÁs7›¡Çù†÷óGÛu\Zók—\r»\rUÖ”ÛÜÿ\0–d¶ÃÂŠ§l\rîºaØîÔu²ËÀŒH6ĞvÍ+m…!¦÷Ëµ¦õ)°NÙà>¾„	pv mgrã=\'ålë¥Q,Œ`%½‰Úm.F±¸,-^\\ZQfM·L°ŠªãÖã]>¹«tBÊ2í·öÁ]…Ôuˆ€¹Î‡¡Gªk6Xn\\h\0m¼k±ò¹{W=ò¾¡gŞ8¡ß°ªÔ\\p|`^Z=ã†µj\nN.f€$ö¿v\nkj_MØ^Ä\0b2\Zí­_dóq±Á± xÆğMÕÖ.nŠw\r×Nö?¬H\\›Ò¶.K¼yÖk!îl]Ÿ§±lºA˜o.´lË‰5Å+7 ¹Y6€X½d@ È˜XiuğmÜßŸ&[àı±®GrÎ—R¬TuÂË³0µÉSdH°AR–Å õë¤*40/A	S¦•şJ¡è*`pE[i‹Óù–ÿ\0ì£ŞßV¾K}dß¸°øtoĞ·üÈù-õ‘ò[ë%L½Xèß¡où–~K}e¸Ùo¬¢<&ş‚7è[şd|–úÉ‘{}KîLşô!üÈù-õ–~K}dÓÂağøß¡où‘ò[ë#ä·ÖQ}É‰ééğ¬üËÌ’ßY²ßY4°¸úÿ\0¢æGÉo¬™Ÿª/¹ñ~£ôAüË?%¾²=çê€±x›¿RcôAüÈù-õ‘ï?W…‹Äz!Gı2>K}e¯yú¦i¦š¥\0@[f¡\ZPiOä¢ÌÎY™LÆdE— ©0Ùµ<\ZĞl\n÷BÔÈ6~a€s\r¨à;f¯ëòöÓŠKè\\7îÎW…¨§>jÓ›¹ï3=aÈx¶×¹9³§Ö‡7ÇÃr45fáŞâdF*§l¬¼Åv&Gã§h”Û—É»<¶®™y­²u<£ÜPÕxŒyüçRÄ­|÷º,š–[6À\r[éR«)bŞÆ6æs¾Tvn^Pº¬;¶±¶\Z[G–š>¿\ra¿êÅ‹•^Dí¼Ïq7R,ÎlÛû¶Î¾µV˜UV\\4*¦ÕØ\ZÒ £a°¬\'ÂıõUjšÍÆ˜“2@Ë¥ÁBõO«—`ùl¨C7^r¡ßSuUm$oâø-;c\'¯†{éşâtá//R$3Ñ9LëqÃd©Œ)ÌÎg1ÅÆqExûÅ½ujhĞd^®œp-še¶ú—4Rfr¯¸Ö61Hšaİ°\nH²:ğÎrÇÃø¾+E÷„¯†{‰‘¿\n§^Zœc9YOñ¤:V}šétö{K“zµ±#p…v\'Â‹±–â¦q¬Oƒ~×*çù—Oj0lùîı¹w:5áI.œÂÎ:2\\ÂÂ>ÂÙR-­(*N;Öàh…„²om <²íµ†à¬ë ÈD†Lß@4Íºh6™éYï@+ĞÓÛÁ\0S(fE…ƒº‚¤ŒÒÀ)\0ˆ­—©2\rƒ0x£Èó6>=·ë½ÅC™/³8£´fŞà0`°.î!óz§7q®qÉ\0_«c[‹…yÍÍ¯òâÙCØØm]xÅ^o’çÀı“.Ä½^Ç!ÂFpr‘íßÖ¯™y­¦vOÌá™Ø¥ªñ±Â×CV³JØÏì–MXdnÆ*ArÃ6Ï3[ØÆÀ™ãâçše¥åªÖX]â\rÀKi1ƒÂÚ÷<4®<í#Õ¸±båE–=öô&êS¥ÏIï@;\nı0ªªGZ¦aM]ŒåÏ\\|áw‰ŞñŒtªt×wÎWlÜ\\IÈ‘ |H\Z~»á/ªŸ›2@0åŠÃ6Ï†{ŠÔåvR3\r9ÅÛ0lÔ¶ì7\ZØÉ6Âd#º!(õ¸à&êì&İ­+À\re#Ë16u¦×³’¶FVçƒíH‘§F·5mªkl¼¥0Îro\"Æf\\€jÿ\07ØXLß\\/‚¿<ÍÑÖ}tÈÑ2‹çÃK‡ÂßÓ«bÀ6S@}ë Ã;GiO:Nÿ\0Q\'m±ê®eÅ3Ó<ffCİ»_3Ü¶eô½:âˆm¨UL­™\0As#ZáŠó	R‚0%ö\ZØ9\0ıí O¶€Ff†ÑÜ€`,4FmÛz\0s4fh6:}U˜†ƒŞ™İœ‚ä`, ØD‚¥l:\\¡0me¬‡y›2­–£aº•/Ç~À/)SmfÃË\\;ƒ2FeÑĞcw®ßR®?g¸¾wæH‘X=BÖÒº]w\Z–³²¬Ğf£ÓGV÷Ã©bğ-áğ-D\r½·So|²¼îc]öYÒÜ8æVy \rÀTÏƒ!fóÜ^`²ïÕ–,|JàÍ±w·`8¦·“bV\\¶X }sSöMÊâu—\Z›PÉrñğ¸¦µlS³{¼ÛØMÕzğw²ìßHi4!5 ;8&çê%X«(rÌé?nõV“u9şAã\'Ì×F!Ñ‰g°›lK·³nšôÒ¹Ú~÷v~Æ–0³H]É\rutş¯¡tk„2¬mÁ®A²àÒt¶Zpê_GOJ‹–­„şa¹<…ÓÉ4 ı÷CZVœ?ã¥zo÷©PÉI§,µÀŠÏW£ÿ\0j†ÑWFV\\ºĞ8Ó?x½VZ¨wÔ\"rŸ‹J¦jŠ¹İŒ¯$FšèÅ›’#ôtô*.]ôjèZ¤A\ZşöfCœÀü¶«’j±#Ò½!Q:T~©+i“øi¹QúÑğQ¨gCÓ¨hİÓZ&hóÊnÔÎ\'êE8«\"–H®Ğúú?Ğ»º\"˜æ\\[ùÕJÏRé[î)\"ö™u%„ÕÏ¡˜æ72•Xmq¨ôôÒôúkEo8áoSåÇY\Zqv«Åú:ÍnÎy}.œc…¤M¤‡“•¬t\"o‚S8	k¸¼u =Ô² \Zu/¡\r›©\0Êİ»N•†Œ*»½N„\0ïq¾„\nu/¡ÀWªÿ\0Ğµ\r|Ÿ ÷AÓü´LŒ\0#IU>úµ¢ÈXG Ùë@ZÂ©hè§JYR³Ô‚å&âË<…rëıé@åS«Ÿ†ô¯%M´,@^>Ú>Š×£ù)ÓUF¬³-Ä—§·i¼ôZl¼$4éşB­+ş¥Õ®\\Úãír¬í$UŞ&^µ>5şzz}½ĞÓ± ä–pT~= \nI{–*%Kˆº-ÿ\0Z«^vrÙe½Á­]\r3ö¹ç9ÿ\0‡;Óè=i:WÃòåïºtW§¤zøéTÉ¢?¾İè’¿ÕÓE‹]Ì«”€íY§I×jŸBšŞL…÷+Ñ¿\n×¤¾…?dŞGÈŞşÕü\nmC—.¤²+P÷`|ŞÇR\ZREèéõÒ›ÕbsÅ;èÓPÕ_¡!¤˜š•çèÓô ,q÷[êJ±VTfêå\Z‘e:JÏR«IºœÍú•İ5§A}«`=jWú)Ò™ÃÿÙ','S',1,2,'2014-02-01','2014-02-28',8000,NULL,'A');
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
  `foto` longblob NOT NULL,
  `capacidad` int(11) NOT NULL,
  `costo` float NOT NULL,
  `precio_de_brazalete` float NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_comunes`
--

LOCK TABLES `areas_comunes` WRITE;
/*!40000 ALTER TABLE `areas_comunes` DISABLE KEYS */;
INSERT INTO `areas_comunes` VALUES (1,'piscina',NULL,'ÿØÿà\0JFIF\0\0`\0`\0\0ÿá\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0;†\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ò>ÖÙ´«yŞÜ’‡,è	\'swúõe#´Šê9Å•«¤l¬Q¢VSpxéZğéV6Ÿ´Cí&K»Õ”}‘”dmvÁê¾A9ô¬e2Cİ&n|¾J‘ƒ×·N½ù§bmvOsö“]6ÖKq#æËc°8AW¾Å§6VÊÚÆI%r<¹mÁ•SD˜Ú?.¸ÇR+>Úí#eM¬8ÆCäzÜÑ®t†¿y5˜nçXö£J—åÀH ã¨víIèCmÏ‘j¥XÛ@P÷1ı+J;²Ç$¶v«¾M‚5Eó6‘Äp9àûŠÚ¼Ñ4İKV{MşĞ²¦ VùdÎÀ}@É`Ø^£Û8ö–SKy&m§š÷åÛoÌŒ@\rµTdçíÛò{”ıäKm§éio%•¼»²¯˜€\nİ\0ÈÎ?•@mm^uq£Âù†1º#.q×‘;æ¯Ka-¬-y*¼qÆªŞt.¬lAÆyÉ^£5š—7L$Š[‚cwó7d;c|gŞ¥#4¬Y,­á›lš}¶ÁÁâU`{©A»Ÿ£İ wÓ,!É+\ZF¥XôÀœ`ç¯8ö¬ØŞ+F9îõ	’%uBäq„Œó’{æ·<6->ÅÉ5Ã1Ÿ8!#Ã0ÚO9È#½Q&g6Ë‘i^‰?ì›I$™¶#Í…\\ó|£8’O°­xOAĞ®\"‚\r\nÙsmç0x„l¯Îîrp½=+š†h´Y7XË+4¢A3>hÎWi^»¹ëÈÇQšu§ˆææ7¼ÿ\0JµˆÆ$ŸÊ%S%yñ’Z„ÖÈgk6xwG»¿…^ÂÕ\"l(ò‘rîãŸ^+±ñ€ü§h:¥Äp[…†I¬Ù‚\0ûˆ%@’¤°ašâ®µˆõNY¤yRåÇÍ’3éÀÉüÒ¯FÒê[tX.àDfÅuÙƒ’ìİpHU>Äuâ…\'ïGÅ’éŞÒÒÄIyc¤Í·ˆ¶ªe—[÷?\\Ş©ëzƒkgnéaoó“åÂ°/–ËŸ¼Ä=18ëYZa¸I\nA3*¸Ê‚ü6:…Ïãô®\rE5m+6HRxåóUùdòÀåã ø<çêqnH—;OW¡ÏØi\Zt‘ÙO¥ƒ<’º²Ëe cªã8==Euºƒô¸ô-v[­M{ÈĞ$lj«pg€yïİóQØiºDE¢7—Á\n‰§ØŒÃkœ¬k“ò°;Fà9QœÖö«>§{wp³ÈˆPG–“ğ6‚Ã#	ç?­iÍÔ¾fÓ¥é:,»\"]6Â_İ€e{|ÙÎ0{óÀ\ZÙşÁÑf›BÓA?(_!\0N™ç¯=2+”·¸2É8‘£‘°ª£ø³è9üıëB)‹êæ[ç›ƒû²Ä¼nR:ıx¬d¤ú™9Iu:«?xb?.i4{&–F\"(d´È$ÀvÀõã­jøsÃ>¿¿?†´ç—xÇ\'ÀóTô­:mFŞX¬J¬ÖäDˆíó¢18=G<ôâ½\r~É§ø{ÈHâc J«\'!ûå±×ïßó¢•ùo{$tSrz½3Æß¼9\0³¾Ótí>Ö/3É¸mÁ¬c‘NG¥T°ğ/†tí>fm\'OœÈø\rzŠJœgåÀ‡Ljş§â.îÉ-´áeÛ sÎ@¦qøûæ£¸Ú+8çÔ[Ë‰&ÄofÚì”g8 œ+¢æÕ×…ÑËé^Ğ/§ĞìL±Jv±‰]áÜ {cÛsPbøQìp4Ë¥iFÿ\0”;¨ÉmÀÇc×øOÒŸÿ\0	ÙolrğÊ»ä(şS‚B“ú‘Ô\nMjÊ94Ùµ‹KÅtm¼¸ahğäA?SéÉÎzÖ—9”›ØÅÔ´#J¸Ò.ît›1©ûèÄJWz‚§§Q‘ŸÎºO\nøz\rÍ-Î•a$ìñ·›åÆ@ë€\0bj¥õ¬ö!5›N‘–5ˆÂÇì²ğX=€Ï®GLàeÜÜê‹ivú‹³ä·DèˆÜ~»ïÀ\'Ö³¾¶;yoK™v:?è>\Z»³V—B°”‰Šd@ÏĞŠåäÑ´ŸÜ0ÓmŒ8;™aP_8\0ŒŒwz×SğşâUÒÁ0ïÍÖÉè¾ÕÊ‹ù<˜íã!•ªíÆqÎ1ÈïÏÿ\0ª´i££j)×vvmvÒ[é‚\'ù#\0@>üu8ıjÿ\0ü#öH¶Ó6ĞÃ0URè‹’0ãëë+JİÌÚı–ÔÇ:¸m¤»mnƒ#oLëÒ–#)²?oÜí’ûTåW§l+\'QY®ÆR›Hzè:Ö*.•kÜ_0•¢[ÛÎAéëßŠç5=ÎÙƒGobÍ¹FGÓ¿ZŞ3ªØM.öv\nP·;°séÇClTv%nÌ‘ù_>7e†01ÿ\0C\\ÊRÚ©>¦%¶‡ms\ZÊÚu¼HÄáŒc\0ã?äT§NÑí\r§ÛÊU‰;£t=s]7“µUÉ2IlŒŒŸcÓÛ§JÃ’)n¥hí]n‚vîo8Èî#èkXÍÈyIÚâI¦YOæ©Ò´øª¨r\0À==j”–\Z\\|Í:ÛiŒp}3Š«q{4“3ùŠßœ{Ó%¦£L3#»8Pã¨?_óÏ¢Ò4P¯rD²²¹|&›`¶Í¾Z(ãıiËe¥¥´ë`	Ì!Fp22G?ızšïQˆÛ¥Ì6‰ò31\0çŒw×«>óS†x\"HÖ2àmêC ôì}hI²’œ™+éºT.[HBI‘b\0On;sÅA«Ùé‘Ç\nZY@œnÜÊ¤¸<Õ\"J÷P”$’¸Ê\0±Î=³Œ§áYóL!\0#‘Š¸§}K‚|Ú²[+[Y$›+R£4KZ¬º9UŠ-\ZÑ‹3å)8ÈèzÖRíQ’8ÇLuãŠ’ÙItHV g±#üõ÷¢Q¾¡5wÌlL¸Vk\")vó`½Cs´úOç]Şğí¼®H¶Él0)úg?VÒìá¼Öâ•×ÉZY˜ò\0\nƒ¿SÇ|Œ\n~­q\n\\<h* ñ´d÷ücÅUÏ™F,Á9w*M¤é3[H±éD\\ \néÆrOÖ|ÖšdPŞyz5“¼{UOÙÁ±‚?X¹¹{SÄÌ²JÄ$Î@}¿>†²u‹ˆÔDXdñ¹º|ßOJÖ•7m^æğ‹{™3±ŠÚÏMl¡´šmûãŠ0¼\r¸<g×úñš(ñ¤Í=¦˜Ï!cµ†İÙÂş´WE;òêm„İ˜éVq´BF	<|ì{}Zl¦=€c=Á8>ü×Yá¯ı·Âz}À¸³%Öo8Bù‡Ç#¨ÁäóŠÜ‹áı #–í7|ïL)ç§÷½úâ´æH¨§ØóÈvüÂW<Ÿ¼Ã¨Ç©«V\r,×ê¶Ï.òr\\{qkĞl¼	d.Ú2ÇÉ1íÀçs}3]V›¥ézeº}%€Ä0T¸ñƒÆæÅK‘~Ï¹åCL»¦İ`/3±VhÃ\0àT˜=rELé‹#´ÖËv¯;F—‰;Œ¡YO¸,0ÃÔué­ÛïO³Æˆáä”¯ßSò{òqÎ{\Z¡ªiÒK\'—s\0h–5gR7llí!;x\0ç9lõÅ+‡²]-ó.¢†x¢ºY`TRñy=tõ>µ—-ğàJ\0Âî ŸÓµÕk~\Z½Ó®îîml¦û>Ï03\0@B2zqÇ8íÖ±LÑÍrgŠ$.Çy0\0^3ŒzÔã±“N&œ\r§ßÁ÷vÒÂ±¡A%«©g*ƒåyôSŒÖ…–š.¾m4\\UC!C\"àe²r2\0öïYV,#g0Ê7?+ú{Ÿşµiiú„6¶\0H ™ä—s.1,cXoìÆ8îzc©nç<İîˆ-.£¸•Ã<­&|½Î~B;{V}ü™\Z\"\rß0\0‚>•²úëìõ†Ü~ñÙ_ÊO˜Ã~ úŠ§pÖĞİ‹·6ûe…¶ÛŞ4g@oFÈÎ}ë5£¹ŒRæº+îâ4¹ÓmešÊ{\"S¹Ù°>O÷‡^=x\'œ_²·¿ÓíPxf	Ç—&3˜Üt¿¿§#Ö¡°ÙqnåÄŞR•g†&#œıïîŒqÛ¯å]fâÑõ›‹{øì®aºŠ=ÆhòSåØL˜êàcw©ô©sotlÚšÔã\rÚÏs\"™Xÿ\0±$äNJŠÖY£‘¼©¤Vç³£ò­wÃ³éz³Z\"yÀÄnã\r œ8>ŞõBHÍ´+ hšV`c¸Ïz€}wg¥W™“ŠW4¬-o/¬ï=B;XáAq\"Nä 6ÕP%‡#ĞdV|vBÇV„ß\\¥ÔfÃŒ† q’z{Öî—¡j8’ÊìYïæIgå00Hèr@àwÏjf¿£âÏËÔ ¿J“ÛüÊN$yòíÒ¥^×Ş×¶†-ÊÚÄñ(Œ,6îÍÁËäà\0N2£tëM‡|·Ê‘&Öb[{ ‘ĞœŠŒ£Ê¤	€–û„½?SùÒGnmÂÊK,»‡ë×‡^âvz¶j®©2Í§Ï gÊ¸LŒ×œœtéô®ëFÖ’à,q1Hg(fšáY÷0è¿Çé\\4/n-Ö6BòÈ»›p*\0Èôí£Ÿozë¬.­¬m|ŸøöŠICŒ`@ç·éz`qÀ\'6–Â‹¶¦…Ä–s\\Oyig2şz$y72eÉqü3š³ª\\B¸óƒÅ#qlü©`q¤p9<çîšæ®¼VÚ·ˆ-- Á†7èİÊHÏNœsëÒ·b]5ìç7E\Z«”)¸) àœğzœ¥mxÉµ¡×N^ë8[»\"ĞÃ\"Ïu¨»šxŒ’8äaŠ(qòŒ~ğô&­Ëhú¥¥¶£¢›£ˆ0È‹7™†ÎáÕşeÆrH=G<h?‹WÃ^ ò­Ú)bšI˜1Á À¹ õÏqX{5½VAa$‘¥ıÒ¦Ö-ˆù ï»Ÿºr3ïÏ5º|Ñ¸E¥m¾ ±•ô«;¶vGR¬ûcDö \0uäw«¶‹oâ/\rG¢Ş½½®äŞiìç`•É!ãbxËvÿ\0ërırõuÚÜF&étyPåC©+ßn}³ÍrŞ-blôi\n¼¶¤°,N0ç×¿ó¬á®rMhu~İ\r¨µ6rÅ%µß—,se\\8Æs‡ô®&Ùmcóäh\\Ä\\œ¬›x$Œdã<ã§õ®ÓÁº´×úlêS´¯ŞJÊß|¢íÀ\'¾3{W˜Î…ogXÁùdaÓŞ¶kKÎV¹Ñÿ\0m¼²—µA\Z/DİIôÏ<zv­kkë»%‘İ!u?uÏßîÄàw÷ã¶k‹·y7%-½pp3øWIaq%®Å•ÒV\\í “ü]Áãò®Jô¬¯	Ç”Ò·XÒÖKiyòüÎO\r:AÇæi“ê¶å@x•A	°‘‘×ÿ\0ëV]ÍïÎeò•äâ$˜\'¿oÒ°&vI]T€\0áWøjiÓmİ²#II»¤^&ˆ	ØH‹Àg\0G ãëÓ­cO¨‰ ‘¡#ù°«ëÉïÓ#œ×8]Î@ÛqV­n&³ÜI&ìüÊ:qÖ¶TTuF®ŒRĞ¾»§Ü$\r ğœúqÓñ¬¹a’ÌÎ~ğëÿ\0ë­d¿K¶óT$rà†Ãà¶GaÓš‚K!µ\\L¾VO~GáÒšv%Êìô+Û]¦W\0nÌ28?§Z¿=¢^Í+[¨òùíÎIÀäÿ\0J¡sn‹´†ÛÑºbŸj»a€*y8$7¸¡«ê‚KíE‘ÜYºù²£®Ô$ùdı}jE„Í\" ¸ãG\'8üÏ?Î´ím£œ£“ÍÜrãŸ\\œzóM‰#¶˜]ì§wO›Ÿ§õö£˜ŸjöêT¸Ó¦X8H¶qœĞş´GºÓnĞ’q†QÏëMÉº·‘Ú=›N“œwÅg}^äÛ»²™ÈX·q=Op1ŸÌ{ÔÅ·¸FNZHÙÒµF0I1Q&èxÁôëùĞn¤ºÔ•ÁT£™ÏN¿¯kæí¬.0§ËÊ‚»‚1’GãRZï·-˜!œ³ú‘ÛëZf¯ÏÜq\\Ë`ºsm~³‰L¢>k°À`z€{`cõ-ì/£‚å˜bAÆ=}Ítòé÷1Y›Ú,¤[rÎ@$ş—µrrÙm¹hÁ<çÒ·§%$oF¤e¿B·‰ç‚{{1³*–\r»±Àéİ(ªZ²gnF0]ÿ\0¢ªÖĞÖÉhYğKÈ|¥…ŒH‹™F·fó$€O=¿\Zé­Àíh-#(0¬¡X±nà•zñÛ½s¾»†éæKpó3È¸Ï˜Ü(õúöÍtkm1Å×ŸnŸ4V°’dsŸ¿òuä\0jÍ´o„½¾·†Aw‘¤©œìˆü«º¹<uüªwİš3M=Äa–0FUI1 óÛµXµÑoÙƒugŒ‚Ie<Œ˜9I!xıq“§™œòaŠ4“y¾c¶\\‚NU‰9#3€3ÅâiŠ« §¿óÑÈÉa€Å{\nŠá\ZÜêÊù`áûwçœ[¾1Ü_48ewÏ»¡c©Ä:ÖlóLÂEî’0euXşïq?Ÿ q×#Š\0E”Cm%œöÒµ¼›†İ½;OP	ç<sÇ­p¾!ğÚod¾Ó¶Ä­“²F¹sŸá#\nAõäızWr·7_ldòÖh]ÄjñÎO¿8ÀÈ>Ã›+’¥¼²„8,\0ùºzBGå#­°š¹âRZİZK()) :áÁìHúf¯[EoörÒ:ïEİòÇë×‘Ó©¯BÖ4+mQ	–7Æä¸Š@¬@ ½ùöÉàï¼5{¡j‘=Û(·,MnÅ“p2qù\Zw¹ËV“HŠ{‡·šâ †d˜¿»Æ?y{ñş5µº¾)q+Æ¹ØaØq»ÈïëZjk‡€y)$Ğ€DÊÄ6Ü§óâª²Ï,˜ù·|Ç<İ»qY¦úªVÑ\ZÖ\ZJYß­¿ÛÕ¼¤Kt$PeFHÀ>¹<q^ˆ|.­í5¿\r‹V¹µ9º³gV[ĞqÊåTœpïÏJòë¯<ò¶váÉÏ˜£s½ÿ\0\ZÕğ¯ˆue}>ôCo)\r$N+$uœäb©¤·.3åÖH—Ä×pOvš–×0#DÌ±Í!gŒ¶å’6^Ù9éƒ†·G‡´ı;Áú.©woö·¹´Tû>ĞK»OİÆW\'ÆsØñÚŞ­=õ×1ìÙà‘‘Éÿ\0<cÒ¶§Ö¯äÑâ¸†BÚ5†‚f.’0+¼¯RNBƒ‚\0ãÖ’ÓAB¢¾«}‡Ãhtí-o¥º[È/­£ó<“ˆ·°$ôÆ\n’ÆOÅs«K=ÍÀYfFòÑºã ‚pjÅÕÒÊŸf†\"d;#%³òŒ(Áä±ç$ç8ªw=«yJ$Àld®1Ï=?Ï5m™Í7·S ¶²·»Ç8Ûº@rz\0ïœŸOË˜N´7Sµé‘<©ãÙÀĞ}î}ñÛ×8íYŞb4ñ¸-!AÔóëÎ:zU»7ºêUO->fıØ`¼ÆAê3üëxêÙ”\\¦å¬VItèÛìÅü¹[jœ)äóŞº(®bVŠò3±HòæFÊî“nqßØW5%Ìúl>cEn\Z`H`0P±úWYáêz¦ ·Wí2X:y¹0íóIHãô­)+#Zp”™J(ÚßUòdÒâyKV¶Fİ†ëÔœëÚ¶‡‡5íJÂâÍôµ·´ÄÚ$±Pà°ãœ‘‘Ğ~5é60Ei¬QÆ£\'bŒæ›öˆ\'pb¹BAç¯5ÕJ‘·sº¹w<æ‡qÚ=¬ÓYM}k1š$bIVB®ß™‚n‘Ÿ”ûDRX\\hZ|–Ö–6­2Eå<ÖÎ‚y!e`ÔüÌA9@èÄ^¦¥%†GLÍV¿´·Ô-%…Ø+:à4x-úõëÒ¶š%ë2\\i‚†Ñ.Œé2Ğ“Ÿ“ ã¯Qõ¨<i,R.—±˜mYà\rÄcmv×‚&¶×ÑÃ6æ24Ñ>æ9ÈÏ°Éäzš¥©|5¿cï¨Ù:ÛÄU²ƒï“ƒœ|Ãš—%X%.MN{ÂóOo¤£ÄêÄİnayŒú×!$rK<Ó1.Çœäšõ\r?Á\Z¶“¦çì«9yƒ‡„î\0‡ ö®óI»³ÔäÓ®R@0Bî¹?CøfŸ´M¤™|ªæÆŸ<)åÉ4ğÆòáØ¯a×ç¯µ­s³¾TÈ›rdfç=¿ıuó¿˜ĞD7ã#\0OU–ıå;]vÇ‚\'ŸlÖÃŞ¹Ì©6î1Cy¹mã‚F8ú{TşZË šRŸ8†øVƒáÛí{tVv—üPBYFqÃ7İ‰®š_„>%ŒFc}<HÀ†V¸9ğ_äkSnW-h=µµ¤5´!Z6ÉP¤“ìzşÍÇp»€TP3ĞŒçÚ»{¯†^0€˜šXÄÌ’có ÕCğ¿ÅÈÎİ”3Ÿ¦sŸj ’½Ë§K–÷0ÚÛËŒÍ+•ÎÍùÇùëŠm²!Œ«a[ã©ÿ\0&·âğgˆâD—ûS\0d·ú;~}êœÚT¿h‚%…ÅÌ¿pc;Áì6sœöje4ÖŒ¢mË e!€àÔöÅW{Yd>hu\'vy=«FâÒKF1ONK+.¬ÕO-És‚G®A1mìÂ-ëb{ic~ñ˜zªŒ}•@&ä/×wl“Wît¡\"»2ÍÜ\n˜È\n;zgÛ5¬ÒŞAo!²ä—=½úVŠ7ÔqqzÜ³eª•­Y/ÜİyêyÅ]’âd	,U¾óÉ»sXWQ¤w‘Hc8ùsÇãR-ÛÆ›Xó‘ßüçñ¤àºè©j‹SùSÈ…˜¹AŒ¹éŒuõàV¹Ö­-mmcX[bçh³‘ôş/\\f¹×¼•£ÚwªîŒŒœş´º`c!ÀÜr9+÷\Z4Ö¢t¯{¡©6«%ÜğÇ)r\\—eÃ6ìw÷=ˆ*)m¥°Ek„U˜.åhäËÓT#[¢ÛÕJ1ÁÈ{gšµªÜyÓ¾èâ*|°à°<ıİŞ ½ñG*^È£±Ïë¾Pµ¶Ù½Ê†ì0´RkŠ­¹\n@2?_¢ÑTt7‡u™4Í\ZÄAKpêÛYĞ)C1Êç¾{û½c¡ê·Qy®gqº6f#–ò¡c³ÎàıWÚ¼şÅ\"IÓ¦ÜìD8Û÷ßëÆßÌúW[£ùÏ>¥?‘†S/ÌpFòïÄ*¯Ò³’±¼ÑÚYx¢ê[ëè¦a²Şè)—R$9fÛ³S€ÕÛ_G&€×·‘bäyĞ7,$ÆäÊ9÷®9ÚHíà÷ÜI¼ŠÄ.ıÌÌù<c$\'ÑOµ_İŞI[— Èˆîœy¤eÎ}²ìŞÁ}ªSe;±©XHcá“Î/µãá›xV}€úà}½ê1\r¦¢É\0yLªÂ5!ÊïÀp\'©;s^T÷Í©\\_İHşJ[ÂFØòvÊ\"*Hö\\gÑEkXø¿QÇì³2Kq\rÍ»Ç!llc~½ùõD£­½µbÎÅ$ë&e¡aÎvxÇâ*EBdKˆ›qf¬‹œaräíêNç¥Q:Û\rVEÛCmöi^5sòå„¬¡‡r¥HÇcK>¼²ØC=´!e’vØ„‰oxş˜,£ê½FEMÊ-º¡IäÎÄDÿ\0Ã×=\nœ`}sÁÉT2\\[)[sqk:˜¤„¨ùdç’3Ï·µ_ÓnàÔîPÃo±å‹ÌFİ‚@Ø6ÇDaí‘Rı±[d:<Ì›|ŒÃıÆH>£¶i\\-}<×|\'-¡’ïMuÚ/dÍóÇêT“ó.GLä{Ö³¬XÏ¢`J²çn\'Ó¦;ç½zæ«§Gwf’	nhK0Ş	R=›‘õÎ:ƒŠçï4{}JÌZÛN!¹;‚È‘|…z€FACî8öæ©;t9+aî¯\rÏ>“Okb\ZXJ‚xcÔtÏã‚+FÂÊæôHĞFb6 `¡ àç§j.tÙluˆíu/5ã?91¶àW¡`qÓŒãóÛÙøn9â†K)ìˆK, dp’³wóŒŒû+	Õµ>Fİ™ÆëºYèÑj÷°¸–U¡\nVXÛi\'róŒøç*)@“ê6ÍöhãÚ-ÕØ†•°m=xÉ®“Å‹Kğ¥ÍÛ_Y=ÌL„,YÜIb©\0ôÿ\0v¹ÿ\0\nxzml@Ó?–€…O4†eÆ;„ujœ—\'3/Ùİl$7bŞãÎ†â/4Ãò²+¥¿„~£Ó¯–VY	X÷F2O5ßi~\nW	ÜŠ#,ÀËäFèÁv0#œï:WemáíÏJ%,’V‚\"ÆE„ç\r‘ŸÃİ+Y½l8Ñv<NËJ½—Q‚h¥l~îEÆì€úŞø¯A²ğ…Î­0‰³”‰2ÛsàtÏ~”ZøšY®<»¸–ŞTJ­ÆK`’0Éœq‘9®›A&{)w™àb¾T­zp3€h§QÔŸ,•iÒ‹–¡§hV¶’#Ùi°y£\0K.\\¨1¸ŸÒ¶o%û0Š[‰@#6r¼÷ÀÎ\nóø#3Çs©)’7Ø¶BÛÁa†85ÏkrİE£Z¿œÍqp¬Íf‡…>óg¯O—¿<WdbwrÆ+C×îu»	\n¢O?wÍP8îFk>mi¼ìCd¡NvoPÇÀOå^-¤Şé²Ë#j;‘bRêäcGŞ\0€3ù~v®µ>ÈYİÚ–Kœ;»,¬Á¾b£ ƒéëí2tZìÏZŸZ2ÇòjV	Ç;®—rŸ_L~>´Ë‹Dg—T¶•Cc!wr{|µå×>3AıæX@Šb+}”ä³aŸ`ü¨Ïâ‹û[†J-›°†5B23Ô)r¾t{,¾ XX!KAråñ«à7`b°<]¬ßi–ŞU–“r\'vô†V@1‚9Î8ü+Ÿğ¯ˆ¯uç673Iun¤–Ç+IéŸZî4]rãP…ííä¶ò4k‡*6ç öìk*±Œ•¤¶›Ñ;v^5kx,ÖÎâİÈÒ”,3´rr0£§=ø8¥Óµ+mOTÎ{+HK.v‘|XS˜d7N¯ âº{jkyŒor7)?(›,ÓëÖ¹kíx\\ß2A3Úê(…Ñ.ãåØòœA÷ôâ¹$İÌ*:qºnì?á]øyg·†]j6åHŒm\\¹9œt¬È¼ Åâit«­NePH¥\00P–$ñƒ¸UO\\ŠîÎßT¶µ‚»|æ//*u}Aô®WÄ^#—]Õ$¿òRØÈ6!àmUçóÍt{Y_Fr:±i¨½i¯G¢ì+xJ=ŒJ†%@Tdà1#®GÌOûBº8u¯a@_æÆv±1·àA¯ğ·‹ŸÃ×W:”€O, ,ˆÙù·zã®À×_áíVçT¶¸¿Ô/­¬\ZyZDÍrùÁ,€Œ@ê1Š¥7ÔÚTôg_u¦Ã=ÆèoçÆ¬M(`=ÿ\0®k™k­~í„6w1´qgrM:R;gõ\"[Añ²¢Gnº]ühœÄî£œ\rÜûøu®{şMsKíuá™>ëùr°Ú?ÚY0qõ5R;!©ÑŞi×ĞÛƒu²éÆà’F¿;Á•úÒiú§ˆ`hşÓ|.#íXÈîïšä-üa¢Ü@Ò_i<¤¦	ß`Èî®ızşsÃ×¾»»kè,šf¢chË“I}¹î9ô¡)q;	uËMmÖÊm\ZmD©…Å¡`Nä	úuæ¤Ô~xO\\µÊéğÙÜs¶XÒìT0ÏQÄW5}âÿ\0Ax,î$št„²G4wRù_1ÜCNşN3ÓŒt§áßéfî{-=a	æİjÁb1ëÇA¿Z¥©ŠZ¢	>XÚm…£½x—vâIcËÅrº‡†4Èüaá½.Úg’ŞQ7ÚpC\r¤– ~9æ½§j_ÚIò@måØe¸*òOxgûÄí«Gm\Z;V’3	$¼ÛUgÓsÏ¦j$ç¾†>Í}”qÑi7ÿ\0åÓíŒbÀŞ>p[o”„œwlcñüksSøjŞmÅÑœyÇÛÂÌ	ìÜœŸ®*O†\Z{®­¨ß¼s.%H8w|Ìã\'ô­zƒ4nØx®÷ZÏ=eÇ§ ÅEYII$ÃW±á³øFX£kï.âÒÆ>Ÿh‘]ÉÏ`£;ğ=ÍA«Ù8Ö(¥íÒn#o”œ‘‚O¶1ÆGzö_Ã§h²\\Ig$ñ(RâKPª-ê½À¼Ò÷XÓ[ÃSÃä¡‘0<„LU€!~÷*yì8æ9Íîc.nd™ÉİA˜Ÿg–Glí•œAéƒéŒç5¡mn§Ne!t/ ÚsO\'¾8¨¯î`uÚ6fŠE_•Óæö€N}ıÂ¡¬éè‘Æƒ–N¸=Aÿ\0³ÖÚ´\ZÉ$fø±·[[˜Ë=¸P’Æî<ş_äÑUüDPéö;B©ÜÄŒçéE;XÖ*ÊÇ¤hö‘Şü*±ˆG`Ó. ¹3qœäpÇşù÷®•-#}CX–‡ÍnåRQó‡wæ¸ü)ßdßğËFAh\\ˆ¥Ë\0Ûe•€õêGjêŞkÍ²yvöª_ïovlŒŒZå“Wcæ±ã^\'ÓŞÙmàQ¸,J$xòC±\\ı\0ÏPŞµLm®-!·’dkGó2¸m§1ÀÇ÷xöôíI›RšÆ{»‹u‚+ØãHˆß†òÔg\'<À÷¯<Ô´Ë3K¶2I*Z¢\"íqm½ú\\{ŸZNªÒ&‘’kS¶¸šM#Q”³\"ùÑ»şï†_›æíÉ{b¤ûa0,ª³ª(ê¼(oÄß•Q‚ícğÍİ¹r%w÷ccy?‡AßğïT¤—	 _Ë“æ!±òGnÙ5Ók¶Z;kMPK=¤w\0&ÙfŒ şÎâ	úÇ>Ô’]K.•§ËS$w2\\\0IŞç)Œàû\\½µŞf’W,ffR»N9,9õ®†ßi6FD1‘…*zÀ1ëˆúöük9{¥\\±e©:éò¼³4*$KsûÌe09öÆÌg¦»³>£¬{€¢\\ŞùaXà“ŸÓs7áJóKÛ½ê¢,ì`ãçÆOp+wÃ\ZŒ7$å”A21fîy›}³ĞÑ(ir£#Ô´ÍE[ZÔtÙ6¸‡óäÄv’~œ§°cî\rNX>Ø‘ˆš6üÂñ!FXP2xl¿O\\\Zúw—5õÅÅ¤ä³>ÁÊŒ;ıAQÇ<šÊñòÃ¨$²Ä|ÄrÅ—Œà)$c‘– ñèjbÁ›¦âÊúĞÃ}%•Ä fFfì’¡”ğ3Ï?‡\\×mgmbŠî4c\nª……rÉÎ0Iä|ÇŸsë^G¢“]Èåm’,g9lç°ÈãØŠİğ§ˆ\nÅwêJÅó’Ï‚ƒqéÜûrœVä8Üê<}bíà]YšéÜ$k C\Z\0O˜aŸâõ¥ğ?‡%°ğ½˜¾Ô$’C‰¢ò1ˆÑ€!rW9oo˜Öuö¤ ğn©oåíX\"H9Ê´c?˜ıEvöám ‚Ñ\\,pF#]£°é58˜ÁßS>\r2ÓM3uu7;M#\r¥¶dqî™üj=bÎk¿\r\\Úé—qÅx±ç\\ÀF9àÇ•²b2£ÑyİÓó¯\rñ7Œµ-ÅÚ¥¾ªè.ÌA ğ¹²*ÜÙ\Z%vH\r×Šùs>•#³Ï˜Õv…ÁP½s‚?Æº‹uá\'MKíŒñ’X[„\'ıw¼àò+—Æ~/1!m@‘w©xõ9Î?J¥ç‹/şai(X¤7E\"ªÆÎO#œz“€zÒPW¸Ô#¢;}>ïX{6ãQ‚$¹\"Ğ´»æ>ş½kX¥İ¥ÅõÏÙî\Z½²MÃ9$ç’>éÍy]§â;E²/cŠG#6öù\0ô8À#¹ã§~ÕÑÍ [ÚxFàêí~\"®Yİ£bÍ€0cªÊ­GQ¶ljVØ¢–ír»LQõ×ƒÔç ×ªİhqÍ5œ–I±–1*ÂÂ…(bãçkGáÍ\ZïAµF“Qa8HÑãÃ©v?)Ç$’F:ôÍs\ZŞ“£Fcû]e‡öŒcŒZ¾[‰;;š–’x>(m–ößP»h£¯šÉĞznÀ5¹¡ğòtëGò ¸çÔ0õçŠò0›ƒóĞdg½\"E#Âó*şíÙèNqüc¹îº=·ƒo5ítÉ%¶¸|¼ã9ë×yô­M¼?á«Ÿ²yğjîvdeŒ\0dÃ½x„µK?ÄVr!•Ç™ƒ\Z8Áåç×ŠtŞ$½#o—œ•ÉCÉ.[ 8ïÇ.›[	ÉìOñ$×z¦³3&•hñnÆqÓ$×ñ®RúâHÑ®£›ÈÉòÃ¾ã¡Sœ¡¬˜®5hÚî×M€1*”“ÇD9üêÍÌ¡•	ŒœT@=	88ü?:çš<ÚÉ6\\Ì tó7]»ë€qøöúYìëæßw’~™áWE´‹$Œ |€Øİí*µåª…ÊJ\0S1Ó¯ùö¨ƒW±”NÅcy,x1|Ò3nPz)ş÷ùşµ©¡H¶šœ\r%Â‡V\r3ÊøG;v÷Ï¾:Õ4ûLÀÅgbîvğË€¿‹“Î}ª•ÀÖtä‘Ã¤b<	r¹õsõ­ã©ÓİÛcèõñÄrÙÃ5ºG*I¤6:ûW1ã{è5]\r§ŸNdŸ FğÈs0Ï*Ãø‡|{W‡Zkzµº1ŠáÌ[·#)œç§AøWSg®]ëúyµ’0L{HŒô<‘è=«n^ç^¨ÌÕ&ŒEöx”FÊÊ»ví cÜv«‰«7D»ò„‰4×Ã$lU‘†\nãÔÌqP\\¤Z„”–÷*ÀOL÷éúÔ7,#ÑZÖpQVXİ~Rz¦>^Àúƒ×ğ«@Ö¥N·wÑ¬1¢&àn#-ÿ\0jÔğN§o¤OvÓAç3‘şzşuqu&!ÛAK÷9Ï|ó’\\×K§ø=.l’ğë0Z«\0ëÎ}94¥+øà4®Ê©ùW‚»~¢«k^.şÔÑ%¶šD	c#\' ç\'‰F©âød—|Oi0Î\Z<ôùex¯á¡¢ZAuiwı¹;&x˜îŒ„CÓ5–Ü*^ÆçÃ­Q´í?Pófƒİ‡@òò«¹F<t5×7‹­`O9ç¶eÜ§ä›\'‡f?Á¯ÚşÀˆİM¢;lÙ‘¸‘Ôàœã½;TÆ8È0ÛGƒĞÌØùˆ·Nœæ±9IİHä|×Üô_ÇPê(Öqû*ÄïîN\0˜&¼îîU¾,\"FW0äìãÇ¿Z«( ómšXT(Ü›òõÎï¡?N½WŠXÊï1ÿ\0«Èà¦ì_Öµ§O—Q$Ş·âa{GäLì\'o$ÿ\0\\UÓÇ-…¼é*àI#ƒœ<Èÿ\0\"š—RK+dÌ’­åÆ:dcğâ ºº˜n]êGrTzşu­›4÷›²(ø!µŒ@ÄJ«n1¶A>§ßÿ\0­ETÖ$ßi>c’OSÂÑE¬RVV=³áõÕÚxFH­Uããqvç÷¬O\0{Öºø®/¾ÊäÅ\0*êÜ«yÉî=«šøq\"\'ÃÍr„“«à­zéùUJí„g‚Oş·µy“¯6Ÿ˜šs;V–VÒfû`Hà‹dŒÉn6F^¸jò]]5¼êiˆº|ÃŒà~]+ºÔn ºÑ¯mŞkLKm\"uJ‘Ş¹Ÿ5¦³á;=F9­â!œ€¬Ì óØ°?e	)MIú(¦´‘Çh:k^xuLoºS(•c\0Œ²ù˜ç×-úÖn§ıŸSh.UE­Ìo3€Ÿ”£<{× ø.ŞÊ/	Ø¼×Ñ+ËÜ…•Jî\'ŒäÎ³[AÒ?á)ÄWËi		¢ñyÉ?•nñôÓóèS¥¹ÇjºÆ•vªÑ±FİÈ}~?\\Õ/5Úú@d£WbÀ£ï1×Ú½ªûûS1}¤Ú0‡pQ…8È#û½·õÁí^?yaöM@Å!ßÌÛÔ0QXÔâµÃb=ª³İ\ZsÅè™›}ÇÈ²nÜÄc9öÏ§j¯m?ÙçI%Uƒ½ª{¥YÉmF\n‹ŒÁÉÜu÷ª¢\'l¼zší[jZĞôÿ\0ßB{t·æ+Ë´ã„`\\óİÜqÙjÿ\0Še¶f†ö×Ì’5s)RêˆûK üEpşûDZÍ”ˆDaä“ä‘¾»Gå]äKN¶–D	û¥	!·g§òí\\³÷e¡²÷‘ÊèâbÁ\0QœGæ7@v†ü=ë ²ÒKj—kó²Z«ùde_!ÆÃê¹ğã©®RÖèÇc0•ûB–,s•zu<Ã5Õ$ÂŞçOhf!®J)!º.]}úƒşõ)^ã[áHç> ¼–éTiÊ¬ÆYŸqˆq‚}XdS×­zZœW‹‹wÀBÊ\\í,yÀÏnx®]¾Š;w··aå=ËK6p~sÈã²ÓîMhÚë^Ó4„¶½óÜlÎ\'Éç¡Tu:V°•ûœğI\"¥ÇÄ•–Üw››*Ğ¥ŞÖAÛ´•sQx¶Ğk\r*´³óHï)#Ğ’IÇOË½Z¾Õ<3©Ş$÷Ú}ÀŠ6^9ÈúpXtã5¯}§ækuií—ıP†Æ%{r2Hü*İí{\Z&¯bş™-İÕ—Úã¹µk’%ß‚@êp~l}bê>=Ó QöV2±ùá¸!¿\0Ê3Xšœö·W¦ö{ym¡ÏŞkŸ,{/ØUIõMÊÛØù\\`Ek¼Ÿ©`3ÓÚ’M…‘§5]‘ËouöK0’2ªF8sÇ÷ˆÙÍkZYë^,ø{q4rËâ·›q6Ö;GÍÉ>â²të˜|Kµd‚ÛM‰…e‘aŞääã:_Ò»ï\nÙézvŸ\rµ¢[Ü\\´œE~\r·¸9û¼t«Ò$6Û<şæ-^ÇK‚Áî /l|Ìœ3Fr¤\rËØO~½«™¹k™-\"b¿¹ÈB¤çibz}Oòô¯wñºiê°éÖ:JŞH7ÿ\0¤Ê*s†<~]ºq\\Ş«¤i¢Ò(µV°°+~Íeßœ\0Éı©ß¸Xòa¥\\1ŞÅ\"È$8%XjŠÎH¬ •naŞY—hÀ#€koÄWf¸Š$“í*\0²ã §ğõö®ziRg\0*¨ä‹š{hnh7ÚzëV’5€È•@$•Á\'Êô®†ÚÃB·³[ˆ·ÛL€¸’Y×1»Æ“Ğ}ìñ\\.”uk?&S¿Î\\<“\0Ï=*®.e”–“Š~QÏåIÅ5a=OL6±Ú4Ö	nmVo²Må¶ËyG@{–üª’*„v†KİôŠ	†pygbF\0ÏN+–¸Ôu-Nê=9nü¸Ø~÷i!]±ó3ãï¾İ†*Âø\\E\ZM>§ÀùÊÀ°ú\0MsºInÌ])In6úù`•~ÉªyÒus\n	<““É­KÛI/4†Ô_5Ò4D`>iëêÃğæ¡şÀ¹Ãv›mÒGÌŸf•K“ßå?7OjÑ·³–Ş$Üîâ8ÿ\0Õd¨³øık\Z’ŒlÖç=dé¤ÌôÛûi`ÔZä\0çªäàt©ÇµiÜi—š½´vÉ¨İğ¢hÀ`§<;yû½*xnJÏ,LèÖçŒ`ùükzÃÃºİì¿k¶°º‚Ü(ËœtêS‚:ĞñYÎµMú¯ëÔÊ5*Mû§\"ß|Bˆ¿dn¼Ó°ºş»ˆ®ÇBørtc¾ñªÖ“3¶¶ªÃgŒ¶ı1ï[–wóÚHö©“QelD£rÆëŒ± áF{Mu¨Kn‚îKˆî¯£m€FÛã€ë»;sÇ\0¿1\0ÕĞ¯VP½MJŠ”—¼Œ-gì7sÉ£d‘¹ùŠ\rÀŠãu­=`‡$	biW\'¡*y\0zºÚv³ªßæÂÊîà;oA³à7séß­z.ğºîêÚ?íëƒ$Ö±Èø$Í’€ØãŞ½(É8ê)E©hx òÒ\'ïP•9ÇÎ2On{ãœ×­ø7Âz^§¤¥ÕåÅüo•Ë1Á©=ëÔtßè\Z*n²Ò­-Èÿ\0–¦0[ñcÏëV®n­#„œFätùAÅe\'Ô¤ŞÈáuK/ì§µû,’Km +ûğ7+Ü8şU¶òOk•‚àÆÛyèHàóèy­-oeõ•Õ¬LDÌ«,Ï”çí‘ÅSÒôıZx#í\"F~Vy@? 5ƒŠfÏmO%¾HµatK\'ÚÕÙÙÎ~~»‡<pˆü=«&ÃGî­3.ÌW±Ï8ãÓé]·ü#¯¦ŞŞZÏi$¼…Â±Ü1’F=G^{ƒŠ’ÓK;SÇ²\\muo”€ñø3\\[4â.R’m&yÌºtÄ¡’7Cüt·r1Ôà÷öô§Ii)XÚ|²“ƒ‘€3Œt9¯C_ùÚÔMo`&g XÔ—RW\0\0àsøóÆy×Õğ|.w*1™\0\\œ^ÜÖ¶úííÊ®_4º#Ça ;\0ñƒ ãv;L\Z\'fJ|ÀÉÇ|ã¥z£ğ¿Å—\0<\Z1ÜYÉ_25àÿ\07\'Äêú&¡¢_=–¡i5½Êü\0ğQÁ#¦kº2æW6åoVsú±Í´97˜Ùôè(§ë1„´·à†ó ñŞàzçÃÆµ“Áö\"Xbİ\Z²‚È±.ÇëÓäWl–vÛFØb\0Œä ¯ğ…Æİ>É[•ES·Ë#`;›;µzœI$*c”È¤}íÄçJğ1´%¹-™É)ZM2åÆ™ÂlÜÑ1ygõ®WXğ¼phw\0k“Ãg»+b€@sê\0®‹í\\ãwNÃŒ×?âÙ¥ºğ£n¯¸ùaÂÏGROäåYáç>xÅh®Lf®dxwH·ŸDÓ×®YáŞ-‘×ƒÎTçŒ\ZÖ“Â¶3L\'¸ó1Äå±z¡àHZÇÃŞd³nNôCÆÕãóÜOã]\\ÛÜ}¹­«Ô«\Z¯‘ş©YÆM&cKáèv­åÂú¶õÿ\0\nÎ>´ãs \nû³°I>¿tŠë#‘)VPH\n›•ºñ“»®8è*ò_ZBcŠ]3ÌDş1(,ßPW\'óª§*¶·´Kúô)9I|hóé<µ‘KçJ’,ƒÌP£‚^¹­íGIÓ\'¹‘â´Xä\"8ÔœH8¦G\'×¦º˜î´™d‚e9•ÛfÒp=pİ½€üi\'ŠÊÖ\'Ìv·U2waÏ9<`zWJU«’eKÚ%¬‘Ê•·‚Ş{K0£»pœ (Pœy~¢±#Õ^ÊkxŠÈ¡\0_˜`F“øšïµh. 1+K{…Şsçdªç‡ tÎ9=ªÜz…|.SS–Sü«$r`0‘Œ.GSùÔÆ²O•Ûï5YE« Â}Š0ÉÈÅãş yëëÁı+¢Az÷m0³E°c³~›Oæ=kÓ.´_HŸcµ‘T´¥ñˆ`Ã¦OZé®t¥ŸN@·¬6sˆAÏo˜q×Òº\\ùşûKëxÊE8×n#Ş{—¸Â8;/Oà¡óÇOzˆ¼1{m2´§3>¾È²0QÏÊÌ\0p:•Û,÷>loîäI]ZEÉ½f?–	•‚ßõK–DT·Ÿùe á[Å»X¤y¡¥kP±óí.ãF$íhÙGëÖ³–¼Õ&²à^™{ãMJñü»‹Ç+n 1õÈÏĞÖÆ«\"XNÕ‘Gn:úÕs4;\\æ­t©Wl÷Pm»i.ÅFjÍëÁ§ùij‘±,Ù<?Cø\Z}î®’®Ğ‰Ğz©ösoŒ¼**­}É½ø|g©ZÚÄ ¼eBUÈ\0ÆAõÇ9ÓÒ·t_Í,—ÿ\0ÈO-e-å.Õ_0¡$w`°ÏÊ=Ípê‘ÛËÇ!\n@dÜqœÃ§=¹©-¥è‚!E¯\n†8Wëœ“ëÏòÍRK±-³Ò5¯İé·ËMpE1y!İ\"¡Ê7ÊØÚØÁÁéCYºÖ±{g¯4p»ÜÎÑ•qä*²‚¹\0qÁÏ×>•®x—TÕ<:Úc=­„6Ì¶öÑíÜNÑInÿ\0_µa^^<³j$•JøVÏ!B1-øz÷ª²}	\\İË:¦¿y©ÀĞİHFÅ\\—Îìú}=qÆ1ß1»Èöy•]eRNğOÌŒ\0üÇ¦=ÿ\0ûcØ¸ÇºÔÚÛ™&™§Rµd\rÄªr¤Á*°Ñ¶’3Ú¦·¸Ûu3ŸC1‘&–\'áƒlàÓX®;Ä•IU‰é×úÖİ®¬ŒS{†\nrw¹Î;d&AÀéÛNÀØ A¤Ò{Œïã»³g[İ.ckp§*Ûúã±¹â»=ÁúÎ·Ô.m!·¡‰Šnèx\03z{Wğâ÷MÒ¦’ú]>+ÍA&›%aL}åø³OLq^·kâ=GXn¥[kxe$G†,ÌAç\n3ŸNH®ZÔã&“\"T•Më_hšj=Ñ‰%œd1–ù½¹àğ©5-Qï1\Zyifƒ%|¤>œ¬#û£Â˜ââòçË¹q™Æ{„/çštk«–ÍóFf-’qĞzcô©QQø¬iÆ\'a÷÷ŸbÓ¡>D’y…˜bK“œ†\0È^\0ßéÓ­c‘õöÙemíÏ”\0üzu?•\\±´²ÒmÙmã$Ÿ¾}}¾”û`@(ˆêÏŠj+y)_Hšyc¤[Ç…-áÎ8Ôù\nÅÕ¼XĞFM¤P	.Ã%qíT/¯ô·™4~ràíì=+*x„¡šO³œd2E}xÍS“è%»÷Æ1²Eäó;1ë·\0cØUaâ[mïÏ8ó…;8~kQEšñK ?)K\0{ò­=?Ã·÷a·X¾ş‚gm«ø½úSµõ\r´5cÕ\"¿‚·˜4ŠJÈÁÇò4²Krƒx ci#­W_ALnõûˆelìì#Dÿ\0€˜şuÎ_hV:DË$ßdÔ’FÂÉ\'™¸7Pr}ıiÈ\"ô±cÄ&k›	&,°L‘‘4ií“„õ×¦k)¯%º»hŒfç^I@=Îs€8=êoê\"Ûû1Ñ‚yhä`ôåGâ1úâ°#ñDw/äÜ\r­8Ù1QÉn™ëşs^eZ2rrŒnyõáï´zgÃK†¾×wLùh­‘AÎBœ×ªn—şyûê¼çá”bòÿ\0QÕŒP‚Ñ¤!âB¤Œ–ÃséÂ½/ß†‚…$‘²‡&Œˆ´½¢÷İyÇØ#\ZµÎyó¥\0à(ëÛ©ìkØâ¼—âÌpÜê¶ÑM¥\\]l¶e·;C9Îşr>õkQÙ£ÌšG€x¡dX,Ì±²3À2í,¤)èsÖŠ¹ã›HíE™K‹BÛƒ$ÊrHÜõ4U\'tDtGUàİ;O·ğåıæÙ¤•IHó’ ;/NÙ#­lKx‹¨}¡G–B˜şVáÇcÇ•á;a\'…´Ù<¿œDØg<æ7ó®…-B %P¨Q–ãÿ\0×\\U«^ñ8«Örn)şÖïËy›s÷TEA-´·v71C™6DÜ{‘ŒdıkE!Vİ…•XK?Êÿ\0Z¢Õ¦[{–ûCBâ7Pƒ§ÅrÅ®d¢X§tÙ™e4\ZM¤F‹,P¢2õÃ¥kAnS%âÜ\0¹9öÅsz]ıäÚM˜†ÖæâSÉ¹g\0sÀ9Ï=ërÏÃ¾.»¸tÉm‚†{±\n°ï‘†;ºr;{ÕÊY6tÆŒ¥6ÒêoŸGm²ß bB~ó‘œgxsŒñŠÍ+l×2!ä…”,~amÀ8éœË­s:ş£«è\ZÕí®·:J·%&x`fò÷©\nç€##¯å“A¨˜.lïne•›|6÷P\\/%†rpqƒúWZàù¦ÿ\0ëñ:e¯…5ÕÔ¶°½Ì’\"¬.è£\0®G;3œœã÷¬{ßµ…¹†˜¢IJ*>=ï»ÓN6*å•®·­HÉı‹¨.pW}³F‰Ï,Xãæì\0úÖõ§†üGKK(,4¨#P¡æÌÒcıÑò¯ıõŸsXÓÃb,×\'¼üìÕ+™É«›»IÑ!ÚQƒ|çËuÀ >£ŒNu´í^Ü•“n;ü•ü¯NkTx:Ñ‚/ˆ5¾Sdb¼\0äŸCÎ*9l¼	¢Áímæ)%Ìí¿×‡løVĞÊê¶¥~V¾×Üiìä­úŞşÎK¸%à•O*EÂöùˆã$öê*äòÇaò6‘Œ‰Ñş5Ãk6Ñt-:	í£uIñ(2g¦pL~Åj¿µ»ˆä–ÒÏd,l—O“Ó9Ø:qÛ8¯r9F*;š«XôígOğ±3êÒ«2HV&Kâ§xà€ãé^3ñB±Ñ®aŸCğZHÅ$I¦ÜUÇ ‚;c#~Z_	ëyk•¿ÛÀó„ŒGßÉ$¶ON{z\nÉñ6ºuË‚¤™İ½Ô\'?@yúÖ±Œ®Vv9²ŒÙùË3É¨ñ¦¯Ei#ã®zTé§#Í1’¬ÛTœ€×§ë[r2]DŒĞ¨`‚Ùäb´@1A‚ğF\nÏËøšµ”¦Ù@ÆrO­Y8‚–Hî7„Ü ×éZ*}Ì¥Yt&´Ğ¡»ÑD“jl“yƒry[†LïùVÎá=)îÆíoËA‰ÔÄ7ÈFqœ‘Û™ëÍeÛÍÄ1!ïdœp?ÏZ¶·aeæ!;w•ôôõ­U(œó­4ÍáàM	ôï&}v3p°ìıÔY$ƒòásíÏzÈŸÃÚU¥Ì¯w{<¦BWu¼J?½“Û<gÛœÕgv1•IFìçƒÃcòëÚ¡ÜæveV@À-È\'¨ÿ\0¯ı”Q*´ŸR)l´4¸FI.ˆTä\"Œ÷?{ôÎ;Vå½®óöH¤EnFó’+a£K…?)Ü:t<uàŠ„lIT¤ ùÉËc·>õ‚6…Fº™–ºEåË¨·ç|d¢!lSóÍ6çKºIX‹y–6ÉC\"ÈÎ;õçŠê¬üE¨é¶Ñı”< 3:´i‚2yÆ1ÇáùÒÜx–îâê;›‰¼ûœ½Ñ¸œ“KÙ.ãöóìs\Z=Ôq¡e `…qÇ¿ĞğsÒ¦´™eG¶\r€ÇÀç¨«š–­s~¡\'~2X-WõäÅd±‘fóÈ|õVç>µ•H.†ÔªIüFÅ´ö²®C°B2?¯¥{?Ã[xï¼>¶÷\0-[gÍ×¯oóŞ¼îgÚAOÈÿ\0œ×kàëÛËıWO·°2‹¹‰¿v0ãØg3Á¬\\{›suGÑAm ”¶ÄGŞ5Æk9Óà¾k@ÃyÆ·;‡R}½Iâ~ÇÃÉcR+Í.Gï‰rØ>§ğ¯×nÙµÉnVSæ‰	=ºş¹©ä}v2é¹Üİø¿uã¿Û	‘Êw@=¿úÕÙøSÍ‚O!iVsç3ÈKz\0O n+Ç4]Rñ•ã\r8B’Ãy¯µzt$ü­uš}Î«àHÓJÖ\\Md0ÜÆîO÷Nz§§§Ó¤´“è÷CäÊ¤Ã/‘‚Hüj»iğˆÛ*ªIé×’¿ÄK»4y#+!”æ9Wæ\rôÁéR¯Ä;»–Eó4#/±‹Ÿ×§áEĞ%$z°²Ûï×h\\~8¨IÓeVBX±|ã‘ù\ZóI¼XÒ/™ö§‘Aİ‚ÌIõÆ$^5d¾·;ycFlu$œã§j9•Ç©{Æ7úW„®íÄÓys+€BÍ•Æïoâ}k‚Õ¼§\\Ú$v¶“IsêÈ&WnÉ “GÑxúîZM9Q^WŒÈ²Q]—;xéœ}kNğN•1[\"ïvyY€9?LÔsÅ|FŠ-­½Mµ\\[MYX(òÌs•Â“Ó†Çnô–¶º_Ú¢¥,,5éI \rß5zZø;KTšU¿#’ğãù+2OÙZÜ-Äztµ·,v•#¦?\Z—^	hQ”§¥øUğ¦…¤A§Úêvqª¶é0YRIëş\0VÊø—C»¬XûyOñ¯œ5OßéR‹{tÜ\0ZhÆ3ß\0céÖª\'Ä;ğO™cfàõùOøÔÆx†®¢¾òçJ‚væqõjÚt¼G¨Z7û³)şµç~?¼[=m/ãÕ…š¼n²yFE,îß^\nò‹_éöÜYA“Õwèk£·Ğÿ\0¶.!¶G´99R%€ÆúÑí\'Ì£8ÛæÂŸ$¥	_äqÍ×Ù´µ›UMF\0ÒePËœ„ÏnA4Qñ7C}\ZÇHÍÕ¬é+Í·É]¥pïÇ×ÖŠéV¶‡/.†ÿ\0„%Dğ~š¤¨>[öçıcWJ“¤vçä·ÊóÒ³¼ ßêÒ¦¶† nÊáC~ñş¤şUÜZø%^]FöGTÆÔ¶_,èXò\0+Í•	Îr²8]\Z’›hç>Ë¸PÑío•€9ÉÇëÈ5_Vğæ°,e–ËK’h|§2op›WiÉ±Ÿşµzm†‘a§Ç¼P·y6îsõcÍO~7é·I¹›0¸Ët9R+z8Gy3Xá¢äxÿ\0…ü+âK½\ZÎòÎµX£x.Vë—HÎAöÇ­o¶…ñ&Aü2F¸¾ù‰ÇrNĞIÏOA]/€\\·Ãı–\0E_~	ÑùªŸŸ=«§ÙÄêäKdxí×‚<cud,f’7_ÌQ-ùbÍ¤ô?—ª¶Ô|?-Ô÷‘Aç<+\Z¥¤ÁÈç-Üœ/CØ×¬_<!<Ë™JGÙKg?A\\V·âû25>p³,›Ò,	& ôà}Ò}jyÈÑ(£ßÆúå‹4rÍ};b3´ñşÕÇzã$k.¢Ä)*Ì˜¿P3Oå\\§‰5»ŸÅ	´Ò.Ë#gÏ}Î_‚±|İjd0›i	ÉÊß‘éZ$í¨]\'sÛ/uK)´×·\n¾y‡;L™ ‘Û±úW”jzÃ6¢Ö×WÚÆÄ PéÏNı+2k½~K.âò[y\0ÁEã¦P]<	>b\\÷ÏZÒšÕN¢{³¥»ñ%¥Åµ½¬Vşlpcaf!sÈïÉëX·——H\"û¨sò¯­O\r˜1ü«ÏlU»{÷\\Ÿâ8\\~9®•E³’x¨@Ë³ÒK+Hñª@\'f®=š ùHëÛüÿ\0œVÕ¾Ÿ›8PœòÎOÖ4#ÉDÚÎwã_ZŞ’G›W0—1Î43Á\'§z{ÛÄÓ/“…P\\d0úı\Zè’İ#MÓ$­æ6Æ@wÿ\0ZbDb|Ãå†	…,ızëZ{BÌÈ¬c¸ŞÂÙÄ!€VŒd¨êsÀÏ^ç w«0C»Q4ŠpL\0ğ{c¯CøğjüJñ5¼6›Ëá· <\0y?Ò¥ŠŞuif,Ì\0ÉpÇ–Ï\'<tõ¦©\"=²ŠÙ4.òŞ0FLQÈó×\0œã§ ö«‘\r¨&\0ÆÂ0†\"êÃ‰Îáøu§Å¹àòŒlÒ±\0%¾Şİ	\0sV!¹-3»ˆrQÜå¾sÎ«ÙØÉâÛÜ®lá«JQ‹©l½sÜm­U{T4móK©âGàx÷ü«RX7ÜÆ­kå–l€HrTú.@¨.eò‘â‚âTeÎåUR?„ç<´ùP•yncÜ­°ŞL!Ì„óg¤qÓŞ¨#$rÕ$aÑ˜îĞà`~•¶˜bä5»–\'å‘a½Wnúõ,VŸhİqÌáF\\Ãgå„ã‚sRàˆb%ct\næÛc2ïÆAòéßŒT—æ!(£ ıqZf¬÷*Xd¦Ş1ÁÈ\\cò¨¥Ló±…H%a ı¤éšÇÑ™$ÆBÀF3è cßZ¶ğhá­–ùähË\0ï\0…ÎIÁÇç×ƒ8q´Ş„g?¥+Á¸§<ƒPé¬J½êÒÛá›[¬·âö9ÏËÅÆ|}ñÖº\rYğVqæhz±LT –Y>ğé“¸Ÿ^kÉ,œq]„ºŒ0ym99>Õ—²HÒX‡k&[ø‹¬Í}¬a`ùeeÎ:z¿yä³ÜK9yœ3±Á/ÿ\0Ö¯Cñ<w7‘$†Úx‘sòË\0}2Oé\\QWØ.2x<YNŠ5t×s¦ğÔ‹¥Çm ¼Q‰2·+ s•¸àqÁèkĞ›Äú^½jlµ¸¢F;Rà&èßĞ‘ÎÓïÓé^/–5ÊJÈ]§¯×ÛëN‚êêÙ&İ¤ç;z{XJ›{*k¡«â¿É¥_²¼¢29Ís†ëR‰vy×\n:`1®£KñT¶#ºŒÜZ€q8Ú¼pTH4Íc\\Óo#³‘AÀa“í»*R’ÑêiÌ™ÊË§}æâbı79üë£ğ¶‰ªk—ñÛ}ªx!?ÇËÿ\0\nçRP³³€È¤äl<¯ã]ÖãÁ¡ù8Fº\0ó\r‡=ù}iµ¡7Ôõïøj=\nÉ [‰.Nì¾ó}rtĞØæ‘öGñ~½«ÅOÅËi\'Rº|ÄGÎ#uÎ{àš’ëâµóF—n‹ê×½¿ï@­gËä[o¹írX©ä¸½	¬WI–öÎHaºTğ¡*Ğs^]eñ›U´™…í•¬ñÿ\0Ó&(Ãó$Vmÿ\0ÅÏ$ŸjVHá•ÛÉ‹Û@ÇŒ½iJ\nJÍdÓ¹³ªü#¸º–[ƒªÃf$f.?\ZÆo„U5ûİpÙ\\Óíş5ê^b›»{yÔs†‡oş‚ßÒºâ±#¤štAÑw0Y}ûnQUË$´`æº£”¶ø]­ØÏ½n,á&sùŠïü\'e=…¬Ñ]ÛÀ¹a´ÈêwÜ`ôæ´â×´«¸<Ám,(8;@Oo}£M´G¨J¹ù—x?áXÎ7z³hÍ(è·<£ãæÁeáåT…Nû‚|±ŒñZ)ßå†[?/áD—<+«mâ/OëEkecšnò¹Ü|*.~è[\\àG/Ê£\'ıt•Ú\0AÉNzôÉık‹øZìŸ´<È<¹yÇı6’º95;$›d—®¶3øñ§pHÕGlğ§ƒÔ€)“<„‰°A˜qÈÿ\0ëÖ\\šŠ6Le%ÚRÿ\0†äÖ¥â“m¯ö”ê¤ad\n\\ıF3úÓIƒh—Àÿ\0Å	¤¡ÚJFéÎN1#\nÒ×u¨ôM5¯n´#®Ñà>¦¼¿Mñ:%‚Ù.¡qqå3#*€I$óŒk\'Ä>%}ZÎx kÄB¸ØÍòsÏ&‡s°—ÆğßZkU9û­:ş¤ÿ\0,U5m;©.$m*;‰&RáŸ>¹ šóJŸ¼áz[ò¦Ë¹_o–\nçÇ¥C…ÊG²§‰tË†Âİ›/Ÿİv?SŠ·{p5;6(á²Hrãİ}?ZóøôÈ­å$3Ÿ¼_AØä]ãc-â¤–VÆÃ÷“ de_®êJ,NÆÔ>U·üıÀm²:ş­1ş^H	‚òÑ‰ç?ŠŞ²×,Í²Ï#a:†SŸÇızë4²ú•ªŞ@qnÃ(ìFqëO­kÊ;3	Ò„÷GŞxO\\°y\rÎ3B½T:İW?­g[Û£Lw\"£;:gÛ ıkß¡m7Ü©#?qIÎ=ë+XÒôŸ\"H|Ô‘p~ÑCq‡FqùWL1jö‘æb2ÆÕé¿“<ºÚÔ}‰Ÿí*6&çPÙ|ñèçı*—–\Z±_†àWœò:^\'€Òf>N¨b!•†ø3ÈîyëU¯>êÙõ2T|»¤u#ğÁı1]PÄR}O6®¾ÁçÏh›€VWŞÀ)Tl‘ëÓŸ¥HtÆ‚Fá<Œğ²L®£× ºæğ·kg!KKyÜò¬“üz€\Zåî!º´™íîXeF‘|ıkxN3øYÃVJ+÷‘hip×$„†%é±YŸ÷O^ƒ·áCEñK·2$Dmm‘Ç‘ß#9=8äÑ”³´LùÀ$§^¾ qZ1=ássåyÍÊ¼¾s¾Ø#\'ëÅSĞˆË›vQE’[nÉÎ#&R	¨Ú:ıqJŸ¿òâ BOÉ6S×\0Ién”ÈşÏ˜xŒˆPÅIü‡Æ­˜¡İ­—ß’ÌÃ9ÎsÆ:Zdó\\‚XätØ±íbA:ş?…XµŠ]åY•R\0gb›GâÃ¿<VåÛJÑ$sÀ«”1RöWã§ÿ\0®›XGlì÷B=Ç>\\qop¾›·\\~<Ô·¡¤4v)™\Zi\Z`.wf¶rä”rçƒp)—‹§´áÖ{™& ,dâİ‡\r‘×?\ZÑ³ÂåÁÔäYY÷Â‹+¯<ÇúşÕb\r<Oh«s§%¢–uklFs’Î§9¬äÎºWkOëúô0/®‘­ŒpI¨\0.ï·4¨yÎÓÀ³õŠÈ–9!ÈCd“‰rO~Aæºsa,,bf¶™&·¼L<0à\08ë‘ÏZ‚çO¿¢¿kQNqçGXÁö@@ôÆ3W#:’“wg0ÖÍ\"—ÁÇBØ\'õ¨ÖÌeœÌ×MÚ™Ë$³HáûõQ´}@\'¡éPÜÛ\Z6H¦·.\"œƒŒ`ç?VŒÏÚI+˜_fıææsŸ”\n¿i±‘”¸„ô(ÿ\0ÇªıºC•˜ÜŸ0íuB¿0úòsH4æ–fò->MØ_8ıßbx¬å•\nílAtÒÈ>q£—VÇåş5ÎMo¶b²)p3ık®şÍÜîò(‰aøõÍfOnÂAø=‡~U\nÎ•‹”ufp0lªg©ŞGMì»99 õ­ÈíFw–=˜‚Ÿö$œm€Œ.)J‘¼1ç#4YûÍŸËúUf·ïø\Zê®´ ­µ*99^Gøıj™²RH~xÏåY<=ö;!˜ÅhÎ|A·?1Wl£È±<hàğ¡\'ğ«æÈ|Š?SN†¬NÆìğj}ƒFß^„–Œ­q¤«JDp Ãl+¿ıMG&ƒ*),D*;“Øps[KmHƒ7²ğ>¸ãô¤Î@²|èb\0qÔ“ÇˆÖ1w0†‹½P-äa›‘¼a[è\n€Á86#ìÈƒ[~ky\"ª8ln\'8ôî=zÔºZF.Ä³D$eåb8Úß\\ú}j}‘kÜç<²ÙSj›qŸéN‚	¡™™#109Ü?ÖMş“tÎ±Û[Èam\0c¸ès×…DÁ™–6s‘•_İÓ¡#ùš^ÄÓë+¡›\rüğGˆŒèà`ùW\r=˜\Z°(ÔJº]M+¯	\ntàŠ·pwhÈ!FX9Ï ¬i\0,LlÍœTº6ØÒ5ù·3<WªË©ZY¬£ı\\½Âÿ\0…_Ä(émm½åß>ËEa%fitõG¯x*im~i72ù¯m2â5p şõıXsøTm¬k§Ï±±ƒL´Q–pşùàWYë-‡4ûd—HÎ	c´|ìx;Öæ k0í7ŞU¸Qó¶p?ÙS€~¾ÕJ7Ø/mXºŞ·;ÙêrŞO.<Ò ìÀôcÖ¹è¦Ôu‚[Z<Ó±Î\"Bì_BxsÀ\ZÓì“~ÄøÃKx¾io|”gØ\nŞs`·ÓtÈ¢IB¢%^={z~5J6š±óî‘àok·—vk\ZZÏj‘É2^7”Ê®ÓŒg¢Ÿ¥héÿ\0\n¯o¥+/ˆ4èÆò™ˆI1È8ì\0ƒÔ×iâ­BæÏÄÖú¢möË¶‘€‘·\0G÷±“ô¤ÑşßqÜÏu’Ûš\"Ã3n\0ÛÓ¿¿zÑSîc,E‘áK±HT†FSƒÔ`ÓË\\tOü\n½-t»QŸP6ä¿!T±\'9ä`û:ÎÔ´m:{åÀ@L{×•ÏóãùÕû66»G\nÍtPe›ÓšHe¸PË#†ÿ\0ıuĞj\Z\\1„\0+“>ã=j²› «f¡Ñ’5&©Ğøs_ŠÑ‹ßX=ß@›6 Ü¨Ÿ©®›Fø”¶aì¤hâ@Ppô„\0z“æRÀû›z±Üyô¨Å¬r\r®|³Ù±ŸÎ²tÍUDõ=ÊÜË>ëy S×î\rIÿ\0úÖ…‡‰®™´­R¾3³§ÉôˆÆ+Â#†çN’	•ßh`ñ¯˜J1®êüÅ{—ÃÏxƒÄvT¶1ÜGnÂ9näÆÉÇ®ãAõõ¬¥;šFI­/cñêmöğhštMü3»JÊ=ñÁüªkoø²W&ïÆÛ°Ùg`ğ& ×p\";v‰qÛüM\"Ú¦àÍ’}wsü©Ø›˜Ö¹·P×:ş¡rà\rÌBş‡—Ñµ^{¨gf#2Èì¤à`01øW@pÇñb*‘ü?T_+º3©Ô,ÕÑÈ]ü9Ñ¦…–İî-›ª’ûÔ¡ÿ\0\ZàuÉ£ê&Îşá!@»’hâ.}F:{çõ¯c¾™aØîT/v\'\0b¼×Åú„771¤N±Hræ&$cé\ruáñöŠ\rîy_B4]XÆÍ}Ìæí’[™\r¼7—,\nDN}É?ŸJ¹”L$O9ÜF2qğFíÇ\'ÓùÅ7ìÚRÛa´¤¹+¹s\"ÔœSá6+«^K1å’+|¬c s“ÅzOÈùØ¤´jÿ\0?À™í–ÎHáP‹pP\0 4ŒCg9è\0ö4èíãtrjPDçsº)\0ìË~˜ÎM^·ÒäŒÉåÉs´¦J§%ºüÌÙÀÏ8çÔTÉæŞ,1ÛG,F4\nÑ¡—“–vêH÷ç­däuF“ê¾BHå®â{MFr²€l¡(ÈL\r™Ç¨ÏsÖ•-,ËÁmpó;~İ:$t¶vOa“éZ’Gu·–²L¸Ú	|¸ØcÈ$ù2y#Û5Bé#Ó„MoQ5·Íqµ@Áİ³\réÏÖ±½ö;œyuğß×ü9›5œp´¯46óÀY\0I§$¸$’NãTâ²¶óü™ï¢’0…–Y3ÿ\0/\0ğGãÎk ‹[·kC¦Ç§ÜÚÛîÄ³ïVã¦2£qß¬‹¸ím–H´øQä\'/u$e\0Úz‚GQéëZÁ½ZÊ\nÓM>ÿ\0ğßğÛ¨­™‡Ù`°ŞZHd\'Ÿ7_ «?b¼¶…g¸Óñn³¯nÉ8ÏÜİ==kWK¼EÓ\"¶IåÑ¥ks, ç‡oLà\0zÔqÙÃ-ë\\K¤k7°ÁY­÷‘Á\rëMË¡š…í%»ü?=Œém…²Ç5ıµÁbÅİ¼Ç\rÏFVÀQÏ{UsmÄ2OÓÅ\ZÈ<Ø®fÃ0=ìİıëi4›½6&™4ˆ!&ÂHó¤ˆEİƒT®ô¶“ÂÚyàÏï<ût‰÷zrµ5$ŞäÎœ’Õ|ºşıÆfÛ+˜¹šTtãt¡¤^O`\0ÇãT®AŞ±	¼øĞ|¥AÚ8ô\"µ/^h–8ÛO‚Ş8\"?›s¤’O5N#lKy±ÜİĞ¨ÁúcŸÒ´ŠêqÔ’¿/üëî+Û„I9.?º«Üöü*ôrÆd@áƒ26çßÕU€F8R ÷9­­íÂ*«²°ìÎ?NœÓ”nê¥»(\\XI¼naÉaƒÇ¯j‰ 8ØòxÈçŠ»$d¡Ö4N0<¼ŒÒ´®«óa•WjüÃ½RZæ›Ğ¥™Ë\'–úàÂŸŒn¾\\…ùû»€Ûı*Tàs>çœTˆ©#\'Ëì8¡¡*å´õWt/ÇA?Ê«\r\'øÆõşu« 0ºˆ•yùÆ2*hçhåI•\n2Ãû¼7cœŸóš\\¨¥ZWŞÆ9ĞoÖ38‚o,õ‘c!OãŒU½:ÎâÎ)e‰mÆùÂğ öù¸=øïë[\r&¯	¯.®•ç]ªÒ]m<{œãØiÉasv«,‰¨I¬‘—l^Ä18=ÿ\0Îk&•µ:ÕIó{·¹„lVä$qBY™ÆÙÃ¹=ÎW{SâY\nLûG#¨\0spk£‚Æ,°›£„\rºX	Vç¦åÏícúSVâİíWfEi<Ğá‡Qò•8üûQÈº±÷VövYà±ŠÕ[ŠîlŸl“ÁëÍfµŒ„ÅhÓ‚Û{û×Owm\";´yoáB>_b£¥TkxÙ\nFâÏ$ş4:+¡¤s-Ï>ñLf;kLŒïü–Š½ã›³ÚØsœ¼ŸÉh¯+Z­K‚«íhF}ïù›^Ñš]#KºòÄ¼˜|€	 s×\0ó^Éá]…œ2N\0F\0\\~9Íqæwøudd_)dBcpæF?İ<`‘]6™«L¥ÚîXB¡ş+}àúän\0­cwBe?S½¶}â ‡8äŞ=Öîíµ*E…\\€	8Áäã?Jëµ‹«Å‰-$¶É#\n[\0ƒßÆ^Ÿã^qâé/.íÑ.¢hgVÁê±œ†À¡ëŸZ\"­¨¦ùôØçu]^İ bÈÃvp{ò~¹«šG‰u1§5´w;-“&C½”9ÎqùzœÖì2Èˆ¦Q+\"…œƒì·åÅliH%ğìLüÈªd!Glã×¥4¤Øåìá‘É­\\ÛÚÛÎ².üŞQÛóõ<}1‘ïAÕ`¾Ùe;¦Á\"Lpkÿ\0K¹ŠòÌUIÉqïO>µR\"ğ•r§r0#€Gÿ\0^Ÿ<âõÃÒ©u”ºlò\"0V“å*IÀõÆ8ÓVĞ)ù°¦Oj‚ßYû\nÛOö”šİÜç§oÇŒV”oÄI$kéÎzçšé„ã#ÈÄR«K[èS{“-9ü*³i\"Aœg=6õ­‡„ÎrOU‘OŒ©P‚AêOAD Œéâ\'¦\\Ëlª#^V3Âª…zs½O5ìâ	áiW\nò³±ÿ\0k8ş@W”\\Â8ã¿zô‡ú­Ş‘á¤¶±Ñ®/šY\Zg—ÌØƒ=9àgñ5Áˆ‡-™íàªº—¹ê¥FqëHÊ\0Èë\\œŞ\'Öà|Iá+‡¿•2±¨‡málİøXµoâf³g\0}T\ZåsG  ÎÅ•ÎÖÏ|æµBıßÒ°¬<_¡j$×Œ&|•âtc×±Æ­]ëpÚ&ï*g\\€HSÇä	¡Í%{‰¦·)øÇB“Ä>»°„)œíxƒdƒœg¶FGã^W¤èê3½ŒS,ÁDSg$ƒóã®[èkÑàœÿ\0£Û4ƒíÜïRÄ€2@uÇZÂ¹Õ4=SP\n‘[\\ëıd¸m¤ô)üCy M:Šj|Éœ˜ªoKÙG[µ§C;MğÎ·•”bVB nà€zÈÛ“éÛ4ØeÒí­gµ½3Cy…e…Ş­îIç>£©rûÃºåÏÚ\'’á¼¿İÇ<ÌAVo”e@Î1ü\\œÕ·[Á­¦¹¨y¾ĞÌ£ï3>ôèı1·8 `ÕN­iÍÊ-}Ö‡›õj4’¦âî»ß¯İÜßšk{«(u•âœD\"û;¹À\rÀ\'–õ<æ®Ûé–ó*è\Z ÄSÇtZU=d¤wïU¡·Òmåo0Ï¨]¶â’æ6ÉuÜÀ`0(0qQ›É­ º»²ò–QjÙ•Ş2Ñ6\0U }Ü‚@È#µW´Œ£(Tw^c$œeúÿ\0_y_Gğ¾£}4Zœ¦â/0·™6J² œç g„WC™t÷Em,ìd(ÛÎòío™~bõãhéY–ÖğjöòX:,ÀX>øÀPpû89ÏsÛ×­u’Û¾¡q±_İ,Š7†Z^˜#€?ZÓ\rÉû›}ãtÔößúîQÖíyHñI\"¶%\\şğü§\n¥‰Ï8ÈëŒ{Ö¥Í½¤ñGvİd1Üª£(È\'\'©ãë¾‹ÉR)dµ2àtrG±$×©]M~nİ[È’m©yÚ¯·iåNF\0ß‘œq]t¤Ş†Xºj+šú¾‹Óúò1å×PÕb˜C	™!92œä\r½º¾•¸$½½³•Şyš4n¶Ğ œã÷€gŒáO>µk©Ï§YËmegåÇuÜ{_w¶wıÔšD:Ôç›æ ³-Â!lÁ8\0sÈ´ÖHà¡5Ím[{Ù?Óü‹Rhk5”?eƒK[†z’ìW#©Ër}¶ÖÎ«iÒG´#c \0ß61] c·Yn\'kWıÛÎ±1>›–°µ6Ñzt»§U#º}¡I§4ç+ØÛ‡‡*’V~Z~‡6²ˆ†U´$H$#=úœt¦}“O6ÙóÁ—nr%=}1³úÖ»ëMus¹tÂïœ	\0wÊùÖmÛÛÉ4„$°ÈAÂ¤`(#¯sŠè‹osË©Å{®ëÍ’Úé„†Bª3ĞœôÒ6¶ªñü<çëH„Ä«\'÷Íãfİ!ÎHéŸÆµ»8ì˜FRY/Ù†xòHÜ®NJºp×$Ôchs±T|İæÅ<;ÄÍåÈFßË¥\Z…ÑdŞ\"*ª[Á¸H\\ïRAã¡ò;ÕvRCÈébsòp?!Ò¥‚öHËÇ~>÷ÇÔŒÔO±÷3’Ò¤¸?¦(Q*SM±İÒ5Qê3ş5V.r3ŸJ´ÈÓíTÂ`jSy3Y%¤h·3,J›·Ì95^„«;¶ÉmÊ­Ğ5à@€îÀÜ[ĞÆ3Üæ§¸ÖbË…®#‘™VK€ûÔvû¬‘˜¦éÑí¼…¹’íøì³ÀwÈúÖö™£xš[Åù±/—Wg§®=ıÉ®z)İşg~5&’Šß²½R6âE•|Àçi+Æ1ù÷>Ô³Ëi2Üm‘™T(„ÈŸ;N\0ëúVş­%ô7êìÚË1ß#ÃÈãH²r=	¬ëıE¥ÚÜË\"ÿ\0ÇÌ¸À äw§7fLé¨^-íİÁıx¾Ñ-u›;«Œı1×…A2)´H¹P~aÔû{TòLTÈ·Ú>¸ÆsŒREg$ñ‹Ë rA•C~Dçô­½N(êp¿Æ-4ß÷åşIEMñ.Şkx4Ô6·ÊB°ÁÆš+ÄÆÿ\0]°ÊÜáóüÙÚøBòÓMø}¢Íq:¼rXc(ò5†Kô p1QXêéytRÚ ,b]Ç“Àã“×¾¯Já¬µYÇ‡4û=ØDFÁ!HÁv8éıÉúS\"fv-¸cıÁÿ\0êş•pŸº’5yÉù¯¶¢	ˆ}ëæ*-›9TÎ:zqÁ÷ö®+Æ—ªï-m´‡ÄoÀòY—‘×=OÒC-­¤Ïqîm¸Tn8Ï$cğ?OJ«âùlgx…›‰–4ØI~SÇ~sïùVğ§©ÇWî˜c8˜)#cåPsÎ\0ãÓĞS¡†KIã·*şgÌ‹ÁëÛ$}?Ï5¥a¹´Ù&SÃräçOûÙíéÍjşí­Ìr–=Ä0lOµ\\›Z%s\Zv–²šH×ÔlJÚò<a\0¼ núrs’ÁHÁJÒq$±¯›¹Ù\0Ù‰\'ó5Æ@ÂãÜ.µ*ü¯FbÏ+„\\=}ú×MáyÚ[w…Æ|¾ŸCÛùÖ,ˆQÆ\në|áOR[›KY7m¡Çqßqâ¹â¹\'{èwâ_µ Õ®úÊíÈQŸNG4$2\\HEy[åHÕrIÏëºÓ~	dfÔ5¿1Ûsù±~UÔézv›¡1ÒİB6¼ŸyÏÕ¿ âª®.	Yjqa²Ê²wˆçü9ğşÖÙë[…\'¹Îå¶s˜ãôİıæı½v*¨]êª°(šs³ÊÀ.~o»øÖeÍÒB+F™E%”°ùO÷sĞŸèGJññXÈÃŞ¨Ïv•(R\\±F‹Z‰WÉük\"úòÛIŸËºó#\0oÜpoóéY—^$šKË±fØ”Æ\0R¥7\r¹ç9æ¹m[P]PËåÉHÊ0i7©#wLã¥xø¼ÁÊ	Ñm;ùÁıíÔSv¹Õ^±›Ãúë4\"eF»·Rq$ET¤ö@üëÖ5mI´8%xV)btfœNèBğA€†Î9SVl5‚	R&i4Éå\\c¨ÆúÆ±î®G²¾»……ÂÙÉäÛÛ2dyÃ…}Äv¾_Â±ÃãjÔjœm~¿×ôŠ•H{-Vÿ\0bÊêÂ9.•åVy¸”Mû¥U™•ŒK1ÇSŒúRir&—,+BÊIÊ“Ü[<qİÎA8=¸î2+\"ëO¼¼»Yô¹Ö)DMnÌ&!ÇËÈ9+À\01ìı?Ã—Vºf¡²÷RÊÑo·”E“cciÆdfù‡°§ê¨¶“nÌÆŸ72iúì\\ºñU”­±y¦}ºå%x£İI\\·q ä‘Ğ™¨uk-C.©,7ñAw\"|²DĞ›y³Œàû`§zVt±_é\ZÔaÒñ‹ÌdÙ 9‰‰9pøã<8àúñOÑ5OêP}ı-îç«Cö¸Ôol©+ƒœd^+NKu\"¥e8;$µéı0†{IÅ,Áónct¿i<ÙYòYÆñ\0F>‚º{;-/mí51dñË+É´L¥ÃÚìpÄFOºÓ,ˆ55»8 eE{x¦;”ıá#œğ@ØV¹g©éŞ<sabÿ\0Ùßj‰meHÚHÈeH#æ$Ã+Ğ€3Y*•~KKëèO\"šU,¯÷LÛÑµé´\rJçM¿´µµR¾cGY/Â©rRO\0×gdÓË¥Ë{ŒV÷r©xàbøùwÆyô®63§jzËêZ­Í”‹¯8AÈÙVÁçæb9ôÕ[É Ê‚D¶%\n+4Ù,9ä\rÙç=±ıkÑÂrÆ\n	Üçœ%ï¢ùk÷6v-1fñ¹³iJ·La†y<ûÓµ¿[ÙÂ÷¶«`a­¥U‘Y~¬r1ùÕûİWO²*‘é³9fÿ\0Xë¸ää¶}=+Y×ÚöE‰aŠ/˜G#mİ‹)8 uïšõaí%$ÖßåÖú½:n2w—}[ûÿ\0¤Gi{cl‹öï*I\r…ÖçjŒp¨cN£Üõ®’ËYĞá¶’!©Å°Øå\0à ê:gÍr¶!:u»«YÙŞI$,Ìèr	êsÿ\0ê¦]ê®óÆo4»hP¨hÒ(PûL§?•\\©9=WâsÓÆF’¼Z\'ø´vqßé®ÁãÕ¥vşâÎdò5VçP¶’è¬\Z’>1º9Üşf¹xõ¸ãìĞKwe6ÅıÔ\r’¼6.?3]˜»Y%¶¼Ôn&ÀåB¸üLb³t¹u×àuÓÅ{Uhÿ\0_èSk]UŒ°™.`‘ví·v}p?Rk—şÍšŞìÆör;²år;ñÔ\nèõKxÑ„¶ºm¾Æ\'z¢†lçÔúLÖ|–±¬76·.ÃËS–ãÕqü«zoCƒİŸO?ó_©‰xÎóşòÜÛåù[GÔ\n«µ1€Û@HêkZhç½ºy5•IUz˜À,a+=„{Ô(xşS¸±ÈjèÇ—Q{Íÿ\0Ã6ĞØ\rÇ°Æjì\n’£B°K4€n5?)éÊô#§5Sk‚»ÁÇQŸOj°-f”‚6ØrG¯\0Ñ!B÷\"k—1\"¢‘÷€†Gø\nV’©¶¾[+rÀ’yõÿ\0­V,!šîAäÅ®‡sor2=ı¿*ÓšÏW×Ü¥„N¤ºaqÛ¯½CvzšÂœ¥Å;ú\\Âš4]Ş[—[eÚj4ŠIæ(bvw8\nI©®-^ÚóÉ¹O,ƒÎóŒ~¦µ ¿±Ò ?adšêU!ÎĞê ƒ=?[–šjL)§\'Ï¢[–<=¥Ù73¬’!Ú-fÚA£uüªí­ŒºœDZjj(ÿ\0ñíy1AİúŠ‡Â×ºF›t÷W—F9YO–»p c\Zè#¹¶»v¼Ó¼9$¹<N¬° äÿ\0rUœ”™ëá)S•(ëßK»şª9ÖĞuhæmÕ¤+¿r•¼\nı‰ÉİY\ZÎ•¦Éºæ8„R6AE~}ñÎšì®4ë-B\".|3nGY-İIüƒsù\ZÉ¼ğ¾›q1šÌqL§Á±”úc‚?*têê®ÿ\0òdb0~ëäWùÛği~-§Í<sÿ\0£Æ²»—;àñı{S¥kUm†ÅÕÇ\r²qŒÿ\0ß&¯\\iÚ¾‰©m’c:áƒÛ+ÃqYRË,’¼“)21Ë„“Ü×Z³w[\\”¡VµO©ÅüMò>É¥ctù¥ÜÃs„ôŠâ@Å®™Ïü´—ù%âc?Œÿ\0®‡Øåø8?_Í”´­>æïI´x#,<}Ivà{Ö­¥‡’¬Ò6Ò£¦:Ÿòk½ğGƒ-5¯†z%ÒÍ$7’İ—±+ò“€p\"²õíPÑæ	uj\"‹$$Šƒlƒê\0‡ZÛàíg©–a*ÑOOt§mqK}«S†1òŸ%—9ö<*†K‹‰Õ¢Y	P\"GÓqÜõäÔ2.Í£®yêjxTfRxÎ9úWw*¹âJ¬¹lB±”¶hv‘äİ+;q’İéîà7‚¸åºqY÷÷rZG,ešBB±éÇóíJSåWaF”êÉF;³oÃ¾×õ\"Æ\0ådgm¨ƒÔŸOnµè6í¶ªj²»u)j@?ï09ü…p~×ï´{×k¨Ş1)r…\\}áÇÌ3Çç^ï¤jé«iÉ:´y1VÏµy•q2r´tGÒaòøÂ)Í]˜v?¼3a2O£Í2ğ\rÉ¯â¤mı+¥;#D†ícQ÷So};}*9îãµC$×*€g€Ã\'üj“êÜ‹gy4ddâ\"Àúş{W,ª]êz¦’²ØØÅnêª0	=«Ô<KéòÏ§Àó\\Ø ÂvõÆsÀ?Lç•Ëjş.×4İeô±0kXİKI°y‹<±SÎTg#ÛĞŠÂ×õìI^{Y&3°/Z8Â&ß˜\'Ì\0%~˜é\\xŒD—»ït¹¬g\nKšJïKvùòëÚŒ0Oo¬¤1™As¢\0F==;ıkÔµ1}jVÊrVÖU]“¿\'‡ä}#ßµq±x–qö‰„ ³ş°äÁsÓ¦zzÖ…¶¬¯\'Ûc	^çA÷e¿×¥yhbç«fÿ\0Mnqb+óÍÉ+#f}D}+“‰öÉ®q	ÿ\0Ç³øQ¥ß\\j:ŠÚÎ!¶hÓË{çÓÚ²¬o²M«ùm!2FƒĞÿ\0:ŸÂò„ñ-Á¸·šîX›dd©m$€—Ö±–rÏMRĞç§6Ú‹z¹¼(ú`”V•ò:d/\0ÌŸÆ¡—ÅYhw1šY.$–7pÂ>ybàçş*¾«sŞ“°G\ZÜYÈÎp99\'p÷ÇÛ¹İN_3~\n8§NµÛ¤·µ·Oïÿ\0&…gÌµ:ïßÆößÙ\Z„I¬ÁÏo<%D«œ”\rœ:}\0ì3OĞn®u7ö×˜÷›Õ…¹Œ@®İ§\0dNF;W\rÃÅiA!óÎØ^‡œsøŸ®qZ\Z‹Ù¦û½7Z7.Êª°<e$PLç€=ºôí^£¤õåĞÕ/{S¼ñl—:MõÂ&­Ÿo;4Gl¦I%VÉU›’¼qÒ¤ñ÷ˆíõİ>èéÃ&™lÑnº	º±\\u8 a…pš}‡ö¶‡}k,úl,nàÚ7JîiŒ6~PAÜsœ•k`ëw> ÒBÑ\"·Óô«]ë6çÂÎ¹ÜËÀ8ëIíD\ZWıMeg2„mâqgìÍ=¡ktv)\"ª®GBs·‘\0íRê>$škI,n`ÔbšÑ”0ûBoå@iPOQü\'·=ë©ğ‡…Ú:+	nnîÈ¸ó…À‡g”Ø_åÜAsĞã¡¬k½OO°Ñn’îÒ]Bæá™.^V\r\"àó»ØQÆâOAƒÈ5¥8Ù»#	´Úº½şE¯İj\nÎ~Ê—\"y3öÙà%¤ê×,ìkĞtÍUbI®˜=Í’™vŒ<mİ¶:gÚ¼·KÓ¤½¾‹QÒ^k-\"Bğo›ï|«İAé–õ8ç¸®§MÉwŸÚHÈşg³-ÃàrAã#‚[¯ÍÆy5³ç„-*IJ³”İ;vùF««hB·pj“ZÂ¤¢%»2±qÔ0şğ<cßµU²ÒoßKº’æ	|ÉVây3/¡V<cÇ5fÎËX»[›kH­WÜ÷I.\0PKc$àc<tª:ÇÛtwS%â5Áå2Eú@úõ¯N7*Õÿ\0®ßğO/âäêÉK—îüÿ\0\r\nizî™öiîWb³‚0AğsĞg§jµı§âŞCĞ& 1´®ä wR§ü>•E-¤½ÑnæŠîYAgî¶”ôĞsDñİG¨Æ“ÌĞ\"8ë{8ÿ\0d’Ùíí[½]¤îq©8®jiÇU·ëÓñ:oíÛ=T;-NĞóÆ¹Bk.çR²´WYíçYe=e@ÈzöR1×ĞÕ¸mEºµÔVwäƒ‘ç8óÀ§²i· CuiR¾Xşø>ı1œzÖ+•m±İ/k8ê×7¦†K“%†#\Z	H“tN[ïÆ*¤×æĞnŠìàBc±íœgØÖì²¶¢;Y™¦Ï˜sÅP¸{˜e“P“|­ÀFB²\'éÏÒ´Œ¯ÓC–¬-¢•¥÷#™k‰.gi˜fVlñĞ\Zd²‰wFŠ…ê~¾æ‡c›AÈ äõ«–·wQBRDg~´=²?Zë¹ã¥wfÊ;Î¡Fî˜ ı+[MÑ5]\rÏRÜds¸ûàU3¾+‘-Ô%»:ÆB8Â¯O«é«kacwm(ãÚÄµnŞéµSæn£ÑtÕ7ø2âiK¦ì˜ërGnùC´Lçô¬å°·š\\I©$jòlA#îã©\':Æ‹çU¸FÛ(6WSÄãùÔ¶PÛ\\¼/¾9AÀV`Ü~`çğ¨[Û›SYJñRöv«6®/t½ƒMOµÎ1ºáÀeãüõ®wQ¿ŸPvšx·1?xè1ØU†±–ì—Äò™TŸÆ´4ÛbÎZ]-\ZnÙAø±ÏÙÅ5wJ²äøWnŸ×™/ƒ4Æ»¸k—Ó šİxËÙ½†yü«µ¶ŸW–â[{ÛD†&Guk08ôÈnsøb©iz»êHÖöbÛÈÀa&\nÀõ¡>Ÿ$Íæ%ıäÉOÿ\0ÀEpÕ“r÷•J0¤½›¿ár4‹ƒF×u‡©7Çoò®SÄzu¸íµmAÕv™Ø¨èNÜ÷®±fÕ`-e°½Ç.a“#¶áš–_=ìæF³hÙ”ğ’#sëÛùR…GrëááZ:¯½ş¶<ÿ\0G×Òİ ß©¼E~ärŒ/ĞßJš}sF¹u}&dUr¬ëƒXÏiäİ™na[Ãˆ\\gç°ü+U­<+4%âÔ.¢›®Ûsù\níj7æ³ù\'YÇÙ¶´èíúgñj;$K{Y¡g”…r/	×T }1c“xó%íì”W•‹ş3ù~GÔeNøHémÿ\06{?Â+ËoøV\Z»H†EIINÿ\0ë¤«ş=Quá‰ã\\íe–ŒğAßZ­ğ|·ü*­)ãlÙ¿¾’ºûõ-lêyR1ƒÜW<[‹æG¡8Æqp{3Ã­<;u9VİBp2à“ê9Å[¹ğÌ¶™ßhë‚?\\]LÖÖö—2	dbØL€qé×ù\n{I!ıÌ–ë	Ûò««e·?^)ËYï+zSÊğ‹h_Öç—ÇjZ¼¼wÎ1íµ¨úp¶TSp_.1†Î3Ó=ø®¶ßJ‘a÷†Pw\0Ä†\'±Èéüø¦4:e”ßé7°Ç$Ä’ËËÀæ¢NS^ô›:iÓ¥IûKäqÚ¿†F&ó\0ûáI8Ç¹#ùÎ3XPø›QĞdšX§h.\"Ošó#“¹{õÏ¯½uÓx·ÃvÇËóäœÊp|¸K(9èÙÃv®[ˆüYpöZV“åÏ ÜÒ<£„ûgõ¨å²×cnkì{ƒÖ;‹(\'Öoã»¼¸£RÀÄ¹çjŸâaÜı=Op\\¯ÊAÍxW…üCeièz„æ) b Hvô=³ùŠïañºIH®ÜÏlŸ}ÁÜÈ=xëı3Úš÷t2—¼Ê¿<6úÖˆ5/4_iêò+D>bœuár=Ç½xåş·6©§¶LcóCÄ’!Y7UÀÚ9êô¯§,îíï­c¹´<.2¬óî+‹ñçÃÛ?Ù¼ÖN–zšë&ÏİÊÛàğáÏæ¦t¡6¤Ö¨I¸èx½ğğ´—1K§`Q$\\q¸ƒô#®jë|5.¢é¨Â–Ú®§¨JğÂò1ÄaXpÚ^Ø85æºŸ‡5=U:v£fğ]0¼Àœêµv\Z:jV1éZe½¬€‹£w´íRB‘»vGò“óu9…Zq§yGâ–şˆ9¥YêQ¹´›KÖol$dKÛK–\0“„™sÛÓ±ôæºïßkFÇMˆN[\rspÉòÇP ±>ùf²<Ags?ˆ.nµÈ.‹„O/l4›p»ÕCTd‘×ğ¬íVÚ}3U±¾ÓĞA0	E¶XÜä>ş»®\08ë×)FšOúş¿‰¥]÷…şßæ]İ^­¶¡}yäµ±]Û8rTd–êÇP=NÄ¾Ñm´[éô}bâö÷LÈ¾G@9ÿ\0w<\rÄäVÏ‰çœj6-k+-ô7‘ËºQ˜•‘B’À–lŒdÁ¬Kßêo¦k–wò¬ò5±†8mbÚ¥ÜüÎã»têsJÖ—»±¥ÒåwZ³‘Ñµ‹}-n\ZE20q¸ç#8íHªštëo|—BH_Èq(GèH9¾Õ.…¦Ú]µÌ×¢AŒ`zäƒÆ;zsNñ®k<cC	bCDÄîÚpU¦}«£ÚÇÚ{-oøË/—°x‹«?¿±Òé>-Ô5	î­fÓm¯!¸Œ‚E¯ÍÈç1à•ìr}9õKÏHSu¶˜®ë {\',õlÉ§8®WN×µ&ø]éIk\"¯—¹yÜ§0#{[–~7¹ıfÕÒèCn’$ÊÜ\0<nO|AééD©òëpJD×#²;ÿ\0ìû›¯C¦Gy\0†á<ùšG&Gg\\6_¶@ìJç ƒû.QKYÎv5ŠÜÍ\n‹‘’€ğ~`W\'<¯µgÇ<^#¿A#[éb ZX7˜3Œ1~¬r	ãÕjïH’Ì[5„İº°—ù7rNâ8?\\ç9©ƒ{?™Ÿº¯-zv6|%ã	%ğôš\n¹Ì*ëo\"F¦vİ–eÉcœdôäu®ÿ\0ÁŞµ²ğµ¼SE<Š‹ˆ•¤Mää3O§¼>ÆE0¹cl´³˜>ü’qx‚#èE{W…ï?²<9eİü—N©ûÉ¦bqÜ\0OaÒ¦5fîÙèJ„9VwûÑĞ[è×PÄËÌ¼3¹rİÎc]Ë£]È­¤\'”çåœäõ#qõç\"º-?S‹TRöQK,@íóvíCëÉëøV¢«DKaÍwÓÄ5ºĞóªà¢×ºì×Ïó8+OMu<pGÏ2–ÉŸj¨1#¯µA©êQÉ+¾Ÿ¥I<lrÜ|Ç£åŠënt}P–VŸMˆÈ§ÄmÉôùO5˜<7£Í!U²T†OO©Î?\Zè&•îÓş¾g\rL-ÅÅ4ıÊß©ÌÙE¬Czn7µ­³|ŞZÈ1‚8À$ãñ­ÈŒÂIO#üÓƒÉ­[º‹HÓ o³À‹³\n)\0äZÍû*êî²Ïó[•ùß-õÛÔıj–\"œŞö3X\ZÔ#µïóı?BíÆª¶p¢›=ÁÎ\0­VÔî¡Xy£¬¤¯FÇb(í>Êa‹ s•¸şg5™|óXHU\'¸û;0;TØÕtù^ÄbáÍù->óíVËĞ\"ol)XFå¿‡°¤Kk…‘!²¾óÄßtFXÈğ?úÕºÚµ­Õ¹2Ù4¤\ZDÛ:/SùRÚë¶6-l\nË‚€±n:éçk¡å{\nri9¯¹Ü­‚np\Zêæ%Só6,?”—2iú1W±µµº’?¿2ÈÌPö\'’\ZŸÚ¯W2NÍr\\Â§ôÜ:~t–vzE»:½æU‚ùˆìBçOOZä­Œ§M¥Vjï§õ©Õ-ÛT!kuvıKğ]jº•´7Ó¼pÚ—ºE%˜ÃŒŒõ4ú•iº[È~×tØ‹vÏAótô¨u ³é‘´Q4‘ùV#µ‘xä8¦è—óÏ§}æ8çaògÛ+¿ÅÁüêÒMs-¹œgìÛÕ­Şº‹Åš}¾­¡UÉÂ†_láRO¬Y_A™µ07\" F_pF\"1I‡ÒîKq§G\n’e›çî\Z|¤*àùåöãqq××¥]é\"1“VÒß4[ğÕ´0	. »ûDRw<0ú€q[şbk´ğå½¤íîîÖ#É&Ú	õÈ«§İ…\"ÓV¹Œã…œ,£õık\Z–”¯s»ÏJš‹Üÿ\0Ì½$²\"VÉ\n£ƒê=ıè‘Ä0Üìtqÿ\0ëÕ‡[´é®½ËBàş†©Üj:å“¯§ZÊŸôÆC–Àœş•¾fî¥•ÚkåşCím,nošæÎ@$qûÄeÏ_öH©ot;áinl­Ã…hãÛ¸ûõ½Î—­Qo$+À#(Ê}2?­\Z‚j6‘«<Ï2\0B’FTûûã½Uİ÷±—$9[i5ıt<Wã^.•Š_nÙ^|\0y	Û·j)~5ê7¶š¹dcÏ wú}(®J÷öç~AQJÁ=_àğ?ğªô3»,ßú:Jì/ò$ dœ\Zä~ÿ\0…Q¡ûfÿ\0ÑÒWlë”`Eduœ«¨G¤Ş=Ô—*<\r(M ¦àg¡èq\\µÏÄ¶¶c´°X\ZBà3=qÔŸ~+gÇvPj2Yé(KÕ”ÜÄ§#r•(Ã#§oÊ›¦ü:ÓV8åuó”.%@¼œç‘œpjÎëch§»9-WÅZö²ÍoiwqåÉ„òí¡#=óœ’?\n£ià=~úàNC1mû§“÷€õÉïø×®XhÚv›)[\"²°%±Èô­8¢Œ`tçJi2ùRZ]ÂÒ6µÍÀ‘ß©,0^œŠÍÕ4kÜÛj:L\"4{nL€2‘€G§ò=ëØnna·µ’I¤H­ÑyséÓ?JàüB÷º´’iÚM¢ÉnñîûlÏòàáWzãŸCCo¨’ì`_ßè¾4´Š6¶ÏXÆ/øè¿ÓƒèMg4:ß†€MKÍ—M?)>c	=:öÈéŞ¹ı_B½Ñ%+)2BŠÇ=Çjé´?\Z‰,ÿ\0³<C¾óNdØ³ß$c¶{²ş9½+E÷¢\Z¾ÇC x²mîŞî)|İ6REÀ_›~zèGõ¯S‹\\Ó¯-êûvƒı§\0ƒîC_<ê¾ŸIcy¤Oö­:\\¸$§¯¸÷;Ôz¿Ÿj<Ò!8I€‹qPNXÆHÆG4I4®…Œö?ßi:µ£Y°3;\ZJ®c1–€G<Œqk¾Ò<E jĞë\ZVé–IÅº¯. ‡î#$\\q‘^ƒ ÿ\0Â1§B¯§Ü[´’d‘•½Ï÷~€[7S¡AûÕ¹Èç\"²äR|ÌrvÑw¨Íây-ô•ºp`,ÅLŒìäß1À\r‚Øè8ÅT¹Ôb±Óã·kH®vü·“v‰ù‰ûÄŒŒñĞÍzg‰ü³z5G[;´!’kt)’VÁúõ÷¯<¿ğ‰­nóYß³±å_iÆwcÜĞ©y˜J)ï«0æëXÔ¢·•Ş%D„w*X…8cî@ròşî-æÒb¶Ë(Œ)\n3Ñ½NÍÖ³5m3ZÒæi5[›y]³æÉˆî¬8ü«:{¹® †Û{ù“åÇ» 98üjı–ªÛ	Ó¼“è^ğö™q«k[KJÂ0d™×æ,lç9=\ru\ZÇ††µ¯Ã§¡kVòã¾²³DÀaˆ¸³È5_ÃC\\Ò,ç·@ëit‹6ØBJIìÄ`öcÇ¨«Ú†¹½È‡MunÈŸk¶Xç¦8ü½«–sªë>V¹meoÏ×ËÈUj8´¢¾òGJÑ¥‚ÚÕ&Dk`T¼Èc”IÃ@ÏÕnš¤â+¨”Û»¤os§tYÎxèÙùOnæ´\'³…&˜Å<\"i+HÛG¨ ’Ä£ğ¬kkÈ<ËWÄ LìOcéZR«	F×zuÔÍÒœ\ZœŞÏOÀµªØÇnñ^èÂôÃ\nï‘ØdÅÎã ?\\\ZÕÒmäñ¤jWRMt\\˜£œmA´t=0:óô¬}]íà}>IŒ0Ü…ûAŒa°	Âœÿ\0	ÉÈïÅjxšk[d2ìEk¢¬dTÂP¯Ì6ôVÁcNj×5”%¯™µx¨ÍF›yş6%“W:-°´ËÚ½Â‰|©fgˆœ„9à*ô¯‡Şyô¸ïutŠdb\ZÚåIÈ<õÏ€cÖ¼ëÁ^}sZ†æH˜iPí‘ÚE+çg£ŒuÆyéšúxV4A\ZD£çöíŠ!ME.¬ÖÑmÉ+\\»-×Ù \0ØÀü)‘›‹„-<±ˆ;S¯Ó­eÍj—Ä]^CEµğÍ€r8?Nek¾)³ª°\\E*±;92£‰ç¥_:)SocKQÕDa‘~D#ŒtÉ>§·õ®rÇU¹×5O°XÈñ[Dßé3rÃº©úV\rÎ¥.º³tĞ÷³òçˆêsì=ı³Ö»\r/O´ğ¦ˆÏÉ\n2Ä³±ì=I4·Õš[•Y¼Ğ·jeæ¸ó-Ÿæ2çœô=8ëÓëZ1¨	ò»¹ä×=¡jWÚÍÍä¥—ráGËÂçœSè{Ö»\\ÉLÏ–P2©\Z©ún>¾Ã5*Æšæ–ÄI¨­Y$É@X¾ìğO8şxªrŒ¶èå“‚yúŒ9ïùÔğj°Gwök£\Z’>C\'ÊŞÕ d™afşÏRNX ı?ZŠˆV44òê	Åù˜d3ƒÄË€€ã¦	Ç¯lhşÎš)LÑÊK¶6²ÄXşaˆÎ­Ë5ì;%û9>b«K¶\\¢ã\0‘Ò¡µÔa¿uònIÇÍÔ¹çÛëY<e5SÙÉÙùİ~;âŒÍf­tçŸQŠxâŒïcmÜz\0IÉêkŸµ3ëBK”Ó<»(!}Ò+•HÃÀ]ıÚÜÃ‡9RBJ°Ü=<ôÿ\08ªºà‡QÒîô¦½;€Šãë”ŒóÚ°ÄĞ¤Ó«.ßÖ¦5)óËšúï‡§‚-*RfRÁr»¼²xùÁ ’:~U»¦.‰4¿½gŠw|yOûzôï×ƒÖ¼ÑµËÿ\0\\O¤j?ÚRXÆØ‹iŞ\nöäöç§jµáK/Š¥¸ºI%¶3c2–\n«{1ë]1Åb)ÒJQV×Ëï8cF•ï(ëæ{4úpxñk EòÀı{ÿ\0õÉjz~ºn#i¢.¡„nFÑêAı@®­§Ëw0	fcÄ‰×#=‰ª\Z±\nZîHâ’`ÃÉ66Oä}¸ë]ë\n+šZ¡âpq«íèOkn¶vën¤üG¯ãMi¡”È\0eR:}j¦â>kh¼èĞ\\¹`#ˆƒ¸œ\rÄrE#ø”Û]yRØ]Ù%âÑñaIã¯>Õ—ö­£%³şµ)PJ;š@Sóœ\nÅ×/¦³ŒÍ‡(` 8Îñß€r8ïZz¨gÑDÚ`di_Ê3\0ÂO±ïÿ\0ë®;«;g–Èê’¥²d–\\¹İüY\0ç¯¡¯?0Íe©ĞßNİ}zyş%û(¥©zóÆ±iğÃ%ş™<WNß¹HÀ!€ëÏÓ\Zé-µ›«hæm*âX&Pèñ®àÊzv®#Ã:®©ëe¸˜ÏM’\0Ê8Áç‘Ï¯EƒÄš1·x…ğµû:e„‹° wü+«	›§zú?=cI¹k#Ã¾?Å\ZC È–ÓÂîóîóP®x×­ÏZÔzÍ®€Ğ¸–(Şà,ª»C‚#çWE:ñ¯iŸé¡Õ¨«#Ò>¹ÿ\0…W¡/#å›‘ÿ\0]¤®ğœšóŸƒÒ³ü4Òcf?4c§Yÿ\0S^üÄ·çœÕš×Šl½½ÓªæÚMûÏ]¸Á_Çü)-f2Ìà*:“Û?á[š­ºj¯n¬v7*õËéK\rÆš’®õ¹åJ2Ñ°$3Åbâù´7Œ—.¦ñ´<å‡l(È¿\n‚âúê&·[HRäJ2\\¸ıØúw¥½³´½‚Ü\\B¢a(g<üşU*IeFĞSƒIÙlR»)d¥ôÒËz]ìvÃ¿(‹ÇËïĞ\Z±t\"†!#~!ˆàg‡­^d‹æ •rçüj¬ò[v³|¼ç\'ëÛñ¤7äs×úe– ¨ÎÏŸ4|®Ş¤zg·zó}sÂï¦LòYüğ–\'bŒ{s×Ûò¯Y¸òbÊB“ü]yíÈãõªW–FxÉ;İ÷†xîõKİØOŞÜò-\\m&}ŒÆM6gıô\'$)é¸Ì?Z&]2ßTº\\Æ÷åf–\0¤ğÀ‚ÙÀÆ	Úk>\nµ¿K4S¶B0É÷éX:]”×¡uno-Ú6‹gLç#ƒƒÆ\n¥R;#>G¹âÛ;÷]ÛJÈÃŠNÅN3]~ã/9š:öøıÔw°g°î=:\Z-µxÂ]ªÁ3œ*Î6‚O£}ßÔTWß	¼éŒºMÆÈÛ»ı	éøÖ|©ê·4r{3¯ƒÄ3¬xÔáE\")Áõ=JÓ³[™|È&Œœcä<¨õç ¯7}Æ…7¦[¯X~øğz}*ü&0ÙÌÑÏk=¬àÌ}PƒœmléMJKB\"õG±¼\"6c-ÛÃøú×+¯x+Ãºùµ+Kkr>c4…‡£¯â\rsúWÅA<Ëg5£ÇËpdæıåÇ^½úÖ.µâ™ïu!ådK‰<€|±&ïîıS“[ R¸ğ¶¥cm;h^|Ö•d{ôT,3œ¡\rÓ>ª®Z[‹èf¹KèË3¦Œ`7rÎ{ğ}kÚ¹åÓ‘w#1òÑ·½pÏøU±¹ºb“-ú³pÏb!Ç©ÜÁEJI½H•4õ±áFyNÔËƒÇ<ÿ\0knßK¼Õ´ÿ\0&ŞŞW™\\¶åRwtãÚ½¶ÏÃ÷\"EÆ…¦@‹ón™Ã·ş:\r7R{Í&I\'™¡{1–)\Z•*=§áW6’º@á)µw±äv_üE©ÃÙı”òK™\0$ã¨“[zw‚¤°ßk©Àe‰\\åQÏ#šï´Ÿi÷·QÛ&U†·H	>¸Ç59ñ†4Ï´M-ŞO”¾SÇëŸ)K™XÓ’Ïk–4y4ı0ù\n°Â¼|Ñü g°õ>Õ¤/šğngò­× F>ûàãœ}+kË™|ıJàÏ+¾DyX‚õÿ\0™ü*ÌšòéPÈmíå¸#Åµ¸ù‰†\0É®:˜˜Qå‹êì[WÕ•5;-Z„]®©5‰Tò‘»ªºıFãŸîrº†‡oÖñj,d¸ÊÃäÃ¸HÀŒí^HëµÒÏ­jz¤İj‘*DÄùq$cåõvå~1ôª·wqÛúMÔwÊ‡HİYqÀ ÏéÖ¼ÜN2~ÕÆÒÛ-şv—ÌÆU¹nï­§…tõ†y\"ÏÍ3É»,}*-g\\¼½ÒÛËª1aæDHÛØŒ{VN«>¡§é«{ı­uSÄ–Ëµp8¸Ï¿5—¡øŠöãı/Tµ™­‘Ã,°M\"ô8?\"äíZÎ5¥)Êë}7OµŸùœ²ÄÉ­4=E	‘4vcp*€v³ƒÏ^£>õuu­Ç¶³ˆÛN]p†s7ËœŒd¼š«}{•åÎ»×&9aËâ59\0÷²I9÷¬y¼@.­Q’ú?<’¢)WÓ#ƒÿ\0ë­*Õ—Á¶—]µû¾ó\Z•]Oy½N¿ş‹«}>ÆÕ&š	·âe’×$ÕAÁ9úÕKÄ³iòÍL’ˆæ?¼`BÆàxÏ~+šşĞŠM<Zê7Vğ.ÂàçñÁ^¤ı+6×T†ñ¼ÓÏäÇ	)ÒyÏŞÚ9$÷y®9*²Ù¿½éèi\nİ.t:Î¡¬>ÒÖQÍ/–mL§.@û£œ.}@®*ûÄw«jVêáÄ÷\0•µŠC˜†ãŒãàt\'šÑ7‘iÓ»_*á¢\rRDÂI9ão¦z`ñVu›»;w¸-î„!¼ÉáÛiÜ\0/*qÇôæºpØk]×\\Ï}Wåÿ\0kK÷›-M+i¬ôë3PÊ‚2L3HÕÊ]øÎ}NàÛéÏœaÓœ˜âP{.3Ùü:Ö¾›{g4(÷šÓÌ›¼õ†7İ\"S}@ÏjÏ¼Kk›xEŞ¤#¸G—m*)|Šqó`zçšÚ†’2…WÌË¥¨S‹ìÚ3n<_3yÖ¿d‚)cÚV`Ì7“ë“ŒsŸÃšOí›»MAä³(oBââ9.Ã€Øé?•Ak×MtĞ$L¨ŞkEåÀÁÏ¨Î;[ŞÇ\r²\\Ëj0­‰Ú\"/ì@ãİIşuØÔl’FğÃA7+nk_jñZn§Ûx÷Q‘1 ÆUŠäáqü,zqÓT\ZÅ¤G%Ä×÷wW’À­³aÉãå!sòz{ûÕ}MšæF’ÊîõK’VF1üíÀúd{SîåÓôõ“S´½º•®3Á‚»ñ”¶	è:q\\œ±NK5}nºùºTùù/æUÒuY-/¶´±À¬†Eã ÂàA9>•£Œ4õÑ\"ób]RE&)òêñ6N…G ìk\r/ã–<Ü@ÌpËo@£æsŸnƒMh¦³jÓÁ4úLPÇ˜×å%7d26ğ:VÓÃÁŞM_ËBİì‹Ú?Ä_ÙÀ’ŞbîOÊÄ[pà\0>ö0O¯5”Úó\\ŞO«MŸ´\\e–\0„üå\n´„ñè=}kZİ…ûKwe¥§Ú-&3$‘í_Ÿn={V-µ¹[_*â`î³™%%Uqßp}}*ùbÕÜlK¢šw-ö«¬kROaÜF²\0·ëk±úl¯ãÍue|ÚPÒæhÚUcq3*Ã®wg=x¬…ñ¦µ§0²€@¶/.è)dŒdŒFN¸¬­KN¼ód¼2›Û$s!š¿r“O?Ö¹åFU$®¬–½Û~½IÓÕ«Ø§ñ9.“AĞ÷ép…îq¢®#\0F	x ãô¢©|FÖ§Õ,ôÈ.l’Ö[i%Q³Ô\'øQ]Øe5I{Eg®Ş¥Ó·*±êu{}?áÅˆšDˆ€Ø.q¼™§è+zÿ\0ÅI ‚Î´\\2îé’Î;öä:%îÏhÖ¨A•¢`¡†U3+åˆï€3j÷éš=¶š­`âè¸î|òqÔú{‚¶zèmmJ–Ú½äÅõ\r*ê\0%¢C ]¹Á¦Czog›ìÖw‘¡Mí1•w~#ït8ä~µÙaWo¥;\0àîç¿5>ÏÌ¥Rİ8M/–È–E0ŸáíN‰Œ°«ØÌ8dv®šK;FÉšÎ{àƒùŠ‚]\Z	K4,Ñ³ÕZ£Ù»èhª«jsÒ“Ï˜ÌÄœ|€’zcüi¯;0Ç¦Rjİí…Õ¨Ã*½\"à©ÿ\0çóªáY¶ñ¸r£ÔZÅ)\\ªáX»(ÇNwLâš®w…WV†ÈúÇµ_#6G|?Z†[bÈrAS÷K¤÷ëÈ¦šêKO¡]š¯ÁÀÜ==ÆGn•‹©é1jöa“a…Ê±;Àd?Ş^8?‡5¿¡D€\0=É©_,‹ó`”¶AôçÎ²’¾«CEÙ-¨x^şÉYŒRK	êÌ¸ÿ\0ë\Zn•âMg@#öîÚ%#÷D—SÓøŒ}+×ŞÆfß¼Ÿ$ÿ\0yW úp@ı+PğıŒác¹„*Œ•rÀ÷ç8£ÚI|H§Ñš^ñÃëÅnV‚píz­Ûñâ¹G/Šµ[+$†YA9q—(2wg \0ÓéPßøæÊo´iw/½X2,œƒßÿ\0Ö~•Îjšv³¥¿ö…ÒÈCåÜg·<ÕE¦ôfm[tmËğä[Ä$MvİfOõˆÛHR=óíZÖĞ\"F½™5mF@†Üş\'÷5ç­~efûD‹uÜ†•nl#Pds ì¡I zr@­-\'¸“‚Øõ+OÄ	ƒJKH\"Û¿|vLå÷p?GÒ§‡ÄÚ©{öÛË¢pFË,ì\0oãšòØ<F°JH³Vnİ¥F>£üš{xºbÀ;s9ÚW\'ó9Å\'	l‹R†ìô›ë‹˜$k©5‰£É--¡ cØÏ½\\ğæ©FÖR[\\\0˜ä¹…Ù÷\'úWÍã©ä‰PiÖghÂ–RØLâ¬éş6ÚX¦ò~u#(±*®=2w\ZŸg$W<ÑøÂÖÆî‹\"BøghX(sŸ˜g¨ü3ZÖ>)Ó­ m„S¯Èo©À?¥UÇpêÛ‹=d;ŠíiF:ã>¾õŸ.›o¨*êº~=ª*)#ù™\0¸Ò±©S–÷[T¯\njòFŒú·ˆõ›g›K’Ú`ÅvÇ·~G_˜ôëÚ¬ØC%´–XŞæÙrÒ/#©$ôã’zÔvq_:ÚöK˜¡´¹´E•ĞôÛİO¿ZÌ¼°Ñìíå0ÏvcF; yK\\cÛ¥xXš´ım,ôI]ú7şG%jîqºDPësK2Ì%ÎÙm0yƒv è>õÓÏâu¿°”.›y° eØ$ŸT\'<uë^UuªYÛK2‹LäŒË,…\\zcQ›[Ô®™3wu&á€›É?§Zô¡€“wJÉwÿ\0úØÆœj$Éï5i5	L—÷W²Ú™IRÍ£·ko@ñm¾VÀ}ÖÉwÊf–6g™¿‡pSÆ;}:U¯i¶—6wÛ€Ù\"G*Xã%ˆ#Ÿ­&±á»3Ô\Zò3lráícù>£šëöÔ\\ı“zÿ\0_#9[^e§¯è`ê@k^j±İ…˜8u·\nÃ¿b:­c­Kb|û‹xnÜ—eË)ï‚:g½\\Ó$šéŒ\\ì[v,e”‚JŒÆ5Ÿq4º¤òYÛI\n[&X»€Š@ïÿ\0Ö®…\r,öëxIh¿ÀĞÔ|Iu¨ÅÛªÀ³ŒœzädŸ­>ÃûNïR†ê«I/&,hØ`ÀÃ¡Æxª	áÉaŠŞâ[ËE‚s´L’nëEiËáF²+sw4/`®¬’Æà4ªzìõ\"¦Q‚Z\rû8ÆÑü»O&éØkæ&‡÷Ú£9FÏÈ»ÔöïEA$–wGË¶¹\"òB¦@Ê=TŞõ_Nµ·K{Ëk¯µZ<ª±o]¦GÁÜ0}2¼÷¦[A-”‘$véw\"Éµ [‚\Z3œc\0tüMs¨·wÛoé™Ïİj+sa¨é÷±l”³†Ü»Xl9À?Âºx‡NÔm`¶°YöDt²:¡FÏ(g#¨Î{S|Y­ˆVÒÚëO£ï¶§Şs‘\\­¤ëZAå¼X™\\¶â\0>˜ääÖ´œªÁNQ³=,4Ÿ/½¹vˆîR$»D[Ë»s†\\|ÊGsõ½¥ÚiæúK0Z²,kŒùyÀp[©ãõÅc3PÕ÷_i9§%çWg¯<(^õ«©xZK-$:“ÌárQpQrr=úvÅ7(÷õ.¶!AY»6mD×ré‚kx|Ä™äšá˜ÀœİÆ}}\r@4]bh\rİ½Åªt\0©#œg¯\\V—e}š-ôÊŒÍ\"F2X‘ò‚¾øã¯Z§\rÓİÍ3›I¸Ê;çŒ{VNœ,ÚWhä…Å9İ;yjtÖÿ\0Ùö1}»W·ó™¶€B|«€0¾„Œrk6ûTÑn$–ábÊy\0«ª†…ôÇJQ\'ˆÒµÅ;Ç\n2ß,|rÀ/rk;LÒ/V!%òµ¼.~qó0úu§Zå§M)¹Ö“Rí}=êi\nªwæz¦\\ŒN×bê€mìÆc‰Ã4q#œ…ÊA\'ôö§SP´’Êá­şÓ •Ia\"œ€å:¾´ºG†.\'ò#¸vŠ9ƒG‘6ça’1·<Éæ»ûÏi–R%óiùTá¶HF1ĞŸÎ»ê;AÉkcJ˜¸Bñ[™–—\Z,÷\"O±Z­Ë 7Q¾YPä‚§±#˜ç­pú¿ˆc’şæû’´\r¨}Êô®§W±¶‘>Ù¡FÒN0v3ì+×¿¡¯6Ôgyn$2B±J[çŒº@Áık‡.ä­~Ë£İzõé£g\"<İ×âZø¥=…–•9¸iç{*;e”aOäsÅßê°jz&…²âYgfGFp ùfŠõcUcJ7ä\\Û–´C:f–ò±Û;(ı·º\Zº\'YÔlìØX]ù/cÜAE8úqŠçí´Ò|¥_ÇEbí·€¾cŒçYÍ$3¬ªOéÚÎ‘íšÄ¶1,:Ìeà‹,#İ²rp}ñŠï´íJÊùA´[Œ•î+æı7To8¼ËæDeHéÈö>õÑi> ÆHÚè•\\éœ·°ÿ\0ëÓ@Ñï¾cœ}é\ZMƒ…zW˜xâlWw“A¬/’\r»A-ÔäŸ^Ücñ5èZn­¥j1¨±¾bBgçæ›ĞIJ—{ÁF7|ÊN0;Ón4«{‘”-uÊƒõ|€}>”ğ£°üéX.ÎNÿ\0L¼„oØe*^AÕj²¸¹P&A_™¯®kµl/Ş#k3PŠÆí	~ô’6ÚßŸÆ¥Å¦ÌÌkÂ„{ƒÏôÅB÷HJ£mê6OéH-eÎ…¥”7’\0*7FÊ\'U€‡`0ÓšÍÁ›Æ¢Ì¹í3|Çå,ß–5‘•Œìyå«Àô­=%‘$ÂÎ8,¬NOàHùcóE‘€	a»õ\'Š\\¶è_5Ê©¼¶üÿ\0±Ğ;N*‹ÛoßlÀJ¹ç	ò˜9ÇÖ¯Ílî¥Qãc«ÎÓèGSùŠM³	4±D¹È/œ#ùÖ2‚)3–»ğÅŒ±4¸3“—,ÄY6¾±Óî˜ŞYá$ÿ\03ì=ş`9şğÆ\rwò[Ã(qæ\'=?AĞŸcUÑçGòd‹sƒò«üºT©N Ô_CŒ¸‡Áöò‰® ºû3—Ë„ŸÌÓâÕ¾C\"cK¼\0.ÒÏ3]N¡k4É\"İYC\Z0äÈ¡€ÏwükØ<dÿ\0gÚ8ÜGĞàsZû[or9oµŒC}ğù[l\ZmıÄŒpªPcÛŠ¾m4j%[xò3>JççV Ó´˜4©ì|«`$l”Û¹Ëv*zJ]_ÃÏ;neYlE¶ŠR]É ³Î6^õÅ^½Yûªñ]ü¼¶±É^RO•hbj×keVúK}‘Z@_Êsïœõ­½#P¾º”Á­Úÿ\0iZÉŒ¥™o:¿7 Œóèk¹²–KÉn\Zîö8¼*(Üpn¦º\røƒìºeÅ–™kqª;>%¸ˆJ“ÜlVÔé(Á6îú¾¿yæ9Éë{”N±q£¼v¿dû ·,c,72å³†Ç \'Ÿwâ»È„Z}¹w‰K™9eQÉ\'ü~µw_KİGXq%•­´Ù–)	Y03“I¬HYÌóÅ%Áœ¡PªÛFPOSÛ5tğñošQ×µÍi¤ìŞ¤K¦D=ãÈX•2»±ûÇ¸­­2ñ,ôk«]\")Öéqq*àäXœãƒÍf\\M6©şì\"’å¡ˆaQ‚áØû ş4Ómgk£Í,\Z„²\0AU·\'¦6g¿ô­ªCÚG–_q£ÚÒÖæŒÚÄ·º…ŒZ•¬PÚ›ˆ¤mÅ˜y{º“Ó¦{R]]Ûİ\\}–)Õ°b›¡‰Îx\0·±N±sw£2âÙ7‡ŠER1Ô}½^Òu‘áË9O¼™n¥Uó!–cfõöÇJJ*ÑZÛ%·¨¥E$—_#SQşÌµDÓ­•¥¹vöx‡ÍŸFaÅNŞ6ÀÌØµ.\0Ê\\gÓhñª\Z_‹mm®înN”­;®æ`Ã,ßÄÄã ªÒx·^ÕïÑ-Ü,DQ¢\0ªoş¹¬êGÍîÙFÚ·ıY|îc\Z\r\'ºõeƒ£¹´y#†	XÈÏ*ù{€8Î=\rSAv¿åÚ;«uX¦#<lÖÔ¾¸Õ‘TÔ-ívŸ&Bİ}Aãò5{EğÆ‹¤Ln¨//PnˆF*ŸÄÿ\0:Æ9†+}_dÿ\05 í%âÿ\0¯¼rèÑ)x—N–ŞÙŸÎ†YòÆ\0âµd°kØo,mí#hÜ‹„‘›¼~õ‰®ë:şj’ë:Tc˜í£Ÿ+£‘ßü*­†¯â-e–;[ËˆUyaå¢ŒöEjx§;ÒI/7şW‚åæ›:WÔ,5{‹‹iõ{9e³ˆ»©Pqç g©Zá5+¨¯b±{k/³EåÙ­Wo™´úıÒØëZ\Z…„ZÛÂ@¢xÜ—óí®×+îWŸÒ»dÕôİ\"¶µµ’âÆœG6Ìôãüj«W¯gfú+Ñp¦îŸùu­ÕŒzZZÜÊ#¤Å»FPœ’ŞùúãšÄ²¾¼[§—Ğ\'UÙ3ò3ÇSÖ½BâÂÃ^ÑâÅ½ªFrcO$¬8Îz“¿Zà¢°5¬jv×öì|Íñƒ\0g9c½tB|ğw…–úÛ_ÌÅÕm»»şF%ø•5-ì2HÀ7œœíöïÚ´4ùáÜö²[¯—ïEnZGşó…-ÄöšìSéö¿gtcµmG^ÀãüóLÔîíaÔİa°_µ•aIw¤^¿6ãú\nÖÊI&µü‹œ§RÛú¹6™,÷\Z‡Ùå¾Í$?)\nO§×ëV¤ÕllnçwÔ®®î”Ô²äĞ®OPk¿Ä–ĞÜ%¬Qÿ\0zÏÆìô\0z{Ô3}x’s¨Aâ©Rù™1¦¤µü|Z—Qˆ¯Ñá’0BMnH#Û«í¦i÷µÌÇø‡˜äš©i§Üjs:Z b£,XàÆ k[‡¶Õ\0ã–Q¥ŞÆª”²vgo¦êvrˆÒÕ™B¼’7ËŸ <çÖ¶5Oéqh÷z¾©u!œ«:ˆB3cŒœé^_òâu8>àÖüş#¼Õ, ³¹bmâŒ)rw‘ÜûÖn‡+æıÌı‹„¹“8í]·Z[Œr¿¢®øÊ+[+)!—ÌYûçş4WEÓÕQ’’º=Ázu¾§ğ£K·ºÚ±<S\0øùƒyÍÓó¯5¸¶{BkI~üNÉ’:ã¥ciş8ñ&•a…–«$6°gÊŒ\"¹$£ÔŸÎ¨\\kú¥Ü¾mÅ×˜øÆæEÿ\0\n˜¦›¹£’hêì¤nB’ëşqK+´<—epÇŒcŒsÒ¹ÖoĞ‚³à˜Eÿ\0\n_íÍGvï´s×;ü*º‹˜í-ï$¸‘€O˜ü ŒdV•…åÆŸ0“Î1Lp$•üûWœ\rkP\\`„\"ÿ\0…Xë2&Ç½,¾†5?Ò”µgmOwĞ>$k0Ìa¸dºƒª‰0\\tÏzôë]~;»E™YGÊ	ç×¦+ãdñ©+%ÖÒ½xı+B?ø¢(–(õyU\0 (D‘JI474úaE²ä‰±CÈ\nÜ~•v#©ò×\0z\nøÖ×â/‹lWm®·<KœáU9ı*ïü-¿cğ‘Ücş¹Çÿ\0ÄÓH–ÑöUºPÍoÿ\0ë¡W»\nùş·èa¸ÿ\0¾ÿ\0‰ |VñÈÿ\0™ŠãşøOş&ßPº>¯›CÓ§@‹\"Ñ±óUŸÃM÷\ZU™úWËƒâç`xãşıÇÿ\0ÄÒÿ\0ÂŞñïı—?÷î?ş&™ŸQ§‡R&ÌwSõãò­ d.èÆ:ü±_-ÿ\0ÂŞñïı—÷î?ş&ø[¾=ÿ\0¡’çşıÇÿ\0ÄÔ¸Eô)T’>¡ÿ\0„cÎ]²ŞÈFsÂ\0:cxMŠ”\Z“Ée–<ş¹Í|Ãÿ\0{Ç¿ô2\\ÿ\0ß¸ÿ\0øš?áox÷ş†KŸû÷ÿ\0G${µ—sèËÍSÓ£2Ã3]Fv¢óøŒGĞV#ióİd°Ÿt¤ü©	@Ç¾œûW‡ÂŞñïı—÷î?ş&ü\\ñáÎ|GsÏ_’?ş&¹ëá½¤c.R½¼­c×õ\r/ÏÓ&ºº³–ÖÍÅ<!‚F0Xg¹ôÍsÖv·WS=¥œæA™ÄŠÙ=Ï¿jó[Ÿˆş.¼EKniU~ètCÒ¡“Ç\'–!ê²#÷h> ã9®h`¦—+Õy¶ÿ\0K•i¹Ëšú·®Ãg¢Ø‹-J´‡¬7^Dn£=™GC^u%õÍ¦£çY^şú>âÜl½²0?#éX×>8ñ-åˆ²¹Õç–Üìp§ó8É¬Ó«ß\nfãË_ğ®êtùw&•Ô-õËh#Û©Ç,÷SDzüÌ®H\'¿µ`‹k©·^yHÂFc¶L®}{õ®3û^ûvï8nÎs±Â¦ ÕE¹ƒíä“’›W–*œ]î„¨òü\'¡Ø˜ …¢ÕlcBQd8=áéX£I–ôƒgÌ„‘ûµ8rg[ÔŒ{\rÓşéQåR[xW³t{{ç‰‘·®Ğ¯JZÖ#…)Bí=ºO	kV‘‰6ü¬œ¢ä{c‘iW–â9f¶IáB2b1\\¹ñÿ\0ŠYÕÎ±.å ƒ±2åRÉñ\'Åòÿ\0¬Öæoª\'ÿ\0YÔU¯î[æ/e9\'ÎËÚ•Íéf2X‹Tü¿»ÛÇÖ¨Ãö‹gFJĞƒU®¼uâKÛ\"çSibşëD˜ÿ\0Ğk>mwR÷Ëq¹±ŒùkÓò­)órÚi\ZÆ<«–ÊÇcc¯`8ÔâAÆÅŒ.?•Rÿ\0SkÛµdİ(0Š0÷8®SûRóşzûö¿áGö¥çüõ÷Âÿ\0…5N	İ\"cBœeÌ‘é¯+êz2^\\Ÿ&š4‘‡–\\úzgŞ»#\r«¡Û]ê“Á¬»1±…ì’kÁ!Ö¯à}ñÌ¡½LH˜¦^ùºÌ:çıZÿ\0…D¨ÆMy}]ÙÆúŸk¨iPë:ò[PÛq1yöÏANÕ.õXdŠåæ’xË|\nÃ×Ö¼»ûZ÷ş{ûáÂ¬Ûx—X³B¶÷­\ZÁÊ¥Ğ‹wz„°ÿ\0ÊşóÕ´¬éşsO©-¬’ÉÂ	\"—ÛŒnœµGÄwş#¹²H5¨ª7	\0Ú­é»Ö¼êëw1´sß´ŠÃ2)ÏéQËâMb{xíå½gŠ?º…Wô©ö3SM5nÖ*4¤¬İ®z7‡gÖfIä€Zf“l“KÄKê>Õ‰\"Äº”×\Z}ÄÒrË# ù½[o¡çğ®EõıRHc…îØÇv!UÀü1I»©AŸ*çnzáü+XÅ§~ƒTl­©Ôj\ZÔ÷–ÆÚX#Bê$jÎC’¬8 r+\rµ[×bÍ0by$¢œş”\rRğt•ïÚÿ\0…j¬•‘´#G–*Æó9İû½ê:šc¬A›F:qœÖ\'ö­î1æŒ¸¿áGö¥çüõ÷íÂÑKCv¤”íR\0Ç$œbº­ÃŸhxîEıƒºô·š\\	G§ZóíKÏùê?ï…ÿ\0\n?µ/üµ_ûö¿áQSšJÑvù\\‰ÅËKÙwÄ=>==lUté,¤g²ùdoÂà¡üè®BëR¼½†(n\'i#ˆ“\ZœaIÆqù\n)AIFÒÜ#UcÿÙ',40,1200,15,'A'),(2,'caney al aire libre',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0				\r\Z \Z&\"((&\"%$*0=3*-9.$%5H59?ADED)3KPJBO=CDAÿÛ\0CA,%,AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAÿÀ\0vô\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0õÊ(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QFiªÁ†AÍ\0:Š( Š	Å&áë@E&A™ v QQî\'Ò‘€şÁô¥q’Ñš¬’?/>äô¤‘¤‹ç¼ªGò¢ábÕ\Z¾T1‘QÊå¸VïÏ­(¨pQ\0,«Ti!Y\0ß½Œ÷\\,X\r“Å:“ P=\r1E5úsÒ…*GÊF=¨ÔQE\0QM.ä“é@¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢šğ °èÔS‹ëI¼ÀÈ 	)	ÅB\'\'¦1J²ärq×Ù’Ÿ­FV2I\'¯½2YG¼7Š…gÌ†8ã.G\\pãJáÊY]£¸ HEª²InŠşjyL£vO_ÀÔQKq÷›k)À]§“Jå(—÷8i²Œ“ÅW[ˆ¢q¡‘›¡nüj)^i%1«Çå©ù™¹ü1I°±l>æ\0dúûQq(NñÇ¨¨Yá‚=ÓÆÛOV+Àü;T…¥Å0ò›\rÏ8áC`•ÙjÚc*‚†FyÅIpáæ/¨íLc2å”wÇåUåŒ™U\"—÷O‚FzsÚ†í nÉaŞQI\'Ô–àQu#,E²qÁ^ Ô…#ş eÛøâ«L‘³)†O-]°ëœúDVZ¶M±€”ÿ\0´jç‘,¡£=Hà­YÀ\0e‰ª·d_İHG8eÿ\0õĞôB[“ÄPlˆƒşÑéQ]‚3&õ×‚*ÀeÉZè¦˜ä#€Š‡°-Éi@DoÇE>´Ë€Ø\r*`èNEMáËöêF1PM\"¿JCöÎpÔ=ƒ©:ÀÀcè\r5ßÊ`Ò)AêGãDFf„d®O¶0)&xşâÌ7úÖŸ@êJXg%½)2#l•ØSÚ…2…¹¨æ*úğĞ(¾‚\'¤pAúR`y_—Ô”ˆÌW;qøÒH ´¥O®qNábFl_LTjï¿çh=9¦De\nL›[hş¦¤\nÄnfÁô¨Ü,KAéQ£18Æ@îZS’:â˜‡KLŞ’ON¸æq‘…ôÈÍ\0?<ÒÓWÓ¿zu\0R6pqÖ€0(h¢œĞÑHE-\0QE\0QE\0QE\0QE\0QE\0Tjë\"†Cyt5º§>ô®;)\rfÿ\0mÚü´Â$Î0MM-Ù„Yÿ\0ÁëEĞY–•¸ù¸>”»×ÔUk™a34“P:“ÅTµ¾ğ‘i$2‘ÔnÇô¥Ì;\Z›×ÖšXç T¾Ñnì`¹_-ÀÎÖnö=ê„šœ6—\n-eÜ„á‘ê	£˜j-›&r	ô JÍTc’VâèmôÏÖ­?––lÎìñJáae2*îdbe<Ô/s\nì\"U!Î­A¤nG—FÒƒƒƒúRZÛ[-Ã¸OŒİ~¢•îU­¹mCvõ¨ä¾Š8Ø¿ÊËÕMAy¨ÇdÅepÀ9ä}jdŠåEÜÙ—İH!G¥+ßD%¬³Ë.%R»[ŸaOk“lÁfPôuéŸz.æò¡2Ç \0\rf³¨Ê¨ª`†@	4œº\"”\\µ{SÊ¾q*«›îã\0ã¹5vfx#.‘†’£‚i”äñ²¯Löö¬ë½Q 2@Nö~;úûĞåed+92Ä·ŞH«óvBçğ«qÆè™(ÓØÔŞLşd*],ÈÀ“KqwP-ÌrïŒ„ç?Oz{ zèˆ¯\'Šæ1ŠUË`Œd¯¿=¬qD6fÎK°ëTl¯­wšRl7°vÅh™C’ªì’c â„ú°•×º†MtccÂ\0|­ü\'Ú¢ÓÒ1äŸ2ãmTõ.$p„CË23Ò­Ã~$@±Ê«ü)(,Ò’zİƒ‹JÅ¹e1cÌA°ñ‘Ú«ZE\0wpÛ¹;Wiù~”É®ÃÂ\n$r|¸ş }*ÇŸ¼j¥LhVã;İÜVi9”&QWıÚ¥Ü]‚Q•‚üÊW<ûÔÆuuİ˜ÏİmÙRi–rïye0°là1Å\rİ‰l\\ö\0=ÍSœÄó¨”l‘O×p©Lí·qY?İ–9eˆÿ\0¬Ê?0h“¢â²’\'lçÅV¿-°¬Ê\n¿ÂjËM†Æq÷GZ«s.®Xd‘ÿ\0ˆ{Q-nI[´)Î@Ç@y§ÌÌÑüĞåQEÎM¼eTıÑ‚ÔK6#y÷\"ŸAu\"·ò<¢¦Q»¹œT›ÚDıÔJcí¸ãwÒ™g$n­…Èc¦w!yÜ3÷UzĞƒ{‘[´{J’ROî“È©ğÊ‹‘ß=*§Úü¹€eo›å\0ã9úÕÅb@vç®{Q&ˆ!UYbÈ{)n?\nŸ£$î\'¿\\Ó%;y\r¸£¦Å<RşõCgi¦´Ğ7Ôn\0q¸IŸqƒùU” €:R6Y	bc½WŠîÜ²ÂKv84öâÍ´ôYU{ºœÔêQÀÃdc¦i7—$\'@pI¦1‚Ø’íe»ğ	 ˜ årwQNR$A‡$w=\rñì:õBL¢BˆqîsLÈ±\'9ØİˆëJ²ï!sÏlP›Œ‚ıO°¤oŸ\r\Zÿ\0ÀÅ °ƒ»yÏéNWVû¬ĞÓ0Xüÿ\0w°ÿ\0\ZlZ¿Ê¹|Z`MšL©ã53±\nT¨Ç$iì¨0zzEÀ“4›†q‘ŸJ„‰qµIäòOaíNÆ£8¤´Ä=‰ÇiÂ¡û@í•õŠ•NFE\0-Öp½M#|ËÁë@‘È¥¦ğ«è$r$‹”`ÃÔĞè¢š„°ÏnÔ\0ê(¢€<×ÃÚÕÆ˜å$rĞ·ğƒŞµ5¿‰-¼¨$Vgş$È ~5£È!qÔÔS,Œ½Ì*}Ôrõ/œ¯1îsë].™­ºÚıšêmª2nãÒ¹ä»°Uæò!ùÓSÓ²svHöBi¸Üì^ÔîÄŞ\\RË$KĞ3øTV­-¼«,LU—¸ªgVÓAùe”úçÿ\0×¥:îŸŒ ™ºıhå`çvu:´WV¢Içj!ëõ®uÌ“Jdfb{g ¨›YÓ¸$ÍŸdúÒ.³dïå¢Ü1nØ†sùÒQh·RêÆö‹¬MbR’bo^qQêw±Ëû¸%‘‡° /Ò¡(71®3ópEgKªYBûLÁ½Ôf£–ìjv,B$•œ¯ çšŞ\ZÂÏnŸi˜Ç$]Wæ5ÌC¬Ú–*[\0î+V?µ,¢¬À³p‡48±)’Nò\\M¸³Û&­é—“éÓ‰Ó÷‡cP\\Ikj	’åú¿•W‹ZÓpCË!=¶ÅÖV7;šú¡ƒ÷ÊXÿ\0\\*ÖHó\'#¾i·\Z¥¥¼±ŠM²tÊâ.»¥:ày±“ßÊ~´r°s¹»e¬,–¢É¶:}×Á\'œVMìípÁVG1¡;sßëUÿ\0µ4¥;~Ó¸×a©lÚ³şs‘î˜¥Ëaó“é×·‡‰;¯cWnµ8¿×C#		-°\'Ê	¬[«Ë;\\Ÿµ‰€f©¦³O\"ÌDc?(ëÈÖWĞì]mÒ¹cœ““Zzn¡¶/²İJÂ?á~¥>•Ÿ\rÕ¬ÖO*<ãç5Rm_Oh™ØúªqG+9µ¬ê&ê8í ”´1Îİ¥½gBÓ[È%…Š²œ‚(Á8ó›\ZâeÚ*½Î­g+	âVÃ˜éìõ˜‹‰çx¦2Ş²5MF}FrÏ!(>èè?*¡§ßÙİ\0]™IÉÀ©n5=&\n.ecşÊæW°s\"ŞŸy5›äco¼¹àŠŞ“]Km3lWk<ÍĞÁ_¯­sk³)ºFxS3®?J5->Sµ&‘˜z!¤“dÉ{·—ÍiågÎwÍoèºÖ}¦ìD@çrnİùw®Të6Ëv–Ø2oÆqM}oO#¬ñ·§”?ÆYn>dokZœ×wÎŞN{q»ëUl/®lÜfF1 ò+8j–„€ghØÆi§S´\'`¼½6C‹aÎêë_†5L7I4ûq·f9õ\"¹)îo.&ó^æVlğIª-©ÛDÄ¼ÇQ´ğ*[mBâ2¬‡`ï¶›RiO†u¯,˜®¦U$}çîi<I­´­ö{)¾_ã‘‹Ûé\\ÒßY1Á¼„ØñS3ÄˆÍSã8¥ªV¦î$\r43,‹#.x®úËSŠâÍf{¨mçù×Ÿ}²Ğñö¸sõ¨¢¿îL+ ÈçÚ…t\r§¹ĞjúıÕÌ¦;Y0¯oSõ4¾Ö®-î|™ä‡øÎ6Ÿ\\Ö?Û4õÀ7q†ô=©Gïy£‘}U¨×pº;İKQ‚ÒßÎ™Öoî¢¦¹kŸ_M0o(9·úõ¬‰§0ŸŞ¹¡n­Ÿš%ç»U;±+#¾Ó/Î¥hd‰–#Ñ»œúÖNµ®ıœµ½’®G\r#“X©\0)0ô8¨eæ#êN)]††Ö…â	ÄëmtÁ?#“‚¹ş•Òİ\\$´×LkĞ)ë^yIÁQÿ\0÷CÌ†@½¼ĞqúÓM¡;3R÷ÄR4Ù¶·D@z­tšF¬582‘˜ÜuîpQ3LFÈ‹gĞæ¯[FÀ-üÔ²¿…-S³GA®ë6ÖgÉHşÑ0êI8¢ğ÷‰ïö{ˆ˜9<8ç5ÏKòæY‰=I¦Û¤ĞÊ&ƒr²ò§wqékƒuwÍ<í²08Ísğ—ùWjÌ˜z›&³ouKËåU¹—p\0\0U##;Xz\Z™)#Ñ­ïî a	î\\m¬_X²Ó¥ò÷K<½YTñøÖ$~#¾†ÛÈ,€äsùÖ[fg,I$óš|ÃQHîô~ËSˆ”o-×ª7­Í#,fi%ò#ôüs^{§Ï.Ÿr.#Uof®júİÖ¢‹€Dƒ²´)w*¾‡E‹4Ár gq“1‡¶|ï3Q\rÆsØW–2=FEt:‰&²³[XícÈOò£˜WC¡Ôukm,æöà9=W‘SZkv–æx&:mÇÍŸLWŸ]4—3´“6çnNjmïû.ëÎòQõÁs>Ê@2ÜãÌ*ÀÉ\rÉÇ×¥Ai¯é—W&Ö+¥2\0<gé\\®µ¯M©Æ\"Uòcî3œÖ…„¢E8eèjœ…Êº²f@qŸÊŠæ´ÿ\0YÅgrÅ ‘W\r…İÏÖŠryO7¹ÓîšÆ+ËJ)„Ì§™æ0úÔšÖ”º%ÊAq#LZ%”à`Öl2/˜o,„sŠÒ\ZíÜšœW÷F;—„Ô`ÓŠÙH®EĞ£çgˆmÔåE+±?8ÚGvâº7Ä…-õ)n ¶w”ù‘£®0O.=8ï\\Õğ’YÌóc÷œ‚\rR•Ù…ˆ\Z‘	‘Q6@ã\'&¥º´»´m·¼Gß¥Y O¦qLÜÊr¤‚;ƒQî4ì€9ëJà8Ï#}éıM(cQ™@H×ò­K|Ş8‡¦9¤ÚC ócØr~1íQ>µÑ48\"Ìò\rß^¿…g\\İYJÆ=>É¤>­ş\nW3wœòriwšÓ¶Òï%§òmÓ¹p3RLÚ=ªÌ×rz À¢è¿; àäsQ—&´RÆêñ·³GêçüjÀµÓì×7·i#áˆQt0sëZşº¶·Ô7]HvtÍA$ğİŸ§¼y©\"ÓYÌ¾šuşî2j[V³WR’\'¿­ÿ\0Õ–;j)gÜK!˜`œÕ©g³\'Ê³´’á»¹àÀSÆAó^K\r²ú[ò§p)>¦—&®fÕ‰ÒÖ[†ÆNCåÇZæåcÿ\0¦Ió\ZwfÇZr»!=Á\Z{)™‘ç¬­Šn!N<Æ¸~â.\0ühĞdO)Â¨à(â€X\nVÁl³½Næ5ÈrTƒîrhòÌz’hÜÀ23R[¯%¥a´zšÑ±°‚{T•·e†O4›HfdrªåºıÒ\0~¨Án¹æ´õ8­ày9ŒššßMíÖB[$gƒG2 Ë!9ÜÙõÍ5™›©ÏÖ¯Éi¿\'kM\\}*\\îj9¾k‡bF1J“4`deÇ£§XÅtÒ‡Øfm*Ú5$fe°Œå‰,r}ééq4C	+(ô ™Ã¼P‰N8ëQ#Øò†»œ\ZwŒÍ¸œš|R´rùÈÅ_¶;TÄ[7\n|·î²ñúÒ(XúL?Ä§\"	-Ä³œÈÅ½,ËÌr>Õ)‚9FmY&ÿ\0g8?•$_fVÛw°Ÿ^¢‹€²ê3.Ù%,¾†˜$åKºsZ²öJG™lëşËóQDmùwQM	õëB°‹Q¹„Ÿ.B ”éuK©—Á‡ºŠŸû>Údİi\'í¸TÚ8àl\\Ã4cÔsF€C¼–Ï$S0\'k`Fjõ½sş®ïŸCÁ¤¹Ó\r¿\")e_TÁ§t\"_£M¨Å“îZ¹­j·Vz¬±Ç6åá¹±í…«Mƒ3Àã»UæÑLªdYÄ™ç>µ.×»‘ËâÇFŒù`7pRû}ßk™qşù¤¸´’ÙêEIomÏÜ¹]ßİ#«D1îåÌó›ÇÍZxšî%Úê²c¿JÏšÕ`8‘™~¨h‚Ö“„º@}b‡bn_ŸÄ’ÍF!òÉèÁºUí{ğx¹aSÿ\0aMÚU5úD°.^EÇ¨Ğ¹Ju[Ù\n)™°2IÅK¾Ê1q\nÉî\rfìŒp.âıGô©cÓd›ı\\Ğ·ĞÒ´I¹~}v7CäÀc~ÇŠ©ıµv¬÷dúí¨&±0ŸxAôİUÈô9¦’šŸÛs:îh£Ş3ÏJŸş…È°É…³šÆ]Ã¡\"¶ò9ÀxÉôÜ3CŠ›?ğ“ÈGÍiášÓÄ1O(ìâ¦Lå\\Ë©W1Ÿ¼;VÏ…tíû×¶3ˆ6§˜	Ï cõ¡Á1¼oáÏüƒ£o=h©ŸáÚ¶#Ô#Ûşé¢—²]Ã™búÓÕˆ<°¤ÇáA­4Ê_ã±§…˜ğ \Z¬–ó>6ÄÇ>‚•T£#u)+îÅ–\'h#®jŞ¹«O¬ß½Üä– “Ğ\n¡“°Ò´on‚­“ræg%õÇ”¥W\nY™º*’M9ìË]Iæ\n~VT<\\U8o\nî\nJ†l£Ş¶ì|S{l²m”otŠ0Ã‚t““LÑE4g]i·VŒx]I”ƒÆ«—”.ÒÌ¦k¨ÕõÛNe¼–XD* ac8İ“øgñ¤¿·Ğ›Lİeö‰®rä áTã\'Œió&\rÌB’d}»Uë}Rè²Æ;2:°<7{4FD¶–<s†ç¶~½¬¶·º¶$®à=TñFäÚÆ‰ƒí%Õu/e9©SQÓm.Ÿfg— f¬51™s8f€Õ¨u˜Ø­š¤·üÍ&€Öš-cPBn¥[HPNŞ>•U±ìøKÙ§TÍÌ.Ónæ¸?İNŸX†[—_ô;X¬ãÿ\0¯×ó4€¸nuI¡ù-:ÛÔü¼Ul‰i&¿¸>™üM2Smç~úy¯äşêd/çR4Ó*paÓ£‡.­$ì÷ë-› àÿ\0VAlÍ‹hf½”õgáj5h³æ$pßóÖàái³\\4‡kLÒî@6¨üibi˜/•sv±§xmÅD]`\0ÃpÍ1Ë~U\\É·vÅşÌCs~&™çc„Q¼÷o™0%•ÌÄÊå¦oï¹ÀÂ£©Ii3Ñ`PÖs˜ši\0\0õ­]2(VŞ91¼Œ’i7a™ÍèªÅ|…bÁ­ë;kp\n.[xõ¬íZP\"RHáÇó«‰¨@Şâ¥°D×CtL¸ã ĞeÍ€_îœRKÏİ	”}¡Gg&§¡Dº·6²»SÚseøEWÕ¿ãİş†­iàı†?÷ò¡ìI@‚ux€şé­)ÿ\0Õs×AFu˜ñÙMi\\¯îXûP÷„~YÏ¬¦®]PÕ},Û–õcV¯ˆÔu(§¢& |÷cRj6Ó¡fæşğëVtÈB[ãŞòÀH¢úÍo%RU~Ğˆq‡\"¢Y–ˆä’ØªÜ©®ŸL·ò¡éÉ=j\r^Â–Œõjùµ&ÆÓA•í,úTÑM;®ØæŠñGğJ>jI´[Ûtó­òËßoZ¬2âhD¬?‰~Wœı“\"[)ÇåVüÛÀŸ¼X¯ õš§çD«(òÆà`şˆóûë\'=Ç+L*¶80K%œıƒtÍY3j–ëó*^Gß½S->ÓçCôßN´–ïqiy%³r^”>í*èáÕ­$?–jÒÅ©Z®m¦[¨Ç@zÕi®$Æ/¬–eşúT1$DçO¿1î1 ’ê6wË¾µ18ã$S’Ñ¢f™{…?ÂNEV–òéÛëE™?¼1a³Ÿ÷–wFşîixê—VÃ¶Ù_ï§\"£6úv¤3‚7öàşUXßßÚ‚“Ä³Çıà*}:çæíŸØqLÅ55Çqªzâ«JÚmÀù„–Ò{ŒŠ­¡slä$ÆTìR]]Mxpc_ø\nÑ¨k™ìíÜ¬Ëp€|¿6qD> =ÔÖjX\\¿Hˆ­À«öZ—2Ìñ‚}9¤ùVá{5èn‰)j±ŸïwªC9Âç5ÓÁáûXDÛ¥Ë`ŒÖ‡öDOÙä6ê½x>µ›¯èK‘ÉA¦^Üò6r1WfĞïm ó\'VƒişuØAuk\r¼’É–²øT¯©M#TÈÊ¬úšŸ¬Ìyğô#š½¦İ,må9òÕŞE\\ÖìVf[…c,ëX{¹ÁàŠèRS‰L–ùz¬Š²ù£?{=k¡ğUÙµÕÎ;ã+ÇnEs@á\rZ¾\Z¹kmLJ‡æ\niÏH2e±éK{r¹êÇ=ph®}õUc™¢ŞøäâŠó=§©\'ì\rÔøU¤JU¹³¦Dd•Š•;GB2\roB€(X \nôS734|# ¬ím6jRœ˜ä+­·±‚uxÚù—Ú8¬oÙÃgmh±¨ÈÈ-OQÜ0®0Ç\"¢‹t¥ì½_0D„~Û°#>ÚÜÜ?–$>3—m£ó«?Ùr—6gşŞWüiífİb>¼ÓM„‡¡•Ğìeh¹kÛ`G¤¹şB˜.JôËP)­g*ÿ\0\rF`e?0\"&Ñ«k¯^ÂK%Û‡q‚Ã©Æ3ôşU©¦jZr#G&71$•$ôL}[¨è^şÒ¼ÆO—5¿¥xKû;PŠå®¼åL¥q“)[±§7sãKR.<é¡•¢]ß¹R3XWq,$mó0F~aŠõi”Èö®ÇCı&Ûİ?Îš¿Rºò;EÊ€	ïiÆ@pfiflıÒp)®v¤}²3À÷Å44lGâ(±%¯·qåî[dî cøÔ{ÂË\ZÇèÓÇò¨¾Ï!]Ñ‚À÷%Ôh°Êìÿ\0¼}ÒïÊp?M2ïÂŒ¹ì«Âÿ\0õé°Ãç2yÀöÏ56øa	\rÉÍ!“Ãa3/ï…?º½MM¥*Ç<Ã\0í#ëK=ÌdgÏ_Î©ÛH\rÔŸ½\n“K[¥~àÂê;ƒL°lZÇƒÚª\\ºà2œZØ“l«Ùæ•´Éµ\"\\ój0Û@…A¼“ÉÍJ\r&Pô|çµoBo*öXÏİ`jì)ğÉ¶@wm=3H“_U Û¶cW¬6ÿ\0¦`~•‰|»mÎ.U²:f­é¸k‰ºXş^„ô¥m\0’?¶—ˆkJù‡Øô¬+a»X\nf\\l\'vjõòíˆºV8éš}@½¢àXƒêMK}k;Eİ5‚·±ç<K©y‘@Ò	–@HÍ. iÚcÉÏcQê,ÜŠ‚Æ)Ö)<õRênzfªkm¼^a™d\0ëÍp6ì—)ÏQš¯©ÜóN·‚o)s2·¦k;SóÒæİL« w\n0i-ÀŞvÆ+3XÓí®”+±ûÃ­Yò§UpÏ¦k6yg\ZÄPRÌ§¿Jp)İè×–ñnÚ.âŞëT•âQ¶šŞ)ÆWó®¹áºØš>µÏÛXR)Æ «¸¦­KMDQh¼ŒI$2Áé4+KçÉqÃ,7€w,•%Æ•ªéÑ4±î1NÓÓê* 9Ğ<–À?ia;Oâ)ˆ–&Uoô[¦…¿ç”İ(Púm¦ÓÚXªÒÈJ¸¶áÏéVm´Û–ˆ‚ŞT}÷ŸéNà3íS@·ºócşëõ¨n]n9ˆß¹­jØi–®øy½ÈÚ+LY[%“‡?fde\0#óëPç\'#•HWošvúâ­YYGp™³·’f™£ÃÚ¤qÏ“cœ×eoia°›xv£r}ı*jÕåvDJEM7Ã³¬D‘™~v\0­Z‚Ş×MšHÚ8ÎeëWnn¢·´O*R¤pUGõ5™p7Dl©Ë|çŸş½rûI=»|¶¡0¬áºãb£†hm\"Ü\07ŞVÉçĞR\\B|²D„c«CmË+¬\"à‚pGÒ®É­K²-³/óË!ÜrËëŸÒ÷×Æ2w#/ßŠÎRD¸qÁnŸJ–Öcˆß÷ˆ½@½hin&j[Í¥¹&0»úw$Jt×\r:Æp‰Â®ãŞ³¦hâ“qİ°ôG>µ VŠRÑË\n…9aÈÈ¶¤ì^ŠØJÎUÉÚ™ÆslöúW?­éÎÓ4°ÆU€åvàŸ|VÏá~Í.#?ypsùTÆK„-“Æ~´ãQÆZÎN&Éç­hèàô€0rMP¿ŒÛê-ã†§Ó\ZO·&ÎO×İ\'x6c±â?–HÕÛ×qÿ\0\n*¼O–	·g\'œàÑ^U´9mœÙNß•tQs\\›!Û`Ë‘Úº«rZ%9ÎkÓFÉèhXu5ãõ6¿ï\ZÙ±áš±¼oşªÛêkHî&r,xüj>_ùèßiiºlÚ¥ÏÙ­Ê†Ú[æ=…g\\Gåœ`ƒi¶O´Kÿ\0=ó­M!™Õ÷Ø=ëu­İ~êCşÕKØksF8IëVRÚ3ÕAúŠU„©H«š:2„-jÙäV6vîü*òÉÅo¡\r–²+†ñÏ76ßîŸç]{K\\w›3Ûºhåq\r¿û§ùšÎÚ)\"RË“QÜàÅ?Áıjîš¹€sÜÔ4:j¹\nŒÑ/Rz‹Zµ´†w´(¹\"¶l/jÁñHÆ¢¿î\nVl«èSY‹5åc9şIakm.æ¹¹X€è;š[M6æî#$`m\'Ó.ôé­JïÚwtÃf‹ÍkmÎåÎò(8Èõ©‡ ù’b«iš©ÓliÉ<øUk½Nîë\"IÓü#Q¯r®»½´Ó­Á	3Êş€ñTÔàRQ‘@‡¯ıÕaëK¸zĞ»¨qK¸zÒ°¬¾vvƒÉ^¸­È4Má¿q¨M´ã†\0\ZçƒŞ®\rL“kF&®uPx6ÖeÜ/$ÇlK‚c`Ì×dàéÏ×šÉÓüCwd¬‚DÂÕ§±§]Ë›…11õäPÛ%èE/ƒ.•ˆ†_70@ÏëSâå—+óî+Ãzu­T³µ•ALH§¡SR¦›ÎcÅ+³>cœ	Ü©!YÎeÿ\0\ZX<!u4‚9%òÜÌ1]*éÏ:˜i¶ÃşYĞäÊç9¿øC®~@·D³NF\0úæ¡o^mSæHX™ã]YÓm‰ÿ\0WÛÖºe·üóñ¥yÌr#ÂZ‘,7K…é‚9ıiO„/7®	ÇR ú×Yı—kıßÖ—û6ĞøÓæaÌrrøKPU’á‰ê1Óõª\Z†ƒ¨éöæeùk÷»b»£¦Àzäş4*Ô»õæ…1ócaw¨ÚK,73·”¹u‡¿5cÃÚ9ÔRIsH±œp	N+CÄ>“Of½Óóå‘ó(ê?úÕ/‚lã¹µ¸g!ÀàûU·hİ‘bßNÔm×ä°Â7,\\ŠŠãM¿fe”Ê\0ÉÊ`çë]öd8ÇÍ­\'öd#ûØÿ\0z³l\\ÈÇ{]IV9<–b#e6ø^KlêñK¹ÆOîğ+di–Äÿ\0æi&Ó ò›ïtõ5**átpš#µ8ˆİHùz×_bÿ\0e•ÇÙLƒ<Æã\\¦…—ZŠ3œ=?\Zî?³¡é—ÿ\0¾:ĞRb“Ô­=­Ô‡Ïyaˆ1Ë¤`z}j\'”b@6µKEhfCÓ-ùÑı™à3ãÙ«5JÂZ¤ióî·™gW1‰\níô§f«!º‚p£;Š‘ùæµ?³c$ûèÑıœ¹ÿ\0[/ıôjùGÌŒ2‰!ŒİŠã&¡µi ¹ó\Z%Ã¤ÅtŸÙàtšQÛï\ZCaÁ_>lÛÍ2f\rÜÄ¸‡Ìb1Ğ¨8öÏ¥‹-°\"#sšİOÌûÆ‡³lÇÌ§ÛuKÅtT‚{BZ?”}Ö_ñª†æyí¼¨ÈİƒÁEj-œ 0[—ºĞĞÖI&bIîTéR©+ÜWG~¥57VHíSé­‹¥àçÚz#µ\"ç>õ6‰ŸP>‡ ÕÙorÅ=¦oPµŒC·Ø½7u¢¥NƒjÜ¶Ãì‘ÂéºíBö®¢ĞB8b+šğË¥²œp¹ú×W€sÜ×jGInĞà“X¾6ÿ\0SnÚ5µiüDÖ/¿ãŞßıãüª–âe\\G®ZYjaa’qÍaj-w+’K’¶i’œ!úÕfbİO4ŞãB£ë]‡ÿ\0ÔÉşğşUÏµĞèê¥ÿ\0{úPöi9©Ò Š§N´€»lqº§Wæ©Âp\rHÍZ\'v®SÆ3[ı\rtÎÜW+âÓ™`úéT#c˜¢ÿ\0tÿ\03]™§Gö›Ì?2ç¥s’ÿ\0«èušSÄºÜ²+;h òplÕWKşàLÒ8Æ\0­Õ5Ÿ3.Å+KacnĞ£·dõíş™©Â«(“’[®MmJsYZ˜ûôù˜¬bÜe\\ã¥A½½jÅÙù±Úªf­\'˜~´Èç)™¥QÍ$zpÀÁn}¨QùÓğ\0ç­\0+˜™\0HÈlòsQàûS»t¥ëHcAãd÷¥éŞ“hÍĞ ,Gz’Ü–“Ò¢aÖ¥µû§ëMìÎ4¶’‰‘³Ûié[ƒYº?Ã>ÇükÈ~ä}jÚ.+ØùSÜÕY»mò4ÿ\0í›£Ú?Ê³€ÀÍH Ÿ­MØr¢ÿ\0öÅÑìŸ•<j÷YéåTñR(íF¢åEÑª]±ùTöº…Ì³¢¶İ¤óYÀV¬x¹L3OQ8« Râš4¥ªÎbD°\\×#ü«Ÿğüyİ×Qü«P?è7îå\\ÿ\0€¸¶»ÿ\0®ƒùUı‘ô:†ŒsM\'4ìäTM—ıKı\r(¦ÎG’ÿ\0CMçŞ?ñPÅşùşµè=+Ï<?ÿ\0#ïŸë^…Öœ·.[Š4\ZEëJO5$\\\\ĞzRFj€:ÑÒæh1šJZ(½ésÅép1@{âùÉRøgşBñ}ò¨¼Qÿ\0!ù?Ïj—Ãò‹ñşU¬¶5	İqE/V&\'™xGæ½e®Ê1Ò¸ß‚/¤Èş\níaµ©ØX·êkÆÿ\0ñëoşùşU»°üoÿ\00úkı([‰ìqÒ«5TU¦û†ªÓcB£ë]€~IŞÏ\nè<>u!õj\0ÛCS©ªêjU8a_¥Fæ£=èFù4Ìp:×5âƒ–ƒñ®…ÛŠç<Lrbüj„d¿Üèu:yÙi\Zú/Zå\\ü©]=©ÿ\0GAíYHqÜ´[Šfêin´ÒxëPh)9¬íIY‚Å\\fÇz¯9â¥è†•İ~÷‰qEVlövú	šrB’CPyÿ\0ç™ªO@pÔƒšUÎzT¢9zyf›²PyZw(åÔ€|¼dšXğ?ctÅMÊå»£2g¥?\r” IéEÃ”Œ†ì)¤0íSì“)2ú~´s*!$úT¶£;†9ëIäJ†¬XBÈÍ¼c\"‡-GSZÁO¤¥[\\cRÖmÀÆªÄ\'Ş#µYCÏ^½*lI:`ãô©Ó½Aäƒ§NÇ4X›“`c4t4ƒ¯‘Á¢Áqëôâ­YÇÂ`t5YH\"­Zß§XOc_8¤\'½!ö¦“Lã~Ğgçøò®Àçıçıñü«vı¿Ğ§ÿ\0pÿ\0*ç¼Ø†çıáUĞ®‡R5\"*°<ÔÊÜP@âj9îŸèiIÍE7ú¶ÿ\0tÒC8Oÿ\0È~÷Ïõ¯@Íyÿ\0‡¿ä;ÿ\0hÿ\0*ï³Í9n9n=OÍJÔÅ§“A#rE&h 	-0\Zvî(¦ƒÒ‚rE.(ÚqéH)İ¨ÎüQÿ\0!ù*OŸøœEô?Ê£ñG:ô¿J“Âÿ\0ò‹è•i-_Âw”RQY˜œ‡@gıÚêbÇøJYùƒœüµØ¯±ÖÉ£ûß…aøÜ Aÿ\0]?¥oA÷¿\nÄñ°Î›ÿ\0¦¿ĞÒê~éª¦­†©¦€@+ Ğîıêçêõ…Ì–ã({ò=hÕ¡©TÖ Õ$*@P±øuIU>u}zRo<S¾cY°j¬é)tQ´\r£Öª>¡1.ùX~TîåÍÜ0ŞHkÄ,S’3Uåvp7qU®¶ÜöâÄ_Òla¼b³nÂ€x5ĞEg\Z®lV/‡ãáÇªë]\Z\ZÂMÜÑ\"1e:µÂ.¹oÎ¬”¸â¦ì¢™°ƒ?ÅùÕkû8á‡rœó“Zª§ÿ\0Ür)n5¡‹,9‘úÔ-NŸXub6À9õ!$‘Û­\n®y5´‰\0~tÃjÇ$Ï½ZWç8Å5ò¼…Å;!s²§‘\"°éŸ­Iå7)ÊrzsNûÙ\0àæŸ*y”¢1S¨¡”äx¥Ê…ÎÈ„\'¯õ£aÎ1úÔä…&¡qüCŸÇ¥5ö¬O-€ã¿½?kqúĞ<f¤ÇG*y­-#Xáó¿ŞÁëV´>Œ?\Zu²æİzS…ÊĞf@-£İ‘œıißgQÓv~µ(RH¥qï@†,Kß?Iå©89æœbœ£EP°¢ôÍKQÃF(‚¤Aš\0×C•Ò¢VÂ¨ö¤–l!Áä*NYnG|ZO•?pöö¬ä\\Œñ¼qøUÛGQ[y#ie(Tƒ×¬O\rjVi/ÙÂ²³î@Üş5]âÎË4¡«&-SPÜYí¡ã‘ò‘ZJd )ôN\r$Ùò[ıÓMĞç÷ºi-Ê[œ?‡¿ä;ûÇù\Zï\rpÿ\0ä_Süw æœ·÷šx&£Í(4?½—4”\0w§v¦Œf1@\r§\nLK‘@ÃŠ\\Òi1@{â~uéj_øœEô?Ê¢ñ?ü‡¥©¼0?âoö5rØÕü\'sE74Tuàÿ\0ù¿û•ÚÒ¸?üLş¨k·İÓ²:Ùb¿X3ÿ\0b{L?‘­xXnïXŞ0?ñ*úJ?­.¢8ÃĞÕFûÆ­çƒVaÒÊ$$€yëC\Z2ªå²¶Î‡­]şÉ…fV\'=?!zô†B±Hz\n™`rp>´y„— úÒ33/^sC¬¡Içšh=érsH½itÜ&G\\UgŒzšµ*’„(íP¸\"%sšÇĞÑğñÅÓöthkœĞ†.3şÎ+uj%¸ÑpSâ¡WíÃ*ãóTunmÀ0«A½ê–¬ÃÈOMı¾†„€Ï`ÊAàŠcéŒÑ3ír*(sÁæ¬A<¡L\Zqpê?_zãT±ü9€Øv¥`¯Á)£9ãŞ˜:‚56Ğy\"˜Ô\0?\ZU>ôP	Ï4Á¢’N*=…CSíQ»ĞUb\0rOãRË>´‘`°ÅH6IéíR;› ›hÆ{\n˜Š†Ûş=£ö(9ş*?9Ö€3Öš0Önô\0ñ‘Ú=*.G<óR€Ğ!ê0jD¨Ç­H‡¿½U€’â`¹V<`f«›µŒô®ïG±‚]6{x‘Õ—$Õ¯ì‹semúä(±“‰æŒòİ[\\˜²¢ì:\\æ”á`q’ÃÒ½šãÃöfÚâ+x’ÛÎ¼Ø£æú×à¿\nÛê–·sÜNË¸1´ÀãNÚ–ÈÄk˜Ş\'\\ÉÓ§»£ŞlµsıåÍtğ†ihI71äuùE2?\ré‘°Ù>à{ªãœä¢KFt²’w|¼óòŒ\nl³£Éşé­OÃ«q8û=ÓŒ/LY×Ú$°£íŸv ô¨ö‘µ8Ïk1Ÿsü«¶2zãü9i%Î¼Ç\"ÆÀ·ÌŞÕİÿ\0Â=9L˜G¥Tê$õ	-JÁ¥YGz±Œ‘“›¢q¥·Ñ¤PÒ4â@ÜsXûxô\"Ä>`Í\'œOŠÉ3fåJ7EêGãR¿‡–\\Ÿ>@cŒf©ÕˆÚ)ùÂ—Îç(ğÜAÎºiû®Fß¥Lt8Â/—,€ùÉıi{h“b°|ÓLzç:é\rÙºÏ¾ÚaÑ®ØœÜ€‡¡Ç4ı´JæÇŠÜSâĞ¥_½w“›x¨›EÔ‘şIá‘=Å5Z p~!múÜ¦¬xhíÕPû\Z­­Á%¾³,n\0`zV<?o=Î ±Á÷€&·”•®hö;O7ÚŠ-v@Zõ3ßå¢²ö‘îO)æ:T\rm?›àØÆq[K¨]Ì™?J¯2F3Pî}Ì9ÅossM5+‘È#ùU-n{«0É!R‡ëPŒàä{bªß»\"	8ëÆØ«ĞÖœ2³ œY‰×ëZVëû…†”6\\täÕgÃ=êuè¼O5	B[¡¡N@ã¥8Œãµ<!=A§„$ğ(°lÏZUY1íRÅlsÓ4¨­2xp£ëZËmëŠmÕ¾cè@Ê¶1HƒÌ^jĞˆ\\³\00Iã­xjëSŠ3\Z…$3‚»İÃv\ZXK7÷Ø!HG†uùQ]m\0dnàÿ\0:‘¼1â3öXğ?Úã^‹©jVºd[™Ã¹®Ä^\'ºÔ÷E	0ÛtÚ:·ÔÒ°ÍÄ·‘ÊËº0AÇÕKƒy0\0ÉÎ1Wf˜V‹ÏxnXrËùTKo:œ†QøV™JO.€3Œ3ã_Ê“É¹õZÑÙíFÏj`eˆ.Cgå©€ºï¶®ìö£gµ (m¹ÎNÚpYÆx\\\Z¼zRì”¤<şcüè+9 í_Î¯…(UÀ¡¶ùä¿÷ÕHrÿ\0Ë0GÖ®€´¡V\rŞÄ\nb<zT†éJàFLià-\09nxïùT‚äuÁÏÒ£ÂR´À˜]ät5\'Új¸#Ò¤})ØD¢çpæ2?\ZzÜŞ>µÛOQ`7m5ë¸ X–b¡GJ±ÿ\0	éÿ\0—†ü…s¡ñNb´Ğ“z]oP‘EÛŒtˆŞHîâ8ämÌªÜH³úSÄşÔh(O¤]#y–·&AîØ5]õZÑşy¦»nèkgÎJÄ«µÂÈ¾Œ+)PŒŒÜø<WªÂr%2½*iü_y4/æGR3·¦Ï¤Ã8Ì$D}JÊ¿ÓnmP“äÁù—µcì,+Iü;©6«-ÒÆ²Ã{×y§øÂ	ˆ¨äW›ZŒJ5yIÎCíJ­$İÂM§¡êÖ·vW;ZY2:f¤sé•å©u\"r¬ÊŞ£ƒWm5­B¹ivnErºO )ùùš1œuõÅ;ÎekL× »o-ÂÀş…¸?kõ@¹#ó•¥Ôz±ñN¬2F?Ò›<zÓ2ÍÑ\nRì3ÇoJa\"ÀpÃæ?Jix”uª¾s/ü³cîâ•Füí©ê;\\œÍ8l\\u KÎ3‘M†q•Æ8lUä´ºO´ŸQME±ò3È|VÛüGrpG=ëWáâ×ø\\âÏæ+?Æ1y~&¹RÁ¹ê*çä2{şìÿ\01]³Ò3Ó\Zke8f9úQU6îÑ\\—ò+˜òg?—Ja}9¨|ï¹Ÿ^iYË>µéXfùO½VºRm“ôNAaÉ¨nSÏô v)é¶Æòúe`¦W\n	è3[vÙ÷/kæoØqœc5—¤N¶Ú¬ï÷c‘XşºZH¯õnmÉ1¹à‘ŠDÍ3Ò¤TÎ*ÄVùé’~•j;3üDcĞR/B’Ãêjx­›û¸úÖŒVª¿tcŞ§K\\šd6g%¯®MZŠØwSøVö™áû›ì2 TÎ•ÓéŞ²µ\nÒƒ4€sŸ»ùP9]3Ã“_VTşû\nÜ>±x6´Ò	8;‡jéşU^À\nÆÔ¼IkhZ8} ã‚‰t­:=Å¢û@1çvçÅej~-13EfŠüq!ÿ\0\nÂÔµ[»æıô¤Ê8ğ¬Ö8 bß\\Íw1–âVv=Éªe9éS±Í&>´]zSvJµ³ŠA\0VÚ½Å7`ì*ç”=(òı¨§”=)<¯j·åšP”KËö¤òùéW¼¡Í\'•ïÂ€)ù~Ôlö«¾_½ €Ÿz\0§³=¨g¨«¦v4ydv4SÉ¾WµZ)Ï¨é@D#Òœ!•kfzQ°Š\0¬!”yCÒ­mö£gµ0+ˆ½ªAµL—Ë ‚R„«F:PãØRíúT¥=(ÚE0#\0ûSñOÚ”jw¡sŞ—o¡ì{S‚ı)ÜCŸZYaó x|ÒtÍI´Rô¦L‚6É•›¥2çA•y·IşÉàÖà\'¾*T+ß¥KŠd¸¦q³[Ím™JŸB)™ œqøWk,1\\.Ù€‘}5—{ Æçu´†2:«wükRìfáØÀV#·5¡a­_ÙÇ½ÓÆ½×wğ¨®tË»l—ˆ”şòÕm½:Ö\rª:[oÜ§úø#”g“œ\ZÕµñ”ás!‰³Èoñ®·CùÓ—Ã~u»=bÊşÉ\rüDæ‰Lç-“şÉàW—Aw-»fZ3ìzÖİ·‰åÜ¢æ2Wí85/˜ÑT:é£ò†RCçuTmÍ1Ä¤zuÅSµñœã•$ã¶\"xe&/¶*Z¹NÌò†şßºÜÛîµ±ğüíÕä?ôÄÿ\0GQY>&1Ÿİ.ãÖµ|3«I×ıWcâºª|\0ÎøÆ¬sÔÑR}6çæ¢¹l;2ç¦)á=éê¥½êUAzôlm{ôâ’âöy	şé«‘[È}\0©¥µìòq“´Ó±G+\nüâº}6Ø5ºÏµsĞÇóŠìt¸Ñ™(rCƒf(sÚ®ØéÓİ ‰Ÿp:WM¥xr(‚Ks–nñ1@í†‘uwƒ$®pO¥u\Z‡-m¾yÀ™ózZğÃ	¶$T_E¥’E¹@É&\0ƒVûQ·²Be›²¦²õe ú±Ê¹é‹1É=I§`,êz½Åé#qHÿ\0¸§ŠÉ¥Ni¤\n\0­´ÒÁŞ¬â‚´X.Tò…!ŒzUÍ´Í Ò°\\­°Rìö«,ÒyL=(°\\ƒe(Œšœ£zÊ©ÜÑaÜª ¥û6jĞ^zR\0¢Â*}˜\n\r¸«€zş´»s@Ê_gã¢t5pEíÅÃA=jŞÁI°Q`*y\0Rˆ[)¯‚¼º<±S÷§c½\0WòéD>õ`KŠ`Wûšp‹ëS~\"—šCåûQ³Ú§#­*ıA \nâÓÄUdQOÛíL\n~X=èò}êÖÀhÙõ \nŞG½8CV|º\\ÔÄVòM;É«\0J6ûU_É¥Ø=\rYôÒ9ö Bz•@î\rOj\\Síªz½ª­Ö“ip>x‚·f^\rYíR+cŞ”Zäœåîƒ\"&m¥Yqü-Á¬¹í¦ƒıtRGøq]Îö¤hbpU£§¨#5‹¤™<¨àãôåàıì~k§½Ğl¦ËÌ}:~U•s¢İÛ¨Ø¢@:äÖn“\'•™¡™zSCy42õÆVÉFÊ·pj2À1¬ÜBÆmÜÒM}$’6æ$äúÖ÷‚o-­5	\Zä°0ú×9)ÿ\0Ho­[Ófòæ\'Ú´œoW±ël·<‰âÇûÔWœyÉéErò2yˆa·•±¿\0}*äVÀ>´è®­LA¼À0~aÜV¥´vsD²}¤®FpW‘^…Ñ¥îQX€¥•…Ç¨5®––N.ÉÏL\'ÿ\0^´,ü7\rÉ`ÓÊƒLf‹ <ÒŞØ“Ó¥z_‡¼=ö‹hfiEİ{šËj19ˆ_èõÒho«iÖßg›O\0zÆüŠW\Z7­¬ííAB±ç®;ÕŠË“\\Š›[ˆIõük3PñÈÅ-–§©¡ 6/õX-\0‡“û ôú×5©MväÈØ”tPÊçq4ÂÀÕXWH4ÂsÒ—˜?…;n(Å(ãµñLbb¦Ÿj0jl0)»y©B“NŠ,aI£mK·Š6ó@íæ”D{ŸÊ§—m\0CåĞa’ ş0\\Râ€ –\0ëGĞâ•`\n:“õ©ñK¶ì…j˜ŒRaHvQ³µ0R{R Jú\Z@œTÀRìÉé@ì…G¥O³(òI \nåG¡£ÜUŸ$QåÔ\\(¥òÆ{Õ€Ô»s@‚ã½;Ê8ãcg­M\0W\'b*A»½<)Í/áL…ü(Áõ§v¤Ï=\rQŠwJ\\f€h¾)Hê1LC°¤\rÏ8©Å¦æ“&)p\r\0EÎ8¦àø©vÒÅŒÄ£¤€ıiáz1F¦;¨H1ëUöĞñ@8èq@„¸µµ˜Ÿ2$÷Ûık\ZûÃÑ¶M´Û}Çõ­İÍŠ¯4r•l}i8¦œÏEu$mŒ©Ç>	–Gê}CK½‚êId„”cÃ/Jv›gsæ¶#eÏ¨Åg(«cÚŞe8òZ*ëZ_©ÀYqşËqEcÊˆ÷NYL{•¡¤Îír±4­<9©4ı\Z[ùöÂ^½‡Ö»ı#ÃÖ\Zjmòá2†˜““ŸJ‰M$+Òa†Òå~Ê®Ç-*uğ{j¹ı¤Ñ´ŠXŒ²íÀüMH¢!zŸS“¥1§?*‚İ9W©.áÍbC¨2*³ïzc±¬ßër- [yB°Ç*ıÿ\0­[`²+†PÏq\\¦­¡Ü 2[Ên¨ÅU9İê.f6_ßÏƒu6ò·J…õ™@¼uõ5åI–V:Rµ´¶»ŸÂ»9»ÌÍH5¢¨C\rÍØšrë3Ñ~µZÚÚÙ“/ v«±Ed«’€â­\\¥rhõ`TŒşt‡Y\\Ÿİñõ¨.!†ï3aQÿ\0e:Í(ÛŒ“Š»°w-]qòÆh‹T$ù•5Ÿöuè¬Xç‚O•æ|ÆCŒw®ÃRáÖà\0a[ò©!Ô ™‚¨9=3Ågÿ\0eÈ <g•vËN—!¿†„ÙJå¡x¹#j>İò§íP9ÀÅ6[}àá±Å^¥öè‡4ã}\nŒ°\"«E§íÎù‹z{TãOb[ÜÒË¨[I#ğ§}¾ÄŸÂ”Ú.#\0t¨Ú“ø‚Ÿz`<ê6Ë÷›QQlÚnÛ¸õëŠ†].ÛÌv9ö¦.ÎŞcŸSH+ªÚ°$íNşÓ´\'hüj¢ÙéòaTô=9ú,M.aÊƒÔEØzo5X!ÁIõšzkVMLÁO¦+ïKòp–Z¤¶’;œÔ94ÌÛgN5KSe˜dbŸ¡À•\\‹Ã³ “Ç\\\nX‹!8ôsw\Z—s°QÊ\ZD¿…²C:×6Óayn£µGmw°íAõ§ÌUÑÕı¶ıåüéô\'8`~†¹Ğó;r¸ö:¤¡p¤n=3O˜fÑ¿zÔkvãt€dàUO\"F·NzÍÔ4ğÔÈê	¡°fÀñ™`¡¹úTW$…2\"\\ã¹â¹³,0Á³ßµ7i`sÎ=j\\Œœ™Ô/‰à#˜ÎG½J\"µ~ÅO¡®EaËs‘ô«‘im2eXŠJLi³zÃÀŒÈÎiã_†px¬h|;9ûÓ?\ZYô+Øá|Ï÷jîÇvkBó¥/ü$0œ•è+št‘X‰«tÆ9§ÅhÄÚ4¹˜¹Ù<J¸Œ0šoü$ı1±~È¥‚sÜ\n`¶\'Œcä\n\\Ìz›ğø™Èe}jáÖTÂd”‘Û½rÏfÂ!\"³m÷¤HS8İƒÔi©0½†ß[¹gÃìÇåL›Äl&\n#%GSë\\ñpK032qŒ;“Š\\ÌMö:â·•Š¬a}Z¯sâ+¦JSÓ²Ë¹XdœhuóœœçÕ<Ì›³£_’ù\0¹÷À¦ÏâYBå!\\ú\ZçåBÄÁ$Òàã§¯Ú1İ—g×/\ZS7˜Ëè t¥^¼P?zHïÒ¨ù¾ä€nëJ-™C\02 ò}is±f×¯[vePlS!ÖnÉÚ²‰Ú}+5íşuÚ­Ï\\w¥òÎáˆö~é£†¦‡ö® `Ïªì>\"b¾Y=±–ëšÆd•8läŒŠÚéI$ëºh+š0jÓE1IŸU5©ˆ €4D±ôé\\Ñ´@Òn\'ƒO)0‹æˆ))»\\ÙŸ[I,¹¢°ƒ>?Ô¯åEì/#ĞÄ*¡•\nÆ	Ë‚¸ÉõÀ5(\\¿úÒxÆ	ÿ\08¨í”I Şƒh<–Î?J¿ÌÌfŒ„Wôï^OÅ«÷m1aÎÑ‚H<K+¨ncfì9¡f`Ã‘Tu>Õ7\nÓl\'Ël|ËéøÓµŠå[!Í FFx©mìÖb›p@\0íÇ…Fíæ°3åú±cíÄ¸Tí¼U&º‚ŠêFö*.ù*¬OW§¯5RëEÓnMÌêùÁ\0GåWå¹W#t¸lu5õb‘ù‚W<m#îÕs[`hÉ>‚cˆÉŒ3Iƒ6îßx«“…]	µ¹u`G“âÇQREa?–XöÏó´e-lsgÂW0JEdÇ Á4]hÚ—#ì²ä02+¯·’4e@Û‡±Z\'•ùy=«¦AØóŸì}A9{YTÅ(·š&ÇÙ&8?.k¼q2€J)ÆI¡<×?(òÇîõ§ÌÇc‹X$u;\"|çû¦¤Wa2m%ıÓ]Ğ¦¶{\Z»ÀMŞIPÀĞ­B>ß/îàµfsßi®Î{Öóö˜Ñè:ÕËrŞN@Ç±ÅgÏwd8È´mN@Ö€r[:eâ‘ºÉçé]=Â±F)»psÁ¬YŸP’¬X2¹ö¢U9BÅXt›ÇÉX[“œ“Š¯uá«™Ü¶\'Ã\nét©¦kqöƒó^ÕtÈ\nA5jWAc“:MÄQm[Yr:`f¡:-ÜÄ³À~QÆMv¢¢*w’[¯AClì\Z‹KˆãR3Ò¥].ç¦o-ºÚºë¹1áq‡R+*[šmË1Ç÷I?­sNrZ!YØÅ\ZdÅÊœJŒ:ƒÎsQ¾’Öó4‹8äƒ]5šÅh#ŒõÇ4Ëƒmòâl¿l÷£VÔi[sœ[1òc=ùä\Z£u¥G³˜Š±èTq]Yûu>fY¹ñR,13¹bOn‚—¶{G\\irÆ7&¿¦:ÓMiX™n?½ı+Ñ%ŠÎ%Ù:@ãuªñ}‹–ŠÓÂGlÓuR3åÔäÛK\'…‘—HNTºG1¬™=óÚ»i~Å2 U¸ÍR–ÖùÖÄsëVëD±ÆÌ·ˆÙ’BA9?Ê¬À#ò|×óK¸8ãƒßƒÖºÄ±µVO.ÈHÀp{æ¥ò!+å48ç;k?kØ—~‡kv.Œx,x?/\'¦jÓnÛ»?7 ‘Î+ĞRÕ¦—î°Ç¶òjiôË¿?ïT\0íIÍ½‰³g“xäEå¶OÌ1íVeÒï-Ùî{ò?/µvbÂ]À˜ü°HÀ8«YI) Ïu\'\"ÔÆãR´*~o)ÎM^·¼•™ HL‡âºµ³-\\«K¸€@ZQAyÄ÷;k¢f‰hğğh–sg$n‡w\"³®l5 Î°A,d{Ö½a8\'éQ][yÄê?ZmÊÀÒèyºèwòDò¸IÁAÄT2i²Z’{¦kĞ%¶¹ŠP¡K£»M{K 9U*OBk.iuBŠg›L»ó¹eÜB8¥µÓînæòV	#8$6ÓÍz+XŸ5¬yş#*\"Ñ!1¬x\'€IÇò¢S`Ö‡Ş\Z˜²*ÌˆÉVÎTTÃÂ“·İ–\"@àîëşÕŸ/îí$\09<æ›¶(åi<Ñ–A…e\0V~Õ™XğåÑfU†BÊqÊàíRÁá›”`n6ªÆ»„+;)cã¨=ªÄpŸ)(ÁÍ;¶S8õğı«fD\rÓ¨ÆG¾;Ôøn0NeópsÆ;×bm­ï›*ÛH;i`Q\Zchb}9ÍJºê5Lå×@‚$îÚpÔÕ–³µù/n¦6î£ƒõ­Ë‹fsÏ?áU|¦F\0H\nóÇqRÓ½Ã’Å+]Â²Cã\Z¬\r.\'lÜÀ¤·^Än•zÀ@Û>aŠ³æÄçÊS‚½…4ËŒQšfp,âf<Ñœı=êk]\"Ğ~ñ-¾÷ı*ü±`±Y§ Çò¨­A¶Ò{šaìÒ3æÒ­•¼¿³E´rS¿²¬åòF®+Zî=Ä1˜AŞ©g8*ÊH9úSz¬Aÿ\0î›ü1Å¥+7ÌJ Áç­\\­as$Œ»L}pCµ<`7œJ²·P8¨áx™‹3	H<GËşx­Õ#)Fäòp3ı:×Rês/1mXìÌk”Á9$ñôõ§l‰•a¹#½X·¿šKuÀòÕAn¤~*»¤PÅ–ˆ3œüÃ®O·z×Khl0¬0¢XëÔRFwË¶e‚Çõ]~Ô\\îƒÉ céL>x;—\n:‘Y6û´Ë·FI-ŒtÎy¨a„BÆDf<÷ííšAs cG¼}E!€å@ìzÑru/ÁtÒæ(Û÷ÈéZ÷\r¹#x•ˆèq“X\rj0dV1•ÆwUû[‰QˆvÚ\0ùG©ïÍmNMniw:,ü¤Ï¥C¾}¥¾Lvªq^FîG\'Ô\Z˜2ÅT¼ãÙÍ}Š!ûeÎ•ÛÎGZ»¬P×Ò©¾âß;ä‹OÜ¥L’1Æ\0¤›@]î Í(@¹Çz¦¾Y\nc,;ÕÄpËœşu¢wÜy	“zç4‰4{Œ`œZ“ÌBÌúÕ¹F\n¡vœg\ZM¤‰±*şÕWìÊî}Œzu÷¡§¶H*{´Ö1Í\ZF79Æ8ÍfİÆL-£™HÇZ|!NX×Ö«Û†Fù†TÔTÿ\0j,q\Zt÷Å5`,í( \'AÚn9Ê”¡òG_ÒœHÇZ×F#&ïO’iË,ädqá5Y’DM¾alã\'ÔûVŒ—1G1#°ëŠkI¹8R¤w®i$;™RİsÂ‘Àäzô¡V…8×¡­;«@KUçÚ²îü×BPeĞğ@ëXÉ8½LİĞ$.YGËÜtÅ[´¶àí\\.{UñB´½zò9«ë4€\"íàtÁÁ¥–ábûÄKÛæéQE¢TH—?)°#ëZæF›qÖ§(Ş™†\0ä­TTÅ#m.ùbÜƒ‘ƒjÚ$’/ïşV=ÏAZó!)·òª·Ì¯œs”œl\rZX¬àüí´c‰.°MË\ní3Wgq3k÷NETW…§ÜbLñøô¬ç+éq6Í->ú+¤\nT®OŠÒm¨9ñÏ=+&ÈÆ§\nbëœf´|òÌPZŞœ´)ó1—\0ªó•§Æ ewdu£[Y‚vğ9Å@LÊåŠn\Z¶íĞ«m§e\0b	à¿•,“´-ÊÈ©äTPÏ.Ó aÉÀÍ-ÅØØ¥¾éàŠ´ÜE…¹I6À¹œnWƒÏ§jÏ2BeÛ\0oÈT“¤˜è1úÑÎÊ²-µÀLœ’¥\rv€r9ÇJÊ*@2\0O\\æ”;1HÈ;ÿ\0¥O´bh¼×ÊF0EA;G\"¶åR§Œ7ëUDlÒŒ\r«œuëV\Z„’ÛˆÎĞ*y›YÚ’6–Ær3ÚœÚdLÁÁÜsúÕMîH mbÄ|Ç8ÇãA¼™bÌ+·\'×p4]_R[H¸- ‚Fe<‘ŒcTÓ,ª–É†³Öq+r®zâ­­Áãæ:óB’\Zw)½¸YşRÜw\'“ÿ\0Ö§5ÁV2$yã8©±•Á?SÓEˆ²ä—\réëRôØ½¶ÓM\"®Aİp\r%ÂI½Bğ¸ä*4V„‰,ªŒ€3QÛı¨ÊĞ°m™Ê±Š—©œ¹¶åå‰Ö5eu9Ê¹In»Kå¦ò6ä£Ş¡	O™ÈKaY\0?-ÂE6àè?ZIvSq$Š™’A´Ü\ZtF <Ä$±¿”­+È0\ní#üŠ!ÓWÎ-áU†pG_Æ…{9\\µ¸¸ÁP»ç«Ío\ZŸßH@ëÖ­­”®ƒ÷Ëÿ\04Ña$ ¨bØ?ÅŞ¶åf–Or¿ÙU¹YcÇû]h§ı†é>QüúÑG/ìŠvúv’Ò‰\0päî ”ş4é§ÛœAİƒÏ_Ò¡[&UZFbHÛ‘ŸcQNÀ¸Ø88é\\îz_AË0óbd|Ø\nyút­šÛ÷6d`gªCåCÀg@Àr=EC5¾öPeÜ†ŸóŞ„ìO3E½fmÛ^ÖAû³ÈõµRŠT*0œ·øS1\"ùp0ùG,FB“¿çµGæÆ·pe¹R£ŸåYÍërnÙ!„:1´¨ä¥\n¿\"î”Ä£œùóN¸E†&eIÇËıêExîwFTåy\nsÁìx©KQ¢v’ÚeùŒzc=h[Y¥ù|Á&ÖïÆW\ZmŞæ9Œ‚Œ£ï}Ïjµ§éW±Œ4®~l±\'éZ¨É½‡ÊÉU\ZÛï8È5^¶Õ­Â*Ä»pz‘š–o%\"HæÚÍ7\n†ÄiªY’%–Ç­t%Ë³4I\"Fœ\\0dRXpJò*ìpù‘0óì1QC,ÎÌ{W?z¤Ê,òLXúÕ´m¸ÇCn©’7)\'×­E/ÊX)ZQ¨@\\&z÷4­p’Œ+…9î3M¸ÛA™\n¦PwúÓÿ\0Ö€¼àœUØVUc¼‚;*+‹Ä^¯®:TÙ%viÙ°TnAÔš{IÈlÛµUw•óûÍÃç>Õ]S.G™GSĞV\\ı–¦¹“Œ.áœ0jÍ·Ë	fkGzlV¿(l•8úTÅ>f#oNµ¬SZ±•ÄK+|«`ã)ŞDªbHè«Q9l‚9ÇJ«9ÌA‘WoJm$®#6úo!„eNOĞšq,mBKı_òDÑåöã0ê*ªÁ2aC˜*Ø®w¹-YäXŠ>$«/Zª÷03ã«ËïÍ]óT¶@ÂƒÈÆI÷¨®*LX\0÷“Ê“c>YÙØ\Z§u‚S´íhÎFõ<÷l‘)€œöQ®|å!óRELœv@Ø°Esæ¼ªFà=x5£—Q·(\n‘Ç¯ãXåçVXã‰ä`ZrêÒÆ\nåÎNÒ6ôüiEØiÎìÊÈ ÉéP]¥»:ŒqŞ¡[¤\n€:÷ÍZµ`¡A] ÷½ùŠ(\\éòÈ€ÈH\'?w×µQûÃû¶$6x®™¾e*ÀñÏF[±F\0Qœäf¦PŠ[™ˆÜxŞÇ«0ß‡\nÍŒÁô«p˜cóÆH`‰÷Fñ‚§¨¤£Øl#ÊÛ2¸œqŸçMKƒ“Ğ6õ¤0,(Fp€}ìÓ¢pè¶áıàÙ«»¾£ÂB_da9½+¤eI•=@ÅL$\0ËÈíSyi:’†xâšW™\0A1ØÒ¦•[æ`p¿JtV^SoY	4ùíÙÆAÆ;fŸ+”­u•¾L¦ìwæ®BaÉ “Ö˜$0GÈ$ş´ÒĞÍ#€íR½Ğ°ë›ua”P0j¹B1ĞCi\'ºXTœåW¸äÑ+‰TàîŒÅ\r¦VÃwF_IÚ½qŠÙß;³´çGZ™íã‘@Œ•|ş•¶H.@ÜàÈÎ3Rî-:™íK´“Ó\0÷ª’±a€K“EYa`…H8lŸëQ‹ˆw‘&w\ZÍµr]˜†ææÛlN€=zä\n’[€ó\0¥t¶eû¸Àé³>”›cGÎKqÖ™VUÜ\\T–î@ù€v\"›+Äy:sP`óó|§Óš®¥K$ìQ´³Tg«ykaéŸJ»rí+#àÓhíI&gEh0¤rG¯ÒªÂz•Õæ*«\"ÆşéäSÄy»¤lv<f›q§h*½ÇcïUÈ™_’½rCõ \rhğY£ÇjgÛŠ\0#ïßµTÄ“)(@ÇJiÌ6±ëƒŒŠiŒ·öônZá÷\\ô¢©…²d‰Y‰äíëE>f2Š4…VŒm# œÿ\0:‘æœ0lXãçO†7F@ dç=…6icIşIxş%Îk‚ÈäÜB²¾vI=yÇÖœTKlÃ\"«–8ç¿ÿ\0Z£»_:$Œ«0Û÷I\'¯z?³m¡@c“Ëf\\ó·=p=iÙ\Zr&+IŒ`íûÄg“êsO˜*ªË÷”Ó¿9ÅXµ´³6êVE”	éRÚ+J .øöœ&Fõ­XÔš·\'c8\\÷ÿ\0\"¬[H¬‚EimÀäUù­#€şò%`1À^ßJzE6ï” 0êO|\nj©<¶*Å<’cf ğ8«q\\Êåd2…`9WÈÍAö9ƒe¿vŠ8ÇZ‘d\nÌ¦3µr\0çÖšº)+x$¼Eo1C@çÎ©›y„¡îÕ¸ÇPMhÊñıŸs~ê3ÆqœÔn6Å„$‚:“Ò›H\Z-YÅ;+y¥†	Æ8©KBˆÑÈÜş§ñ¬ûk™c·“$•×d6DfLı*ı¢KAìE4Ño>[«œ˜¦Åq\"3m“9ì¥[–Z?õx\'°ïMñ†£ÉÙçè+=Ä‘7ö„…\0V‡4Àw|ÁˆİÕ}>µYûIŒª…n­1J©ö²ë’6¶N8Í;¶\Zƒ<±ÌBşó?İãğúÔÖ±‘ÉQ¼uÈà~4 y ©¯~I©ğ¬@®#÷àd\n\"Ëß”\0Ç#9¨Úå™ÕO óÇQQ—Œ/˜‹×$09çÖŸbêùín:Š×™¾£/,r( 1Á<sœSg·‘£Ã7zpi|¯İ Èè3ÖŸ®Ä«®­¬€QH\"e\rƒ=\rU+\"LNI­\\¹‘\\œH8¦Ø2Å¸÷ÉÉ‹ŠØV¹›3È¤pHS÷—Ò¥Fó¶…Î†Ï%Ü3\"àöÚyÍ%A·n\0ã\0pk+Y™[R(­çóŸ|ŠIäü?Zgš@cŒíázri÷¯(™#Âôå»ı*Ä_t«dõ$`gŞ¦×e¥p†à\0 áxêZ²ZÎ¡‘¶0Èã©5Qíã9€ÄdnÏõ§£´Q(àÉÀùzÿ\0*–…¥bÅ­±‡Ÿ9¤ùUøàÚCn9ª–Òn(C(Çõ«\\u(5¼9PØ®¸&VÏN”Š¹Îß¦)Æe=[§¥C,Á[\nÀøU;\0ô³ƒqİƒëëO`°ıÂy4)—åùÉõíK(Wã©´Ğ\ní ;şSòõ¦¥ÄGîğ=¨œí<.xçŒÕh%>x¶±>˜$VWcÄ¹$õ=é{.í ùT73¹‘¡Hó³WÓÖ£Â@0ON uëPŞ¤»\"Dëå1äœ|Ã<\n¶×²¢‚Gò¨-î	(<ŒäÔ…|ğ¶È3éBmlÇn¢‹³,.Ò¨*{tâ˜ãí!d¶AßëV\ZÜº4a‡ â™p±¦#e;éTÓê41 ØG-J0É–`FsÓŸ­*Ü0<ÓÚ«1mÁGÌIçvÅ;[bËùT$ŒqÇÖªÌ²<„ÈÁTrIì>´ÙR8í•X¤òG\"’b’¢‚Ä®<šÒÀÒh¯4ÆWÂ£#pj‰S)o1J¨äüªÏÊ!\n,Ç#j¢Ë0%®¡àäæÇ­dÖ¦|£ŞUÛæãk/úv§ÂÙÁÆN*qòñ´ÆÁF>cÈüiÉ0¯~Ôr²ìJ%†TÚ@síQ(Œ#G¿#<Ôß”İí†ï±™vÇÛ–ù˜µ¢CĞt C#mãUÚñ_ ãf~Vsû2E\r»*­Ùò	‘­€ï»ÿ\0Ö¢Ì,†µ(vÉÈõèôÖ1€—öÈëíPHÅDñ‘\r<B¡IÊã¡-Ú£Q¨j±WaÊ\Zé¤C™!` dEÊÄÑ)òƒ8ã gõWíÛ6åÇ\0¹ÈÍhŠCD‘H7Æ¡”÷sE9âwüzî÷SÁ¢€¸ï´HœFä`÷Í˜”±á¾QÍW\rİqlöÊ\0+òúgµI³mÀÂ \r\0¢ŠÕ/u\r|$ñ]Ã¨Â#ämQÅI™|±!“ï”QZ‡RO´•FËmàÍ>{ÌªI·ŒÅS¸¤¢h·Œµ6XÒ	[å±¸ŸZ(¦ö(u×Ì‚&èz`tªóØK%¿É?–3Àø¢Š†\\Z=½³å±\\(ê:Õ$_7cîa¸r3ïE-&[;‡,¼CÜ#\'ãŸÂ¬Çn-Ç”1˜ûôQV&è×q]¨àpqŸJŸìWPG¹¦G=Êã­U% ÖÄ-oå©•Ü±“·a“C[nc‚qĞsÖŠ)4{”GÚ*0\04ğDnrõÁ¢Š¤µ¤ ØNÑ\Z­	ñÕ{gŠ(®ˆ±±î†sPÉ2D¤ /¥U1#.üËrÁ•‚m<ûô¨¤\\ò84Q\\orÀÑÆZR¥ä8Á\'¥N’äòXÈÉõÈÍT¡öÏÈ;P|½OóÅ1gI™bÙ‚9Ï½U‡Qn“÷Ÿ/Ş\r“ß4Ç&Ê4¹Ü\\·=y¢Š]ÊB»8C!s8¶7vwD£g\0´QM°.e2º†ÆĞ{Qá•¶J¹¹âŠ*®Q:[-Šã×Šj¯“’9İïEú	HûãPÖ£xâbPFş}‡QR2å³À,\nı0j}©ÀŠ(­\"•‰\0ŠTç#½-¼jaÉ+Ü÷¢Š® ÂH)¿:ÆØåğx“Ô}(¢¢CDsZä»¥(O»¥=VMŠ\\Œw¢Š†2Èo3\"«èqVŒHª›e»‘Eq>ra%pç¢š`…6—‹(ùÇ¶(¢”†şPs™íR‰LP²X¶	ÍRB+¹ó;\Z•.üÆo—\rÀ=ÁQTŠ*ÌÑ²°	´uâ¨Ira¶fp1÷ºóE€|€¡×#4å¹ßx!‘%r1ÒŠ)	ŸIi%-¢4ì¸¢Š*ÆÿÙ',25,800,15,'A'),(3,'parque infantil',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z\Z%\"2!%*+...383,7(-.+\n\n\n\r\Z4$ &,,/,,4,,,,,,4,,//,,,,/,,,4,,.,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0Â\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0A\0\0\0\0!1AQ\"aq2‘¡ğ#±ÁÑBRbr’á3‚¢²ñCS$sâÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\02\0\0\0\0\0\0\0!1AQ2aq¡ğ\"B‘±ÁÑ#áRñÿÚ\0\0\0?\0õQRœ\nµPV¦Ì´V*y*A*Y\r%SAR¦\0¥ld‡Tš´X1W)ªÛe‰ {–:UL”q´TÀà€H¦ËEº\n¤¥:‘[TRŠ³%8Z6\r%ajbÏ–éÍªG2ÅŒY¦{G¥¢¢ô5°¼jŒãlÔ£nPìµb‘T£E&šjdSN)j§¢ˆDX»Ê¨Šz\rXÉÑuæ n‰£²j›–MÒ­•¨0¢ULµm•´ËU:Ñ$Ul´E 2”¨‚”Õ,oV*ÔÖÕO²ñ¬ºZYP©MYÙxÒìKDÒÈMIE8J±ƒaHuJ°-2Ôê¶Ë#J˜šjƒT™Å4Ó¢¶TM:Ü5\"1QM°´ËíK´ªÔ\nQJÒ\ZØùéÈ¨9ÆŸ/JTÓ{\rNˆ²Õ(‚\rVŞUbbIQËW¨e¦²§¢µ«ÊRì¼hê&–m•Vv4âÕ ¨»-EÑW¨{Æ‘rZø¼(vZ½Í@Õëb‡¸3\n¬Š!–«+MbÑNZUdR©d£¡\0SŠ¬^¤n\nÌj²é¦-URš”,¦\Z©§˜Ğh6Y4¦«ÏOš…Ë	¨šŒÒš”KAMR¦¢e¦+O¨`)ÉŠl´Ä5».Ê%Â÷Ø»¨†b³á4™%¦-n‡¹ÄFr€’Df9glç`|(pŞ´ä2ƒ9IRrC\ra®‡¥QÂğ¦Õ°°XêYÌÌÆYÉêI\'q½YÄ1‹†³vëhH‘\0œÏ@>\'º&v¥sd›[›´(ğQ€ã7ï˜t`Ìk]›áÖG¯¯öÚ;—/Ú°ö‚µÆ\n1Ë=H\"bºŞ!Ç—r½ûJÍ¤+«U\Z2Î²Â}^	j’rê˜á-–ÌíŠÓe¡8.7µ²3#~°bEEwqÏ\\T—s£N„Ÿ-0h¥ÚSaâ‘¨æ¦c@6Eª—a¡1ØÛv„Üp í\'.´ÉĞrl*$\näñÜ/»jÙu.@G‘Ş¹®+Ç/İ3Ş×uIÊ\'–‡§ZIfŠ&–z#ŠXR]¶	ÚX}\n\nçÃüËÏ¯)ğğ¯:[-¡`HÓO:«`şì)ªşÒĞ|»;ûÓYcâçJ¸I#LÃO?Î•\'Ú¦-ÙáiÀ§´Š:Š˜¨\n¨HT‚Ğxî!nÌ®6€´=\'`|é¬q{îß´ŞN§ñ¥ROô¾h6•ELí¯•%i¦‰ƒJšJ•=B\rJiè!ÈB¯¼DŸá]§Ì‘éc\'HIÍB.Rà#Œ[bXÄí\\Ç´Ó[ÎÎá ©àRƒ¾y#ÈVgÆ³Išãx,Ä¤Çşû|+Vnƒü-Şæoñ(Ï¨Zã÷/×‰Õ¯·Hf¶ó!ó7 È?åE{aŒ[¸\'d2¥­=A(gSâG¡¯,ÄâÔ\rh¾ÆËaîÙ$Ä¡Aş¹`>ÿ\0ptÒ¾OcÔ`Æ–¨ªş@x§º’çüh?epÁ±V‘Ä©¸‡`Òµ08&Äbm[¢ãäYş.dV¿ö]nœéw²¾ŒU”«+C:Aà5Ó˜ñ­lb·àåJ\r¿yíX\\:Û@ˆ!TBƒÖ¬®	íeü#›8ÁÚ¯ş;è2æ³ƒ×óŞ´¿ù²DöDmí¬UñÍ\nÙ˜¥K“ªŠÇáĞY¿ríµ$GRĞ\0`²™ÚzõÅû_íÛ›bİ³v=â­-–\"Ù\'q®•‹Á0Y[V:·Ÿ%ô¤ŸP—S¤ğ—›¹º¾>½ç«ŞâöŞºšt9Áf€Ä{Sd{¡ÜòNÃ½¯Ê¸’}`üXş_[UX§(™÷†âÄLÇ„ƒ#¤\ZgÕJ¶6¿éñAÎmº5øŸ{Äp®lv`óØkçX«ÅÌ¼±\Zfc¨#~UÎbøÕ¤¸U™ËŞe\0ª“2cÂ¶ğy‚Ê™\0†r#©º²ÅäR¹>NTà¥´U|HY\Zù¾ª8–m\035ªüy¼£ñ«[ƒ \0jz™øÓëˆ‹§‘€oÄ‚s‡İU  Ç=yù×Fx*I\0i—y3×O\r(„á—BWP¤l4*®İáEJ4#³9¼ˆùÓWT¼\"ÜjZ|šSQÕyôÑRYC7&I&I:}€ÒºF\"úgxT¦¹¿ñÖğ²˜g\\ƒıd)ÿ\0i4$ö\Z*İ\07±Å-blYrY ‚ÂÊd2uRA^DNÛWŸ+O×:ÙöÙ\\^Û_·–Ïdâãg¶@\Z0ÔVoê¼QÆşG—*çÑ ¬e:èEbœÒG[£ËZoa¬´]†šúWmì\'9ûH\"P±ŸI>?…qü‡Ş¿y¬-§K¨™ÙnŒ%G>¹‡Î§Çp·0w\\î¹Õ\nœÀëµë9Iv6Êx2ÅÁµ¹ítõ]¶$t$	1SšèpzLÑM5É{íOèv×(\ruÉÈ\Zr€¾ó°$Ÿ\n¯,´ÇnF„u:68§´V°åEĞà4å`¡•£}ŒÎ£•Ãq)Š{*J…$aW¡ş\"ÕÉğ/úÏu.¢‹ö—:d‡+\0Iƒ#)j=ö3‹›NW÷ ?Ë_Ÿ…ièë&7^Ò1x‚qiI\\M.1„9™cY\"¸9Â®Ït$3 ‰ëëÍƒíå€hÑ»ŸÚÉFÚo–øüS‡ª©jæx‡ü‚pjâ«Õ÷øe¾áƒ¹¿Ëû<¯Š{‰¶™˜Ú]4è,OM4ùÖ\nÛ!9¹\r~5Ôq\0ùŒbnÆ¤+xğêÂÚÒÏb$mI±œ]ÎÔ³JS¦ÌÌ^(££}ãÆº_fqÕ5†`#®eÌ›ò&íÅşšÄÅğ›!d1€f4Lj>¾©ƒ^Ç+hGPÂO¯xÏÂ«ÌµCa­ˆ÷Ãê¬!€h–/¯‰>µKa´Kl;[C42ƒ(G&ƒÓÊ Ö^¥GîŒ²<Qı®õVö¼„†‘¾m-Înºçø×?Sƒ©yç<7\rÚŞ7™šÚà]<+ ŞKÏÍÖ¾´6ÙÅÃb-vlq¯\\=\n ¶Ğ­©ò\'M«gf”\Z7T:T˜Ö u³U´û3¯/iT\"bÜâ6ÕŠf”{ºÏ‹ÂMÅ¸€6Uí’Uã$79üŸZ¼Cƒ0Kd![ÍwíØò!AeÙtQçCñLK“s5Æ³$8,A\'t|(^£\'QÖË,45]Ï*-ÏŸß]g±xèbİÅ#ù^d|WıÕ 0˜aª¢o¤[\'YäcÂ¡…°½³eî©DDeÙå±øÖŒ’RØÉ»tv¶g½•WúJFií¨€ÖÛ£¤‘CvÄ‘ãÔ˜\0Uj\"yïĞë™RKgˆ]|ªüeá;Idµİç7úÒ¸Á]õµmñK$.ÿ\0•`H=T	ÛoºCa–FÍKø4f$LNİ)PÍ‹HsàëJ–Ë-ßë‹—µ·3fG(é­ñ‹\ZÕ\'OÚ]<õ¯\"¿À°ÒrŞ¼ ŸzØ ‰‰ÌøÅ{9n1Qç;ùxWIÎŒK}ÏpJÏşÛÖ¿a{q¶poİÃ™;¤ƒ»²™¯&<*GvëËsOú¹²´^c\0hv2Ê ëãI<ª‹a©YÜcxû–®‹—	^ÄÊ÷\0ÖË±Ğ	Ü\nÙÀñ+©aBİ·	k	—2I\"à@Ãºârƒ^jxsä$_pr\0H·šºHò5Ğ{>3áîßv–ÃİÔ¡À\0÷BÄ°YÖI-ÖåóÇ³ØØÅq£†âW]“·fÃ û%ìò¨i’äF‡•Ç¸÷k{\r}°ùÂ=ÁÙŞ=Û	 †ëHØ|^5\ZÏİPØeØˆÑª¤}®ƒİ9ä~É€›ó¥—Q*$qE(ÿ\0Æ™°xûĞ&<¤	ùU‰ş#áõÍg½%¿îÒ‡¹ufs/¸9ıJÓğ3Wà®İ`2ı4ï¨üi~Ù+H¯Ê‡¡zÿ\0ˆ˜9ÔÜ]9Û:xhkšãœS‡ã1+rñk––Ë(U®¸+±\0ˆÏÏ˜®ø¡)l«\rPæ§¼²5ÓÄ|«3›{²l^V9Waš6ğáR}EĞa«ÛçşŒëX¾‡[	Ú­Æµ•³##2gË$÷‡¼*Ş†Ãá1–îİ\0Ú3ÅHLè$1Ôr¦öÚè{WB{`@Yì­¶úõ­¿fx;X´\Züg\'0_İ\'›»ÌùMIu1m“ËQR“õ÷³«Á¶WHî:i\\÷½¡óªñ¼|)€Düñèk‘3½yŞ­KîªÙ-‡èä²[\\™\\k‰µ¢™wß!,Šäw¥sTW3‹Æ‹¶³ßai˜I…ÀğÍš´øÎ*Û\\³l“˜]¶Ä=Ö[£_ïÂ±mZSl7K9>lÁ¿…v:%XV®¶i”V«F¦/âÕ÷3s!î$¨Ü£MêÏÕls4’¶±*€©*FÃø‡Æ¶øÏÎ1\nÜº·Uˆ!nËX;NñåÃnú§|èfF„vd6P5é@­3mFş¹*‚WÁ­ƒÃ[sqc*—tÈ…+˜sˆfğ£^ï`ÙO~ã±í©÷‹;Ë1>êMÀ	ğè+/ô‡Y¶¤=á™˜˜ìíA2@Õ»Àå›\nÛáh,IsœÜ`²Â^ã‹Œô\0 \Z¬y¥»E‰íMoõÉÎZÀ°ÅÛÅbn¤6q´*\'dÎ@Spï­¶×{=~ÒÚŒçŞUC-ƒÖ*|CH²ìª\nöŒª‹ö?gŞê$kÔTÓ©ÅaÑ²ä²î¦æ°T-ÅBy~Ğ×j|jsw_V<å{fk¦#ô‹6]Ãå!ókYærƒRáø|Ë„†¼ßİïoèÆ·oâEÎ-g++Û6H%YX6î¯¼ñT&¹‚È¹eÔ*“›O´`	ß§xİUrP¥vıÆ&ƒ\\(>ö$Û\Zx;~ Ô°üßÙ)ïc9fc/)FµÛğë¬l\'uuÇ8åÊûøhtßÎ¡ƒG\\r‚ Å»Ñ‘k[ G[½¤××\"¤´ÈÃÆ\\ƒ˜´ï¥°<Œçßò¨§±“¦wÓÁ:é^…vû\0{§ÇQA\\b[º4g}jÆŠ8ÔöÙ§¨*ÔÅiŞà“”C‰mF¢;€o×Q]lVF]IÓ_¾3rË¨ñü7©ÎÃ-Œ/Ô§¢ü½*Û—ıÑJ†”LòÓÄ€I>ì\rtÔ4xyUß¤, êX¨ó9·£í\\N¾q¥Inìdu<«¥åÁ˜Vy#>×\r¹İØş×ğ‘øÔ“\nÖƒ;‘\0/ºLÎu¶ÇoZÔÃâ;¢[>’f…â6œ5Í%:˜ï©ş¦³dÅ¥nşFœ}K”¨ËÂ>&.¶®ªrî«‰‚À?!Uğş)Š¶—RÎ´W¾ì.æ*C+h#İ 2Î£™­sˆ[6±,­\nTîª÷¶Œ¤}M?²üL[ÃÁ`&íîqæ¤„¦Ò\"Ì¹\ZÄœ×q¸}¾Æå»÷-±¸ÖÁ*[@H3ê7¨š§Šcµ¶Öíæ—½İ\ZZÛ\0\r{¦vå[SúAm%¬Ú´óÕµ¶õŠÖhg¯ªbÙs(;<ˆøÁ1ã–pWOàeYe‰ßş0#‹m3Yº¤£vGùj€üµô­XÎÄˆ¹½»ƒRàÙ×i¯SKˆ\"A\0ƒ”ÏƒµÍà)ßD™§Ï<è’@BôK‡u´9&P…UŠ°&İ²·wÚ(•.KIf®Gµë7x>sjß™Q÷×;s†YImöC(ÁÜ`¢}îÒŞºsåEôÕ_^£G*ÜÄö;ob]Ù	k¼¥™O|„U¤¹ WMÆ®BY‚¹&ÄÖ¡±jÎª2©ÚŸÙóÚ5®ñü*¸¹‰¸6¶­Ã7f‡f* Ã©\'ÈmXú”ÓÒ¹ôLú©»u}QÎñZ–!Zdé¸Ÿ) ğØ†6®Ü‚Ëg4“ bhŸZè8ĞWCAâ7\ZÇºömpë¨3v®í¦–&w0GÎ©„WPª]òğøôÍN\rĞE®Œ¹mOmÙœ¢ÜĞ“š-±#CÓx2/´kÖì7kqn——+fˆ)22\'~{×]…âxEekÙHĞö&4‘»\r\ríŒ5ûlÜÊ%MÆke€AF­¦ÂµÊz¥ğÜ¥²ú£â8ŒN\\Ï`*\\Êç@†\Z©ğî%qïhM´¸T¹êå,„í7­œ\\¸ÖÜ½´´ˆm[a®V,¹œc—¤O@u›Bñ\'(ò!sdSp U—]f#^qK—7İ F5½„XÃÌÚ² 	†i9fpa‰c¬™cÔÅ7â¢§ïŞq)&cín¼4\08ùVÛßµbÑ¹²¨ÍË¼s)ø’£ã\\O\nÃœMÖ½s`t¼ºĞ}¢~fE÷WoWş_ˆõ~L4Ç—õó³Áî^ûKÍ7=AÈAã0×JåÃÙ¸S÷‚1RHOİµvMg% cµ`	è£V?\nílqKE¥uB(R€A÷où×kÄs8%kãğ9şKG·dx\rá÷ÿ\0I¶…Xèr0!£0’@Prï&6ºƒ‰(Ò-Ë[Å0ìl§Ş€4œšH®ƒmÛãJYµıF’@\\\Z7˜ø×;íŸ#Ñïl‚\'t,C|>úàäs9v;ØôÆÒî_şG}YYp*«‹ÚA$ƒš2n üMì/´G$Úì²Y¹ 3ï5¾ t­,µ®¨pÖµ\0•†ÌÜ`Ìi·¥r^Ìcíaq÷’TæT`5ïex‰$[Ò$›àš4zÍËŸ\nxIôúùT-âÕ–T1o=O*ô±nK+/‰—¥;NÊ•c/OXûëíı!m’„èsÊº©IƒCû[Ç\0±˜É1¢±1ğÓëzóÛÇ¶§-·iÊÅi\rl–WUƒI\'M )ãµ`sIÑíkŒ¨3J„µR å\"@1I©7Ç™v¤û¡ö½A^æ°÷ŒhG3§ŒiWá8‰í`ˆÄï\00|ÈåEáÄe ™rµh$ZGÌt`X\"÷°+Iwšq¯…WŒFÛ0§_âXó­â5@3^u™ÅrölLÄ¹€0®\0‚dâ|´¤–I4_‹¦QÈ™˜fs#(Ïî°õ 6øTx.ÉÕD]»æ{çm)Ÿ\0›ŠÆFq–÷Q†¤$$íÌRà7beÔ}­ÙPŞoŞ3÷ÒAÎß©¯«‚–4«¹µÂ1=–$Ô\\Â¢·Š›Í›å5;Ö{;Œ“î±ät#ï¬[X‹k}\\@«hK©—flâ¯­Ğ·‘•©\0OŠå>´\Z}Ì}D)\'î_±Ùû1íkné‚¤Áå‡ÄŸH­œ7VÍªèDwÌÄ*ó\\’Ğ#buÛº$ü„úU–œN¢Hy\04ˆG¯/ÆŠÍ$¨®ÏHâœM–bÀwL ˜‘\\İüc/µ\r,pl	ÓXº„órŸ­kˆV·”fS•ÉÖAßºb#Ÿ*Åâ|Rè¿mí²–8{ëŠÌ; ã»•]`ÎS¹ˆ¦ó›«/‚½_èô>=Å-¶\Zñf…w6Ô€	û™¡uË›M|kÅ1X[¸¼UÆ\0€ÎIb4T\Z/œ(<+¬Åq;¯g)È¨QnB³s€I>?\nË·|¬‰1¸ğÇãY²dÿ\0+kš£ÔxWI§¤yníßåÁ§‰¼µ÷UB%>B±qÏšÛs!Xù\0$Ób1³ Ö¯Ãİ¶0˜‚dİuÈšh›`KGÂ’\nª‰ÔM(Ü»ìq´{ºÆÆ#Êår¾ß`•²^×2£sìÛ,¬Á‚íÊu­Œ/´60ğ+¨ïxøÖ7´¸á}J[\ZÏUèØ˜­™§xÙçğÂZøõı}®ö—B\0à&\'0Ìpoë5ËûSí¨–T(	\\HÑU\0Ê Êxîb¥ş#ûchö–Ñ[3¨`ÂdÎÆ?îkà¸Òµ×\\–×3)=ç\0‚@¬Á\'¯•&/3®Í¯ÌiKÊŞå\'ùéˆ¸ö­Zbs?}–Ot9”_89óxW]‚²[øf¹®	/tÜmõ>§o•tkv$€$ù\rkÛàÃXÔcÂ<‡U–Yr7 F$œZFÈ}r3Â´°eÕ‰ôTDk#l¸bÆ;F¸Î`˜Ì°5=Ø­\'ÀvMqA9MÇ åtĞì2¸˜¯?>¡dÉ\'ïkô;kÅ%ÿ\0UóãE?[9°/f™BÆQ\"4€u 8šÓ“A!-éÊrIùš{8F·ŠÌÇºT…>@zóªñwû‹ÏİÛÁOö¬ª´ÿ\0¹{U_†Í<(îˆÊmÉpH2 h6õ¡Ó‡¥û×÷.äÍiÛiĞ¨0vİs»h+slX*ÌD2+åq\'NÚƒâv{;¢?pä`&VA÷Ú<<ë6U£\"‹ã•óş~_Ôã(<‹•ÉÅo-¦)p#‡Éq[S#pTÏB\'—­ÅxíëÄìÕ‚u9™ˆ‚Dò’k+c²É‹µCr16Î¤{¡[S¨3×¬ÑÕÚÃÅ»˜vpûƒdH$vv\Zİ‡*”w[˜3§½ÓÇñ»˜væ\Zê¡$\'ßƒï(Ë\Z‚;³ëEà½®NĞ]l=òµP\0@@»ÈÊ4uÂâÒ\rnâ6c=üÓ¹Ó§ö¦·Še\0‡¼²cB@Ë´xŸ\nÑv\"ª=g‡{me-…l6$‘?øÁÜ’5ÍĞÒ¯6N=|\0;\0Øf¹§†J—HöY„Å îe$d\0³0\ZˆrG/HÚâ\n…ïy…Œjv3:õ§ı4ï\' jYEİ„zW)õï’A ÅöƒH‡<‰ÃrñÓŸNT.?6^$lÃ¨ˆä>\ZÑ\ZÙı }*¶íË[3ü$ºªs¾ÅñÉ$Ó°2Î-’m¿zÙÈí9`¡ˆoÛÆ³pjÄ\\ûW<ôlÄî¢wÓxğ®†î;5¾Î[! \Z	¡-àr–\"ä†f`\nïßzXÉ«Ú‡É8ÊmïÜ\Z¤\\·pöa{,°Í2C6†`ìGÂ£Ã1=ä·İÉzA\n2‰ı“ãOF4cØ\'F6½Vj68¬Áä•H\Zñ¦RULªRRíØÕÂb»2\Zv?SCã1JZEÂ€ì$‰øV&#‹\0ì2¹†=9«°8›w\'?t\r#Yó¥i­ÊV)Gz4û%oyó«×lÕg¶Bœî„(RH1 ˜ØkáVaÖ¥\n–\nÄ{§‘ƒ ò«½ É†(Bw“L{¶§åUK#N¬íøoE«ÌÈöº¯^\n,à‹\ZÀ£sâL\rIëøP<^å»k”×åê¨[¯%ó\"#‰Ç]kfåÂVĞ dNîrt;Æº’jwxZ¹Ø²”\Z6}\0Ât*XÃ}R;gˆGV(mÙ%Ùx6|¥ŒÂ1DÉˆê7§â—œŒEµ\'\"Ü¾@\0. õ­g;CfÜe=Z}ã:]¬¶r×ÍËÒ ãoW¦£#ÏeÏ)Û›ºÙ…c¨rĞ³-¹×¦myQxŞ.÷,\\Ê–ìÀï@‚F‘©Ğy\ZÖ³Á0£”ÿ\0HùVc8Uƒm’ßs0TLyù|éœàûñIFVß©Ç¥«;¨\"bu:ùƒZjŠ-J¨ëA%³\'âßñ£ìğcŞ{çœöÅQÄQRèE¶Ğ\05Ò{ÇrNä×gÂTg™ÉvG?­›PJùá&\'Óñ£x†#-–ş\"ñ?wÎ³0—„ùÕüh¶Õ›( ±1;’9\nïõta”½ÈÇ\rYRõ+ın¥¬¡pD¡HEt‡Ö‚¸¸]N…Ùˆ A††@ÖkíBÜ\\®cXl¢v×»>5eÎ$ÜÚ|Àãc).=[=gìüÛq*1Vl†vl¥ZÅ¢@;z=++aV×(¬aYumô]gî®U1ŸhZwÌtéåZw->[7Y®g€%Œ©#ÌéøÒ©8R~·üškSn¿	è8¾ˆ½…í6í¯f€n“¦Ú/çYı ¸‚Î×-¨d<ãhGOQÒ°q%C:ˆ\n¨ÓX2Ï3U]åº…²Ú^ĞŞÔ…Lò×Uñ¦Ñ\'%ÛÔÜ°Ã¾¡.‚®\"H1×x<e9ìšíƒP´#8g¬|kS‰ZníÅÊà$ÉŒ¬\'Â&F£ÏÂ³øÔ5«wSu@a¶Ş -*-ç­WñM4÷úúø×©%àøìaqÁİW¶UrÀ¶“âuÔó­LW³ø‹6Şİ;5\0˜pñš G]j\\ao³âTºÚ{¨6İRH€£ãKÚìf-şŠ 1c™»¶ò¤p\0$™Ÿá®”r]S2ËMÙú[î_èÿ\0ù¥Cã1•^Û€ÄHaÔMWjezÆ9È‰ĞTíßsî¨ôQùV¼\nÈ7 k\ZéJÕ»d•wğğ‘¥rûZ@Ö½J-=şCäYÿ\0O­° n¨Ó:s×Ì“IùZõ2û~Cğ¨‹Õ¾&·ÒÊò-*À‹Ğ|\r÷T}Nx]=OÄÕ©uÏ6>S[¶ÂôõS1ÈÇ—ıĞmú\\}L²ÄÎA;è\'æ(›vŸ¤y@ü+YHÓ…Y”³çı¨[\'™\\¸Œ“´Ì u¬Ş3Ç,¹PvL³¡bT–òŒº|ëx8‡ÀéëT_¶®WEîGuL\ZŒÃÃåK¢İ³^¾X•D\"Ü´UYL\nf\0Ø\Z\"÷R”‚2}:Íˆ1a ‰. ˜P`ƒ#m¿*¦ÍµQ ÉUâ5¦òÕnÊ>Öæ÷[§Í˜Ü‰¥»\n¥µ´×™”qãVü}\'ñ_d»÷¿¨ºœX_âòÌßG7lYf“w_?ôg¿Q²±ùT_	Èÿ\0Wö­3`xÿ\0Qüé+ãñ?M0Ì‘’xé\Zö_?íBq¥=»ø~ WKl¯A\0üh..±¤ÆÆ\rv<\'\"„¤¢¹£W)4›9Õ¶İÀÖ‡Ã;öYUs?>•ºO3ñ­K\rÃëğ®¯W9äÁ(¤bÅ=9\"ÎY½¸Ñ*Dm,Ê³ìíÌŒÅfIƒ¦šVÃ•XŠ³Š\\—ÂoÙ‚HÓf¯­y…;tugÔä„nÊíğì!@!ãR¤#œü*Œ`ì…ÑÁ~ÉÜî‡Ş	Dšõ‘ê¨\Z‡¸û“p*¿.ùıÍ+®šN’ı7ù­Ç^;ÓäÊ§ñ¬Œ]åk¡\'(X^Ë( åéN0[åV¦9ëæ*XãÇ}Vi*l\'…q`l°`­%Ke…aÒ:ıàPØ¬d\ng$Cj@C¤I|	.ÁeQ¦ÇŸÆ›ö„H=E/—^ïä¹u\rã§V¸Û±œ1nÒVÚÛQ¦\\¤o³»t>”ÌMÃÉ~\n~ù­eÂ/9?ÌI«mÙQ°Ò®˜ªH¦ye:9ãiÎ°?Ú)ë¢&•6¿p— 5¹ªÆÃ×ÀĞ˜bs´m>5~mGóP¶¾ºÔ^Ë(ühÕRtü*ÒMmÍ\\\\íÏYúğªÇl!XüªÔ3Ê†GåøÔ•úTÂ•iGkõ­6O¯\Z›5\n\Z~¾¢¤M@—ötëwèĞêG__\ZºÚSP6> ÷ÿ\0¢é×ëñ§ıêœsw\0Û¾)íÎ¼éšÙãoT‹ÃÉ×nSÙÉÿ\0º€oŸÎ›µÇ®Ô¥¶_&<)ªfë4çëj„-í:š³ÊA=¨`ÚkÄYJ:÷*îŸ\'—’2q×™•vÜ:Q\\>áSÈÕ.ÎX–S$ô4;ñM\nõå]Øu¸½sŸ>šk•ûO\rÆ¾xĞ\r{¸\'şB…n.Ñ–4;Ñ¼ÊbO[?ˆ¬}l±M©Cä©Æ-H…¢™\'q·:Ñ|PMH1Ö\'î®rÑiîÏ¥i«>BXÆ‡Ö5åÎ¹SGCìk\\Ê:ş4ÌßSCà1µ,Å‰:4x:ù“D•^‡^”ˆf¨¬	©dÖ¯P\"›?Ğ¦%½ºªäu«î0F…¸FñP$KDE= Ã õ¥P ItczÕĞ¦5ëçPd;“òªfmãëûUé-,¥ûHÕ•ıï‡çVÛ¾»iYÃ	ĞÕé„=vªés@ÜÚ*]§g1#CLøcÌÍ\nDÜ<â—!‹S×î ­áIÛOZ¾ŞN¦ nnçßS Ÿ‡§÷ªì ~‡×ãOw”lvÔòşÕ[ ~^Uh¹¥	†Ä‚F¤ÌÇ’ùrÔU©\0ùéã@Q^)õ]y¯ßS>cã?u‰nòúxó4_N¿B\\!1~/‰%=|>¾êyÿ\0³ãÿ\0tÀÓ]5º\nLFŸ)häò)¦;éë4íyGŸ-¾uY¾#ëÇûüª“º}\ZrÜ§áıª õòôçL“Ê:µHšbÃ˜<@Ò:·§…)\0ëñ\'îŸ:cµÓ™ëõò£d¡û€jvŠ¿·~ôŸ¼U ˆŸ„Š\"Ècn÷?²1$mF/r¬ëülÒğúÚ`¥{§v÷‡¬kéU‹§ëËÂ©gS£w k¸Ëo:I3B,Á(b>È¡Q=í]?íGŞ¤ƒX×Ç®uš—ÚåÖrf\nÆä]I˜<¼jìF4ë €Ç”e&Ş>uRœµPò†ÅÌúoõ½×ÌkõëKİ’‰ÓMHëTv‘ïiV¦åT\'»˜ô©:HiğÚ5;¾”–Ùot£‚U£Âd7ßT%Àd‘ :É‚<üi\\¯d÷!€hTzæü\r5ø›£@ªFš€#o4ªº~¥«¹·Ãğ¦ÃG—àiéV·Á™rdièi/ç÷Ò¥JXíE÷>gñ¥J¢ä€…Q¦?\Zk[Ÿ_¾•*\0a°ó47ıvş_ÄÓÒ Ê*àê\r–$j&<({§Ì}Æ•*–[¦ïù‹õÖ‰¶fg^éßÎ•4ø_>Åñäh1¿¨üiR¤.díçLy0¥J¢\0í¿ú+ƒ!J•\0¡ÎçÏñªÃ¥J‰	¸×ã÷ÕöË¿ÿ\0ãøŠT©—%Yı†dY=ÑçFÚQÈş4©RK‚èò€¯œ¨2é#XÒ}íâ§ÁŒİ×_±\']uîëó¦¥IÙš;!Ø÷ßÀ˜ş‘K‰ë!û5*xpŒïÚÂà>T]İ]	Ô›7$ÌyÅ*U^^?RÈrÁ°îrM*TªÊCÿÙ',20,600,15,'A'),(4,'asd','asd','ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 75\nÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0Õq\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ç:š)ÕFc…-6”P1Ô¢Ræ€J\r4Rî\0P!Y°=é¬ØôÒØç¹¦u¤1İivæS… ¢GRA£ÎœºF¡z›¥0¶î(ÄçÒŠAKŠ(§\nh§\n8bœ)‚œ\r0KM”\Z\0Z\\ÒRæ€4´ÚQ@¥€\ZvÚ\0-}iÁh´Sğ(Ú(½)­ A“Rm¦•ÏZ\nÄ®v6=iÔÅR£¾´ìP³E ê\03Fh£4\0´f’–€\n\\ÒRĞKIF(ii( ¢’Š-¤Í&sÒÍ&h\nOZp\\P!¸&œ\nuÀJZ( Ú\r&ÏCN œP¤’ÄrAö5rjò¯¼z0ÍQÍõ¢ìVFì>\"SÄ±î¦¯Å©ÚMÒP£q\\Çzw3¶¬2¤íEqiw,\'1ÈÃèjä:õÒ›=Å0¹ÔRf²a×áq‰QûsW¢½·›îJ¤úgš,\'Í&hÈ¤¤šLÑI@%-! 4”RS\0¤¥¤ ñ¢Š(°1êo4¹©(u8S¥Í\0>–›J(ÙïM-ÆOáM-ù\nŒ¶Ni\0üäÒŠŒ?ÌJA\\fÅ£ŠfinéÒ€[w¥(¦ŠZ\0p¥¤¥\0êZm:€(¤¥ ¥¤¥ ¥¤¢€œ3M¥˜ÓºT{ñÖ—Ì^æ€$Í(¨Ä‰ê)Á”ô\"€š3IÇ­-\0(4Rf“u\0)¤Í!4f€4f’Š\0u”´\0¿J)(Í\0--74´\0ê)3Iš\0vhÍ7>”¡Ië@i@&”(î”\0Ğ´ìRÑL–Š3@IHO½&ê.³IšnhÍ 4™¦–¤É=\0?ue4#¼S‚ïLCwĞRícÔÓè …Ş––’€FèM.iPÑ^ÜÁ÷$lzf¯E®Ê¸\"·¸â²KÓ\ZANâ±ÓE­ZÉ÷‰Cî*ìwJ3ŠßC\\;HLçÚ‘~ÑœÇ•÷éEĞYæi\rrv××ĞctÅ‡¡æ´¢ÖûKâ´ÄlQU¢¿·˜pø>‡ŠŸp=hi(Í&hQIš)Šç›RÓiEABŒS€¦ÒŠ\0v1lÒ³cëQ3sŠL~”H)ÂÃî‚Rª´¯µGÍ\07;¸)àUµ³P:š_±Í@E-Xû#öÅ4ÛH?†€\"Å.)æTşT›ê()h—\0\nQF(Å\0(¥Í Ó€¦æŠ6Ó‚ÒDLÑî^O¥Gæl8u ûÔÈÌ‡å58XaĞ\Zrõ=ÅŠ´cµ~±øS~ÏmÛ?\Z†…B@ãµDòŞ¯koÌÒm—ƒ?Ja¡A&˜ŸİäŠ½ŒËóp{Ò½\0À qHæŒÓih´´Ú3@íE&h QšLÑš\0wãGÜÑº˜Í&i±§€“Ò”\'­8Râ€\01KE\0´QšLó@£5JóQ†Ğ|û‰ìU¿Ôç_2ÚËlcûıM\0m“éUåº#µ‰ÏÒ²áÖnKì–ÔnèpqZQHg\\´~¼Ñ`\Z—Ñ»m\0ÕÜSV<t\0SöŠ,rOA@V=j@-0\n~1E AE&i\n\0u!4Æ\n…§½\0X,)…ÅB÷TıM8[¹ûÍ¥+Œ\ZP;Ó|ÂßtS­º/lŸz”\'`(Ô\n‚)_¯ñl¿ÄI«b3N@®WXÕz(§„50—€ˆ%.ÁéR`Q@†•$sIİr?\ZŒàš†KÈbµ0±©£ áÀj²—ñ7\\©÷®Z]]GÜáTåÔ®ädLÒ‹…™Üı¦ïÎŠóß·^ÿ\0u¿#EV0\Zvj0Â‘HcÁ¥-LÎFÏßò î.â·]Ò¸_sQ%ı£à‰ÓŸSŠ†òÖŒƒ¥Vû\r£ğQRºI•Õ¾‡5(¬¨4´F>PsŒV_”àP2DF™ö¯Næ´¡…bP\0¨`š—>õ8¹ˆÿ\0 %”SDˆz0üéàƒĞŠb”P)ÀPK´Â—¸ cHz¨¤6ñÕ.)qL\nÿ\0eCÓ\"šlÇf«T´Sì„t\"Û8íWqK@şKá4†6hÑé@ÛM5£±OUJá \n4*á·CÓ\"šmAèÔ€§KŠ²m±Ónã¶h!…ÇğšiB:ƒ@\r£<Rí4mÅ\0¢ŒQ@hÍ74¡I Bæ—9éJ×šx`BzÔ@í@§S\0Å(”Å\0:ŠfúMŞô“p¤ÉúS7\nMÔ&hİLÁ>ÔíƒÖ€à™¤xüÅÚÃŠ\0)hí¢ˆ|¨J8¥¢€ÑI)\n`>ŒŠ…¥½7Í-÷4€œ°Æ\nŒE+õ!EH¶Ê9bXÑp#3dáyúPgí­YT\n>P<-\0UÙåØŸ¥J¢ôQSá@iÁ)Ù¥¦vÚEZ3M¢€4f’’€ŒRRÓ\0ÆzÓ(„T”f‹“˜¨äµyNZ³¸Rî¥de?ìåşñü¨«›½è§`»8ÀiA¦fX…j\0‘A‘°:Tâ=G4DV¦‘ıjO²G•`\np\nå²ĞÑöfìjĞ P*}ûb\"OJº8\nar‡— şGÎ?½Z\0RâVY£\Z]J?Š­í¨Rª(°-ì½ñR-ówQO6ñŸá¤û*{Ğ…ò÷SRØ»äTd_SIöOF eÁuş*xš3Ñ×ó¬ÿ\0²¿b)>Í íúĞ¨e=Å/²|©GcHÍ:—v}è`\n1X¢êìqÖ¬­äÀ‘@\ZX£¨×î¢·Ş«@@£X_\'pE=o\"=ÏåL	±F)‚â#üBœF ‚§qGE?Â)†?ÃSb“Ó¹·CíQ5¶;ÕÂ)¬´†QØ.)ì¼Óh\0¥¦—›¼š\0—4İŞœÔy ½\0<±¦“H	=©Á=M\0&ÿ\0—çÖ€ÓÂJ)ˆ@§4ğ\0éIK@Å¥¦äR€FjœsH¯Ñqõ¢àL\\\ni˜ôÑnÍË¹ú\n•\"Dè(Îÿ\0uM(Ûï6>•d\n\\Q`\"[tSœgëR… ¥´X@.Sii´P\0Ìª9 }j	/aŒrô²[$™É?Cı›y@~´ˆdÖ¡S…ªHõˆÈúŠWÓãÛ„ß&\Zıî~‚•ØìYò>ëƒSd\Z`‰: ©21Í¨ËRn¦\"MÔn¨·ÓKĞÛ¨ßPo£u\0O¾“}C“G46úMõ½”{Ñqù‚Š‡Ìö¢ÂÇ*I:Õ¨­e\00Û“ëUÁÁu:İÊ?Š³(œGp?€Æ¤_4uŒş [é¥<_·uœ9coÊœ%QÔõÔt©ôgª\Z\0pš3üB?¼)¢îÔ~”á-«uùPÁ_Zw´À-B¿)ŞL£ãèÔ\\~4¸¦ı™{Jß/ÙŸ´Çñ\\J3Éœt‘OÔQ²äpş&‹Ä˜¥ÅFã¬yú\ZPïŞ&¢àIŠ\\T~oª0ÿ\0€ÒùÈ:œ}h¸—Ñ,gø‡çNÜ¾¢€bŒZP)€›G ¤1!şOÅ.(/\"?îÒ}•=ÅOE +QÙ!µ=˜Uª)Œ¨mŸÚšat¯QŠP*ÿ\0zœ%•‰ªî(Ú=)Sí2â§·@59OaM0¡ş\Z0^ú­;íŠz©¦›t÷¦uõ4\0Ùg’+&çR¸ypZHçûÍÂÖ„–*Äœœıi‚ßËàt ÔÕ.ƒ…–Ë“ı×­eyW&&O©©5‘Í<qEÀ@¹êiÁ@¢”PÒÒ\0ëLi”´-&@¨¬ÿ\0qI§¥¼ÁE\0<Èzo}©ëo\ZòÙo­J0£\n(\0’¿`¿Zx·ÄÄÔ æœ1NÁq«\Z¯İZw>”¹f‹\0”µÌ±sø\n©&¤G	o#¦(4¹¬q¨İî% Ú½²jdÔ&c ş4]ÌÓÍ ŠGq–Œ¯Ö¦Ä:ŠAKL¢’ŒĞÒQHq@ÅÍ!jijijBZšZšsëM%}h¸\nZ“&›¼v…ÏjWÁ¤ w5â{Òu¢ábMËG™è*<Å;¥p°íäÒd¦—¸¦bœ( PbŠvì#”ØãøOåKƒèk@)õ¥ÛRx¥¢Ø~TyCû«@\\Ï§\n½ä\'÷/ÙÓûŸ­!”…8\Z·öt?ÂÂ²§ûTÊÂ—>õcì«¼GáIö_Gr:O¸èçó§ı•¿¼´}•ıWó \0\\Ê?ŒÓÅäÃø¿JgÙ¤ôDƒøMùG]§ğ§®¢ıĞU_*AÕåIµ‡c@X¾5Ş:p¿ŒõCYØ¤mØ;qŸziı®ØıáùŠp–Ñ»/å\\Ôöw²¾ä¹Ø §$ˆ¸i‹ZM…VèÀ}Ó„Q»)ğ*ço7`’©Å]Œ83dÑtÂÆÀ„ö˜ş”ï*^ÒÄVHb;šx•ÇGoÎ˜\Z{\'ĞÒ~ø\0?CTÌÃøÍ<^L?‹?…\0[İ(ë~bæúÆãğª¢şNà\Zjº\n`Mç êHúŠQ4gøÇçQ‹õ=c¥ûT\r÷“ô 	C)èE/µ™hßÂáJ©èØüM\0KF)TGîÌÃşKäÓÇ\\Å4Š<™‡Iş….d?¤T2}Ú•„ãşYgèj¤í:©ÄøPæ‚Àu¨PNëÊìúÓÄülM!Gh\r+ıÔÀõ<T€FŸuE.ú0@íË¿à*EŠ$şO©æ›»ÔÒƒš,$İè(Üi*9\')Ò7o ¦ã4f³Mí×˜?pB}EH·ÎN<’\Z.‚ÅüÒæ I·}èŠıM?x¦\"LÑš}è\\Ñ€{\n‹}ıèæ(Øä¨4ğ\0¨¼ÊO2XÍ.j¾ö£yõÅ;ˆ±ºâ«®i£°¥q–¼ÊO2ªùŒ}©B»2hæ™}é†QJ¶ıÚ€aß³r–ôÏ4j!¦CØSw1§£Ç\'ÜFl³Š”A¸gaYŒ­É£9€•R©`3bŠ1@\rÅ#t8§b—ÍË5Á¼e.ø\rÀ®Š?¸¹ô D›·mõÅHQS’’AŠQJ)@ €œ\0SÀª›}¨§àÑNÂ0E8TAßû†—Ìoî7åYÜv&”TBoUoÊœ&^ù¢àJ)qQ	“=E<J‡¸ 	:˜$_Zpe=èÀRàPõ¥ \0(ô»®á@	±É¥Ø=M-:€åÿ\0´iB7÷¿Jp§P2?,÷\n\nC?À¿•KK@y)Ş!Hmãÿ\0d~5fŠ,_³F{0¤û*x¨«t´¬2Ù}~T†Õÿ\0¼¦´0)6¯  \nftó¤0IıÚĞØ=)6z,“ ê†£á#ğ­æ‡ÔĞo4¹­\r‡ØşXşêşTC&ÕxÂ§ø7ìéıÂ?\Z\0©º€ç±5hÛ\'ûB˜mW³Ê€\"¸èçó§™GñšwÙ½R}™»hÂîaüYü)ÿ\0lr0pj³Éè?:O&Aü&ŠÎIëMãÖ?„şU^[c\'W}\r\0Ld\\ãpÏÖãÔUìÈƒîËêI4å±\n~ûcëJáböê7TI\Z ã?‰§f˜‰7ŸZ7Z4›¨¸î£pîiy4†IºÔÌæ”u9§p»ŞŒ“LŞ p(ón)\\,I†¥àuj‡q=M-ïQêhóaŠŒRÒ¸Xqv=é:ÑN\0˜§bŠµkjemÄqM+…ÆCnÒHâ§šH,Óç<öQÔÑ}x¶‹äÂJ%÷5‰$sJää¹<’kK$	6_I\'Ô„ÊÆ?…zŸÆ­Ç§}CyAA=GzÍ²fÕOºÀÚ¢€:ƒŸÎ†™I+2{]23\n¹‘Ô¨Ö´£Ó­ù£,8ÇÏKdJÃµAÏ=ıÍ]@Ø#>àUXÑZ×\"m.ŞTØÑçŒXúˆÖê^<ºzÈ®•È}#®åäçÓæ§È\'fyÛÄWéQâºrÆQgO•œà§cî+’-§#¥fãc&¬ìAŠ\\RâŠB\n--1( S…0\n‘E4TŠ*˜bŠ—Ë>”UX‹œzêQÿ\0tştïí8AÁVü«›şÇŒt’QøÑı”ÃîÜÊ?\Zææ6å:…Ô n9üªAy÷¿Jæa°’7®e`;f¯8£˜\\¦Ğ¸·?Ä)âKcİ+\Zp4ùƒ”ÛÜÿ\0r”EéÎ±A÷§>´s\nÆĞ‚>Äştï³¯faøÖ(v	§‰\\üèº™±öI\ZÏSùVP¸”ËFüéâêaÿ\0-\rAfiùRö~T¡&Ä¦³EìÃøÿ\0JŠ]p@pò®}\0ÍAccîşt¹›ûƒó¬Eñ,ædüA©—ÄP7üµˆş4î®ùGü²?(•ûÆÕŸı»3”?ğ*zkQ1ûƒğaEÀ¼&õFü¨ó×¾GáP.§	ìiâşØşT\\	|ô?Ä)ÂT=ÅGöËsÔş”¿hµn¥EÀ—zúŠ]ÃÖ¢j{¥.-ÏF_Á¨¸dzÒäT~LG£Á©|…ìíùĞóKQùt•¿\Z<™;H?*.éj/.aÑ”şmŸÑOã@ÑQ~ø\0?CFùGXæ(¸ÑQy¬:Æß•\';«ø	 	qšB¥Gö„N(ûDŞÀ~ÑéFÑïMóPÿ\0¥Ş¾´€6ûÒm÷¥Ü=hÈõ ú~TÓô•HM!4XŒKıÑM0¯÷Z›4™ èjŒG5tœMP~XŸZOA¡7ã £sô˜¥¦ã°P)qJ(1KKJ(\0”\n-\0\0RâŠu0S…¡I ôXDö¶í< ÅhŞÎº}¸0fn\0ô÷©!Aa`×0@êk;&éDò.&#Ÿ¥md$®Êk_sî,yÏ­H±Œå€ü¸«	\0t>ät§µ¾èğAè{Ğ÷7¶…oİïP\"ÁÇQZQa@pÜäñToHÊg‘ÍhDˆ°©wäd\ZÒÚ¾§Aj]¾ç?/½]R£”duÁNÙ-ŸÎ­¬(=AS)l‰Õ»+Î‘ßb’ç:š67\0ävè+7R•çlbq?9µ17a¶±Nÿ\0í2®`„qU5­8C/™\Zâ7ì;\Zèí-Ä¬h~U:f¤¹·êÕãaÁ¡Æè›w<áĞ©\"›W¯mÚa”àÕ,W=‰—Q@…áM§\n`<U‹t/*Š®+WH€Ë8ã¾+H«²$ì‹_e”WIö(½(­¬gvx2’Fx¥ßóc™LOeä\Zòy™Ùb@Op)™ÇÊiàqB(+ŸJ˜XÎÚpÚN1Ò•i¤çs°BÓô \"bšs‚EJ¿tqG´aa›TôÇçK±½úÔ\0œòzÕ‚)ó…„ÙîiB{Ó—·jyPi©Ü,0(#­\'Ù£låTş92=*c¹T‘Ö§Ú ±X[°Æà4ßìÛqÈ‚1øU”bË¸ä\Zœã&«Šm¥Z±æ?É7ûÛ²·ıõWÃØ4æfQê(çAb¤ZdqôR}‰«AJàv+näS²ÄzQÎ‚Ãr}åK“èh,@æíéš|è,3u.ïz~I½E>d+\rßïJ%aĞ‘øÓYÀ`6}©À§p?*9‡Ê<O ş6üé’j2EÆéÓšSµº\nC·ÒŸ0¬@ué”à$§şR6»>ß”`ÿ\0´´í«ÔRaMÁÊ5|A:°Şb#¿ÊÆ¬¯ˆaîV«˜ã=‡åL0ÄHÊ¯ıò)ó0å/¦»0~†¬.¦„ga¬Å@ùq¥NzŠ9ƒ”ÕşĞ„õV£í¶íÔÊ²°i>j|Âå5¾Ñh»ø­íBµ“†ô¤$ƒEÂÆ¿ú)èÃşú¥Ùgÿ\0Ç«&‚Ä´\\,kùHzJßIí+V/;7åKö† š.‚ÌØòœt—ô¤òåìëùVGÚ¤ìÇó§¹ñÄš9r³MÒb¤e*®1LK‰YF\\ÓÍ+Ü´RĞ0¢–Š-\0RÑ@ŠZ-0ÖIŠv(\0«úM£]^*Æj+®ğÍ Kw¸aĞqZÓÙvEq•§ŠÉ>âŒ·ô¬â¸`*çs\\È	Çôè?AúÓ<HÈ=xâ´{›Â6ˆÈØ†\nz¸«q\'İÈç‚*?!<0Ãvâ™!vá—¯8ÍL•Á;;2ªÀ	\n.Xö«-–€î\r“ØÓ\0\"²¶“Ğô«N$û($ñ»•§Be³6-@ÚG9Éşu2î=qÒ ·ÈôÆãÔ{Ôñ•çîğ>ö*‚;!.®E´ä‚İûÔz]©Pne9–Cœ“ĞUuÚ7Å°<˜½úšİ`\"09çhDŞì‘–==\rJ1èzzUxÀSŸ|Š°Èßhg3â+ ’¬ëÑøn:\ZåXaˆ¯BÖ-LÚ|ƒ •€Ï¥pW‡Ï­sÔ™,‚ŠæD‘Pœ3t¨Şæ4‘cfÃ7JÌEŒÓ…W‰›-¹ç·aRyÈ²*ù› ¦\"u®§Ãåƒ‘Ğ\\²rÀWm¡GåÙHş‹[S2™Î´V\'Ú?Ú4Vöb<F$\"¤aÅ!\0Ôò	çÖ¼S¬Xù¡Æe¡8¦Lûâ	è) \'SÍ#zŠ®\0i„Tc\0ñR¤¾dyÚËƒ˜bÇãŠš?»MOºiÑŠ@U—>yÅL†£•q1&¥ˆdšĞv©X|¢¢<\nx9QM	•q‰¿\Z³*\'|ÔëÈ¤†ÈcŒÓ0VZ\r²C¯Ì\r\0‡°à\ZVå)Ê&)Ä|½>”ĞEŞ¦\\æ£Ã+Å$eéÅ Ò”â’1†¡î1Xq@ëOqÆqMÆ)ˆd ïŒZŠkòCNÈ\'ƒÒ€3‡ü(‘xâ”04².ä§Ğ“š\0A¢ålv©ÛøHõ¥{pÔåQ‘ÀÅ+hŞàFé·8â£\\“Ö­J9Ï¨ª©œši‚&dàME“¦¬}è³éU‰Ä˜ªl!ÎÌçšˆ»{T äõ	ëIÉ€ÏjvİÈOéMÇ4ä8%{\Z9˜£‡k1ÏSSl§c”µ¢Ø–Æ„ğ¢¨C€©0SÅ\08RŠANÅ\0´RLAKŠ1N ”QJ(qKŠ)iˆ|i¾EQÜ×rãìf3.Ôğ+Ó“Ì½}ë°ñ1XÙÛôËd ÿ\0WM£dKY$b¢ì·U99éÍ\"Ä¼r	Ï¯J·\n»B…rÃ3Qˆˆ`Á[çŠ:KaÈ€*î;¹ê\Z£Ü©óÀóß\"­F¨ùKt+Ò†\n§ #=i´KÔ‚5C\nnùåsÍH~Ì	 ÿ\0w®‹›ÆLy\0ıÓOº´Ï8ÈÇÍL›èÓ4 ^3Æ2{â«ŞLÜACÉÆ3ĞTË(†İ¤bp?^)–—‘®¥wèíTJz$_²µ[ª`ôÎGsV¶NAëéQ’8¦*|ç¾\ZeQĞñùTÉàäş4ÏëO$c9ÅZ$’EVˆƒßıªó­F/*gOî±èû”qß\\¼ª/çØARÙÈúVUV„½Œ	v“Šç¯fónğ™ÊkOUätlÀ¯aŞ²-—%‘‰îz×:“OBõùa†0:ÖŒ2Ë¸ôÇ¥cI•#åõ8âˆ!º[€Å03ÜÕ\nO±ÓÃË¯Ö»«İè²¿·ô®\nØ‘´×O¨FœĞr3Êàgó­i´‘œ“l³öcıÚ*¯öÄ¿İ_ÊŠßÚ\"lÏ-+¸u©\0ùiª)IÁÅx¨ì)]‰Óæˆ–ç*/·	QÃÒ®!w¸hÏ„Tíeæ)Œ‘ŒÕ%qßC5®€òše?3tÅ[ûR|‘ƒ¿£µ>-+ÊƒÊ¿AÒ•l’ÙA\n8èqMÄEˆ€Á÷¥Œ`‘J‘M‹ïšÉ ápA¢.µ<‘î¥E\Z‘NÀHW Ğ •æE9W¶(°H¸$]8”ÒGósI­Bãd”\ZVBFjWpÔì`b˜\'JzƒŠp^=©NTƒÚ„g\\c¥Jâ–TËn*\0H¤÷%E3n\Z¬mÄ„T.˜’›<Œ®3L*6f›4ùAëTRâãyG‰ˆ\'‚i¤ZäC$À2•\rœƒ’¦*üT‹æGŒ¿,GzÅ’Şín$dòÙå”µ¡cŠÊÌË<¢ôj«¡©0JdP©’}©Ã¡©P(ßøÕ“‚ \nˆ€%©Êe*m`\"\"”~´`‘É¦·}ª˜>\nZ¯·\rŸZœò¦£o»Å\'°!ËĞQUd05i\0$}*¼«œÑĞH¦:á4pA©\\ğ\r$c­+.ÖZYy£ †RÈÔ\nÚ;ÇRH)Â¨C€§\nAN˜\n)Ô”´QN‚”PÒŠ)q@KH)qLBŠQH;­áØ¼İZ%>£ùÖïŒdm‰û±ŸÔÿ\0õ«Ã“Ço©,²*Iüi5›»GS’u1ˆ°Cg<úë®›J(ÏíÜĞ„ªÇ+œwíVV@§*§¸İŠÂûUÙ@¡ã\\t;IÇëIç^·n?İEÒ¦èßÚ+Ì·½I¹€ç 5Ïƒ)Îë‰Û>²ü©R†Ëö˜ŸçEÑ<æçÌd‘D}É\"©5ı¾Ç†)’Uãk)Î*€†00\0öZ_-@?*¯±-—fÕƒI\n4LÑƒ–	Í\\:úª¨ŠÊCìÁ©¬€\0è)\nÚ&öØÕ_İõ±)õ2“ı*95İQØl’Ç|FN3Yô¹úQÎÂì¼u­Pñö½£¸X×úƒUâêI<Ç¼¹\'ĞIúTY÷£>ôs±µÄŒ¸yeqşÔ„ÿ\03P6ÑÚ¡G ¡ˆƒlHõ©”›Z‚E)09ªÂ>NOëW¥UdmçŠÌ´ ¦•ÇOÊ±¿½H±0ËSêŒb´âÏ’¿JÌ§ú‘Tˆcp}h§bŠ«ŠÌàÀçÚ›\"üÂœœT¸9¯8è)®VíJ½Á­EGÆqúÖk#­Âàg#œUµ¸”pPÿ\0ßU´6E½º*½ÎàvõïA¸”õdÿ\0À©¥¤˜üÊWñª–ÂKRUL&j0ÿ\0[Còt¦2`ƒXÉhRz’¨Ü½*_œJ´•\0²x\'¥$\0¥o”CNš]¼s@óQEø«!~j`]²úÒcD f£_õ¸=ªÊÔ2!Y™ ã¤d`Ó—S¶ñÒ€\"‘~J ^3RÈ¸\"ˆF)0Dn1%2QÈ8©¤¼¦Ê)‚)Ü\"ƒ˜èÃš¾›\nô¨&\\[¶FF*X®#T‡ü+H$Ú˜íU¦#Î@3î;TæêoÈÿ\0…WvV}ê^ÕRÑ	(ıã\nn?xEIÑ¥”|ÀÖC tù©TqHã+DD•¤Æ4¼w¦¸â~Y>´éO `½êb*AÀ¦J~aïG@ê 8*}é’ıü\nwÉNi-€…Ö©7nL1Uî•‚†VÇ=j|Z·˜C|Øık>k2¹nZ.Iê\0íH’¬¨J‚\0õ¨#`ÖÌPsÏXÈdˆ¶>SÀÏµ	» kBÈéNÌÒƒ]ØÍ’\nx¦\nzÕˆpñH<\nb\npKŠ\01J)E(À)E\0qJ\0)ÔKh\0Å Râ˜,×ãÚ­Npç&«Xñr>† ×7nY‡#85iÙÔµ½GSHfˆuqù×?€z†?V4à±çıXüI4¹ĞìÍ¦¼zÈ¿0ê6àğàÖk\\ØÂ€}±Î=jœ²C5â:æ8Èûƒ¥%RîÄÍ8«›ÃP„¾cÜŠœŞX¯ü½nÿ\0u\r`M\"ÂÉº2á“=qŞœ—–ƒïÀšD™j\rê³©X9ú Ö›ı£nQc•‚ã«ı\rf}ºÄcl$óW\"º´xdeRW-Ç½%Q0ph“ûZ,àZ1úÉÿ\0Ö§6¢Ë·m¬0ÈÎãıjKËdË·9Å:k˜ƒæ<¾áÇnió¢y]®IöëÆû–±¯ü?Î—ÏÔß¢ªÿ\0ÀJ°5 ?Öş•%®¡kpÁC$àf§Ú!ò2‹E©Ê6´¬öİŠ³OÇ9aZÁ#Æ*Ğ|r*”®+ÆªM•làŸ¡«„Ti·±şùÓáÒ‚T\n~*XF\Z˜V•¿ú‘YÕ¥mş U\"îh¥Ç½hTái¸ÀÍJ¸+šá6\"‘0èŞõ\"†–C÷>´&kXlÊü¿çŞœ£9âŒğE=Z©l Aòô¦É÷À§G¥5ÕˆÈíX½†H˜â–eÊ«z\ZHÆ\0©o‡|T‘`fœGÊM1>îOJœ.WLì\0f£+™:Ôƒw9ÆV)= Ç¦:eØv©‚ñšB1\'ÔP€‚/•Šš°¢™·çÎ*Ni€„g¯Zj¡O oóOaózv¸J6È=é]sƒRH»—42(H.@W10ö©\n\r£Ò˜¹1¿­OŒŒûUSFÈ6ô ÚGùëS08¦²äfª{_\Zs®å§ª‚¢ÀmúVV»(ÙŠdX«2/¢UˆIXi‘Ê¹ÚGcI 9©ÂîS\\p\r\nİG\'1ƒÜT¬}éG–h°Êû°i$Lvæ¤µœ“DUØ6U•âe\0ç·U\"w´)\"’]yÈ®Â0<¥úR=*ıŠÜ^Ğå#C¬h«ÀQĞS b±Œp9Åu…G¥3Ë_îÊŸ³9Íy†œ²×Eå\'÷GåIå\'÷åMBÂæ1’Lõ«1ŒÕÿ\0)3÷ò¦H€€U…r\0´ìS±KŠ`&)E§b€\n\\Râ”\n\0RâN Å8\n(ÀNô´¸¥Å\0Oeÿ\0#éMÖ†$tÇó§Yô•§jë”o şb©ü$õ9x¯b–A\Z†Éõf³ã]·1ı¥hVe™²ŒÈÀuúÔ‘¹\0(éVÓL–ãç Ş x	ÌL2Aê+=S6÷d¬Éï~í¹õOëTø,q‘øÕÛğE½©ÿ\0dÿ\0:§“Õ†?\nSÜ)ü ~÷üêõ“nµº<\'õG’FG~8«Ö(D7@ùd{S€å±$*zlÿ\0\Z³6H´ëÈş¦«ÂÅëåŸæjÙL­‘ü?Z¤·!ìŠ£\\ÕÍ?&î>9Ï¥UT%±üñÒ¶­4»”t“bì6r+8¦Ù¤šHØÃäzœTR•ş•Ñ•™¤T2jÁµL\rKùª:–!óP€›½hÚÿ\0¨¬ò9­+1ûŠ´CE:Šb¹Á†ÏèŸ´Ò§p ü’‚p³riÜã½*Œ\ZIyÙõ§\nÒ&8Í(?1Å\nrcsUKa\nÓõ§²îN)¬ÜúS¡9ê+ ÁÅXP1PmYZ£+;Š0jtSÇš‘}h°\rÿ\0–´²A¤ÿ\0–¼Óßš}\0‘PS$GAŠ|dì²®všÀ1—Ò€xÇzqæ˜ß,€ãµ6~œË¥7?.E*¶ä4!‹Œ‚)‹¤T‹È¨E !BCÈ§Ò¬”JŒà1=È©SæAôª§»!\\b“¾*F\\…Å4®{\0À>Z3Ú”Šiâ²`9²À\Zˆœb¥V$`Ô2§4=u<T.O#Ş¥Sš†_õ€{T¡0ÍBücS7 ›îÓ¸ÊîMcŸ1½1PÉÁ©¬ïØ{Sâ{Ñİ¯Ò—‘ÿ\0«_¥)®ƒ1¤RbHh”bŠLPqMqRb˜â€!Å§‘IŠ\0n)iØ¥Ç4\0€Râ—¸ Å¥Š\0JQKŠ^ôÀLRâ”\nZ\0šÈ¥-Mª/ÊßAüÅEgÿ\0IZrØË¨LğDm™ÆqÜU[İ!îyş1<ïUÒ8ªÒ![”SÔ>\rZaÅd¶4{ˆšÅºùq”Ú=W5]ŞIå2±\'PW/Špo—­dÛ¹¼R±jù3ajßïåT6cĞŒôÍk\\®í*××{åTrG\0zª‹Ş&—Â3` <úš½§¥Ârİê¯|ÇÖ´4Ä¥÷‰ûûQMjTö+˜³¿8ıÙçñ5l§Ëeşş?QL6ğÓkqÿ\05k‚Í¹ÿ\0[ıEh—¼ÌßÂPXÈsƒÈ5·g©Ü0HŠ!Pçâ¨*1³ÉÜpsVmT‰”`õæ²‹išI&|TRô¥XPL>÷Ò·‰ÌÌÒ*	jÁ¨%ª!ÅMZ„TñuÙ1¥d3	¬ãZV?êi6IŠ)ØúÑNÌW8.p3HÃ8>”Šp4ãÈ®ÑĞ9ÎDyç‘RŸ…BÇäO÷…MŸ”}*éƒœŠP{¹ÿ\0\Zh£ \Z¹l\"\\ñÓµ69pE(Ïzd’m9b1eÊÈqšµÈ5Vb$ŒSÁş¬RaĞF˜æ¥*)ÎÙúŠ’6PŠåÅ8Å\rA—vå§ĞÇ÷)ò}Áõ¦DÙLúR»ô¡M8Ü(ŞJBy¦ƒ§\0}jº9lÔ¡†ÎOJ\n§¦8ıèÏqJ®	Í6fù—†5ø|v©S0jsR©ıØÂ®)?*š‹£Ó·|«P³mqN{	`<ÌÒ1¢S¤\nF?/À7Ö¢Ÿ8Í8ö>”ç\0®z¨#qQÌ~e8¥ÎÓÕ¬yö©jyCR9ÅDÜŒÓ^RvŠ—Nÿ\0“é¶¢›§.ŸŸ´÷j£¸Ç@Ÿê×êlê×éN5¹˜””\ZJ\0J(Í%\0-1©ÔÖ QŠ\\Q@(¥¢˜)qKÅ/\0˜¥ÇRĞŠ\\QKL\0RĞ)qÍ%´ÿ\0¤úÕûÆd‘Ê’—ÔU+Aş•Ö¯j+†úæ•h–„Ks†—ş>ıú¶İ*´ãı!ë§õ«DV5d§=)è‡®8íÅ\0ç<zNş‚¶k;jn¶.N3£ÛŸI_ù\n¢pzÕ«©<¯G\'Lzı+M4ŒqŸJÚPrfP’H×ØF	ı+KM ÎGrÛØ×:·R$EHÜİ²+OA’Y/ÈsÆÆÀü\r8Rw	Ô\\¥ÎV|·ó«@fÚÜÿ\0Ó_ğ¬¹]Å…^¬Ï“¥Y„ÈÖLİ|óŸÒ´Tß1›ŸºXeÛpø9«V˜2½kò[ƒ{0\09\0­>ÈÜÛL’*³c’=j¹£ª­c³ÅWœrßJf™4ÓÅ#L¬óÃµM8äÿ\0»M+;^æKµ\rÌ’ßK¶Bç¶ËÍT’F.ª¤\nCLˆ\n–!óSEIŞ¡&ÅhØ}ÃT+FÃî\Z¸™È›&ŠuDp·ÔŒIN*3‚ïRV¼ó¨&5ÿ\0xTùù\n­ĞşĞ©Í]=„É—¦	§ƒòŸj…y§n3Vö]Å€äS1±E„¯J~d5Çb8NT­[·8âªEÃb¬!ñK`d·#*¦’3K?1­Œ\n¡t%4¿)£€¥r3ô¦€\"â>(ñL€ü¼ÓÛÖ’Ü-ƒR1åqP0Û.©İ¤ÕBš\0¼R)É§F0XÕ-Ä\" E¡€ÊÒ·\\R1‡£m„ĞÓÕ¾@ ¢T	Ç4ˆ?t¿J¨Şà8”f£“ï}*AÀÉyç°!ùİ¥FĞEGÜôüü¿d†ÆA¥sº?qGzh<B~|Q\'ô¤”bE49ù!‘71ŒÔ%ªBß)	¦ÀŠc•éRXß~œ‚*M?‹ŒgµTwC ıPúR“Iú±Jkbæ“4´”\0Iš( 4„ÒĞzP8¢‚))€ìÑšJQ@ QE\0:–›J(Ôf’—˜\n)ÔÑNšÓş>ãúÖ†¤>r?é‘şUBĞ¥Gõ­=@0Ïx›ÿ\0A5´63–çr1uÿ\0m?­Z\" ½]·Î1ÒoëSÖ5c~]Şøô¡”ãÎ)Bdä‘ÓÖ˜îBí\nÇZÎÚaúüŠÄÓåVôm6ÚöÙKF7Öª_ø¤e>“¯ò©¼5ª[ÀVŸfGSÀ®«jrô:ü=e˜ÔşjßI¶¶™Z8Ôã§­[ŠXØnWzƒN.¦D‡ŞÎ©nCØ§—lRD1©ÈvñÓ RÉcv³ Œb6¼tâ®BàŸúéı2á×ÈºätÊ«¨‹ƒO¶c»Ê\\IÅZÖŒ~í*ƒÏ@9aR¥Ü[0d_Î“°k`¼…>Ã•^PŠÂœr~•¯{t^ÊD¶d2cqã­b¸bDñª:«d\ZÍî_MLöÔ*Ë}ãUæéR4AŒ\Z|_zšİ©ñ}úCeŒsZ:xÊšÏ\'šĞÓQZDÊE¢Š~(ªæ@¼TÊ¸¢j@x¼ã¨tŠ0>¢”ş¯¯qJFqZCaÀÅ!_–…8»Tö1xâ¬Ç÷j´d\"¬\'±\ZJAæ§Æ\nµC +6}y©	Ìt†Y”fG5dñšr$XñLPvóUĞ’gŞ•\0+Lsû®´å8QÏZu4é8P})#å6SÆ)ˆ2\n‘†TëLŒ¦¤È*E\0*ışM?£ñÜT!ÆáRïéÏJwOJkŸ“ñ§¹â¡“¢[‰Wğ¦ ù{SA!zâ–2BúUÃpcÿ\0ƒ¥2^ßZ“8\\TRò>•SØâDsÅJ\rB˜Ü©?¯jÅ\rˆG4Œ9#4¬MG#`)¡îrƒ·>”Âµ#æ£cÇã+ÿ\0T™Ãıj	Ÿ@\"Z}ÿ\0JÇ±¨›<úS¬ú_àj£¸™ÒÇş­~”´Ø³å-8Öä\r4”i)\0QIK@/jLÒçŠC\Zi3A¤¦–›KEÂÃ±E §SNÑN\\,´\np\"‹…„§qIÅ;Šw‰mp.cúÕıNæ8dW#pòÈÀõÁ¬¸ä/Ê~eæ§iCıõ®2²!Æç/w)–íå8\r&îŞ¹©~ÔÕÿ\0ïšß0Û7X—ò¦ı’Ôÿ\0Ë1Sb®`´é–ÿ\0¾MBó†L+ìk£:m«ëOƒDµP ‘Ÿz;²½«HÅ¸ü8ëûÔ5‘a¨›kR‚“´îâ»MgMŠÇH¸‚\"Jù‹×ñ¯?‚]’¾[i­%£&\Z«š«%ÃĞÚÈ3Ù7üê÷†ã¹ş×I\nH>~ZÌöTYÛó­ÿ\0Üîå20É`ß¨«„®Éš²-HÚ¡³S\Z°s;	3éŠ™a¿m4ï`Hù®+h\\YÂ·>dÑ…2q–¢¡›Q±6³¼r£#\0€¯#v§S=lg\\é:¬×’:ÎEÉqéSÃá›™pd½p	«—>%Ó­$ŒÅí )ëRÚxŠÚé7D’îCi¹˜û_\rÇop²­Ë\0\n°ÎO­Kh-Êá·U/<L¶ÒÖİŠ–ûØéM7²]Ì¥øSà¾•]@Ï¼j´İ*ÔŸxıj´ı+1¢ŠXşø¦œ\Z|c÷‚‚‹X­\r8rj{O`¥³W)ñE\'˜´Uyj¶sS)â¡O¾A©3é^yÔJç÷.FEDíûª~ÿ\0j¸(è>ŸáJ…Fäë@sŠ§°\"HÆÔÃƒÅW›<Š›&²ö$àã¥*sQ³\0 “Çzzà:\Z@M §Õ9ôGÆNF\r64ùÜ“Şš½¬\"V$GÓ4g€{SKªäÅ0J„u¤µ	¦ËØT)4jr\\~tIq/29!’JUª«y¿•=nsÏåNÀ?næ¤?wŞ«½Ò0¦š×YƒE€ºzL#*EWdÆ2¼ŠAryÊóõ¢Â-+‡Üu¤V!ŸJ¤“‘»å8\'Ö¡Y¦ÁÏLñô«€jîâüÀÖq–cÔÓâ–UÎOZ§¨£êWĞÔ¹†k<I!$nÇ4!ãy¬ì2û0ÍFÄ0ëTÎãÕ›ó¦œãïÎ†€´YGCP³¨xT{S\nt¤ĞÇI*ğCƒPÉ2g…\réŠcÆ(°	æ¡CóQc\"›À¡¦ì¥·M³‚85hLéâÿ\0T¿JST#‘Ä`o<P]ñÎ´¹.’=i¥€î*‘$÷?4Ò¸<Åõy«ıáT±F(oÎAüT}¥1ŒŸÊª~4 qHhL‡ø…(u#¨ªx¤Å1—Á´ ÕŸzpfşt|\ZuQYdÅO¿µ;pu§\n©ö–şè§­×ªĞ¡KÅWKèiât=è\\Râ£Fqó\npt=PÀ´€Z\\ûÓ¢”\Zh§\n`.jö—ÿ\0b¨Õı(ÿ\0¥Šº{‘=…ñ(&ÊãßZò¶Oß?Ö½c_e½Êä}å5æRéîÒÈHÎO5¤–¢ƒ´J»sZş`5knyó:U¦Ì:ùÖ¯‡­¦S„ºŸ–A’E8+0œ®‹WX]4óÒñ¿•>ËØ/×+üKyfÏe2íä^üÁ©,í^=téûåoçZÛS;ègk³EöùÔ7Î%É«Ú5ã-¹+m,¹bAARjVkÙŸåÜ{Tš}˜¶ˆ ¹p38¬ÜQ¢Å\rF{–»ÜmæOİà‡\\`Öº›8n\"†<.<©ŸÆ«ı’	£1É3²·Qš¶Œ‹,pÅ&äT<MM´w(M2¤Å5àSÊšÜUykì@V‹ûÁMcNŒşñis½K˜ÁëPçæ¥šv!¢Ï›ïEW¢Ã•x×\'ÌÜªGõ¹oîÖ1ÔåÎåµ|vÏ¡m#M\n».ÒzŠäq6¹mîÄFßÖÜHOšGÉNÛU¸¢iv‘ÅK(|’¥ŠP´úÉ¾Ğç€@ü)wÊN|ÃQ(©@¨K¾Ò7iÛŸnÒÇó¦ãŠUé\0åô,ß*·$dşt ë@$Õ \0ı)ŠwğÑÀ\0f€>Ôçbš®€ıáHò§÷…+\0ìĞS†D&Cßô¥/£~Tì„óAT^a\'„cŸj“sÄm@\\“°¤Æ2i	—GúÓ›å_Î‚ä€|”Ç4Ğ³¨ü)9HåÇåM!b”‚\'Ç2ÀR9‘¿:mh©§ãµ\ZÀ¹ä±üj_³§¥M‡q„QùÓX¯0©<”Â)LKQ`+yˆ?ˆSL‰3ùU’ƒ(Ú6Ğ/0g…oÊ˜ÌOHŞ®ìæšR‹D™ü²?‰§B%ó‡îÀüjÑJtIûÁT‰ãI\nº)|¹=GåV~QNÛT\"§”ÿ\0ßı(òO÷Í[Ø)v\n@SòvoÎ\0÷?]Ø=)v/¥\0Rû:á¤û0Ç‡ãW¶-.ÁE†g}AÒCIåÌ;©ü+GË¤ÙNÁr†&ÀãFçcoÂ¯ùt_µ+Ê\"UU‡áNÆ{â®ycÒƒª)Ø\nÁ”ôaùÓÀÏCRHÏğŠoØĞtÈú\Z,\0´í´ß²°é#\n<©ÇI3õX.;e]3ı%{)¥óezø\Z,+’=‰§aû;Æ¢JÍÂ.â=ÈúŠvQüdÔ¥õ¸ˆôqR	ô`\Zv’	$ô[°ãŸqLñØÕ â¬Z¸ó…TR¹2Ø‹S¸ºå˜ÆBöç­e²)wØ{äp+¤¼ÛäNØû¸®pÌ	lò:V’!W•Ùau8ş\"p§ñ5=šêQŞÄîöí`[kqOùEüª{(cš`cĞĞ·G,ÚØl²ãiñœÒ\rZâ->_:Ó÷\"»sÍiIb©¼¬˜ÚØà}j¬¶ \'Í}«Õw«»¹#^[†&[ú“š°/ oàaìEL«w,kå”QÀ*§ùŠ_´Ìƒ\riÿ\0Û ?•@ÁsîE\\ÓŒ-pZ6,v÷¬›—i°·1è ÿ\0I¦NĞÜ3W ¨sIÖ7Ö«Lhk¼±%j´÷#o\nkT)Æ)É5j›\\Š|7+æ®}i«Ş—›<0§_QA$œQLŞ=h -6!Âı\r\\…‚ \\1÷ÅN9G Ï0ì8F§ùæj\\\r¦”p)Äÿ\0ëJ<ŞÊ£ñ©@Í(\n`B¾nì|µ YIûËùR¯ŞÍJ½j\0’@@ó?!J\"l¬4ó÷©øâ€\\d»Æú·çS…¤ú\0ß!6÷?8C>è§àm¥^\05b@~è¥(¸û£ò¥šyé@\\@&3M#–€Lr*AŒS(<°£Îˆ7.¿CÈ¤#å¨Úæ~ø İE	?A@Å\0{TíqÂ9ü)åÊñÓ@ZÇÅWó§#ˆâhfº=#Qõ5M°¢ŸØÕU[²: §ˆ.æ`>‚¦ÀMŠNµÙd?záÿ\0\nQd1Ì\ZCÄâšÒÆ£—QøÓ>ÃFC©§}\0?ÕƒNÀFn`\0şğTFöÑ‰ú\n´-âQÄkùRˆĞtP?\n\0¢×©Ùı,W.Ò\r¶ò~\"®éN‰~qNÂ%¸*1>¦‡’ì#‡5mGËKŠ«ÎûlÉş²/éO]F?âVx®zŠ­âqÌkùQ`#KØøÀúñS¬ŠßuªÏ§@İ_¡¨[Leæ9¥š@ÑšËòo¢û¬X}sHo.âÿ\0Y~£X.kfŒÖbj£øã#éS¦£nı_i÷À»Å8P$ñ8ùdSøÔ€ÒÇàRíÜÒæ‚ã±FÚnM.h°\\]´m£4¹¢Áq6Rl”úZ,+‘y#9”ÛÕAü*eå…hE\Z4ñ«)ÁûØôªŒn&ìb=œgøDlcìú\ZĞ¹”G;ª¨4Ï0w4±÷dqS[C:L—?Z³æGRDñ«ƒ([‰ì-è¹ûÖ0NsÉ0%eOU®Îr²YÜí ŒÇÖ²-bËäZKrVÆ`•å¬ç+ëŠ–ÊşÛí{JÈ„‘Œ­tQìß¥GöRÒê‡Ş…kƒ¸üÀÏ8$}àyühU„‰W•ÏZ ‹|§h?­@`„o9ÀÛ\r_RIü¨Ø)îT*’8ÅQ* «½·Ê¡72¨ıÜ‡ñ©kQ£R[dxJÌª¸Q×í¹‹‚)	ºR8¥î2\'‡æ5Á‘CÏp®sizGŞ‰ª,UÄ6¹¥KL0\"uaR%ì‡Ï¨§Ê+6ÍíHmŸÒ§1?:H§£ÎP¹Sì¯ıÚ*îáE.P¹çâÁÀ§•Îj;øM/aMÏğ) ´¢\nxªÑŒÔŠ) `ÓÀ¨°Æõjv¦(É©“LCİ¡E8–‘E0Ú”\nANê(@\"Šv0(AÅ8Š\0f2iÅA\\iBÓˆâ‹Uì#~T•5VK£l¸JÕPsN4Äsû[¡Ş¬¥óÆ>eVLV«AıåªÏ¦£‘¶ŸCJÁq#¿†O½ò}jÜe]r¬ö¬i¬§‹øwQQFòE÷ISM\\gBŠ]¹¬ˆµ)QpøaWaÔ¡re½0-•Æ1KƒH$Gû¬ö5\'1KŒ\nv:R0â€ŒĞGğ)R2)\nÔ˜¦‘Å\0FG±)“;GQÀV\\‰<Ÿ4lû¢¨LèU×oŞ»‡¨¬´¹\n?vÿ\0•)·¹Àÿ\0‘§¨®oäzÑ‘ëX+¡ü2~´ºÎ?yúĞ;£ ¥ÅR³´‘0óHÄÿ\0wu^¦b‚)ÜRP\"·‰şôj\nôÛvè\nı\r]¢€2ßI?òÎ_ÌTc¾‹î9?F­ŠZ`c}¦ş¼¤u§¦­ âH‡àk_Æ†7ûÑ©úŠA©I5X[ï_Â¬%í»ô”~<R6ŸnÇı^>†¡}&3÷‡×š\0¼®­Ñú\Zx¬ƒ¥ÎœÇ ?)<½B…Ïãš`lŠZÆ÷q}õÏÔb¥M_~/ÈĞº}áZvãı*­sÑê¶ìFw/ÔVåÔ2İÀƒ’;ÕÃr$P¿P·rmêµ. ÀŞI‚:ÿ\0J‹5/rm÷¥ÛIšQH®…ë—Oº`3•V´^õn×>èÿ\0²ëYÃ+Ğ‘VÈF‰.\0Æ˜$”Ê£ÔÕec·–5,G÷Š}èLmÎX¤§?òĞZbC&G9Î¥”ed’gùÓT~êAî*ï©6Ğâ<ÍŸaüª4\rÈ«æ~ùPzÔ9jRZæŒ}iûiÂõ)‰¢œ‰óõ¦²õa‡=)ÒL(İPÂšm\",?v*Î)@ª±²„„}\r7ì)Ù˜Uü\nƒ@™Cì_ôĞÑZ(¦#ÏiÀb€2)ø®Cq|¦¤Å4R/Jh\0JSE:¨@¼ÒKHQš‘)¸À§\'JCİ(ZVì)WŠbbœ”îÔ\0«ÒH½)Ç¥\0\0QÚK@\n)ÂRŠ\0Zµ(´\0„Tom£æAŸZ—½*Õ 3¥Ò‰ñìj‹ÙÍ|Êqê+ íJ1ÈwI>Ve>Çr=Jhøb{Ö£ÙA)%ê8ªSi$dÆÙö56É¡Õ!¿”>õmeA•pG±¬	m¦‡ï!ø¨w²«}¨¨¤jÂ‡R>¬{Õ¸õx›E+ïÔQq—Í!¦Gs¿rE?IÅiS;…)/¨+Ò–š½)ÔÄ´”PÑE3EP ¢Š)€´RRÒhQL¢“#ÖÈ‹Õ€úš\0}]ï­“¬«ø\ZµkeèXı\0h`ZÀÿ\0z%ü«9µ•ş‰úšµyÛî¢Ö3@é–ìÜe~†´ôİ0hÛ•“£‚+š·’	ümiBñµf;ñ¼g&´…îD¬eø‚Îxõ[†ÔÂ³EíÔ\'i?^kS]Òå›W€„§¾jºè§ø¥€©{”ˆX¸SóoÂ­G­ƒñô4õÒ-ÇŞfj°š}ªt\'ÜÔ—rı¡š]Ó|À\r½G½E©/(Ù«ÅzTÁQFY{UAÇAW\"\"?¥KbEúÔÍIúåúÔ­Êe¦nãÿ\0\ZÄr}j<ğ}ŞŸ‘Î{Õõ$%?¼ü\ny¦Ês!æ¥„½2j}	šnhÍLi4Æ¡4Æ4ì  i¹ i6jH†MEš–.´Ñ,—eìÑUaWgtsóv>µ|t®u[hpkZÎìJ¡áÇë\\Hè.ãå4ğ1GğÓ…RNŠQÖ˜\n(šZP)\0cÒ£Şôñ@çáM=E8PÔêi½¨ËO\'L^”æ<P…æR´ÀwjQÒ’Ú€Rw£¥€ô£¥7Öœ(@;µ­\'jPj€p<ÒÓ§v¤\0yÕZk%ê€QÅXíFy FLÚ91>}gMk<$î€õ®¢ŒŒ\Z\0ãòÊr85fFæîÍnM§ÛMÕ\0>«ÅgÍ¢‘“€û\Z,;„ZÚ%Œu«Ğß[Í÷dô<VöSÃ÷ãlzÕqÃt¥ªª0#ƒRW)oy4Cänµz=fAş±AÜU\\FîE‡­e®­lT–b=ˆ¨Ÿ[·åWoÂ‹ÆÎikŸmxÿ\0?™¨[\\ºoº~\\›4…±\\©Ôodÿ\0–¬>ƒogÿ\0­øšzŠèê\Zx“ï:©¨QµN³)úsXi¦^?XÈúš°š$Çï:\n,/>µl¿ws}@ÚèşOâiSCA÷å\'è*Âi6«Ô3}M;Ê-¬ÎßuTfşöNŒGĞVÚY[\'HWñæ¦TUûªĞQd-Nx%üßóÔşu*iwnrË©­ú(tgş)}*uÑ¢zF5¥KL,S]2Ù€Ÿ©©ÖÖéşU-\0*¨#\0¥^†O.doJ¤:Ô¬~ZhL¯rÛ§sêi½©®y¥)CE/\0ò3CqHeèÿ\0ä6¼¸úÕ,Õ¸}†á}‡óªuLHp#$-ûÕúÔ5$\'-1o”ÿ\0¿Jî›ëLÏÿ\0j”cË#ıª¢BSûÖ©cŸj€A&<ÖúĞ¦¥”\\\rFiªx ‘IÆ“Í5Í1ª„.x¤Úp<Ğ•4&«ƒSDyªD²ÎMÜûÑLGzS‘ˆpTàŠfiW­qíØ6±ÃÖ®ŠæQÊ0e8\"·l¯á9áÇQMpRâ€iEX\0§RQÚ¤ñLú\0N¦¢š(\0êJ;µ0zS³Òš)ÄPšp¦´á@…¥Íu 4Phí@\0iÃ¥\'j$qM\0ê)0ÔsLÅ;µ6œzR\0™æ—‚€ô¤íKŠ1@	F)ÀQ@Æc=ª¼º}¼ßz0¨â­ĞiˆÆ›Dà˜eü\Z¨&óÌ ¦G®x®›¡p(Má¾ó*ş5<zÏÏ7ä+l\n1@©¢Û/ŞÜßXM:Ñ:D§ëÍ[Çbš¬\'İGĞT€Râ—À\0¥£PŠ\\QE\0´Q@-%-1Fi)h\0Í-%-\0+ıÊŠ¤¹LEb3J)h¤1­IŠyô¤Ú}(ñä#QMØsJ8œ;Ó‚1ëNTÃ;RÒŠRIù¥ÚpãŞ—?7áN\'šd1nlç«sÅ*)â•‡qÜR7¼ÓXĞ„Gši4ãL4À)@æ›Nš`>¦Š¡¦¸¦‰d´RîU“sÆ\\8<P©©ÙËdQY]8®&„ÇnâŸ¯«¡Á	<R©$p(C:{+´¹=ulW)’Ã u8\"º+K¡q#‡QéLc­)¤QK@€SûR\nSÖ€§RRĞ\0)ÔÑKŞ€)Æ\n^´P)h PJ:ÑŠ\0¦¢ƒ@	ĞS—§Z1I·š`?4†˜ÀÒ€hô´”´\0J\'z\\PKE\0RS»RP\0(£¥€\n\\QE0RQ@Fh¢€Š(¦Í-fESh¤¥ –’–€\nZJ(ii( ©îTb¤?v˜ˆ@â——o¡¤ÃQ`qÒ”ši8íH[(¾´üT`Ó³@¥SA§Læ4âzÔc©§†\np4ÁÒ–Í!jm!4ÀnsHh¦“@Âœ*•Pe˜­@úŒ)Ğî>Ô5*0­b6¨Í÷­ ¹’AËŸÂ©\"Y½½}E‡¸ÿ\0xştUò“s e ŒƒXö†ŞR@ùO\"º *;‹u¸„¡ëØúW¹É“Å:2BÓî\"h\\£`Õ|±ö {–7ûŠ’³o(d~}=jÜM*Z\0ëìo#»„2{JµÖ¸ûK—´˜:¨õ®ªÒê;¨ƒ¡úJC,-!¥Ä8P(¥\0S…6œ(iÔŞô´Àp4áMê\0)E%(4\0´t£4P…˜¥\0wæ”c¥”ÀQïNãÒ›K@hÒS¨\0 \n( íIŞ–ŒP\0(¥¤¦ŠZ( P)h1F(\'šZ`–’–˜‚Š)h\0¢ŠZ@bŠ)€QE-\0¹¢ŒP £P(GZ˜¡ò·v¨*õ¹ß!ªBeJ)ê0ÄQ´\ZFFi6\n—aìi67¥\"Û@¤ ¢’€Èê)ÀÒâŒSƒ©¥=)§©¨$»†!óH>”hSÔdÜÖDšº/©o¯N]ZåË…Ôê¦³÷¼lÍfKyË‚}¹¬5‰Wl“HËèXâ¢ß¹M$ŸPº5eÕÆv„ûš¥.¥<höPšANÂ¹#HïËO½*“K/!Â©?AWaÓ%o¼z«YjÜ1–\0ÕØ´Ø“–%hE\"áP\ni’Ì¿\"Oî·åElóE>blqô¢’–¸Î£?T²ÄdAó¨çŞ¹Öd\ZìëV²òŸÍAò7èiî-ŒŒRãÖƒ@æ¤bæ­YŞ=¤Á×‘üKëU)ÔÙ[Ü%ÄK\"ƒSŠälïÎ@Ã”?yk©¶;ˆ–D9„ÆOJ)8Su¥”¢˜š\\Òt¥ êh¥\0´¢š)Ø Å/z;P(ê)¥¦1h‚–€–“ ¥Í0RÓsJ(ii(È –“4´À(£´\0QE AKF)@ £¸¥Å\06”\Z]´»i€h§m¤æ€\n1KE\0%-PEb€\nZJZ-”PÕ«VäŠ«Vâ\0G¸uQ#q‰[ëIšG3néPËuC.ê¿SCe\"À<Ræ²dÖí“…%Ï°ªrk²7ú¸ÀúœÑp±Ñî^õ^âêŞ1ó:ƒõ®^mJæn¤gû¼S$r@ã©ÂAòòÕêrI.+*ÜÕ&â&àsüêÒDÜ»\"´ü´ÏlñPµ“c(Àû\Z<\Z³LØ\0Â­!3-­eQ’„ı*&R®–;	ˆÎßÎ•ôô8óW\'ÜPÒ$åÌeº\n–+)¤*]\"ÙÃİŒgéR`\n€0¢ÑÜó#ì*äztÿ\0ãïWˆ¦šC°Å@£\n jx<ÑJ4 *UéQR â¨L^h¥À¢`§\nm8W)Ğ8Se‰fŒ£¥ê\0å/mZÚb¤qØúÕZë/­ê?Œt5ËKFåX`ƒCÔ^C;Ğ4‚—¥ *Ş|ördr„üËTÎM(¢Ã¹ÛÁp“Äj`kÓïŞÎQ“˜ÏŞZê 9ã{Ğ€”šp¦õ¥À^ô¸¤¥˜\n\r-QaNÚQE€ZZAE0J\r%-\0-(”¢€Š)q@\r&Œç½;Ào4 SöÒ… 4áOJP1J?–€¶”-:i€˜¸ Q@´PEPF)i4\0”RÑŠ\0JZ(â€\n1LiQY€æ©Ë«ÙÅÖu>ËÍ+ /ÑXSx!şª&osÅP—_»“îmAì2h¸Y`;Õyoí¡ûó >™®:[Û™¹yœLÔ9 WGU.¿l™ØÏ°Å$:ü²£ÑWëÍrù«Óyoìi¡2ìº•ÜŒÊÒ½T¹\',I>æ’`D¥‡CL\0š«„¹”ğ¼\ZtVÒÊ~DcøUøt[‰H.sNÄ¶ŒåÈZ™7‚·\"ÑbCó¹o§~+;x¾ìC>§šz\nìÀ³²O»Â´×D‘°ÌÁqØsZñ¨*`x§qX«m§Ûª‚AcïWã‰|ªÒ¡#çøMYZiÜŒÓ¶«.¤QOÅP23m˜úU+˜D`ä\ZÒ¨^Ÿ˜Òb(šNô­LÎ*>”LÍ8\Zb$¥N•\ZŠ³n U%rXÊ*ÿ\0Ø$şí|Œ›£Î‡Zp4Q\\GHáN¢Š\0QY\ZÍ´~X˜6p}è¢…¸=Œ\"1I“E\0™¥Ïz(¤ö«úUì°\\,c”s‚3E†±E8QER¹éFh¢€FO­PóëOQLRŠ( BÒŠ(¦1Ô qE€QOÇZ(¦í½(¢€ÑE\0(éKEĞEP„-QHQE1†)h¢€\nJ( AÖŠ( 5ÈTŠ(¤ÆŒkİrH¢B¹õ-Ysk7²ñæìû£QHrĞ£$ÒÈrò3}Nj2h¢†@¹¥<QE0\n(¢€MOA˜ÑEi˜™¿k£Åqnäo ¡™kâ ÇÕ¹¢Š¢[ª>P\0öáÒŠ)àx¢ŠbdÑô©€¢Šb´	qØÔê1EH	Pæ¥^”QT&)¬«¢LÆŠ)0+\Zaè¢¤\0sOš(¦&MZĞ„\0Îh¢®$HÓŞh¢Šè2?ÿÙ',70,0,15,'A');
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
  `condominio_id` int(11) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_50` (`condominio_id`),
  CONSTRAINT `fk_relationship_50` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `car_id` int(11) NOT NULL,
  `tipo_inmueble_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`car_id`,`tipo_inmueble_id`),
  KEY `fk_relationship_5` (`tipo_inmueble_id`),
  CONSTRAINT `fk_relationship_4` FOREIGN KEY (`car_id`) REFERENCES `caraceristicas_tipos_inmuebles` (`id`),
  CONSTRAINT `fk_relationship_5` FOREIGN KEY (`tipo_inmueble_id`) REFERENCES `tipos_inmuebles` (`id`)
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
  `nombre` varchar(30) NOT NULL,
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
  `junta_condominio_id` int(11) NOT NULL,
  `cargo_junta_condominio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `propietario_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`junta_condominio_id`,`cargo_junta_condominio_id`),
  KEY `fk_relationship_77` (`cargo_junta_condominio_id`),
  KEY `fk_relationship_89` (`propietario_id`),
  KEY `fk_relationship_90` (`usuario_id`),
  CONSTRAINT `fk_relationship_77` FOREIGN KEY (`cargo_junta_condominio_id`) REFERENCES `cargos_juntas_condominios` (`id`),
  CONSTRAINT `fk_relationship_78` FOREIGN KEY (`junta_condominio_id`) REFERENCES `juntas_de_condominios` (`id`),
  CONSTRAINT `fk_relationship_89` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`),
  CONSTRAINT `fk_relationship_90` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
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
  `tipo_publicaciones_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `archivo_adjunto` longblob NOT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_62` (`tipo_publicaciones_id`),
  KEY `fk_relationship_63` (`usuario_id`),
  CONSTRAINT `fk_relationship_62` FOREIGN KEY (`tipo_publicaciones_id`) REFERENCES `tipos_publicaciones` (`id`),
  CONSTRAINT `fk_relationship_63` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carteleras`
--

LOCK TABLES `carteleras` WRITE;
/*!40000 ALTER TABLE `carteleras` DISABLE KEYS */;
INSERT INTO `carteleras` VALUES (1,1,1,'Bienvenido','No se quÃ© paso el dÃ­a de la bienvenida','2014-02-08','15:00:15','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z\Z%\"2!%*+...383,7(-.+\n\n\n\r\Z4$ &,,/,,4,,,,,,4,,//,,,,/,,,4,,.,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0Â\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0A\0\0\0\0!1AQ\"aq2‘¡ğ#±ÁÑBRbr’á3‚¢²ñCS$sâÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\02\0\0\0\0\0\0\0!1AQ2aq¡ğ\"B‘±ÁÑ#áRñÿÚ\0\0\0?\0õQRœ\nµPV¦Ì´V*y*A*Y\r%SAR¦\0¥ld‡Tš´X1W)ªÛe‰ {–:UL”q´TÀà€H¦ËEº\n¤¥:‘[TRŠ³%8Z6\r%ajbÏ–éÍªG2ÅŒY¦{G¥¢¢ô5°¼jŒãlÔ£nPìµb‘T£E&šjdSN)j§¢ˆDX»Ê¨Šz\rXÉÑuæ n‰£²j›–MÒ­•¨0¢ULµm•´ËU:Ñ$Ul´E 2”¨‚”Õ,oV*ÔÖÕO²ñ¬ºZYP©MYÙxÒìKDÒÈMIE8J±ƒaHuJ°-2Ôê¶Ë#J˜šjƒT™Å4Ó¢¶TM:Ü5\"1QM°´ËíK´ªÔ\nQJÒ\ZØùéÈ¨9ÆŸ/JTÓ{\rNˆ²Õ(‚\rVŞUbbIQËW¨e¦²§¢µ«ÊRì¼hê&–m•Vv4âÕ ¨»-EÑW¨{Æ‘rZø¼(vZ½Í@Õëb‡¸3\n¬Š!–«+MbÑNZUdR©d£¡\0SŠ¬^¤n\nÌj²é¦-URš”,¦\Z©§˜Ğh6Y4¦«ÏOš…Ë	¨šŒÒš”KAMR¦¢e¦+O¨`)ÉŠl´Ä5».Ê%Â÷Ø»¨†b³á4™%¦-n‡¹ÄFr€’Df9glç`|(pŞ´ä2ƒ9IRrC\ra®‡¥QÂğ¦Õ°°XêYÌÌÆYÉêI\'q½YÄ1‹†³vëhH‘\0œÏ@>\'º&v¥sd›[›´(ğQ€ã7ï˜t`Ìk]›áÖG¯¯öÚ;—/Ú°ö‚µÆ\n1Ë=H\"bºŞ!Ç—r½ûJÍ¤+«U\Z2Î²Â}^	j’rê˜á-–ÌíŠÓe¡8.7µ²3#~°bEEwqÏ\\T—s£N„Ÿ-0h¥ÚSaâ‘¨æ¦c@6Eª—a¡1ØÛv„Üp í\'.´ÉĞrl*$\näñÜ/»jÙu.@G‘Ş¹®+Ç/İ3Ş×uIÊ\'–‡§ZIfŠ&–z#ŠXR]¶	ÚX}\n\nçÃüËÏ¯)ğğ¯:[-¡`HÓO:«`şì)ªşÒĞ|»;ûÓYcâçJ¸I#LÃO?Î•\'Ú¦-ÙáiÀ§´Š:Š˜¨\n¨HT‚Ğxî!nÌ®6€´=\'`|é¬q{îß´ŞN§ñ¥ROô¾h6•ELí¯•%i¦‰ƒJšJ•=B\rJiè!ÈB¯¼DŸá]§Ì‘éc\'HIÍB.Rà#Œ[bXÄí\\Ç´Ó[ÎÎá ©àRƒ¾y#ÈVgÆ³Išãx,Ä¤Çşû|+Vnƒü-Şæoñ(Ï¨Zã÷/×‰Õ¯·Hf¶ó!ó7 È?åE{aŒ[¸\'d2¥­=A(gSâG¡¯,ÄâÔ\rh¾ÆËaîÙ$Ä¡Aş¹`>ÿ\0ptÒ¾OcÔ`Æ–¨ªş@x§º’çüh?epÁ±V‘Ä©¸‡`Òµ08&Äbm[¢ãäYş.dV¿ö]nœéw²¾ŒU”«+C:Aà5Ó˜ñ­lb·àåJ\r¿yíX\\:Û@ˆ!TBƒÖ¬®	íeü#›8ÁÚ¯ş;è2æ³ƒ×óŞ´¿ù²DöDmí¬UñÍ\nÙ˜¥K“ªŠÇáĞY¿ríµ$GRĞ\0`²™ÚzõÅû_íÛ›bİ³v=â­-–\"Ù\'q®•‹Á0Y[V:·Ÿ%ô¤ŸP—S¤ğ—›¹º¾>½ç«ŞâöŞºšt9Áf€Ä{Sd{¡ÜòNÃ½¯Ê¸’}`üXş_[UX§(™÷†âÄLÇ„ƒ#¤\ZgÕJ¶6¿éñAÎmº5øŸ{Äp®lv`óØkçX«ÅÌ¼±\Zfc¨#~UÎbøÕ¤¸U™ËŞe\0ª“2cÂ¶ğy‚Ê™\0†r#©º²ÅäR¹>NTà¥´U|HY\Zù¾ª8–m\035ªüy¼£ñ«[ƒ \0jz™øÓëˆ‹§‘€oÄ‚s‡İU  Ç=yù×Fx*I\0i—y3×O\r(„á—BWP¤l4*®İáEJ4#³9¼ˆùÓWT¼\"ÜjZ|šSQÕyôÑRYC7&I&I:}€ÒºF\"úgxT¦¹¿ñÖğ²˜g\\ƒıd)ÿ\0i4$ö\Z*İ\07±Å-blYrY ‚ÂÊd2uRA^DNÛWŸ+O×:ÙöÙ\\^Û_·–Ïdâãg¶@\Z0ÔVoê¼QÆşG—*çÑ ¬e:èEbœÒG[£ËZoa¬´]†šúWmì\'9ûH\"P±ŸI>?…qü‡Ş¿y¬-§K¨™ÙnŒ%G>¹‡Î§Çp·0w\\î¹Õ\nœÀëµë9Iv6Êx2ÅÁµ¹ítõ]¶$t$	1SšèpzLÑM5É{íOèv×(\ruÉÈ\Zr€¾ó°$Ÿ\n¯,´ÇnF„u:68§´V°åEĞà4å`¡•£}ŒÎ£•Ãq)Š{*J…$aW¡ş\"ÕÉğ/úÏu.¢‹ö—:d‡+\0Iƒ#)j=ö3‹›NW÷ ?Ë_Ÿ…ièë&7^Ò1x‚qiI\\M.1„9™cY\"¸9Â®Ït$3 ‰ëëÍƒíå€hÑ»ŸÚÉFÚo–øüS‡ª©jæx‡ü‚pjâ«Õ÷øe¾áƒ¹¿Ëû<¯Š{‰¶™˜Ú]4è,OM4ùÖ\nÛ!9¹\r~5Ôq\0ùŒbnÆ¤+xğêÂÚÒÏb$mI±œ]ÎÔ³JS¦ÌÌ^(££}ãÆº_fqÕ5†`#®eÌ›ò&íÅşšÄÅğ›!d1€f4Lj>¾©ƒ^Ç+hGPÂO¯xÏÂ«ÌµCa­ˆ÷Ãê¬!€h–/¯‰>µKa´Kl;[C42ƒ(G&ƒÓÊ Ö^¥GîŒ²<Qı®õVö¼„†‘¾m-Înºçø×?Sƒ©yç<7\rÚŞ7™šÚà]<+ ŞKÏÍÖ¾´6ÙÅÃb-vlq¯\\=\n ¶Ğ­©ò\'M«gf”\Z7T:T˜Ö u³U´û3¯/iT\"bÜâ6ÕŠf”{ºÏ‹ÂMÅ¸€6Uí’Uã$79üŸZ¼Cƒ0Kd![ÍwíØò!AeÙtQçCñLK“s5Æ³$8,A\'t|(^£\'QÖË,45]Ï*-ÏŸß]g±xèbİÅ#ù^d|WıÕ 0˜aª¢o¤[\'YäcÂ¡…°½³eî©DDeÙå±øÖŒ’RØÉ»tv¶g½•WúJFií¨€ÖÛ£¤‘CvÄ‘ãÔ˜\0Uj\"yïĞë™RKgˆ]|ªüeá;Idµİç7úÒ¸Á]õµmñK$.ÿ\0•`H=T	ÛoºCa–FÍKø4f$LNİ)PÍ‹HsàëJ–Ë-ßë‹—µ·3fG(é­ñ‹\ZÕ\'OÚ]<õ¯\"¿À°ÒrŞ¼ ŸzØ ‰‰ÌøÅ{9n1Qç;ùxWIÎŒK}ÏpJÏşÛÖ¿a{q¶poİÃ™;¤ƒ»²™¯&<*GvëËsOú¹²´^c\0hv2Ê ëãI<ª‹a©YÜcxû–®‹—	^ÄÊ÷\0ÖË±Ğ	Ü\nÙÀñ+©aBİ·	k	—2I\"à@Ãºârƒ^jxsä$_pr\0H·šºHò5Ğ{>3áîßv–ÃİÔ¡À\0÷BÄ°YÖI-ÖåóÇ³ØØÅq£†âW]“·fÃ û%ìò¨i’äF‡•Ç¸÷k{\r}°ùÂ=ÁÙŞ=Û	 †ëHØ|^5\ZÏİPØeØˆÑª¤}®ƒİ9ä~É€›ó¥—Q*$qE(ÿ\0Æ™°xûĞ&<¤	ùU‰ş#áõÍg½%¿îÒ‡¹ufs/¸9ıJÓğ3Wà®İ`2ı4ï¨üi~Ù+H¯Ê‡¡zÿ\0ˆ˜9ÔÜ]9Û:xhkšãœS‡ã1+rñk––Ë(U®¸+±\0ˆÏÏ˜®ø¡)l«\rPæ§¼²5ÓÄ|«3›{²l^V9Waš6ğáR}EĞa«ÛçşŒëX¾‡[	Ú­Æµ•³##2gË$÷‡¼*Ş†Ãá1–îİ\0Ú3ÅHLè$1Ôr¦öÚè{WB{`@Yì­¶úõ­¿fx;X´\Züg\'0_İ\'›»ÌùMIu1m“ËQR“õ÷³«Á¶WHî:i\\÷½¡óªñ¼|)€Düñèk‘3½yŞ­KîªÙ-‡èä²[\\™\\k‰µ¢™wß!,Šäw¥sTW3‹Æ‹¶³ßai˜I…ÀğÍš´øÎ*Û\\³l“˜]¶Ä=Ö[£_ïÂ±mZSl7K9>lÁ¿…v:%XV®¶i”V«F¦/âÕ÷3s!î$¨Ü£MêÏÕls4’¶±*€©*FÃø‡Æ¶øÏÎ1\nÜº·Uˆ!nËX;NñåÃnú§|èfF„vd6P5é@­3mFş¹*‚WÁ­ƒÃ[sqc*—tÈ…+˜sˆfğ£^ï`ÙO~ã±í©÷‹;Ë1>êMÀ	ğè+/ô‡Y¶¤=á™˜˜ìíA2@Õ»Àå›\nÛáh,IsœÜ`²Â^ã‹Œô\0 \Z¬y¥»E‰íMoõÉÎZÀ°ÅÛÅbn¤6q´*\'dÎ@Spï­¶×{=~ÒÚŒçŞUC-ƒÖ*|CH²ìª\nöŒª‹ö?gŞê$kÔTÓ©ÅaÑ²ä²î¦æ°T-ÅBy~Ğ×j|jsw_V<å{fk¦#ô‹6]Ãå!ókYærƒRáø|Ë„†¼ßİïoèÆ·oâEÎ-g++Û6H%YX6î¯¼ñT&¹‚È¹eÔ*“›O´`	ß§xİUrP¥vıÆ&ƒ\\(>ö$Û\Zx;~ Ô°üßÙ)ïc9fc/)FµÛğë¬l\'uuÇ8åÊûøhtßÎ¡ƒG\\r‚ Å»Ñ‘k[ G[½¤××\"¤´ÈÃÆ\\ƒ˜´ï¥°<Œçßò¨§±“¦wÓÁ:é^…vû\0{§ÇQA\\b[º4g}jÆŠ8ÔöÙ§¨*ÔÅiŞà“”C‰mF¢;€o×Q]lVF]IÓ_¾3rË¨ñü7©ÎÃ-Œ/Ô§¢ü½*Û—ıÑJ†”LòÓÄ€I>ì\rtÔ4xyUß¤, êX¨ó9·£í\\N¾q¥Inìdu<«¥åÁ˜Vy#>×\r¹İØş×ğ‘øÔ“\nÖƒ;‘\0/ºLÎu¶ÇoZÔÃâ;¢[>’f…â6œ5Í%:˜ï©ş¦³dÅ¥nşFœ}K”¨ËÂ>&.¶®ªrî«‰‚À?!Uğş)Š¶—RÎ´W¾ì.æ*C+h#İ 2Î£™­sˆ[6±,­\nTîª÷¶Œ¤}M?²üL[ÃÁ`&íîqæ¤„¦Ò\"Ì¹\ZÄœ×q¸}¾Æå»÷-±¸ÖÁ*[@H3ê7¨š§Šcµ¶Öíæ—½İ\ZZÛ\0\r{¦vå[SúAm%¬Ú´óÕµ¶õŠÖhg¯ªbÙs(;<ˆøÁ1ã–pWOàeYe‰ßş0#‹m3Yº¤£vGùj€üµô­XÎÄˆ¹½»ƒRàÙ×i¯SKˆ\"A\0ƒ”ÏƒµÍà)ßD™§Ï<è’@BôK‡u´9&P…UŠ°&İ²·wÚ(•.KIf®Gµë7x>sjß™Q÷×;s†YImöC(ÁÜ`¢}îÒŞºsåEôÕ_^£G*ÜÄö;ob]Ù	k¼¥™O|„U¤¹ WMÆ®BY‚¹&ÄÖ¡±jÎª2©ÚŸÙóÚ5®ñü*¸¹‰¸6¶­Ã7f‡f* Ã©\'ÈmXú”ÓÒ¹ôLú©»u}QÎñZ–!Zdé¸Ÿ) ğØ†6®Ü‚Ëg4“ bhŸZè8ĞWCAâ7\ZÇºömpë¨3v®í¦–&w0GÎ©„WPª]òğøôÍN\rĞE®Œ¹mOmÙœ¢ÜĞ“š-±#CÓx2/´kÖì7kqn——+fˆ)22\'~{×]…âxEekÙHĞö&4‘»\r\ríŒ5ûlÜÊ%MÆke€AF­¦ÂµÊz¥ğÜ¥²ú£â8ŒN\\Ï`*\\Êç@†\Z©ğî%qïhM´¸T¹êå,„í7­œ\\¸ÖÜ½´´ˆm[a®V,¹œc—¤O@u›Bñ\'(ò!sdSp U—]f#^qK—7İ F5½„XÃÌÚ² 	†i9fpa‰c¬™cÔÅ7â¢§ïŞq)&cín¼4\08ùVÛßµbÑ¹²¨ÍË¼s)ø’£ã\\O\nÃœMÖ½s`t¼ºĞ}¢~fE÷WoWş_ˆõ~L4Ç—õó³Áî^ûKÍ7=AÈAã0×JåÃÙ¸S÷‚1RHOİµvMg% cµ`	è£V?\nílqKE¥uB(R€A÷où×kÄs8%kãğ9şKG·dx\rá÷ÿ\0I¶…Xèr0!£0’@Prï&6ºƒ‰(Ò-Ë[Å0ìl§Ş€4œšH®ƒmÛãJYµıF’@\\\Z7˜ø×;íŸ#Ñïl‚\'t,C|>úàäs9v;ØôÆÒî_şG}YYp*«‹ÚA$ƒš2n üMì/´G$Úì²Y¹ 3ï5¾ t­,µ®¨pÖµ\0•†ÌÜ`Ìi·¥r^Ìcíaq÷’TæT`5ïex‰$[Ò$›àš4zÍËŸ\nxIôúùT-âÕ–T1o=O*ô±nK+/‰—¥;NÊ•c/OXûëíı!m’„èsÊº©IƒCû[Ç\0±˜É1¢±1ğÓëzóÛÇ¶§-·iÊÅi\rl–WUƒI\'M )ãµ`sIÑíkŒ¨3J„µR å\"@1I©7Ç™v¤û¡ö½A^æ°÷ŒhG3§ŒiWá8‰í`ˆÄï\00|ÈåEáÄe ™rµh$ZGÌt`X\"÷°+Iwšq¯…WŒFÛ0§_âXó­â5@3^u™ÅrölLÄ¹€0®\0‚dâ|´¤–I4_‹¦QÈ™˜fs#(Ïî°õ 6øTx.ÉÕD]»æ{çm)Ÿ\0›ŠÆFq–÷Q†¤$$íÌRà7beÔ}­ÙPŞoŞ3÷ÒAÎß©¯«‚–4«¹µÂ1=–$Ô\\Â¢·Š›Í›å5;Ö{;Œ“î±ät#ï¬[X‹k}\\@«hK©—flâ¯­Ğ·‘•©\0OŠå>´\Z}Ì}D)\'î_±Ùû1íkné‚¤Áå‡ÄŸH­œ7VÍªèDwÌÄ*ó\\’Ğ#buÛº$ü„úU–œN¢Hy\04ˆG¯/ÆŠÍ$¨®ÏHâœM–bÀwL ˜‘\\İüc/µ\r,pl	ÓXº„órŸ­kˆV·”fS•ÉÖAßºb#Ÿ*Åâ|Rè¿mí²–8{ëŠÌ; ã»•]`ÎS¹ˆ¦ó›«/‚½_èô>=Å-¶\Zñf…w6Ô€	û™¡uË›M|kÅ1X[¸¼UÆ\0€ÎIb4T\Z/œ(<+¬Åq;¯g)È¨QnB³s€I>?\nË·|¬‰1¸ğÇãY²dÿ\0+kš£ÔxWI§¤yníßåÁ§‰¼µ÷UB%>B±qÏšÛs!Xù\0$Ób1³ Ö¯Ãİ¶0˜‚dİuÈšh›`KGÂ’\nª‰ÔM(Ü»ìq´{ºÆÆ#Êår¾ß`•²^×2£sìÛ,¬Á‚íÊu­Œ/´60ğ+¨ïxøÖ7´¸á}J[\ZÏUèØ˜­™§xÙçğÂZøõı}®ö—B\0à&\'0Ìpoë5ËûSí¨–T(	\\HÑU\0Ê Êxîb¥ş#ûchö–Ñ[3¨`ÂdÎÆ?îkà¸Òµ×\\–×3)=ç\0‚@¬Á\'¯•&/3®Í¯ÌiKÊŞå\'ùéˆ¸ö­Zbs?}–Ot9”_89óxW]‚²[øf¹®	/tÜmõ>§o•tkv$€$ù\rkÛàÃXÔcÂ<‡U–Yr7 F$œZFÈ}r3Â´°eÕ‰ôTDk#l¸bÆ;F¸Î`˜Ì°5=Ø­\'ÀvMqA9MÇ åtĞì2¸˜¯?>¡dÉ\'ïkô;kÅ%ÿ\0UóãE?[9°/f™BÆQ\"4€u 8šÓ“A!-éÊrIùš{8F·ŠÌÇºT…>@zóªñwû‹ÏİÛÁOö¬ª´ÿ\0¹{U_†Í<(îˆÊmÉpH2 h6õ¡Ó‡¥û×÷.äÍiÛiĞ¨0vİs»h+slX*ÌD2+åq\'NÚƒâv{;¢?pä`&VA÷Ú<<ë6U£\"‹ã•óş~_Ôã(<‹•ÉÅo-¦)p#‡Éq[S#pTÏB\'—­ÅxíëÄìÕ‚u9™ˆ‚Dò’k+c²É‹µCr16Î¤{¡[S¨3×¬ÑÕÚÃÅ»˜vpûƒdH$vv\Zİ‡*”w[˜3§½ÓÇñ»˜væ\Zê¡$\'ßƒï(Ë\Z‚;³ëEà½®NĞ]l=òµP\0@@»ÈÊ4uÂâÒ\rnâ6c=üÓ¹Ó§ö¦·Še\0‡¼²cB@Ë´xŸ\nÑv\"ª=g‡{me-…l6$‘?øÁÜ’5ÍĞÒ¯6N=|\0;\0Øf¹§†J—HöY„Å îe$d\0³0\ZˆrG/HÚâ\n…ïy…Œjv3:õ§ı4ï\' jYEİ„zW)õï’A ÅöƒH‡<‰ÃrñÓŸNT.?6^$lÃ¨ˆä>\ZÑ\ZÙı }*¶íË[3ü$ºªs¾ÅñÉ$Ó°2Î-’m¿zÙÈí9`¡ˆoÛÆ³pjÄ\\ûW<ôlÄî¢wÓxğ®†î;5¾Î[! \Z	¡-àr–\"ä†f`\nïßzXÉ«Ú‡É8ÊmïÜ\Z¤\\·pöa{,°Í2C6†`ìGÂ£Ã1=ä·İÉzA\n2‰ı“ãOF4cØ\'F6½Vj68¬Áä•H\Zñ¦RULªRRíØÕÂb»2\Zv?SCã1JZEÂ€ì$‰øV&#‹\0ì2¹†=9«°8›w\'?t\r#Yó¥i­ÊV)Gz4û%oyó«×lÕg¶Bœî„(RH1 ˜ØkáVaÖ¥\n–\nÄ{§‘ƒ ò«½ É†(Bw“L{¶§åUK#N¬íøoE«ÌÈöº¯^\n,à‹\ZÀ£sâL\rIëøP<^å»k”×åê¨[¯%ó\"#‰Ç]kfåÂVĞ dNîrt;Æº’jwxZ¹Ø²”\Z6}\0Ât*XÃ}R;gˆGV(mÙ%Ùx6|¥ŒÂ1DÉˆê7§â—œŒEµ\'\"Ü¾@\0. õ­g;CfÜe=Z}ã:]¬¶r×ÍËÒ ãoW¦£#ÏeÏ)Û›ºÙ…c¨rĞ³-¹×¦myQxŞ.÷,\\Ê–ìÀï@‚F‘©Ğy\ZÖ³Á0£”ÿ\0HùVc8Uƒm’ßs0TLyù|éœàûñIFVß©Ç¥«;¨\"bu:ùƒZjŠ-J¨ëA%³\'âßñ£ìğcŞ{çœöÅQÄQRèE¶Ğ\05Ò{ÇrNä×gÂTg™ÉvG?­›PJùá&\'Óñ£x†#-–ş\"ñ?wÎ³0—„ùÕüh¶Õ›( ±1;’9\nïõta”½ÈÇ\rYRõ+ın¥¬¡pD¡HEt‡Ö‚¸¸]N…Ùˆ A††@ÖkíBÜ\\®cXl¢v×»>5eÎ$ÜÚ|Àãc).=[=gìüÛq*1Vl†vl¥ZÅ¢@;z=++aV×(¬aYumô]gî®U1ŸhZwÌtéåZw->[7Y®g€%Œ©#ÌéøÒ©8R~·üškSn¿	è8¾ˆ½…í6í¯f€n“¦Ú/çYı ¸‚Î×-¨d<ãhGOQÒ°q%C:ˆ\n¨ÓX2Ï3U]åº…²Ú^ĞŞÔ…Lò×Uñ¦Ñ\'%ÛÔÜ°Ã¾¡.‚®\"H1×x<e9ìšíƒP´#8g¬|kS‰ZníÅÊà$ÉŒ¬\'Â&F£ÏÂ³øÔ5«wSu@a¶Ş -*-ç­WñM4÷úúø×©%àøìaqÁİW¶UrÀ¶“âuÔó­LW³ø‹6Şİ;5\0˜pñš G]j\\ao³âTºÚ{¨6İRH€£ãKÚìf-şŠ 1c™»¶ò¤p\0$™Ÿá®”r]S2ËMÙú[î_èÿ\0ù¥Cã1•^Û€ÄHaÔMWjezÆ9È‰ĞTíßsî¨ôQùV¼\nÈ7 k\ZéJÕ»d•wğğ‘¥rûZ@Ö½J-=şCäYÿ\0O­° n¨Ó:s×Ì“IùZõ2û~Cğ¨‹Õ¾&·ÒÊò-*À‹Ğ|\r÷T}Nx]=OÄÕ©uÏ6>S[¶ÂôõS1ÈÇ—ıĞmú\\}L²ÄÎA;è\'æ(›vŸ¤y@ü+YHÓ…Y”³çı¨[\'™\\¸Œ“´Ì u¬Ş3Ç,¹PvL³¡bT–òŒº|ëx8‡ÀéëT_¶®WEîGuL\ZŒÃÃåK¢İ³^¾X•D\"Ü´UYL\nf\0Ø\Z\"÷R”‚2}:Íˆ1a ‰. ˜P`ƒ#m¿*¦ÍµQ ÉUâ5¦òÕnÊ>Öæ÷[§Í˜Ü‰¥»\n¥µ´×™”qãVü}\'ñ_d»÷¿¨ºœX_âòÌßG7lYf“w_?ôg¿Q²±ùT_	Èÿ\0Wö­3`xÿ\0Qüé+ãñ?M0Ì‘’xé\Zö_?íBq¥=»ø~ WKl¯A\0üh..±¤ÆÆ\rv<\'\"„¤¢¹£W)4›9Õ¶İÀÖ‡Ã;öYUs?>•ºO3ñ­K\rÃëğ®¯W9äÁ(¤bÅ=9\"ÎY½¸Ñ*Dm,Ê³ìíÌŒÅfIƒ¦šVÃ•XŠ³Š\\—ÂoÙ‚HÓf¯­y…;tugÔä„nÊíğì!@!ãR¤#œü*Œ`ì…ÑÁ~ÉÜî‡Ş	Dšõ‘ê¨\Z‡¸û“p*¿.ùıÍ+®šN’ı7ù­Ç^;ÓäÊ§ñ¬Œ]åk¡\'(X^Ë( åéN0[åV¦9ëæ*XãÇ}Vi*l\'…q`l°`­%Ke…aÒ:ıàPØ¬d\ng$Cj@C¤I|	.ÁeQ¦ÇŸÆ›ö„H=E/—^ïä¹u\rã§V¸Û±œ1nÒVÚÛQ¦\\¤o³»t>”ÌMÃÉ~\n~ù­eÂ/9?ÌI«mÙQ°Ò®˜ªH¦ye:9ãiÎ°?Ú)ë¢&•6¿p— 5¹ªÆÃ×ÀĞ˜bs´m>5~mGóP¶¾ºÔ^Ë(ühÕRtü*ÒMmÍ\\\\íÏYúğªÇl!XüªÔ3Ê†GåøÔ•úTÂ•iGkõ­6O¯\Z›5\n\Z~¾¢¤M@—ötëwèĞêG__\ZºÚSP6> ÷ÿ\0¢é×ëñ§ıêœsw\0Û¾)íÎ¼éšÙãoT‹ÃÉ×nSÙÉÿ\0º€oŸÎ›µÇ®Ô¥¶_&<)ªfë4çëj„-í:š³ÊA=¨`ÚkÄYJ:÷*îŸ\'—’2q×™•vÜ:Q\\>áSÈÕ.ÎX–S$ô4;ñM\nõå]Øu¸½sŸ>šk•ûO\rÆ¾xĞ\r{¸\'şB…n.Ñ–4;Ñ¼ÊbO[?ˆ¬}l±M©Cä©Æ-H…¢™\'q·:Ñ|PMH1Ö\'î®rÑiîÏ¥i«>BXÆ‡Ö5åÎ¹SGCìk\\Ê:ş4ÌßSCà1µ,Å‰:4x:ù“D•^‡^”ˆf¨¬	©dÖ¯P\"›?Ğ¦%½ºªäu«î0F…¸FñP$KDE= Ã õ¥P ItczÕĞ¦5ëçPd;“òªfmãëûUé-,¥ûHÕ•ıï‡çVÛ¾»iYÃ	ĞÕé„=vªés@ÜÚ*]§g1#CLøcÌÍ\nDÜ<â—!‹S×î ­áIÛOZ¾ŞN¦ nnçßS Ÿ‡§÷ªì ~‡×ãOw”lvÔòşÕ[ ~^Uh¹¥	†Ä‚F¤ÌÇ’ùrÔU©\0ùéã@Q^)õ]y¯ßS>cã?u‰nòúxó4_N¿B\\!1~/‰%=|>¾êyÿ\0³ãÿ\0tÀÓ]5º\nLFŸ)häò)¦;éë4íyGŸ-¾uY¾#ëÇûüª“º}\ZrÜ§áıª õòôçL“Ê:µHšbÃ˜<@Ò:·§…)\0ëñ\'îŸ:cµÓ™ëõò£d¡û€jvŠ¿·~ôŸ¼U ˆŸ„Š\"Ècn÷?²1$mF/r¬ëülÒğúÚ`¥{§v÷‡¬kéU‹§ëËÂ©gS£w k¸Ëo:I3B,Á(b>È¡Q=í]?íGŞ¤ƒX×Ç®uš—ÚåÖrf\nÆä]I˜<¼jìF4ë €Ç”e&Ş>uRœµPò†ÅÌúoõ½×ÌkõëKİ’‰ÓMHëTv‘ïiV¦åT\'»˜ô©:HiğÚ5;¾”–Ùot£‚U£Âd7ßT%Àd‘ :É‚<üi\\¯d÷!€hTzæü\r5ø›£@ªFš€#o4ªº~¥«¹·Ãğ¦ÃG—àiéV·Á™rdièi/ç÷Ò¥JXíE÷>gñ¥J¢ä€…Q¦?\Zk[Ÿ_¾•*\0a°ó47ıvş_ÄÓÒ Ê*àê\r–$j&<({§Ì}Æ•*–[¦ïù‹õÖ‰¶fg^éßÎ•4ø_>Åñäh1¿¨üiR¤.díçLy0¥J¢\0í¿ú+ƒ!J•\0¡ÎçÏñªÃ¥J‰	¸×ã÷ÕöË¿ÿ\0ãøŠT©—%Yı†dY=ÑçFÚQÈş4©RK‚èò€¯œ¨2é#XÒ}íâ§ÁŒİ×_±\']uîëó¦¥IÙš;!Ø÷ßÀ˜ş‘K‰ë!û5*xpŒïÚÂà>T]İ]	Ô›7$ÌyÅ*U^^?RÈrÁ°îrM*TªÊCÿÙ','A'),(2,2,2,'Vigilancia','Deberian cambiar a los vigilantes','2014-02-06','00:25:12','ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 75\nÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0Õq\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ç:š)ÕFc…-6”P1Ô¢Ræ€J\r4Rî\0P!Y°=é¬ØôÒØç¹¦u¤1İivæS… ¢GRA£ÎœºF¡z›¥0¶î(ÄçÒŠAKŠ(§\nh§\n8bœ)‚œ\r0KM”\Z\0Z\\ÒRæ€4´ÚQ@¥€\ZvÚ\0-}iÁh´Sğ(Ú(½)­ A“Rm¦•ÏZ\nÄ®v6=iÔÅR£¾´ìP³E ê\03Fh£4\0´f’–€\n\\ÒRĞKIF(ii( ¢’Š-¤Í&sÒÍ&h\nOZp\\P!¸&œ\nuÀJZ( Ú\r&ÏCN œP¤’ÄrAö5rjò¯¼z0ÍQÍõ¢ìVFì>\"SÄ±î¦¯Å©ÚMÒP£q\\Çzw3¶¬2¤íEqiw,\'1ÈÃèjä:õÒ›=Å0¹ÔRf²a×áq‰QûsW¢½·›îJ¤úgš,\'Í&hÈ¤¤šLÑI@%-! 4”RS\0¤¥¤ ñ¢Š(°1êo4¹©(u8S¥Í\0>–›J(ÙïM-ÆOáM-ù\nŒ¶Ni\0üäÒŠŒ?ÌJA\\fÅ£ŠfinéÒ€[w¥(¦ŠZ\0p¥¤¥\0êZm:€(¤¥ ¥¤¥ ¥¤¢€œ3M¥˜ÓºT{ñÖ—Ì^æ€$Í(¨Ä‰ê)Á”ô\"€š3IÇ­-\0(4Rf“u\0)¤Í!4f€4f’Š\0u”´\0¿J)(Í\0--74´\0ê)3Iš\0vhÍ7>”¡Ië@i@&”(î”\0Ğ´ìRÑL–Š3@IHO½&ê.³IšnhÍ 4™¦–¤É=\0?ue4#¼S‚ïLCwĞRícÔÓè …Ş––’€FèM.iPÑ^ÜÁ÷$lzf¯E®Ê¸\"·¸â²KÓ\ZANâ±ÓE­ZÉ÷‰Cî*ìwJ3ŠßC\\;HLçÚ‘~ÑœÇ•÷éEĞYæi\rrv××ĞctÅ‡¡æ´¢ÖûKâ´ÄlQU¢¿·˜pø>‡ŠŸp=hi(Í&hQIš)Šç›RÓiEABŒS€¦ÒŠ\0v1lÒ³cëQ3sŠL~”H)ÂÃî‚Rª´¯µGÍ\07;¸)àUµ³P:š_±Í@E-Xû#öÅ4ÛH?†€\"Å.)æTşT›ê()h—\0\nQF(Å\0(¥Í Ó€¦æŠ6Ó‚ÒDLÑî^O¥Gæl8u ûÔÈÌ‡å58XaĞ\Zrõ=ÅŠ´cµ~±øS~ÏmÛ?\Z†…B@ãµDòŞ¯koÌÒm—ƒ?Ja¡A&˜ŸİäŠ½ŒËóp{Ò½\0À qHæŒÓih´´Ú3@íE&h QšLÑš\0wãGÜÑº˜Í&i±§€“Ò”\'­8Râ€\01KE\0´QšLó@£5JóQ†Ğ|û‰ìU¿Ôç_2ÚËlcûıM\0m“éUåº#µ‰ÏÒ²áÖnKì–ÔnèpqZQHg\\´~¼Ñ`\Z—Ñ»m\0ÕÜSV<t\0SöŠ,rOA@V=j@-0\n~1E AE&i\n\0u!4Æ\n…§½\0X,)…ÅB÷TıM8[¹ûÍ¥+Œ\ZP;Ó|ÂßtS­º/lŸz”\'`(Ô\n‚)_¯ñl¿ÄI«b3N@®WXÕz(§„50—€ˆ%.ÁéR`Q@†•$sIİr?\ZŒàš†KÈbµ0±©£ áÀj²—ñ7\\©÷®Z]]GÜáTåÔ®ädLÒ‹…™Üı¦ïÎŠóß·^ÿ\0u¿#EV0\Zvj0Â‘HcÁ¥-LÎFÏßò î.â·]Ò¸_sQ%ı£à‰ÓŸSŠ†òÖŒƒ¥Vû\r£ğQRºI•Õ¾‡5(¬¨4´F>PsŒV_”àP2DF™ö¯Næ´¡…bP\0¨`š—>õ8¹ˆÿ\0 %”SDˆz0üéàƒĞŠb”P)ÀPK´Â—¸ cHz¨¤6ñÕ.)qL\nÿ\0eCÓ\"šlÇf«T´Sì„t\"Û8íWqK@şKá4†6hÑé@ÛM5£±OUJá \n4*á·CÓ\"šmAèÔ€§KŠ²m±Ónã¶h!…ÇğšiB:ƒ@\r£<Rí4mÅ\0¢ŒQ@hÍ74¡I Bæ—9éJ×šx`BzÔ@í@§S\0Å(”Å\0:ŠfúMŞô“p¤ÉúS7\nMÔ&hİLÁ>ÔíƒÖ€à™¤xüÅÚÃŠ\0)hí¢ˆ|¨J8¥¢€ÑI)\n`>ŒŠ…¥½7Í-÷4€œ°Æ\nŒE+õ!EH¶Ê9bXÑp#3dáyúPgí­YT\n>P<-\0UÙåØŸ¥J¢ôQSá@iÁ)Ù¥¦vÚEZ3M¢€4f’’€ŒRRÓ\0ÆzÓ(„T”f‹“˜¨äµyNZ³¸Rî¥de?ìåşñü¨«›½è§`»8ÀiA¦fX…j\0‘A‘°:Tâ=G4DV¦‘ıjO²G•`\np\nå²ĞÑöfìjĞ P*}ûb\"OJº8\nar‡— şGÎ?½Z\0RâVY£\Z]J?Š­í¨Rª(°-ì½ñR-ówQO6ñŸá¤û*{Ğ…ò÷SRØ»äTd_SIöOF eÁuş*xš3Ñ×ó¬ÿ\0²¿b)>Í íúĞ¨e=Å/²|©GcHÍ:—v}è`\n1X¢êìqÖ¬­äÀ‘@\ZX£¨×î¢·Ş«@@£X_\'pE=o\"=ÏåL	±F)‚â#üBœF ‚§qGE?Â)†?ÃSb“Ó¹·CíQ5¶;ÕÂ)¬´†QØ.)ì¼Óh\0¥¦—›¼š\0—4İŞœÔy ½\0<±¦“H	=©Á=M\0&ÿ\0—çÖ€ÓÂJ)ˆ@§4ğ\0éIK@Å¥¦äR€FjœsH¯Ñqõ¢àL\\\ni˜ôÑnÍË¹ú\n•\"Dè(Îÿ\0uM(Ûï6>•d\n\\Q`\"[tSœgëR… ¥´X@.Sii´P\0Ìª9 }j	/aŒrô²[$™É?Cı›y@~´ˆdÖ¡S…ªHõˆÈúŠWÓãÛ„ß&\Zıî~‚•ØìYò>ëƒSd\Z`‰: ©21Í¨ËRn¦\"MÔn¨·ÓKĞÛ¨ßPo£u\0O¾“}C“G46úMõ½”{Ñqù‚Š‡Ìö¢ÂÇ*I:Õ¨­e\00Û“ëUÁÁu:İÊ?Š³(œGp?€Æ¤_4uŒş [é¥<_·uœ9coÊœ%QÔõÔt©ôgª\Z\0pš3üB?¼)¢îÔ~”á-«uùPÁ_Zw´À-B¿)ŞL£ãèÔ\\~4¸¦ı™{Jß/ÙŸ´Çñ\\J3Éœt‘OÔQ²äpş&‹Ä˜¥ÅFã¬yú\ZPïŞ&¢àIŠ\\T~oª0ÿ\0€ÒùÈ:œ}h¸—Ñ,gø‡çNÜ¾¢€bŒZP)€›G ¤1!şOÅ.(/\"?îÒ}•=ÅOE +QÙ!µ=˜Uª)Œ¨mŸÚšat¯QŠP*ÿ\0zœ%•‰ªî(Ú=)Sí2â§·@59OaM0¡ş\Z0^ú­;íŠz©¦›t÷¦uõ4\0Ùg’+&çR¸ypZHçûÍÂÖ„–*Äœœıi‚ßËàt ÔÕ.ƒ…–Ë“ı×­eyW&&O©©5‘Í<qEÀ@¹êiÁ@¢”PÒÒ\0ëLi”´-&@¨¬ÿ\0qI§¥¼ÁE\0<Èzo}©ëo\ZòÙo­J0£\n(\0’¿`¿Zx·ÄÄÔ æœ1NÁq«\Z¯İZw>”¹f‹\0”µÌ±sø\n©&¤G	o#¦(4¹¬q¨İî% Ú½²jdÔ&c ş4]ÌÓÍ ŠGq–Œ¯Ö¦Ä:ŠAKL¢’ŒĞÒQHq@ÅÍ!jijijBZšZšsëM%}h¸\nZ“&›¼v…ÏjWÁ¤ w5â{Òu¢ábMËG™è*<Å;¥p°íäÒd¦—¸¦bœ( PbŠvì#”ØãøOåKƒèk@)õ¥ÛRx¥¢Ø~TyCû«@\\Ï§\n½ä\'÷/ÙÓûŸ­!”…8\Z·öt?ÂÂ²§ûTÊÂ—>õcì«¼GáIö_Gr:O¸èçó§ı•¿¼´}•ıWó \0\\Ê?ŒÓÅäÃø¿JgÙ¤ôDƒøMùG]§ğ§®¢ıĞU_*AÕåIµ‡c@X¾5Ş:p¿ŒõCYØ¤mØ;qŸziı®ØıáùŠp–Ñ»/å\\Ôöw²¾ä¹Ø §$ˆ¸i‹ZM…VèÀ}Ó„Q»)ğ*ço7`’©Å]Œ83dÑtÂÆÀ„ö˜ş”ï*^ÒÄVHb;šx•ÇGoÎ˜\Z{\'ĞÒ~ø\0?CTÌÃøÍ<^L?‹?…\0[İ(ë~bæúÆãğª¢şNà\Zjº\n`Mç êHúŠQ4gøÇçQ‹õ=c¥ûT\r÷“ô 	C)èE/µ™hßÂáJ©èØüM\0KF)TGîÌÃşKäÓÇ\\Å4Š<™‡Iş….d?¤T2}Ú•„ãşYgèj¤í:©ÄøPæ‚Àu¨PNëÊìúÓÄülM!Gh\r+ıÔÀõ<T€FŸuE.ú0@íË¿à*EŠ$şO©æ›»ÔÒƒš,$İè(Üi*9\')Ò7o ¦ã4f³Mí×˜?pB}EH·ÎN<’\Z.‚ÅüÒæ I·}èŠıM?x¦\"LÑš}è\\Ñ€{\n‹}ıèæ(Øä¨4ğ\0¨¼ÊO2XÍ.j¾ö£yõÅ;ˆ±ºâ«®i£°¥q–¼ÊO2ªùŒ}©B»2hæ™}é†QJ¶ıÚ€aß³r–ôÏ4j!¦CØSw1§£Ç\'ÜFl³Š”A¸gaYŒ­É£9€•R©`3bŠ1@\rÅ#t8§b—ÍË5Á¼e.ø\rÀ®Š?¸¹ô D›·mõÅHQS’’AŠQJ)@ €œ\0SÀª›}¨§àÑNÂ0E8TAßû†—Ìoî7åYÜv&”TBoUoÊœ&^ù¢àJ)qQ	“=E<J‡¸ 	:˜$_Zpe=èÀRàPõ¥ \0(ô»®á@	±É¥Ø=M-:€åÿ\0´iB7÷¿Jp§P2?,÷\n\nC?À¿•KK@y)Ş!Hmãÿ\0d~5fŠ,_³F{0¤û*x¨«t´¬2Ù}~T†Õÿ\0¼¦´0)6¯  \nftó¤0IıÚĞØ=)6z,“ ê†£á#ğ­æ‡ÔĞo4¹­\r‡ØşXşêşTC&ÕxÂ§ø7ìéıÂ?\Z\0©º€ç±5hÛ\'ûB˜mW³Ê€\"¸èçó§™GñšwÙ½R}™»hÂîaüYü)ÿ\0lr0pj³Éè?:O&Aü&ŠÎIëMãÖ?„şU^[c\'W}\r\0Ld\\ãpÏÖãÔUìÈƒîËêI4å±\n~ûcëJáböê7TI\Z ã?‰§f˜‰7ŸZ7Z4›¨¸î£pîiy4†IºÔÌæ”u9§p»ŞŒ“LŞ p(ón)\\,I†¥àuj‡q=M-ïQêhóaŠŒRÒ¸Xqv=é:ÑN\0˜§bŠµkjemÄqM+…ÆCnÒHâ§šH,Óç<öQÔÑ}x¶‹äÂJ%÷5‰$sJää¹<’kK$	6_I\'Ô„ÊÆ?…zŸÆ­Ç§}CyAA=GzÍ²fÕOºÀÚ¢€:ƒŸÎ†™I+2{]23\n¹‘Ô¨Ö´£Ó­ù£,8ÇÏKdJÃµAÏ=ıÍ]@Ø#>àUXÑZ×\"m.ŞTØÑçŒXúˆÖê^<ºzÈ®•È}#®åäçÓæ§È\'fyÛÄWéQâºrÆQgO•œà§cî+’-§#¥fãc&¬ìAŠ\\RâŠB\n--1( S…0\n‘E4TŠ*˜bŠ—Ë>”UX‹œzêQÿ\0tştïí8AÁVü«›şÇŒt’QøÑı”ÃîÜÊ?\Zææ6å:…Ô n9üªAy÷¿Jæa°’7®e`;f¯8£˜\\¦Ğ¸·?Ä)âKcİ+\Zp4ùƒ”ÛÜÿ\0r”EéÎ±A÷§>´s\nÆĞ‚>Äştï³¯faøÖ(v	§‰\\üèº™±öI\ZÏSùVP¸”ËFüéâêaÿ\0-\rAfiùRö~T¡&Ä¦³EìÃøÿ\0JŠ]p@pò®}\0ÍAccîşt¹›ûƒó¬Eñ,ædüA©—ÄP7üµˆş4î®ùGü²?(•ûÆÕŸı»3”?ğ*zkQ1ûƒğaEÀ¼&õFü¨ó×¾GáP.§	ìiâşØşT\\	|ô?Ä)ÂT=ÅGöËsÔş”¿hµn¥EÀ—zúŠ]ÃÖ¢j{¥.-ÏF_Á¨¸dzÒäT~LG£Á©|…ìíùĞóKQùt•¿\Z<™;H?*.éj/.aÑ”şmŸÑOã@ÑQ~ø\0?CFùGXæ(¸ÑQy¬:Æß•\';«ø	 	qšB¥Gö„N(ûDŞÀ~ÑéFÑïMóPÿ\0¥Ş¾´€6ûÒm÷¥Ü=hÈõ ú~TÓô•HM!4XŒKıÑM0¯÷Z›4™ èjŒG5tœMP~XŸZOA¡7ã £sô˜¥¦ã°P)qJ(1KKJ(\0”\n-\0\0RâŠu0S…¡I ôXDö¶í< ÅhŞÎº}¸0fn\0ô÷©!Aa`×0@êk;&éDò.&#Ÿ¥md$®Êk_sî,yÏ­H±Œå€ü¸«	\0t>ät§µ¾èğAè{Ğ÷7¶…oİïP\"ÁÇQZQa@pÜäñToHÊg‘ÍhDˆ°©wäd\ZÒÚ¾§Aj]¾ç?/½]R£”duÁNÙ-ŸÎ­¬(=AS)l‰Õ»+Î‘ßb’ç:š67\0ävè+7R•çlbq?9µ17a¶±Nÿ\0í2®`„qU5­8C/™\Zâ7ì;\Zèí-Ä¬h~U:f¤¹·êÕãaÁ¡Æè›w<áĞ©\"›W¯mÚa”àÕ,W=‰—Q@…áM§\n`<U‹t/*Š®+WH€Ë8ã¾+H«²$ì‹_e”WIö(½(­¬gvx2’Fx¥ßóc™LOeä\Zòy™Ùb@Op)™ÇÊiàqB(+ŸJ˜XÎÚpÚN1Ò•i¤çs°BÓô \"bšs‚EJ¿tqG´aa›TôÇçK±½úÔ\0œòzÕ‚)ó…„ÙîiB{Ó—·jyPi©Ü,0(#­\'Ù£låTş92=*c¹T‘Ö§Ú ±X[°Æà4ßìÛqÈ‚1øU”bË¸ä\Zœã&«Šm¥Z±æ?É7ûÛ²·ıõWÃØ4æfQê(çAb¤ZdqôR}‰«AJàv+näS²ÄzQÎ‚Ãr}åK“èh,@æíéš|è,3u.ïz~I½E>d+\rßïJ%aĞ‘øÓYÀ`6}©À§p?*9‡Ê<O ş6üé’j2EÆéÓšSµº\nC·ÒŸ0¬@ué”à$§şR6»>ß”`ÿ\0´´í«ÔRaMÁÊ5|A:°Şb#¿ÊÆ¬¯ˆaîV«˜ã=‡åL0ÄHÊ¯ıò)ó0å/¦»0~†¬.¦„ga¬Å@ùq¥NzŠ9ƒ”ÕşĞ„õV£í¶íÔÊ²°i>j|Âå5¾Ñh»ø­íBµ“†ô¤$ƒEÂÆ¿ú)èÃşú¥Ùgÿ\0Ç«&‚Ä´\\,kùHzJßIí+V/;7åKö† š.‚ÌØòœt—ô¤òåìëùVGÚ¤ìÇó§¹ñÄš9r³MÒb¤e*®1LK‰YF\\ÓÍ+Ü´RĞ0¢–Š-\0RÑ@ŠZ-0ÖIŠv(\0«úM£]^*Æj+®ğÍ Kw¸aĞqZÓÙvEq•§ŠÉ>âŒ·ô¬â¸`*çs\\È	Çôè?AúÓ<HÈ=xâ´{›Â6ˆÈØ†\nz¸«q\'İÈç‚*?!<0Ãvâ™!vá—¯8ÍL•Á;;2ªÀ	\n.Xö«-–€î\r“ØÓ\0\"²¶“Ğô«N$û($ñ»•§Be³6-@ÚG9Éşu2î=qÒ ·ÈôÆãÔ{Ôñ•çîğ>ö*‚;!.®E´ä‚İûÔz]©Pne9–Cœ“ĞUuÚ7Å°<˜½úšİ`\"09çhDŞì‘–==\rJ1èzzUxÀSŸ|Š°Èßhg3â+ ’¬ëÑøn:\ZåXaˆ¯BÖ-LÚ|ƒ •€Ï¥pW‡Ï­sÔ™,‚ŠæD‘Pœ3t¨Şæ4‘cfÃ7JÌEŒÓ…W‰›-¹ç·aRyÈ²*ù› ¦\"u®§Ãåƒ‘Ğ\\²rÀWm¡GåÙHş‹[S2™Î´V\'Ú?Ú4Vöb<F$\"¤aÅ!\0Ôò	çÖ¼S¬Xù¡Æe¡8¦Lûâ	è) \'SÍ#zŠ®\0i„Tc\0ñR¤¾dyÚËƒ˜bÇãŠš?»MOºiÑŠ@U—>yÅL†£•q1&¥ˆdšĞv©X|¢¢<\nx9QM	•q‰¿\Z³*\'|ÔëÈ¤†ÈcŒÓ0VZ\r²C¯Ì\r\0‡°à\ZVå)Ê&)Ä|½>”ĞEŞ¦\\æ£Ã+Å$eéÅ Ò”â’1†¡î1Xq@ëOqÆqMÆ)ˆd ïŒZŠkòCNÈ\'ƒÒ€3‡ü(‘xâ”04².ä§Ğ“š\0A¢ålv©ÛøHõ¥{pÔåQ‘ÀÅ+hŞàFé·8â£\\“Ö­J9Ï¨ª©œši‚&dàME“¦¬}è³éU‰Ä˜ªl!ÎÌçšˆ»{T äõ	ëIÉ€ÏjvİÈOéMÇ4ä8%{\Z9˜£‡k1ÏSSl§c”µ¢Ø–Æ„ğ¢¨C€©0SÅ\08RŠANÅ\0´RLAKŠ1N ”QJ(qKŠ)iˆ|i¾EQÜ×rãìf3.Ôğ+Ó“Ì½}ë°ñ1XÙÛôËd ÿ\0WM£dKY$b¢ì·U99éÍ\"Ä¼r	Ï¯J·\n»B…rÃ3Qˆˆ`Á[çŠ:KaÈ€*î;¹ê\Z£Ü©óÀóß\"­F¨ùKt+Ò†\n§ #=i´KÔ‚5C\nnùåsÍH~Ì	 ÿ\0w®‹›ÆLy\0ıÓOº´Ï8ÈÇÍL›èÓ4 ^3Æ2{â«ŞLÜACÉÆ3ĞTË(†İ¤bp?^)–—‘®¥wèíTJz$_²µ[ª`ôÎGsV¶NAëéQ’8¦*|ç¾\ZeQĞñùTÉàäş4ÏëO$c9ÅZ$’EVˆƒßıªó­F/*gOî±èû”qß\\¼ª/çØARÙÈúVUV„½Œ	v“Šç¯fónğ™ÊkOUätlÀ¯aŞ²-—%‘‰îz×:“OBõùa†0:ÖŒ2Ë¸ôÇ¥cI•#åõ8âˆ!º[€Å03ÜÕ\nO±ÓÃË¯Ö»«İè²¿·ô®\nØ‘´×O¨FœĞr3Êàgó­i´‘œ“l³öcıÚ*¯öÄ¿İ_ÊŠßÚ\"lÏ-+¸u©\0ùiª)IÁÅx¨ì)]‰Óæˆ–ç*/·	QÃÒ®!w¸hÏ„Tíeæ)Œ‘ŒÕ%qßC5®€òše?3tÅ[ûR|‘ƒ¿£µ>-+ÊƒÊ¿AÒ•l’ÙA\n8èqMÄEˆ€Á÷¥Œ`‘J‘M‹ïšÉ ápA¢.µ<‘î¥E\Z‘NÀHW Ğ •æE9W¶(°H¸$]8”ÒGósI­Bãd”\ZVBFjWpÔì`b˜\'JzƒŠp^=©NTƒÚ„g\\c¥Jâ–TËn*\0H¤÷%E3n\Z¬mÄ„T.˜’›<Œ®3L*6f›4ùAëTRâãyG‰ˆ\'‚i¤ZäC$À2•\rœƒ’¦*üT‹æGŒ¿,GzÅ’Şín$dòÙå”µ¡cŠÊÌË<¢ôj«¡©0JdP©’}©Ã¡©P(ßøÕ“‚ \nˆ€%©Êe*m`\"\"”~´`‘É¦·}ª˜>\nZ¯·\rŸZœò¦£o»Å\'°!ËĞQUd05i\0$}*¼«œÑĞH¦:á4pA©\\ğ\r$c­+.ÖZYy£ †RÈÔ\nÚ;ÇRH)Â¨C€§\nAN˜\n)Ô”´QN‚”PÒŠ)q@KH)qLBŠQH;­áØ¼İZ%>£ùÖïŒdm‰û±ŸÔÿ\0õ«Ã“Ço©,²*Iüi5›»GS’u1ˆ°Cg<úë®›J(ÏíÜĞ„ªÇ+œwíVV@§*§¸İŠÂûUÙ@¡ã\\t;IÇëIç^·n?İEÒ¦èßÚ+Ì·½I¹€ç 5Ïƒ)Îë‰Û>²ü©R†Ëö˜ŸçEÑ<æçÌd‘D}É\"©5ı¾Ç†)’Uãk)Î*€†00\0öZ_-@?*¯±-—fÕƒI\n4LÑƒ–	Í\\:úª¨ŠÊCìÁ©¬€\0è)\nÚ&öØÕ_İõ±)õ2“ı*95İQØl’Ç|FN3Yô¹úQÎÂì¼u­Pñö½£¸X×úƒUâêI<Ç¼¹\'ĞIúTY÷£>ôs±µÄŒ¸yeqşÔ„ÿ\03P6ÑÚ¡G ¡ˆƒlHõ©”›Z‚E)09ªÂ>NOëW¥UdmçŠÌ´ ¦•ÇOÊ±¿½H±0ËSêŒb´âÏ’¿JÌ§ú‘Tˆcp}h§bŠ«ŠÌàÀçÚ›\"üÂœœT¸9¯8è)®VíJ½Á­EGÆqúÖk#­Âàg#œUµ¸”pPÿ\0ßU´6E½º*½ÎàvõïA¸”õdÿ\0À©¥¤˜üÊWñª–ÂKRUL&j0ÿ\0[Còt¦2`ƒXÉhRz’¨Ü½*_œJ´•\0²x\'¥$\0¥o”CNš]¼s@óQEø«!~j`]²úÒcD f£_õ¸=ªÊÔ2!Y™ ã¤d`Ó—S¶ñÒ€\"‘~J ^3RÈ¸\"ˆF)0Dn1%2QÈ8©¤¼¦Ê)‚)Ü\"ƒ˜èÃš¾›\nô¨&\\[¶FF*X®#T‡ü+H$Ú˜íU¦#Î@3î;TæêoÈÿ\0…WvV}ê^ÕRÑ	(ıã\nn?xEIÑ¥”|ÀÖC tù©TqHã+DD•¤Æ4¼w¦¸â~Y>´éO `½êb*AÀ¦J~aïG@ê 8*}é’ıü\nwÉNi-€…Ö©7nL1Uî•‚†VÇ=j|Z·˜C|Øık>k2¹nZ.Iê\0íH’¬¨J‚\0õ¨#`ÖÌPsÏXÈdˆ¶>SÀÏµ	» kBÈéNÌÒƒ]ØÍ’\nx¦\nzÕˆpñH<\nb\npKŠ\01J)E(À)E\0qJ\0)ÔKh\0Å Râ˜,×ãÚ­Npç&«Xñr>† ×7nY‡#85iÙÔµ½GSHfˆuqù×?€z†?V4à±çıXüI4¹ĞìÍ¦¼zÈ¿0ê6àğàÖk\\ØÂ€}±Î=jœ²C5â:æ8Èûƒ¥%RîÄÍ8«›ÃP„¾cÜŠœŞX¯ü½nÿ\0u\r`M\"ÂÉº2á“=qŞœ—–ƒïÀšD™j\rê³©X9ú Ö›ı£nQc•‚ã«ı\rf}ºÄcl$óW\"º´xdeRW-Ç½%Q0ph“ûZ,àZ1úÉÿ\0Ö§6¢Ë·m¬0ÈÎãıjKËdË·9Å:k˜ƒæ<¾áÇnió¢y]®IöëÆû–±¯ü?Î—ÏÔß¢ªÿ\0ÀJ°5 ?Öş•%®¡kpÁC$àf§Ú!ò2‹E©Ê6´¬öİŠ³OÇ9aZÁ#Æ*Ğ|r*”®+ÆªM•làŸ¡«„Ti·±şùÓáÒ‚T\n~*XF\Z˜V•¿ú‘YÕ¥mş U\"îh¥Ç½hTái¸ÀÍJ¸+šá6\"‘0èŞõ\"†–C÷>´&kXlÊü¿çŞœ£9âŒğE=Z©l Aòô¦É÷À§G¥5ÕˆÈíX½†H˜â–eÊ«z\ZHÆ\0©o‡|T‘`fœGÊM1>îOJœ.WLì\0f£+™:Ôƒw9ÆV)= Ç¦:eØv©‚ñšB1\'ÔP€‚/•Šš°¢™·çÎ*Ni€„g¯Zj¡O oóOaózv¸J6È=é]sƒRH»—42(H.@W10ö©\n\r£Ò˜¹1¿­OŒŒûUSFÈ6ô ÚGùëS08¦²äfª{_\Zs®å§ª‚¢ÀmúVV»(ÙŠdX«2/¢UˆIXi‘Ê¹ÚGcI 9©ÂîS\\p\r\nİG\'1ƒÜT¬}éG–h°Êû°i$Lvæ¤µœ“DUØ6U•âe\0ç·U\"w´)\"’]yÈ®Â0<¥úR=*ıŠÜ^Ğå#C¬h«ÀQĞS b±Œp9Åu…G¥3Ë_îÊŸ³9Íy†œ²×Eå\'÷GåIå\'÷åMBÂæ1’Lõ«1ŒÕÿ\0)3÷ò¦H€€U…r\0´ìS±KŠ`&)E§b€\n\\Râ”\n\0RâN Å8\n(ÀNô´¸¥Å\0Oeÿ\0#éMÖ†$tÇó§Yô•§jë”o şb©ü$õ9x¯b–A\Z†Éõf³ã]·1ı¥hVe™²ŒÈÀuúÔ‘¹\0(éVÓL–ãç Ş x	ÌL2Aê+=S6÷d¬Éï~í¹õOëTø,q‘øÕÛğE½©ÿ\0dÿ\0:§“Õ†?\nSÜ)ü ~÷üêõ“nµº<\'õG’FG~8«Ö(D7@ùd{S€å±$*zlÿ\0\Z³6H´ëÈş¦«ÂÅëåŸæjÙL­‘ü?Z¤·!ìŠ£\\ÕÍ?&î>9Ï¥UT%±üñÒ¶­4»”t“bì6r+8¦Ù¤šHØÃäzœTR•ş•Ñ•™¤T2jÁµL\rKùª:–!óP€›½hÚÿ\0¨¬ò9­+1ûŠ´CE:Šb¹Á†ÏèŸ´Ò§p ü’‚p³riÜã½*Œ\ZIyÙõ§\nÒ&8Í(?1Å\nrcsUKa\nÓõ§²îN)¬ÜúS¡9ê+ ÁÅXP1PmYZ£+;Š0jtSÇš‘}h°\rÿ\0–´²A¤ÿ\0–¼Óßš}\0‘PS$GAŠ|dì²®všÀ1—Ò€xÇzqæ˜ß,€ãµ6~œË¥7?.E*¶ä4!‹Œ‚)‹¤T‹È¨E !BCÈ§Ò¬”JŒà1=È©SæAôª§»!\\b“¾*F\\…Å4®{\0À>Z3Ú”Šiâ²`9²À\Zˆœb¥V$`Ô2§4=u<T.O#Ş¥Sš†_õ€{T¡0ÍBücS7 ›îÓ¸ÊîMcŸ1½1PÉÁ©¬ïØ{Sâ{Ñİ¯Ò—‘ÿ\0«_¥)®ƒ1¤RbHh”bŠLPqMqRb˜â€!Å§‘IŠ\0n)iØ¥Ç4\0€Râ—¸ Å¥Š\0JQKŠ^ôÀLRâ”\nZ\0šÈ¥-Mª/ÊßAüÅEgÿ\0IZrØË¨LğDm™ÆqÜU[İ!îyş1<ïUÒ8ªÒ![”SÔ>\rZaÅd¶4{ˆšÅºùq”Ú=W5]ŞIå2±\'PW/Špo—­dÛ¹¼R±jù3ajßïåT6cĞŒôÍk\\®í*××{åTrG\0zª‹Ş&—Â3` <úš½§¥Ârİê¯|ÇÖ´4Ä¥÷‰ûûQMjTö+˜³¿8ıÙçñ5l§Ëeşş?QL6ğÓkqÿ\05k‚Í¹ÿ\0[ıEh—¼ÌßÂPXÈsƒÈ5·g©Ü0HŠ!Pçâ¨*1³ÉÜpsVmT‰”`õæ²‹išI&|TRô¥XPL>÷Ò·‰ÌÌÒ*	jÁ¨%ª!ÅMZ„TñuÙ1¥d3	¬ãZV?êi6IŠ)ØúÑNÌW8.p3HÃ8>”Šp4ãÈ®ÑĞ9ÎDyç‘RŸ…BÇäO÷…MŸ”}*éƒœŠP{¹ÿ\0\Zh£ \Z¹l\"\\ñÓµ69pE(Ïzd’m9b1eÊÈqšµÈ5Vb$ŒSÁş¬RaĞF˜æ¥*)ÎÙúŠ’6PŠåÅ8Å\rA—vå§ĞÇ÷)ò}Áõ¦DÙLúR»ô¡M8Ü(ŞJBy¦ƒ§\0}jº9lÔ¡†ÎOJ\n§¦8ıèÏqJ®	Í6fù—†5ø|v©S0jsR©ıØÂ®)?*š‹£Ó·|«P³mqN{	`<ÌÒ1¢S¤\nF?/À7Ö¢Ÿ8Í8ö>”ç\0®z¨#qQÌ~e8¥ÎÓÕ¬yö©jyCR9ÅDÜŒÓ^RvŠ—Nÿ\0“é¶¢›§.ŸŸ´÷j£¸Ç@Ÿê×êlê×éN5¹˜””\ZJ\0J(Í%\0-1©ÔÖ QŠ\\Q@(¥¢˜)qKÅ/\0˜¥ÇRĞŠ\\QKL\0RĞ)qÍ%´ÿ\0¤úÕûÆd‘Ê’—ÔU+Aş•Ö¯j+†úæ•h–„Ks†—ş>ıú¶İ*´ãı!ë§õ«DV5d§=)è‡®8íÅ\0ç<zNş‚¶k;jn¶.N3£ÛŸI_ù\n¢pzÕ«©<¯G\'Lzı+M4ŒqŸJÚPrfP’H×ØF	ı+KM ÎGrÛØ×:·R$EHÜİ²+OA’Y/ÈsÆÆÀü\r8Rw	Ô\\¥ÎV|·ó«@fÚÜÿ\0Ó_ğ¬¹]Å…^¬Ï“¥Y„ÈÖLİ|óŸÒ´Tß1›ŸºXeÛpø9«V˜2½kò[ƒ{0\09\0­>ÈÜÛL’*³c’=j¹£ª­c³ÅWœrßJf™4ÓÅ#L¬óÃµM8äÿ\0»M+;^æKµ\rÌ’ßK¶Bç¶ËÍT’F.ª¤\nCLˆ\n–!óSEIŞ¡&ÅhØ}ÃT+FÃî\Z¸™È›&ŠuDp·ÔŒIN*3‚ïRV¼ó¨&5ÿ\0xTùù\n­ĞşĞ©Í]=„É—¦	§ƒòŸj…y§n3Vö]Å€äS1±E„¯J~d5Çb8NT­[·8âªEÃb¬!ñK`d·#*¦’3K?1­Œ\n¡t%4¿)£€¥r3ô¦€\"â>(ñL€ü¼ÓÛÖ’Ü-ƒR1åqP0Û.©İ¤ÕBš\0¼R)É§F0XÕ-Ä\" E¡€ÊÒ·\\R1‡£m„ĞÓÕ¾@ ¢T	Ç4ˆ?t¿J¨Şà8”f£“ï}*AÀÉyç°!ùİ¥FĞEGÜôüü¿d†ÆA¥sº?qGzh<B~|Q\'ô¤”bE49ù!‘71ŒÔ%ªBß)	¦ÀŠc•éRXß~œ‚*M?‹ŒgµTwC ıPúR“Iú±Jkbæ“4´”\0Iš( 4„ÒĞzP8¢‚))€ìÑšJQ@ QE\0:–›J(Ôf’—˜\n)ÔÑNšÓş>ãúÖ†¤>r?é‘şUBĞ¥Gõ­=@0Ïx›ÿ\0A5´63–çr1uÿ\0m?­Z\" ½]·Î1ÒoëSÖ5c~]Şøô¡”ãÎ)Bdä‘ÓÖ˜îBí\nÇZÎÚaúüŠÄÓåVôm6ÚöÙKF7Öª_ø¤e>“¯ò©¼5ª[ÀVŸfGSÀ®«jrô:ü=e˜ÔşjßI¶¶™Z8Ôã§­[ŠXØnWzƒN.¦D‡ŞÎ©nCØ§—lRD1©ÈvñÓ RÉcv³ Œb6¼tâ®BàŸúéı2á×ÈºätÊ«¨‹ƒO¶c»Ê\\IÅZÖŒ~í*ƒÏ@9aR¥Ü[0d_Î“°k`¼…>Ã•^PŠÂœr~•¯{t^ÊD¶d2cqã­b¸bDñª:«d\ZÍî_MLöÔ*Ë}ãUæéR4AŒ\Z|_zšİ©ñ}úCeŒsZ:xÊšÏ\'šĞÓQZDÊE¢Š~(ªæ@¼TÊ¸¢j@x¼ã¨tŠ0>¢”ş¯¯qJFqZCaÀÅ!_–…8»Tö1xâ¬Ç÷j´d\"¬\'±\ZJAæ§Æ\nµC +6}y©	Ìt†Y”fG5dñšr$XñLPvóUĞ’gŞ•\0+Lsû®´å8QÏZu4é8P})#å6SÆ)ˆ2\n‘†TëLŒ¦¤È*E\0*ışM?£ñÜT!ÆáRïéÏJwOJkŸ“ñ§¹â¡“¢[‰Wğ¦ ù{SA!zâ–2BúUÃpcÿ\0ƒ¥2^ßZ“8\\TRò>•SØâDsÅJ\rB˜Ü©?¯jÅ\rˆG4Œ9#4¬MG#`)¡îrƒ·>”Âµ#æ£cÇã+ÿ\0T™Ãıj	Ÿ@\"Z}ÿ\0JÇ±¨›<úS¬ú_àj£¸™ÒÇş­~”´Ø³å-8Öä\r4”i)\0QIK@/jLÒçŠC\Zi3A¤¦–›KEÂÃ±E §SNÑN\\,´\np\"‹…„§qIÅ;Šw‰mp.cúÕıNæ8dW#pòÈÀõÁ¬¸ä/Ê~eæ§iCıõ®2²!Æç/w)–íå8\r&îŞ¹©~ÔÕÿ\0ïšß0Û7X—ò¦ı’Ôÿ\0Ë1Sb®`´é–ÿ\0¾MBó†L+ìk£:m«ëOƒDµP ‘Ÿz;²½«HÅ¸ü8ëûÔ5‘a¨›kR‚“´îâ»MgMŠÇH¸‚\"Jù‹×ñ¯?‚]’¾[i­%£&\Z«š«%ÃĞÚÈ3Ù7üê÷†ã¹ş×I\nH>~ZÌöTYÛó­ÿ\0Üîå20É`ß¨«„®Éš²-HÚ¡³S\Z°s;	3éŠ™a¿m4ï`Hù®+h\\YÂ·>dÑ…2q–¢¡›Q±6³¼r£#\0€¯#v§S=lg\\é:¬×’:ÎEÉqéSÃá›™pd½p	«—>%Ó­$ŒÅí )ëRÚxŠÚé7D’îCi¹˜û_\rÇop²­Ë\0\n°ÎO­Kh-Êá·U/<L¶ÒÖİŠ–ûØéM7²]Ì¥øSà¾•]@Ï¼j´İ*ÔŸxıj´ı+1¢ŠXşø¦œ\Z|c÷‚‚‹X­\r8rj{O`¥³W)ñE\'˜´Uyj¶sS)â¡O¾A©3é^yÔJç÷.FEDíûª~ÿ\0j¸(è>ŸáJ…Fäë@sŠ§°\"HÆÔÃƒÅW›<Š›&²ö$àã¥*sQ³\0 “Çzzà:\Z@M §Õ9ôGÆNF\r64ùÜ“Şš½¬\"V$GÓ4g€{SKªäÅ0J„u¤µ	¦ËØT)4jr\\~tIq/29!’JUª«y¿•=nsÏåNÀ?næ¤?wŞ«½Ò0¦š×YƒE€ºzL#*EWdÆ2¼ŠAryÊóõ¢Â-+‡Üu¤V!ŸJ¤“‘»å8\'Ö¡Y¦ÁÏLñô«€jîâüÀÖq–cÔÓâ–UÎOZ§¨£êWĞÔ¹†k<I!$nÇ4!ãy¬ì2û0ÍFÄ0ëTÎãÕ›ó¦œãïÎ†€´YGCP³¨xT{S\nt¤ĞÇI*ğCƒPÉ2g…\réŠcÆ(°	æ¡CóQc\"›À¡¦ì¥·M³‚85hLéâÿ\0T¿JST#‘Ä`o<P]ñÎ´¹.’=i¥€î*‘$÷?4Ò¸<Åõy«ıáT±F(oÎAüT}¥1ŒŸÊª~4 qHhL‡ø…(u#¨ªx¤Å1—Á´ ÕŸzpfşt|\ZuQYdÅO¿µ;pu§\n©ö–şè§­×ªĞ¡KÅWKèiât=è\\Râ£Fqó\npt=PÀ´€Z\\ûÓ¢”\Zh§\n`.jö—ÿ\0b¨Õı(ÿ\0¥Šº{‘=…ñ(&ÊãßZò¶Oß?Ö½c_e½Êä}å5æRéîÒÈHÎO5¤–¢ƒ´J»sZş`5knyó:U¦Ì:ùÖ¯‡­¦S„ºŸ–A’E8+0œ®‹WX]4óÒñ¿•>ËØ/×+üKyfÏe2íä^üÁ©,í^=téûåoçZÛS;ègk³EöùÔ7Î%É«Ú5ã-¹+m,¹bAARjVkÙŸåÜ{Tš}˜¶ˆ ¹p38¬ÜQ¢Å\rF{–»ÜmæOİà‡\\`Öº›8n\"†<.<©ŸÆ«ı’	£1É3²·Qš¶Œ‹,pÅ&äT<MM´w(M2¤Å5àSÊšÜUykì@V‹ûÁMcNŒşñis½K˜ÁëPçæ¥šv!¢Ï›ïEW¢Ã•x×\'ÌÜªGõ¹oîÖ1ÔåÎåµ|vÏ¡m#M\n».ÒzŠäq6¹mîÄFßÖÜHOšGÉNÛU¸¢iv‘ÅK(|’¥ŠP´úÉ¾Ğç€@ü)wÊN|ÃQ(©@¨K¾Ò7iÛŸnÒÇó¦ãŠUé\0åô,ß*·$dşt ë@$Õ \0ı)ŠwğÑÀ\0f€>Ôçbš®€ıáHò§÷…+\0ìĞS†D&Cßô¥/£~Tì„óAT^a\'„cŸj“sÄm@\\“°¤Æ2i	—GúÓ›å_Î‚ä€|”Ç4Ğ³¨ü)9HåÇåM!b”‚\'Ç2ÀR9‘¿:mh©§ãµ\ZÀ¹ä±üj_³§¥M‡q„QùÓX¯0©<”Â)LKQ`+yˆ?ˆSL‰3ùU’ƒ(Ú6Ğ/0g…oÊ˜ÌOHŞ®ìæšR‹D™ü²?‰§B%ó‡îÀüjÑJtIûÁT‰ãI\nº)|¹=GåV~QNÛT\"§”ÿ\0ßı(òO÷Í[Ø)v\n@SòvoÎ\0÷?]Ø=)v/¥\0Rû:á¤û0Ç‡ãW¶-.ÁE†g}AÒCIåÌ;©ü+GË¤ÙNÁr†&ÀãFçcoÂ¯ùt_µ+Ê\"UU‡áNÆ{â®ycÒƒª)Ø\nÁ”ôaùÓÀÏCRHÏğŠoØĞtÈú\Z,\0´í´ß²°é#\n<©ÇI3õX.;e]3ı%{)¥óezø\Z,+’=‰§aû;Æ¢JÍÂ.â=ÈúŠvQüdÔ¥õ¸ˆôqR	ô`\Zv’	$ô[°ãŸqLñØÕ â¬Z¸ó…TR¹2Ø‹S¸ºå˜ÆBöç­e²)wØ{äp+¤¼ÛäNØû¸®pÌ	lò:V’!W•Ùau8ş\"p§ñ5=šêQŞÄîöí`[kqOùEüª{(cš`cĞĞ·G,ÚØl²ãiñœÒ\rZâ->_:Ó÷\"»sÍiIb©¼¬˜ÚØà}j¬¶ \'Í}«Õw«»¹#^[†&[ú“š°/ oàaìEL«w,kå”QÀ*§ùŠ_´Ìƒ\riÿ\0Û ?•@ÁsîE\\ÓŒ-pZ6,v÷¬›—i°·1è ÿ\0I¦NĞÜ3W ¨sIÖ7Ö«Lhk¼±%j´÷#o\nkT)Æ)É5j›\\Š|7+æ®}i«Ş—›<0§_QA$œQLŞ=h -6!Âı\r\\…‚ \\1÷ÅN9G Ï0ì8F§ùæj\\\r¦”p)Äÿ\0ëJ<ŞÊ£ñ©@Í(\n`B¾nì|µ YIûËùR¯ŞÍJ½j\0’@@ó?!J\"l¬4ó÷©øâ€\\d»Æú·çS…¤ú\0ß!6÷?8C>è§àm¥^\05b@~è¥(¸û£ò¥šyé@\\@&3M#–€Lr*AŒS(<°£Îˆ7.¿CÈ¤#å¨Úæ~ø İE	?A@Å\0{TíqÂ9ü)åÊñÓ@ZÇÅWó§#ˆâhfº=#Qõ5M°¢ŸØÕU[²: §ˆ.æ`>‚¦ÀMŠNµÙd?záÿ\0\nQd1Ì\ZCÄâšÒÆ£—QøÓ>ÃFC©§}\0?ÕƒNÀFn`\0şğTFöÑ‰ú\n´-âQÄkùRˆĞtP?\n\0¢×©Ùı,W.Ò\r¶ò~\"®éN‰~qNÂ%¸*1>¦‡’ì#‡5mGËKŠ«ÎûlÉş²/éO]F?âVx®zŠ­âqÌkùQ`#KØøÀúñS¬ŠßuªÏ§@İ_¡¨[Leæ9¥š@ÑšËòo¢û¬X}sHo.âÿ\0Y~£X.kfŒÖbj£øã#éS¦£nı_i÷À»Å8P$ñ8ùdSøÔ€ÒÇàRíÜÒæ‚ã±FÚnM.h°\\]´m£4¹¢Áq6Rl”úZ,+‘y#9”ÛÕAü*eå…hE\Z4ñ«)ÁûØôªŒn&ìb=œgøDlcìú\ZĞ¹”G;ª¨4Ï0w4±÷dqS[C:L—?Z³æGRDñ«ƒ([‰ì-è¹ûÖ0NsÉ0%eOU®Îr²YÜí ŒÇÖ²-bËäZKrVÆ`•å¬ç+ëŠ–ÊşÛí{JÈ„‘Œ­tQìß¥GöRÒê‡Ş…kƒ¸üÀÏ8$}àyühU„‰W•ÏZ ‹|§h?­@`„o9ÀÛ\r_RIü¨Ø)îT*’8ÅQ* «½·Ê¡72¨ıÜ‡ñ©kQ£R[dxJÌª¸Q×í¹‹‚)	ºR8¥î2\'‡æ5Á‘CÏp®sizGŞ‰ª,UÄ6¹¥KL0\"uaR%ì‡Ï¨§Ê+6ÍíHmŸÒ§1?:H§£ÎP¹Sì¯ıÚ*îáE.P¹çâÁÀ§•Îj;øM/aMÏğ) ´¢\nxªÑŒÔŠ) `ÓÀ¨°Æõjv¦(É©“LCİ¡E8–‘E0Ú”\nANê(@\"Šv0(AÅ8Š\0f2iÅA\\iBÓˆâ‹Uì#~T•5VK£l¸JÕPsN4Äsû[¡Ş¬¥óÆ>eVLV«AıåªÏ¦£‘¶ŸCJÁq#¿†O½ò}jÜe]r¬ö¬i¬§‹øwQQFòE÷ISM\\gBŠ]¹¬ˆµ)QpøaWaÔ¡re½0-•Æ1KƒH$Gû¬ö5\'1KŒ\nv:R0â€ŒĞGğ)R2)\nÔ˜¦‘Å\0FG±)“;GQÀV\\‰<Ÿ4lû¢¨LèU×oŞ»‡¨¬´¹\n?vÿ\0•)·¹Àÿ\0‘§¨®oäzÑ‘ëX+¡ü2~´ºÎ?yúĞ;£ ¥ÅR³´‘0óHÄÿ\0wu^¦b‚)ÜRP\"·‰şôj\nôÛvè\nı\r]¢€2ßI?òÎ_ÌTc¾‹î9?F­ŠZ`c}¦ş¼¤u§¦­ âH‡àk_Æ†7ûÑ©úŠA©I5X[ï_Â¬%í»ô”~<R6ŸnÇı^>†¡}&3÷‡×š\0¼®­Ñú\Zx¬ƒ¥ÎœÇ ?)<½B…Ïãš`lŠZÆ÷q}õÏÔb¥M_~/ÈĞº}áZvãı*­sÑê¶ìFw/ÔVåÔ2İÀƒ’;ÕÃr$P¿P·rmêµ. ÀŞI‚:ÿ\0J‹5/rm÷¥ÛIšQH®…ë—Oº`3•V´^õn×>èÿ\0²ëYÃ+Ğ‘VÈF‰.\0Æ˜$”Ê£ÔÕec·–5,G÷Š}èLmÎX¤§?òĞZbC&G9Î¥”ed’gùÓT~êAî*ï©6Ğâ<ÍŸaüª4\rÈ«æ~ùPzÔ9jRZæŒ}iûiÂõ)‰¢œ‰óõ¦²õa‡=)ÒL(İPÂšm\",?v*Î)@ª±²„„}\r7ì)Ù˜Uü\nƒ@™Cì_ôĞÑZ(¦#ÏiÀb€2)ø®Cq|¦¤Å4R/Jh\0JSE:¨@¼ÒKHQš‘)¸À§\'JCİ(ZVì)WŠbbœ”îÔ\0«ÒH½)Ç¥\0\0QÚK@\n)ÂRŠ\0Zµ(´\0„Tom£æAŸZ—½*Õ 3¥Ò‰ñìj‹ÙÍ|Êqê+ íJ1ÈwI>Ve>Çr=Jhøb{Ö£ÙA)%ê8ªSi$dÆÙö56É¡Õ!¿”>õmeA•pG±¬	m¦‡ï!ø¨w²«}¨¨¤jÂ‡R>¬{Õ¸õx›E+ïÔQq—Í!¦Gs¿rE?IÅiS;…)/¨+Ò–š½)ÔÄ´”PÑE3EP ¢Š)€´RRÒhQL¢“#ÖÈ‹Õ€úš\0}]ï­“¬«ø\ZµkeèXı\0h`ZÀÿ\0z%ü«9µ•ş‰úšµyÛî¢Ö3@é–ìÜe~†´ôİ0hÛ•“£‚+š·’	ümiBñµf;ñ¼g&´…îD¬eø‚Îxõ[†ÔÂ³EíÔ\'i?^kS]Òå›W€„§¾jºè§ø¥€©{”ˆX¸SóoÂ­G­ƒñô4õÒ-ÇŞfj°š}ªt\'ÜÔ—rı¡š]Ó|À\r½G½E©/(Ù«ÅzTÁQFY{UAÇAW\"\"?¥KbEúÔÍIúåúÔ­Êe¦nãÿ\0\ZÄr}j<ğ}ŞŸ‘Î{Õõ$%?¼ü\ny¦Ês!æ¥„½2j}	šnhÍLi4Æ¡4Æ4ì  i¹ i6jH†MEš–.´Ñ,—eìÑUaWgtsóv>µ|t®u[hpkZÎìJ¡áÇë\\Hè.ãå4ğ1GğÓ…RNŠQÖ˜\n(šZP)\0cÒ£Şôñ@çáM=E8PÔêi½¨ËO\'L^”æ<P…æR´ÀwjQÒ’Ú€Rw£¥€ô£¥7Öœ(@;µ­\'jPj€p<ÒÓ§v¤\0yÕZk%ê€QÅXíFy FLÚ91>}gMk<$î€õ®¢ŒŒ\Z\0ãòÊr85fFæîÍnM§ÛMÕ\0>«ÅgÍ¢‘“€û\Z,;„ZÚ%Œu«Ğß[Í÷dô<VöSÃ÷ãlzÕqÃt¥ªª0#ƒRW)oy4Cänµz=fAş±AÜU\\FîE‡­e®­lT–b=ˆ¨Ÿ[·åWoÂ‹ÆÎikŸmxÿ\0?™¨[\\ºoº~\\›4…±\\©Ôodÿ\0–¬>ƒogÿ\0­øšzŠèê\Zx“ï:©¨QµN³)úsXi¦^?XÈúš°š$Çï:\n,/>µl¿ws}@ÚèşOâiSCA÷å\'è*Âi6«Ô3}M;Ê-¬ÎßuTfşöNŒGĞVÚY[\'HWñæ¦TUûªĞQd-Nx%üßóÔşu*iwnrË©­ú(tgş)}*uÑ¢zF5¥KL,S]2Ù€Ÿ©©ÖÖéşU-\0*¨#\0¥^†O.doJ¤:Ô¬~ZhL¯rÛ§sêi½©®y¥)CE/\0ò3CqHeèÿ\0ä6¼¸úÕ,Õ¸}†á}‡óªuLHp#$-ûÕúÔ5$\'-1o”ÿ\0¿Jî›ëLÏÿ\0j”cË#ıª¢BSûÖ©cŸj€A&<ÖúĞ¦¥”\\\rFiªx ‘IÆ“Í5Í1ª„.x¤Úp<Ğ•4&«ƒSDyªD²ÎMÜûÑLGzS‘ˆpTàŠfiW­qíØ6±ÃÖ®ŠæQÊ0e8\"·l¯á9áÇQMpRâ€iEX\0§RQÚ¤ñLú\0N¦¢š(\0êJ;µ0zS³Òš)ÄPšp¦´á@…¥Íu 4Phí@\0iÃ¥\'j$qM\0ê)0ÔsLÅ;µ6œzR\0™æ—‚€ô¤íKŠ1@	F)ÀQ@Æc=ª¼º}¼ßz0¨â­ĞiˆÆ›Dà˜eü\Z¨&óÌ ¦G®x®›¡p(Má¾ó*ş5<zÏÏ7ä+l\n1@©¢Û/ŞÜßXM:Ñ:D§ëÍ[Çbš¬\'İGĞT€Râ—À\0¥£PŠ\\QE\0´Q@-%-1Fi)h\0Í-%-\0+ıÊŠ¤¹LEb3J)h¤1­IŠyô¤Ú}(ñä#QMØsJ8œ;Ó‚1ëNTÃ;RÒŠRIù¥ÚpãŞ—?7áN\'šd1nlç«sÅ*)â•‡qÜR7¼ÓXĞ„Gši4ãL4À)@æ›Nš`>¦Š¡¦¸¦‰d´RîU“sÆ\\8<P©©ÙËdQY]8®&„ÇnâŸ¯«¡Á	<R©$p(C:{+´¹=ulW)’Ã u8\"º+K¡q#‡QéLc­)¤QK@€SûR\nSÖ€§RRĞ\0)ÔÑKŞ€)Æ\n^´P)h PJ:ÑŠ\0¦¢ƒ@	ĞS—§Z1I·š`?4†˜ÀÒ€hô´”´\0J\'z\\PKE\0RS»RP\0(£¥€\n\\QE0RQ@Fh¢€Š(¦Í-fESh¤¥ –’–€\nZJ(ii( ©îTb¤?v˜ˆ@â——o¡¤ÃQ`qÒ”ši8íH[(¾´üT`Ó³@¥SA§Læ4âzÔc©§†\np4ÁÒ–Í!jm!4ÀnsHh¦“@Âœ*•Pe˜­@úŒ)Ğî>Ô5*0­b6¨Í÷­ ¹’AËŸÂ©\"Y½½}E‡¸ÿ\0xştUò“s e ŒƒXö†ŞR@ùO\"º *;‹u¸„¡ëØúW¹É“Å:2BÓî\"h\\£`Õ|±ö {–7ûŠ’³o(d~}=jÜM*Z\0ëìo#»„2{JµÖ¸ûK—´˜:¨õ®ªÒê;¨ƒ¡úJC,-!¥Ä8P(¥\0S…6œ(iÔŞô´Àp4áMê\0)E%(4\0´t£4P…˜¥\0wæ”c¥”ÀQïNãÒ›K@hÒS¨\0 \n( íIŞ–ŒP\0(¥¤¦ŠZ( P)h1F(\'šZ`–’–˜‚Š)h\0¢ŠZ@bŠ)€QE-\0¹¢ŒP £P(GZ˜¡ò·v¨*õ¹ß!ªBeJ)ê0ÄQ´\ZFFi6\n—aìi67¥\"Û@¤ ¢’€Èê)ÀÒâŒSƒ©¥=)§©¨$»†!óH>”hSÔdÜÖDšº/©o¯N]ZåË…Ôê¦³÷¼lÍfKyË‚}¹¬5‰Wl“HËèXâ¢ß¹M$ŸPº5eÕÆv„ûš¥.¥<höPšANÂ¹#HïËO½*“K/!Â©?AWaÓ%o¼z«YjÜ1–\0ÕØ´Ø“–%hE\"áP\ni’Ì¿\"Oî·åElóE>blqô¢’–¸Î£?T²ÄdAó¨çŞ¹Öd\ZìëV²òŸÍAò7èiî-ŒŒRãÖƒ@æ¤bæ­YŞ=¤Á×‘üKëU)ÔÙ[Ü%ÄK\"ƒSŠälïÎ@Ã”?yk©¶;ˆ–D9„ÆOJ)8Su¥”¢˜š\\Òt¥ êh¥\0´¢š)Ø Å/z;P(ê)¥¦1h‚–€–“ ¥Í0RÓsJ(ii(È –“4´À(£´\0QE AKF)@ £¸¥Å\06”\Z]´»i€h§m¤æ€\n1KE\0%-PEb€\nZJZ-”PÕ«VäŠ«Vâ\0G¸uQ#q‰[ëIšG3néPËuC.ê¿SCe\"À<Ræ²dÖí“…%Ï°ªrk²7ú¸ÀúœÑp±Ñî^õ^âêŞ1ó:ƒõ®^mJæn¤gû¼S$r@ã©ÂAòòÕêrI.+*ÜÕ&â&àsüêÒDÜ»\"´ü´ÏlñPµ“c(Àû\Z<\Z³LØ\0Â­!3-­eQ’„ı*&R®–;	ˆÎßÎ•ôô8óW\'ÜPÒ$åÌeº\n–+)¤*]\"ÙÃİŒgéR`\n€0¢ÑÜó#ì*äztÿ\0ãïWˆ¦šC°Å@£\n jx<ÑJ4 *UéQR â¨L^h¥À¢`§\nm8W)Ğ8Se‰fŒ£¥ê\0å/mZÚb¤qØúÕZë/­ê?Œt5ËKFåX`ƒCÔ^C;Ğ4‚—¥ *Ş|ördr„üËTÎM(¢Ã¹ÛÁp“Äj`kÓïŞÎQ“˜ÏŞZê 9ã{Ğ€”šp¦õ¥À^ô¸¤¥˜\n\r-QaNÚQE€ZZAE0J\r%-\0-(”¢€Š)q@\r&Œç½;Ào4 SöÒ… 4áOJP1J?–€¶”-:i€˜¸ Q@´PEPF)i4\0”RÑŠ\0JZ(â€\n1LiQY€æ©Ë«ÙÅÖu>ËÍ+ /ÑXSx!şª&osÅP—_»“îmAì2h¸Y`;Õyoí¡ûó >™®:[Û™¹yœLÔ9 WGU.¿l™ØÏ°Å$:ü²£ÑWëÍrù«Óyoìi¡2ìº•ÜŒÊÒ½T¹\',I>æ’`D¥‡CL\0š«„¹”ğ¼\ZtVÒÊ~DcøUøt[‰H.sNÄ¶ŒåÈZ™7‚·\"ÑbCó¹o§~+;x¾ìC>§šz\nìÀ³²O»Â´×D‘°ÌÁqØsZñ¨*`x§qX«m§Ûª‚AcïWã‰|ªÒ¡#çøMYZiÜŒÓ¶«.¤QOÅP23m˜úU+˜D`ä\ZÒ¨^Ÿ˜Òb(šNô­LÎ*>”LÍ8\Zb$¥N•\ZŠ³n U%rXÊ*ÿ\0Ø$şí|Œ›£Î‡Zp4Q\\GHáN¢Š\0QY\ZÍ´~X˜6p}è¢…¸=Œ\"1I“E\0™¥Ïz(¤ö«úUì°\\,c”s‚3E†±E8QER¹éFh¢€FO­PóëOQLRŠ( BÒŠ(¦1Ô qE€QOÇZ(¦í½(¢€ÑE\0(éKEĞEP„-QHQE1†)h¢€\nJ( AÖŠ( 5ÈTŠ(¤ÆŒkİrH¢B¹õ-Ysk7²ñæìû£QHrĞ£$ÒÈrò3}Nj2h¢†@¹¥<QE0\n(¢€MOA˜ÑEi˜™¿k£Åqnäo ¡™kâ ÇÕ¹¢Š¢[ª>P\0öáÒŠ)àx¢ŠbdÑô©€¢Šb´	qØÔê1EH	Pæ¥^”QT&)¬«¢LÆŠ)0+\Zaè¢¤\0sOš(¦&MZĞ„\0Îh¢®$HÓŞh¢Šè2?ÿÙ','A');
/*!40000 ALTER TABLE `carteleras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos_egresos`
--

DROP TABLE IF EXISTS `conceptos_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos_egresos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_52` (`condominio_id`),
  CONSTRAINT `fk_relationship_52` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos_egresos`
--

LOCK TABLES `conceptos_egresos` WRITE;
/*!40000 ALTER TABLE `conceptos_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptos_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos_ingresos`
--

DROP TABLE IF EXISTS `conceptos_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos_ingresos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_71` (`condominio_id`),
  CONSTRAINT `fk_relationship_71` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos_ingresos`
--

LOCK TABLES `conceptos_ingresos` WRITE;
/*!40000 ALTER TABLE `conceptos_ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptos_ingresos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominios`
--

LOCK TABLES `condominios` WRITE;
/*!40000 ALTER TABLE `condominios` DISABLE KEYS */;
INSERT INTO `condominios` VALUES (1,'J-18569854-2','yucatan','km 14 Via. Duaca, Parroquia Tamaca, Municipio Iribarren. Barquisimeto.Edo.Lara','0251-8987744','0424-9998754','yucatan@gmail.com','A');
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
-- Table structure for table `detalles_facturas`
--

DROP TABLE IF EXISTS `detalles_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_facturas` (
  `facturas_id` int(11) NOT NULL,
  `servicios_comunes_id` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`facturas_id`,`servicios_comunes_id`),
  KEY `fk_relationship_58` (`servicios_comunes_id`),
  CONSTRAINT `fk_relationship_57` FOREIGN KEY (`facturas_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `fk_relationship_58` FOREIGN KEY (`servicios_comunes_id`) REFERENCES `servicios_comunes` (`id`)
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
  `concepto_egreso_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `fecha_factutacion` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_68` (`concepto_egreso_id`),
  KEY `fk_relationship_70` (`condominio_id`),
  CONSTRAINT `fk_relationship_68` FOREIGN KEY (`concepto_egreso_id`) REFERENCES `conceptos_egresos` (`id`),
  CONSTRAINT `fk_relationship_70` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `usuario_id` int(11) DEFAULT NULL,
  `tip_id` int(11) NOT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `numero_hijos` int(11) DEFAULT NULL,
  `inicio_jornada` time DEFAULT NULL,
  `fin_jornada` time DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_2` (`tip_id`),
  KEY `fk_relationship_67` (`usuario_id`),
  CONSTRAINT `fk_relationship_2` FOREIGN KEY (`tip_id`) REFERENCES `tipos_empleados` (`id`),
  CONSTRAINT `fk_relationship_67` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `sub_total` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_56` (`condominio_id`),
  CONSTRAINT `fk_relationship_56` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1,12000,12,'A'),(2,1,30000,12,'A'),(5,1,1233210,31,'A');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_extras`
--

DROP TABLE IF EXISTS `gastos_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos_extras` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo_gasto_extra_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_72` (`tipo_gasto_extra_id`),
  CONSTRAINT `fk_relationship_72` FOREIGN KEY (`tipo_gasto_extra_id`) REFERENCES `tipos_gastos_extras` (`id`)
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
  `concepto_ingreso_id` int(11) NOT NULL,
  `condominio_id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_65` (`condominio_id`),
  KEY `fk_relationship_81` (`concepto_ingreso_id`),
  CONSTRAINT `fk_relationship_65` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`),
  CONSTRAINT `fk_relationship_81` FOREIGN KEY (`concepto_ingreso_id`) REFERENCES `conceptos_ingresos` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `propietario_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `alicuota` float NOT NULL,
  `numero_apartamento` varchar(4) DEFAULT NULL,
  `estado_solvencia` varchar(10) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_48` (`propietario_id`),
  KEY `fk_relationship_69` (`usuario_id`),
  KEY `fk_relationship_9` (`condominio_id`),
  CONSTRAINT `fk_relationship_48` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`),
  CONSTRAINT `fk_relationship_69` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_relationship_9` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmuebles`
--

LOCK TABLES `inmuebles` WRITE;
/*!40000 ALTER TABLE `inmuebles` DISABLE KEYS */;
INSERT INTO `inmuebles` VALUES (1,1,1,1,0.7,'15','solvente','A'),(2,1,2,2,0.1,'18','solvente','A');
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
  CONSTRAINT `fk_relationship_93` FOREIGN KEY (`interfaces_id`) REFERENCES `interfaces` (`id`),
  CONSTRAINT `fk_relationship_94` FOREIGN KEY (`rol__id`) REFERENCES `roles` (`id`)
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
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `estado_solvencia` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
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
  `notificacion_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`notificacion_id`,`rol_id`),
  KEY `fk_relationship_76` (`rol_id`),
  CONSTRAINT `fk_relationship_76` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_relationship_80` FOREIGN KEY (`notificacion_id`) REFERENCES `notificaciones` (`id`)
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
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inmueble_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `cedula` char(8) NOT NULL,
  `apellido` char(60) NOT NULL,
  `placa_vehiculo` char(10) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `entrada` date NOT NULL,
  `salida` date NOT NULL,
  `publicar_cartelera` char(1) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_53` (`inmueble_id`),
  KEY `fk_relationship_79` (`empleado_id`),
  CONSTRAINT `fk_relationship_53` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `fk_relationship_79` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
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
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion_alternativa` varchar(255) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(60) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `foto` longblob NOT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `condominio_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_64` (`condominio_id`),
  CONSTRAINT `fk_relationship_64` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (1,'19323400','lilianny','rodriguez','carrera 16 entre calles 61 y 62','0251-8481485','0412-1560395','liliannyrodriguez@gmail.com','F','1989-02-12','ÿØÿà\0JFIF\0\0`\0`\0\0ÿá/ĞExif\0\0II*\0\0\0\0\0\0\0\0\0’\0\0\0\0 \0\0\0ª\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0Ê\0\0\0\0\0\0\0Ò\0\0\0(\0\0\0\0\0\0\01\0(\0\0\0Ú\0\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0˜‚\0\0\0\0\0\0i‡\0\0\0\02\0\0N#\0\0Hewlett-Packard        \0HP Photosmart E327             \0H\0\0\0\0\0\0H\0\0\0\0\0\0V1.10 CN62T241FZ                       \02007:03:09 20:06:32\0                           \0 \0š‚\0\0\0\0¸\0\0‚\0\0\0\0À\0\0\"ˆ\0\0\0\0\0\0\0\'ˆ\0\0\0\02\0\0\0\0\0\0\0\00220\0\0\0\0È\0\0\0\0\0\0Ü\0\0‘\0\0\0\0\0’\n\0\0\0\0ğ\0\0’\0\0\0\0ø\0\0’\n\0\0\0\0\0\0\0’\n\0\0\0\0\0\0’\0\0\0\0\0\0’\0\0\0\0\0\0’\0\0\0\0\0\0\0’\0\0\0\0\0\0\0	’\0\0\0\0\0\0\0\n’\0\0\0\0 \0\0|’\0\0 \0\0(\0\0\0 \0\0\0\00100 \0\0\0\0\0\0\0 	\0\0\0\0€\0\0 	\0\0\0\0È\0\0 \0\0\0\00#\0\0¢\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0(#\0\0	¤\0\0\0\0\0\0\0\0\n¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\0\0d\0\0\02007:03:09 20:06:32\02007:03:09 20:06:32\0*\0\0è\0\0^\0\0d\0\0\0pşÿÿd\0\0\0\0\0\0\0d\0\0\0^\0\0d\0\0\0\'\0\0è\0\0\0\0d\0\0\00Ì»\r\n\r\n	  1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16\r\n	--------------------------------------------------------------------------------\r\ng1(OX)	: O	O	X	O	O	O	O	O	X	X	X\r\ng2(OX)	: X	X	X	X	X	X	X	X\r\ng1..	: 137	31750	100	210922	8954	6016	2653	1	0	0	0	0	0	9000	4900\r\ng2-1	: 2	ac	a1	3e	28	9d	80	80	0	0\r\ng2(OX)	: O	\r\ng2..	: CN62T241FZ\0\r\ng3..	: 0	0	0	0	0	0	0	0	0	0	0	\r\na1..	: 106	100	10	33333	1	2	355	2	15360000	51	27	0	47	1	1	45	0\r\nb1..	: 1	3	50	127	1	10	76	0	19	0	0	2425	0	0	64	10\r\nc1..	: 67	64	21	31	176	4548	10141	16	9024	4928	4	8060	6	2	0\r\nd1..	: 0	0	0	100	1	0	2\r\ne1..	: 1	0	1	25	0	6	0	0	0	0	0\r\nf1..	: 0	0	0	0	0	0	0	0	0\r\nIQ1..	: 1	255	5	76	31	29	31	29	64	32	32	32	32\r\nG1..	: 128	112	144	128	128	80	144	128	0	0	0	0\r\nawb..	:1	2	1	17	23	6	\r\nEv1..	:0	100	100	100	100	100	\r\nEv2..	:6	10	4	68	92	24	\r\nEv3..	:100	100	100	100	87	90	\r\n\r\nR0..	14	11	8	5	5	2	1	1	\r\nR1..	13	12	9	15	30	8	1	1	\r\nR2..	11	9	11	40	64	36	10	1	\r\nR3..	8	6	6	32	52	63	20	1	\r\nR4..	6	4	4	18	53	62	28	1	\r\nR5..	5	4	3	9	39	55	26	1	\r\nR6..	6	4	6	11	7	29	35	9	\r\nR7..	11	14	12	29	25	17	27	25	\r\n\r\nG0..	22	18	14	8	9	4	2	2	\r\nG1..	22	20	15	26	48	13	3	2	\r\nG2..	18	15	18	65	110	61	17	2	\r\nG3..	13	11	11	55	88	104	35	3	\r\nG4..	10	8	7	29	85	103	48	3	\r\nG5..	9	7	6	15	62	90	43	3	\r\nG6..	10	8	10	17	12	46	58	16	\r\nG7..	19	23	19	45	39	27	46	40	\r\n\r\nB0..	13	11	8	5	5	3	2	1	\r\nB1..	13	12	9	15	27	7	2	1	\r\nB2..	11	9	11	38	69	36	10	2	\r\nB3..	8	6	6	33	54	64	21	2	\r\nB4..	6	5	4	18	52	63	29	2	\r\nB5..	6	4	4	9	38	58	24	2	\r\nB6..	7	5	6	10	7	27	34	9	\r\nB7..	12	13	11	26	22	16	28	22	\r\n\r\nY0..	:22	18	13	8	8	4	2	1	\r\nY1..	:21	19	14	25	47	12	2	1	\r\nY2..	:18	14	18	64	109	60	16	2	\r\nY3..	:13	10	10	54	87	104	34	2	\r\nY4..	:9	7	6	29	85	103	47	2	\r\nY5..	:9	6	5	14	62	91	42	2	\r\nY6..	:10	7	9	17	11	46	57	15	\r\nY7..	:18	22	19	45	39	27	45	39	\r\n\r\nFlashY[1]0..	27	40	35	21	18	15	7	5	\r\nFlashY[1]1..	25	43	32	28	68	48	12	5	\r\nFlashY[1]2..	21	34	26	54	147	130	53	11	\r\nFlashY[1]3..	16	26	20	42	141	124	116	18	\r\nFlashY[1]4..	12	19	16	17	96	149	139	22	\r\nFlashY[1]5..	11	17	14	23	82	117	125	23	\r\nFlashY[1]6..	12	19	15	19	21	62	114	54	\r\nFlashY[1]7..	15	30	26	54	78	28	68	68	\r\n\r\nFlashY[0]0..	1	1	1	1	1	1	1	1	\r\nFlashY[0]1..	1	1	1	1	1	1	1	1	\r\nFlashY[0]2..	1	1	1	1	1	1	1	1	\r\nFlashY[0]3..	1	1	1	1	1	1	1	1	\r\nFlashY[0]4..	1	1	1	1	1	1	1	1	\r\nFlashY[0]5..	1	1	1	1	1	1	1	1	\r\nFlashY[0]6..	1	1	1	1	1	1	1	1	\r\nFlashY[0]7..	1	1	1	1	1	1	1	1	\r\n\r\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0œ#\0\0\0\0\0\0¤#\0\0(\0\0\0\0\0\0\0\0\0\0\0¬#\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\0\0ÿØÿà\0JFIF\0\0`\0`\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0€\0k\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0óy û£òª²BŸİ•]ÕW5çÅ³Ñ‘Q¢_îŠ¢_AWÉéLhğ™­2hª-ÙÎ	ú\nc[0ê1øVÜ[ãŒáAr~”‹shÙYm‰ô;¹{F?f`´z~U!Eu\r¥Ûİ {nsœ§9…S—K–0F©ª¨—LÀ*)râØ#pGåUH àŒVÊW1jÃ1IŠq¤ª$n)1N¤¦[!ÍGä³rxôõ«FefaÑi×Jñ®[¯\\zWŸ}lwÛK‘›tq•9ÁÏjq³óDF%ÜÌÜ¨©­ašğGŒmcƒŠêô½Gà’F9©”ùF£s*ÇF’å“´c€ŸåE÷†üñåˆê=Ew–Úx \".\\:fÑÒ°u%ĞÑE\\ó+[D¶“k€ËêEGy4>cnüó÷¾¿çŞŞè‹ ,‡ËnÄ\nãu_ŞG)á¦CÎAäQ	[qÉ&s±$€•Ç×ëxˆ?JéÄ† M°Çñæ².`tÎ@8î\rvÒ™ËRQ¦š°é“şµ)RA®¤îrµa”QE1‰¤²C§‰Àşc\r§¿ÌÓ5ˆÚhƒ x\'osQhhnbšlH¤H ô÷ş•=ÄÀ¶lÆGZój£=$“‰«á«U[d\\|Ç’q]µ¥¦1Åsş…wö5Ù@¡JÖ2ÕêZÑhZµ¶XñÅ[xC”RÂ›ÀÅ^’‚Ù¤•Â*şf„„Ùƒ,9ÈÛY·6›Á?:ÖEkù[÷†ÁÀù›éR]ZØÄ¡Zf\'ı©9ªä•Î\Z÷IY‘GB2+ÎõİçN•¦‰KBz©è+ÜŞÆ+Ö4ØŞ\'B¹R1Nåb’º<I¡İšcp3ŒÆj‡ÌL©^µêZ~hö·ZeÂ–F^Ç·ù÷®mü$É$›¤PŠH\'£)÷Ô«$`éÜá™J’Á¤­NÛÈ9 à‘Ş³ÊkªRW9¥Wc©ÒnÚÒõdSÓ¯½nÈğßÎä|˜ÁîO?á\\”rmpEiÛÜl›~â1ÎGZâ©nvBZÎ…t¢éÆGŞìkºµıàR;Wh·şV¶±1âR0O­zuŒ—×	aîç9ojÁÂÌÑHìíJ(ÒM÷®ã÷@é\\©Ö&²u‰ÓÌcÙ[,\n×U‹Q±:Î–¨z6f\\ßL$ŠŞÜ*´¿ÄÇGrOa\\ı½§ª_y·×OåE/É!Ü~dÛ1Îs‚sÎôÖ†à¥RUxLæ¥K\"…Tt¡JÑó+‘¹yí¡a«Àîzš­l\0V­¥‹´\\)Àô¨¯-Š!¤‡$p7*l¯Rp»¶GµAâi-ä³kå¹XîÃKeŒşò27o-Óğ­û»/´ãšó[íºìPÏ$’GŒF„’\0ç ~8ª·2³1½ÑÈß(bxä/øŸjÊú×W¨ØÉœ²Ú8ç?È5Í³ƒÏA]Øy§jÑ´‹{°jÊH}{b©“R+S’¹Qv,Kpët—	òC/±ê¶šü²xjÓìÊÛ¤\n‡o%G|{kÉÒ—åÂ»ÏÜ´pKm0Ï’ÙUÇcÿ\0×ÍaU+z\ZB÷74Û¨5‡¼{ˆâÎä32ç`7$ßŸNjió=¾§,RwÜ{V•¬BY·N*¾¥iöMFÚvã~Aöé\\ò›‘Ñ(êj|à‚zU¨¦YO$‡zÓüëam,:‚zÕ…ˆ‰f+€¼~u™w$¶ÕM¸)¸ =Aâ™s:Ü¡A\'Ò«]j+üÇğ¨ìnc¹TF$gÔUkbåf„)u#šá<ShƒP²›\0œd‘Ø†ÿ\0ëW£İ€$$tÅy§n|¦·`H(bG Í\\w3’9ÿ\0MšbÆ‚&\0Q´ÿ\0…p>i_—+wW•¤¤ÜO¸È5ŒW$í\n¾k²‚J\'5[Üš’˜â¢\"´4E„ê°ƒˆCÇ¶?‡J¹;+‰ntZ.”C<øUå‡©Æ+JãQµ²ºY#U‘¾m¼nR{ÿ\0?Â°¯õÌºq²<|€v±eº’i³[“šäQœöGEâ 49ã–äBašÑÖDZ ldë^+àÿ\0Üi÷e+†…¿Õî8ÁôÍz½¬¿Ú°nİƒ¾k9ÅÁØÖ3RDvrÁ¼‚ÀtIÇçZ°ê\\¿•îfè¹ÀÇj÷v³+‰ÜnTŒ==«VÂîcnULq¤¯\'8õ¤•õl«;{¨Ğ¹DI¹fyHÏL8ôôÏ«v€Aj©Œb ·’MŠ…œœ³õh®xäô²­¾ã5	‚B[=«Îuø?´£º|gËPëœŸÒºÏ]˜ÂÂ¼»œ\0;ÖgØ¼»3¸Şäõ¬Û°¿`O9è3ü«;Í+Ålëv¯mrrÃœz\ZÄ=kÑ£¬N:ßdóNS…8ï@FsµT“è[LºeÏ—TÚ[‰&ö*î&Õ~=.cÕõÊœ~”étÇpäôÁÿ\0\nx—É#75×h1Ô´•O9ZT!Éçş¿Î¹·³‘rÊÔ«gùU§˜MnˆË´¢íÀô©›M»¥iâ[-v,<¨%=#ğæ­Ú”Wòò~+Å•q´• †·tŞiSÃÏŒ•cÏ†²t_CES¹í6å@*ü—1Çâ@ WœZüAÓHÜĞÜ+g€@şy®†9^şb.Xñ‘÷¾§úV2÷w4NûÇnu+ãy/©ÄíZ~¦ÀBUp\0¬´¸\\SŸ9<ÖMŒâÿ\0² Õ$¹µº\\,jÒäòGã^s6—y­@ùSØdW°Il‘=íÑÈ)k&1Üó®t^ÀÃ-€{æºéUp‡<áÍ#&ÊÎdúšÚ··BGËÅbÂÌŸÃZÖ—`+	İ»I-\rx,ãÀùEX“K†Xó°~U¼Á±ƒZÚv%gCõ¬Æqú—…ãœƒcÿ\0x\næ§ĞuW$0zƒ^¹5°ÏJ¡s§¤±²	kHÖ”t!Ó‹Ôò˜7g®j4>\\Ãwjéõ]*şY¶}ŠFu8ß\Zå[ü+&ûB¾´‡Ï¸@G®k®TÖ¦3¦ÓĞ`RÉ>_ßoı=ëĞô\rgíÆÒ¨B¦7Ïs‘şÊi2^À…\"a½yw\\ ê¤ìN§SÒº{kE¶¹Š%y$õ8#ÌşuÍYİØÚ\\Ü“SW`öæ¡–øÿ\0ÏÖ«yxè)ŞY¬lX²¼£]Ï´åÙaO¯Ş? ®Uì%w-µy®ÊEÛ¤Ãi%i? üj—”=i\'k#8kvÿÙÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0È€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ó3l=)†ÛÚ¯¦¯;™)DÛJi¶•tŠŒi©14T6â˜`pŠa\\ÌVE3µ4ÃVÈ¦T¤KE_&ša«D”Ò)©14V1SLu`ŠLU\\’¿—IåÔäSqM12”›*|REÂÄ)6TÆ“î\"´m©qIŠw-´m©0})§qXm&Ú“šJ.!›i6Ô”†˜XfÚ6ÓÍ%Š1O¤¢à3bE;ˆn(Å:’€Š1N¢‹ˆn)1N¢‹€ÜQŠu%0b—Ph§b“\0˜£´Pb’E\0v¦˜içŠ«ÍG¢Æ\Za§\ZiªD±†˜iæ˜j‘,a¦š}0Õ’0ÓM<Òc\"˜†bšjVÀ¡1XaÜdàu§úñI£=ê„Ä`Ê94Â=*ERÇ\0dšµ–ïj°$ÙCi§ãMmEgŒ$e¿Ú4æµHòp£ëSÎ>SGÔ©$K«H‡û§½×R¡\nøĞO_”T¥vÿ\0i§·ËNâ±S¡^i_J”¯=3øÒcsUqX„ Ç¥0Æ~µc*~ğ4„!<Sæ)Tj*ß’àƒíQ´v¦¤‰q+ÒSÙ¦õ«$J(¢€ŠZJb\nCKIHƒEÄ%©i(RRÒP ¢Š((¥¤¦EP#³<Ó\r<ša¯8ôXÃL4óL&©0ÓOJSM5D±§Ò‘ºÒšCïLP:Ò÷æ‚åLCri¦¤äÓJ÷¡	ŒÇåH³T¬„(é8OsM	’ÆÂ1…ÀÏz)#QóÆ©\rÌsV£·b\04™HµöÖUÀùWĞu¦´Í9Â©üiVÓûåsè*CÃÉàÔ6‘I6ÄHø”f¬-»2ì ÿ\0ß5A®¤-ò¸¥MJxˆÉz—vU’.5„arÃ‘×Š®Úb¾J:J=o8Y\"®Guk:¡A=ºR¼´1dÒÙGŞûUy,ÙÍtr[§Pçë•Q¬™ŒraëÖ«œV0ZßMGå“[R@Q¾pTŸZ®ĞĞôÈ«S%ÄËSœS²OCÇ¥_xˆ\\à{T~J6\n{•JBå)ùhã®Ò¡’Ù”gnH9QÓµF”ÿ\00j”»âP*Aæ›ZşğëUe‡aÊòµ¢•Èq!¤¥¤ª$))h BQEÀJ)i(QE\0RRÒPIKIŞ˜Q@‘¦O&£5çƒ\ZÔÃO8¨ÉªD±¦šiÔÓTHÓHix÷¥\n¨¦1Åïg§•*qJ©»¥…=(Ö¬ˆÆ:ˆ¡W>€Ñpª˜‹wª–2sW™w`Um‡sÚ„&‡DvO&´†õ=*;L¾XkFãd„y`…Aš‰Ë±qF{La^0[­U•¥›–cô«QG—rü¹è*e‹jîÇ8â’Ğ.b°e8\"Ç1ZrD$NP.ÁªO&	^w$‰[TëÓ+Läg\"*[4H»e}4$“=\rl­Å½ÖíF=w\nÆŠ=ığjü« \nÜ7­a)¤Í=—E‰l%91¶àzgšªÖûx–2§Ô*ğ·–İr®ÜwÍLe/…0Ë¢ª3¾ÆM[s­\\T+.jµ8Ø}+RK%\r¾Ú\\~îj´“`”,Ÿï\n´Å¹–Ñ:“½N;0íUdPAÜwïVÌˆÊsÜ¦©Ml¬7*ÇœzÕ©Ñ•$[ŒûäsPî#Ş¯€#Š­$bµLÍ¢³Äæ^•«@zÔR&yªfmÑED%PIKE1	EPIKIŠ\0(£PQKE0;LjVæškÏG{i§Şœi¦¨CO4›I§à“éRğ2h½‚Ä+O5b(S<ÓH©\"b¬E+ÄæÌxøÕ-¾\\?*ĞÜÇ• àvª—,‹¸p{ÒLLnR+uRzÕ“\nJ\n¨É\'Š|‘ƒj¹Ç=1M³J\0ÏLÂ†Á\"¬‘˜†ç];rkbXÄ‹¼9É¬Ä„ïéÍ5-¢È”E3–o¼jÄN^ÛËş6=h´±2ÌÕû{UIİS…¬å$ZExìó\"’ÈÁö5pYo!qÀàÖ­±”©ÛÜÖ’Zª)ã<Ô9\\,sÃM7€*Öœ^<¯#µu¯n»‡zUv·?/N”œš\ZGm|¦©ÛüYíRıˆ*©!¹â·n¬KÀ|¦©Å…°AÙúŠ—PÕ#:8Y\n	#µiÛ¶à/^Õ4öáÔHŒ3Ş¡FÇ®Ò?ˆT·Ì4ìÔëPHñoäàÓ¢‘ÑG—ó¦9’g‚x‡™R;ÕÆéËVAq?<gw|÷ªì¿/ï1Ï­G\'›nÛâ}É×¤[¸ç8‘{ö­!«ĞlSå·¸ïùÕbÛÆÒ¸aÁÍ)•á‘¶å£4;¬ƒ\0P}*„Œé£Ã½GcŞ©L r¼z­iL¬I,r?¼;Uy6¸ù‡ÍëëZE“$e°ÅFx«rG‚OéUˆçšÙ3&ˆz‘QÕ‚3şzÔn»MifÑ%:’¬‘(¢ŠQI@Å\'´”\0QE\0QEÀëM4Òšiæ¼ó¼\0-ĞT‰=hQ¯séS§È2G©7a¥q<¥Lg4×ªH;WÜĞìsœqLfÜÙcšHlhaŸ˜TÈ‘8§×µDÎqøT©p§NéTKc–&B·>ÔÙQŒgqÊš˜7«œ}j9§ÆP}Òr=½¨WÈ–Fí9ëÅX‰Ìx\'û¤\nP°lŒOJĞ[ŞÁ!FM&ĞXjåàX×5vÓOR77™gle¸ıÓíÚ¶Ì\r!U@@ëY¹b±C(Æ¡U{Õµ³fP(Ú=*Ì6²\n#ÜUØ­Jã Ö.W4JÃ!·€{T¤síSmì=¨òóÚ‹…Šå2}©¦óÛÒ¯qÚœ!©¸ìf}›?{OéTntÒà9®ƒÉÇAMh¸Ã\n£Z¡¶”ùO§j¯$$|¬1]=ÆŸ¼n³dÁ^}êlÑw¹–¶²¬yıÓUæ±¸îçÖ´İ„`ƒQY7sn?ÆÒµF[²¤‚UÜêqÎERi[£©æ¬Hİƒ=*»Àû(ã×5¢°šY» ö¦–F¢e“=é¡NFN+TfÑeed8:…ĞHèyÇ¥FÌåH¦†#•ªH†BùÎÖéPÈ£8ëèjËíbIàÔXänè8­3eg@\09ãùS\nîSıáúÕ†L\0È5	$\0¬G+DÈh®È{S*ÃóÎÒ£e‘Z&CDxãŠJw*x£‡íÏó¦HÚJZJb\n(£½\0%¦’€½´S«&ëM&¤…\0®\ríÉ¢ˆã?‰5!Rß1è:U†bùxíÍGå’0c{š¤A°³R:…Sè*óB\0ã\'¯°ªSæWÚŠB/­Rd²‹¸Î3‘M\r“‡±§HTpJ‹95²Z6]PÆ\"J2TdÕÛUV·ÍÜ\Z™mo”TJV)jğ~ì2+N+BcÇÏÉ\'Ò¥µ¶UqÀ£¨<MsÊZš¤A	×¹­‡n	k´†Qõ«Æ§¯jÍÈ»‰X8SÑxÅ8&M #	¸Ôé¨©cŠ­$8)Y`Î8¥0ãµ^X¸Î)dÑ`¹bíŠkEÆ*ùŒÔf?Z\0Ï0ƒÓŠ¯%¨bC\ZÔhıª&Š@`\\éJÀä¥cÜéR	ô\"»&_Z‚XƒqÒ‚çœOi<nK/èR2:IÊœZï®ôôœ ç½d\\hkÉ\nMZ•‚ç8\Z	ïß¥C5¬-ş®lş­q¦GwFEgËkÌ|¥Rbve1¥ÊÍÃ®)³i—áíWVáãs$zT£Rà„¨èqZ\'\"$‘ÏI¯¨¹œ‘[ò4\r‘´zf¨Il7ÇàkE;nfàÆkŒsP2y«²C·¿\"«8ìkXÉ3)FÄ==Å4Ïj¨ìi¸­h™†¨ÙéRãÚ—iÇ¨ªNÂh¬y¤©6œ”Ê«Ä¢Š)ˆ)(Å-\0%Q@GzÕÒmüÇŞGJÊï]F›•§\\WŸ=ø÷#ŠÙ§º(½	9úUÁb¨»Èú\n,ÈŒ;î<SæºÀãŠçæF¶l£{o´Q×©¬Û½¶ÖÊ€|Í×é[·¿gÛÔ·µ`_|ó³¼ZÄ‡s2B2H¨‡ÌÂ¥\0N{R@»¥Qï[­ŒŞæî™nÒÁ’+fÚÑUyæ«ié±Gó­˜\Zåœ®kaĞÆ\0r*ÜqŸZH“=ªÒ\'5‹5ŒÕ„QŒb‘WµNˆ})TÑENHù¬Ç4&,QÕ¥@{SQ*Ê¨Ç©	ŒÛœSLG*Ğ_j3NÄ”ŠqÒ¢dö«eqQ04˜&Ueæ˜ÉV\nÓ\nÒ(¦ñJ‰¢Í]e¨™OÒXÏx²RKpsŠÔtã­@è\r0î,ÕÔ‰0Eg6Gç‹pïŠè§ŒéU\Z/Q@m¦Á\"|‘ŒúÖ]æ’È­°cÛ5ÓËnQ·ÇÆzZ‚Q¸d¯Ì;U)4KGŸÜ,‘1¤cĞbª–SÜz\Zìµd‘å=xé\\å§–íŒc5ÓNjFS‹[Œ¤Ñ|®7÷SUåŒ¼5O{ÄÙRF*Êİ‰ïG>Õ·#Z£>~Œ“*2ö«­ºå#Ú¢1à`ş5I¾¤´ŠùsÖ…;Iâ§hXuR*7E3Tš%ÅŒeÎ>SPË–ØÎGcVœc¨¨å§ºÿ\0*¨²$ŠôéM¡˜ÚZ( ¢–’€:|óÖ»+6S œŒ±Åqdó]F•rÊİT×ŸScº#üß.#¤àT6d¹yIû¦‘Üáxã“PÄÌ–èŞk•&V–1ÇSY·Pa™r3ÔšÓWÙµxô4Ógæ1g#æµÆRÜåæƒgASYDDà‘Vn¢-1ÇRp>”ëhLrZ¹{¤¥©¹oÂŠÖƒ+&×=«fÕz\ZåfÖ/CJ¹gÔp\'µ\\y‡q?QV8â…LšW¢Â¸èãïŠS¥,cŠ˜/ì\0¢¦O¥1TÍ=};S( ğ¤\'4P\0¦\"&^j&\Z¹´zTNªx4¢›\nŒŠ™‡$SvñÒ‹\r2»ÔL\r[1ƒHbQš9X]\næ¢hêû ô¨zâ…r„äUGˆò+Yw9¨^%=)XW2š>*	\"Îr9­FƒœãŠŠH{E‚æöÁò6ö®{PÒÕòv~UÚIîÜÕ+›]ã§¦òûË!n1ZÎ*U³é^¦¤ˆC \'×Èßi­£Œô®Úu/¹Í8êfFÌ#\'Ö¥¨HwËÁô=+KĞMí»•äÚªrI\n)˜á‡8?5nu\\Õ«Í:KiŞ2¤2AÉÏ#ˆ´Ğäš\'!$0ü)ŒŠz>~¢šŒËÁ<S÷vÀ\"Ä•å·\'æZ®AïZj¡¹Vô5\rÍ¾y@~†ª3èÉ”:¢…©ì\nœƒïM­Œ„¢Š(Ñ[:<¤ÆĞ†±kKNp²GÏ~k†¢÷NènjOœ1ò‘Š‚Ÿ³¯¡şµ©{jCŒÙ¬ÅA\rÈ%r ×YÒö.JàÙÁïKö+1ÛU®	j“ÌCúV‘D2s´¾à¿)<V6 şõ]W˜º•¥h0#¥[Õ³-ZØ­ÛHÏVE’ä×Ah£°5.Â¸Å[AßKVâ™,zŒTŠ2j *tŠ\0µ\ZŒ\nAíQ£cƒS¨ ¡0qNN”`ÓÑ	 B¢’y©„DòG,xlb¦E%ºpi‡B»Œ*&àòjÿ\0IéQÌ±Ä	l(MU‰m\"ƒ(\'ªÍ<QZ«Ş_<’•·\0(à¹ªÒk‹¨ÌìOqÀ«Q2r%üãå REspÇCf·l¼?oa®xç{VŠÙÚªác\\ö¡ØiœÈK—sŠì®›ø—Ó¼\nµQĞx©(À[)”üÎ\n™`\n¸<Ö“(ÍBS¯†Ph¨Ö´vâšñ‚)0±‹5¸Ïš¨ñc9â¶å‡Š¡2bÌIíÁÍsZ¦œ$À€EvRÄ\rf]Û«/Lš´ìKGŸµ·•6Ö®ÏG>T$D)ë6ïOg\n}«_D½l·Ÿ\03Z9snE»üE¤¸\rÊ&%{ÂÏ,›%RïkİÚÖÆ{\"!}ÌGLW\r¯èQ‡*Ëµ³òœRMÀjÒV<á +î§½)Ô85«6›,Nê:©äRZ«nòÙxô=Ekí4%Ã¹”Ÿ–^\"ºGÑ¡š±ğßÂŞ§Ò±.!’Öb’§ÍĞûĞ¥rZ±‘q#¥W µ§2C·ò¬ãÁÃv®Šrº1œlî2Šs.>”ÚÔÈßÍZ´|:×š©š’‰¹$®Äìw©/Ú–ÕGM§Øâ«Ëe›“ŞªyÕGK»aCüŠßˆîâ“¨\'Ÿzâœu¹¼]´9Ûµe‰wuÖD­—õÒê±¬Ë»ÈúW;<%U7±j7Â¡ê:V¢€Ñ‚OÌbÃ÷•OJÜTÄyQ¿`FG­t½k›±l7Jè-XñÍb÷46\"<\n°¢ªBjâPŞ¥­GOLÓeFzÕ”«ÇÛ½Zr(ô\\Õˆî\0j5vİ\rM!1|“éÉ«Vñ.ğà\nPFÑ•Zi‚îÁ Õ£6ÛV¨^CjŞXu5ËŞİÍs&\n:Õ»ÉZf!gºàsµDX¨¨ìÿ\0/$œ[¶q-¤`œêMQ†	ß{µYdòx¤åbãšh.rM=f³LÁy& {ü±ŸZ›Ü»XÕ–àc“Š¨÷;ŠÈº¼Ú¤É(_Æ°g×¬cc›€HëÍ2t:¶¸RzĞ$İÒ¹¼Cdî7,}mÛ]K:ªTzš‰6ZF›8è=9¨£‡=O­8†©ÔcdÁíTfLçŠ¼AïPÉ\"¨F<ÉŞ¨Jœæ¶n##µgM3Å2Y‘2|Û±œU‹ö…vÖµäJÍ¹BËÍ^äúdâ_9¾QÊŸéPê¦K§,ñ£§·½EfÏ5–q–^¢ºHã–Øn\\¶;Ò¾–™ÄG2JÛÀóG=Å>]\ZÙŠÉ\Zò5«­hl¥®!È#œ\nÅ·¾$lvÃ\rKŸ&Œ|œÚ¡×vâİ<²Ù_qÒ¹íJ!%£$œÈ§åcÜVõÛcÆìúZç¥“t¯F:T*¼Òº-BËS•ª•Ò\0á‡~µ£r\0ç¨5Féqøs^7}NJˆ®„gkt?¥#¯>ã­%) ¨nãƒ]g9µštmµ÷¨éTà×9Òlé·MÀ÷#ŸNk¬2‰KÃåäWa”Šß‚ì	g#×,ÕÖ¨Ó¸’),Ø1÷¬Ÿ%\\6á¸qM’è5¸^àşufÂA4NíŒ¯¢Ú\r]n›H+8æ¶Pö‘íëN¸¶FfLQQ4$[ex*sÅ0z¢å©ÃÖí«ãÍYÉ“ŸzŞ¶qÀ¨–å&o@r]CÅfÛ¾@«ñ¶iXdã­Jƒ4Ä©ĞS°Ä¼sW#\\cŠ¯NjÊZ,+“ªõf<cX0¥G¨@Ë%ğ\rgİ6rZ¶Xcª“)=yª&Å\'=ê)6¯JA´Ö|ò`Ô¹•/“šcÜ,JKb£fÂæ±u¢dçÉ¥»+¡r{Ó&I8QÚ¹ıCÅim\'Ùí>iíÜqSÃku¬Üx7qó¸şUÏë›J¾eÚBçr7­tF«™˜9©K’åO¶·cz°ê‹,EŠÜ§¡Å\Z4)&øÚ=æAßµ<­÷‰o]NîY¦HÂ#7ÍÓ ®¿EÑÑ²ßÖœä–±)E[•îG¦èpÃµ„cwÒº«[Pª8¢ŞŒe°*´‹Ò¹¯vkn„â5Å#D\r0JÛ>Q“R«€·Zb±D=*\n¶ØÅBôÎ0AÈ¬Éâö­¹TÕâ¦#hÁü*„àÈÅlÍ\\VtÑóš¤Èd\ZmÇÙîv±Àn½u–0\rqhq¹Nï[šF e´Ï;Ğ`ŠL««j0ZÂT®÷=¼òõd[ÆœG±Xçh®ª\0/u%¶¶k´ñF‰ Xh\"U(ó€6üÙİøU*n¤[ìC«É;4nJ¹V8^£5‡y&&óLçÕ¥«°û[”]¨Ù zV$¤²~5•(ks¦rĞ‚ô‚ûĞñÔU[š ÄûcÒ¬©60àT/ò%_L]ĞÓCzêg0Á¢¤q”¸â¢Ôflæ€i\r°:Q·\0ÖŒ/•#v8¬¨Ÿ{Uålc#­a4mHeàŠ½¢ÊæÉê8¬ÇaÓç­Kjûd\'<€j-d[ÔİŠc1ò	Àç?•Dnü±µÆU¸ªö×!\n‘ÔƒPß¿úsI\nÚ–¬çU}£Œ\Zè-¥áy®6ü¹ÆzfºK9CQ4R:‹i2½iDÜÖ%““Š×„ô©H\rHqVÔw¬ø¤\n¿1”ß/AÎ*…sMHõ<oïXËzséV¢¸İÉ9¡‚5ûŠ•\\zÖzÊ=jUõ%\Zjrµ€óšlïV$\\¡8Í=ÉÙ™SıÚÆ¹lI[7¨¬K‘óf³f±†1d×7~¯%Ï”½\\şBº›YPÆQë\"``¾–O ÊîûUFÍ‰ÜĞ±Ô¬ôeYp9ÇSYº®ªŞ!R@#‡?y‡&³¤µ’yKÎ\'§¥^¶‹ËE®‡YÚÈæXxós2}?M‚Ñ6¢ïZA’.œŸZ¦¡Ïµ;v\0ÏZÁ¶Î”¬Z2—ûÇ¦éTãêä(qŠ”U‹IÀ©A$S\0À§\0MP¬ç­FŞ”ó‘ëM~™ï@¬@âªÊ¹«g•õªÒĞC2ç­fÌ‡Ò¶f\0Ö|‘ä)’cL€©È¤Óä[;µfáíaW%‹ÖMâœfšìt\Z¼7O;]& }Ñ€ßJæµMjDŒE;6î€I4\\øÂkAoä$Uá‹`W4ú„×ö«‚\ZRxÿ\0gÚ´7Ñ™·Üµx¦X×¨ç¸5‡\"ü¼õí]_¾ƒ9r`Ö<°ï—p^p=«8{­£{óFælK‰¹x¦Şf2øùK)jUT™6æ—RPm¹°s[Æ^òf2Z3Æb_©ªäaˆ«R©<`œš‚L¤zs]‘g,:G&’Œœc<VFÃĞáªâ>Xf¨ó\n³TINùÍI(¸Å@ÍÅ,mÎGQYØÖæ¬\nF9è¿Î¡¹%1×ÑrêŒŒQ#–Á^¡@Íg­Ê)I&Ü}kwL¼ƒEs“œ6=*}:äÅp<Z8Ş$)jzfÙ@jü·iîfc:¥nœScõ[µ€d/RG¥b‘L¿ı¡-Ñ>Y*ƒ§½X†Fş2sZVÚ, ä¦¬­œQò\'ŞÂÜÎ\\Ÿ™YKCR½¾OÜªËlG\\\n†ÊH³¦‡Õn+åoâ®jâ\0¼†ı*ª\\ÍğäŠ,;£¿†ìqÍh%ĞdÆk‡±Ô‹àÖí½ßNh°.	$â³n=ªó¾Fj³üÕ2EÄÎ\rƒÏ¤n\Z’X	è9¦$D\Z’†¬\\r4ñ;U„Oj˜ ÆHª»‘DƒÈ¡!-ËU²€Å8¤R\n²ƒÒ›y«QCíAvŠæ¥	Î*háÇARù\0sŠz’Ú*yb£xÆ*ï•Z£ïB%™ÏNQÇ5©\"€\rgN:Õ³:QÍ@É“Ò­8¨ÕNìPK)KÇJÈ»„Œñ]#DvÖ}ÜSÅ1q¯Û2.åf²ï±¸à>vºÍ¯™.:‚:WŸ*)!|ä6kznêÆSZ›ºsÿ\0¡DXã‚>ƒÖ¡ˆàÊK1UƒÖ£´–I H˜´\0;`u«Koº#Ÿñ¬j>Y3h+£2XNÂç4ıV=Ö É\\şU|Z7’ƒïš«~¹¶pÍ–ÁOÒŠrR•…5es—•†:dQ•ıİ,­˜Ğwæ>ên:ôVÇ-æ“4”f¢Æ‚ƒSFy¨3ÍH§˜Ñg9Öü¸sM\rA?8µgcK–Îï¥YGËî1Š _äã­Z·ù­ˆÈ&¢ÅÜÎ¸?¼<ç½F¯‚ê)ÓŸ›éPæ¶ŠĞÅîwšuğ—KB<]Ÿ‡ Xá22Æ¼«D»*ënO¯YÓ%Q\nãÒ¹æ¬Í#±¾0V‘ˆU$ö¨u\n+\'VÖRİJƒĞsÍe¹¢.\\jÖÑdyŠë“Ò¹½OÅ¶°;Gï$ìç ¬öÓîµØf½U1A;}Z¹YáhçF	¸	µŒm~¦wç½ÇMm¬\\ŞLâ@a\'”^8®ş×Ãúmî˜·6Üns^w®ÿ\0oj†ê=64H–3ºàg“ïşº=*ïQ:Z[ÄÍyÈ8æµºŒšz£)ÂRIÇF&§fúN ÖìÊYåNA­+Ê§<Ö>¥S’ÅÛ<±©4ùJàW4Únèé¦šVg^\näÒ“U-%Ü€UƒÀ¨4Cö‚)¦1Ô\nnüw¥ó*J¸õ©Ñæ««f®À›±“Nâ¹Çè)«<Ö‘ƒåéUŞ.˜¥rÓ#9úUÅ\\µ\0àÔèàb˜Ùµem±‚Äf®=ŒA8¬H®TÕ¥»b95ª”mª8êS©ÍtÆËG¥UÅYi\n‚Ny¬Ù´omJ3\nÏzÖŒ½ê„ÔÄÌÙ„LÔÎéQ0qA#JqTn\"È5¨ëŠ©2õ4!3—Ô-Ãb¼ï^·û5óœ¿•¯S¿L©®Å–»­Òp9S‚@íZÓvdKR¦‡š œ’AïĞWEof¡H m³<=X°Ít+{Öâå\'cJrH¥¿ã*£ú×%ªM¶iö”~•Û¢7Î¸äôö®Ä+åê³&r4ğğ´õI\'\nàbr£ n(F%‘8î)÷j27\nˆq>}z‹c‰î\\4™ ÒT–-9O™NSÁ¡‚dÊÜRç\'ëLŠrŸçY´irtaµ—Úo1GÀÏ\" \rµ²)3¶@ËÓ56ÆÜ‚&lıjµfqæá—ôªÌ0HÎqZD—¹-´Æ…“Ğ×¨è·şd(sÚ¼Ÿ»/]³Ãåç”÷íYVÕÊ¦úŒ÷?ºÈ=«ˆÕï|É¾Ì	ÜÍóJé—¹Ï\0t®yô¶»¿k‡\\!<\nç¯vjÎ¿KÖ4Û=--ä™Upk“ÕMŒ÷LúhwÜr@^+RßFükRßM†ò …i*É«4g\n²æLÄĞ´l:q–?ÁÚº}¢ğ¿xŒR.È¾èæˆÎw“Y9èn£­Ù—îFFMS…¶(>•·yîÏ‡\'Èô¥qØßÓ¦ùCZ ïQ\\î›!1¯ĞCób¡–¬§8¤\nW½YÙ‘ÒšñÒ\ZŒƒtÊ~SLÚwbŸäç6$‹êmÀ“§­X2‰AÍf¼8ã5Ì…jkQ½L\Z•esD¶ÄıÚªc™?„Ğ.bé¹ã¯5a&ÏµcùÌ§æ/1Ş˜6l‰}é\ZAMe-òÿ\0z.Õºšd2Ä§9ªRMOæná<âY	)‹Ãb®Lœ:ÕVzÓC˜qíUfsªÕYG¥³\"é2†¹M~ú]ÈëòúW_t¼“šçup­§\\.\nµqÑÎÃqÈÄtW#·;zv®gD˜ˆUã’H«wrví$g•NÛ’ïrä7$ÉÈç¸Ãx˜,Ú”¥@ßÃ{Šß÷eĞ,Ùò+ŒÕ&2ê·IùœÕÓW¥¢)H3nu579õ9 FÊzƒUŸîçÓŠë‰„‹´”¦Ô– ÒRƒÛÀx¥“L€~j†UÉÉ¦«qƒI„`Ò°î?w;{Tl¹äS°{ôõ¥ÆîsÏz\0ˆ\nÔÑ.şË¨¡İ€ÇVi´¨JH¬;Ğõ@´=n\'I`ä‘Z6ÖÊPdW;¡Êe¶‰‰êuVî0qµm\rÖ¤ñÛ*sDƒnUF*T|ƒj6=j\Z4DQG¹Á#>Şµy#P:TQ&ÓÒ®\"erjM)ÜG¹H®{Pˆ®Hï][\'™’ËÚ±õ;Sä³Ò©ô)édm®†Øä\\îGÖº;A†¢[•¡§DŒÒ¼`væµ4ûe™9#¥W¹Œ+²ÆŸ.„ó+ØÍò2ÀV£€ç‘B‡šd·êF€³Â‹qÓÂ¡{Uk\0>ÒçÒ‹ˆîXfÛÕfÂ)3Œ“T•‰½Ë¨1Ö•‚Â£g¦¤†8Èä\n®ğDz¨¡¥Çz‰¦¨D´5íá<yb£k+˜v¡®\0%´À¶3Cb±³ìa‚85 *¬ˆpàpjä\\i\\d.ƒõFUÃV¤€sÅgÎ>njÑ,ˆ}Ú‚PXQ×Ò ›¡¦I™t5Éërìµ˜z©®¦èğkñ›mä÷ÓwC¸qå+JæO2—dş5‡¦±Šá$?*’FjíÌÅKK7š¹‰+¶E,£s1î}kŸ¿RÒ—ïŞ´]ÄĞf©H‡i<+JJÌ™êŠx­î*gr÷#5`üÃœÔS\0zfºS9™1¤4´†‚‚”SiAÅãúQÔñi3Å9F=Ï%µ)é‹Ö¥_˜zÔ²cåÔÑÄXã¦FG½¹^•$9à‹RÙI\rk~AÁæ 1à×I\r™š>Ÿxgš«q¦””€:¥B˜ìmøV`m•s÷xÅvqKµs^y£9±½òÛ£ô®Ö	ƒ(Ï?g5­Ë‹5í&-â1š°ãš¥nr\0«°Ç8¬Y¼K1/\"®¤Y\\õ¼yüjú!Å$hÆ,äÂ©j„²‘Ú¶‘2¿J§«Bd±Î*¬e#‡´b’âºk9€s\\èƒæ:\rh[NÑâ“Wìu\\•_•±Jò‡ÖFA¥kÒ\0Å¬\\Èµ4‡Ì&´lí¡Œqº°UÚIAÖÅ²¿5OA­Iæ_6\\v Â¦=ã¾´jVj|Säo^*œò…˜’lt“ŞªKv«Uî\'\n	Î*¤P½éŞIXÿ\05Æíy¾£`u­bY†ŞA®rú	\"@ˆ»	ëŞºK))€*§‘Ÿ2¹l±#µ[…ò•\\¦FM1±BÛŠ£8ùªÙ ­T›“V‰\"è*¬çå5aRá¸4î&Œ«¦ùMpŞ#“*Ëyí]­ã|¬k‹Ô±<Òç¢©§ÔÉÛHVâ5\'+ÏŞµ.ğÖpÙÅd²¹QœaºÖ”2†µ™’FEjõÔ[;;‰95QÜï\'Ş¬—ÁíTäêkXOk\\2È‹0FÚ¡80²°?ZjÉ‚W±í@ç+‘ìk{¤4Ph”QŞŠb\Z˜±~n}*\nrœŸj–†™ ûÙ«Œ6*êZ‰1%g&kY¶…œoJ±·™+/#\'Ê­i°|ûˆ;NkCM³2OæmùAÈ¬[/©~ÆØ¨„•è*Ğ´Œ\\|ØÀëSÄ˜¥V’r²I“œã¥É$%Ù_RÓSËÌ`y‰’˜¥ÒîüÈ”“ÏCI=ÁfO\"²¼ÿ\0±ê¬ â)yÆ¥TSvE¨8«Õ›’£¯\0ùTW;¥LG5ÑÛœ¨¨fÑf„\0â¯ÃŠÏ€ gš½sô‘eøÔæ™*‡VqÒ„$RHÜU-NRşÌÃ34c#5Qmaóµ½uËš ìâ—6¤ØÏ[iã|	›mhÛÂ¤\rì[ëQoæ¦ùñC•…cRSoV3Ò¨Gpb™$û³ƒQ~æ‰2éº à*]ùLæ²ÕÀ »ò×š¨«–ãbÄÍ×šÊ¹¸Ø{ö§½ËÌÄ\"’={\nÕ}*Äé0Ü+ÿ\0¥ƒ‰¶sïÕªc9ÔQÜÂ‚É®O™\'N S¥Y }mß5ct°³”9§­Í›éó¼Ù\\‘}sÍTU™„Ü¤gÉ²i£êX}âkfŞ•l ËêkbÕ2wf¼œ‘±hµ40¤ÏsL&±hdŠ†QÖ¤\nŠSÅ\n’6+:âB3Wflf²n¤Á9¢àgßIò\Zæá‡íh$pN+WS›·8¨4ø¶ZŒXäÓ¸&ş.SÇF5pkk\\¶Û,¸ã¸â°8à÷«ƒº*H¯r»\'LäU)8f«—òs‘œÕIÍÓ¨®˜Ó+±Ã)ˆ<)¥?sèj3ÔŠèF³Hii\r Š(¦0©\"Á ï\nm‘O`hh.XŒn˜úZ–ğï™TIªÖVqx‘¯væºM3O?l$½rÕv²6‡sBÖ%¶±ÉOJ’ÖO(£àTwoåÚì§{Ux.\0BÄànÏå\\²©ØÕBïSQåç­g]ÜØ»7íƒi-NMcß^†eäVQæ›6²Š,­â¸e\'q×µQ¹˜LJçç\rPçµ˜¬¡«¦lîg*ŠÖ;?j¢E¿¼]å”À¨9¯‚öK;‘4y<jôZæ!†p2*ªA­E\'¡ÜÂàqW¢n‡ŠÂ¶¹5¡ÀÖeÜÔI¹Ç¥Kò“U`E<ÿ\0)É¡Zâl±æ¨HÇviìÅ·=VvÆj\0í4õ›ŞªK:ªŸZ®.‚h±QW5ÒSëA›\rÉªİÆIñ§‚fæ.SéM@×\"ù¹ùzÕ‹H%¼aÚ<óïLÓìA‘dŸğÖ«°µmÈ\0CÈµj£dsÔ­Ò&œğ[•\nÅ…\0ã¹õ¬Y¨0 mç¥“PóãÛÈ¹¬Ù/Z@cE%úgÒŸ›1„[Ğl×§g”ddTÀÃ“ÕºÕë]4àÉ&sÔæ¤hğq;Pï»:£hèˆ ‹hãµ]Œ3L0*QÀÅC%êæš§šFÈ<R½Yˆµº¡•óiÀñUf|\nb*\\ÉƒÅd\\ÉÖ­]Îk\Zæc´óHÛç3Ì‘çšÓŠ-‘ıŞ•BÂ5ËLGZû0¹¡ˆç5¸8ÃÆJ[²Æ½R„½»8¯Jáo×Ã½8obÆ\\ä|¤úUYyZ³p8útªÌr+²ó $çü\nõàÔMË×B9¤Z¤4ãHEE´\0˜§Ä>qÇNiµ=¿ÈCwíIì4u±ûF¨|©Iîk§¸1ØÆB¹¸Ísâ\'ñHp>”í_Qyå¡ÈŒsõï\\&Üì˜EZìn©{ò˜Ç­P–ğùaõÄ›cfaó0Èöæ’rOJp¥xÎÌĞ’ï\0ŸÆ¨M+<™\'½FÒQ¼+xÓKReQ±å°iÓXæƒÈÍic;‹»Œö©ìu	´Û€ñŸ—<Š¨sš3NÉèÄ›Z£Ô4_Gs\Zå°Ojêm¯•€;«Æt‹Ä†qˆ˜ğºk¸´{uS¼¼g£zWJ|¯C¢æGv·Yæs Ç­bØÜyªA­«`9éY2Å0™ìk2şQ”®‘c½85Bîßx©ÉIor[=z£mt°1†|¾8®¦D(¥@ÊšÍ•TdZE¤Z÷º˜Zd±ƒwÉşñõ®¢ËU!dWÚq†°L‡‚3Vâµ@Ú Zó¥±ÁÉûÏCz×V“ÃŞµ ÔÄ½˜û\nÌ†İxùkVÚ‘K™ØÅ/3d)=jX[¬n‡9ªáÕ$ÀÆ\r?íxà”´Z³E,‘»;¡MíÆOZÎ-æ>qÅTóŞcóqSÆ})9\\–¹IÂäàR(@1È¡ñšLÌŒÒ‚0)ÀÓ€\'¯ÃN@ÍQ¹|)«Ò«X÷²€¤“ObndŞMób²®dgùSÅIs>éNaoçÏæ°ùV v.YÛˆaUïjÃ.ãøÔs€=ªaD÷=in3*ñ–Wb¸-NÛNƒ¿\"½\nï5Èj‘xŠ¨üBèq·{Õ-Ç¡äVÖ­måI½~ëş†±˜|Äw®êZ£	Œ8î¼ıj&p4ıÙÎ˜ÃÒ·G<µ,‘IKIHbQEÄ(8\"òøÚ£SÍKÊ7¦“\Z5¡¿6–øïcíTRfyK1\'\'“ëP3QH¬…d©¥vjäö/_Üù¬ÀÀÆj¥œ\nBÅi	§ÙX—+°&IJ*Ä)#4i;Òf\\4gŞ¿ZCÓ\"˜€\Zê<;¯ˆµ»l©áX×/éKô¥(©+2±ë0æÜ‰­›tg’¾•ĞØ_¤ª0yï^S¢xš[-±\\ñz¢»;{¸§Qqi ç’qÎ\'DesĞ œp3VdE•9År:~¬	Úç\rß5ĞCz¥G<Vmr½Å¶Âxâ±î RNoO:HŞ•›<@zÒZçäŒ«zıjHÜğ:b­Mzuªê0yH¥;`\02zUÕ¹\0u¬ôP@À«Æ½è»-MKœõ©QJ‰œÅYOJ^ æÙ$k1VÓ\0qU—µ<d±ö¡Ë(A»2sH™5e1¶ªÄcœËšvß›4×n{Q`e[‚+ÕfÚ„æ¶îä\0\ZäõIw¾Õ52F|HóÉÔšß†%†%Eªv0c0ù› ­Ë;BH’AÏaéY”[mÛ­$ÀWdÆ*ŒÆneİw®_U_Œ+¦¹=k›Õ>î}\r5¸×ö{fvœ8şuÆME#+AÁ¯BˆLç¯¥bêš$·7àŒ37ÍtÓ•Œd®1ø<SsÅ[½´–ÚVT(êpAªuİQË-o4ŸR(J;ÑÉ§d(Âõîhä9n½…/¥0g4ây©hb7ZAÖƒÔÑŞ˜Ï\ZNÔRS—Ş›J=(Gjm;¿484AÖô\ZA@…èqIKÛƒ˜8«š~¥qa0hœ…î§¥%Œ$È$8FÈ\'Ò£–BWI¡µ³)\'¹ØXø–ûßİÊ?ZÖ¶×¦vÉ3^xğíïRÚêSÚÈ\0;ÔqƒXJ•şhÎÛ¹i|]’cô¦’,ËÓ#Ô×šéş#•w|§8æº+Mqs÷óX8¸îi~m†h¶òTdNF\rK\rúLƒ$fšì¹Z\"¦¬ÆÁ¸ªO Ppy©íäÜ¿/57)\Z@©ãÕ$$jÚ0Í4†Lr1Š™N1• Šz°ÈªH.ZSÓ=jÒ:Œ•EX\0*A ì*®K,JØ{U9$;y<ÒÉ/©¬û«ŠrjXõ+¡\Z1&°­£içó\nî$ü«RÊ%Õnü˜Î\"Só°­û+­Ğ^•›Ô­†ÙØí\"IyoåZ\\*ÓAÀ¤fã¸£aJ\n£1â­HÜõªS7_Z–36ì€5ÏŞ!tpz×A8\'¦²î¢ùO“a&WiíÁ­›(Õ®¡SÎ\\V~æğŠÕÙxv.c#\"¨(1Ö·Š»F*lå¾#Ù[GÚ1ç1+ÌÈ÷¯bñb‹›Å‰×;SkÍõ=\rárğ©çmvÆ¢Råg2ƒqº3¨¥¢¬\0p¤÷<RPzQŠ\0U¥¦Špæ“Öô§”m9éŠ.;\réÖ·=(ÚqŒR…ÁÈ?ãJà4Œ\Z1V‘QµÖíQÉÄyı*yºÄy`ŒÑô£¸?…0ÿ\0Ö¦‘S<R`O¡¡0±½=@?˜4åÛßåNâ±µ¢@²e‚¼ŒÔºÄ>[£ízU[Ö2~ğÇ5nùÍÌ*AÉkŠmª‡d\"œéñöv#µQD$9«²ğóÚ¡1mLäg­m£2šÕ™¹LqƒĞTÆòX™J9üj¾¨=4ÉN^´µÈ½‘¿eâi#`¬ÇZè-|H’cÌl{×Ÿ<«cq¥Ærêz,z‡Ú¥	rzŸJélÂ¢(¯\"´Õ§±¸Ş£rúf»M#Äö÷`û_û¤Ö“Zšó§¢;7]ËıEÛ0¹?U¶½I|Â§2)5¦ZŞÆ§@İjšcÖ¦PªsŸÂ˜;wb¢y¶Ôp0k2÷Q%˜éCbF„÷¡’kk‰µ9ÌùÛÑŸÒ£†­UòùŠÈšè--\"µŒ$j\0›w+oQ,¬£´…QÔúÕ±Á¦æš[“b$-Š¤Ş£/”Ìí<òiÂ;U“ëV·f¡eé1”İzÕ”ÊñZ8ªs&iË_FVMÀw­ß\nO›‰sÕTÖªŞ[†íÍhøVØ}¦äœ”?\Zé¢ıäa]{Œ«¬ú´Ã‚Àâ²g·¤š»©Ì­:Œğ@ëíQdŠªŞdÓ^ê<ÚŠ(\0“ÀÉ®ãœC@«PÙ<„gZ0éè£îæ¢U#ãMÈÆXdnŠHúTËg7÷+}-cŠ™m‡¥bëšª\'9öi”ò§ğ¥Áù³øŠè¶OJcYäô¥í—Qû.Æ<~Y2óìj_°Ã/) ĞŠÔ\ZjJŠpÓûµ.¢èÊPîe6›\"Ô“Û52XÜ*”eNµ¡ıšà\Z_²Ì§!›Š—RıGÉc5´­ıÓTŞÓd›K}kÉk3–|ıj”ºt îsœƒW>¬™G²)˜9ÿ\0×¨İÂ°­A=Ì;wÄàT3İÁ;/î¼²:äU)H—e•§ZO,ç¥ln´aÑ>¸şuC™ÀØjj§½Ÿ™Zİö¸Îx««6:tª’ÂaÁÏ^ô$©I)j‹ƒqÑ“69¨›ı[\nvá¼zÓƒÅ$¬Tµ+¡8ëÇ½7q.r)yVôÍ7Æ¶G8áıãÚŸ¿Oµ38¥8#¥-dEH¸\'!¶0èEAœt©•ğÁõD6^\"½±eüÔŞëù×Eiãx@Yç\\+ƒÈ§F=3Õœ©Åš)4zt>-°`¹QìjGñuŠøøéÍyƒ¨*Ç¥:Un@(JÉÒVÑš)÷G¥l]_qim?ÆüT¶–ox¯¨7šXüŒ:j­á«”»Ò×saÓƒ[†(§€¡\'§±®I7±º4ã‘ñŒT¢@{ÖV&øŠ·úÄ8l÷÷­Úi)6+$I¿Òƒ’94Zk7Ğ!IÇµ7¨¨Ës@ls@8*&\"‚ù¨Ù»š\0kõªò/^?:œœ‘Q>(°&ˆZ¾„Gms&	ç8õªÍlY*¦‡/%¸85ÑA{×0¯ğuq»T¸n™•ºtëRÅ8#“Uî­Ébİóš¨$xÛ4åi2¢¬‘ÍEÊxV½’®8ÍZ†Ø/l\n¹xëZÔªú\n}YVàÕ¤ˆÔªj™@ÇL×;“féŒÔ‚**d¡±‘i|œöæ­*ÔªƒÒÖj˜AÇJ°±Ôª˜íH\n¢”¦ÔÕtF\rI\Z†\Zfûµ^K0;VóB=*ƒ4¹†s³XƒÚ³.tåprµÖ¼\Z«%¨=Ei\Z(¦pw6J‚V©¶àzšî®,ö¬Kİ9dàûWU:éîsÎ“Z£\0HıK»µ,ÖrÄ~e¨vk{§±–«re—pÁíR@ª ÔÕˆ[#ä\Z‰G©¬eÑ‘8ÍDÜ5Yš6^HàôªÏÖœu&A»&…jŒjM¤U´EÄ æ…ÎG¥‘”¸lt s®3ÆA¨`Mò\'½K4¥à®Tbd1\'ÍÅeª‰¢I²ÅÅŒÃç¨Ì]ôª‰…~Ÿ)àŠé~ı©ñÜúšææ` cšÊmÙšÊ)ju¾¹T’krFIÈ®ÙycºW•iwMo}ŠpAÁ÷èi~#³ÜXÓµÏZ6‘¤]ÑrÉ±¨ÏÁÅk¦1X2ÈY¾ñëZËp1Ö²‰R-çŞ£vÀÎjp1Áªïq¸iÜV&2Ô8ª¾e=I¤6NÒ`d*2à÷¨¦Ê…_‘Ş 7\n‹µ˜‹dQ<ª85M§f$“Q™sîiŠÅ‰$íZ×LÖš9ÎÌqïX5Ìqâ`\rmø¡„zDj§8ÇÓÓAY6s×Õ¨œtë‘YWç‘š»,ŞõJRïÀ’½îomÔàqOÔÕUrjej¶—Ú¦_­VSV#<VL»Û5*j(Ûš²„`T\"y©S¥Q@™*{Š™@õ¨AÇSR©¦\"QJ˜Y½4\Zã¸¢ÀYeç¥1b¬.ãµ)LÔPx‡aP4#Ò´Ú>*&˜r[îªÏj¸#ml4uÅEì?5‚°9QŠÍŸF³ò\nêÚj…à^õq›D¸¦q3hx9\\æªI§IÌ Wq$2ZÏšfÚ£šÑW—R}’g*G›Fá‡J£\"ß0®‚òÉ‘‹Y7îëÖ·§5r*Bè¤«ó`ô©‚pG¥F#lãXOöºô5´™„QO¡çÖ­z&P=ê0j÷D½d9a¢®[Ä7òF}}j•³¨KıÜàÖØ<«ŠÆz\ZÓ³,;/…O­fd˜*ŒŒÖ”‘4±y²ü‘ÿ\0\n÷4ºu™\"K¶cLí¬¢ùSlÚJú¼¼BÎ3”lWA¢İ‰˜E1%—îóY‘À\ZÚ#æOĞUù¬ŞÎ(o\"ê‡YÍ¦¬ËŠ¶Ç_¢ ¿:°$é†¬ËY<èÀàŒŒTÛ}`U‹Şiõ¦™\0êj–ßsI°g¦háºAÓš_´9à{Õe\\tñ’9 Z2†çvi„æ€RÂ€\">õ$ô©Hõ¦•ô şƒÍÔw‘Ã&§ñ{´¦2:–$w«…U\'bI$VˆÍÔHÈ!0;W\\}Ú\'|Õıa­AàŒÒ}›Ú´Š{S|±ø×-ÎÃ’SíS)âª‚j@ÄWCD¦\\SïS£wª!©’_Â³h´ÍpjÂ6+5$ç“Vë6†h£Õ…`x¬ø¤«*ùÅ!2à§©ªèşµ:µ&\rHÇ\"sAçš¡íX4+WäVnÜ²ÆµÔqI­GĞ“GWYj&QJÁr›Gš‰â,:ÕÆZaQIŒ¦bõëLh?ÙéWvqHVsB¥pV¹ËÂmn3Ø×hÑ1Xz¾š&‰™O#œSê4Ì†hîaÊ¸\'ĞÖìHàóèjI„ÖÎG<\ZŠK´‘FøÆîõ´\"Óº­±†Vâ“~[¥M ^ªOÒ¡³œ(9úWZ}Îi-t\"î\\Èªø9­gqŒùmùS\r¤ˆÙ1*ÔÒĞÎQoR¢õ®‚Ù­NŒ$ØñIóßx\ZÁÇÍéÍkh°ZÜM*Ü¶Ğ•çÔ§ªte»kY5a)ŸÎ´/Ê”ŠÎ/‘;ıT:¢Ãn!…rËÆîÔı?Nº½´¹\nİsŞ¸åwèv.å‹c=Ù¹Æ!‰H¶¾ÊOhŸ¦jXí–V%Ò¬:mîÖ-İ”ghe„Bİbrµ©Œö¬Í-vßİ¯ºš×Ç¥îG·4mö§ãš;P!€\0hÅ?˜æ‰ŠÍ;˜4Ä3m}jLPG(ÑøxbÈ’ûAc\\õä†{É¤8åÏJéô° ÒÁ*m-^+• N0	&ºªéM#––µ$ÈŠÑ·&Şô`×!Ôq3Úœ#ö¢Šİ±qÒ”GE 8*dcE˜ÉÑêÔrÑECn7ÍXF÷¢ŠB%Šp4QL’kFÛs×­oG÷ES<*\"¢Š(`DGZ(¨e!1šiôÁ¢ŠB\ZCzb¡–ã\rŞŠ*’‰y Åtüqêk:OFÍÄ†Š*“k`ná„àVË1>Õ¡“k\0\n‘(ÇµPæØ$$ö›~è\\QX—ğÏµÛÊGqE)ê4qî˜xÇ5©¡ií¨ßyŠ’¤ñEé}“NÌé4İ(]Ù—{)Ç5¹Xğ1·úÑEpM»PØ™Ssd$ƒæ¢ŠÏ¡}J:pêîLp\\/ä+K9è?\Z(¦„÷“äÑE0{Rí¢Š\0]´˜¢Š\0\\qMÛ¸€$âŠ)­É{Ë4ÃÉ»ÀÀïŠç€:ÑEtb:#›Õˆi>”Q\\§QÿÙ','S',1,'A'),(2,'5237715','liliam','campo','calle 26 esquina de la carrera 35','0251-8481459','0426-9575962','liliamyolcampo@hotmail.com','F','1957-08-07','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( \Z%!1\"%)+...383,7(-.+\n\n\n\r\Z\Z,$$,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0±\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0A\0\0\0\0\0\0!1AQaq‘¡ğ\"2±ÁÑBRbáñ#3Sr’²Â$4c‚¢ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0#\0\0\0\0\0\0\0\0!1AQ2q±aÿÚ\0\0\0?\0æµqµT)lLFDÅ\\LFÂÄ‚È£FE\Z„,FÄÄ(£YŒ!”4×C}\n&6$·Åá¦o‰ÆÀt½R6¶ŞÃ)÷zh-Ïw­èho¯TÒ\\~èüU nõëù*ğô&5ªz\n}•²B\0A¯z´I¸Xñ\0rª®w¿¼êyÓSÕJüŠî\0h4¯Ü ¤<¼QËSkó4únïA=Å\\ˆµl8’Ûİr¸Tu\\¹\"ØdXá¨pu”šs>A-p\'Š¶÷ÖœÎŠ“èñ gZ‹9kÛND6×}–a°4Ä×Áõ°ÖÆ”\'ò«Fnà\r5ÊğA¦††ãÄ#,m.Mr–¸U© ¶š¤zK‹§ #-É \ZŞ”Òú›\nêI@¯Ê\0µ¸ğAÉ1y½ÇÛ¾©†îÚr‘]ãâœkOº›U\"ì3K›C\\ÆŸó\ZòİeLÒ48ækbç²w4ps˜+¹C´Ëõ#qqN¥üÒç–ÇË(-\r}‰\0î\rcEÔ{\'Š–L>w{+|¿\r\\+@t\\u‘TĞR®º7³İ èÁ‰ô-Í™¤×ZTŠJÓôX[t(·ÿ\0\'1N\0A¾¨¬-H=ˆy#LÅCØšKd	,i¬ŒBË\Z<Ñ f9š4Ñ¦\nÖSâ¼AAÎØé`êó¦½Ş¬™M\Zf&\0<E½®é[kã§4¸µ2™ˆG12yQ‘5QQ°µ#_Ğ±SĞ±I®…ˆÈ˜ª‰ˆÈšN6­#Ú#PMiRÚtÜ·ÀÅ¤ûE´l§í\\nÒ­õÈ¢zm#Ò~İS&È\ZÜ­ÿ\0ØòàaÊ(?—3øR‰¥Æ°Ş}oú\'êüï	³<w=OáRæ¡©:’¯ ¥Ó¢°3p×Õú&EÎ…S#(8ıù¦ÎŠ¢útùˆÜnÃÓâ~»‡Óò—Ñü•ûŠ‹ÁBC]}T‡}{Õ,„¸§¿Ø×â)Š2t\ZúõÑ5ƒf\Z\\_èšl=•SÂÂÍ÷ø}SÑ‡¾‹Ÿ“šïQ¿×mJMi¢\nPöÛwåªèlÀƒ¹´v(\"Ág=—µåÁúhƒïázxVê.uwàGm-šæd¿¯ó]Xç2ñÍ–+q½¾ôğ)¾ÎÇ‘L f³Z\rµĞp%,l‰Ù­—”9øZüUZÍÕ{1;ä‚7İÃ15½nxtOr¡öLbk@ùZÂâÚzÕB‘C¹ª§µæªœÔÈŒCHÄÁíCHÔÉX™‰´¬ALÄ<ìKæbs;ùØ˜\'™ˆ754ˆ\'52WQ°µ\rQğµ%	…¨èZ†¨øZQqµSQqµ#ZÆ­#Ú\0QÚQ¹9Õy=Â‹|cW>ö¡06×[‚ßR<Ò9ëD.½·éùG…¡£¯Ü×…P1RIÓíüJ+5Møÿ\05gïc!âOòŞ|4êˆo!r.>İ)ôæ…c­ëOçDd-&¤ÛÕ‚›W\"v\0Vû€õº¨,KªI\'×LµxØS_áöT^üû”Ã ıÉ\'ì™l¼M{úŸ\\WÃ™ÖÒ÷ú›»ÓÌ@\r;–|œškÇÇ±°´A °è†4$-L`jåµ×\"ÆD½sXTŠU´v{^ÓUÏ¶–±ÎÁ¨]>`´®ÒÅG¶áËWL9±ÜjÑ›ıG»û<•í•Á–Ì\0¯˜Ei%·[Ç³ˆì@\0ØŠÓB\r~½ë·}8]‡ò×Mü•„)Ğ,!$ª!Và®!AÁ\03Ú‡‘¨ÇCÚ€V æje+Ps50U;RéØ›ÌÔ¾v¦Eµæİ4¨¶é€ğ„|-BBğ„Œ\\\rGÂÔ,RDq…DAPkBä~ÒñAøÂÖş†5§­Ü|œ^kWíDóˆwşWÑ®È<šŒ}8FÓMç ĞzâU¾ğW××‚¥‡Zhéâ§\Z»ÃÍ:¸;Úšy~}qDË6 h-Ôúõb¨ÙGï:ıMçÖåÃ]Ş¯ë‚•	cH»µ>CU&Ç_^½sP…„š‘®5†:ı?+,óÓl0ÛÜ,¢”ëöÆ*XÔÃ	åË-ºqš†‰È”pí¢1ª6¥ª4E{µ[š„ÚbµÓ5·Ì½ÚFn\Z­0ê³Ï¹ZAe×Kös³^Ì³°TYè@9‡ˆó\\æaC­—]öqŠcakÍÌjs\0ø®ë\\:­ä,!zÙ Bƒ‚±AÁK‚¥áà©x@	 BJÒ$¡0]3RùÚšLùÂ§ÔÛtË.TÂğ\0Rc è‚\0ˆ$Äq„<A\Z\rcZ¸*J½îwê{ÉãrŠú‹çÜkƒ¥q\Zfq*iöóDV,Œyßï÷WBZ>#p4õÄ©ÄÀ#s«û£‰<¹\0~Š†ŞÃA¿uQë]j.»‰ÍÆıdtW±´5¥ºïâU0Ç˜Ği¡&İÌ[²| €sÜ\Z½ÖÃÇ’Vo¡¹‰Á^\'~şî2‚‡Eª0H*MĞi›èAÖüÓİ”ëz\Z.~L4ß=¶<i”Bfe<[KBåµÒ‘Å±Ÿ3€Bb;K~[•®í½Ä_Å*Ícf$7+K‹ˆÔ7yîl8¾˜gË¦Ü6üÏùîïÊ¾,f*µÉQ¼©à»C3)ğ“¾í:~;“¼jC¾aNbãòËŠÏÁcÉ/äæ,xy£k¸Ê†ÒÕ»¡SdÌ}ìTåmZz,ö§:Áá}ìÁ‡BoĞ\\®ƒ€.†XYmá{ÖµòZöÍÄç9Õ-s~jìüb\\DE§å%Ş¿e¦yÜ²’,&8Û—şÿ\0Æù,hÿ\0€óùOGhQ9‡¢Ú/u¼ç¥D…aP)’·*^¯r¥èäIB2D,¨\0&	|á2™/œ&E˜€€xºcˆê˜>	„	øÑ ¡GD)ˆh‘Q ÔíW8A!n¾íôÿ\0)\\€æ;ÍM)öò]ÿ\0hÜŞ-pñƒIapqĞwV„¡x¼{òŠq\Z{ÉWápäë¦áöBáÚ¯®à¶í“³Å=ß•Ÿ.3N<~»,nà‡\n[AKf\'\rï\r\\Ò¼´‹õ¯álíÁYzÌ®‹å­Åƒ«\Z2@\Zñ­uGa6^F´kCcMÚî[gò GÅ‚«…´Q—%±S	`ğ”ŒTnI¶¸½ëı‘‹nZv4fyê²Ö—.Ê&ØÎ‘Í ikh\\²æ5Ó˜§MQ›c\n,±‡6€–‡1âh{tĞ\'F\n}TæÃº¼–ørÜc,¸æ^´}l48‡„Q­/Ìãl XÙ nK³Ëå.Œeî½Í²Z@ëEä8\nnNóTÎ,anÎÂR˜´+_7ö×]5œL\"®®÷zû§%¸¸X7‰\\z5 WÅÁ,ÄGR4\ró)ç³¶ãqp§»dl»šââç¥£À-x¦òˆæ¿<zıº j’À±v<ôJ‰R*%­Ê§«\\ªz‰²¢dCJ€\nd¾tÂd¾tÁv!/~©†!/~ªˆ	„	t	„	QĞ !(è’1±\"£BDŠ ²IAqĞO@*Jùÿ\0‰Ï#K9Îu3Zw.ñ´˜]…Ñ½ î«š@ú®{±Âi¥9‹ˆÓ\ZöMmÆ§×Ğö\\•kHĞ€|—:…·ò=ş‚İ»%.hòïaò:}Ö_äMÍº?ÅËWUµaÅSL66;§‘ä’;rŠÆD`0×\n·ÍSA©²w³°´ê—µ]D¶“rÇÜ´)¬òºĞmEÂĞöÃ>;qF~–-ÂÂ8A;Ò<Ô4:„ú)‹ÒÓ‡,NP¬ÄOk%¼AF`Éä©CâFÅE$¡vì‚6¶Bà2ƒFÒïøš-Âš÷§óu¨Œ¬—µ¤5¬sİ  \'¯¯$÷Ùæÿ\0×â?·dÿ\0Aç™k±ìÙqc¤%°X5‘Ö»»Í‡¿öjŸÑØ((7SUÕÅË›?£e‹-Üè•¤T\n	*^­r¥åLˆYJ\"B…” ™/œ£¦)|å0_ˆ(›£q\0ãuD˜@RÈ\naH@Qğ”¶„¤f\"˜ƒˆ¢ã(\n¶¬™c>·.Œfw—8’|×bí0E†.îàºâşğ“nÿ\0Âö×á£©àS‰Œ÷‚t6päN½Æ¾Í“±Œ­ÍP×6@×Ô€Ğ,âx\\T÷¥{F,®ZâÓãAë’‹~ºkWq×0l4L+Wì6ÑÏG\Z–iÍ»–õƒ`Ş¸oºvıt¯¥Î»ğí—¶væ¹®¥A\"¬u88hz§€67\n/L÷¿I¶×hÈ7U¦¿mµòãR8õN1»¹Ä‚u4JŸ³(n4JY}^µã0òòF‰Ô3Ù/ÃADk›@…Dq%Òºªéœ©ê¡Úº\0ªÿ\0…ÃˆÃM3s5ÎdT&s]“)óßÕJ|Cca{\0üĞ\"°¸\'Ã<Ìkš0ó³ŞÖ™²éï(Ÿ¤ù­¸¦÷\\|Ù²pì+\\Ìàæ‘˜y\']Ÿ³d„†ÿ\0rÕ0»L>:€eÌXà2æ•¿ÁH¡î[Gf]Xßş0øjè¹¯‡x½^hD¨\"TPH9Pò­qT< )¡%(‰\nR˜\r1K§(ÉÜ—Îä,A@¸İ;/uÕ\0P”Â%p¹\r ra’¨˜Bå&eEÆä.E°Ù¨{LÄŸtÖÖÕ­7Usl9ø‡PºG´H£e78^k›Äİê…?¶Øøé=’?õ¶Ä:(ßMÆ€‚<\Z<R¾Ülïu8#G¶´ßVoóõFöRF²v¹ä46g8Ù r{ª©ÆmsZÑğêH¶V6ºó&ƒ©:ÑB±õÍÈèdï¢èMÛ¢¿¯ì‚|‚×1;\"‘J9–>½jØ3»â\\YúìÇ¸Ù·ğì¨dƒ˜u\Z…3Úœ=,×wªñxhfm^Æ¸ÒÄ^•K?å|+›VÈbv¹Cº¼)rµÇ	gM1Ã7L·°a ÔêmMÉ\'háŞâZğ:Š q—vcîñ\r\"Â¤ô°H±;f’.œoä•â/6\'JÁä½8 E–¹ƒÙ4§ìƒJõ¢:,8f•ï5YåŒŸ–7¡®ºÆS^†ÚÛI¸x‹İ®Œ´ã JKn¢mÔİ#í¶Ó»`iı÷ÿ\0´}O‚sìÿ\0k^Èœà]\\\ZHÌÊ°åpÊW63¹ò—<ÕÏ&§™[VÅØ’¼	\"ÌÉYG4Òçƒ‡boÄÂHã¹}öé»;g2|4±ü¹Ù?º“[àÖµŞ§Ø©W±õ¥¹˜K]õ.Vº<L-¨â[ \"´d \rr“sÀòL¶C)ššãâÖªsÙQ|±´(•é*$­\"J­ÅIÅTâ€‹ÊB¬yCÈäÂ©\\ƒ™Êé\\‚™èçr];‘S½/è “¹ç]_;NuÕ\0¹’¸œ…È°90ÉL/GÀô¬/FDRØ^Œ‰é\Z­»D[Ê£¨5\\¥˜BŒ\"ípñ­?+±¸Û§¢´Ğ@ÖÎç´PKú•wxYçÓ\\?JvF\n\\D:7,myÜĞêÔBMtö ]#bìhpí\"1sLÎ7s©¥znÃrÒ{\r‚Ë$ò1•ÊÑ˜ŠšTš\rN©¾+Ú€˜›$¼\\=î½:ğw½í|?Ä7ƒQÇJ%Ña…j»?jÉŠ’ÈÁ`KX	?	Ğ’@¹*ı\rF›ÿ\0+‹šËvqK1‚Yéb–ceÄ´Ú<ŞIîadÄ˜ÈQ³Æ³+éÏñ;Nmñ²ø—“vÓ¹oø¼3\nCŒÃF\nuÉ•„,.*ßsk¢ß@Äâ€²”Wµ\"íŒ.’8C¾hÿ\00 y¦L’º¢‘Ìi øÚA6¡Æ«N;¬¥gÉ7µûì\\Ï“	•¡­”=£ãp§: §½—ÆJ%lx¦ˆß2^Ù®(E¯¢Ş¶n‘ÄĞİ\0Üˆ÷@ˆ\n›ó]ÚÛ‡è4Â7FsP‚ ‹EÒÇa_‘ÒÈjç¸†“¯»iï\0&[BÍı³CÉ¿¨ø[½C@\0PÀ#]–úH•V âš^8ª^å\'¹P÷&{Ò9NG¡%z¹^‚™êÙ‚™è%½.è‰Ş—ÎôÀyŞ‚sî®™è790\'#azY‘‘=0kÑğ½(…èè^7…èèœ”C\"¾lk\"asÍ\0ñ\'€Ï$nİÛ‚,Ææ´kkLÎá^R´]·¶\'Ä4ZÖŸ…­¿R©Û;MÓË˜‚\0³\ZHçÌêR¹˜OêNA´Û3@µÉõ©^a‹d–6¼’ØÒ:\0G‚¨²‚¥WáÂÎkƒ?¤‹ƒDÿ\0öîÍ\04¸Xp\Z+bº×;#¶‰€:Jf‚E«ÀÓrØ0î^NXÙl¯N]ÍÄdÎË²ÿ\0»øU¸ŸVu·*1-µÒPIû@Î!)Äm`MkU<V\r‡ô·À%òái¥èvöly:!EkR¬QFK&×)æ èE\nÒ*eÅ†Š“@‘6”`ûIÁHYï\rkˆ÷oş±–äîí(·íƒíU®£q‘ 2Dj:˜ÍÀèJå;WÙ&/n†—¡èJö\'euò»­ê7éã7;y™unŸJáq–’Fàæ‘ğ¸\Zƒ¼ı•åË˜û\'ÚŸ“g|Mmtsu¨¿ré%ÊlĞzç*Üå9T÷ ={Ğò=cŞ†‘è$zY¥‘,ˆ$f‘4ŠsHšDs=/êÙ¤@ÌõATÏB9Êr½\n^™*ñb\0Ø‘°¬Xƒ´zEş3ş‡,Xi×ÅD,X™Å»ÇT·ó«)ÇÕgã~ökò¿»î·ØW‹7÷®î/é?î¢ı«-KqHj±bº¡¦X±T*D§lÿ\0fî‹-¸ÿ\0´cŸõ­a[ï[Ö,^‹ÍnÍÿ\0ï£êÒåÚ\\±bŒ½TTåK–,Rj$BÈ±b$ˆ9V,@2U‹\0fAL±b`¨R½X™?ÿÙ','C',1,'A');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios_por_asamblea`
--

DROP TABLE IF EXISTS `propietarios_por_asamblea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietarios_por_asamblea` (
  `propietario_id` int(11) NOT NULL,
  `asamblea_de_junta_id` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`propietario_id`,`asamblea_de_junta_id`),
  KEY `fk_relationship_46` (`asamblea_de_junta_id`),
  CONSTRAINT `fk_relationship_45` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`),
  CONSTRAINT `fk_relationship_46` FOREIGN KEY (`asamblea_de_junta_id`) REFERENCES `asambleas_de_juntas_de_condominios` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_31` (`condominio_id`),
  CONSTRAINT `fk_relationship_31` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `attribute_7` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `fac_id` int(11) NOT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`attribute_7`),
  KEY `fk_relationship_59` (`id`),
  KEY `fk_relationship_60` (`fac_id`),
  CONSTRAINT `fk_relationship_59` FOREIGN KEY (`id`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `fk_relationship_60` FOREIGN KEY (`fac_id`) REFERENCES `facturas` (`id`)
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
  `gasto_extra_id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_74` (`gasto_extra_id`),
  CONSTRAINT `fk_relationship_74` FOREIGN KEY (`gasto_extra_id`) REFERENCES `gastos_extras` (`id`)
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
  `area_comun_id` int(11) DEFAULT NULL,
  `fecha_reservacion` date NOT NULL,
  `fecha_uso` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `numero_de_invitados` int(3) NOT NULL,
  `lista_invitados` longblob,
  `estado` char(1) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_18` (`inmueble_id`),
  KEY `fk_relationship_19` (`area_comun_id`),
  CONSTRAINT `fk_relationship_18` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `fk_relationship_19` FOREIGN KEY (`area_comun_id`) REFERENCES `areas_comunes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES (1,1,1,'2014-02-02','2014-02-12','16:00:00','22:00:00',0,'1-Liliam Campo de Rodriguez\n2-Eligio Rodriguez\n3-Elisamar Rodriguez\n4-Victor Hugo Rodriguez\n5-Jose Leonardo Jerez\n','V','','A'),(2,2,4,'2013-12-10','2014-03-01','20:00:00','03:00:00',0,'1-Liliam Campo de Rodriguez\n2-Eligio Rodriguez\n3-Elisamar Rodriguez\n4-Victor Hugo Rodriguez\n5-Jose Leonardo Jerez\n','A','','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrador',NULL,'A'),(2,'propietario',NULL,'A'),(3,'junta',NULL,'A'),(4,'empleado',NULL,'A'),(5,'root',NULL,'A');
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
  `tip_id` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_realizacion` date NOT NULL,
  `condicion` char(1) NOT NULL,
  `estado_solvencia` varchar(60) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_15` (`inmueble_id`),
  KEY `fk_relationship_16` (`tip_id`),
  CONSTRAINT `fk_relationship_15` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  CONSTRAINT `fk_relationship_16` FOREIGN KEY (`tip_id`) REFERENCES `tipo_sanciones` (`id`)
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
  `tipos_servicios_comunes_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `recibo` longblob,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_55` (`tipos_servicios_comunes_id`),
  CONSTRAINT `fk_relationship_55` FOREIGN KEY (`tipos_servicios_comunes_id`) REFERENCES `tipos_servicios_comunes` (`id`)
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
  `recibo_gasto_extra_id` int(11) DEFAULT NULL,
  `attribute_7` int(11) DEFAULT NULL,
  `descripcion` char(255) NOT NULL,
  `banco` varchar(60) NOT NULL,
  `numero_movimiento` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `validar_pago` char(1) NOT NULL,
  `comprobante` longblob NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_61` (`attribute_7`),
  KEY `fk_relationship_75` (`recibo_gasto_extra_id`),
  CONSTRAINT `fk_relationship_61` FOREIGN KEY (`attribute_7`) REFERENCES `recibos_condominios` (`attribute_7`),
  CONSTRAINT `fk_relationship_75` FOREIGN KEY (`recibo_gasto_extra_id`) REFERENCES `recibos_gastos_extras` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `penalizacion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_17` (`condominio_id`),
  CONSTRAINT `fk_relationship_17` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `sueldo_base` float NOT NULL,
  `porcentaje_prima_hijos` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_12` (`condominio_id`),
  CONSTRAINT `fk_relationship_12` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `condominio_id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_73` (`condominio_id`),
  CONSTRAINT `fk_relationship_73` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `condominio_id` int(11) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_49` (`condominio_id`),
  CONSTRAINT `fk_relationship_49` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_publicaciones`
--

LOCK TABLES `tipos_publicaciones` WRITE;
/*!40000 ALTER TABLE `tipos_publicaciones` DISABLE KEYS */;
INSERT INTO `tipos_publicaciones` VALUES (1,'Queja','A'),(2,'Sugerencia','A');
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
  `condominio_id` int(11) NOT NULL,
  `nombre` char(60) DEFAULT NULL,
  `descripcion` char(255) DEFAULT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_54` (`condominio_id`),
  CONSTRAINT `fk_relationship_54` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`)
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
  `rol_id` int(11) DEFAULT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_91` (`rol_id`),
  CONSTRAINT `fk_relationship_91` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'admin','123','A'),(2,2,'propi','123','A'),(3,1,'liliamyol','belleza57','A');
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

-- Dump completed on 2014-02-11 21:33:46
