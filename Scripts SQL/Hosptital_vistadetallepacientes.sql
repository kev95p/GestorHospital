-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `estado` enum('Pendiente','Completada','Cancelada') NOT NULL,
  `fechaCita` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `motivos` varchar(100) NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `fk_citas_pacientes1_idx` (`idPaciente`),
  KEY `fk_medico` (`idMedico`),
  CONSTRAINT `fk_citas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico` FOREIGN KEY (`idMedico`) REFERENCES `empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `idConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `FechaConsulta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idConsulta`),
  KEY `fk_consultas_pacientes1_idx` (`idPaciente`),
  KEY `fk_consultas_medicos1_idx` (`idMedico`),
  CONSTRAINT `fk_consultas_medicos1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_consultas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapan'),(2,'Sonsonate'),(3,'Santa Ana'),(4,'La Libertad'),(5,'Chalatenango'),(6,'San Salvador'),(7,'Cuscatlan'),(8,'La Paz'),(9,'San Vicente'),(10,'Usulutan'),(11,'San Miguel'),(12,'Morazan'),(13,'La Union'),(14,'CabaÃ±as');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosticos` (
  `idDiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL DEFAULT '0',
  `idMedico` int(11) NOT NULL DEFAULT '0',
  `fechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diagnostico` text NOT NULL,
  PRIMARY KEY (`idDiagnostico`),
  KEY `fk_paciente1` (`idPaciente`),
  KEY `fk_medico1` (`idMedico`),
  CONSTRAINT `fk_medico1` FOREIGN KEY (`idMedico`) REFERENCES `empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(40) NOT NULL,
  `segundo_nombre` varchar(40) NOT NULL,
  `primer_apellido` varchar(40) NOT NULL,
  `segundo_apellido` varchar(40) NOT NULL,
  `idEspecialidad` int(11) DEFAULT NULL,
  `fechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idMunicipio` int(11) NOT NULL,
  `Residencia` text NOT NULL,
  `DUI` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `DUI` (`DUI`),
  KEY `idMunicipio` (`idMunicipio`),
  KEY `idEspecialidad` (`idEspecialidad`),
  CONSTRAINT `fk_empleados_municipio` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_especialidad_medico` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (9,'Kevin','Geovanni','Pleitez','Geovanni',NULL,'2017-05-22 11:46:09',1,'col Santa Marta','12345678-9','pleitez@gmail','12345'),(10,'Erick','Balmore','Galdamez','Balmore',NULL,'2017-06-07 21:21:43',31,'Izalco algun','45657686-5','pleitez95geova@gmail.com','78234932');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedades` (
  `idenfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` enum('Infecciosa','Congenita','Hereditaria','Neurodegenerativa','Mental','Metabolica') NOT NULL,
  PRIMARY KEY (`idenfermedad`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades`
--

LOCK TABLES `enfermedades` WRITE;
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
INSERT INTO `enfermedades` VALUES (1,'Anemia','Congenita'),(2,'Asma','Neurodegenerativa'),(3,'Cancer','Hereditaria'),(4,'Colera','Infecciosa'),(5,'Depresion','Mental'),(6,'Dengue','Infecciosa'),(7,'Chikungunya','Infecciosa'),(8,'Demencia','Mental'),(9,'Ebola','Infecciosa'),(10,'Eyaculacion Precoz','Mental'),(11,'Gastritis','Metabolica'),(12,'Neumonia','Infecciosa'),(13,'Rabia','Infecciosa'),(14,'Osteoporosis','Neurodegenerativa'),(15,'SIDA','Infecciosa'),(16,'Sindromo x Fragil','Congenita'),(17,'Sindromo Down','Congenita'),(18,'Vertigo','Mental');
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `enfermedadespacientes`
--

DROP TABLE IF EXISTS `enfermedadespacientes`;
/*!50001 DROP VIEW IF EXISTS `enfermedadespacientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `enfermedadespacientes` AS SELECT 
 1 AS `id`,
 1 AS `idPaciente`,
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `fechaDiagnostico`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Anatomia Patologica'),(2,'Alergeologia'),(3,'Cardiologia'),(4,'Cirugia Cardiaca'),(5,'Cirugia General'),(6,'Cirugia Plastica'),(7,'Cirugia de mama'),(8,'Cirugia Vascular'),(9,'Dermatologia'),(10,'Endocronologia'),(11,'Gastroenterologia'),(12,'Genetica'),(13,'Geriatria'),(14,'Ginecologia'),(15,'Hematologia'),(16,'Medicina Interna'),(17,'Nefrologia'),(18,'Neumologia'),(19,'Neurocirugia'),(20,'Oftalmologia'),(21,'Otorrinolaringologia'),(22,'Oncologia'),(23,'Pedriatria'),(24,'Proctologia'),(25,'Psiquiatria'),(26,'Reumatologia'),(27,'Traumatologia'),(28,'Urologia');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_perfiles`
--

DROP TABLE IF EXISTS `imagenes_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes_perfiles` (
  `idimagenes_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` blob NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idimagenes_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_perfiles`
--

LOCK TABLES `imagenes_perfiles` WRITE;
/*!40000 ALTER TABLE `imagenes_perfiles` DISABLE KEYS */;
INSERT INTO `imagenes_perfiles` VALUES (2,'adjapdijqpdapdma;dma;ldd','image/png'),(3,'adjapdijqpdapdma;dma;ldd','image/png'),(4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0x\0\0\0u¢ùo\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0\È\ÒIDATx^LıWp\\Ù¶®‰ñI½«H\Â{$2‘@zï½·	h@x A\ï½÷å«¶9g\ïc¶÷Ş›³\Ïm\İV„\îÃ•ÔŠÔ­\îP„¤G\é\é\×7\ê¨ûaEúÌ•¹şõ›1Çœ¹\åø¿ÿ\ÏÚ·8¡‰™y-Ÿ\×ğQ\Õ4×©4\èRq¹K¥.‹=*r¨¸(_®Ld*×•­‚\â<\ËQ¾\'G¹%\Ù**\ÉUQQ–\\…9**\äzqò]Y</K…E<\Îı…ö6wi¡JK‹T^\Îp\Éò(,W \æS0P \ì—7T¢€×«ÒK\åşR••—¨\Ì_\Î\æQy\Ğ-¯Ÿ-\ä“\×\çQ™Ï­R_±¼¼—\'\à–\'XªR.½\ÜW\Âsİ¼¿7X\"\ß\Å}~\Ïkx¿\Ò\0\ï°\ç–8—ò¼r™óz·7WE\é|\ßl¹\\\é*-+’\Û_ 2ö\İ\ï-VıK\Å]j©öj¸;¬Ù¡˜\ÖöU\ë\ìBƒN/\Õ\ëúZ»®\íÔµãºs²_w6†u\ë\ä€\îŸÒ£³#z|a‡×³{ôøü¤^Ú«\ç÷\éù¥ƒzym^/n\Í\é\Å\ÍCz}uE¯oÑ»‡õúöa½¹{L¯\ïÕ«»‡y|EO/\Ì\ëş¹Yİº0«\Ûg÷\êÛ­\ÓS:³2¤£3½:¹oP§W‡µ6×­C3]ºwf·.™\Öú\\—Ÿ\Ó\Ó+‡ô\ìú¬\ß\\\Ô\Ë\ÛszsgQ¯.óş³zuoVo\ïĞ«ûszukQ/®ğ¼k3zv\ã \î]Ú¯›\ç&tacP\'w\éòF¿®Ğ¥\Óı:±Ü¦ö\æˆÊ‚*ñp¼½.Õ¶Gu\åö¼~ú\Çwúõ¿¢\ßü\Û\ç\Úò?ı\ÏÿO\í=4¥\É\É}:÷\àœ]8¥…#\Ë\ê\İÑ¥peJee¹ò”¹TTš£\â\Ò|¹\í\Í\\9*)+–§”ƒ\í)’\Ë¨Ê³x^÷\ç¬bù\Ê8ø\åò–mn>¡|B…\Âe*Pşh±\â¼xmH±:¿’uUÖ†UUWª%¡Š\æ¸j¹][VªÙ¯\ÊÆ¨*\Z\ÃJ6\'•lˆ*^PEUD‰Ê \â)¿blÁd¹\"\ÜIúŠ–*õ*ñ*q«\Ü@¸\ÊØ‡R`ó±²\Ò<€UÀe>û[\Ä~—\È\í\æ\Äñğ]\\|\ß\Âln“«(O>o¾\Êz\Ğ\Ïû\àxÄ£dÜ«–º2\r÷øµ<Q¥¹jŸ­\Ò\ÙCõ:¤\Õ\à\å#mº\ÍÁ¹{rDwO\r\éÁùa=87ª‡§\Çõ„ø\èò>=¼¼W/\îŒûõôü>½º:§—W–ô\ìòA½¸t@\Ïo-\èÕe½p¯o­’#zyó(\0<\Â\ëu\Ï\0xzŸnŸ;¨›»uqmDM\èÜ‘=º°8ª³kıZ\Ù×­k\0\ï\Ş\Éi[hÓsSzy}N\Ï\ï\Ì\ëù½\0{Yo­\0¸Cz\Ë\å\îõ\0\Ş\æó\ï³·gôø\Ê>=»¹OOoN\ëş•İºuq§®l\ìÔ™cMº~~‡n\\\è×ó£:¹Ô®¶Ö \ÊÁ¼F¦«ô\Ñ?\\\Ô\ÏÿöV¿ü\Û;ı\îo\0ğøÿ:°4©¡ñ=ºüğº–.¬iş\äªö¯\îÓ©1Uµ\Ô\È#y\0–\Ç[ ›•ª\Ä\0‹¸|ù°e®J¼…r•@b\Ï/÷¹\äpa\rO\rù`,´\\~@K–*Q€ª‚JV\ÅU]\ëWU]L©\ê R€¯¢6®Êªğ&H\ëCJ\Ô•¨I(VRÜ€\Ék¢\Õ<V\ã>¶\Z€Y\Í}•~E*\Ë\å½#É Â‰ |\05,ƒaƒ\0p\Æ\Ü\\HQ{Ü¯Æš2M÷ú4\Õ]¨†%b¥ò…}*r\Ã~°y©+C¾RN$¾“ğF#%Šq\Õ\0ú¶¿\ÆúüZ\İ×©¹z]ª\ÒÅ•f]ZkÒµ£-º¾Şª\ë\'šu\0Şù\îŸÖ“³c°\à=ırPŸ^9 g÷³Mqß´_=\Ó\Ì\é=:;\r[\î\Ñó\0\å\ê!½º	ó][GôúÆš^Ü€aÊ›€÷\æ\Ùºy|J§WFuõÄ¤.\0¼+\0r}¡ƒ}\Ùø\çtı\Ø(l5\ã\Í\0°e½½¿\æ€\ï\å=˜÷Ş¼\ŞÀW·\æõò »»\0+\î\Õ\ëK\0q†}8\ÈIq@O¯\î\×\İ+{tûŸsnP—\Ï\éö¥	¶q\İ>¿S‡\çš\Ô\Ş’Û—ie)\Ê\ÕØZıÃ\î\ëÿöF¿ú÷ôË¿¡-ÿıÿùÿ¦Å•]\ê\Ò\Ùû·t\â\æ-]\Ò\ÌÒ„ö.\ì\ÕğÁj\í\æ\0G\ä//\\€\núJò\åòp\Ğya‹ò<G²J`	o)rW^(7 ,…ù<~¤*ö<\ÔR\Ø\É¼@x­,€,Q]¦\ÊJŸ’€¬‚ûªkcJÖ§\0O©z®s;^\íx€fÊ•Lq_\0¬,SFŒW$¯°¼OŒ-š+\Zˆñ€ü\01G\Şœ?fl\0„e\Üö©¿9¦“:;›\ÒútBK^õT(ca!Š‹r	öÀ”~¶0\ß\'\Z(V’“¨¾\"_Cm>\íMh\í@N¬Õ¹\Å*]:Ô¬\Ë+º~¸Y\×\Ö{t\ãT72Ü§ûgGõ\àô \Ú\å€\êñEÀvÙ€\0a»g—7@÷\ä\Òô—·\çùi=µ\ç!•/®\"\Íl\Ï.#—\çõ\ä\æ÷¯\è!2|ó\Â^]9±W7\ïtºxd‚\Û#º²¾[\×OM\èÀ¾wõ€®¬ $öÎŒ\Ş\Ü[\Ö;c»û‹0ß¬^Ş™E\Ş\Ù`½W·ö\ê\é\İid˜Ï€_sRğ´°õıó\ãºyiLW\Î\è\Æ\Å=¼ŠüÃˆ\×\Îöku©Q\r\Õ•z±XTeK«Xú\Å#ı\ê\ß>Ğ¯ÿşN¿ø÷µ\å\ßşşw]¾sZ\í½}:y\ë’\Î^;£µK\'‘\åı\Z›\Ñ\È\ì°v \İxÃ¤\ÂQ<~–²\Ò\ÒLd·P\Åh¼ù:;H%|L\èò™Wr©\ÄW¤2/\à+7 r	ó\0a$ŠT¦JE>\Ã5^$†«‹(“U˜\ÄV\'`<?×ƒ\ÈtTIX.;FW¸6\ĞJ¸D2¤0€ŒTr€W†ª*Wˆûƒ	®\'\Ê\0_©\Âq>\Ï\ã/ƒ?@ô*•(\×\Éı\í:¹7¥³û›ua¹U\çö¥4\ß\ãQ\ßÏ…§u<`qº¼øİ²\Ò\\…8‘R°_}¼Dmœ,;;CZ\éÈ¤N\ÍW\é\ÂB….#ÁW\ÛuõH€\è\Ò\í£}º{lH÷`¿û§Gõø\ì,¸Éˆ€h¯^^š|ûù}qö¹<£—ôg€\æ9\í\Å\Õ%=½±\Èmdğ=´xÍ½³ûuû\Ô^Xv·n ¯W7¦tùÄ´nCf÷\ë\Æi€‡Œß‡]/f?\Î\ì\Åß­Ávs0’{Ÿy{Ï¹À{\ï×“&±ûa>÷ûqgL¸_¯óyW`\ã\ëºwyL÷/O\éú¹~\İBr\ï\\\ÆFL\ê.—N÷j~¡û\áÁış\\µv\Ätû\åŠ~ü‡\ç0\àÇ°ß§ú\rÛ–o~\ë\Ûú\ä\ë©©¥]G\ÎÕ‘\ËGµzõ”VÏ­kÏ¡½\êŸ\ê\ÓÀ\Î~\r\ï\ZP\çh³j»«aŸ„\Ê9€¥¡b‡bõ\Ì\'š\Ù,„%„—\â2tß¼–I7¾«¼¬”°#\ÜøÂ°L\á2\ÃG¥Ü°`\éİ”Û„y;@¯®p¤\Ø<bÊ¼^e\\Id5YU\0ñ}U	X\Ï\0ˆ\ÔVy«€!y<\\Aˆ©p)TQ&?ò\Z†ù\ÂQ\Ø¹\Æ\0%û\ns8\Ü\Ñù}µ:Ô‘\ÔZWµ\Ö÷T\ê\êL›\Î#»kñ±„§b\ÂSqqšJ	O²L¶b¥bEj®qkk°oGX‹\Ó­\Ï>\0±\ß2\Û\ìw¸MW\×t	¾wx¢ñ~\Äã‹»°½€A\Ş`ò\ß\\\Ç\ïB\Ş\\\ç\àß„y¯n.\ãÁ–°ğ\ê\ê*şp\à\\8€´\Ï\ê\Î\éY\İ<¹Kw\0×ó3€oF/-\ë\Şùp÷a\ÛG\×ö\ë,ùŒ÷y›÷4¶»È¯ò+ Ğ	Oç—„ §·\Ì\n\0È«\Ózp•÷¸1‰d¿9a\î\\\Şó!½\0õ\Å^@¾—\ë\ãºpbPs3uª†T\ÜØ•¿}\ÏHBŸ|\ç:\àûüP¿ü\ë\Èğg\Úò\ä\Õ+ıÿOÿUõ\í\íš][Ô®™)­\\8­C×µxâ˜†\æ§ÕµƒD34 Áµµ«¶§\rJM\Â0$P3ö°¡\ßCJõ”T\0%h\é¹\ÌWŠ\ì‘0IÓ°F)\É\Òò\Ë740 \ÅI/`C*k\0Wm\n\ÏS,3 r_¼IFv+`µJX1Ø’\04\Ê\íXE\Ö\ãv*¤8L\æ2\Ä\ëCP\ÄdÀpA^\ã#]ó^o\ç\Ã×š;µ·U§w\Æu˜3ôPgµu\×\ê\ÂT‹.h\ÓR_R•¾B	Œ\î\Ê\Ãûf\Ã\â9Ho¡jñ˜#MöF_…\ÖöT\èø\\òKøXnĞ¹Cø¯f]=Ö‰D‚\×;`Á~\İ\\\ë\Ô}\0ø\àva·\Ãn/9˜ooÀF×–ó€bAo\È[._\ßXĞ›[‡ô\æ62‰7{s÷ˆ>¼±;+®\èş’»N\ê=6®;§ö\È‡õ_^ ¾‹€ˆ a’ûø\ê,2iÀÀH·û\å5c\×€\Õ\ìÀ.=Ä‹>ˆ\Ïa\Â\ç7`\ä\ÛH?€|\nó=ºU¸Ás¯Œ\ë1\à¥l»\"\é	¾w~/~pXg\×û´oªZÕ•XŸ \ßr=;¬\ïş\ì•~ùo\ïô³¿Ã€ÿş¹~ó7ğüŸş_úÿüÿ\ßú§ı‹n<¹§±ñ]úÆ·¾§S—/iq}U»Wö‚ˆZZğ_Q\ÕvÕ©®£Aaf¢!‰\ã\éğB®bPI+Ï”I)Tş©oX\â.ˆ¥*Á;•†J\äK–JŠ\á=¼a—“`ı>E`¯‰2\Z‡\ë	Hg¿5ŸHS÷Å¸ô“t\ÃÈ¯ù8óvQ“[ü\\\0I4iµ$\ìH.24ö³4øüœ!¶`Ğ§:B\É\Íù­V\ê\äp¥ô\Õi}¸B—¶\éôşF›¨Qg•‡\ï…\İp¦\\\Ùø\à\ÕE\İ\êjib ¨…UZ=×™ƒ5:3_¯SK5xI@8× ‡\êğ€­ºq¬[·N\à\Ã~¤\á\08B Õ£óN\Ê}k	À½¹¿ \î­\é\ÃûGõ\á\à\Ãû\Ç\Ø\Öõ\îş[\Ñ\è%\àû\Ç	G\0\Í@\\0Ş“K‹z~iğÒ“k›¾ğùE@»˜p©ú ‡__C\Ò	O®\ïƒñ˜;ğ›S\0ùp/n\0b¤ø±I2\Óy,øøò4`\İ\rÛ#Ã“p\\\Ü\áH\ï\Ícºz¶[Ö‡49–Rö*\ÇZµFô\ê\ëgô³?~ _üğñ\ïŸ\ê—ÿ-\Ûÿöcmù\ÕÿUÿ\åÿğ;}\ã\Ûÿ ;w\é;ú¥şûÿ\éÿ¢/şõ\ëš;º¨\éµy€W­ş‘^v\"…V\àÇ¬V—j©\Â÷•(«¤\Ä\êo¤²\\\å!Y¥ø¿\Ü’cYró3	#d\ÌpÈ­bW¦“>\0l\æƒI\Ã$\Ódm9\á…t\\\åù\ÙøÀ°\ÊÌ¯&¹@c\Ì\"\Ø6\ÂV\ÆsKCe°j\0À\ç\áñ|\Ê\ç½H¤›\Ï2\à‹¸TPœ«p°V.–@–%<ªItm¾K«0İ¹ñ&½\îC*1\Ë\'÷WHª4\Ù\å—Ç£¢¢X0ù\ÍSC…G»úBZœŠ\ë\ØÁ*>Ø¤3Vz!Ÿš¯Õ™=\Õ:u ’$Ü¦Ë\ì\Ö\Íu\Ø\ï)xcT÷N\r²õé¡…˜\ä©ò\İMX\ïÖŠ>$|xoğ\Ö\'\é\ã{‹ú\ä\Şa}x÷(·\ê\ã‡\'xlCo\ïÁbw\ë\Õu.oFR7k‚\ÏH\ÃO®XY¿p^\İY‡E\çğ’\È<iù5\éö\ím˜ô\ìÀ\\G’ñ•O®\ï`€[ğ\è\n`Fş_šdÿ`=ñ\å­i\ç¾û\Ça½qü\Ş\îÿÿö€\àqğ\İ8O 9Õ¥Søİ¡Á¤Pø\Ô\Ó\Ò7~xK?Gzö\ß~¡_ÿ§Oô›ÿô±~ıŸ¿ª-ÿüıõ\í_|¡ÿıı\Ï:viC~\ë©~ûû\êƒ\ï¦\İ;5¶0¥Pm…†&‡#•VVÅ•j¨€QÂªjŒ«È‹ªJ\"»^\ÇÛ•’|ó8`PÀ\Ë\0y\Ê/\Èn‘†\\0I \äSq	@4.wb°š\Ç<!—\ÑjŸ\Üfò\ë\ã›˜\ï*WF‹\Ãn®\Ò\ÂH\\%0(ÏŠ\Ñ?I:\Zr>7¨¦\nF9!\Ø7o¹%o¯ò‹ò2§\ÂòG|j\é©U[CÀ\Õ\é\Ìweq\\\ëC•ºµ: ‡$\ÆK;ñƒ\rZ\Æ\ïò¾n‰“%\Ì\ÕhGPË“0\æL•N\âùN\ÏU\ë\ÌL# ¬#È„aÎ“0\â¹\ÅV];Ò…‘„‡‘\ÊMx9ºƒT=AòL\Ú^^A~‘Á7x²\ÙOœ\Ğ\Ç\Öõ\É\Ã\Ãú\â\Ñ€Ã„Ÿ>\Ü\Ğ\'\×\ßq\Ò\ëŠ\Şqÿk@õ\êö1yw•\Ëu˜\Ñ$÷\å\İ%½»AÀ0ßˆœ¾\ào\ë[«#Z	~\ê0¡IôÀ\Åÿ]·²\Ğ4ß†	o\í\Äó\0«` ¼¾\Ë)\Ã<>¿2¡»—w\é\Ş\Å1|\'Iø|—®œ\íÒ‰#}\êj©e«l(\ÓuX÷»¿~ó}ø¾ª_ÿ; 4	şOxÀÙ™9\ß8¯ÿ\î¿üW\İq[K°\Şÿ\îÿú_ôğ£\ç\Ú9½[£G4\0øF\'§\Õ9Ü¯F\ÒpUGRuª©­\Å\èÇ•¨N:µ=3ù\å„\nózü•\ïT\ÆõñğcHa£r’e\0¸ı€«¢œ\Ç=J^\ÃqÒ­•Mù0Œ—ª‹Á²Vfñ:^3ûE`C­ˆW\Æ`\Âñ‚-ˆ¯ñš|o‚©2€˜còy\å„¤¿’Eğ‘~ıµQxn\İ`»š›Cº6Ó¬\Óım\0nX§\ÇkuûD§`\æ¯\î‚Ñš´0S\ØK\Ğ\"`y½Eª‰»u`(¥™\ZmôN-\Õ\ê\äRµN\Ìñ>HğÍ©Y\îŸ\ÅKÎµ\êúj·®  ó\Ş\0\ï\äœ\ÓÃ³\ã\Ä=\È\æ~k‚\Ğ1\rX–ô\ë3\0öñ“ú\ì\Ù}ñ\äˆ>}t@²\İ;Š<\È\0\àıH5\Ò|\ç¨^\ßx&\×6ôú\Ş\0µ\Ëq\Ş\ë-Á\å\r\ìøö\Ş!½»µ\ÆõC„™5@:!\ÇJ/øBÀjI\Øj¯9	l{uŸòÀ#İ³”Œ\ä5\æ[]²P2ÿ\Ã\"Áw\Î\íÔµ3İº¼Ñ«\åùV\Õ\ÙÀBM@\İıI}øµKú\Ù_?\Ô\ÏŞ¯şşU€÷u€ø±~ƒoi\ë\íÑ‘\ÃGô\Û\ßşN½*(û\ÏR\×h·º\Æ\Õ;Ş©]ƒ\êS\Ïx‡º\0`C_+º^£JXª6J’T-\Ä\0c\0snŞ«\n…0ı\ä5h,…ÿCÜ¶ûB	€eÏ­ò‘\\€0Š\Ô\'\å½õ\Åa\Ûú0\n\Ã\Úk-”8ª-„ñ‡\á”WQ\ÂG”¨‘$	‰\r$^ó„«û™\ç€øÁr|`\0\ßHø»\ÓHí©&\îÒ…½õ…N]]mÖ¹…v„\Õöö³¥y\Ë\n\ÔTSªÙ±(`\ãu€\ï\ÂRƒ\Î.·\0F€x\ËÙ„\Î\Íòú\Ù^®\Õ\Å#Mº¹Ñ§[\ë¤õİº{\n\ã~\Z\0B^œÔ“s\Óx¯=°\Ë4I/ˆ_û\æû\è\é}şì˜¾ötCŸ?9a?|\àG°\Ü;¼ V|D yÀ^\ã_Ão\ï\"·w\0Ÿs? »\Ãö\à¾\Ñ.aÀ×·9\Ìi`ü\à\æa˜p_i\ïyHN\Ş>À\n<\ÄkÂ¼=:¬~\ZÀ\î\ÍDü\ä:	¹6)¾û\İeÿ­s\éL¯\Î\ïĞñ&¥*¢ªk	j	«ñO?»¯Ÿş\å­~ñ7ğ\ß?…ı¾ª_9\0üB[š\ë+\Õ\ØÖ¡_ş\êg¤\İNd5¥\î\ÑAuv©m C½C]\êb\ë\ìT\ç`·\Úe;\Õ [5<7A@H8#§$\â02\å‚\0\ÑY\á9E\n“\Ójq\06n©µ\0–«²Ò¯D-Áƒdª	±\ÅUY›TUCTU\0°Öª¨\ç1<g¢\É@S¤>Š\\Ãš0d„DNE7ß“\ÄkLlŒ!˜\Õo…hc\èp\0D–#\åò\Êò¸KK»+trWBgv·\êòL“®\ê\Ó\Æş\Z\ÙU¥™–¤F\êJ•\àsò©³¡\\«\ÓIG-\0Cvµ\ë@<3Ÿ\ÒúşJ­\Ï$t’²\'<³Ø¨Ë¤\àk\Çuı\è\İ:¾K7\Ï\îÄŸM@ö\è!\0|\n\0Ÿƒa”w·f	«úğ\Ñ!}úä°¾úø¤¾xvFŸÀO!\Él?\\‡\é\Z¶‡\Çõ\î\Ñ1Xğ\Ü>\n\Ë(À\é€ùÁƒy}\à\Ü^X0!2üY}ó6¸¯ğ\0ø\0ü»G‹lkz÷\Ê{~òô„>?~³>Åƒ\Úc$ó—·\'\×ö\âù¦‘^B\Õùq\İ>‹bœ\é\×\Åƒø¿NuuIÀ~u\Åô\Éwn\é\'¿£_ıùCıê¯ŸB>×¯şörüV?ûÏŸhKCsB;w\è\ÏÿöG5t×«\ZV\ë\êU`l\êoQs3rVkw£R­\rj\ìiS}/U*OøœQA œHº “Š#ñXÃÌ–‡\İ\n\0Ÿ\0 F¸±Åª\0A \ÂqD•\Õpğ\0\ÎÆ„\íÒŠ\ßuA\Ø0\âx\ÏxC‚\ç\ÅñÀ‡4[MÏˆğ…ƒla8\ì\Z$´\0=#r2ø]\0\0ú\Øü„‘òP>v¡Hı\íq\ä·U\ç¦ZtıPnt\Â\Ç\êpR3€|„“$V–\ÈW¹m\è\Èşˆ\Îª\Õù^w¨E\ç­ô2‡÷;P«3x\Ê\r:~\0\0Î·\ëüZ/,Ø«\\^Z\í\Ç’\ÏN\ë\î\é}zxf)F9bö_\ß|	Ÿ<:ª\Ï\ÕWŸ\Ò×Ÿ†ñ€\ä÷#¤÷C<â‡°\â;d÷\íü  û\0Y~‹=»8\çx\ÆOXp±\ç8˜\í×½9}Àû~lÁyıvû„÷ùø)\Ï±¡O_n\è«\Ï\røú\ì\ÕI}òœ}z\n[\Ú\î.\èù]öù*	ø\"ş\ï\n¡ŠÍ˜o½^6†µ¶>š\Ãjn\êV\ã{¿z®Ÿşù~ö—\×ú\Å_IÁÿö‘~\é”al8\0¶µ\×\éÒµkzó\Å=Õ´!{\rAu4¨­§Cm½¼Ygƒ¼·jº\Za–¨’u•ªnª\ã\à•q_\\.Á°¸Hœşx\æW‰7O\å\ÉR\âıü0\\Q)ò)Æ“ñ8­\"¨B®Ç‘m7¾\Ê\Ô|Y‚÷´‘2Ş£²1\ä°+\Z	)2\ë\"Q\ÅTx\r¤a…É°;\èBnı\n\087\0‰p½„\Ë\0À1Ÿ\é\Ãÿù\0œucX‡;@\à½ş\Òs¡b¼\îüşn]:@b]\ê\Ò5@rzªU+#šo«\ÖLw­¢¤{…ŸH\é7\å”h.j\Òù%¤öP«\Î\àõN‘†\í#\ï«\Ñ\á\é”\ÖöT\êğd£N\Ìviƒ¤}l¦G‡ \ËİºptT\×O\íÑƒ\Óûu\Ï\ZN~9\Ö{yÆ©¾»È[Ÿ>\Ù\Ğ×ŸœÕ§O\é³û°\Ş’òM|\á]<\"Œø\éC€~Fpù¦üğ™˜U\0uTŸ\ŞO_¬;şŒù2úù“c€\ë¤>`?;®/ºg\0ıåº¾nÀ{Ô¿\äı^­\ë^k^ô¬ÀO\çG+\Èğò;\í\È\ï\İK;a¾A]\Ü\è\Ñ¤÷ôz§&&\ZT\r9M\Ï\î\Ò7¾wW?ı\É÷\Ï@@÷—Oõ3+B[1\Z)¶rÌ–ø\×ş\é_´¸¾yKª².®\Ş]­j\ìmPŒX\Ïğc\ä«\ê«0i­¶RL%\Æ\Ş\0S¨\âMt<\Ói“ò\æ\Ã>\0¯¤€`•‡À\à0¢¿\Ğiƒ\n#•E^>rkCxI«\ëV\âHv\n/\è-óò%¥\0˜D.I¹Vÿƒ1\İ‹DMPE8\ìY\êÍ…İ¬\ÎW.OI–Â•>\å\ç:Ö\"\ák‹Š±°_$¤d+¬p9¥™=C	]_\èĞ…ù]Y\ë\×ÆZ­\î¬\ÓJ£÷),\âsHû\Ñ\ëôÁF[i\ÒE¶ók$\ßùfš©Õ‘©*-\×\è@_\\\ãa\í\èŠñü\ZÍŒUj\ßX­¦w\Ö\è\à®-\ïkÖ‰\Åg¬ö\Æ\Æ^\İ<—²:\Ş\åY@¸L(9‚<\Â<	\ZÈ°\ï“\Ç\0~L\Èxwc\Õ\à\'÷¸me@ú—\ÈO\0”÷#Àôù\0ø>\0a¸\Ï4_\ã>»ÿk/O\ës€ö\ÕW\ç~ı\å	\î\ã±W\\¾\æu\\~ö\Æ\Ø@¿@\êŸLî“ŒI\ê.\í\Ó=\ÂÓ­«»t\ãÔˆ\În´\é\ì©N>Ò¯Æ¸\Zš|zõ\Éeı\àwoõó?}r	ûıòÏŸrù1\ÛÀ÷N?wBHO§şø—?¨¡#¥R—h¨RU[R\ÕmxÃN\Õõ\×\â¹\âJÕ¦I\Õ4U©º¥ù\ãzs…SÖ¨jª…\Â\0&&+ ƒe€,”Š85@?^\Í\êuÒ‹4º=0\nòm\Ãvñz\Ò-¯‹Æ¼J%#Né¤¢!»Ã„H9^±\ÂGPññX‰\ÓST\\¨8©\Ùe`7™\r‡\äò õx\Ğü\âl\'U{ğyN\n¿O…\ÅEòd3öñ\ÜF¾—‡0R,w\Æso.µ\ë\ÂAXğp¯6v7\ëp–ºZ\î¯W´¬HelM•^-\íJ\é\ÌA€·HøXk@Š[\ï7¿#ªÁV¯šª]jÀ\ë\Öóı\Û\ZB\êm©¯½B=ø\×Ş¶z\r6\Öh¸«Vƒ5Z´\Ï9\È\ç\á;/ Í·\Î\í‡Y\æõ\ì<¾\r¾$L|pi|c=0\Ï\és˜\îCü\İG\âÉQ\àü*¬ö\Ù\Ó\Ó\0\î¬\Åk\Õ\ç/`¶gg\Ø}§û\Z÷şü¸¾·û€~\íùº°\Ï`\Í/¸ü\ZL÷9`ûÆ«S0\"÷¿\â=®:\ÈÚ´^“\ßÚ«û—±v\ëöù]]\Ç÷Àbœ\î\×\ÊR¿*ñ\ßS(Ê·‹ôşñCÀ÷N?ùË‡úñŸ?‚?\Ó\Ï\Ù~a‰˜\í—Ö\Õ\Ó×©ÿ\î¿ü\İa…ò—¬O\0¸\n<^¥jù\Ñ\ê\Új¸¬#œ\Ô\0Š\n$º	®Q\nfJ4\ÇU\Ó\Âı\íUJòÜŠš*¥\0dÙXH†ğˆ!@HòEn#0V¿6\ïW€\Ñ\Ì?z‘\İòš@\Ş\Ã”bDøûQÁşT\ÖW8\á$\Î\æ´b°%°\0\Ğ³n®s”Ã„Ql€?@\0!ñzI\áş0 s{\İ<\îƒ*—\Âö)y\ÃÖZ¬D¸@—[ua¶U\×W:IÄZ\î©\ÒÁfŸ¦ø\áR—üœ]\rn¤\0.\Ö<j\áF²´| Z³C\r6”ª\"š¡°?WQ” \ÅşÄ±ÉˆG\Õ|nŠT^«>S¡ªŸ“|WOƒö\ï\î\Ö\Â~k\âÜ©³\Ç&teƒv¦9¬\0ñ\í\í$XXğ {r\Z\É%xÀ„[Æ¼!Œöa\åc@öùs\Ø\Î\Â ü‰ıô\å@€.c\á\æ‹\Çø»7<ü\â	2Œ„Á\ãŸ6>zDÀÏ!¿\Ï,¯\é\ròÕ%=¿¾\à«\ïnß¥«§G°X–SxÀ“}\Z\ßÙ¨z\ìÕ¥‹\ãú\É_\ë\Çú@?ù\ëG$\à×›\Û\ß`¿û@?û›mH>Ó–\áı\å\ßşŠo³®\0PBµP¼W’ƒ^\èj\Ú]\0\Ãë¥ª¹¬­Bª\í²R)	\íõ¤\Õj\ä²pDƒõ\"1\ë¿óq\éWùÀ<\á”5\r\0 Rk\0†ac³d¥õ\ZĞ¬Q²\Ö\Â)V\Õñ8û¨¯q¤?Q•pl@¤Š\ÏI`	ø,K»\Ş;d¥«\'ò™6\0n6 +uÚ¯\Ê	FÆ¾\å€Ñ‡,ûñ‚¾rü!’–hi¢V—1\ĞWW»\0Öˆ:b\ÚÏ‰0\Ê{—\Û\è\r^µ§%¬#“I<\ÇÿÁ‚\Ë\Í:9W£õ5š\ß\é×.¿z[¼ªK”(\á\ËVv.+Ë’ßğğ™\\¬\0\ïõ(ò9 GÂª‹E\Ô\ã\ï\è«\Ó\î±f-Mõi}n\Ş\n™;7+.\è\ÅekB=I\Ø8¥7Vn1vˆ=\\„ˆ\ÏHÇŸ>¤&µO‘\â\Çø8<\Ü\ÏdH+€ü\ÈB\Ìù\Ñ\ã5¶Í‘–\Ï\ì=œ¡?˜\ïh\ÃYJf³`ò\îŞ’Ü™\Ñ#\0øø\Öİ»2\rø\Ì2L\ê\Ê\é>x§I¿gN\íPwGv\êƒw\Çõ£?¼\Ö\Ïÿ\Ê	?ı\Ó˜\ï\İ\æõ¿½\ÓOÿş	\0$	³m\êÒ¯~ÿC¹\Üü($\Óx\n¯UcKŒ¤j«Rj€õj«a?X\ĞX8w3f\"•\Öñ\Üfh%¦\"Gb>…ğŒ¡DDñ˜•I‚\ÎhF°™—³Q\ï`¼Du,ˆ¼_UL•°]Š÷O\0ú„±-6 Y½\Ù	…\Ã<\Î6«û™§Œø Q\0h€´&„\0¡\Æ`4¬2\ä\ß\Ïf\04Ÿ\êóÁŒÖ\ã\'©\ã\Çğl7W\Útq©U—z´¾§^S1—š}€ÿ\Æÿõµ¾¯¦lÖ……j[n€\r\ëµ1—\Ô\ê\îJMÀñ v¶5\ÒR®\Şz¿ZªKTÁ.¨\â\ÈxÔšZ±\î\ÂB¹\\YN±¾¼Ô­`9\n«P‹©6T©\Ï`£–÷b\ï\Ğ5‚\Ê\Ãkkzzí°^_\ÖkP€?º·xğ‚¤\á\Ïm\Ô\ä\éd\Ó|ú)\Åÿ}\Ã\ÙhŠ•k¬üòa\äS˜^Ñ›\Ûl«z\å§7Ç‰_Ü˜\×®[ÁúŸs÷²{eÆ©ù\İ<³SOŒ8ºtşÄ€NŸ\ÖÉnmp»¡ªLGö¶\è¾{U?úıd¦ûø§·€Ï’0@„ı~ş·ô‹¿½Õ–ö®6ıúO?€¥Š!Q\ÖU!Dk\ÊaØ¨²¬w¼X\é­\0p©\nü^E¥’x¾$Œ—\0¤Ö½lEik§Š\"£Q@‘DÔ‘\ã( ˆ\îP\ÊÈÃŠ5X½\Ï\n\Ì	§Èœ\â5©jÀì¼Ÿ5p+P‰/Mò¹	kR\å¾8û2ğ\Z˜‘^«;š\ç\Ã$Q\Å@\ïOX\ã«\ß	(~˜\Ï\ÇV\Z*Å\âû§9Ö{H\Ó6ZR\Í>^˜oÑ­Ãƒ\\¶\ê\âb›MT©#’\ë\Ì©‰—j~¸\Ê)N_Xª‡k	n,U\é\ÈL…\í¬\ÔÁ‘Á#ª	À8\ÑÕ®ö˜ú›ı\êlô©³>¨Îš°š`\çT™K\å%yò\æ\Ë]\ì’\Ç\Å>¹\İ*+g_ı\ì{™_\Éò2\Õ\Æş®j\ÍOZÖ¦tõüœ\\˜\×\ã+\0\ä\Ê*©y•dŒ¼Tš?|v\Î	+Ÿ>\"< µ\Ùıwx\Ş\íE½D\Ü\Æ\Ë\İZh‡ôòê‚8½…\ÓzzÙº\\`¹\ëK\0ı \î³İ»²¨—ö\ë\ÆùI]:9ª‹€\ï\Ä\á­\ê\Ñ\ÜÁ-\Ì6\è$\ì·~¬]K]\êm\èÆ‰a}\ç\Ç‘`˜\ÎÀ÷Àg\0üó®¨Ÿ€úw“\âV\ÜR»ıøw\ßSQ©\0\â\İ8 6:X\Ö\ÚnÁ\"†\ì\Z\Ù\èDœ³:^‘P€P­Às\Õ \ÈeÄ€h\r¤$:\nSEªJ3 NÁ¬ 	4Zm\İ-ø?üó\\ó~\Îk\0³]GbS6º‚DW™\ÄÀT=\ïm	\ïg5G«²G\0p„÷˜\Û>Ã²¶£\ã­\Ö#x.›R`a\Ã´ö R¼a™J\Ãø\Â@	»@šg,\Õ\Ò\Îj]?Ò«\ËºJ*¾D8\ØU5)+P+da¬B\Ç$t~¡ù­Ñ™Õª\ÍZ\àr»\Ö\æ\Êd…F“šŠ\ë\à 	¸/ª½=1Mv³õÄµ§\'¢\é®\n\í\îŒh©\Zh\n©‰2—\ØD®<›ğ•«¢\Ül¹ò\n7ûKb\ìkG]D“\ÃõZ=ˆO\\šĞ¥cS$h\ëù³IB6\ÊAr¾¶¬—€\í\r€ü\0ø\á]X\î\×oÀd7–ôÊºZ®Î‘²õğ »`¡‰?‹¯;»W7\ÎMğ	]\åö¹S\Ú8ºS‡–‡´º4 \Å\Ùn\Í\ì\ï\ÔŞ±\r\Õkh¤Z;£šj\Ôa”cb¼Z»»«œÖŸü\î\Õ&\ë±ıô0!üÓ¿¾\Ô\ÏaÄŸşõ~ñ—O\0Løo0`5\ìóƒ\ß|Ä˜‡WB®8 \ØÀp¨\"©°±!R\\Q_«TC5À ´XsÃ…`¡  ‹\âS€F4Q@”\Â\ßÙ¸­‡8-d,X\æ=ŒİŒ91\íùl5<¿Šƒ\ÏKÂ††’5\Ü6\ÆEÚ“õœzJ\rr\\Ágsr˜\ì†\Í\ï|0…•\Â\Ög q\ä—\Êo\Ãq@Ïš\Z¼\0±\ÔOB\çv©u\Ò\0@w\Ø\ãö5taµE\×\×zt\áP¯nŞ¥\Ù6n\r6‡´‚ÌX¨ƒõ\êuùµ~¿‹+-€±^§fjtx‚4<\Z\ÓLwHû»ƒ\0. \énÛ¸\rô$´¿?®}ƒ•š\îk_WD\íQ\í¨©Æ\ã\Ë\n3TT®¼¼4€˜)wQB¥%a\ìF$n¤5ª™\áv­\í\ï\Ğq€ñø˜¶FR\È\çµ½¼;^·IM‹zv\Íf²-\èÑ¹İºwf@l\Ö=}|‡nryùÈ¨.\Ó\ÆÊ˜Ú¥¥\Ù.M\íi\Ö\Ğpµúz+\ÕÚ’R+y ©1¢¦¶\Úcj®©\Zu¬!tµÔ‡5>Õ¬Ñ¾ˆN\Î\é\ëß¸®>~ü\ç·ú\Ñ\ß\0)ø\Ç_n?ù+÷Û„¤¿|ª_şşıCm1\Ïõõ½… LD¶\Ô\ÕÂ„Í±;-ñ6\é\Ç&U\â\áb\È\\\Ü	\0\Ò\çH\í¦7‹òº¨Ö€ø¢µ€²\ÆB\ÒlŞ c\ç7\ÃvK6l2§5&‘\ïJK\áµ)X\Ï\0øğ˜©\àŒ\Ö\Ô)ø#–¦“|©\×À°ûùe IˆVòE6“°¤½°Ÿ›\ËR»n\Ó<\ËÜ› ´\ÆY¤/„\Ï;2\Ó@\é€\Ù:a˜]ZŒ«+\é\Ñ€:2‘r\æ|œ_´\0Ò€$\Ö\é\Ê\áv]^i\×Ù¹f­O\×iywLs!M¶„4kõpr¶W•¨«Æ£~®÷5–æ˜†›#\ZFU†›£\Zj\r«·	\ß\×TÏ­g?¢eù*-Ú¦’‚\íò\ÂpI‘ªHÓ­x\çŞ¦¸ÆºbZ\ï\ä \è\ÚÊ¸n< §\ê\á¹ızp~—{õø\ì4IzR÷O\î\×õ\Ã#º~tHW\0\Ü\Õ#H)’yd®_\Ë\ÓÚ³£Zı\İq56DT\Ço—Jø\æ¤ò›”\á•}\ÖD\â+”/l\ŞÙWu ø½b%Š°¯\Õ\Õ^pr\İ\Ã/şøwoõc¤ögHğOØŸş‰ğa\Ì÷—\Í\í\çÿûö\ã’0²¥º¦F_û\Ö§†\æ\Ã#…8Û£€0\ZXQ3ù_\0gMŸ1c1“@‚J¤\ë‡-\Ã0Lc\ã°V4‚c°^\Æa;®\r·Å\r¿l*¨¨\â¾\ÆZd•€4a]\ĞÆˆ\0İº¡Mz«	\"TŒızk» [Ö€\à‚PGl_£!‡ı6\Ç~	A6¿†+€\æÿ|\Ğ\æ;9\Îa›Á\çñ•±Y\ÓD‰†{£º„·»0×‚Ô‘ğöµi¨„;\Ñ\êt\'tv¹N\çV›t\0^:Ò «‡ûk\ëi×‘\İI-D4\Õ\ä\×.\ìIO¤Xµ@|E\ÎV\É	QI(\nz}0\\®òó²UœŸ¯6w\Ñfgyû\Ør©:\\¬Š²l¥<ùJzyò\\Õ¦Š\ÕÀwhŠÂ¦\ÕZ ½¯\ìÖ¥µ!\06©›\ÇI©\'\'tkc‡\îm\ì\ÖõcºøÎ­²-\r\é\Ô\\¡iP»;µ\Él\æ„Oa?ş\"¹=…*)Î—§È¥¢ü\çªØ6²U\â\É\ád-vfF–\áU½–‡\ïf?\ëj\Ê4\Ãwÿ\çŸ<pšNıx¿ø@ûóG0\ßkgû™ğo¤\ã¿|\Í¾Ñ–º†V½ûú\å•Z\ë”\rÖ›a7\Ö@\ÊbL‚C\"hF¬`Cv#xµ¾\Î\çHŸ\çúU– \ÍaÖƒ°¡ \Ã\0\ĞF&¢€+ZU\í¤c\ël‰’v\ÃuåŸ³T½\é#\0\Ç\r€\Ñ\Ú$ş@R_\Ã\ã¼“m€g­÷vD	¡¤yK@i#x•cò}„Œn£8\å\0\Ì\ÎdŸ…¯±µˆ!m.R°‡\Û6úb?pŒ\ä|dªI­\Óñ}:y°C;\ÉÉ°\ï\åş½u:½X¥³+º‚\\_;Ò®«ıº¾Ú¥Ë‡;u~¶^\ÇñŠ‡¤\ín\rW«‘œ(+T ¨«@X~³‚ô,e¥o—\ÛRq‰_™Û¶*7\r\Æóˆy~%ûV\ét¡bµÀ6-‘lÕ‡\n\Ô\Â\ï<P\ç\ÕxSL\Ó=\ÕZ\Zk\Õ	$ù\ÔL¿\Î\Í\ë\ìb?>ˆU%(µ\ëô­\ì\ë\ĞÁ]\ÚÓŸ\Ò\Î\Îjõ (UÖœ\áü…Y*\Ì\Ç\æg© 7Kyù\ÙÊ‡u­“\İcS*ÁF¤6Ö³\ÒQ\ÜIùP¢€\Zğ±\İ•ºşğ¾ÿû\'úñ]ó|ø¿Ÿ[!ú/0¡‘ekÉ²\íıŒb\å\0\Ø\ÚÕªgŸ^wº‰\İ|¹R€/\ê!9º\0\Ş\È\Ø\Ä:[`˜`,¸6=—m6\Ù\Ç&ıøAË¿rä¸´¢x³’@²yN)\"§©*<a\Æo>.eMUµŠ7q]µªLnk9<\×$—\çY\×KE½İW“\Ên?j)=\0c±û€ó®‘MKP÷óY\Ñ\ÙN&~4\Ëöò\ÃYúõ<l®J‰\ÍSAbL‚=v\é°ù\0¢ù½˜N\îk\×	€xlO5I¯ÖŸ\Ô\ÚXB\Ç\0¾ùz\0Ø¤Ë«íº¶Ş¥›Gût\ë\è€n\ëG;ui±›ƒ^¯•)M8º*J\Ô)R[Ê£!¾\Ó\î‘µ7\×9#\'ı}@˜®Ì´t\åflWi§…ß…ıkÀ2\Ôú\ìÒ­fH #Y¤v~óÖ„[P†wôk¬=¤™Á\n-Pv\×\é\Èd«\Ö÷6ašµ6\Ùk“V‡+´Ÿ\çŒ\â\ãZ9Y\ÈhyI¦\0,V’£l.\ÏW,˜§\ê`¡ZB%j®(Uk]©:\Ê\Ôß”\ĞpGL}ml1õv$\ÔÓ™\Ô\Ğ`\rÁ¤I8I\ß~~E?ü¾¯÷S“\\6+\Ãüø¯°\á_?\Õ\ÏşFúı·\çxÀ\Í\ÌÏ­M\Ş24Ô£[¯N)Ï$º~(/²a,N\ï3\äyÀ#†H•&wa\'¬À†ü \æm\ÒOY„\×dœ	\ë(€¢€\É&\'«SŠ¨*.+0²6rbejB†µ^YÁ9\î¤\á\n€\è`\Â82\ÃGÚ¤s-QX0‚¬[©%\ØLnC–‚acœ“ô\Ã.ş-ñ\áW¹?\0\r„e0Ÿ\×[™·\ÌiX(õzT{\Ë„^\î \Üò{4³3\Û%ul2EXHiG[X‡vEud:¢36÷÷P«®\àı®\ï&9÷\ë\Öq[vcD7\×Gum­O—štú`«\ÖvThf}´¡\\ıø¿ñ¶¤fz;t`ß”¦Fvª8\Æ\É$tdf¨´°Pm\í:tğ ¾°];:z\Õ\Zô©‹p\Õ\r\ëõ\âE{*\\\êL•ª«²P\Ã\0p¼9Œ\ã;I¥Kx¹ùñZ¼a£\Ç\ê5?V8+µ§5©v<sm¸@\Õe°j°@‰`†j8nõ\ÛZ~·\ÊD¹ªyß¦\Úr\Ø1¨®°F»ü\Úİ“„5Cš\á{G\Øb\ZIhŠ@¶¼Ü¬\ÇtxcD_ı\î]ı\è/°ñ³?~¢Ÿ\"¿&\Å?FŠ\ÛYøøYğ\Îx0lø÷´e÷Q]ypFù\Ör/*Åœ—\Ú)›3\Ği&Å´L–c0#\æŞ¶ rg\Í	>\Ó\Ø1€ß²–|3ı\Æ<67\Ã&¤X£¨¥\Ödi¶\nfCJ«\0Yª¶Ê™Ô”)¤$\Å\ÙYai\Ø|`U\Ò³i™&\ÏNò¬Vÿ‹\Ã|Vh¶‰\å&ó~À Ÿam`üÿ`?\ÇN8K¾“p\0]\æc\Ê]rcò\İø-O)\ĞSÄ¥K.®»dIy‘’I¯N\ìmÖ™}uZLi¤-¥;}Z\n\ë\äL½\ÎÁ‚Wµ\é*\ëö±>\İ>Ş¯»§\'twc§n\Ğ%Î¹y\ØhO½\r%5Kh\Ø\Ó„MI\ÍA\í\í¬\Õ\Ü\èˆvvt¨…¨\Z¦\îmm\Òô\ÔN\í\ê\é%“›[5\ŞÑªÁ–\Z\íi«\Ôî°v^ª\Ë4„ñ\ß\İ\èÓ¾ˆ–†°m•–&	A\ã5šŒ3#\0§7¡±º€Zùm\ZEjŒ\å«6\âRSª\\\íB7Ÿgs¤³sUT\âR¡»Xù\æKU\îq)‰ô7¡<]¤Rü\ßc÷h¥\æH\ÉkHû\É^[\é\Ñù›óúşo_’~_\ê\'VzùÓ§ú) ü\É\íúúÅŸ\0ÛŸMaÁ¿Z1š0\â\0ğcmÙ·{Lk•SRÀ²ƒ\0¡ÿò%®cÌ­v€\Î\Z+1r\ÜZ¯`>ó\\\æñ_Vô-\ÇS”}9û\Ì\æ\İl2x¥u±Àb*‚E²¾Z\0¯o—j@~a;\ëxI¾€‹4 \Ù5>Àg\Ïg³\é\Új‡\ã)B\Ë\Ê9ó}Vp6´ú\Ìg\à7¦ö°on\"\Ş\Ï\ZòZ©¥\Ü\íL w.O\ŞX\âñ\à¿òU\ì\ÅlÛ„z/\0ˆn³%G\ÚÙõıul­0`¥f†Ã˜~Ÿ6ö\Ö\è¢u\ÎÀ€\×\Öz‘\àA\İY\Ñ}Róı3£º{bZW	\ç\Ût\ê@“NMUkcg¥\à•öµE\0’\Ş\\¥É¶f\í\èÑA’hO&újd&:k4\nHk\Â0_™F*:´§C\'f:µº£Q{›š\ÂC\ïŒ+»b\Üß¨3‹]:s¨[\'f[ur¶M‡a¨™n$\æ\ë¨ğ©ù\î¯ô¨›\0¸³H3{÷kÿŠ¢\ÅY9„‹r\å+=k›23\Òğƒ9*\ãd\rØ¤.~—\nN\È\æ\Æb\í\ÚY¡%¼ñ\é\Ãİºx~P‡I\ÖßÔ~ÿR?ü\ÓkX¶Ÿü°H,”l‚\ï?@øÊ©ZC\Â\Ïşí•¶ŒNtkmcQn’!Á\ä¨òM†m^/`\ã\ìtF8ø\ÆnÖ²\ÒRg’Wn\Ãn6ß‚\äl\ìc}w6\î\Z¶€R	x-\r§b„ˆ\0\é7\Ø*a;UA›ğ¶¾¯n@¶«‘l¼­ó\Ç÷\ÙDxm±²N<…\çC\Şm­0Ÿ\í0 Ÿ#Ç¶Ÿœ86W\Ù\æ![WN©\É\å\Är\ã¥\ÊÜ°)\Î\Å\Ùm«7Ø‚D.\æ¦\Ù.v&Õ»0\İÅ¥ü–\Ô\\\Ô\ÜÎ¤úk8\àı\ØÅ¯\ã)™Á.u9\á\ã\ì÷pcR\Î\î\Ö\ÃsSºjF\ÕÕ•]\\lÀ\ÖjcO\Öñh‹°\È\Â@BûñT{š\â0ZP;\Û*4\Õ×¤ñ–¤\Æ\Û\ë5\ÑV³\Õiv¸QË£\Èøxƒ\Ö†tryDGw\×\ë@wH:\Ê5\ß[®“V<ü\ç¦õ\ä¼M\'	oô\ë\Âr—\æ±C5¥¼o€}¯plD#¿¡¥\Å_?¦\î–&y²³”›®œ¬L\åe¾‚\\\ÕT\ÆI\ë$ò\0Ç–0”B\ÍÚƒš®\Ô\ÆR».\Ğ\å+ÃºûlEŸÿ\ÓMıè·›E\çŸş\Ù\Æ~?Ù”\Ş?‘€\ÛO`ÀŸ:\à{«_ş	ù%\rÿI6¸¥µµZ§Î¯:³\ÌJ\ÊòH‡\Äğr“\â\Íe\Ó6\È\0TY\Ä.½\È3\Ş\É\êD\0\Ñ$¸4\n(\Íoq\é\ã9e\\–!‡!¼…·Â£(l²9#œÉ±º¸b0`¬	@5\ãùš*T+¦`\Ädm%À3°d\Ëo\Ä	0	nG ù¾¸ù>KÁIó¥œ0vÀ\ç°\á\ßW\Æş\ÙRk¥~6xV2p\Ë \\V:\0€%€F²+6¶CvŠñ¿.\î³\ë.” \Ø÷ò¼||b‰\âQBDµG{º\Ã:ˆZÛ™\Ğú\\\Î,\×\ê\Ú\á^]_\ï\Õıõ]ztÚ–\Ú\Ø\Ï\å^=89‰/\ÄÖ¹…V\İS¥£H¤mk\ãuZ\Z©\Ô\"29\Ó\ÒT{œ°RK¢­œ\0¬§A³ƒ-Z\ŞÑ¢\ÅÍ¼¦S§–w\é\äR·VÆ«´\Ğ\Ñ*\'Ã‘Q\'­?<¹Son,\èÃ‡‡õò\ÎA=½¸Ğ©Cø\×\É¿f\'’šŸ¨\×\ï\ß\×\àW7\Ì:Z_¯™ñI-\ÌPu<¢‚¼t•d\ãC‹ó52Ô«¥»´»3…{UÁ1¬©ğj?¡jc¥AWO\ëú…1İ¾³Sÿü“\çú\á\ï\Ş\è\Ç\È\íÿh^\ÏÆ€\Íÿ@şø—››µdm–c\0Ÿ‚ú·µ\Å\ÂÁ•{G”g\ëÿy8@aÏ÷\àlm>¯O`\ÌÛ”F\0_f´\Ç9\Øv¿M8*Cò\Ê9P$Ï¼£=Ç˜\ÒV!°	\æ¶Z•SÃ³ÚŸIk,Wg£+¤\á\ÆJ.-€\Ä\0 —–œñ{I‚ˆ•[b°a©0\0Â¾	¾3\æ6\'‡ù=/\Ì\ìÁ°—\"µe\ìC©\Ïj}\0\æóX\Èğ!·%\È-÷\áùJJ\n·=n¶<P¶3E´\Øe,ˆ,»óœ\Û.¼Q)Àô\ãGñ`Ó½Í\Åt|ƒ.\Ìw\â\Ûu\ëD?Ò»CO\Î\íÑ«³\0`Q¹|xfO¸Ç©šŸj\Òê®”\0¢\Ã6¡}G•–I§óƒI¨\Ö\\_«\æû\Z4ß•\ĞLr\ß\×b½Ow\é\ÔR6°‹£­ğšc:·¯I\×W\Úôü\Ò~g>ñGÖ¬j«)\\; kG:tx/8\Ô\êşp¬7Ù¡\å}ıZ\ŞÓ­¹]Z\Ü3 £s\ãZ\Ú?¬)˜vzpH+s{uzmQû\ÆaûFügP£\İAu f`_ë€¹}–µ‰T¯\Â|¯ğz€\í¤_RğÿlCo›¬÷X\Ğs$@\Z;ZHùù_­3†Pb\0Œ\Â*÷Ÿ€Eüğˆ@@;¥¶¬\×cÁa\Ò\"LSŠô–>Ÿ•4ˆë¥\0ö\åH´MË´Â¯\Í1O ¶b\ÍıpÚ±l}ü`…%]\Òmf8\0\Ö\ìPoIÙ­\"õš\Û\ÈJUD‰\äÿ\Â~\'\íZú\r9c¼\Æz>!£”“Á¢tœ<Aa‚Å–ó>l\Í\ZÀT\äu86d\×FJŠù\Ş|wkp-v\Ùr{\Ì\rH£=\×\0\İ\0°Ó¿—ƒ1?•*t^]h&„ê¾³\Öß/\×yY\Ğó‹ózzaŸŸ9 {ºu6<4¤³s]:>Q£\å~X©Ÿ \ÒvÅ‘\ä¨\ã\íöµ\Ä5\Ó\Z#)\'tˆ0q\ïwj®Ggf»tól<©“\Ó:?ß\Ï\ìÖ½CzumAŸ<>¦¯¿8¯¯>=\n\Îğy\İ:½·Q‡\0\ê\Êd-l£\î\î\Ô\ÂN\Øu¸A“İµ„ZMv5jOW«¦†\ê5··[3»šµog\ÌY«şö\é7¥\Ãó07©ş\Ô\Ñİº´S÷ù»\×\'õ\Ñ?\\\Ğş\0¨\0Ÿ\íGŸØ›5!À~?ù ûã§›€ü\Ë\î…¿tÒ°S¦1\0Æ\Î{¯NB\Ì!O¶\Ş\0,!|\Ø\Ú~\"»&1S_Š\ìú1öV\Ìõğ¸­.j+‰Z]­,d\å“_‚\0\à´b°yH+‰\Ød$?\à\à\Öè€œ\Údv§ƒ\ÆF£\Õş\00\î´fY“¬g%k’5ÿ˜BŠ	§\ã\Å)µ ½Ş¨\İV;E†Ä‹·s\ê{\Åø7€ci\×üœy;+¸\Z³\ÙI \n=V\é‡õø\îE%E*t\ås÷q‰,„)¢«¦d«ˆ»4İ\Ğ\à9´;¥õƒÕº°Ô©›Gzuo}\0\éÓ‹s{õòÂ¼^_™Ó›Ë‡\0áŒœˆ§¦u\ç\Ø.Ë¤®¬\í\Òù\å~;8Ûµ:8†jud¤†4Û #£m:¶§\ïØ«\ã½ºp°Ugg\0üT£.\í¯Ö•¥6\İ8Ú¦»G{ô\âÔ¸Ş‘B?²®|qN\ßxzDo¯\à¤\àu\Ë5:º·ZG÷o²\è\êt›\íª\Ô\Âhƒöö\â5;+5\Ö\ìsX\ZD‰F›\Zjõi¤1¦1¬\Ù\äXRKSµ:·>¨k\çw\èÁ\Õq=¸¶_/\í\Ò\ÃG\Ëúö¯>>\Ñ÷\àL‚Ü¸ş#.\r|?¶¦T\ç~+\ÇXğ÷;š\'ˆ[>¿\î¼<®L„\Ûk>°\ÈYš·\Ä|h`´7Œ\â5?\è¼8+\×ØVÀ\Ø\Æ	4–´â³®cB‰\rñX3*©\Ô\ê…!<›\ßÆ–­œøl\É5+Ç¤\ê«T\å0¢µıÃ€\0\Ô\n\Ø1°->™L<¶©\ÛÚ®œ¥\Õø?©\Ûz~ö•¤k¬g‰—}övÍ¿¹\İH.l^„—\0¾<^A	\03`9¬\Ç÷x.\0\é‚\r¨\Å.—\ÆbSd\ŞØ•\ç,Q\á=w’bgñ`‹;\ãøºj>\Ø zt‹ƒô\äÌ¸×‹K¶\ÂÕ¬\Ş]YÒ«‹ôü\Ì>½<w6<¨G\'§ôğÔŒ\îŸ\Ü ÷\ë\ÒÊ¨\ÎÍ\è\Ü\Ì Á¦]g\İ\Í84ª‹‡tq¡G7;ua±R·–›ukµC÷\è÷x}Ho.\î\ÓG·\æôù\ã#ú\ÖÛ«ú‡§\Çô\ÑM>\ç\Ô\Ò\ß\Ì\ë\êt\ÚZ\ÆútloŒÚ­U\äv®·Z»\Ûc$ñ\n\íj‹iöb¢3 q¼¥­÷Vk°Ÿ\\kÖs;õ\äÖŒ\İİ¯\'·\è\á\ÍI½ı\ì,\ì÷\\?ú\İ+§ş\ç\Ô\0ÿzóúa‡aD\ë†Áşğ÷\0ğO\æ\Írp\Zn)+õ\è\é7”\ÍÁp•À€\ĞÀEtù\0%`ôppKIC¥_\Ña@\ây1LW\àùş|€XŒ$\ÃBx?gY\0ù³\Z!@´•°B0h \ZQĞ†\èœU­\Ô\Ú2E\0˜-Ã†7Œ\Ö\'ªñ“~­{°\Ù|c\ç\Ì7¶†‡$)\Û&«š\ìZS\'Di\È\ï|v	\'Œ\Í1q—L»Dzm\ÒS1	×’¯‹œo tù\0®¨ ¸\nœ\Én±\nğ~…”\"K\ÌP{¾Ã‚Eòñ[õ‘(÷õ‘ŒÇ‚°UD§¦\ë9È­_\Ê\á=%€¼<·_\ï.\Ï\ë\ãk«z{mIo/\Ï\é\í¥½º´\ì€ó\å…Czqa\É^\Ñı\ãSºs|L\×\×v®º±º‹\à2S\îÒ­•\İ%\ä\Ü\"P\Ü\\­Ó½µv=8Ú§\Ü÷\Ù	\à?¼Šü\Ş^\ÔWŸ€W\àU}p\í şsLw´“\Ò[uùP«.\êÕ‰ıZ#\Ğ!\Ø,ö¥\0Y\\{»*µ»\'Gtp°Js\ã$\ïñjm\Ö¾Óµóƒzv•}¾7\ï¬ı\èö”\Ü>¨¯\ç. p\0í‡¶ı¹ı\Íú>\0ü\é\ï\0Á\äûy±É„€\ïÇ¿û™J6„‘\å-f°Ÿ|xÉ©–ğCã“ŠIŠE\åHVRÆs—<@eµ47\É\Ò7©+±K[\è›\Í\ÃA³Ú™	¶pb\È6Š\â#,ø’\å°V©‚±€3~l-\\a$\Ø\ä\ÕVÄŠÁˆ¶\ìn”4lkşY·55X\×uØº³\Í?Â ¾\ï\Ç÷9% À¸mœ×˜¸„\ÂX\Ï\íµ\Æ[(“Û€\Ï<Ÿ\0Z²-†ùlAõ\"À—\Ç÷\Îûğ[d¥¥*,+T>*`—.o. \Ås½ŒıwE\İøÀ ş( \ÙÑ°VF«´>‰7šµa9[ıj†\ÓË³a¦}Àû\àÆ¢Ş’P\ß\ŞXÒ»k+zwuE\\YÑ›Kszuù°Ÿ[t–\æ}r\î\09­‡§§y}zxbpnVûu\Ói\rƒù\ÜG|\Æ\ãu\Ï\ÉNƒ\é§7\ß\íı\Ã\ãú\Æ\ësú\â\éq½»Á{‘R\ï\í\×ú#=ºylØ©M®\ï\ïĞ±\é­[­T=ZëŒš\Ì\îˆia$¡\Õ\İ\r:3? ]x½=zx{¯\Şn\Ş<>aAğ\é£}û\È)\äÇ¿\0_o‚\Ñ\Ùğy\Ö\rm\É\ØÚ²†€–ñ‰?t?²¶,“\â?¿\Õwi®À€¹v\0ğ?6_×¤¸¨@8\0>¼¤í š?\ä`x,a:c¨È“u•ğüR/,hu·°…[ˆ\ÜJ\"¶¥¬ñ…&\Å0—­–²\âqPYS©\ëVû¸nÍ¦I$7¤(~\ÑüuUG+\0$`´Ö°`<\n­t\Ê@^\Ş\Û\Ær]øQ\'‹s\Â\àı\Üv\İR/\'…\Ë\ëqW·E\Ö\Í\ÛºB‚F¡;c“õŠ‘g`«sº+‡“1WYÅ™*\à$ôTzTVQª’$\'›¿Põ•M÷ø`‹\í¨\Õa\í\ÆL£.’R\ïŞÜ­\Ç\'&õ0½<·\æ\Ûd¿w×–a¦E.ôÑµcø\Ãe½¾¾\ÂcKz}\á \Û~½:@¯/\Î\è\ÅùY=C¶Ã¨w\Öt{µS÷õJvc—l\ìĞ‹Ó»õñ•y}ıÎš¾z÷ˆ¾ñä¤¾ñü4ğ¸>¼{@Î°/Cˆ\ï\Ô].oŸ´V¬	]\ZÖ©ƒ°wŸN\îkÑ™ƒø\Í›Dß§kë£º~¿ZkşygB’\Íyû`Q\Ï\à“\Û\Ózó\Å)}ÿ·¯õ=€ö\Ãß¾\Ğ÷ÿ\Ì\Ù~ø»—€\Ñ\ä˜û‘\á\Ù\Øğ ùBX\ï‡~ş%\âÿb]2„gø“W—•o“^X–+·f(\ãvY6ş©À)ixü°£?OÅ¾/‡²8X\Åv\àõ\ÊHH¶É²…—2˜\ÑY\rÕ†\å¢%ò%dü ?f^0\àÜ¶i–¬H2ª`€´\ÒKEÀI\Éa$7–\ÂVXù€Âš¶ôFÀ¶XLşiù·¿hpcø\ŞR;9,HI·¶Á|V`..e\ßdq1¬nß³\È\Øp“ı¬h\ßÁVùJœiy9Ê†ù\nCyò\Äù>\0\Ïq)—0f\ìk²Ã§«\"U\Çö\Ökı@-2Ü¦[¤Ü»G\Æõğø.=;5¥—õú\ì—À\"\ÛZ,o¯Ò‡7qı>º±¦OnÕ‡€ó#Àù‘\ÉõU|#Rı\Øj‰¶¢>ğ\ÎÚˆÃˆO¸Gô¿:¿KŸÂ¨ß¸»\Êv\\\ßzrF\ß|º¡o<;¢\ï,\èñù\İz`!ÀŸ®Àf„’G$õ»§w\è\ÆÆ¨.¬\ê\â2¬\Èå£;tûÀ\ã¤y|yF¯naxw\ØW\ÂÆ»Çœ,—6\çßš\Õ7ˆüş\ÎXFû\Ã+B\Èsı\à÷\Ïõ\ã\ß\0>\îÿLg\éøGx\ë-!³ıù¥~`j\'ˆXZF‚\İ[\Ğw;›ƒ`u/ ­_j·aoş\Î<ŸK^3ñ4/,\È3 \ÚĞ–\rc9 Z;[Dx<ŒtEñN\ØŸf«“mQ\"ë¤±1]k\"t\Öc\è,³kş\Ğ\ØPÆ­›&	#’€Õ±§\ßÏŠ\Î\æ+m}—r+‘€\İ>\Â\Ìg\ãºfJ=Xc?<¡7b¾•\Ô\ë\ÍsN¦\"ö±\Ğ\ïSD¨\Ê\åy¹|¯~‡ô\Ü\\¼pš\\1X1ğ\â0d¸@¹¡BeÃ†ù°¨u”k/¸LJ´óúTIµI\×»twmL6ö8rú\n6{\Ãı\àò\n ³!½úôö)}q\ï¬>½uXŸ\Ş9®\Ïos®pƒÇ¯,\ê\ÅÙ½°Ü¸n\é×•nG~\Û\á0\àƒ\ãƒzz\â€\Ş]Ø«\Ï\0\ì·Võõ{\Çõ/\Ï.°]BŠ\ÏB\àScz`=\'ğ“]¤bRú©=Hşn=¹8§û„£{§gx­U\Í\ç]Ü«\ç7ö\Ëş›ä­#so\ÑY£\Æ\0øÁ£\Ãø¿e=º¾WO_¬\éû¿z®\ï#­?ü\r\é÷÷ôXğGH\îº\ï¸\ï¼ \É\ßgûÁ_\08cF“c \Ò\Ím“\å-¥\"¿¾ê€¯°8ğ\åb\ÄÙ\æ‚\Ò,²{[°\ÉuC\ÚX©y>Ø°„\Û\æ±l\ÕÖƒ¶\â¯1’\ÃJH°•I¬hl\Ö(à·¿IH\Z\0	!IÂˆ³–`p6k\Îf¶Eğ{\æù¬vhsCI\0ğl\è\Í[\éu< \Ç\Z*\Ø\"V“$ğ\Ø8¶ı¤v\Ò8a¨0X¨@™S«f!«…\Ê@Z3Šr”U”Ç–£LW¦ò9\Ñ2\n²”Y˜©\â(\Ö+¹Tõ‚yHs2¼™J/\İ\îüFÃ\í\'	/T9«¨š$\rB›[|}µ—”»GO\ÏÀ|Hğ˜ï£«ƒK+€\ìˆ>»»d\Ò\×œ\Ñ\ç÷N\0\Ä\ÜwRŸ\ÜZ\×\'&\ÉW—I\Ò{\0\Z\ì‡ô^_\é\Ğ\íµ~§\äòğ\Ä.=<2¢gSz»~vkI_¿¿\î°ß¿¼¸¨o¿¾¢|¼AøÁS&Äœ\ĞıH/ğ~F}rv\\\Ïñ§/®!óx\ÅÍ¿†@ö¯\Øú„\'[\è¹ı\àñ’>|²\æ\\¾»¿\08+ñ­\0©\Å\ë9\à²K¤\×.`\ãÁ¿	ûP\"Ë°\à÷	$\ß\ç1“eó‚?@šMOˆDo±\â\ì\n¾ ˆ¼”¤‘ñK\æ‰ğ„EöW\îBü\à\ÃZ=­˜\ëÅ°­ûb>Ë…awF`·\É`p>çŸŠl³Å€¬‘K ± bk¹Õ¬›\Z–Ã„Á µ\Íi«·\à¿\n†4fD’ı)¿Š\"€	\çº\n”Q˜£N¶ò\Ê3\Ø¡\'\Ø\â\ÅÊ†•s`\å\\N L\0˜U„¯c\ËÀrd\0ºŒ¢L\0W ,7\Ï#„d\æÁú€¶(\Æ÷‹yT‚!\Ã.À\Ç{Á~™le\â\r³‹²\ÕY\ç\ÓT_H¤\ÈC\ÃI\ÛS©\ãSºx°…´:¨{€\ç!\á))õõEóóz{qYŸ\ß:®O\r€÷\0\à½\ÓúÚƒSú\Ü&›Û‚C7\×ô\æú¢Şï¯\é\Ö\ánµC×—;H\Ç=ºwdP\ê	,ø\nvıø\nì‡„ÿ#\à5öûî›«úÎ»+újöğc@»{x²ö³õ©»ô\àÔ¨Ÿ\Â “j¯Ù¿-\ë\åM[¤|¯^sû\Í”…&[\Üòş¼^\ß|\×\çõ\Ğ$Vü—_Àx@<\àH¾?ø\r û­1¢moô]¤ø‡„“ş\î	\Ñü!RmAvüÁ\ïqù\äK¾\Ğ\Ïñ[ò`‚=û\Ô\ÒÛ¨B®Àl›EZ‘½À¤\ÖKEŞ¸\îªy\Ì\Ù8À\Ä\"+Û”r›\Çm\É^§\Ù\"CÀ2Ëºdü1À\0ƒ&½°­3±¶y@²ö~\'!\Ãú\Í/\Z+ú	)n<c!R(v¬BVa *\Ğv$1£$\ëyHi6L–¯À’\Íw\È\0¤Ù€/&7o—Y”¯,F†\0\Z\0[´ ¹&Õ›\ßK`)\0`^€¤L\è\È\æ;eñœ,<c†½¯©\çi¬§\Üé™\èğDL\ÓI©0ø­z|rROO\íÕ«³\ÓNZ}se\É<\n\07`?$ø\Î:\ìwR_{xVŸ\İ€×—I\Å0rxg­ğµ\èò\\³nÎµ\ë\î!\Ì÷Ø¼\å\É]zs~FŸ_?¬¯\İ:¦o\Ş;£ï¼¸ªï¾¾\0¯\é\ëON\è\í•Y==;¡û§Gt÷Ä n®\ãOÀ\Ì\Ü~vqo:K²ezI\é÷a9›#|ğ\İD‚¯\ÚIø@ghXò\êAg\ä\ãŒşÁWô\İ_¿D‚“]\â÷¾ø¾÷kØí‡¿p€\í{°\ß÷~wW\ßı-`³\Ç\âw\à÷‰~\ì0\å~ÿ|©-¶Joo·&ö\ïP>&½€$œ\ÏA¶Q\ÌQ\è²a+c¸Mp:ker\ÆM­´aõ2+\ÔZ\Ù\Â\ÆU\Í{™r\0­~\èı²‘¡\Ü\Ê2€­F³Aë¬ \ÉAJCjı6*r¤\Ö\î³2òÃ’\Å\Ñ2ò\È!\0\Ë.¹r³”‘ˆ`$c¦T.\à*\Ì\ç>€Ç–\Åw\É\æD\ÊbßŒù\ÒY:÷eÁv€)Ÿ\×\0\ÊL›k0¬(cÙ‚\0,›‹f`1²ø-²øÒ‘ñÌ¼<•—\æi\'Ad¡?¦#»*t|²V§w\×\ëôV]D2o:\ïÛ¥ûø«g\Èñ«³súğ\â!XkQ\ß@†omÀz‡‘\à\ãú\êSúø-8D\Z¶U6\Æt}¾[—ö6\ë2Œzm¾]wõÃ€]N*~qf9Ÿ€«ú&Àı§Ç§õ£—7ôƒo\ë_\ß\\\ÔxI@ô\â\â=„7HÀGx|\á\ä÷\0>”Ïºl\å¡ygÉµOe>:k	¾½¹\r€ö¿uûu\çÜ¤®ŸfŸ\èı\Éc}ç—õ=\0ø\İ_&˜ğ{¿~\Ì%€ûµñ¥¾ó«\Çú.2ü]\ç>ĞŒğ+› 5öt\î˜[ò9ˆµ\r)\ÍT^I^0\Ë	E˜mû¿´|k\Õ/.sˆ&,`Vz±Ç‹aº*±‘\ä\Øú\é‰F®‹\Æ?9¶)‘66lNc!¢I\rri\ëöùb\ÖÊ$GlØ®\Ô\é®ñ9]4>\å\Ü\Ş//„¼jrù\ÜÀŸ¡´\\<™\Ë\rfK\é\0+\İ(9q2‘J‡µøN™€\'\r\æ\Úk¦6\Ò\\YJC‚I3,‡9qR¥*\ÆO\"½yx\İ\\}\É\ß\Ø/\Û@û¥òŞ¤d7\ï7\Ü\æ\Ó’ğÊ¨Ö¦+\Îi[!\ëü¡]?Œ\ç::ª»\ë;u\Æzzv¶ ²J\ê=¦Onn\è\Ã+ü\äö:òË¿2§gH\ë\íCcº°§E\çô\å™vX°MwW\ÚõÈ¼€z¸>Eª-€|\íöŠşù\é9ığùuığ£{\0ğ2²~T_·\Ò\Ï^=;·\Ç¼±Ò¦;øÁg\ç\'õü\Ò>g-\ÂgmEÖƒz{Ÿ~Ÿ0ôpU=$€Ü³%}m\îğ~\0<¥›\'Gu\é~ı\á}ûWO€\0¿÷+ÀG±\íû¿\æ¶@€÷+€0­Aõ{¿1|\Êõg°!\ÏÁ~\Şd@d\ÙŞ’[´]©*õ‰=\Î\È@¦	‡ò•–d\0BÀf}s„!¬—\Î:L,Y–\ç¨Àeÿ’\És\Ü0ß—\ß“cœ\Å:Húõ’XøC_¸\àÁr\ÛùUˆ•@0¬ò(A¢\ÂFP<r\İ\Êa\Ët¹ø°MN°\0û¤À\í\Ùi¨2h&¸\ÜV˜Àğw\0\Å\Ø0­ q‚e\0ó\0m>\Ï/Ø”\ä4<d&\Ï3¦t\'\ÊU\Ç÷™ÇŒ\áùø¿‹K$Àg;uA\Ş\Í\È\ÍPANz\ë:\Ørş!su2©Ã“	g\ÂÒ…¹n]]\ëH°‰øÁ\é	\'¼8\çºL¢¼~x7\Ã|€\å\æ	}xeMoÏ¯\éÁú]˜i\Õ\É\áj\ßK Y\êÒE\äweH\Ï\Öwj¦œ¤ü\Ù\í\Ã\0pE_½º¢|¸®\Å~ûù./é‹‡+ú\Ä\Öt\ÆÓ½º0\í$\ç+‡:ñ‚ø?n?;¿O/.M;«æ¿½I\Ò%™pcYÚ’–ôÁm[E^O/\ïuº»í¯¾‘¼Wn/\é\ÉW¯\è›?~®oÿü¡¾ó‹ûúö/Ÿ:€û\Îÿ\êò_\è~õH\ßqZ€~ç—¯‘a\îsJ6Ê‡ø\ÃG0`Q†*\ãQ;=§<T(–­f¾\0v\Ë\\…6`OPq¹	~+PsİŸ/œ¤\ë\Ã/a\ê\r¤Æ€ö7¬ùÜ¶?1´rˆ\Ó\Ô\à·6)ë¨±\â4>OhÍ£¶Ê¾]/³\"u\Ô&­óXuPEU^\'}Z-.\Ç(\0]6Ld[>L˜3a¹m9Ûµµ M\ÛM`¶*&\Ì\Ïx¹ÚŸ\Íp®\Æ\ãùÚœ\0(a´\í<\'‹\ç\çX°Jx•\äñR¯Gù|F:À\Ï\ÄVd¡™_ú?õö\Ü\í\Ê\Ê\ÎPce©&ºš\é\èĞ®\Z‚H£NØ¨\È@¸Ü¤Kx¹QÉ˜ß£—g0üŒW—ğZ\ä%½½0KB\00ã›‹+zx|‡N\îª\Ó\é±¯\ïÔ£µÉ„oÀ¢\'\Çõù\É\íU}ü&\Şñw\é_`Àï¿\ß\Ş\àòŠ¾…$\rşp½¾|PO\éòr«nîƒ‰­[\ç 8«loœE\Ña¼[óx@R\ï\íC\Î\æ<»¾OwñŠ\×a\ï3„Ÿ\É\Ù.5-µªaw«š÷tkúø´–\Ï\Ïj\íÊ²®¿=«¯ÿ¡¾ı³Gúö/\è_~	ø~õPÿó™L\Éu¤ø—°£¬	ÿ#5ó!$]!™.\ésaŒ8A\î\n]nq\n‘³\"˜\Ğ:L|€ÁÒ°5¦\Æ\ë}\ÎP\\±“–ñ€\Öò\r„€¶)±ñWü`	¯µÿ\îµõ­vg¤Ì€t\0/X‡³•p½ R¦|˜ğ?\Ø.—\Ë\\€òóN‚\0¿=/SÛ\á´üM`8`3I6/X\\²ñ\Øv\îK+1ÿ8³`±\î3 Á|\Û²\0lK(*ñ}x	\ßFD2\Ùÿ,~† º\"\Ş1#ğÂ¤\éYY\Î\ß5Œu•if\0/8’\Ò\Ñ\ÉJ­\'	#µN\ê\Õ\Õng,÷\Ö\á<\ÜN=9>®\ç§B÷;=ƒ¯\Îp\à\ä;¼Ü»+‡`·¤vT£µº²¯M,tœF2±`\Ğw\Öô)òı\Å\í5Â‡y¿óú\Ç\'gõO/I¿o\î\é»oo\ë›\Ï6\0ş\ã‡”¾½¹O\ÏÙÜ°“\Î\Í˜¯³ÿ¤{nû€|cÿ‚|s“ ¾¸z@O.L\éÖ©ºtbHó‡ºÕ°§YUû\ZU3×ª\äx­¼­I•5¥lM(\Ü\\©x_&M\ëù·®\ë›?½¯…¿¿mLø«§úl\Ûw	*?øõü¡…$\É\ŞRP´Mn€sõ\ÑÀ$ÿ4Oƒ˜$(¼!\Å\Ê*6m\Ñ\ZB‹‘V\ë•+\à@Z\çHQ«\0\Ú\"cDGº(©¹\Ä\éL&E#\ÛVŸ³uûœ9\Æ5\0¯1$wş«ÊŠ¿0^Ø‡Ü–\àûHŸAc!Òªjr\èE’I\ÂY\02\r\ÉMC†·fj+\'‰\Ãh\æó\Ì\ï¥\ÃxH4~-­Û\ä\âÿò\0]6`¦ñ\Ü4@›\Ïg¤\Êù\\·rCx= œd–¤³\Ë<„@k> o77\Í@%|9\ZmójoH\ÃZ\Ù\Ö\êxL×™\ÙVdoP\×\ÖucµG÷\ì\ĞCü n¼<w\09>¨\×ga›3ó€¦º¸\0\ÃM>úuf¼Y÷—w\ê\Ù2y‰À\0S½\åùŸ^9®Ï‘m\à\×o\Ò?Ş¿ o\Â~ÿòìŠ¾ÿö~ø!’ö\á=}û\åe|!,øt{\Ç@6\í€\Ş&©?:5&[\nø¥\Õü.Ù\ß½\"½¾j63\Î¾Y\İ9³CÖ»u\âhŸºö\Ô+>Ù \ØT½*öµ«r«\âXo}Hş–J•wV±\Å\è¨Q¤«N{N\ĞUXñó\ï\ŞÓ·~òHÿú³\ÇNÛ–m\ßı%@ü\Í#\0øOˆ<ÿî¡¶oS&ş\æı“²µœ]\æ\ë\â\"¤¹\È\Ê2üøùn»¿Y-„	œ¹µ…ø\Â¾\Ó=\Âó\n­³\Ä\äø\Ë@R\àt\ã-¸\Øß¼òz+uxğu+&·\ä­ª¤&(Weô«Y/À~Hw±1“÷\ÊAöó¬\Çg\æ”*\×\î3s| \á/—f\ì\Ç}\Øğii9\éÚ\ç\Ûf>\ÑØ‘-\ä»-\Ö\Ì\åù0¥y\Ç|\ÒvA²”K6¼j®Ï«LN’\\¯‹tŒô#Á\ÙE\È~~\ì\Ì\Ø4=Cq~§¡\Z\0\Ø½š\ê\èX®Ó™}„ˆƒõºb\Ë{\é\Óı\ã$bğÁ©q½8k~\Ğz‘\ãó3H3ltú óøÕ…N]\Ü×ªûk;õtcß—\r\rõ’ı\Ñ\Í\Ãúˆpñ\Ù-ğ\î}\ãÁı\Óókú§§—õ\íW7õ//¯À›\\\Ç>;¥¯==\îü¥Ã‡\×\í=fôø\Ì\æÿ’Ø¿³¿¸fE\ç½º¾\0I~b\ËyœÙ£›§w\áûvjıP›ö\Ì\Õ)9V©Ä®&%±{Ú”\Ú\Ë6İ­P³‚M\Õ\0¯	FŒ\Ê\ÛV¨½Vşöj.\ëT5Ü¢¡•1­?<¢\×ÿxM\ßø\'òüm\äø{\Èñ·I\Ê\ßû\í<`şV\Òl¦Nñ£\ØD£®®r,?H\Z\ÆtáŸŠ½_¶g¹-ñZTJ\È(rÃŒ\Ä\"Wˆ\ËGªó\Ü>R°1!€,\â¹6‚Rjÿœ\í+uVFõ·UVW®\âj@WPa\n\ÖKá½’.\Ğ,Àš\r\ãf\Â\\d0Û’0×³\Ê\0¡§p|\éó³ğu¤\á<K\Æ\Æh\0\Ğ$—}\Ù[mG2·Y¹\Å =\'[\ï\ãß¶¢\í°c¦1vœ\Ï$ış/À÷:\É;˜Í¾gò3`xcM_ZVº²3¶«	\î¨tk¼‹4<$tx4 õ‰¸NÙ¬±™F]Y\ì‡7\Çr\ï\ÓCX\è\é\É\İz~v‰w/\Ò:\Î\ëñQ«ıMÀšC:Gò½³Ü£GH÷«só°#,ˆ<›lZ£\Â\Ç\ÈõWo\Ö?<8­o>¾ o=½®o¿¾«€ÿB\nş\æ‹sú\æ#\Ø\Òş\ë\ã\Ö\0^7€\ívş‡ø\å•®ğ]qş£\ä\É9/\à»u¢G\×{töp¯-´©i0\r\Õ*¾\Ó\0X¯\ÄT‹R“\íJL\Â]\í\nw\ÔÁ„•*³e”›* •J[RòwÀ\İ:«\å\ïŒ)Ò™T\ãd«œ\Ô\ãO\ÏÀŒ÷õÏ¿…‘\ä-yi€§@\'1•D©ªªH°Xnq,³ùg\Í%62\ÂA°a¨B\ÑR®)±\ÇmU)¯¤\0ZÁÿ!}E¼Æ™ğˆ¬[Ù‡o5\Å\ä©5ğ•>X\Ç\Ø\ÇI¡>€\0ó„I<³\ÜdwÓ‡\åx‘d¼Z·3¥%·#½[a»\í\æM­S”#š7\ÌhH°y6“k\Û`\Ë÷y\î\ÖL¤›\Ç2¼„,ü¦\É}6²›‰ÿ³÷Ï„es,€p\"¥{¬~\È˜\ÓaÕ´¬\í\Ê\Éx_5\áu%µ£- ½>\í\ë\rka(¨ÕI\çoli33-\Î_·^_Âƒõ;!\ã!¡\ä1Lø\ä\Ì4lHHØ˜\Ò\İ\Ãcø\ÅQ3®ó³\í0h—®.‘¤î£Igı\'ö\é\É:²y\äz}ô|$ù¾¾®†	¿õ\è‚şù\Éy\Øñ¸>%L|`‹L^Ú¯7W—¸\äµÎŸ\"\â\'ù\Å^\ÄŸr¦\r<‚•ïœpf÷^i×‘\ÅZM\ìx}U0] lTbg‹;\ZŸhg\ëU‚@’\ÚÕ¢Òº$*.OC\\>€\èmek«¼-\ÅV¡ \nl\ã£\n´\Û\í¤zf»uşéŠ¾ñcKÁx¥|@t*¶ù0\ì’[˜®œ\Â\í\Î_\\¹L^a|ÍŸ°.\âÀeuC{<P:Œ’k-\í0‘%h \ré¹µPGŞ¨Š›\Ê\0[Ê«BÀ—‹Ÿ\ÌCşò¢Hnô\ËKAl”2ğ,d?šÿ\Ë1ydK\ç$ØŠ\'3\0n\'\å¾ğ¬X¼n/„„…m„§|B\Ù\ÆI±-›×¤o\Ó{Y™²\ï!\è\0h\ÂR&L\Åûfr‚Y\Î\ÄfÁ\âV°v7\'My™\ÛT\ã\ÏRG<_\Õn\íë¶š`Ls]a-õ\'œ\É@Ç¦ªtrªRg\ç\áB·ó$÷\ï\Ğ@ø`}‡\á	¬s\ß.\İ\\\ÛS\îĞ­C»tiv@\'¦û4M:4Tƒ¯l\Õ\Æ\Ş˜——ûuÿ\Ø>rAo/®\ê\Ó\ë\'õ¯\è›O®\é«÷\Ï:\r!Ñ¯¯\ÎªI$\àp¦‰>¹\0\à‘\ãW\0\Ğş\çÑ¹=ºOĞ¹EÂ¾ttHg\×zut©Q³ûkUÑP°»JÁşZ…\êmVlşo¼Q\á±6\Å\0bb¼S¡Á*¹\ê#òT\ÇUZ“§0\"Ç¾¶Jù\Ú	+mqù_ûƒ€3Ø™R†·U©~W=\0\äÀäº²tş\â²bµœ¹\ëu\È&\0*\Â\ß³¼BkNp¤ws\È\ÍK2u\Ç\ì\ß/ñO€\Ì²1 Ú°^’\\P\ÈsişÉš\\H­¿½\\\î\æ/¬d8/\åV^\rÒ—\0ˆ!@€ü\ç‡ı¤\àr\åÊ”]N\à\0€™x\Î,\'™–ÂŒ¥0“1- 4t;# (¶#³V’IC–\Ó-p\ä#Ç€s«±–\ã‘`X\Ún¿—h33ğ}%*ˆò\Ş\0>;H\àp×¥,¾c–3Š\ÈaÁN¬t“{8€:/û}UrÕ™*VwE±¦Z#:€\Ô\Ìô™ky$¦¥¡ˆc\àO\ïo\Ò\Õ\Ù>]=Ô¥\Û+½º‰\'¼»6¤;Hó\r\ï\æ·\í\ĞÍ…ºxp\ç÷kcªW\'öôje´Qû;R\Ú\Ëv §Bkc\r:;Û¯[k“zt\â \Ó\ÌúÖºl®®\á8u\Æ\ç\È\éí£“$ñ.]\è×…Cıº\r\Ø_\Ù?^^Fö¯\íuşŸ\î\É\Å)\İ?3¡»\'ö\è\Úa>\×f\í!»ûj\Õ\Ò’·\'©ò¨ü	)„cJ¶)²ùlVx Nµª\Ù-…¼Üµ\Ûü`CL¥mIù›\ã*3@6ñ^\ÍHsl\ØW¨-*Á%‚do\ÉCj­ğ\è‰Y%:\ët\âPˆ\ÛYÊ…A\n‘,“\âBJ¡«\Äi­5²S¯\ì\\\Å\Ê/\0€–&jSXğ\0€\Óöø\Ê`º`W\0ğ‘vkƒ\ÈnTE)?\ìW†ü\âÿı<À—\Í{\çGğ|üp@¹€0\Ó\äTnÀÈ„	\Íf\ãó‘\ß\ì2¶\ÒBd\×@eEf\0\ÓYYf;@\Û^\\\ã\åñ˜ù½\Í0²ı{?7]ÿ›ô4B\'U’\ïõ\"ÁÆ€€”E\àÉ€ı2¬ôâ†‰]\È0\'•\ì\\d™Ÿı*}0`E‘ú*ó4\Ú\ä\ÓDGPû»½\0Å¯E<\áÊ˜\Ö&ª\0S•ST¾¸Ô¬v\éú¢]\ê\â|¯®Ò•…][‚ù†uißNNwjc²K‡F;4;Ú£Åıš\ëÖ‘Mu7s½E«mHõ°®­\ì\Öİ£Sº‡‡|trV×L\éôÁ¯w\æŸ_À®O\è\Ñ\é)=¿\0ø¬}i·Sfyt–×Ú¡kÇ†tşP·N.v\èĞz\íÀ\Ç°I\å0˜ô\Ô(\Ô[«\È\0R<Ú ğD“b;z\Ù:\İ\Í\æ0b£\n\ë\ÂòÂ‚%õL#¬\×\0ò>n®{\ë\Ø/\0\Ù+6>@Y\Ş]IHÀ<¤¹\\84­Æ¾Z­\ì3\0f\0Àm\Î:!9\ÈY\È&nG+Bò¬\\c\Å^{\Ì\0X\0™´¿E-,*…5I\Ë\ÑbÛƒ*m-—‹ô\Øÿ{Tú\åª tXñ7\éQv\Â\rğ|\ÊEzóğ‰ù\ÈaƒI¢\æË²`\ÂL+>›—#\Ãl\ÆR\Ù\0\Å		ø\Î\í€\ÊJ$\ï\Æ\í_†‘tö\ÃB\ÊÖœ\Í-\ïb›õım¤YHz+¿„‹ºc.ŸaoK\Şø[{Nº…¾¯šX°Ù–‰\ÌşŠ’e\êKn²`µG;\Û\0`/L\Ø\Ö\ìp\\Kca­\Öú\îjš\î\ĞÙƒx;ûK°\éfçŸ˜\Î\ì x½óûl‘I\ØgO3¬‡ô\"us}\r°i›F\Zªµ£³Q{;	;\Ú\Ù\İ@\ài\Ñ\Üp“óœ¥\Ş6­uj¶¸³C†š53\\X›tbnX§—`À\Õ\İ8:¢\ÇgI\Ö\çö:\á\ç\Ñ\éİºrLw6v\è\ÒJ\Ö›ut¶U{&ê”¨)% \Î\nd4)_OJe°o\0©\rT*2^E(ia\ë€	a\Åf\'%—c=Jªğƒ„om…J\ë+TÜ”«`\âıKkcòÂ‚¥\ÍI•Â„¾&dº> -9ü¨\Ù%i\Ú73¤şZ\ÚL¤\à\Â4\å\à«òò·;h£\Ì\Ê!\02§8fDja\ÈtÒ—‹ÿ2ù\Í\å±Â¢g’R°%@2ª\à,\ØL¼%5!WúTd\İ-q€—\0P¤P“\İ“Cc@|`n9f\ËY6\"\áÖ™:\åK\Äø3K\Üi\0˜¿ÃŸ½W`^\ï\Çş;\ÃtVp¶$lÑŠ\ÈL-\ïm{\Ïi8\È\'ıZÑ» \Ìg\ÚĞ›¸\à³\0b7\0\ïc\à³l\ï±5{›ò²\ÒT\á\ÍWw²X]•\Å\ê¬+\ÔpK‰öµûœ\åy\çzZiu´\ÒiV\Ø\ØÓªµ5°b£–‘³Y\Ìı\Ü`½\æjµ<V¯\å‰F\Í÷\×\è`oƒö¶Wk¬¥VıU\Z\à\0ör\ÙW_«\îš\nt\Õko»\æG`E€w\0v` \âµvt5\0PÀ7\Ú\ê,óq`¸E|î…¥!]X\é\Òİ	=\Øsš\îÔ½\ÃÎ‚\â§\çµ¶¯J\'jTG òT\0H‰„­:I·	:*0?ˆGv²±¿Q\ä7:Ö©0Ÿ\êiTd°\ÉM©¨6J 	a³8Ş•OED\Ş\ZŞ·vl$€ò˜vô\"\ÕeM\å\0\à\ä&\Æwwi\0q`O9.M\Ùøœ\Â÷”S®b¯•Sğ‚2³\0\ÆËƒ\íò¸]PX\ä\\\ÏG\Şì¶±¢\Ï\è¯a8¡\Ú&\Î¤·¸\ÊûÁ€\ÉMù-Œó91¿r\âø=ü¤\Õ\áòHÁ9!¤—\Ël¶|®gû¹n¡¿™]\Æ\ãŒ\í>l@††}-ñnˆÛ¿d:\Çº\n6™\étLù~¶•nO€.ö\Ë\è¹xÀœ€mXrX\Ù\ë\Â\àÖ¨`\r0k\ß\Ó\Ê8\ÛIÁ¹\Ù[•ğfª#™§\Ş\ÊuV»4\ÔPª½œp\Óø¦Ù˜ûZ\ZNiuG/—\Ğ±³#¦úr5Tğ\Z\Îş$hGw\\\Ó\ÈÑ¾>[œ¨N;[“\Z¬¯R?’5\ÚR£N\08\Ö^¯À8\ÚX£Mµ\Ú\Ó×®‰şV\0×¨ƒ#=šl\Õ j­\Ó`s`¬\ĞŞ‘\ílÔ±™>˜°Sg–{uqm@Wû\ê~]>Ü¦³‡`Ï©&\íß‘P?ûmK\ë¹|¬\Õ\nH\0tyG\Åf)\íhVh¼N\á\È1\Ì/ÁMòsByQ€\0R]ŠÄºkı¨JW‰\'\Ğ%\ÕA¤™\ë0Ÿ·®Œ\ÇCò Íú ¶\ä\æ§;­?6Ú®ñv§¸œ[@\Ò\Ë\Ã\ì\ã©ò8¸µ\r\Õ6…x\ßg`s\0gI\Ù\ä—K\Øf€0\"Á£¼\ÊÃ™p\n”n~HWE\0\Ét\ìˆ\ÉnaŒ\à÷\Ê\ágG7%·0TN\Z\0\Öt\00²I¨¹V›CÍ—eŠ,À‘_n\Ş\0’Z³\ÊK¡2Ê¶L˜/\'s3l\ämšM†­\rk»¹\Ïü\àû\é\Ê$`Y¹\'\Ğ\åG8	\0£¥\ìl!a\'—\Ï\ÉBŞ³Jxo\Ş\Ã\ê\Ë\ßI\Ùf‹ø¤½¯„\'S-	`:ª\\jOi‚3z7‰xo_ˆ0\ÓÁ¤x0\'Œkx¸Ù¯f~›Ú˜[mUau\Ô5Ò˜Ô\îj\í\"u\ÕÂ¦1õ6\Õh\0ƒ>\ØT¥Ş†\Zu4&4\ÑÓ \É!€\Öİ¤ö:õ4Wk¸£YûFZ´{ \Ğ\Õ\éÀN\íF²`—)if´^I­N7i¹œ\Û]«\Åñj\ÅŸi\Ò\êşjOh|(¡H¬@ÁB•`³\Ü\Í\Èc\Õ\Û`ÀŞ”\Â#5\n\0wq‰?\rW\ã›†;k\åx6D\ç\ï‚ı\êlp!ª’X€cv€\è†KjI\Ë5lu¹ª|*[òÙœ¢t\rŒ´«sg½²·+3P\å\æD\ä·\ÚLU•\ÉşO\ÃÆ‹ó‘\á|\ä.¯ €\ëN?^®k\É7\Ïi\Ãµp\Ğ^\Úúk[ªœ\Í¯\Çenpó%Ë•E\nÍÀ¢6ñ\ÇÆC¿ƒ2€8\0g6\áÀj€ğ\0¥s	H2|¥\ã\×2I«[³s\0X:rkekV\0ˆ6&\\@!„¼p¶™\Äÿå‘¤sC„¤ ,\È	\å|\É\Úf\Æ!\Å9Æ‚¥Æ‚¤p\âƒ3yG\ê³3•™¾M¼a+ûİ‹\ì¯v«µ’\ëUE\Z\ïôj¢Ó§ıˆ½6Lg	6¤]\Í\å\Z@š*K`@-\ÈS?R4\ÒÑ®®”ºñH}\rq\Õ%ü€®R=uIõ“.\Ç:\ê\Õ[‡ce\ÚğO=m\rjª²K[5\Ün«\Ó7iWO½öô\ãÿ&ğŒU\ê\Â_\rw\'5E€\Ø\Ñ^\á,÷6>PÀ\ã\ÚİŸÒ!$w¬Fs0\ßî‘°jÙ§\â2B¿	û\ábŸJZ8~|¦\rµù{š\Z$ùö(A$\n˜\Ã;j\"HôV+\ĞU©2oQ-a³\ÑO€©\"\à£’T\0õó9,Xš„\ÕIc\Å\n+\Ë5\Ä\æ(»`›úú\Õ=\ÒÈ½•„¸\r\é\ÍT\'‡\İf“\0\Ô|Qvq: E¢\r¤\Æ~\0\Ğj†6Ç¶$X pG\Ø9sJš\0´[\ÈX±\Ùa>˜0—\ËÎ¶\\X0¿—ƒÌÀ‚ø1` \Ë&€d\ä,+»\à2\0Z–P\0BI†|`&0m«,“€a%K¾–Xad\ëŠ\Ùja\àl\Ï\Ì\Ñ{\0±€\ÔmŸ™o]7_?\'HUs\ìöY€\Ü\ê\Öôj\r\rÆ¦i¹¼O–\r\Å\Ù\Êõ\éjŠ\ä9«\Ú\"\Ã=U\ÅjOj´¡D»\Ú<x¹r\í!ıO÷†O\ZDE:8ùZø-š“!µ\Ä:‘©mqMv§\ŞjW_mJCu	g©Œş¦¤†H\0²»\Æ\Äcõ5¤`Ï¸†:š4+t·\0>|\0œjS7ò\ÙYQ¬\Ù\Ï{öÁfmHW•\Ú`¥.\î\é©\Ô\Ô(@\ÜUOl\É\ä–\ã\åQ‚üZ\Â\"Ÿi¥o;‰Õ©²ş*•\Âp#x@¼l`¨Fe\Èry_µ‚½x\ÅÖ˜Š\ê¢øû2\Ç\ç{aº\â¨Nˆ‡÷,¬‰Dr*¬b¾{±‘\ásK6œ˜¡\ÓNLfrl\à\Ë\ç\Ì\Ï\æÀ\å²Ù¢\Õy\05ƒš\ç\Ü&%\ç™4\È\ÎÃ–\Ù\îLü^™<­!˜øm;ƒÈ‡\åò­\ä‚\ç+Lp\0%Ïœ\"n^\Ï\ãHpò›r\ã\È0÷e¬Pœmuº0lg­ñ¥›¥k“· ‰ÿ\Ëô ®M™\Ü¾O¨²a6+Ç˜÷³f…\íE…ø?;¤Y\é\Ê°?\0;\ßJ0|v1¡•x`\ÔL\Çò¹|Fº\Û\ã´n9¨l\Ûù\àôm_‘¥¨\nd«3Y c¿j\0˜ˆ$\â\re\Ú\İ\ê\×î®°&»b\02ÀB\Ú\Ñ\ĞXkXm\å\0ğ5D\0`ª‰bR¼¦’\ç&	\'İš\î¨\Ö\ì3\İY¯\ÙşRuŸ\î\Z\Ôş‘NMvh\àMt·¤vRo·f†\Ú53²¹È°\0uñ\Ş-ø­:x2\âU,\äS\'|7\ê´[0\ÜV\ÌgŒ–yUÄ‰YT‹q\"”Zmù-#$~|j)\é\Ş\Û#öµ\È\×•¿Ÿûº\0e/€\Åwºù…x\È<,†»*H\ZNª\0\0B\n`¼’`\çı‹b\Ø1|·5ÿÀ4@ã»ºUß•PÀ\Ê!\İ\Z³ò\Ò`Dn³e;÷!\ËV\ä\Ò@›\ëü¡\n@ ¥¶rjs­\'ñZƒ4\ë†z`]ts¸­ \æS!>«À\Ø\rPf%Œ¬h~…Ù¹\\\Ï\ÉFso\ælÈ­É„ıœa3|¡M2²¶z›ñ¶\Ù}\ßÚ´,|\Ùp`m[\Û9I¶\â\r·\Z\0Ó¶k+>0“\'¦3˜C\"\Î\nò>AR0L˜¸m´\Å7\İ\Ê1°h&¡\Æ)ë¤§)\íı4q&J\Ó\Ô\ÇV¸\Ô[\ãQ_ªXñ¤µ\\;Z\Ë4\Ş^¦\É\Ş@ôi²=¬\éö*\Íôš7´\Õ¢\Ú\Û\Z\Ñ8Œµ3\ÑHuB£µx½º0a¦Ró0\Ë<\ß\Ññ^=8ª+‡&uuu¯\ÎÌ\éğ\Ô\áaX\ç\×ö\ëò‘_Ü¥•±F-\×jiPöÅœ•ğw!\Ã\í5aU…K”ª¦nlğ\à!c\Zë«‚ı-|6–\ë/q\Âa^5ö©¡B¥Í€‹\ä\ë\í$œt.\0ki_¼\ÆxH~ «öƒ%ûRò!\í%\Í0\âNSI.\êe•\r/\ßÉƒ\ï+\ÂW$`,LX·\Ş\ÛW\èŒûo\ÉAVòsÓ´{ªU|I«I²yÁL»Nz\Ì&ù\æšWD’³[Ì’‹\ä\å qvÛ‚K9\ãª-“+\åcC~‘\Û\"ks²z r\Ø&‚[\0Áø\Ûh‡~d¾\Ü0\Ş0\èCn£¥Ó ¥_t¹È¢\Ğa(•p@˜A\"\Î-Eª‘\á4W‘¶ltc[–¥]€fŒ\ç\ÛÆ‰´\r‰±Ş¿\í™\éz/=]_\É\È\Ô{™°c–õ÷Ánn€‡\Ìgq l\\N9 ´V,7Ã†\å`Xk\ß7™f)z\ÛVf¾¯¨\'K5\áB¤-O}u\ê#\r·F:\Å\ÚQ\ç…\Ñ<\È+2Ì²UµìŸ‘f{*´0X£\ÙÁ\nn‡5\Õ\ì\ÓtM\\SU•\Z¯Ii†}0\Òh…W“HôA¤t­£R\ÇújuvªGWÖ¦u\ãØŒ®Ù¯\ëkûtanL»ztx°A\ËCI\0t{a\Î1Ró¯\íE‰šü\ê&}vÕ»ñ’\åøG[#ºD1?ÖŠcš\ÇojÇ£°2¢Â‘‡ \ä%y;\ØvØ­ƒ0\Óùöx0³uV”*\Ìm’]\ÒHÚ­‚h¬¾\nA&½*%p¡‚°ùçƒ‰<«¹\â¹Mñ€\Û`†.¶©\Ä_\ì”Y²s¶<\Ø\Ï.‘¬<d-7©\Î\Î\0œ\\\Z(IœV¥‡P\á\í0c\é\Ûôz\Èh1h\Ï\Ã\Ü\æšÇ‹q`mŒ×†\Ù\"Å\ç9gcÇ\ßü\0\à\ãÒ†Å¬˜caÃ†\Æl\Ä Ë½N8P\äzlL˜\äj\ã\Â6\ç‚\íH\ß\é8\0b\0|\ë}n;u@ü\é6“P{Ÿ´¼5\í\ËÍ®\ã\r\íù[y<Í†\ßH\Ü9~N>\ÓÂ•y2M†o™\åÌ \Ë4™µMAN¼T0K-°`7ad ¾Tıu¤8I.\"xxµ§3¢½ı1€qfğzI”3¤\ãıƒ1\íµP\Ğ\Ğ,>m¾>¦™\æ*Íµ4h¦\ÜU“tÀ8\ZhnC¿vZ…y\Î\î\Ğúx§µUj\0›\äş‰\ê¨\Æ\ØSU\Æu ·O *\Ù\ì<ı\ê\Çô\áG‡\Ú}jÀ:”{M\Ñ`¿’b\Ç!	yT‘P!O+2\ÜJ\îH\Ê\İ^-A¦\ÌFFğ‚\å|_oRe|\'\×K\Û€\ÜS\Ìr\â\å\'¬’P¨\âj¯“€óQ…‚hV+¿;‡\êV‡‘`TNşv\í\Ş\×\"—‡@°2¥y\Ã\\·1\é\É\ây¹\0/\Í\Z² ’¥\Â\Ò\\‘^;ku½B+©ğAy ?—m3\\°!Áy<Ë™\àH.4\r\ÛdE\0&`Ì…\ro˜°³\Ä\Ê,€\ËF<\0¢õ:¥˜R.³1b®Ó¹m\Â9R¹\İ0ø\Øù=«	rı=“dŸ‚df\é½cÀ4\Ç\Úf¾Ñ¼\á{6\\gA\é6Ÿ™\à³-a›\ä»\0·•bøL~‹t³)\Ù\Û\åwe)\É\Ù\\…“\Å\Èp©\ë\\\êªq«­¢XµnX0\èÂš\Ã3\ÍÁ|mù3$\Ò\Òñ¾Î &ZH\Ê=q-q\ßÀ[$hko\ÔÑv­õ÷\ë\ĞÀ ¦[»ÕŸ\\•1\í\Æ\ÌÏlw‘’0ô£•IM6Ui²1¥éº”\æ\ÚkµŠt/4in¸Fk\r\ÎgÀ\Æ}m\í\ßS£\İ}!U…l\Ì›…*ğ˜ÿ3\0\Â`\0¦¨@\\,L–c\Ë<\Ær=\ÕN\"öö\Õ\É\×Yk\ä\Z€;y¯\è\á$2\ÏW\\ñ \í6½Á\ç+‚\Íó9\æyVõ0µ3\ÛSJ\àÁÛ»`ø-ùü\àª\Üc¹/%pe\Êlb6>\Ğ/\Ç>—ƒœ‰¬Y-\ÍşÚ¡¿\ãm¨¬L\"™0W®\Õölˆ\Í\0B\Ò+€Ë„	Í p.r›	Xs¬\Ó\Å|©);=‡H¢•F\0` 	6\Ğn®—Dc\'ó‚È¥3\Û\Í\Ãõ‚DV\ï³2\Ìö¬<|!\0³QŒ/K(\ïen\×Wğq\ï\Æ÷‘\á­<\ÏRóW8[a}»+÷gğ^¹–´I\Øi\0Üšr:Y|÷\í¨D\Ï-+\ÊvşI³š}l‰©»\Âş	©9.U{•K\É|\r4º	\"~\ÍÀ‚³€\Î\æ\ì\0úùşr™\Òò5\ÓW…7¬\Õ|[\ÌV£\ãM\Ú\è\í\ÑúĞÖ‡÷h­oHó-­ø\Ã-öwi`.ö\èhÿ N\ïÜ¡#m:\ÒS££#\Í:<Ñ©½šEö‡¢\ZéŒ«³#ª…\é6\\\íP7V)ŒŸ¶ ™\í\Ís¦%\ä°Oîª¨\\H°»P\á[K»`AlCI\Ø\×[\Íõ˜v‰?tq\â”vDT\Ú9\Ñ\Ü0pQu9A†@\Ø(Æ†Ç‘`1{“kª…¢ğ»`Å¬#jKl—…¿\Ë€9HTV.Œ—û>,8³ó¶Â‚°µ!9²kòŒ÷CŠüeòw&\å!l”#=…P®\Õ\íòŒÁB\Æx&¿–z=¤N>Ü†\Ùø\à<\Ûğ„›\ã»\0\rãŸ‹4[X\É&ğƒ\Â@y\ìpA \×PaºlngzH«j^›\ãõ*\Í\ÆjK\0@´±^“J•…ÿ\è†\Ù\Î>›\'|ÿ÷c?c;\ßnsD²«?h²ı~Zš\Ş#¬\Øu›5g‰:§\à#\å0e:¯\ß\ÎoRÀ\ïğ\æ¨/U/pX¯§Ö‹\ï\n¨·Ş£†hĞƒü•i¯_sC\æÿ\"š‰:³\é\æ\0\ÉA€8\ÙÑ˜­˜OòAb\çğ|«°\ÍRCB\ËuõZ®­\×Zs£!«gG†uiÏ¤.\í\Z\×\Ùñ1#_\ZÖ±\ZnpV?µ¿‚\İ=@‚I\Ù0\ë`w\\\ËsÍºtf§VÔª\Ö.\ç\Ä1e\Ë.‚\\\0DnÔ‡?#\×G\ån\Ãj&Ág8.\Øøºª\ä3ÿ‡\×ôõñXşö+k —V(~¯˜\Ä[TGĞ°B3Œ\í\Ï8¶&hC©Klùù\"\ØÖ•\"Á\æó\0W¾&‹\ÜG&ò›U€\ß\Ãû\å\0H\Ç\ï™T\ãÿ²,\r\Ã&.¾D„\ÕËW\Â\Ù\î1´“~ó‘Ğ‚€Ky€\Ë\ä\ÔF\Zr\Í\Ü\Û3m\ÂLh@\Ëñ4¬ğKµ¤k…\á|’o®%_|X®\ß\ç4\"8¾°\åz1\Ìg`4)v\ZSù›liu\Û£mü\×\"`\Ùj\0´–-“ÚŒ@˜\Æuç¶8ağ9\éIşJZ†ş›4¤\Ú\Ò2\Ï\ÏvÁ®.>«hsbRºÃ²ö›mSI1>+PIÊ¬5)®‚«‚\Z wV\çÁ‚…\ê\â\Ä\Ü\ÍÀB#0\ßhLó\ÃQ-%tpG V\"\ÅB\Î_÷÷„Gğv{ñ…û«ñq0dU\\\ÍI­¶6\ëPG“¶5;×—;`L\Øho63\í\êIiŠ€39Õ®\Ş*\í\Ä_n\Ñ\å1]9;©Á¯‚ü\Æ\ÅVò*\Ì\áÎ•”T„ë¶‚1\'Cik\np2¯ b\0,3\ßGø¢}\Ö\íl\èVdô´D\0o\Ìvµş\Î\"Ş«0‰üÆƒÚ™İ²\ÒV.\Şlš¨­Å\Ê\Ê\Ûó\ÓÁ„ü¸™…\éHıÀ˜n~\èl\î3pš_p\Z`š(¦\ÖÇ™VŠ_p£\åùHnM©A\í\æ\ßüœa\0§\ĞÂ†ùÀeòšIğ(„\î-qf…\0’Ÿ3ÃŸ\Ã\ãY¤a“\ä<»]f\à,w\êr&³&»9ÖŠo‰Ø»ùx_*\İ_D\nF\Z‹‹”WsFD8Y¬¸\r)µ‚ôû&Á\Ö)c!$ˆo\Ån\Ã\ãZs\Â\æ\ì:«Bó±\äötı7Û·9!&y·ôY\Äşc\Úm\â“ù\Ë46ó‚ö_k‰`*I\Ä\r\ÑõÀz\İ50![GU‘Sšhğk_o™\æ\ã\ÈoB‹#)­rV\ØZ«\Õ\â(\éI\Ş\ÕURX\ÇoQÁw­\àD¬Å¢4s¢õšdDƒÉ€†S1\rT\0ôª˜zkC\ê¼ıÕš\ÛQó\ÙGB\Ó\Ã\ÚXi×…>]Ù˜\Ğ\â\îZ¥ø\İ=Nš)U±\nù\ë\åó\ÔÅ‘`H„$\\Ò”»Íº›k‘X€‡¯ôB\Ê-„\0@o\à´M×‘ır\ÛFB\nPDóúñ0[Ğ©€8şŸch\í\ÛJ³e«L†ı\0”\Ç (\0ˆ\ßp™V€†\r²ród˜.ÿ}˜øÁ,Rv\ÌK\ä#½¥6•²+¨2\Ìgi“5˜úœ¤›k]\Î\ÖVe#0\\¥Z\ël±N¯Ÿ1^Ğ‡”q l\â¹\Õ\â2­\Ä\æ óX¯\É\n\0Ÿ\è\æ¶ˆ\' \Ìğ™\äõV£+/!¥H‚Š­QDR\Å\×l·™o„­œ(\Û8¡Œİ¶\ç\å)\ÍÀõ>\ß\ã+€pÒ»)Ñ°¡\Õ\nmóş÷¹ÿ+V®I\ÏTF)I\Ü\Å>\Úp\0´÷±-ƒ\Íüe\Z\ïï£\ábU\à«cEj%|u\Õø\0¡K=\Õn\ÕÈšx±\Ó78;lq­W9@³¶§VS-:º»Z+{µº³CCM0f…&ğa6|WÁo\âdbM’üVöo-q># !û±\áv\ÚÓ¥…\ÉJ\Í\ïJ\ê\àX•\æ\'ñ‘\ËMºpbXWN\ê\È|“\ê¬Z/—;\î—+`ó¯­\äU*kvY3)@. „¸a ô\0À²V\É\×\ZT»eo­<}\Õr\ÄR|aYW€A@>TÏ‚\'Ö‰\Ô^`C®–Œx{›[“\îÎ…€Jğ†)ü>ñ\çm¢3\Ù\Ì\\+¿\0<„%\Ş,˜#	\ÎÀfr 39(¶,E~Y’øŸyh\×S]&\æ\Û9£ø0K¿ >cˆL:3ñ€\ÙQ‚ \Ë\rù\0lF(1fX\Û;L—´e88\Ø&µ~\Û9nûÊz ³¼Ho)\05PZ\'Œ\Ép’3f‘‚¬‰Ô½\Ùø\å¨\Åû\ì\ïûœTN\'3,h2»õ\ËZ \r©9¾\Ï:d\0\ŞV›n¬\é0\'2m\Ï\áuY¶—Ó”\Ê%\'ß¶lcLÀN±²u\Ö\äñû\Åø1+Bùª\r¨‰“±%Y¢.Rpom—.Õ„‘c|\ïxO\0\Ó\Ò\Î\n­\î®\×ñ\İUÚ˜n\ÕúVœ\ÔÙƒ}:s`H\'¦úµ¾¿WG&ú5E@\éˆi¢¯†¬\ÓÌV?Ø¯3}:½Ø¡s¶š~‹à¹‰Jd;q¨C÷\èüñ~m¬vªµªğy~g½+\0«Ï¹\Åõ¤XRx‘I1\Ì\êAN\İ$rI1¾\Ô\Ï\Ó“\ëà¶‚4\àó4¥œ9Õ¹\Ö\Õd#KHk6ŸQÈ±,ŒsŒFˆ\É\0‹	v|Hˆ}€i­ù7ò€—¥^˜Ğ¼\Ãvø\Â,Bˆ-‘ae~\äl\Ø\Ã<C’ı>‹Şµq¹*\Ë\Ğr+4\ë`Tùa#V\Ü5öbG ú|$\ÅjMR\ëtÎ²‚/ş\ÏB…1` \Ë++Wz¹¥^!!¦fdY6U`f—Âš\Ö*U\æ\á‹\áË‘h\0˜^ø\0,\Ñ6õ ¡oµ¥:\0\Ó{&¯œL\Ö\Ïg3\ä,ù~_·Í¤Ù‚H ´\ë€\ĞJ56·d[.>\Úr–ºIÁ\ÙùœŒù€\Ôú\n\ßf{öû\ÎøpVfš‚\î¥øÎ•aûCÀ\"5Á6U\Å\ê¬)tş£­+Y\ns«­\Öşk$\ì\Ì%^\Æ\Ó\íJ\èøV\íH\0f~À\á…\Åa94ªók°d§–\Ç[´n\İ\Î{{tqu§nœ\Ôõ“;u\å\è€.-u\é\èlµ¦1\ãI­\Ïw\èÂ‘A]XÔ©µõ7¹U\ÆqqnCaù¨TQ\"ª\Â)¶>\é\Ì\ßğ¶\Ô\0Æ°r\ì9õVZ	\áC\ß+\ï¶Ñ8Áƒ\ĞIÚµ^\Ê\ÜX\0–*\ÙÍ±ñu‚gv\Âz,ı\0‘\ã\ÛÙ€Mî²¥\í\ÒK­\Ğ\Ã\Â\Ö\\’‡¢m\É\"\Íe[‘Ù˜\Ï\0h·	9pöcga\âM†s`ûŸ\è\01¼•‚¢­Ë¹¤–Ôƒÿ³t¾¥\\€•\Çó¬\Ï\Î\æu\ä”\"½€\Ä:œmòùA\ë:±şœ\0›…$6›\äla$\É\Î\Ã\ßeû¼œr?\à3\0ZA\Ú\Z\0Ò›sxM¶\ĞaÀ\0Š/4Z\í\Í–KgK3‰6¦\ãû¼·\Ù\Í¨Ö´Àc\Ûs¬q\Õ4›€Û²2”óe{6\Ñ\Î\n[¤\ÆL\ë¶.4\Ü\ê³6­d<•ˆ\âg“‘\nlH\Ğ\\\áR{m!Î«\î\nBI…[Uø\ß^TcWS¹&;BN9f648\ç\r\ÄN\ç\Ï\Í÷\ê\è¾>-\ì\é\Ğ\áYÀ´8¦\ãûzuvqH\çWg¯³®ó\Æ\\\\­ƒ\ã)­\Ì\Õ\è\âZ¿\Î.Ãª„±N·‚xo[€\É\ZD‹+“r§\Â0\0$pC\"Åµ	y\0`c/—\ÂJ@­Ûº—-`\àñ\\0¢\r§fÛ±\ä\ä7%+Š†T€c\Z€\Üg#\\©r\å\Úp„dc\ê\Å\âD¶i´\ÖBW\0Y\Ùø»2eAX[l\Ä\ÃÀe\à\Ë\Ì\Ù\ÊY÷³„Ç–‘÷&Û¼\àvgñ¡hkœ”R\ĞúükR*n$ùX›=´›\ÏœÏ¥u”X]©\Ğ\0\àœ	>\0&\ÏØ\Ìr\Æ\à?6g 9%€l|V1¯3ö\ËCj\rh›]\Ê\Ügl]\Êqo. \Îw@\ËûÃš[	E\Û-ˆ \Íi&¿\Åø3Ro:>\Í\ZU\Óñu6w\ÄÀbü•\ÌmNSÁVX\İ›Iq~¾Ã‚¶L¯µ\Şou˜\Ó\ZL>x- s–u+ÀÂŒ°¬­5“i…i\Û\0´­š\çG­2\0\Æ\Üjxü.\íHZ>¹l\Æ\Ö\â‡c^\Ø\Ñ\ïŒPLÀˆ{j´@Y™l\Ğ*pqw³\Öôj\ÅV²Ÿ\ì\Ò\Òn@6Ù¦\ãû;e+€«\ã9•Z\Z¯\×üD¦Æ•}õ0^‡N¯´\ê\Ø,	¸Û¯P _nc>[Í‚°Qbr[@¹l¸4ø’Îˆ„…ò¦jù 0pUóxSR.ö±ÀV)t™0–5†X3o6,–KzÎ‹Â¨1¢p‚ˆ6\Çûs\í\Øø9&(ƒ³xTIò\èùl›Naõ@“\ã-&½\Öt¦LŒ\r¯eÁˆ™\Üv@È–(}$\ÜHF´‹3\ÃYN£\ÜùÅ¶‹\Z¡\\«\ãY\r\Ğ\æm\äÁd6(m\Ó+3ml˜M\ê\É\ã\ÌI\çŒLrp	\r6=‹tk_07\èw‚H\Z¾\Ğa:Àl\á\Ã\ä\Ú\étn^/?BBb\Î(+Ùœ8\ì¬J\'Pm\ç\ÛĞšù@+­¼o\ÅhdzRjµ=K¹¾÷ønL¬fh’l’½g¯±\ÇM¢M3\Ìÿ@L\ê3aJ[a\Ë\Zl\Z[m!m\å³*\å\íŞ§–\ĞÑ„*´U•«³¶L\İu$c¦\ãz ¬\n),Tm¢D\íUn\0\Ä\Ñ6¿¦ğY»Û’\Ú7Ú ƒ£•H*@\ï\Òüx€k\Õ\á\é\ço¦¬¯4=\Ôg]\ÕAÍWh}©S\'\×Zud¦F£½^…B\ÅrG­Ä‚\ï«t56\Íf°6<õ)gNo’\\Œôz›	mur’\ÜdHY¶R„\Õu­2À7–\Û½•\×`1\Ş7\ÇTÀZ\Å\Ìš €·\áL³\Ç÷¥—À€Qa\ÌFE Àh ´®¨-V\Ë2\Ù\Í\ÈŞ®t6+LgsŸŸÓ¬H\ÍA,\å‹D»\0_KL\å­\Ö\ãô<\n+Ø‰\n\Ì\'tk]Î¹\ìP\Èw˜\Éú\ë‚H,\Ş ³Ô¼)8“\ç¤EğP6\ÏÀd[=/es€smü\Õ\Çkm\":_6yu\ä\ÚÀg\Ãrö˜õ\é!‹V\Ö1€gÂ„i€c;f©\Ø: ·\ÆmE\È*ûn	Ø¶t$\Ú6K¾\ï¥:\ë}……«ı\èœ\çò>ÆŠ/PP+\é¤\0‹-\r9lh Ì‚-3ñ…6Dg\ì˜\Å\ëò\0b\æ®E\r\ê+K\ÕlM\0u~õr\Âö7—©·¹\\}\Í~u7\éb%©ˆ¯@5„·F~Ó¾†ú\"\êo‹8\"š¬Ö¾\áô&5\Ö×Œõñ\rU;=~\İM–‚\ßD­N,w\ê\Ôj·Vgkñ|~\ËóTPŒ \nmdIõ\ÔÒ¢*c\è®5\0†•I )6@\Âx¥µX« a\Â\'Ú AA8@¨D~M°I6Vo\0\ÌOÀxVÏ³K0•Ú´Y\ÙF:¶¬1\ÄcÒ›^L†°’\Ş\Òj¼9A¿¦$„\är–\ç\06c¼“[\Ø/—=‰\Ê\ÌyO¹\ÅéŠ¶U(\Ğ•¿1¬²&Ÿ¼\ĞxIÊº\'\0œu8$l\0\Z\0ZÇ‹Mò	p\Ö\0–\Ì\0Hl±Ÿb¸­õ’\æ:‘i‹F20¦N™o‘\Ëm›÷a.crÖ¥;_†\ç#\Ã6k@0Z½\Ğ:™³ğˆ6bË§eBŒ¥\Ò\0Z†±•\Ó\rm)\Ø\æu\0cE®%s³½•\ï¼\ëa tŠ\Ğ\\wR0›\Ğ!!\ÃVS0?™–oµFŞ§Ø–õà¬†i\ÓM\r\Ü\Î\á3<E\éª\ælN!»0^Š1\Ğ\Ñ(\ÛHsP\Ãa¶ˆ†[B€1ğÊ\Ê\"E‘¥T¼D•\É25T\Õ\Û¨öO•)µ\âÛ‹Ok©N¨¹:¢Î˜\Î¼%’ğZ·,¶òş\0mÿP¤\â„1›±M\nª›ch.6\ÚQ\Äû”\âı\\µQ§\×Ò•\ØHğ´Vª¼±\Â™\Õôra­¼p\ĞQ.\ÎP«ùy\0˜—€ù`J«|Xß¦3’eKÛ±‚DlJk.\'kŒg\Í\'EÉ€³ÀhFi6X ˜ò™[L6¬\ë\Å\nĞ–~-õZñ9m;\Ò\ì‚\Ål8Æ–\\ğD7_¦¸\Ò\Ú\ë=è¹P³·šR1¡™U‡5v²C¹\\\æ ­‘€Ï€!\ÍOXe<³6\áÇ²!\rX™\æùVÓ³L:	\Ù\Z2]\à\æ\Ùe\à\ä3\0¡½Ošu¨ÀP™€w{‰±\à&ø¬Õ¤\Õd\Õ¤3G¯û\ëm%h¼g].Ü¶¥Û¶›´1cdvş\ÏÀgrk¶\É2\ìã¥›DötŒ\Êû93\æ¬Fh\rv\Ø\\i\î¦füPwƒOƒM\r¡6&»«½R;\í²+¦±®ò\Õx»u0U•(U\æ4\0¥\Â>¥8\Èqüb\"R®0^®‚\àPÁ	\İ\ÙÕ\Ñ\Z!ˆ\\86ª3GºtöXö\îL©>˜°@\æÃŠ+±Jõ!@—€\é\0!lÂ¥\ÕØ¯1\Ée\Ä\é\İs!£–€KšRHq¥ò\âVZ±d‹\ÊEƒ¨\Ç\Å\Êh6lŠtšl\ç\á+	4y•<\Ç\æwÃ¸¶²l\İf+:\ët\çó›ğ[X3B~<\àŒZY5£?XœŒj‹\Íd8\ÆË€&t\Â\È6g4\Äo³›Z’*!%\ÙX_!g!¾\ÄŞ3\Ü\Æv\í\Ë\æ\Ç@<\Ñ<›3\Çií±°\0\Í\Z%[Ç‹õı95;¤Ö¼“­˜5\çz¹mµ?k³‚ú\í±tvÒ–\ÇHG~3\ìu€+\İ\n<\î¼\×-\Æ\Ûú1\ïšt\è>û\Ó\\€\É\ZH¤•^,\Õn\ÏE°#\Ï\ÙX­6¸)¿V¬\Şs\ØÏ©n2\Şû6BB\È\Ø-±R\rh\Åk@j…h“s›¼n“–²\ì`Ë°¾B<O6?rÉ¯‚\Õ]Wo}X#-€V¡ñ\n\í\ê%xôØ°YB;ûR\ÚÕ—\ĞDR»û+5\ÚoChQ\rğúZ‚ª\ç·n®õ«Ğt\'4»«N§Vzui½WW7v\é\Êú°.œ\ÔI\08ˆd\'8aÍ¥P©:BD}D¥\ÆlxÀ\0X‚\ç+tÅµ0am\Øi<(­«”†´n\è\"X±”cme5g Á*!Ò­U58®\ÖÉ\Å\ç°²	Wy°X¾¯¿˜\Ås²¬‡’¥{ó7G¨ø}l!xkvµ\nI&rlıù\É0\Ñû{¶¾?z\ËÈ‚³\äœt\åó#G¬\"\Şb3Ş£€3ªIÍ@\Ç\æùHCV÷\É\'ùe‘jÌ¸ZR²™mx¾Œ)ˆ¶0bC2™6~kÀÁO{¥.›i_\ÎZ 6*\Ö6v\ÚÀ™é½,hJ2‘ğ,.\r€9È³yM\ë|yL/qÁ¤€\Ôñ\æ×Š\àa\ì÷¾y;\Ø\ĞñqÆŠ<ÿ=\ë´µc\Ìû9\Í<p½Cn\ãù\Æ|v\Û:«\íı\ß\ç\Ò\Ş\ë=s¼!›~8Ë³¾d\\g[H\İ\ÖM\ä~¿7Wm•^õğ\Û\r¶G[\ÆÃš$8LõUhğM\ÖhOL{‡bx¹F\ÙK\ÒER/õkc±_Ç–;tb¥K§W»tq­G7\r\è\Æ\é	\İ8¿C7N\êò\éa]\çöüTƒ3\ã®\Ìşª‚\Ğá®9¥;nn€Xb\á£6\îø>W[}\r@´E…\0BsL\Å0_1€p\×\Ô\È\ÓXíŒˆ\äq,óŒI·¹¶x\0Á/Ï†Km !\áÿòP@c7ÿµiC¥v¦a¹Œ²ùÌ£–p9Î”[T´\ßÆ©f\"µ\éF2\Ø\0cZ\î{\Î}®X¡\Â]q¹8cJlb1_\Ì*\ßF½\ï‹b$9ò\0 \Óh\n=\ç\ãr¬ i\0\éN/„\ÜÚ‡r&Yq\Ú\Z2ğ<\Ûù±¬\é3Ê¶†SkÁwBœFĞ°ùÀ™\Övï°Iw¹S\'\Ìğq¶ñ\ãdó~™\0p[ŒX\ÂÁ/÷9l‰5‹m»\Ë\Ø\Ñj{V†1¶²$L8±²‹õ\Âöó&c¶­\0m›3l^\Ñ6ó†6\Ñ\É\0h`Ü”s›e\ç”i\ìù6k®„\ïa­ûüğ¹HO¶…(\ì†ı)v<’§N‚Â^\Òm/€&DôGt` Jû¬at¸ZGªµ<\Õ\èzuq¹Wg\"©Cºx¸O\ç÷\ê2wõÄˆ®\Zs\Ö\ï»{\î€îœŸÕ­ûâ´®İ©­Q%†\Ç\Ö\ì©DNa:/,\ç©	© 6\ä4†º”Æ€MU„’8\Ì\ÈqmŒ\ãM¦I\Ê5>gB’µ\ã\ç¢n9(—M•\È	Z›Ü—¡{Uh\Å)k³‡Œ¬\æ	\åX0±2\Z\Ç\Ó\0hú\Óğ\ÊöOT9„Xk¿²jB–¯ˆb\æU±º\0¦!µi\0.;s»³\ê\èöœ¯pVg(‚G	`˜-¢b ‹+@²M0²\å\Ôğ\0öG.ö\áÎ˜Ÿ­r€\'sü;›‚z\Íú¬¨lh© \áa,tX/_ºŸ³û\æ€³ˆ\î\Ævf`\ÓLÎ¸/İ®#\Ç$\Ü,kP\à½L’­s\Ú~\êy\Ïf³\ãl/ ¦Y(q†\Ïòµ•tj­XÎŠ¨vò\ØVX\ÌBˆ\ÕñŒV¶†­§.\Èõ\Í-‡÷6)\æ>cD€—fsƒ¹4‰¶FKÎ–‚\ÍûY‘6Ï‹\í`óñ=9ìƒ‡¤ß˜òh‡%\Ú\áZ¼[…ftıš­\Óòx»\Ö\'`·ó«º|tL!­;tı\Ä0€³Qºyj\\w.\ì\ÓÃ‹3z|uNw/\ÂKt\íü^Í×ª6iÿ\Ùla¢Ô©Íº\ßg\İ)Q€E\â\Å–4\0À†\n\Øò\Øf@‰\Êe\r¨µAÀˆ4c³l=Ç³\è`5ƒŠq\ì\nğƒE‘Š\"Z³©1\Ç\İ\ÖUÌ†$l>u6\'¾M\ä²Nu#gd\ã\Í1\È\çxZ‹Vdf\íù[¢„P,G\Ã	…«ù‹·:\Æ_\ãU¬³Ze­| ±\İtZ«­\ä\ÂE1‘\Äs›\çQ\0=;“Šø¬¯¯9\Íœ\á8k¹²\0b2¼V&³\Â\Ùô\Êt+L›\×3@ZA¿f%\Z›÷›fLhÁÃš¬t\ã\æ¹0­\Í1\0\Ú<,Àš\É˜\ÆcN¹I\Ş\Î{l‡	-\Õn\Ö\î\0§M³\Ä3\Z\Ã9mZBraBÒ¿\Ë\î·!»­ü\Îf¾\Ğ\0h©\Ù\ä\ÚaA¢1$·y/g¼•c8»­c\ÇR¿%ú<ş‰\Íşy »\Ş\ï”TŒ¶\0˜JÍ\Õ\é\ĞXƒN\è\Ó\Åõ:¿1¤«\Ç\'u\í\Æñq]„·OM\éıq\Í\Å}€oJ®\ì×“+õ\í\Û\í\Ë3:‰LT—\ËGx±q\Ş+6\Ã|\Å\0Ï…_wjµ\æ\í\êZ”\ÌUÀx<î®²B4\á\ÏW;‘¼óªu²XUr,ñ\Z±\à\r{N³†c›Tf+[dV3½(\Ç\Çf)\Z\0!8^o\İ/9\Ût˜1[VdF@\ËMÀ\åù\ZM\ÍT©¶Ã«2¾\Ú:\"j\ÛY¥†\İõ\n´U\ÖÂ[-)\êp›U\î|AaÈŒ§„\ë\Ù`4\Ï)‚¦­Jn’\ì\ÌûµõV\"›\ÏV\Ø4³Ê™\Â\Ê,ó±\ÓBÌ¿X,`\ÚôK\ëp±\ÉF™^’ğ—2œ\Íõ[\ÉfA:\Û[FX±P‘@Mš9óˆü\Ö˜ 3lyµ\ÂM\0\Úº4\Ş\ÛZ³Œ\É,õ¦9’\nĞŒ%\Í+,{®µñÿ¯\ètVó˜µ\æo\ãµ[y]&Ò¿=§Ù%\r™\ë\æwñb9°\æ\ì\ï-*8P#øÀ}\ÃI-\ïl\Ö\ê®j­O· ³£ºzrB\×\ìÿ<6v\ë\ê\ê\æ\åõ“{\ÚYİ»8¯‡—÷\ë‘-~cA®\Ï\ëÁ•%İ¿º¬+§§4ÑRUrs\\J’&µVNAµ„U²\0¾Îº]\Ì&`¾/;—öù¸\nª\í1ÀZ‰§3Ÿg!\Âñ\ë_J/\Ç2›÷\Î1\à™\Ò\Î<Ò¬­lf\ÃmyX+g¼¯}\ïL”ÀYkb\ãü†‹blš­³k‹\×[O\0Á*?AH\Å\ão™[Škz.¡šf€T˜¥²`j†ÃŠ’È¼Í¶¸œù€®\È\Ğ\ìÔ†xq\Æ\ã\Ò\Ñ&—\Ûsœ¹œ5V;\ÊŒ\Î\ä\"\ÍjwV>±ô“ec†ö%­c·m°ÿK¹\Í*5	p&³Ö‰LÈ€Â·#¯\Û`\É\í\ìp–:7`9RMÜ·E*³ˆö6J\âµ÷ƒ1İ€)\È@-(X§‹ó€™0¤I´µ\é;\Ã\Ê.&»+½8¾Î€ˆ¬:‹Y9\Ç<¤ùAª\r\çY²vÒµ­	,€\ÎY‹\ÆFN¶#Ù°e¦™o<Ÿ$o\Åyû\åVŒ÷\îÁ˜\ïmÕ™¹>]YÙ¡k\'`»I\İ:5­\'Ş‰º±¾\îù\èÁ\Å9=¼:£—\à\å‡ı^9 «‘Ş\rªC\Æ\\\Ì\"\ÅM*µRJ‘­L»¥\0]…\Õş*UT—‡‹\ÙJk¸\ßR0òkmS\Æd96uÂŠûH¥MOµ~\ÍlngÁ¬…±\äŒVšlqÀ‰¬š´\á´t‚Gzy\äÀ±¶\ãV„JB2P5g\Ù=p’aS{Q¯\ÙFRd€ŒüLmq\Ã\rÈ¬?š%—;K±ZŸj\'R\Îlw[>«¼9ŒV\Ûº\Ñ\Ë\ÍG\Ãm~g\Ûyv\ÆIÂ°›M6²ô\äôÿÙ\r\Ş`s\Å\ÛøpZ<dNÔ¨@˜‰8›g\0\ÄAË†Åœ?“1Y†!·±Ÿ\ä³/šn	À\ÙkM\n%v9\à&ƒÛ\ä\Ìm\n\ÂZË”ó/J€2“³\Ô\Şc»-:nõ>“a“T+³ğ>€a=\ç0Ú¼ö\ÉFZ”[	0ö\Ş\Îjü_¾\æı¬}%  3‹Š‘a\ä˜Z\0\ÃG\ÂEšˆ\ëøb—.\Çç˜ÒµõI]±\ÕQ\è¦H¶“ºyfŸn\Ù\ß6°=8·W÷/\í‡õf\àƒz|iYw¯\Ì\ê\èl¯Zj\Ë\äK\0º\nóx\æ\çB*¬!LpK¬£°¹a‚@³\Ñcºz$º¹ErH®9fŸ°TN\Ó0ªfC©NÛœ)›%^0X—9F:\Ö\Êeò\Ëñ\Ë\æµ\ÙÃ¬\0rmMX¤4›³ş\Ïi6\æ}lnO&Šf‹À[	\'?\àSº+Ë™f»%3k«\Ê\Ëò¨\ÈU(Z ª¡J%0\Ëş\n•ñ…\Ê\Z8“ª\0`3úµñ>v³\Ï\å\ìËñ†DbĞµİ¶º‘µ\ê˜a\åÊ³\"´\Ïo1Ş˜\Ô\0V\Ï\Ï\à\Ì\Íñ ¥¶¾KšĞ¾ˆ\Ù\è\ÂV˜/`Yñ\×Æ\Ó\0¢-\ÅaõBó‡V»³ aE\ë“p!Û¥\çOkL^‘\Ót\ël\áı\Ì¦9‰ s\Ø\nøH€dL\çxC»\Ø\Ì#\"\ÇÀt«2“\àmV\Ğ\æv\Z_	/ö:\ë\Äq\ÂJz¦\ŞOÛ¬!fò>\æ­6WŒ7\èL\èøB‡S@¾‰×»¶6ğ¬µ\n\àÁ‚w\Ï\0¼³ø»\Ó{\à”\î“x\\€/™O\êÁù…9š\"\n’vK`½[ò¢&ğc9ótÅ¶h…Ñ!@µYj6,gCkX l|^¬f%#\\¶\Íñ_I\ÈJk&·€Ô\àòc¨X\Êd\Ø\ïxA#‘<c3³Så…›ß\ãck\êd¹9¶\Ø/«¦r™€hò³€hM¾…û-\é™\ï+3›\àÁ\æI¸U9öT\Êo\ËlU—©\Ô&œÛ¢B\Ö\ße½^\0§ˆ,ğ[JâŒ°Hn\Ş!8¥M\Í4j\ÎCb†\ä\×Yü6´¹¾9œU\"\é™acEÀ\n˜l‚\ífZ¡ikXµ\Ëlvt«\Í\É5–#\Òo\Ç\ÃY7Jf)2]\n{\"±¶Jş6+»\Ø8r)Y\rŠš8\Óy½Í¼(·\Õ\è¬eaÄ¤\ÂXD\ê·ÁV\Îr\æÿ\Ø\Ôv\İ	%\Îm“f$\Øñ‰\æÙŒ5M¾øö|6,\Ìû\Öu½É‚[3\0~R\ÛZ3mq8¤XMD&jur¹O—O\è2^\ï:`»~f®İ¥[°\àÍ“°\ãñA\İ9µ \ÎD\ê\Ö\Ù‡O\ÑHKH‘”W@\æ0\à²a´\"+·\à\é¬^›,²rL\àƒ!m\Ø\Ë\È!\Ó|¹Ë€\0¬‹%/h¡# \ìØ Xx¿\\XÑ”\Ê|‘%Yóø¹ö®\ÛñË±\×[\ÚtBb¿ÿvWS\ËqƒBa!Œ™0s|6;¼\0F;ñ9@q«fnSffš3)\Õ_¥\è*…º*€®:RU=_\ÃYG\Ï\í_+ñ6\É\Äd¶\È&“³\Ãy\Ügntœ—2Z&5Ù™a\Ş\ß--µa”ng–\Õ\rí¬³©—\æ	³\rÁm\Ö!mCj\Ötj\Å)sp¶l-²Ngd\0¦»K\0Yxk\à\0h\Î0¹6Oi\àt–\Õ@j‹›…\0¸\İ\Êx\Ì\\‚q[		šÄ¼÷·NGv–÷µ\ÃYk\×V¤Ãš\Zœ5ñƒi¹V\È\Îr¶\Í\Îcşğ\ÚÀ\Îú„V\Ö1d³qfëœ¶\å\ár	Q.|Y}g\\ó\Ó5:½j£\ãHñ¤÷\0 \Ü\ï0\áµSºº1A\nFŠO\ï\ÓM¤úö\ÆA]<2¢ñ\îj¥H‘ö\ß*X¯ÀYÑ¹\ÈüŸõ÷\ám^‡‚J6Øª À`½,8“ß½À˜u¨\Ãb6ºÁ\ã\Ùl\ÖÏ—cıš\ÆRF\"N\Ç·¦„`¬\ê\êYË–³”\n$\â,mg\Äa„\à,•b5\\¬x°%ø¬#\ÆJp¶üG:\Ç~‡<[†™\×o\É\ÈxO9\ï+ˆ|¦v4*2’’¯%\"¯­\é\áôŒyä©´±Âˆó7\nY8\0—“’ğÁb$^óN¸H²£¤2gvtXgk\î+\Úaÿ†\ä\Ğ6\à\Ëp¤“P‚¦ñmi&³–Tñ{\é\È\èûœÛ‹‘³‚Ç‹¥Y?\r«9Q\ÌL\ç‹\ç9A\ÇFNÒÿ=is\\\×uEQe‘@£‡7ô<` \01‘\0(‰¢¢h°T²e\Ée;\å²\ÙœŠ\ã!¶[©T*q\\ù\å7k\í\å\Ã+\0\î~\Ã\İwŸ}†{®™\0h.r€V¯ùYwÕ´¤«\Û\0\'f ZÀ\0GzofJüş° €ğ‚ó«‰5,\è4\×:6]P\ìôcº¨bƒŞ²\à`8L÷ƒ\İ.ˆš®ñà½›\ëò\á\'w\å\×_½.ù\×\Ï\0\ág\å¾ùløeùfX\ïö¯8!û·,\Å)ù/~ÿ?~^¾üü¶¼uó([\Ë¼|‘T\Û\ZvM·\Øbj\ï®1³0\ã`µŠ\n\Ç ½Ÿ”pÍZ2{	\n\ÆH€\ZNKe³ cœ\Ò@\0\Æ\Ó\éP^\Íp,Ÿ\äÓ½Bı¨–@l¥Œ‡;Â‚ö\Ñ~‹.\î‹\ï0C\ã7ûu÷ùbl\Ö\Ò.¥›¹ü-Sn“½Q¹úôe9ûørúİ·\Ë\Ó\×\æ}¯™Q\è½‡\å\à\Å~Ycÿ\í(•^ˆ\Ê’\ä‹M\Ï\ÌÎ» ¤}A¤\ël¹€÷#ã¹²\ÍYbi•	\é)7\Ü\"D\Íÿ\êdd\áy=[i&Œn\ĞcUÜ·0\Znlõ	ˆzÀ\È:=MœŒ†,¨\rZ?†a\Ş\á	\r\0ö»²$\rh\î¶q)(\à·È¡Â‰\ÑÁ©ğ´+\ÈÿuP4\Íz\Ï#Ïµ€EW\02\Ñ\\L¦ó\"c\Ík~˜&\ÜIQx}¾ı\Ø\n>õ\ä¼<:;/G\×h4¬‡á’?8)¿ı\å‡\åß­`şú\Ç\åqLşöõ\Ï\Êı% û¢ü\çŸ>/\ßüñû\å/ÿôiù\Ùn\ÊË»“r\ÄD?¸¹\Â\ì>g\\®¼\Û+4\à¦XSû\0\âxhZk\ÆÀÀö4x¸\Ó0\Ï9cc…ó3\ÆJ>h§Œ™À4ZÑ…\Ô\ìÓ£\\r\İcXw\Ê1\Ó	‘ù§¦)Î‡)T«_\Ñ`=\ç\ê\â+·½\î»Õ…UNñœ\àh«\Ë\Ù;OÊ‹Ÿ¼]Î¿{‹óq“\è–o3S\Õ\é\çfú\r¤›\íÀQ[\ç\Ç\r\Ú\Ü\Ñt@TH\ÓùrK³=\\`1\à\é@ª·%åŸ ³\ÖÓVHEV²t‹Á³\Ñø™4dF\Ù\áT\ÆI?€ñ­‰´\ÓÁ&®@\æˆ\rD7\Ü\Ø\è\Ğ\à\éˆTh»Ê²y\Ìgmóš4¼Rs\Ñ	œ\Ùvˆ©¢7k?³\Ä\ìk–ùŒfz„iN‡T¼\àtZˆşƒ\r\Ã\0D¯1\İYõ\Ü\æµ6ù·ûzñ\Ş{\å\èùU9\Ä|\îñly¶?Bòü\î¯\Ë7¿	ÿC€÷‡¾\Ïøùyù3óW_¼*o\İf¯½=«V®u0°P²\Zofœğ-Ÿ\"ˆf\Éú~\Êöf£,51`C\Ğ¦›¢ù\æ§\0P@Zn¬v\ï>;\Å|\ê\å\Æ\é<¤ø\0c00Q\æó|??-Ñ² $-T\Ğ\Ò:¢z®¥\Í?/a_HGw\Ê\ën»«Î´z\İr¼­\å\á¤\Üü\è¦\\ş\àuyòñU9¶\Ñ\Ì+<+\\÷½›C@Èósy\É_¢\åÒ¯\Ğğ0¬t1«a¹•Qòh\Ã+€\ÉIlµ\Ñ!LN\Èı2Ki\ÛY—‰©6—h¢H~\Ä sÁş=€uF°‹\å„<p”\ìPŸ@°Áe©_c\Ş|,\nó·j˜\éUÀµ\ßiJ\ãR€\ÙÏ¨EtgE3\Ô5\Å.HµM*p\Ô0‚À~ñ\Z\0^s\ïõ¨\ã†j\Ã\0P]h¤º›†cø»¸\ÓC&\Ù—c’˜V\Î`–/Ş¼)¯¾÷^9}\ëyyrq\Îû6\åõ«\Ï_•?üò£ò\çù¢ü÷›\ß~Vü^ùÓ¯?-¿À)|\Åó?A\ê,8‰½\ë3Xm\çjD¤\Ó\n0¯\æŒ\Ï\Î‚ğ´R75˜\ÒÇª•”\ê2Fö\ï\éúóğ“	\ìsœÊ…ñ\Ü>\'\Épşdº`Àñ¥z_ aK;‰)›\ÜyŞ²¥†dÅµ\éœ\Ø\ál€Ø€“©…È¼Ï”iÁl]úN¹ú\éû\å\ì{·\å\ì}ô\ß˜\Ş\×\Çeeûú€›=,G.\Õcf\éR/õ„1\É\09;µÎŸ?ùÜ¼á•´Şš¹`»f*\ÅMº‘ò~\Ø\Ñ.¨‚\ÒoRr¦\Ò<Œ;;˜I¶S³²Y\Ûm]H„©Sôkö¦®\ÛEc\ÍÑ†Ü°Àó }\à–q\é	K´*£ƒ0\ÚCt—|6Hƒ	 B«Œd^\àh\ÇT\Õ\Èx20ÀÓ”š?¶ µQ\âø]\î;\ÇdŠ¦+«\Î79DW=\åYp	\ç\ä~ì®°\Çó8TC\'´3K\Ï\ë»wŸ—¯ş\áºü\æ\ç\ï—\ßÿ\ê\Óòõ?Rşğ«\ï–/ø\Ş<\0|˜3$†\íM\ÌB,y\ÎK\0·B›Í\Éñ¼³şš{³Á{+Ht\ne=@’*\"\Æ\îù™ P\Z\ãu\Ğ>\ã¸i\ÉfÈ«¬b¼×€z¼²^şó\Í-F•-eA˜\Ş=—ÑÍ„0©Œ	Î‘l+Lzš‰r\Î\nG4		“<;‰¥\Ò¿ó\Å{x¾\Ï\ËÅ‡7\åôı·\Ë\Ñ+\0ˆx\\\İ”ı«G\0p¯\ìßš¿Ãƒ\ÃY1n³¥ n\İg\Í0³d8\'—³\0Õ…,sô¬`¥Ö½ß˜\×xa\æ‹1…]õZ\Ì\Ü/š\ÏJ\àÈ€)XO\0\Û }]úzè¢¢^=Š™Œ	g\0²Å—AN@XY¸€—;À\Ç=„=‡ƒ¤7h‘¥¦G=\èúbõ£İ¶ŒVª5¹kÌ¬\â\Z\çÅ…ï®ˆ³ªZ@û½\ïI\0:\0\Ä439L!\ÊÈ†:†¦deXpÌµ¸Œ´\Ú\0r™¬K\æ\ç\Ş8\Îİ‡ß•_ı\ä­ò»¯>-¿ı\Å\Ç8o–n\ËŒ±€‘lgk\Û{\ê¬\Ğ\Û\Ós@(\í$6F¾L”08zøÎ„7ò \ÕÁZ,\à®\æ\èˆÁ)’\Ö\ïD¿ª9z°Ur\İ3Ÿ$\Ó{\ÒûU~©õùÖ‚s^›Wÿ\é\Ì!\"\ë->˜š%9B†À‚>/·É•©\'§˜\à[Ï®\Ê\å‡n­tQ-`ÔGğZtºF÷^rQWû\ÙûOGBc\ÅI\\\àœm`Ÿ$«½1t‚Akc†\ŞL·\ç,Ç‘}8\â9+La5\ß#c}S˜\Çˆ\Ô\Ì\à:ğ‡˜¾)\æAMKµ\Z\æIQ\0¦\ï~ñ¸«üÎ„˜µ5\ÄIaUk‚8ªm\Ê\ÃÌŸ¨}˜$­³\ØbXC?<<ƒ\Ü5,Xñ^(V0§v\rƒùğ,+J\é?\ï‰\ÃbN\'¤¯\Ó\á/\Î+»\Ê	m\èlr]\Ü=EhCSz\È\r	½|Z~úÙ«ò\ëŸ\\~öÙ›\å\ïoO\Ê šs½VSı\Öl.ù>ŒtCoNy\æú\Ê\ãrx \0\Îgb¨&P\İ\ë\ÂqW$ºU\"Z!\Øn\Ég”O²œ\ì\æš\á\æ’\çŠÉ`\İ\æz»\Ğñ\æš\ì<\ë\ì­,ğ\rµi†[n\Ø\Íu\â´¡…-\Ï\Ñ\ÆN£i“EIó$(\0\àõ\'8¿,\çŸÜ–\'÷¬½{	¾(›—°\à\r€{ñ¨,ot›¡|Á÷ö{®\Ä5.x\É\Í_ó·³\ëœ¦\Ù€)H˜\Î ;$\ÄË…¡õ†¡×†xÁ\Ñ~¦\É\à\Ä÷:0:\\•İùÚº<õ\ËvU—L\ãB¢~m‡Ì²…§aœiº9fº\è\n€\Êf¤õp­\Ğpy`\è\Ìz\ãbù\ÌhÑ«U\Õ)·h–ğ[S˜W½cô¡€\×)\É\ßü/+ğ²˜½er’©ù\Ì¶¿g&E\Ê\Ğ`‡\é>\Ï\åŒ(ˆ5\ßö¤±¤\ß8\é»½Y¾øğª¼Â±xŠyr¿eK»Ô¬¦2\çO˜\Ğ<_—¸\Ê.k§^ú\èÈ€a<À¥\Ì`¦DŠ×´“\Ø^ñ°qMŒ—fvŒG\0ª\é´\n\0\Ì1K¨\Å\ço\Æ\ÅZLÿ\ÔZ×…\Øj£q’q­L\0S¯®Œ[@RC\Í÷¸‚0šY‡‘\ç:ó~ğ¶[˜w\ëüƒ»ò\ï÷\ì#ôŸ+\áS˜x^öa¾\rfvz·*+2\Ãx+^[£	\'\Ì/ Û«\nB.®†¶[¼¥æŠ›\æ÷¹”~ª\Ë\ÍEÃŠ†x\Òz‹pRW¾­fÛf ¿XU\\a‡›M\éÙ©jwPm*9\îZ¬¾5\"´nW\Ø \0ºE¦\å\Ó\×\ß\ãÆ‡¼×­4;Æ»õø`\èĞˆ80\Ì\è\r\ß0\â\ÂhC( vÙ¨G2-›ûÌ‰\Z\Ğ<²Y4£k\"lC4f’Á\Ü\×+•¹Xk¸dò\Ì\0ºN\n“mŸ;\æ>ö\0fr`A§ıôx–|—\Ú5šğvšr\İFøŸ\0Ÿ±š{¬\ä\Ñ\"<+rø¿9^I\Ãeş;ö\çÿjA\0­GkF\ËR«xÃ†\Ö\0\ÛX½0uH\â`\âü¸¤k­Â¹yf	¡6\ïw\Â\ß\Ær\í51†FŒ…Zq“6\Õ$s\Í.Rr\Òl]|ğ¼œ|x™\İ\r÷_=.‡–\î\Ü\Âv7F¼5¥\è?\ë\0™=K„¥\Ûiif\Õ\"^ \'\ÕP#¸Í–\Úa\âlò¸x=\æˆYµˆ\Åsf@\Ò\Ü\à±h½QE¬`\Ñ\Ä1û\Ë\í\Îe»\×+=Xõ“\Ş\Úòšıû\Z<`{ó\Æ¶†vlX©Gk\ï@»&$\ZÌ½\Õ\Ø^ƒšG\Ú2˜-\ä OÀ\È0\"f±¶€6†§\Å}\é/4T£\Çh”\rÃ…\ZĞ€3L\È,7$£÷­\ÅL\Í%lh\Ì1‘\0l‹&­\æ€67\"]¶[\ÏÒ›\Ñ\Ê\ê\ÖĞ…ƒ\Ê\äT§Ìªi3®\í\ç\ÒU½x­¿H€h‡²´@Á)›†9y?&2\éQ&\ê–3\í&!hnÓ·[Ï˜1\\(Ÿ˜¨†\Í\Ô{J§±±EC2X´ \ËZ\ë\É9ò;\×f\ÙhYZ1@ }L\ï(\Ì\ï\ÄpÉ¦«$µ[\ç\ï\ßeG£¬‚·†-²ŸıNa;+`M³-`{\Ù\0 \Î7{¶0To¿g¼\Ûoµ0bkÌˆŸFÕ5§\èf”3N1ló\ÉV/XÁ\Ì\Æ2˜8Sc^\à\Ã\áN\Ù\î¾~¿<¬\":°\×–Án\Ùiñ€\×z°ƒjy“U\0{¨5“»¨\ëCXğ >³\Ö,LªrŒ›),ó‡©5¶©a(\ãˆ)l\åsff†¼¦F¢M­¸\ÉF6\È¯\ÙLˆ\à³\Ô?^1\æ;ke@\Ã\ê3µ’…sx.-\'\\W…\Ã\Äğ\Ş\ÑI3e\Âc˜Æ´\á@ÚƒI÷a/&Eöb’k\ŞeYg\çC\ç\Çÿ¡÷\\?\í1\ÃM	Fd‹UÅ¡\0ˆ&	LµµX¶ö°2—S¤šIF®^›`~Sx\à\ï\à a˜¾WS\r¡\Ô9¸TC&œ=‚j,N¸\Ësiù}\Ê5bÑ§\Æ[\Óq²õ\ìõ‹¬÷8xûº\Ìa¿\åÈ·j\â\Z\çrNGöYsk¼¯TDs#Kc~Æ².¹	.V\×\ßmF\æıx-\ì˜t\Î\åyi 3‡°\é‰Lı$†\äÃ³®Y\Şş°*%q3~Î¦\å@{¸\Û+\Û€8€8•\í!N	ƒ&h\rhfƒ¡W­\ËB&õÚ‚›g`û<cÒ³&\È\ÜgøŒg™%HPZf2¶Åµ\èQ\Ø\\›]·š}~\0š”xÊ€D&´\"\Ç|s<a&D\Äyšsm\è\Ù,I€IÆ»\ä@¦\ÈöaD\Õ†™\Zû\r6h$¾\Ób[[\Ì0±c®;{£byœ¬¬^|‹¹µ\0\ÃB^«\È]¦jÙ»‹\Ì5«:Q3i\íew\0õ(\0k\0¡°6Ã¡©@\Ö\éMp»\à´\äÁÿ ‘\Å\é3H…\×\ŞB“\í\äe<k\ÇønM±+!\İrW´\Åd÷\Z’€\é•G\ã2z\Ôò,¹G¸ıY\Ù:q\ÅükË®Î²\ìÒ­T\ç7x;·¸û\è=Í¬\Å«óUY_\"F­ª\à\âlÁfm\×\ÔJ…ª‹Sx0•\Õ/P­ºN`f¤¹\æAÁœc\0\'\ë}82B\Ôs\è˜1iú£‡‰p¬†e»\Şp0\à.†ù`\Ã\Ş\ÈE\å5N‡±F\Í9“%5„€D‡\Æ>1U<U<mk\Ğ&ğTA¯b l7\æ9óÕ‚\rƒVñÀ\\e§©´(6\åDšş/ò\ÚH0r\İ\Ö$\ê\Õ\Çvgå§Œ¶\à^\\°Ä„h˜l\ê\ÌñSXM\Ö:ÁÀ©øN+w²\Ù%±€-¬€\"\'r>-‹\Ò@/ˆø>@\çk\ê»<?ş6\è8(“\ÈğŠ\Z7\ì«\äÁY\ÔÄ¦rE3ª<2ûÁu(›4·:z\ìV¿8ff<ZÆ­a\\W§g8›ü\ß&T²#È„{JR!ó< ŒÚ•vÿƒıšQ¬˜\ã‘8-\Âm/”W¤\ÑhS•­\ãw/Ê£W\ÏÊ£·]Au\Å\ÌYıvı\0r.~yº*K@3\Ç$[\â£	\éš\á…\é f‡‘ªÑ…·­†\áQ\îú\İV¯‹’šMÅ¹\\\Å\ç\r\r¸Q´X™û5ğ›l€1» §\Ğz5@z\0Bô\Ä?·ùid\ä\ê+n\Ö\ÕqzióÁ¹\ëCcl\æ3\0\â,¤B:Z\n°ñ@ò eeu R\"æ„Ÿ\r\ì\Ş\Èq}p†Oğ\Ôk4™\Ú/‹¦dÃ°#cn\Óş\rö\ëB&†ñ\Ë&¦ab¤o6ƒ\îªÀ\éS‡g¢t!V\nøœ\æÈŒÂŒ‰aK:\ã†\Ó5@e²f\'O®5}³½&\0Ú­‹\Ñ\ìú&’ÿwœ˜\èq|°6V,\'µöm\Åc`.\× ±\Ë,2¤!¬X¶\Êu\\¹w#©\ï¼:Cj\Ù\ëùYş\\[*	1©\0eŠ0á©† fWXO>oÇˆ\ÑJ\Ó+A\0B÷™™\î\\b!œ X§­³—×˜ß³ô9|qU–8 K!¡İ–Rò9úŠÏ¹°ıtR\Ên\ç\Óì‡€‹³\Âl\à\â–\Ü\\˜‘*S¤\ÒY\Ç,U;S¦\è­Z!\Ì\Í7\0\Ğô[ò°q\×1Ejª?\ç¶\n¶¤	\ÍW¼ªFò;\Ç.qò±f*pd«Zm&¬\ÃkÖ¦™3Ng+õ¥E8#3Ve\ì‹\Ã\àx£7°_\Ì1Rs_š³\Zft)€’\Ë¬œ±d\ÌYl¼\Ğ\í!,œ¨˜\é\Ã	²À–®7¶\0A9\á:aXp¦>b\Ğf\Æ\'ù.“÷<\Ø\É?\åK:\Z8\Ó#\Î0-E3WD~@(;\ÃJL²Ö¥®J\Ş[ó³;¤\ï\Ç\Ì*m·è‘ªo§‚÷Ä’{\Æ\Ó{\æg–\Ó\ÊvşÙ`6SÈ¸µLô±=_\Ğ\ë\É\é#Yü{®.œ7­Xxm´!\ßwŠ\ãz`ÁK\Ïñ3¤\Ãv°È¤Ÿ\Z‘Àüºû|\Ì3\0\İzúöU9|óq:1Ë—e©,»\é]l2#º­\ÕZWü9Nˆi5gÑœ÷ê¯¸…EŠÜ”¯\ï\×$»(:JoLÓ‚V©\Õ\Ñk€A\Z\ÚÀM·;\áZú\Ä\0º\\\Ô!ü\ìµ\í¨<0ü2\â\r\×IeY¨)´ø \ÂDU\0\Ñ±2\×ÿYñ\\/aÂ•`\å=œ‡	¡~JOBµ‘¢<\à÷* |€\n	QñpG\è·\nS7¼×•z\Óql\0t<Y\0$\Ë\Úk\ÚN\\‰rd‚ kmMa &Êœ¸@‰\é|\ÙxG¶\Òûöv‹0\Z6°–ª\é\Éú»km§˜o\Ã9\ê*>uù^˜Èƒg¬	¯epœ{-6\'œ‹ñHQc\×\0°‹5¾:‡Åº’ü	\à\Ñ)\ë\ÂjF1x6—ï™¶\ë)fXö›À\äµ\ÒK€j\ÒaYÖšo3Z}³Hñ°{\\Z\ÙIU\ËøSw.¨‹=·\\#ğ\ÎUqıÀ3ª\éµ\Ùô\Ì\æCš\×n\ĞX\Ôl2|\07¼>q\á2Àt3š©qB4…\Ñ\ï\ä	™\rš\Û97\ì\Şo\Õ\ŞY\Í\à§rS\ç\ÂuEs¶_0“XqlwÀ\Å9Cª¥q5\0\ÈÀ\Ê*Ÿ·«A\Ûj\ØRWO7ô>\âA›NKY¾e\nM6µ¤\Ë±1\Ã\ÌJşoŒ\Ì\r\Óa‹û\në©—À\Í#ğ\ZYPs\"\Û0\Ğ\éQƒ£30›>ˆzÊ‚ph+ÀKW\Ã1cM«™N\×W‰]\Ã*)^E\"H–!+Cœ\ÇP’\Şü\Äö˜\Õ;\î\âR\ïM&\Î\Zi/&¸\á”\n‹¢\ÕC6 ,+Ÿ€\Èı9\ÙdDX^}hª]-\Z\ÆK\'\É¾K)R\r£¬ƒih\rÆ“õ\Ôşcğ1\Ì\Ò\ãX™\å\ÑQÁ&-xµ†¦\Ü\Ôx\Õ\\y\Â€S.Á§V†T\ê%æ™‰¹uú\æ‹rü\ê®\ì\ß]•\Í%\0DÏ­n˜©·{°¡}`\Ğ¸\Ü\İb#ÀQ™\Â.jn\Ü\ç/\Öd\0kQ·°‘÷p¸ ¹:PCcNl<°\â=i6I1\rfß–¾&X,3e¡©|û¹`†[5!\0l8Ğ¼ ó†e\ÉR¨\Ä\ï\0\Úp	_\n–0ê¬±0\ïS¸×œ7qIP\Ñ_	0p²‡\Z\Ê,‰:\Ö\Î#¼\ĞL$¡£\Å\á¶„\Ë\ïM\É\Ô\Ä[\Øò:¬\îr\rûºf¡\Ã\àw0i¼–¶kª)y}²·`7Xk¼/\ë\\8²\ì€k¯lşˆ\É5\Ö\æRWñ\İ\ÊCˆAœø\\\'),=3>hw\n=\Ø`\\ğ¾®¤\nk\å}ÿ/<\0Y÷ÁX\Ïl>„‰Xs52]xŸ\ã:\ã;³\É«--XÈ²L\Æp\ÃI®\ïIY\İL}©0\ÎIWB[O\î®qB^\à	@WTÁ^t\à\âÍ®û\Õòz\İ0\ÖÊƒ˜h^XKt\ZJZ\ç\"˜9–\å{c¦Z¼¹7\ßÿ ôÁ\Ğ\Ét744ÁM\è)ú†\Ú\Æ_t\Ô,‡t\Æô­†1\Ø\Ë\àšY\ç\ésĞ†°…©²,j\ç\çVJQ\èÆ 0³“/a·ü’\ÒÇ„‡\'\È\Ôh\é\Æj„¿\íÎŸ®ı\01‡\æPÓ‰¾´ô\È}\å\Z\ØÏ´\Û†5w¬†54\Ô3U\È\Ñ\Å\Õ:L€#\Ø;®²\â§\ÎòQ€&[\'½·)Ágøˆg\àk‚.ø\ï\á;ª\ÇhFŸ›’\È\Ø%÷‘V\Å	«y\îü?ku\rüû>\Æ\Ì0K\Â30e*\×cr?\Ç\Æs^œÎ‚e]&×±–)MÕ¹¦\Äğš“\Õj¦†ÿ¥2\Í v\natûfw­’±\nŒE\Ës±\ëD\ß\\~\Ò-½\Ê3\ß:²/°:oø\äöù}ÿ`=\àuY\ãˆ,n\Í	\ãù¦+\Â~\Z\\§\×s˜\Ä/¸±)£›Xç§«¿\ä¢Ü5[²f†\0Hf¤\áËŸ¬œM\é½Ş‘@‰\ÖĞ€\Øx\á˜\Ùñ\Ğ\íq,lƒQ\áY¢ÿ\0\ã€ÿÕ˜`3\ÙHŠ\Ï\Î\éTÁ ûÁŠO³k°\×\ÅI\êLİ°Jû\Ø$\çAvÂ\É\Ä$°f\ÍLE\Ö,DM›\×n\Ì\r\Ó\×98˜tg´‡…£YÀ\à\î\Î\ŞkMr.SóhO@\à,¢Fh2u0]j+K#øON\0¾:¦\å:\\s\Ñ<U\çú¬x®5½š[\Æ\ëù=1Dş—x#\à€\İ-\Ãoş®\Ñ)\á<)™tX/Á8v\å#~€Q\×ş\êxX \ÆDc²ß§\Ö\ÈcO-¡M$©\Ñj˜]Kû35:\Ï\É\È@\Ã3\á9ô±^\ØqÁdZ¨]aÓ­ã»§\å\äõM9º{R\ì–ù\èöğ\é\éÂ€\0\Í^0lı>\'\Ö\ë5+’~€\×\Ç0$7Ákc^[\Âd¦tJ{c¶hs–E°\Z~ñFÑƒi\í\ÅC\nSa>\Ç\è KµLhO˜ı\Ù\İ\ï¢Ğ‚~_Ú±ú1À2ŸA[4Vh\Ş\ï\Ğ\ì\Â$Ccj¦\Íô¨a&Xùy|´œQ¶@	\0`\0;!f£\ÉwC\Êk®\ß&šf&G˜¬\Ç\\·\ì…Ó¤”p\í\É<\ÚgP™P¶£°Zz€÷—ıHx\è;x\ï\Ù\"\æ3€­ş±“kQí‹†óõlG†\Ş3HnõŒlU\Ë\\:U\ê2ó·L³(ó\êLT÷^Ó©\È\n\Åûß»\å\r\04_,°½7«c‘p(b2S\ØÀ}a’-³\Ò1\É\ép2\ÔzYj{yyp¦\íĞ€‚‘k˜{\ÊÓ³:!\ê~\0\Ş?,ıÑ°<D&õ°\0\îJµSõc¹\Æ\êÁG\ÓT\Çd?h®c\ëÄ¾q¯O\ËñË§esØ²Œ7¼õË‹³²Ç‰-~Œ>\Ä;JQN\Ê<\á\Z—ij~ q@Ç¬\à‚» \'7\Âf\Û.ˆN‰\áT\r	<j¶f\å\â\Ì\\ôú=ÀV¡wÆ°`\r\å’\Ç\n\Ü\îô¡Nˆ^)&QS\ÖF—\ÉtV1\Ãtšd@>ğÂš°\æ!Àg ¦f\àFğ)ª5\ÉakP00h†g«©õBÍ†·t\Õ]\Â0˜÷¾\ìšø–uh\Ùog½qÁñ)Áù0\ÙX\Ø)#3Œ‚q!U{ˆÃ£41pk@\çaŠ\æœ„mş˜Õ…\\WmD“\Ë{¬pskIrg[j™Ô†fOj‹F4—\Ú=óq\rY,®ó\áØ¡\İõ­dRV%¾\ç¸z.À\×ó|0É©\'\Ô3\æ»\ÆÊ‹M\î[‰ô°r¿=»R1^\Ñ|ay&Š…º\ÊS“[‡/Á¸œ\ïiö\ï\ÚÜ‚ô»Ó²\áõµ0¼\ÇL´\Ëú>³a‰£²JÀF@#JÑ®”²ˆ\nşœG\ä\â|\\u\íû\ÍI:\Ã™\ç\ä>À‘jdÀ£IV«d\îí¼yE ö†0 n;\0œ;3\Øg™av³R\ã6µ {|ö5M\ï\Ø\×`™\ÏJ–\ÎY)9~÷Àô‚­üp¡\Íø	3l\Ø(\æP¦¨§$\Ì9Y ¯\'Œ\'n\Û7\Ã=Y*0‡³%lXĞ¶\è:+ó*\ä\Í\Ù;Ág—yØ–I;±\rF<Ò³\èT\'ˆ&4\r=õ\Æù\İî³•\ÍŞ4z¸˜l\Æc\â0»\Õ`ô3hµ“\Ê~°½^ó’\ß\ç˜T\ã|‡\ÚP2‰„\â™\è¼dCCM/š\ŞÀ}t3¿§LÀ¶\ËMª–¶\Ç\"\Ùeœ;\Ãp2}d\ç÷Yr-V\Ño­A¤\ëön0ÁŸ\Şqa7\\\Ğ\r\ŞÚ‹\'€ğ0¯M‡\Ö\\\Ø\Ä+lqÍ—\Ì\0)9[q\é1Ã˜s\ë\Çt\ãÓ¨\\§@\Âr†\Zf‚qµd5¹˜0u¡û·=\Ø\İ-½\í\í\Ò0p®Å¤\Õ\Ë~~¯`A\Û«³\"\î\í\ïgI¾^—ı^\0r…ÀuK(Mğ ºT0¬8ºu«€Æµœ\Êüj@&\'†\Ì\Ì=š+\Õ¦14“r\'´Á,w³Ü¿+H\àÿ\\wV\ŞY‚µ2ü€\ĞF÷¬Ş¶ˆg*&Z)“eL¸Gz°|¿À4\ÆEa\Z3/S˜\0\ê\Ï\é\Ó3À¥“\Æ kbeEXØµ¼\É+«ù\ì”\ç9;z’\Ï[>ñó:}j<3Dœ\Çöº„\ÔJ&ˆ@oÙ‚K5ù-\Ö\ÌB—\\\ÚõJv4¬f\ãÑ™f\ØX¥zÙ¬V\î\ì\ç2=\'\è÷£\ÛM™özı~²A–«Ù¢­6\ÜÄ½,˜lJ®$\Ûr£\â5(>\0Dp*\0–[om\\l\ßL\ï\Ş5f\Öø /\Ê\ï€Ğ…0£\å\í\Ù:\Â\Ô·\Ö\ËÒ \\œhO\r\Ä”F§Y+—’4\ÃCXÉ´İ ?(oô¶aÀ‡¥n³€­ZWW·\Ã\Ü.*t¯\Ùı~Š>\Ä3¶\ÅZe¹•M¬i7fœ½d’\Øwı©\\ğ:\0µº\æÊ–\\W4)¦\Ì\0®d:\ÎğŒÀ\Ë~Å€%\Â_\Ç\ä\Şó´…°M4ùn\09\\\í19`A\Ğ}‡{\rúñ\í1D˜w\ë!\æ˜@fS/\ß3\"\ß\íò7tœ`.\r5²–m\çg·f<\0V¼x€\èš_5¤¹p3*©y<\èn	m\Ö„\0Õ±£c\å„\ã^=\'×“¥–~¯–\Ër+>—,‡	‰ñ%¯“%À\Ğ3\Ş3\á³Ê™]¤\ÓCÀ×‡ı*\ÆÇ ¿¥W\Ö4Î˜ğ3\Ù\\g\È\r-¹>3&[‡|Á\êl]6Ì€¹YLÁ\Z§as¿ú~\Ï÷\àòÀt5–9_L3¿¯\çğY€šôN(š‹b\à,8\Õ|ù \\S¦~\ÂleQŠƒLÄ 	k\Ãt2z\Û\Ü\0ì·³³¸:-1²iúbXjLr6„Y¹Y477\îc\ŞT\Ø%kr:Œ§VÂš\ÎI¼S“\Ş0\ÒÀò–8(0£5ƒVbg\ë‡cY\Ï\Ñ\àn\Ú«\Å\ÔP–i°\Ä\ï=O\ßgDó ú‚û\ÙEö3A:p=«·[rÍ•K9Ñƒ?i5\ØÀ}À\Ë\ï:*<\'W¨%Tu\ÌD=aBÙƒ\Ï\Ì\ï“ûv¦¶Q‡\Ãk‡\Ùı|\åDt<÷9×¿\Ô\ä \ÄeSA\0ğ$5z\×\Û`ñ~‹WçŒ¡\Å\Æ~\Ó9#òIg\Ğe	†$#\0Á‡h­\Î\î\ë5b|\Æ\Ë2Yñ\İh\ä	²\È\ÕrVh{\Íq–œ\Ô\Æ&·d?u\Ş:]˜V\\!\ê¾Û˜\Ú^¾\ë«k\0\é¾bgecók\Õóg\Åıc\Ã2\\P\Ş-{˜÷+n\Ì¨\ÙPÀ£fK§ƒÁw†Aâ‰©²º_\îl—–m@¨+Ÿu ˜°¤\ä\0\á3<`i\Z„4GœmWñ¶,b0ˆ\íj5Ah!ªš\Ë`\èHGPZšoQBºwü°¤Aqy†Y\r¸Œ©i@«v\ê§\\+¿7\èVA¡\ØÏ\éNš—y]\ÓbÅµ]\Îe<ó\í \'\É\Û4~\é¢*c†y€\İÌˆ\àRs´d-kTd»T½0´Nu«ò ¤vLgY¾CG.;O1Ğ‘\r‚JÀÕ›ar\ï\Ëdˆ\'K–€â½¾ß°”E³İ¢v\ÆÖ³Ôª\ë\ç\Ã$\Ä\n$‹%;2\Ö\Æ{e¶yğ>÷!Di\ÕL:@3d‡ ”¡S7j<”\Ã\ZĞ­\Õ%hÇ£l8Ã—aó\Õt©Å´faqf…\Ìg£›‹2½x¼?©jA½*fV.†vR:¢ò\à²%&\ÍCo\î\×¥\Óa*«}<-\0Rd¿‡\å\æ÷®<7²ƒ+\ï\Â#—d\Ü*\n\àVÆ—\0˜ñ%c‚.V\Ï1AsLKo\Ãu­\Å=V-y¿\ÛjY5£>36h¬\Ã\ĞÍ·KB\'I\ì3˜¡VŸDCÁH 99\æú‘L¦T 0@\ÕS&À€I\ÇñÀw\0ûJ\Û7f·5\ÑŞ“õ,^ZÀüJ†C>‡ô\Ü÷«w›ª\Ï³\Ï5ğ{´”ùb\Ï\í€\Â|ÀõHÚ{°OšÕ˜¢DĞ•\ÌL=f\Í:÷ê¸œ\0\n@mø©Á\nº«©\Å\"\Ş{4a®]G’\n\Zp\ÎÄˆ9;\Ãdø:•s\Îm­¦›{gcH¬@6x\\q_\È3=­²²q\ë.\ãµ3Yg¸•¦\Ú\0Ã¾|\Ã<æ‘¡\na\ÃqLù°‰c›õ¸›±¬\Ññ$n6Œ~¬*¨`NfD—/\å›\Ó3\r5€\0@¶py#@Z\á\å6“\İ\è‡o\0À\ï<(\ßy\ãT>,ğ¢ô”‡üo»\Ûô`\Ş[ö+\é¾WvFÌ¼‘õü®¹c€{Möw\Íô€\È{S€\0e©§L\äO7²M™[¶„¨K\İa¦Ñ)¹T†p\âØ˜¥ğ54º„É¬ıK\ç}£ß»\ãÁù\í–mL“¥dÛƒ;©ºÿ¹]„‹\çFu\ß\çy\rœ[È°+³\Â&\æ³]\Â\é¤\ë+\Ï9Y«‹î¿½®Á\ZKc1/ß“\à·\ìla\0\ï³A§1\ÒÜŸ×¾\æ^\rqÁTôÚq®\Õ2p\Èú]_\ç»\"—-RÆztÄ’›\Æ\â\ìôwR2·kZ\'L–\×ñR«£}G<g·3šjƒ¨d™”ÿ><P^$*9+\0\0\0\0IEND®B`‚','image/png'),(5,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0÷\0\0\0÷\0\0\0N\îU\0\0\0gAMA\0\0±|ûQ“\0\0\0 cHRM\0\0‡\0\0Œ\0\0ÿ\Í\0\0‚·\0\0{˜\0\0ğ\0\0;\Ê\0\0^cJe\0\0giCCPICC Profile\0\0X\ÃÕ˜wPTÏ“À\çmf\Ù%\çœs\ÎAr\Î9#²\äœA‚D¾ Y@‰*D%ˆ¨DA’\"HTŠH¸Uú»»ªû\ãª\îŸ\ëªyûy]óú\ÍN¿™\î\0nBB`\0E„Y\êir\Ø;8r \çP€œx¥$¸‡‡h˜›ƒÿQ¾>#ö#\ÊÑŸ¶ÀÿN(=<\Ã\İ€Ì‰\ì\æ\îH\ä\ÛÄ†s	‹\0\0\ÖM\ÔOœŒ!2<\È4a\ÄùòOöş\Í?\Ù\í7ş\êcm©E\äe\008!\Ì\0\ÒM¢#\Êİ›h‡\0E\ä\á\0‘U\İ}Ä¹p%ö	ş\ÉYDpûOv¼ÿ‹M·¿6	\ï¿üû¿üŒ¶oxH\0!ü_K`@\äŸwP.(Àô§oxˆmİƒ mô‡C\Ìÿ\ê=ƒl¬şp›©\Ùö\nÓµü\Û?Bó?±¹õõ\Ñ2ık\'\\\ç¯?‚¡ù‹´´ù\Ã\áQV:ÿ~\Ö\Ú\î\ï\Ø<µÿ\ê½|u\rş°o„Á\ßwùı0:@p\0-\à‚€\'\â6ñ.„€\0\â]L„gt\ÄÏ‰\Ğ\n‰	óõö‰\à\Ğ ~\"A\îb\"R’’\àÿ“ü\\{¿\é³\å¯5Ñÿ[\Ş€2qn ÿÖ¹4\0\Ğ>Cü\ä[ÿ­\ã	\0 \ë‚{dX\Ôo\â\ç	°\Ä5M\à@H9 Ô‰3mÌ€5p\0.Àø\ç:œ§@2HgA(¥ \\u\à:¸	\ÚA\èÁ˜\0\Ó`,ƒUğlƒ¯\àAhQCŒ;\Ä	CR¤\n\é@Æ%\ä\0¹B\ŞP	‚NCg¡¨ª†\ê¡\è\Ô\rC“\ĞshÚ€>A{08£±\Âø`\â0˜\Ìf\r;ó†…\Âba©°X	¬v\r\ÖëÀ¦aË°w°8€“\Â\é\àœpQ¸\\nw„{Á\Ã\à	ğLx1¼\Ş\ï„ÂŸÀ—\á›ğ\ï‚\ZÁE(#ô6wD(\"‘…(E\Ô!\Úıˆ\'ˆ\Ä6\â‰G² …‘JH¤=\Òy™†,F\Ö\"[‘\Èi\ä*ò+\n…¢Cñ£\äQú(”*•…*G5£ºQ“¨W¨4\ZÍˆF« \Í\Ğt:\r}}\rı\0=…^E\ïbH1\ì)Œ.\Æ„IÁc\Z0÷1S˜5\Ì\n^%3’’\\’\Ë$$\ã$«$?°”X~¬\n\Ö\Z\ë‡MÆ–`›°\Ø\ìgRRR.RERR_\Ò$\Ò\Ò¤C¤+¤\ßqT8!œ\Î‰\ËÁ]\Åu\ã\ã>\ãñx>¼:\Ş\ÏÁ\×\ãûğKø]2j2122²D²2²6²)²÷\ä$\ä¼\ä\Z\ä.\ä±\ä\Å\ä·\È\Ç\É7)H(ø(´(	ew(f(v(©)%)\Í()³((‡)×©\ĞT|T:TT©T—¨ú¨^QÃ©¹©µ¨İ©OS_¦ ^¥A\Ñğ\Ó\ĞøÑœ¥¹N3F³MKE+CkKM[F{v™N\ÇGg@@—Kw“\î\İ=+½½\'}}ıı7fuO†L†f†i†=FFF\Æ|\Æv\ÆE&““\ÓI¦\n¦¦Mf\Zfefw\æL\æ›\Ìs,0!K–8–K,£,;¬l¬z¬!¬XûX7\Ù\è\Ø\Ô\Ùü\Ø\n\Ù\î³m°S³«²û²²?`\ËAË¡ÁÀQ\Â\ÑÏ±\Í\ÉÂ©\Ï\ÉY\Í9\Æùƒ‹ŸË†+…«™k‘Ë­À\í\Å]\È\İË½\Í\Ã\Îc\ÂsŠ§‘g—„W×‡÷<\ï \ï7>~>;¾t¾v¾u~~şXşFş¼€š@¨@ÀSA” ‚ ¿`¹\à„LHV\ÈG¨Lh\\&,\'\ì+\\.<)‚Q	©™Å‰jˆF‰6Š®ˆÑ‰‹¥ˆµ‹½\çw\Ï?”•¸,1/I%i(™\"\Ù)ùIJH\Ê]ªL\ê©4^ZW:QºCú£Œ°Œ§L…Ì¬,µ¬‰lºl¯ìœ¼\\˜\\“Ü†<¼«üEù\Zs…,…!E¤¢¦b¢b—\âw%9¥¥›J”E•ı•”×ñó<vù\Ø+.‚JµÊ²*‡ª«j•\ê²\Z§\ZA­F\í¥:·º‡z­úš† †Ÿ\Æ5÷ššaš­šß´”´âµºµ\á\ÚzÚ™\Úc:T:6:¥:Kº\\ºŞºº\Ûz²zqz\İúH}#ı|ıVwƒzƒmCy\Ãx\Ã~#œ‘•Q©\ÑKc!\ã0\ãN˜‰¡\É9“S^\Ó \Óv3`f`v\ÎlÑœ\ß<\Ôü®\Ê\ÂÜ¢\Ìâ¥¤\å)\ËA+j«V\rV_­5­s­\çml\"mzm\Émm\ëm¿\Ùi\Û\Ø-Û‹\Û\ÇÛ809ø:t8¢mkwœtœŠœVeÓœŸ\ç?}|Ø…\É%À\å\Ş	ò„·\\‘®v®\r®û3B\ra\Ç\ÍÀ\í¢Û¶»–ûy÷w\ê…*k^*^^\ë\Ş*\Ş\ç¼7|\Ô|Š}6}µ|K}?ú\éûUú}ó7ó¿\ê`\Ğˆ	t\r¼D\ä\Ô\Ì<\"’²ªZºfV…ïˆ !&9£‘‘g\"W¢T£Ê¢vOÚ¼M=\Z#“³«{%\ç\×{ŠóTò©•xø\ê(Á-¡7‘;15q5I/©.›\ìŸü8E\"¥ \å\Ëi»Ó©¬©I©¯\Î\èiL#KK›IWN¯üñ\ï?c\Ò23=2•8[|v?\Ë=\ëQ¶dvIöQW\ÎX®\\nE*/(\ïY¾Z~]eAlÁ«s&\ç\Ú\n9\n3¿(\Z.–)®<=y~¹Ä¸¤\ãÏ…¼û¥>¥\Óeše\ÍY.f\\üV\îQ>U¡^\ÑT\ÉZy¶r¯Ê·j¶Z¯º­†¯¦ø\êRÔ¥7—m/^Q¸R_\ËT{¶ö\àj\Ğ\Õ\å:Ëºşzùúú–†\ÜFXcd\ã\Æ5\çk×µ¯w4‰6U7\Ó5Ÿ½nD\Şx\Û\â\Úò\ì¦\Ñ\Í\Ş[\n·šnóŞ¾\ØJİš\ÙµÅ´m·û´/w8tL\Ş1¼\ÓÛ©\Ü\ÙzW\ì\î\Õ.Î®²{´÷r\ïc\ï§\Ş?zû`§;¤{³Ç»\çU\ï‰\Şù>û¾§ııcFCuö\rj>R\ê\ZV\Z¾óH\áQûˆ\ÜHÛ¨\ìh\ëc\ÙÇ­crcm\ãò\ãŠ“\Ç&\ïO©Mõ<\Ñ~òğ©ÁÓ‘i\Ó\é\Ég6\Ïfgœg–g=f×Ÿ<ÿ85÷c>i¹¹H±X¼Ä²TóBğEó²\Üò½\í•Ñ—V/\ç_¹¿z÷:üõşj\êü›\â5öµúu©õ®\rİ‰·NoWß…¼û±™¶E¹uñ½Àû\Û\Ô?Œn\Ûo¯~ûxô)\ë3\ã\ç«_d¾ô\î˜\ï,}\rüú\ã[\æ.\ãn\İw…\ïƒ{v{k?N\î£÷K:Ba„_©\0œ\Ø`^^\0|ºJ\Ì\0 \0\0\Ûı;7ş—À‰\ÉŒøkqC7`pZøkD2ˆ¶À#\á\Å2R\á0xšœ’‚–’J„Z•Æ”Ö›.–>›¡’±‰\éóC–yÖ\ìdâœ–\\¡Ü™<\å¼\Í|wù&g…–„WDVE7\Ä>ˆ–ø!…\Æ\É\Ğ\È2\Ëq\Éó)*Š(‰*‹VT\åW\ãU\ç\Ô`\×d\ÑbÔ¦\Ñ!\×E\ë\é}\Ó\ß2xe8k4j\Üc\ÒjZoVi^bQhyÎªÀ:\ß&\Ï6\Ç.\Ó>\İ\á´c‚S´s\Øq¯î®?·P÷S\éy^%\Ş\Õ>õ¾\Í~mşwºÏ†¬‡\î‡\ÓDˆE\êEN\ÆE\Æ4\Æö\ÅÍ\ÚN@&2$	$Ë¦¨Ÿ\ÖK59c‘f“n÷c†s\æñ³.Y.\Ù.9®¹yùq9\çj\ï=+\Ş*A\\`*•(Ó¹\èXTqº²´\êfõ\ãšw—I®ğ\×\ê^õ¨K®¯l\èjœ½ö¥‰¼™ÿ†R‹ÁM«[·]Z\İÚ¼\Úı:‚\î„vFÜêŠ¾{?şArwF\ÏùŞ«}]ı«¿\á‡9I\è\Ú?ö‹OŸÈŸ,:ÿ¤ği\Şt\æ³Ô™øÙ¨\çAs^ó.¶‹&K:/-Ë®ˆ¿~\Åÿšg•\ã\r\ë\Z\ã:\İ\Õ[òw¤›\è-ø\Ö\áû\İ[\Û\Ï?\ŞûTú9\ì‹\Ş\ë\Î\ç¯\Ãßªw£¿›\íñ\î\íÿ˜Ú¯;H8´>::\"ú_ôCEDÿSÁ‡…\Èp”%šC‚ùB2!\í\Ç\İÅ·‘uwPÜ¥\ì§\Z¡§yKû•Á@Á\È\È\Ä\Æ\Ì\Å\"\Ä*\Ïf\Ê\îÇ‘\Äy«»§—w˜oŒ\\`Rp’û‹ŒˆŠõ‰÷HtKvKõH÷\Èô\È>\ë’\ïThSlQjT¾t¬T¥@5C-Q=B\Ã_\ÓU\ËZ[WGQWXU¯`°i8g4d\ÜjRcšg–`j\ái\édeimh£i«`\'f\Ï\ãÀ\èH\æs\Úq^?¾\à2ybØµŸ\Ğ\çö\Ğ}\Ø\ã±\ç”\×3\ï\ç>¾K~/ü—V_­¿\rù…SEğF\ÊGœtŒIˆÍ‰«8u=şn\ÂPâ“¤ùä•”\Õ\Ók©\ëg6\ÒŞ¦¿ıg#c=ó\Í\ÙÕ¬—\Ù+9Ë¹¯ò6òw\Î!\n\éŠŠ•\Ï—¸\\.M*Ë»XU\ŞR\Ñ[9]õ¶~‰õ²\â\ÛÚ°«\Ùuõõ}\r‹ß®“7ñ5+\ß0iq¼\éy+\àvXkt[|{JGú³¹w\Ïu\ß+½_ù ¶»¥§»wªo½ÿğ!Í Ğú°\í#ÿ‘¤\Ñ\Â\Çuc]\ã\'\æ\'W§6Ÿl?ı2ı\í\Ù\Ş\ÌÁ\ì\Ñ4_@,\"—P/\Ğ\Ë\ØŠ—¯¸_‹¯*¿\Ñ]³Xw\Şğ~ú.nó\ÌV\îû’•Û—>\Ö|*ÿ\\ô%k\'\å\ë\Éo»„\ï6{†?T÷¥xpıƒmÁ‹VH\ä\ê!ºDb†U e\Ç!pñ«d³\ä\Ã”÷©º¨\ï\Ñt\ÑŞ£\ë£f˜d|\Ét\È\Â\ÎjÀ\Å^\Ã1Ì¹Á\r\ça\â\æS\á7°<!\ä#\"%\Z\'–,.‘%Y uAºJ\æª\ì5¹ò·\Ú;”Ú•Û\İV¹¡z]­V½Z£T3O+];A\'L\×[\ÏQ\ß\Ø@\ÅPÜˆ\Ío¼oò\Ît\Îl\ÄüE‹eU¥õy›l\Û\Óv1öAn¶Nú\ÎJ\ÇE\\\ØOP»b	H7¸;\Ì\î‰ôBy£}Ğ¾(?¤?\"\0ƒ‚BQa\ä\á\Ì‚‘\nQz\'­£	1A±1qgN\åÄ—$T\'\Ö&\Õ\'×¥\\9]•Zz¦0-;=õŸøŒˆÌ€³\îY\Ù\æ9ú¹šyjù\Zú\ç,\nù‡ŸO,É¸p®ôbÙ•‹\×\Ë\Û*TW=«^«ù~…£V\æª^c}`CbcŞµ\ê\ë-M\İ\Í#7´\ÌŞœ»5w{¶u¦\íiûT\ÇøÇ\îvõ\ß\ë½\ßó ·{°g¢w±o«ÿ\à!\Ù ÛØ°\Ê#\ã§Q\ß\Ç\'\ÇN\çLO–N]|Röô\Âtñ³Â™¼\Ù\ì\çsg\æSã–¢_D/Ç­$¿<ûª\äu\í\ê\í7}k\ëK\ï\Ş\în\"·¨Ş³\İVûhó)ôsş—[;\Ó_¿\í2~W\Şsş¿_qpÿğ\ÅOÿÿ>#ù)(9\0j\é°À\è\0-\0ğn\ã\'\0\æx\0¬L38õ\0Œû7~@Äš“PfÀ$*0Ç‰µ|2±l\0\İ`|„H!>H‹X&BUP/ô†Xõ\É\ë¼4Xl\Ë\Â=\àEğaøB†hFl!Å¡\Èv\ä!J•Z\"VW±\è&óˆ„‡$‰d	«†­!Å†\Î\átq­x^|	\ì\Ùy<ùE\"%’2›Š\ê\nµ,õ \Í\ÚT:Fºôô¯R¹20\Ó2÷°³r°N±a—g\ß\à(\ã4á‚¸:¸\Ãx\Äx6y›øBù QÁ!Oa	\á=‘>Ñ³b6\âœ\â$H\æKyI«\È\Ğ\É|’”»%_¢¢ª\ä¡\ì|\Ì^\ÅN\ÕAí„º—F¨f¢V®ö%\İq½Uı]C´1»‰ˆ©’™±ù	‹(\Ë\\«\ë!›\r;œ½„ƒc¬S…s\ïñµd®rW·l÷{ï½¸¼|ò}û\ã¬«‚¾†X‡v„³GdF~;\éı<\Ö,n(^+¡7I+y€·\ÒT\Ó[3„2«³³‹r©ó\n\ÎU	·–h_˜-/§«è¯Š«Qºtxe\èjQ½g£\âuÊ¦w7†o6\Ü\Îi‹\ì8Ş©\Û%zŸöÁQ\Ïf\ß\ÂÀø\àÀp\×Hû\ã\Öñ\Ö\É\Î\'½\Ó3\ï\æXˆ\Û\èøŠ\î«ş7Z\ë}\ït·o;|\Ú\ØI\Øe\Øk;°ÿµÀ~ùŸ\Z°\0> \r4€9 €p\Ê@+\àDIC\æP0”İ„Aû0˜),v6	;€‹À\á9ğ>øB\ZŒ¸x”@F\"»PH”9ªµ…VE\ç¡_c”0˜M’:,	6û„ôi—†ûÆ¿!s%[$?Nş‚Âƒ\âeœªšŸ¸O\Ù\Ò|¤Í¡¦¦÷a ahd4g\Üeº\Äl\ÎXn±ú²q±-²—r\Øs\ÒrNq\åpñ`yñfóYñ3ó¿¸-˜*d\',\"™mKw”“DH.HµIÈ„\ÊZ\Ê\ÉÉ³( >*.+M)\ëW\éWTW®ñFó«6F‡MW^\ÏR?\Ô \ßğ¶Ñ´ñ)•™ˆ¹®…«e¼U™õ=›;4\Ñ\ïÎ™Nwœßº°œ0q\'\\w[ô ó\Ôğ:\é\İ\ì³\á\Ç\ç\ïP¸,’ú4\\$\"+ò\ã\É\ãÑ£±ªq·\â…j“¸“/Ÿ\æO½&›~?C7óQ–Qöp®n^_Ö¹\"ƒ\â‰\Çke‘\åèŠ²*\é\ê‰K\Ä\éi]nƒ\é5Š\ë\Ó\Í\å->·\ä[1m‹­¹]÷\rºyzöû¦\ê“†F3N¬N?½û¬q¶|®p!\éür\ã\ËG¯?­±o˜¿;³uÿ\Ã÷OŠ_N}\íıÿ\áx\Ğø/ÿ£\0\Ğvb$Q\0úÀøƒD\â\ê¿úÁ\Ø#z_²†\"¡¨Za`0{X¬6Û‡óÃ­\á§\á­ğ\r;\ÂQ€G’!Í\È\Êu\r\Ğf\è*ô\'Œ.\æ\"1#1#i\Äb±ş\ØqR9\Ò\nw·w\ÂOõ“k÷R\èPŒPZS.SQ\êB\Zaš~ZW\Ú}ºRzúY†XFv\ÆA¦Pf6\æ1–dVy\Öm¶k\ì¾ü«œ—¸\\¹Ù¹_ğTózñ‰ñ\íó\×\"Ao¡c\Â4\Â[\"ƒ¢Ub\Ñ\â\æ’\Ñÿw¤/Èœ’%\È\ÈK+p*R*!”ö•¿\ÛW…«‘«³kHi\êk¹#X¹\î½\×8C9#7\ã,b;gv`Áa©e\åK\Ì_\ï\Ún\Ø3:;¦8\İuş\ê\"}\"Ôµ‰°\á\Î\ã\á\êY\îµ\è\Ã\æ\ë\î\×\àÿ9P=(7x%T.,7ü}¤uTO´L\Ìõ8\áS	\â‰m\É\ê)£©Ng¶Ò“3\è3›²´³gr=ó¶b\nEy\ç\ÙKZJuË–Ê£+\éª\Új/Ã®4_õ¨\çlxs\íFS\Ò\rË›·a­K\í÷\îT\ŞM½\çÿÀªG¥g\0ığ\ÍP÷£\ÒÑˆ1‹	‰)\ê\'»\Ó\Ë3#\Ï;\æ\ë\Ë^\ä¬$¾ò[5[\ÛÀ¾]\Û|øş\êvæ§/ö_µv%÷8÷©1?ı\î%-õ+|@8M\0KGGŸù\0@\0ptô£\æ\è\è\à±\ØX\0 ;\à÷¹û¯XC@,¶£ş\Û	)\0ÿŸ\ÏTÒ•ª\Ù\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0\0tEXtSoftware\0plasq skitch·W…\æ\0\0ƒIDATx^\ímkG†Ÿÿÿü*a‡F8%ş`ª`¢„\ÈTQ±\nQ \Í\ß\èŸ\Éd<³»Z­vW{\Î\Ü×‡ ”F/3—\î9ó²«ÿıKˆuh9±-\'ö¡\å\Ä>´œØ‡–û\ĞrbZN\ìC\ËOÌ·oß¢¤uhùQˆš\ÇJ¹{€–7§0†ÿù\ç÷¨‘\å‡şsRZ\Ş&\Ç;*\Ï\0õÃ§\ÂcFş1\Ğò>H\í\ßû} \Ö-B\ËRf¡\è»\Û\í\î™\'\Ü\Ş\Ş\Ş\Ü\Ü\àÁr¹”ÿGş!\éZ\Şu±X\\___^^şÿpF£Ñ«W¯Ş½{õ·Û­<\çŞ¼\'5¡\å\Í\Ùl60[´~ö\ì™øzggg\î\ÑS ıÛ·o\ï\î\î0&¸{„eL3hy1>}şüy6›=ş\Ü)ù(k3\Ë+À\Êw`2™|øğ!Ò-¯<Cr\Ã9±°kÒ˜¿ººZ­V\î\İ$°¼©€–W!\ê PN§¨\"œn½\r~¸¸¸¸@\í\î\ß[„A4>‚–Wñğğ\0¿Å³(h\Ó\Ü=\ê_¹ù|á…•zhy1¨\Ğo7º°¼>\×I5´¼\0\Ô\ß{\ë“Ö§›)\áKT¼\ÜË—/eÑ¹^-\Âf³yñ\â…Ó§’S\åw³\Ù\ì\ë×¯¾\"giB\Ë‚J\×)£ùš…_6Œ?\ÜI-$;\Ë‡uD8\Æ}\'K/\ÕHw \Ôİ§\"?\È\Âò\ê‚¸¨\n\×k¹Dûd2\á1û–W+\ä?\nÑ«;«—Ë–‹\ß\á„,¶\İnwuu\å¤(bhó\Ë:D_KS\áG\Îû–QgCq¿W/f\àO¯ˆ ”ğıO§S÷™3\Æ~Å’†j\ÖŞ£/zuñf˜,fŸ!›\Í\æ—_~qı_„\ÆBe/™\'z^–Cñ\ÂMM“fG@ôlkt³–§£sX‹\çktK–‹\âÚ§•\ÍğŸ\ZCV{F¹X\Ş\ìrLD\ß\íô£ùYi–c¤v=L‰6Œ\Ì\×\ëö-Gt¹¾Í•´N\Ã\Ü\ÈË–#¢6›\ëXò\ÌR|+\É\ÃX¶3Î‹‹×«$Af¢(\ÊY—k=–\ãg\ÜLBÕŸ:“]\ê-/Ë¡?şø\Ãõ$)cF<\×dv1˜\å(4\Ñs…{œ$%‡t›Kõ©q±^¯]\ÃÅ‚\åQÑ‚Z=—MÉ³.¯ƒ_o±Š‘,E\Ïy›³‹\Å\Â5ŸE¬U,\Üj¦1†§¡\ê-S\Ã[Ñ’ƒ˜\Ï\ç®\Ía$\ËeA~†\ã\ÜT–s§óH\ç\ÑT\Şv\êrùñXs;Y.A~öˆôi€\É\ê\\½\åR‘\Ë\Z99„\Ú\ÓX\İb¤b©¾©‰ƒ\é\ÅDÚ±`ùv»•N\"G\"–¿~ıÚµ\ì# [°|±XH\'={D“jª\Ê\Ø\ÍD-X~~~\î:‡´„±\re–§³¢¿şú\Ëõ\Ì\ç\Ç ­\'sPÁÀLT}–ómG<<<¸&Ö>Ë£h‰~ˆA\ŞaÑ¢½:×\å\é\ê\n·„\Úñ\áZY?š,OD¿«\ÏoŸ²\ÛÏºü” õ¹\Ô)?û¯M–§\Õ!/a\î‰s3>+\Îrnyv¿T{Ñ¢\Æriè°¹yÔ¶¢kkå¨±<-W¸R\Ş¡\è6n¾¥¸b\áµú=ğ\á\Ã\×Üš\Ñj9JN={À\ÆT«\å»\İ\ÎõéŒ³³3˜®\Å5£¯.\ÇÀ‹ƒú!<¶¥•Yr…,½\á\Z]3Z+–ù|\î:t\Ìv»õ©Rh9‰ñ\çXdI\ÑÀb¢VË¹Œ\Ø0–ŸZ\Ş.\é\×m¹[I\ëø¶5p\"f9\Ù-?°œA\Ş···®\ÑÕ¢\Éòp=‹\Ûû½Á,\ï/º\ë\Ò%2Z\Òò¾ñ\ç\Ë\'“É³G¤?H[„MJ\Ëû&¼~pö\Ù°<j|u(}ºN \Ã,?\rˆZ\Ş\é\Êw…N\Æõõµ\ë\Ò1\Ü\á?F]\'nğ¡N\ËOÏ—÷†kq\Í\è³\\\æû\ëõšËˆ\İñ¸Hû½y\Ç\ã±4»j\ÔX-fñºÏˆ²³|\×\âšQY±ˆñü\rÛ—Yx\rÿiğ›ü¼h\Øø\é­³OÀe–³\ÜÀPl9:Àu\é´³ö\í} \Ìò¨\Å]Wn°1õŠ³°4\ï\'X5–›ş÷lI\Ø(Ê\î,\ßn·~ÿ‚´…Ÿ}ºVÖJ\Ë\Ã\\ŸL&\Ò%¤]P\rº&~z-¢Ftg9`\Ñ\Ò?}ú\äšX?\ê-/üu!\Ö0ñ\åŠü¢\r4\Í>¥Pñ<r\r¨ô\ri…°\\1€¾,www®sHK¸>(D}\Å0¶òö,m!£¢¥r\è¶\Ü\Ïı§Ó©t94¦´ª,d9\à/\Ü6&š\Ò\à¯ş‡Éµ/ zŒXxU+\Øø!¡;–\ß\ß\ßs¥\åx¢³+6\âÜˆ\å\ÒŒó\ã16\ï\ìd9\à‰ócÀHx}}.Ô².(Œócøû\ï¿];–UŠ5\ËÿüóO\×c\ä@\n¯™@œ\Ğİš\å€qŞŒô49+–¡&T\ç…\ë-\áu»™¶¹f9ˆ[¡\Ë\Í\\TˆA\ËÁv»FL\îš\Ør`\ÓrÀ»µT\ã#À|#–Î“x‹¹:;J^ˆ©,v4¸ITTw®\Él­‘‡˜­X„\Ùl\æ:“\áoöifÑ°õ–§ñş^`QZ\Æä©•³Y\î]_­VÒ©²B®gB\ÙZ\Ór¹´Z¢DX®X|şşû\ï®cs%\İü\êaˆñº\\À¸\\½Ş’aÀo6\×:V£=\Ë:\Õuof„\ë\âò\0˜¹\ÍgM\ì[\îWŞ¿\ï:93¢‘\n\ÃZ&“NOF–ƒôN\Ğˆv:m¯!\n¹T,RqJó2&\â\Ò Y‘‹\åÏŸ?g»‚>™Lr«U„\ì,\Ë\å\Ò^œ‡Ÿ\'…\ë*9£\å «“o÷\áó#S\ËÁo¿ı&\ä\0f#á©¬\Ü\È\×r\ß\ç\ç\ç\Î\Ó \Ë?~ü\è-\ÏdW?$;\Ë\Ã>Ş»\'ª©U¤\ÏaÅ°Œ³ı\í]‡\ãñXœ\ĞN´ö/Š‡w\"\ÏVô|+D·º¶\è\ïÑœsZşcWIŠÿú\ë¯\î\ãe-w`dE”\"f{ò¹B¢´ü\'?~t<J£úˆ‹ù\Ëò‚–?Aõ\"ºÿZ\æpYşA\Ğò\'\Øø\åÌ§3\\¯€–\Çhÿ\Éó‹?™r$´ü	ˆÀ\Û\Û[\ç‹BP´¼{÷\Î}òZƒ\áóNc\ĞòTo¹\Ïğ«s–^87|d½<«ûOÔ‡–0ŸÏ£M-ø;Â‘Zş9\ï\á7üÕ¹¾\\.3?²R-/@ïª¹²%´¼g6ğ\Îe\Æ\Éyg-/\æÕ«WN=p?¨Z^ŒºeL!¸ÀR-/F\ã\Ï¥,œ‰\n´<F\ÌĞ¸Ï÷,A \âZ^ŒÆ«‡>}ú\ä\Ş=y\n-‚\Ï?–óK´\Ü-½m\Şïœ–—A\ËKq\î\èO”AË‹.\ê¶÷\åK\ÑÅ©g-ÿI„\Î=¸÷MhyŒwİ¹£y\Û$…–;ÒŠÖ¹£\ÔW\î}“Z^Š\ÓG9ß»¹\ZZ^\×\Ë-A\Ëcdub±X8wôÛ¯xÖ‡–ó\â\Å\ç&“‰{÷\ä)´ü\'2ÅŸNmD\×\n¥S\ê<¡\åL§SóL\á\rAı\r\ËI-\Ñ~«\Ä0Î™\åB¦–Wtÿ\å\å¥óE\'\ÑC0Ë¿\ãO}h\\ZI)\\l\Éùd-ÿ‰\ÆÓ¶e\È\Ú9ƒ\\\È\×ò\Ğ\0\äFz\ï\Z½s|–h½E\È3Ñ™\å\ßÅ ¨¾\í-ÀûÇ…¢gğ™ZF\Zw(®\î4yğ¹V«•ûœ?\È0\Îs\Ïr\Ó\Íj¢\É(³<#v»\Æ;8\×\åJ44]^^><<¸Ov,\Ç@\Åe‰%ÿ}¹\\F…¸yğy1pI#HC…\Í\å›LzSY^§‡P…û}\íS\ÌL&“ô€n¡\âx~\rTcÁòšñ³\İn\å€Jæ ˜Á÷<u]š±°1k¶ğ`±V—#~\ÒZ¯\×(Á\Ã\ä\Î0Å…ğƒºnË³\Ï/_¾ ş¾¸¸p½š±\Üe \×\Ï\Ï\ÏQ¯\Ûş\Ñ~S–K£\Ã wõ“k\ä)5?&Z\ífRw#–£p\Ül6³\Ù,ü\å\åL$®Iıqmˆ–´TÌ¨·|µZaN¹wY\ÆK7{õóü„Ÿzo UÑ¶\é\î©:Nfù‘\Óv$\ÍÛ·o\Ç\ã±\ë\Ò…ê£uG}ö#ş\ê\rŒgy\ØFu¼\ßn·óù<œP’®	K´<Š™ú7~ˆ÷\'¶¼~+`b$»9yV\Z§%­\é\Ñwwwƒ\r\ïˆa\Õ\å\Òja¨cÊğ~şü¹k\İpM°k|š\àAY² pG\ïH´\ÙøÁ\Í>½\â[•T|h §¢2&’^şzªoÂ°*Q3ËŠ\Õ\î²\\!\'g°›©§\Ïò°>A…\Å73[#t}(\Æ;ñ@n\ïwš\Ü\ÌòSQ?t\ĞG©\ëu\Ö\Ğ:\âd–‡õ÷õõµkb‹´^\\\ï§R?e–\ïv»›››Ü®f\È	~ü‰\\Ÿ\Ï\ç\áñ˜ş\ç \'³|µZù\Í!\æA–ş\èn?e\Ì	,Kp’\è÷¨€=ˆŞ¹\å\Ñğ´X,X¢\äŒ00¡Ïº¥?\Ë\á\Ä3™L\n\ïˆ\Ô=U,\Ñ5ó\éšKó\Ü\Ç\ïß¿w~tL\ç–crmdR\è|ğ}]\Ö\ép£‡«“Z³¼pQ\é\åË—\î\ÑoR\äÀ\Å\Å<\ét\Ú~–ûB<ªR\0-\'eÀÑ¦ºªX0vo¿\êNRf³™³§mÚ´\Ü:e\'f…ú\Ç!ˆ=|\ïj\ĞQ™Ş\å¾JÁ[¯¢ˆmŸÜŒp:P\èüùò\å‹\è\Ômf9\Ş\\¤8!!\ŞÃ¢v½Ë¥PIS<‚…\n©O»¢e¹/T˜\â¤1ˆ¿²Ò¥-\Ñ¶<]\×Ü›\â„4^}ıú\Õyv\ÄÑ—ƒ-O_©\â\ZMB%\Êuˆ\î<;‚†‹Ot^\æC\Ú%­^\àLk\äà¨º|¹\\º7BH—øßŠiFs\Ë7†~é˜œœ0\Â\åq\ê\Ç\Ü ¡\å˜qòf…¤¢g\ïúh4j¼\ä\Ò\Är\åoŞ¼‘\×&¤S\ÂD¿¼¼t\nH\ËW«•{\ÙdX!¤Sš\èU–\Îj\ÃZ…Š“®ca\r\ã\ëõW]ª,6€\ä¯\ÕGj	i0La¼\\R!ıaY¯¾LÑ«ºG„tIh\Üî¢,O‰‚œ\éT³\Â8J\Ã,\ç\ê!9!^÷CWK-—\á ü~¤;e§\ÉiÈ´ô:Ñ†Yı³ôT–¼0E\'ıs\Ğ)®ı‹¸zŸ6“ kõo¹Xj9şA8‡],ò„d®\ß!ª¨U„ºu9¯“ CCŠ–0‹\Ë\Ö÷W,\0óY÷Ä„\ÄyZ´²\Çrùrğ9&Ñ±–£²¼ú.B„œŠ««+\çh%µ,\çf&£\Ñ\È9Z\É~\ËQúğ°\n,u\îö¿\ßr\åd\È\Ô9q¾\Çòoß¾¡(g–“¡\á÷(ß¼y\ãd-§\Ôr®”œŸŸ‹¨\ì¯XÜ“2TüùÄ†+‰÷÷÷\î™*\ëõ\ÚùZ\Â\Ëy|…Ÿ²k\ä<{,Ÿ\Íf\î™\á±D2@¦Ó©\èÚ°b\á\ïĞ’\á³÷>-{,—]O®$’a\â\Ít¾–Pj¹¬$\ÊS24¢\â¹ú2Ğª,\çı>‰ª\ïZeùz½v\ÏAÈ€A®¯V+gmU–s‘h¡z1±ª.¿¹¹q\ÏAÈ°\åeËˆ *\Ëyñ,\Ñ\ì³z1±\Êò×¯_»\ç dÀÀx¸\ê¬Mù÷\ßÿ\0‰b	Pt\0\0\0\0IEND®B`‚','image/png'),(6,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0x\0\0\0u¢ùo\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0\Î\ÜIDATx^\äıõ³\\g‚\æú¿\Ø\Ø\é\é*³,¼\Ì\Ì\Ì\É\Ìpó\æeff¾WW\Ì\Ì,Yd,Ù–%Ù²\ÌlK[®‰xöyS®©\ê\êşn\ì\ÆF\Ïw¦\ë‡7N\æI\Îüœ\åKÏ\ÜÇ³§?â·§?ÁsùÙƒ3~{ö„\ã)\Ç3\ßş¸ü=s<û\í)r<|ö?şô\r¾şô*\îŞ¹ŒOoŸã¸„Oo]\Æ\í§póı“¸q\í0n\\Ş‹.\î\Âõ{pı\â!\\;W/\ì\Ç\åó»p\é\Ü6\\>»—\ÎlÃ¥S›86\à“p\áø:\\<²ç­\å˜Ç¹Ã‹8{p\Zo\ÂÛ‡¦pš—OœÁÁ½³Øµe³óC\è™…£µR{3ŠŒ5\ÈW\Ô ±ÈŒ$\Ä\"#\âòuH\ÌS#*W°,	\"\Ò\Ê›XŠ°ø,„F\ç#\"*\Ñ\Ù	\çKG`D2|\"\Ó\áŸ\à8ø¦À/0\r~A¼’„\àÀ‡\' (2Aqˆ‹\ÉArJ23Š‘—[†œ\Üd\æ¥!\'+¹\é…\È\Î\ÈFvr62“³™ZŒ´”l$\'$\")>\ÉQqˆ‰JDthÂ‚£\êU~~ğZŸ¡ğõò…O\0|¼±b…7–,[×–¾…\×\Ş\\‰—\ßXŠ?¿²\n¯şi9şû\ËK9–q,Ç¿¾¼’cşôúR\Ş\Ço¼µ\ËWy! 2\ÑÙ‰H,HClj\n\"ùšq	)Œ\n\åw–…A‰¨\ØXøû#$$\áQAˆC&ï“™›yY1Z;\İø\ËóGø\í·?Y\ã\Ùoğü\é¯øüöQlh\ÆKÏŸ>\âg/¦¿qúo\Çÿo\0¾¸Ÿx\Ì#<\å=ø\åüp÷\"¾øø,¾¸õ6¾ø\à\î~tŸ\Ü8ŠO®\ÇÍ«Gp\ëò>\Üzwn¾»^Ü‡.\ìÅw÷\áı‹\Ûñ\áùms®\ÄNo\Âõ3[ğŞ™M¸zz®X\Ä{§\çñş‰¼l=®ŸÁ•£3¸zd—\à\â¡	œ98‰{\'°¸yƒs«\á\î€\Êİ‰“)#’eVdI\È*·!¾P8\Â—©Dbº\É\éE\ÈHQ\"-S†¸´L\Ä$ &%1±9ˆ\ÉDHt\"\Â\Ã9\rKC\0óN€wH\"‚ƒ£–Œ\ÈTDò¾ñI\Ù|<!Ë–£$¿ò\"T\År¨KP•J –ª *WBY\"…¼ Ò¼B\Èódæ–¢85ù)™\ÈO\ÈBjb4’¢£‘\Z\Ï\çN„oX$‚}\"@ƒü\Ã\Ê	//o¬ZµË–­\Ä¯-\ÇË¯¾?¼W^~¯\Âù\Ókø\ï~\r/ÿ\ëüËŸ—\á\å?/Á\Ëô\Ï\Ë\îJ„&F\"© ‹cüƒ\á\ïµ\n\Ş>ğñ\rB±<:§a\ÑÁñATP\"\"¢…ô¸\ä\å¥@*-FwK?ø\ï\0ô°ñô\î\Ü:„\r\Ó\rx\é\ÙSBóoğÜ‘7z.ÿ\İğÀô÷\ãû\Ç!\î#@}L\0\Æ/>\Ç÷_\\Â··\Ï\àË›7N\ãî“ø\äÃ£¸}\ín_Ù…®\î\ÅGTÁ›\ï\ì\Â\r›T\Ã[y0~ø\Î|xa7>8¿	\ïŸÛ„\ç6rº… n$‹xÿônœXk§\×\à½Sò\ä\Ç.Ÿ\ZÅ¥\ãÓ¸pt\Çö\ÏaÏ\í˜X·u=C\ĞT5£\ĞP‰<¹\ÚJd–i‘’«ER¾‰™%:\ä•\ëQP®A¡L‰\Ü2)2r¨\\©\n$§)‘”\\B8s‘˜\Ë\"™\nH*aDD\"Bb\Ó—…h\Ä\ä\\$¥\ä\"-­9\Ùy(.(‡TBø¤\n\n˜tr\Øuj8u:˜JX5:\Ø4fX*˜dj\ÈÊ‹¡*,„¢@Ya	Js‹‘’†Œ\ØD$\Ä\'!1†Šƒ˜\Ğ D†E#.,aQó€·ÿr,_@UóÁë¯¼EÀÛ›„ï•¥øW÷¯\ÓUñ-\Â\é‹Wÿu^^ò^÷öò\0˜›—…H>¿—_üı±\Ê?\Ş\ŞA*%0;uˆO@xp,_7\ÑQ)ˆOˆCVf*J\nòP.+GS»¿?ÿ+W7„¨=}ˆOo\Â\Æ\éZøDÀ\" °ı ¿B\Ñş~ü#pÿÁxúœƒ6üô~}x?{?\Ü9\ïn\ÅW7\ã.\á»ó\Çõ#ø\äú*\á>\Ü&„Ÿ\\=ˆ9ıøò|rin_Ú\Ûò\ÇG\ïl¤:n\ÅG·à£³kqó\ìz\Ü8»\İ\È\é:\\;·\ZïŸšÇ‡\'§ñÁ©9\\;3+§§ğ\î±œ>¾ˆ6cbq#\êºGaiê„¦¦\å\Ö\Z\ê\ÜÈ•\éS¤CA©j=d\Z=ôL;´V;¤r=J\nË©^j\çË‘—¥DFj!R“	X&m5\r‰ñ©HŠ\ÍFtÁŒODL|2m‰ğÀ‚¼2HÊ¥Ğª\í0\ÌÎ€z«\rµ®\nÔ¹\ìh²;P\ë0¡\ŞÂ©Y‡\Z“UZ*œ\Z\rœJ=\ìR	ôüq%YY\È\ÍL@QF\"²\ÓS•€¬¤d¾—X*P\"!ELX9Œ–\ì‡\åoy\ã\ÍW—\âµW—\áÏ¯®Â¿¼ş\í—\Ğı\é-ü\é\ÏoĞ‚i\Å^J{~~s	^]ºKü}\áK\àV®ô‡×ª@Š©—Vy@¦.­BN\àb\Zˆ¨ˆ\ÄsÁK%€¹9\É\È\ÏÏ‚Dš\Ö\æ:Zğ\ß)\à\ãÙ³‡xò\ìW|rk69€\Õ_!üÿc<ı›M?£¥?~ò1\îı|	\ß~ÁW\ÇWÃ—£Á\İö\âÎ]´\äİËŸ|p€p\îÃ§\ï\ï\Å]\Âù\éÎ»¶‹j¹j¹ nÇK9\ÖÓ²©ˆ—7\ãöÅµ¸}nnœ_M	\å>|{†\nùÂ’O\\À\æ]1´¸mS³pQmU\ĞW4CniE™Á2a#t\Æ*\'*İµ¨­jDeu=\ìNŒ\Öj˜\ÌV˜ôz\è£´\\‡\Ò\ÒRH‹KP^¨@^¦„ •\"‰y1!1)i\Å\È\È(#°*‚\'§\Ú\é\á$Pn£µvš]VtV× »¾õ5\è¨r£\Õ\åòŒ&w%\Z+õh¬Ğ¢\ÑfAµMZ‹5œ²R‹s )b+\ä]\r	m²4\'…YQ(J\'qÁHˆ¡52¯…$\ïşXB_~ƒ€Qışô\ZÁ{\åø‡2¾üÚ›œG«f|•*ù\Êòex\íu‚»\Ä¯¿±Šy\Ò>\ËB\á\ã\ï…N\Å\ïCÊ…+‘\á‘!Ì¨±HIOBNF2\nóó!/)Dk[-\â\ß(¢Ş¯øô\Æ~lwÿ\çø\ä\É\×xôóe\Üûò4~ú\â¾½{_\ß\æøˆ ~t„Šx”\Ùğ >¿¹ö¼_\Ü\àô#N?Ú‹¯n\í\æt3\ã|ö\á|ñş.f\È\İøòúN|q}>o\î^Û‰O¯o¦zn!œkñ	¡üøò|ti-‹\Í\ZZñNY‹\Û7abıV\ÔOÎ£²¥\Ö\ÆN*[`t5Áàª†\ÕİŒ\ÚúN4¶u ½£\è\è\îEW{\Ú[{QW×€ªŠJ8.¸l•p3R)W 8¯œ–P™\n•_ˆü)!\ÕB¯§šŒ¨²9Q\çp¢©Ê†\ÆôRF\Ú;0\ØÑŒ¡\æ\Zô6º\Ñ\İ\àFg­5\è¨vò²“S;\Ú\Ü&´8\í¨3™Qk\ÔÀN\íªR˜\Êó )+„®8ª¢$h\n3¡\ÌL†<9\ZÙ‰Q´\çHD\Ñ6}|°lyˆ$¡‚¯0\ë	\Øşõ_	üóŸ¼x}a\\A›^Š7—-c¶AXD F|‚‚\Ì\ì\ç\ã	\ïÀpÄ¦\Ä !9¡\Â\ê£ÂÅ…/É™i\È\Ê(A~\ßGY\Ú\Ú€ÿ^£ş\Ær{GXğXõ€7=}‚\'¿Ã“û7ñ\à»sø\åË“øñ3»§ğ\Ã\í\ãøş\Öa|y\ç\0<Œ¯yù«\Ûq÷“]¼¾\ß|\ß~|€Š)n\ß\Ç\Ë{ñ\Í\Ç{ğ¥û\ë\Û{xy/¾½±‡\0o#°\Ûñù\r¶\ã\Ó¶\ÊM¸{u\î\\YK\Ë^K\Ç\Æ\ë00?\éI´Á\Ñ\Ğ[]\\\rmhj\î@wG\'û1>9†©™\Ì\Ï\Îbfzc#£\è\ï\éCOW7\ïÓ…¦&´45¢ªº\n®Š\n˜©Œ6\æI“\Ú5Õ±¬LµB³\Î»µ5´×†J\ÕP¡–&Œ´¶a´»\rİ­˜jk\ÆHa¤Z6\Ö`j\Ø\Û\è\à´ƒuõ¨w£«†Pº,huQO›v\Ûdp\ëiÍªb˜e°Ê²a)Ï„F’=\ÕQ…’\Ô8dÄ…#‘\í5\ÈÏŸ­8¯¿\é…\×_÷\Âk¯P\r_YA5¤\âºÿöòü·×¼_d\ÂWW@_«¤\ç§Aª*£\âÉ¡1) )\ÍCIy!b£Y|B‚‘\È\â‘À\ËiÉ‰\ÈJLBFz*r³\ÒPÊ¬*—e £ƒ%\ä·__¬IñÀ\'ò {{\Æ\Óg÷\àaltş\çøô\é/xò\àc<úñ\Üÿö4!<_¾8F9\î\Ä÷Ÿ\ÆŸÁ÷wP\â»O°5ÀŸ\Â\Ïw\á»;ñ\í§{8/\ïw÷qûw	)\çıø	\ç\ßŞ\ïo\ï$˜\Ûñ\Õ\Í\íøúÃ´ù´ô\røø\Ò\"\ŞfAY¿c\Æ\×,b`qu]ı¨mDu[/úG\Ç0½°\Z«×®ÁšõX·†\Ó\ÅE¬^³€…5SXœ›\Ã\Â\ì8¦\Æ	\çğ†{º\Ñ\ÛÕ†\Ş\ŞBÙŠ¶¶4\×Õ¡\Æ\Ù\0‹Á\n»\ÉAH¨qT¼zt\Ôñ¾m¨³]}˜\ì\ë\ÅT7¦z;1\İİÉ6Œ·\Õa¼¥ªØ†B:\ÖÜ€‘úZÑ¢fO-Õ±Æ\æJ¡\ÍÌ‘•f%ªÔ¥p«\ËXdJh\Ï°PyŒ±¦E 7>IQòCÀª`,[JøŞ¢\â½\æ…W^õb3^?½úş…-ù\Õÿ.VÇ¼‰W^[\Ê&¼\n^K\á\ï \Ğp¬0\Úm4RY|\âS²•• ÀP$\'¥\"->\é)\É\ÈLIa\äHAi¡•Áh\Ğah¤Ïÿ\â±\ÜSfyùÙ³Ÿğg\ë\ä²Šñ”ô?}ò\rß¿L/\à\áwo\ã\×o\Î\à—¯N\â§/\â\Ç/\âşg\'8xı‹\ãø\áó£„ô~şü8m›j\Éûüğ\äø\éó\Ãøù\Ë¸\Çû\Üÿ|?İ‡Ÿ¿Ø‡_>\Û\ÅË„ğÇ­}ø\æ\Âøñ6|÷\Ñf\ÉM8w~6oÛˆñ\Í[\Ğ82Œ\ÖÁq¸Úº\Ñ>0€mÛ·cß¡c\Øsh7v\îÙ†=\Û7b÷®M\Ø\Ã\Ë;·o\Å\Î-±y\ÍZ¬\Â\ÂT?\ægF±85…É‰	Lb°«Í´\×j\ÚeZkj9ª	^zZ1\ÜÜŠÑ®L¾>Lb¶Ÿ\Ï38ˆ©\á~\Ì\èIª\ádw&¤mÀFŒÀ±ú*6UBz\ë\è¢%w8\Íh±±\ÄX\äK®5KP¥/‚K‘…\ni:l\Å\é\Ğf\' 81Y\Ñl©Á!ğeyX¶Ò›x)^g!yù5¶\âWÿ$V\Å0ŠBòòkxõ/ºo¾ùÿ`„ry!\"\Ğ\Ç¤«Éˆ,	£•.-9,@\Ù\é±\Èc)*\ÉMƒJWŠŠ*;\Æ[ñ\Û\ï?ı\r>>Àsg¿ı„\él\ç\êÿó|\Æöô;<~t\r\ï]\Â\ã\ï\Ï\Â3xğı\"\Şÿ\êA;‚_¿>\Î\Ë\'=\×ıú\î\Í\Ë\ßÂ¯œ÷Ë—bz\Ğ3~ù\æ|u¾<ˆû_Ä½¯9ıŠ~¹\0S?£\"~F	\à·h\Én\Å\Õs›°°cl\Zm\ã“h\è…£©sókp\êüI\\¸ro_8Ó§\ã\ÔÉ½8yò N?„£ûw\áĞ-Ø³i=v®[ƒT\Çõó³XOk^=7‰ù±1uÓ¾[\Ñ\×Ş‚!ªao}ÁkÀP{;†;{0\Õİ\éşa\Ìõº!\Ì\rb–\àÍ\rbnt„óû1;À\ÑÛƒÙŞ¿#k«\ÇdC&›\ê	q5ú›\Ü\è¥÷¸+\Ğ^aD³Sf»\rV	ó¡\Õ:	*”¹p–•AW˜Iz\Z\n\â˜\ÍBb=n%|ı\Íxm\É2¼üúO!y™\ä\ÏÿıM\Ï\Ê\èÿ\ç\ËTC\Úò«/ó~K–À\Ë\Û¾FXx \"Cƒw«\r\ã3\Ğk\äT¾D\ä\äf°|”B/gQ²*	 #C\ÍxşütÿBfÀgÂ‚oÂ–\é¦ÿ\0òEŸ>ûYğ&>xî¿ƒ\'?Ç“\ï\ß&„§ñ\à\ÛSÌ‡§	¥g¨‡8=ßœ¥broø\Õa\Üû†\0~}ˆPÀB÷\è›Ã¼~„—9ıŠó	\ä=ª\äÏŸ\ï\Å/ŸÁOwwÑwã››;pıò>Ì­]‡¾™yÔ¾A¸ZÛ±c\×|ğñ-|ø\ÉM¼÷ş\\z\çm¼{\á,ÎŸ?B÷\ãøÁı8@5Ü·y#ö¬_m«°en–\n8‰\ÙñQLbˆ\n8N+\ê\í§\Òuc¼£‡c\0Se£\âõ\ra‘™s5_wntk†0?:\Èy˜#„‹C\Ê\ÌÀÁ.Lõuaš?\ŞÕ„‰\Ö:L´\Ô272ÒŠ‡j\ê\Ğ]\ÍLXmF›K‹³\n\rv\ê­\å¨1\æ ZS‚\nfAcQ\Z\ä9\É(HB:Ë‚È\Ş+ı˜\ïüñÚ›¾x•*ø*•\îÏœş\Ë\ËKñ\ß\ŞX\Âò*şû+¯\ã•7BğÆ²\0¬ò¡ 4\Ø\á¡!ˆdLHD\ëh6ì™„\Ö$Gz6›o^\n\n¡U\Éa6)\á4™ }c\Íü\íü€(\à§¿\İ\ÃİO`ó\ÌFş‡ñÀoğôñ-<~p\r\î]Á\ã{\çğğ§“\ìşH5ûş/¿‡?pş÷\'=óıp~:\Ï)ü\æ\î”0ò¶¯\á•ğ‘P\Âo{€ıõ\Û\ÃTLBH0\ï}µ›s\'mù my\'¾»µW\ÎoÁ&\Ú\é\à\Úõhƒµ©M,§ÎÃ§_}‰O\ï\ŞÁG]\Ç{\×\ŞÁ¥wOã³\'q\æ\ØA;´‡wo\Âş-‹Øµn[™\×1®\',£\ï\ë\Ç­u–0M÷t±X´\Æv\Â8L\Õ\ë\Å\Ì`/F°n|\ë|nal\0#qkh\á‹#X¤2.\È\áN\ÌÓ¢gú:0\Ñ×‚*ê˜°\äV‘+0Ä–\ÜWeA/[r{…™v¬e9‘¢\ÙJM\å¨3H\àRÁ\"Éƒ\"?ElÅ¹11	ƒ¿wVˆ•\ÒÌ¯¿¾\Â3„ÿ\Ë¢Œ¼Iõ£²%ÿ\éu±	Ï‹\0†\"8<˜(Â—Š¸”$Œ.Œa\Ïşu°\Ù\Ô\ÈÉ—AZT¢&½\Z6tK…\Z®J+Zğ\ÛóŸÿ\'xSBÑ‚\â\î­\ã\Ø0a\ÅK\ßÿğ~üñSüôó§ø\á\Ş\çøñŞ—øùşWøñ—/ñÓ½oxùk\Ü{ğ\r\îÿú=\ì>\î?ü¿>¹b<~ˆ{x®?~ú+\Çc<–\Ëñ\ä\é#<bş{ôô!>ş}ûn\á\×\ïs\\\Æı{\çñÀ3\Î\â\áısœŠÁŒx\ï\"!½†Ç¿~€G¿^\Å\ã_®\âÁO„ô‡ô(Ñª\ÅôÁğ{\Â÷£\0s?\ç\ï÷(\â¯Ì„÷iÇ¿~¾>İŸ>Ù¯n\Ã\æ]pX=K]º¨HW®]\ÆW\ß}»_\ÜÆ­\Û\×pıúª\à)\\8so=„“û÷\â\È\î­8´m{\×\Ï`\Ç\â,\ÖNc~¤Ó´\Ñ1ª\×ô0­”\×gú;1\ÓË‚1\ÔK{%T„n‘gı\ä\Ö13®›œÀ†ñq¬› \Z`…F¨ßºÁ¬%Ì‹rÀ\Î\r2ô°œ\Ôcª³	\ã\íµ,(,%,!ıU\è©\Òq\Ğ]i\"€F´\ÄV\Ød•¡\Ê\\Š*m)\Òl\è˜Kò\ÒQ@\0cƒ¢\àŸeAX¾\Ä¯/[W—z\ãÏ¯/\Åÿ\ãõ?\ã\å?½\É\èM|\rzk^£zû†\"<$\0QQQHŠ‰B[uJr\n\Æ\Öcï‰­°¹l(*)‚F£!xz\è*˜L,aV\Ü\rvĞ‚E|±òù¯«a^\\¾;·	\àl^ú\å\ç\Ûøù\ŞMüü+Ç½[\îC‚\'\Æ\rBx\ßqúıı\ç-ütÿ3üôPŒ»øù\á\ç„\ï[‚u¿>ş‰0şˆ‡O\î\á!_\à\Ñ3‚\Ê\Ü÷\Ó\Ó/ğ\Õı¸û\íE\Üùü,n\İz|tœ\ã®}p\×\Ş?Šk7\âú‡\Çy\ã\Ã\Ãøğ\æqÜ¼s_ıø	¾ø\é.¾  7?½Àù§ğÑ‡Gqãƒƒøğ\Ã}ø\àƒ=ø\èú~Nw\á\Æ\r^şhn\Ş<ˆ;|¾Oo\ì\Æ¶`±rû&3\à¥wvb-\ËD\ç\Üjû`©\é\Æ\è\ìj|øñøú\Û\Ïğ\Ù\ç·ø…¼®]À\Å\'p\á\ÄAœ¥ú:´\ÇYFm^‡½k©€³„hr\0«©d3EX\ç\Â\Ø(-u3jgõx?Ö³1¯\Ã\Ú\éYl˜šÆ†™l\à\å\ã3X7\ÆûŒŒ`õ\Ğ•¯kF§±0Lø\î\ì m˜™p¦—–\Ş\Åü\×\Õ\Ì<X\í±\à\Ñ:ú*0PmEO\r\İ}•#UP‰&›5UF	qI\Ôù¹\ÈKAFH$‚h§bk\Æò~X²t%\ŞX\âC;^‚W^y¯şy\á£%³Œ¼üúÌ‰\Ë\á\åãƒ¨ğ\0$\Ä#-6Yñ\ÉHÎ•`f\ã$¼½un\èõJŒJ˜\Ì@\Ì¬Œ\î\Êj*`Aû\î?\0Bõ\ìG·M\Øğ’g»\ío¢(ğF*\Ø_ë²¸üÿiüõ~ÿ‘\íz/úŒªø˜\ÏûğÉTN¡¦\ß\â—_¾\ÆÏ¿\âŸ\ïRy¿À?\ŞÁw\ßüğ1¾!t\ßÿp—÷ù–\íù)ô)„»¸u\çU\ê4nŞ¾€o_\Ä\Í§ğ\áû‡pù½}x\ïò\\}w\Ş}w.ßŠ‹g7\àü™µ8÷öz¼}r\r\î\æ¶n@\Ïüj¶\ß>T¶\Ó\î6l\àó\\Ç·\ß\Ü\Å×Ÿ\ß&¬Wğş»gp\äô\Ñ=T¿­8±c=oY‹ıkf±“ğn™\Æ&ª\Ø\Z\Ú\êjf¡µq\İ\Õlp˜\ê5:Œ¸N(\İ\è$\Õošc›§§°™¹q/¯g¡\â\r`-x*9O%\\\0sŞŒ°\înfÈ‰n¶\áözŒ6Uc¸\Ş\Í6\\‰~¶\á>Zğ\0GŸË‚n—\Z]Nš-24\Ø\äÌ‚%pk\ÅúÁBh‹3P–“€´¤8„ˆMs,#\ËV2\ãù\â­7XH\Û+¯½Š]ò\í÷\ÏøWÏo\àõ\×^\Ç\n_D„ 1.\n‰‘\ÈJKB^a)\Ö\í]ƒ#\çw££‡E\Ä(É¨ „Zt2\Ø\Ô\Z8\í68«œ\èn\Ã\Óß¿cûÃ†+¿=dş{€\ßYB¾¸y[\Æ*\à\Ó\ßÿ\0‡wx\Ê<øÿ\íø¿\Ü6ü\Ç|\Ş\çù{Ïˆõ›Š\Ûx?ÏŒ§b¡x¼¸ş?Ÿ‹\ã7Şy*\îÃŒ*lş)Ÿû\ÅõG´úÇ„ü?¾G~Áƒ´û{_\áş/\"V\î\ï>\Å\ÍÏ¯aã¾½hA]\ß4jz™\ã¶lÁÍ\ßÃ—´\ß\Ï\ï^Ã­÷\Ï\â\ÊÙ£8t7N¾\Ã\Û\×\ã\à\Æ5Ø·†\Ö;?\É\Æ6Šc„Kd¶‘~Øµ\ãXKWPÕ¨f«i¡\ëX8Ö±m¯§\Úm§ú\Ñ~7\Î%$ˆ“TÁ9>nŠ*J+¦.÷aaD¨§hÄƒl\Ã]§û„¥7bŠmx¤‰\Ü\Ü@®\Ä`ƒµNV\Ù1\Ä<\Ø\í’3ªÙŠYHleh°HP\Å2\à\ĞJ`–eBU”Š‚”TÄ„\ÇÁ\Ë/\0ú\âõÌKV\à\Ïo®\Âk¢Œ¼\á\ëY/øgøÊ«Kğæ’·°\Ü/\0aAHLˆEvb²’Yj\ÊË°\å\èN\\»û.&\çg`0i Ò—CaÌ‡\Î\Äü§\×ÁÁl\è¬2£w¸•ğ‡?\ÔO\ä@1\Äf8\nUğ³Oóûø\Ï\Øü¿\Ùx\Æñ#?ğógYB¶¡a`\nU­T®\ÍÛ¨¦\×ñõ·ğÕ\ë¸ù\Ş\Ûx\çôÁğ\í\\ƒT¾=\ë&±cnÛ¦‡©`£XOû\\;Ú‹µ#,BY>h5«8\íPöaó(mzbi½›=c[§\æ°uz6Lø&f˜#\'YH\Æ<qqh‚ywc5‹‘Èó½,#=}˜\êoe©iÀ¸\Øt\ÇF\Ü\ß\èB\r\á\ã`\Ó\ìw\Û\ÑQ©AW…v+T A¬ 6—\Ãm”\Ã.Ïƒ¦0¹IH‰¦\nú‡c\Å*o,[\ÊF\Ì2ò\ê?¼úú›l¾,$o¼E5\\…7^[ŠW–¯‚—·/¢#B\ì\ä8\ä\ç \ÔhÂ¹O\ŞÃ\Ìpsk§¡¥ıª\rE\Ğj¥0kÕ°j°9ô¨u;0B\'xöû}ê½°\ß? @2¢İ¹}”¥ı¿>€büHu\Ü{\îmŒ®ß‰\Ê\Î¸\Û:°y\çfÜ¸yŸş1ó\È{ø\è2\Û\ï‰}8¾\Õo#ö­ŸÆ®¹il›Ä–™!l\"„\ë	Öš\É–†~\ÌR¥\æûº<\à‰\â0Ë±H%\ÛH‹\İ01-S\Ø<AÛ¥úmš›\çtKüœ§¬e!Y3&¬|’03+Q\r=\ë	ö`7al\Ç,[õlw&;ÅºÀ\Z7Ua°á¾–\àÕ˜\Ñ_kc®@Û†.·.ZfZ±\Zu¢S‘*´Å°IJ!a‰OGD`Vø‡\ÂP¼µ\Ì¯¾\áMøV\á•7}9}¯Š½d^\çõ\ålÁ«¼I\0“©€\å9Ù•K¡«®Æû_\â\Ş\ï°@g\ĞXT\Ğ˜ıtZX\r˜¬Z˜f\ÔU»\Ñ?\ÔMü\å\ßø„¿‡X\rs‡y}\Ó$3\àu\0ÅÙ¿°¹~	\İ\ál\ëEM[7¶\î\Ü\ÆBswn]\Â\']\Æ{\Ì\çOÀ\É\Ã[qd\ë\Z\ì_$€cØ¾z\Û\æ\'°ev›¦¨€\ãBû±†eas\ßj~Ñ«\ÙZ×²\r¯§ª­Ÿ!„S\Ø46Cà¦±•\Ğ	\Ş43‡-XC\0\×¼E€#£´m‚=@d©Y=\Ò\Ã\ç\ì\ÇBgÎš\éh\Âd[s`F\ZYFØ†ª,\"vtV\Û\Ñ]E]¼\ìÒ¡É¥Gƒ“Ã¢D½Y´b9Œ\ê\\(\ns‘‘„ˆ\È(\æÀ`,]\éCôÂ’×½=;(¼L_¦ú½ù*\Ûñ+\Ëğ&!V„œ¬T(J2¡”\å\ÃV\ëÆ­û_\á‡\ç?cq\ÃjM\rJ=s †yP‹U—‹\ÊHóß‹mÁÏ¨x]\r#,ù9#Ó§·`\ã43\à}~\Âfş\'¯_Á\à\Â\"jisµ\íØ±g>¸~So°ı^»xO\ìÁ\é;pd\ÇF\Ú\Âü·a\n»\×\Ï`\'a\Ü>O˜f§ù¥\rc\ã$qœ™pdœ002Šù„»…c+3 °\Şm3kh\Ãs„w†`N{@\İ8Jø¨”\ëiÁ\ë\àú±	N\Å\åa\Éf\Ì2² ¶Ğ‚g;	`K5¦\Ø:\'\ê«0\Ìö\ÛK\0»	`oµ}TÀş\n;\Ú\Z4ThQg×¢Q¬¤W[¨H\ÚhŠ\ÊiÃ™ˆ†Ÿo\0\Ğo.õÁBøú’exM¨\à>ñ\Úo°!¯À²U~HˆŠEqq6ôey\ĞI\Ëa¯k\Â\íŸ?\Çª\Ú\Ü\æu0š	 Q£^³A\r“š\0\Ú4¨t[¨€Mxöü¯‡xü\r@QB„zûÖºdy\Ì/\ì\Êİ°°k\'j{úQ\×ÜŠ];¶\âúµ‹¸qı>¸rW\Ï÷Xğ¹C\ÛhÃ›px÷zÙ¾‡7.b\ï&B¸0®™§%SE«ód½\r\Ø41Fğ”X\×\Ç\éf\Ú\ïªŞ–\é\Õ\Ø\"Š\Ç\Ûó\ä6Œ½€M¬÷\ÛÀyi×›\Ä*\Zñ8>\ßz‘1G±0Øƒ¹\Şf\Ìt6`¦¥‘E¤\Zc´\à>Zğ`¥\nhò\ì \Ğ[Yn‡\ív*Ÿ\Ê\çĞ¢\Éf@­SZ³\Z.u,ù™9ˆA`H8Vúcù2±m˜¥\ã­%xğOb…ô\æ¿\×\ß\â|f@\ÚtJ|JK˜ñJJa,/EuG;¾xü>Š…ua¢\Í¨zfa¿:,TD‡M‡J—ƒT@aÁÿv5\ÌSBøû\Ó{¸ıñ~¬Ÿú_°3\Âÿ\İC4mÑ–?ú\æ\ÌlŞ‰š–nT74b\ç\ÎM¸võ4\ÇY|ğ\îI\\;w\ïœ:Œ‡v\â\í#;q\êÀvœÙ»\rGwo\Ä\Ñ]l\Ä[Wc\ß\Æ\ì]3‡\İl\Å;gÇ©n´\æ™1l%€“c\ØDk\İH7±ñn™„\åcj5§´`QHx\ÛF+K\È\æi^Ÿ¢ªò²°hŞ¾i|„\Â\á^Zr;\æú\Z1\İQ\é?6\Ç\r5¸\Ù~-¤\Åu»M„ÏŠ®Jºh»m\Z	_£\Ø>\ÌQC5l •jL²”\æ!))	ÁAÁƒ™V­ô\Ã\Òx]\ìMøşü:a|\Ã\Ëc\Ão,şÁÁ\È\ÍL…²´:yÌ“U\Íøò\á}~Ÿ°¸v\r\ÌÌœF#‡™*\ÈFl3›a³\è\àt\Ñ\Û\ÓB\0\ïı;\0Ÿ‰LH¼}û0Bò_¾„ü†\Ç\\b?ÿ\å¬?¸\î\Ö^8\ë±sûz\\y÷³\ß	\\9\Ï\Ây¶\à‹\'\à\Âñ8|/\ÎÛ3‡w\à\ä^6\ã\ëØŒ\ç±\Ó<ö®ŸÅµsÌˆ3TD‰Ql¦ºm`¡€ma\Ş\Û1C\\X `TM-„qû4‹	ÇÙµ‹\Ø>;‡\Ísœ?Ed6\Ü2%TU¬\ì\Ã\â`-¸]5´\à&Œ‹ı\ë\î\İNB\'À³¢³\Â\ÆaF‡MVBP\Ï¿\ÖFû¥\×sZ\Ç,\è\Ò\Ê`‘@^˜…”\äX„„†À\Ç\'˜\nF¤³	¿ö\ÆJ¶a_Ï–‘\×\ŞXJk^ÿ egCWZFûÍ†AUŒ\Êö|ó\à3\Ü,®\ß‡\ÙƒYÃ¡€jhµZ`1\Ê\àd\ê\ën\"p\İ\\y†Xø+?»\Ç\Ü}\æş	2 X(>ü½§Ù„O£ªk--Ø¶uŞ½p\ï;Œs\'\Ûñ\İxû\Ôn\\<u\ï>Œ+o\Æ\å“ğ\î©C8wd7N\îÛ;	\â¶u8°‰j¸n»VSÁ\Ä:B–“-“\ÃT8BD ¶\ÎS%\ç\çjB¶\Ûg\ê4­›…dûô\Z\ìœ_s3\Ø\ÅL¹™M{\Õo\Ë4a\äólb1Y\Ë²(6\éu·³€4`´¹\r•è­«DW•‹ğU \ÍnF«Ã€;³³^E\ÊAÛ¥\n\Öq\Ô2‹U³¥V‹Wµ…Ğ”g\"/-\Ñ!ğõ\rb\Âò·YF¼©€+ş´”ü\æR,[ˆĞ°x”dŠõˆ90Ê‹aÑª\àh\nxP=Áš\Í\Û`µ\Ø9T@=ô:5¬jBh6Á\éb.\êd÷ı·\0Šƒ’ıvŸP7\ÌZÿ9\0\Ç)?~ú\çn_GıÀŒ\'L¯Û¸\Z\ç\Î\ì¥\ê¢\â\íÅ¹£»p\×\ß=wW\å\å3ñ\0ñôq¼{ü \ÎØƒ3ûö\âø\æ\Ã\í[¨„q=\Õp\ívÑ–w-P	\Ôö*\Ş\ê\ìX=]ó\ë±{‘j77OÅ›§m/¾l_$œ«WóöylŸ› M³ ÌŠMuÌˆ\Ã\ÃX¤“­i®§õÖ ·–ğÀ6·\Ğ\é\Ñ\Èº–e£9¯\ŞH\Û\å™¯–VXoÖ¢\ÚZ7óX5•\ÑÅ‚`P”¡(\'ñ‘!ô…\Ï\Ê,_\îK»eñXº¯-Y‰\×\ß›\çü±li \âCb KK‡±$\rJ9,:*[W¾y\ÄBñ\ä\Ön\Ú\n³\Å\n³\Õ\Ä\"ƒA£¤ı\êagştR™ûûÛ¨t\ßş;\0Ÿyr\à=|úñ1º‚øW\0\ÅN—>¿…Ö18k\ë0¿0…\Ó\ÇvSù„\Õ\îÁ…“ûñ®P½³q\émB\È\ËW\ß>Š«TÀwS\Ä\é\Ã{pb÷&-y3K\Ê\Æ\r8¸n­g;ñ\î\Åy\ì™_‹¬…\Õ\ØÍ±sp.¬\ã”\Ê7K(g8ª¸S€GX·2nd\Ù\"¶³9¯cK^Á\Ì@\Æz:1\ÜÖŠ®út\ÔÔ¢¥ª\Z5U´W\\z\ZB¡”Â¬`;U\ÊP©SÁmÒ¡\Ê`F•Q\ZÑ‚­T\Ù\Ôp[\ÕpP	U¥ù\ÈNJEhH40€\0®\ÂÒ¥«h¹bÛ°-ù-_2\Å\ÅÂšŸ·´uF5j\\j\Ôõw\ã\ë\'¿ò{}€\r[¶ÁnqÁ`PÂ¬)ƒU§\Ùf„Q@h7¢»» ‰ıÅª¡ÈB¶b\à\í#\Ø4óO°ğ™8\ÖYlş\ã\å\Ï\î}ƒ\Ñ\Í0\Õ\Ôc€óğá¸pb?.P\é.?«™/\Ãe^¾|ş„\'^8y˜¹ğ\ÎÙ‹3w\â\èŞ8¾im\Ü\ÌB²ˆ=kf°oq\rö®^K%¤Â­\åÔ£~B±sq=vÑ–w6aÁÛ˜\r·D‘7N‰\í\ÅX\ï\Ù<7ù\Ñq\Ìô\r`¤³\íµM,\ÕpZ+\á°a3¸™¹l,z(”FH‹%(\Í+A1³Œ`\é¤Å°«%¨Ô¨¨xJTšU¨b>s[	¥óL„UI\ÌLCLT¼¼iÁ\Ëi·´\àeo®Àò¥^X¶œ\å„ö›-\Õ\Ò-“ÁUF¸%:tPq»¨€/ltıúM03š¨¼FZ½A¥‚Ş¨\Îi€¹´gpĞ³;–\Ø\ìöb5Œxœ\ØüO~û™\nxˆyøŸ`Sœø\ĞOÛ¥Ÿ\âş\Ó_±\ë\ÄAØªš10Øã‡¶°½„\ï®_9ƒ¯a)9‰÷\Î!tûq\ê\è^œ<$ò\ß^œ\ÚOûİ½™ed+nX\Än–½l\ív÷3ŸP>‚¸g‘ó8Ö»w\Í\Z‚\È\èQ9Q2D\Óe9›Á†\á1¬›¤\ê\Íb×§F¦0\Ú?ŠÎ†N8Lu—šY$\È\Ç g\æ\"5¹©)%ˆO\ÉE|bc²›Š(*Urb6òÓŠPUY	U±.\rad©°hPi#6\ìTAE~6’\â\ã\á\ãŠ+Cñ\Æ\Ê`¼¹,K—b¥_\Âı\Ã!\ÉH…K\Ê\ç(g‰)’£®¶®U¢¿§Ÿ\ßÿ	©b³T}+Û·‘Ö¬\ÇQÓ‚u:9´V	\ÜN“\çû}úû7\0q\\ˆX÷\'ÔöË©˜÷ñ-QBªş\0|1\Äa\Ã\ç?zum\è\í\éÂ‰}[ñ‹\ÆG\×/\â\ã\ÛWqó\æE\\}÷mœ?q„\Ğ\íÂ±]\Ûp`û&Ø¶û\Å.Y„µ\Îa\çšY\ìX˜f‰˜ñ\Ø\ën\æ»\İ\ÂZ=\àÑŠy¿y‚È¦+VF\ï ò‰•\Ób\ï±3\Â\Æ!\Ú\íÀ4V\Ï`zh#=\Ãho\è\Ó\\‡‚|“\n…È°Ee!,*ƒ¥ >!iğ\nˆâˆoPü‚b\è\Ã ÿHD†\Æ!)&y\é™\ĞIŠ\áP\Ë3Y±\Ò\\§Q=Á\ÊI\ÉFô^ŒK#°ò­`¬ô\nDˆ0òc“\àIP\Ç\ÒQ)¡ú•\è\Ğ(3¡I®G_s®|rŸ=Äš\rkacû6jÊ¡Õ–C¯¢«™mv¸YB{ºñÜ³\ZF\ì‚/VHÿu¥ô/ø\Ë\Ó_p÷££\Ø0\ãú\çPÀ\'Æ—÷¾\Ç(­²w¨\Ç÷‹\Æ-±+\ÖûWp\áü)?q{©x;¶n\Ãæµ«±À‰\ã@6°µ®Ÿ™ds›z±£Á›\ë„X\È,\'Z\î\Ì,Û®XQ-š\ï¶ğİ	\æ=Mc|\Ñi¬#|ı\ã˜\ì\ÄhO?ºš»Q\åh†¤Äˆ„x\Â\ZĞ d&\Â?$~q\nJB`p¡‹E@`\Z\Âı2\à@ø¼c\á\ïK5ób©`«õ÷@°_,\"Â£›‘mq\ì\Z\Ü)\íXA\ÖÀ \ÎC^N.ƒÂ°r3\ßr,_\ài\ÆÉ‘\á\Ğ2c\Ê\ĞdT¢AR†bZ\ÔV´¨,è«ªÅ…«ğø·_1\Å|k7›¡\×j aK6¨°°ô8,Ì¨N;…{v\Åú·\0¾¸N¾y›\'ÿ\ì’ÿ¿Û¸ÿ\ä6\Û\Ë/hG˜ß¹p¯\\\Âö}±z\İfL­^\Äm`x=½C\è\éDWk·\ç`õ¾¶6Œtuc²³C#˜\Çtc\Ã\Ø63\Ãm¦Š¶³Tl\ç\å-S\Â~7b\Ë\äj¬§\Å.ŒcğMSñF:ú\ÑQ\Û«¡\Z™HŠLB|x:BB’\Z(F‚\ã	_,¢\Â\Ó•†”¸|d&!\'MŠü¡d©\ÈO\ÉAzr£¨\Ğ„‡E .*	E0HòPM‹t³HTŠâ¢ $\'ƒ\nŠ\å\Şbeô2fÁ•ˆñ$\'N9s£JMŠ¸K\nP«0£CgE·Ã†]w\ã–‰\Å5B­P\ë¥0ñù&-¬„\Ï\É\"bwk18\Ğ@\ØXX<Àıµ„ˆ(®‹rò?‘şu<\á—wøò)\r\â8\í÷\Ô\éSØ¸u+:úFQ\Û<Œ\Ê\Ö.¸¨J¶º.\\­\é\\(-6¡¸\Ô\0‰T\ã)5ö\Z´V5 «@¶uc– ®™ğ\ì¸J·‰°mÁÆ‰\Õrk\'g1?2‰ù>*_\ç †[º\ÑV\İ§®²²’K‘…ø\Èd„$Ä„d!64	\É\ÌxY)ù(\Í*†‚j¦’\êa©`‘\é`*S{N`¤+.´DiQŠsŠ›]„ô”$¤\Æ\'\"7-\ê¢B\Ø\Åp\ê\åT\Â\ØT2Hs\Å&\ìŒ\ål¼¾>A\ÈH‡Q\"…«°U\åR4ªh—\ÃY’f‰]–\Zô˜X»v\ß>ú3«\ç`µ™XD4°0[\ZMf˜­zT\Ø9ª°ù½a0ó‰\"Ú³\à\ë€Ÿ\Ü:ÀüO”ÿ:ğ9uõ]\r\âÄ‰=X¿y:G¡u6@i¬ƒ\Â\\¥­	\å–¤I\ÍHLW 21ñH`6\ËÊ ¼˜yGeF¥Ñ¦J7úš\Ú0\Ù%ö\r\ÆÚ1\æ;¶[f¼ƒ³XËœ·04‰\é\ŞL´õc ¦-8\ÕNÂ£Fyzr’ò‘‘˜FE+@nb\n\ãsPššy1­­\\›\\‡\n•‰C\Ïba£B\é\àVs±ƒ\ÙË© úH%0–+Ø†5”f£$?\å…iµ„ªW—V‡j½.e1\Ô%¹ˆ†·—h\Â^ğ\re£Î†UV†Ji9\Zj\Ôé•¨\Ñ£º¸€ùÏˆ¾\Ê\Z\Ú+°89\Éó\æ\Ù\ì]+,l\ÛZª \0\Ğn5Án·²\äi\Ñ=ø\âÀô\Ê\'”P¨ \Ès±S\ê/¸ıñlø_qX\æÿnC¬Å¿úÉ‡™\ZÆ}\Û\Ñ\Å\æi¨ª‡\ÔJ+”W K{2U)’M3&¦¡‘ùŠ\È@PX*\ÂC³“´¤\\SideX449Ä©5Z1\ÜÑ…‰\ÎnLwĞ¢\ÛG0\ß.¦½˜ â°\İVµ¢\ÓQ‡F}%lR#\ÕOI~9\ä¹eP\æ\åA‘We>GÁ“\ÈaUi©’\Â>¨2\ØQeg\Î2$Nu,„\Ğ!V\0+\ä°)K	šv•&U,T0‹\\\î)\"NUM¯G\r‹…K-FRÂ¢“À&\Ë\è‡\Ğ\àpÈŠs¸@Á)S¢Yk@‹\ÅÌ¡Gmy>:\äv»š	`%\Ö\ÌÀ‡e«²²Â“Åª“Y«‘jh\ã{v™\Ğ\×\ß÷øâœ“ğ“3\Ø2÷O˜Ÿñ3~úı\×Àüúµ¨ll\Ú\äF™Ì‚\ÂB%ŠT\È\ÏV\";«ii\ÅHŠ/ 5f#6<\áÁY	\Í@lX:\âR–œO;SÁ¦µ¢\ÉR…6wúj›0TßŠ11­iA/\çuº\ë\Ğe«B£\Ù\r·\Ş\0­S_X]Q1ô9e0\äH \Ë/!·&ZªÕ£zVT\êm¨6»Pgu¢\ŞlAÙ„\ZƒUT´JB\æ MŠ\Öj—HP!€\ÊE \\V[µ\nº¸O¯\"„*\'[«,©´\éÀ h,_\áM\0SP”V\0y|\Z…r\Ôk\ìh·V \İ\å@‹N‹V©ı†ÜµØ°e~`ƒ£\Ò›\Ø_c„•Š\ç\Ô$°\Â\åb†À\ÓÿyT\ÜûŠ\İñŸ¿°\à\ÛÅ¶\éBÇ|ş\İ\×Ì€\Ã¤4wu\ÂE0Œ´T-MÀTÁÀ®\Ñ\Â\Ä\ëºR•AÅ€^ˆ\"f±LZdn\\6²S2—š²\ÜhÊ”üñü\áhµW¡³¢½•\r\ès5 §²š\á½¨\Ñ`F\ïg/%`„M››u^	\Ô¾<),\æ´FB`\àk\ê\ËU0(hs\Ú\nX\Å{R›¨jXË¨n%\å\Ğ—\ÂPPó¡¹\\3mØ¥\"tj*\"[l[¯\Ø5¿\Ò(@T@%¬\Ú2\èeù]°ˆø†#(0\É\Ù0eI`-Q¡\Ö\àDƒÕ®\n~¶\çF™\ív\Z\ëpø\äa<`Œ™›‚\Û\Æ\ïK§¦Ú–ò{g\îz±\'Œ£ÂşN<ıı[ò	\à^´`±ø1şòôg|ró K\Ú…MqOŸ\âmõÒ/Ñ¿õ$Zg·cß™ñó±\ä½8\ê\ï\ÇS\Îûô«O\Ñ\ÛÙ\Õlr³³³¨­­B…Å…*•†M¯±¢\rV*\Õ:³–fyŒ%e\Ğ\Ğ2³r!\ËÈ†,]Œ|\ÈrJ¡.”Á!\ÕRm,h¦bµ›­\Z­*´›+\Ğ\ÊY«\Ô\Ã%!T…¥0\ÑvÕ™,YE\Ğrª\É(\"#RB]Rˆ’ôbf£¬H…\Ìi™Å¼œGu.H.\ç\ÈEn*3c\n‹GZ&J²²¡\Íg+)¦—ÁA»­°°x˜\Õü6T™¬p\Z\äü,E0È‹‘Œ°D\æÀPÑ‚KSS\á(Á]J«f¹©¶\Ø\Ğ\\I%4©Ñ¢d¦³™1\Ñİ÷¿ú˜\ß÷\Ì,\Ì\Ã\á\ĞÂ®—A\Ïli41V«ƒà»«00\Ò÷G	öû·ñ\\´\â§÷q\ç\ÖAlú¯ €¹D»öJ*\Z‘Xb@B¦‘\ÙR”\ê\Ûğ\î‡7ş\Ã\Ç|ó\Ã\×Á\Ş=;±k\Çv´v4\ÂMÛ¨sò§\í´\ÖT¢\ÉmE£8‹©…–¢3²=2[1\äŠ¤P\Ó&%Åf˜H\Óò \Í(„\"§¦R5­Q‡&\Úe»µmT\Äv›ƒZĞ¨4\ÂE\ë\Õ\Ñz\ÕY…Pf@™[J€KPN˜Jâ³‘— Ôµ™,\'\éåˆ+€Ÿ_\"|ıÒ°\Ê\'\ËVFÁ/0Á\Éğ‹G°O¢‚™\0	UL¨ªIV\0›FFÅ“\Ãe–37ªPmP{\ÖV¤°\ÉJ	l\Z\"\Â\à\å†((²sQ£´¢F\Î\Ì\É\âS£5¢\Ë\é@³A\ÃL¨F_MF\Øö?yğ£gß‰\éI8\\bÿ?Z0\íW¸…•™\Ñ\á\âk¸\Ü\è\ï¥ş±ğ\ï‡8¹g5\Ì\Çûÿ\ÏÏ€\â0O±i¨f|šÍµù%Fd\äI\ÎL•”M\ÑV\âÃ»Ÿñ‹x\Ì\æõ\âøgñ=y„™¹\ìÛ·‡FoWjœ&Ô¹¬hu\Ó~8­±\Ù\Ø\Í0<D‡r‰\Å\ÅJ*9©2d%\ä Ÿ\í¸ 1E\É)(IL!\0ùT\ÇXY š¬\ZôQ	†š0\ÜÔ€\ê´R%\\rªhnd\Ù%g\äSË¡H/`\ËC~BRÅ™ô\ãÊ‘“eFy¹\ÉIRøø§c•o\ŞZ‚+\Ã\àO\èü¢\á\ç\n\ïXDú²…Ç 4%•Ï“$—\å£u:\êˆg7-‹Õ´\âZª (\"\åù©ˆ\n‹\ás\".8š<%Õ¾\n\î2–. MJ3ºh»MTÀf›ÃµŒP¬‚ùYn\í\âZ¸\ìbw|\ÌT[“I;‹‹ƒ¥\Än³²„´\ãùó©‚Bù^l~óB\Å\å;·À\Êÿó<ı\áG8t\ä(.^:Ë†6¦j4&±ñ]§¡¹{÷ü\ê\Ù\çyÌ³gƒİ·\í\Ş\Î\Ç\íÃ…g0:Ø‰:7óY•.‹\Ê2TR9ôlªeejdf\é/ƒ@*‚ƒXHdğ\rˆC°,’âŠ‘C‹’²P^‚²\ÔL\æ(™G=fZ»±\Ø7€\Õ}£kjd	!\ÔRQ8\Ê \Ë*€š\ng\Ìg.\Ë+C)L\n\ËF\\X\Òã¥–V@­«E^\n¡i	H@\Õ.\ÑùH‰¤ò…\Å#*$	1\Ñ(\ÌL¶¸\0\Öò\"\Ø\å\ÅÌ±\å,,Z\Ô;t¨·D«õ&\í©„jIRc<901,\Ö-\Z²&6s;\ãA½Ô„.ºB³Ù€®\Ú\nt×»\Ñ88†²\Íò{#€l¿›·&–“ªVª®\ÃjD\ï@;<gü\0\Å\ÑO\Äş€·có¬\ç$\åÿgø;\á»W‰\ì÷Ë“\Øq\â®_½„3gNb\ãü4F»š1Xk\ç®S£ã¨Ã­»wxÿgò¡}ôüN\\9‡ığK§0?>‚Ö¦J\Âg„4W‚bü\\9’R‹Ã‘ EXX>üıÓ«@d~#¼|h…2%±™	ù(\ÊÌ†‘\ê«\Ê+‚­¬”ŠWµ\â\âX\â\Õı£of\æS­\" ùÌ“YY\Ğ\åÀ\Î\Üh“*™)©‚|²\ÌBh˜\Åô%\Z¨Š\ÕÌ–ZhVMùr\æ\ÃHi\ÑeÌŠ¹Œ¹Pòù\Ì\Å2XYªi™uT­F»1Â‚6\Úd“C…&§µ„±\ÎnF-›ªMS\ÌÏ™Ï†ƒ‚¤\"Ï‚ MeHN\ç{+aÓ¶ \Åe£\n\Ú\Ñ_[‰\Öjj{ñ£8ƒmth`¹>EÍŒ,Î¯bq\ã¼J§=]lÁ_>\à_\Ë»bİ§ˆöQÿ,!B\É€\Ï	\àw\ïcqû6œ8´;wl\Æ\Ìğ0F\Ú\Ú0T_\'—r-³˜ŒMòÜ•w¸4Šö¢„<\áxã‹±÷\è^¼{\é6Îa¸»õl~ŠR%rs¤HN)CfŠji\ÊK\ì\rË„_&ı’<g\æõôD\Úet\ä¹y¨R\ÒŞ¨p\ÕZ)\Æ[ë°…ğm\Æ:q¹Ø£\ÙNXh*™±……¨\ÈgN\ÓQ¥˜«M6\Â!V·T°¹º¹ğTÀ!7ÁD56\ÉhuefX\n0¨`e\ÎtñÇ®T«\áP\Èa”—ÀIÅ®Õ©\Ø^õhu\ê\Ğ^¥C[\İÌ´\í*4‹#\æ*˜M‚\È\ì&\ÎhPœ‹”\äDHRrQ\Z‡\â˜D–ª4THuha{owY\ĞW]‹¾*7#	\ËXW¾\çüœ\ß\á\0•\İn3A\ÏV­\Óh¡U+¨‚b·|*¬8,“·¿\0\Ù\ÏÃ•\Ø\ë\ÅAI\â©w˜7¬n\ÄKbı\ã\ß~\ÇO\Ïc½~\ÆGXÛ³¿)\Í?\0ğ÷ğÀ\'¦™å½}»wnBZMe-Ú¹´\Ö1kÙ´:f·b¨J‹ùe\r\âûŸ\ÅyJ\Ä\é?ñó=\Æ\İ\ï¿À\Şcûpõ\ê\ìİ¼\è9\n­ƒ­`ñ0Y*¡P9P’«€ºT\Ã\çª\â—\ëF	U¢œMSY®„Nª†™\ĞP\Î\×\"´5\Z\Í\ÌXF9Ú©\0«™¶ONbû\Ä(6ötcª®Š\0jÑªQ¡^&Cei*J²Q)cö\ÒX\\¨¡V\ë\íh\ĞU0¿YY\"*Q£·¡­º\É^F¶\êF‹MT§zÿJ\æ2	m3Vi.\Z¨ø-°£B‰nFŠ\îJ3z\Üvª/·TZ\ĞDE¬eD±µP–– •\r:;!	Q©\Ğ\ç\æÀ,É„Ñ¥­¹\ÃiA¿«\n­•¸¹@»:zñ#Ş¿<y‚Á‘1\Ï\ĞFœßF±¦€\ÛnSÀYaAW_úo˜_(ß‹ñb¿Àg\Ï~ôœ r“\Ø\ë£\'\ÏñÁ\Óÿ\Î>ú—ı\Ü~Â°\Îy\âd\Òÿ\0ÿw¿ø\ß|ÿ->‚M\ë¦\Ğ\ÒR\åg²½\rı\Õ.h¥2(\Å\ÊY­Œ\rM‹k\\ö|&a\Ã\";~û\ëO8vö>xÿ’\ç(¸ı\ç°vr“##¶õµµpÍ\Â\ê2%AT\Ã\\n \âX˜¯œpqTk\íTMşÀ\îZ4Q%\Ú\í&`\ÂXc36÷¾	lÄ†6\Ì2›±\Üt±‘¶òÇªcq—À%)g1!„j\Ü2#*\Êz-\Õ^*\Z)„Ü€\Â\ÙL0\ÅÖŒ*•\ZNY9l\åù|?\åV&›´ø\n+:\Ù\à»\Ä1Ã•\è\nHÛ©~­zÔºŒ¨avsu\ĞÉ¥\ÈLKAbx4r\"“a(H†KVWy1\êa—;\í¨\ác],\"\Îöü@%õŒ\Â&¶ù½°\ÜXø\ìjLÌŒ>®«W”ô\r‡°ß¿(VH?}ö-n\ßúC?øş)n>ı®\Şû¸óN>§\"şFdfú\ßB1D/œÇ‘\İp\é\Äl_g©\êÀ®µ³˜\í\îDƒ^‡^ş\Õf)œf\'n\ßyÏ“ÿÀB	$€GÎÀ\Í[—p\í\â1¼s|\Ş>¼{¶®\Å\ê©Aôµ7¡¥¦š¶hc®r£B­A…\Â\ÈŸ\Ê\ÄLÖ w¡\ÅFğ\ìU¨3;\ĞRÁ\ëè©¶c¡³\r\ÛFG°uj›GúiÁ­°\nnút\è\ÕhÓ–¢IE¥‘JQOm0\êiŸ64Y\ìh¤ú\Õ(\Ìp<G™\n6ª®³˜JSRNû•<BZ\ÎB!\',×£\İB\è¸ ˆ½Uº\Ù\â{ª\ì\è¥\ÚõR‰º	}»\Û\èQ³f§6Luu\èQ\Í\Æj\àë¦³Á\'Fzl\ØE°«X\Ş\ZLF´ZÕ`¶\è*“8ı†¶\Öü\ìÙªñ“S“¨¬°\Ã*\0\Ô\ë¡Õ¨¡3\Ò<\ëM\è\ìn%?bEô‹\è) Ï˜ÿ‹2ò-n|´›\Åş€?üúhK·ŸşO)—\ßÿ\å9\ï@\Ùôœ5\ë\ÅÙ­şwÀ\ï¿ûÖ³£\èöùql\ëÁl_«\ç\ÍvÁ¸m\\\ÍJV¯›Ã½§?z*\ß3F_Y`n~ı!>ıôCÜº~\Z7/\Ãõ\Çqö\Ğvl^=…‘v*i=zœN4Û¬´>3\Z	N£^l\Ñ` W\Ærj”6şH5èªª&ğ•˜nª\Çú\Ş\ì`ş\Û16†m\â”=\í˜m®\Å•y\ê\Óm2£Ó B‡FŠ¶\Æ½m%z¨]\Ìh=„¤—q¢›9¬­\ÂÁyN\æ@«\ï\Å\âD«Cœ†ŠZ%N\\Y‰‘\ê\ZS…G™\×Fk«=\ï\Ğ\Ç\"6Pe@§K¬\ÛÔ “®™6\\\Ë\ÑÀb\á21N°1\'%¦\"7!†\Â|ª°8~\Ä\èQÌJB\ìG\İq!`Á0j\n\ál\ëÀO´\à\çä£“•\Éad\É+‡š[¯;§*¡×•ÁÂ¦\İ\ŞQOş’ğ‰õ\"÷	\Å\éy\Å&¹qıúnlœr\ã¥O\î=\Â\ç´Ü³?>\Ç\'Oş‚\ÛÏŸ\ãÁógxô\Û_ğ\è÷\ßğ\ã\é\ï´dBú”\Ê\è9¥\Z/‹ñ\â \ïÁş\ÅT\ìø\É\Û8_\ìu\"\ÖıGğüı«E<P\Ğú\Ï\ßüş?¸o^\Äñ\\Où^¸PxN\×\Æ\×\ê\Ó/>Â†\Å	L¾±¶:t\Õ\Ô0\ßÈ *\Ïc»¤j+ğÎµwø¥ñ‹ø\ãış\Î\ç\Ïñí£Ÿğ\é\ç\áóp\çı\ÓøøòI\Ï\Ùö¬›\Æ¡\à\Úa«@£Ñ„:\ÚxKK\Â%¼P\ÆB@\Õ\Òiw•l‰n\Ï\és\Çj°\Ø\ÙB\è°‡ö»{Œ\Ì²¡§\Í\r˜¨q`\ÄjFŸY‡n1ŒT&\ÚW—^‰~«CN†wf¶a—“@¹0\\\ã\ÂX]½\ç¬ù,W³,3]\í˜\ë\êÀ\êÌ‰ymõ˜mo\ÇTk=\ï\Ã\×h©\Ãx}-†	`¯øc*`•°U´\á\n#UÖ„j¶`»øï¢¤%\' (•¹OZÀ…J\Ã\Ë\ìW\Éë¶¡‡\ï·\ÒR41\Ò\Ø[ñ\Å\Ãûxğô>Z¨ò¶dƒN\nL•‚\n¨’B\æH\İ]MT»\ïù=\ÅüûA+\0¾¿›\Ä9¢í½“°õ¬†£o\Ìı›a]@õøv\Ô\ÌmGó\Ì^´¯=ƒşM\çĞ¿\å,†w]À\äşË˜=r3Ç®`ö\ÔU¬9õ!Öş\ë\Ï\ÜÆ¦³Ÿb\ëùO±ó\â§Xü\\¹\Íğ@ı\ã ˆ†ôŒPºşSşşö“7¿ÁÀ³\è\Ùqƒ;Nad\ÛiL\í8ƒ5{\Îa\ã\ŞX\Üs}Ó‹¨hj†‰Š`u\Ö\Ãhª€Je†ReƒŠYmãƒ„û\\ıø\Üøü;|úõOø\ì»ñ\ÙO\ßâ“»\à³	\àõ³øø\Ò\Ûxÿ\Ü1œ?¼‡¶,z\Îõ2\Ş\Ö\È,\å@‡É‚6½õ	»…V[‰*NKU¯\Ó\rÕ˜kmÀÆ¾n\Â7Šı3\Ø\Ë\éÎ¡!lfAZl®\Ç4Áa,°õ™µèµ©\ÑG z	ø ­~¼ª³T°\éº:\Ì44bª¶“õ5˜ z\ÎtµbuO/\Ö\röb\ãÀ06õa-_kŸ{\rœ£\â\Ìv´aª¥\Ösvı\Ñ\Ú\n* \ß#\í¶\Ãe@‹„8qQ\rs›Û®‡Õ €¬()‰±e²¹«\ål\ãj~6\Ú\'Áí£·U[a‘A§(‚™\Õ\ŞØƒ\ï¸\Ğ?zò+Z;[asjX>\Ô0I”\Ğ*eT¿rÚ±6£]b‡ÔŸş>\çTÁ§\ß1“o\Ã\ÆY^’V6£¸¡%5m(ªî„´ª\å\Õ](«é‚¬¡\ÛN½ƒ£7n\â\à7°ûú-\ìy\ï:6¿s.\\!|\ïzÆ¦w\ŞÅ†óW\à;\Øtú,6œ<\Ç\Ğ:4oÁw¿ˆS²\n¨şc5\'±–(ó\È\å¯ğ\è\és\Ü{Ff3N\Ël\ß~2W\n*ZgoF©	\Ù\Ö&\äp\äjj‘­¬Eªª\ni²\n$*È”6\"¥Ôôr2%\ÕH‘»‘ª¨B†ªš÷­F®¼\Ê\nd(\\˜pø\Ğ~ªß»¸ó\Şi|t\å8>ºp7\Ş9\á9U\Çyf\Âı‹,}X\İ×…E–“…ş^\Ì\ÑbW÷ws^\Öpş\Z^\ïl\"\Ø2Ş½s£82?\ÃÓ“\Ø5:Š­=X\×ÖŒ¹:Ze¥“\Ğ1Ÿ\Ò\Òûœf6c=z,:ôó‡a~›$¤-¶¯\×Ş‚>nug;h}½o\0`\Ó`\Öt{\Ö5.R­WwQ\r››0C`\Çj\ë0\ÈH0\È§¯’0U8Ù€\ØÎ«˜3],\n&\ÚfY^12\âb¡)(ö\ì]Sg¡\år\è \íwÒ†kÙ”5ee0°±k%…p´õ\à§‡Oî£±§Ÿ‡ªiP(aTFQB\è\â\ì-\İ\íüME	ğEşgKõ¬~ò._İ†5Sf¼$±· \ĞÕŒg;J]¼ÜŠ<w=Šª!©\ë\Ç\Öı§p\à\Ä%º}§¿ø\Ü{Œ\ë´í›„\ä\â·\ß\ã½_\ïã½‡¿\á\ê£_ñ>\ëù%Î»vÿ!\\s› k\ìFõÀ¾şIüA‰Xôo\ÕM\Ïk„N-õö\í\ïpÿÁ#üL5ü•C\0X·ş0Š,5\È2\×!WßŠLM\r24UHV8&·!E\ê@¼”ğ[]¢AB‘	±EV\Äë˜o@L‘\rqz$j_¨G\\q¢Šˆ-P\"µÄ‚Õ«ñ\á¥3ø\è\â|xş>\áå¯®½‹¯Ø?¹ü6\Ş=´G6\Ìc\Ï\ì8vMŒc+Um\ë8³c,\Zã„Mwu_;6ubÿ\ÜlœÇ‰qbqû¨„Û™W·6cŠym˜Á½Ï¡B·M‡>»N\Z\Ø5´^+\Æê˜mi\ÆbG\ÖvR\áz\Û9:˜+;±¡¿±Y¨\êP?6şu\İbt\Óú»0\ÕÜ‚\é\ÚFŒÀş\Ú*ôŠÿ6L¨h5-U7¬óü\ÍWAF’\ãR \É+[¢f±%ˆm\Úc\×z¥\åPHsa”A\ÏË¶–6üôœ\nø\è4Qu-V¯–ò>%PP!5J\æ@*¢\ŞX\îùO¼\ÇÏ¿&pBÿº7\Ì/Ì…?\ãé£»¸xq=Ë/‰1\íõÈ·>\ÂXTQ‡œŠV¸[¨<8pù*\Şı\æ;œÿ\æ¼ı\İ\Ïx\ïg‚ö\ëc\ÜbF¼Bu{\ï\á\\{ôŒ\Ó\'¸ñü	®şt\ï?|\ç\äV”º[Q\î\èÀø\â!<\"|¢8ü#€\â¯]E\Ûş9\ï\Ê]Zã—¿\à{\Âúğñe¬<„<Cr4õ¯©jU­)2R\Ê\í\àJÌˆ+4\">#_K¸Lˆ&t±…jD\Z›o\á0#¦P‡\Ğb5¢óÔˆ\ÍR!!O‡¦\î>\\`\î»zú\0><{w.ŸÁ\×.\à‹÷.\à\Ów\ß\Æ\Õ\ãGp^ˆ¾v‡g\â\Ì4vNc\ï\ì$vO.^\Ş<ÜõT\Æ338¹c;\Î\íÚ³[7\ãä†T\ÂE€´ò\É:ªóX?©y¯Ÿmqˆ\ít˜9L‹®qbœ¶»Àz-Z\ÛK\0©p›ú±µ[‡8Æ°up›©„›{ùº]\ÔÌ·µÀ\êğ‰\\\Êü\Ø\Í\×\Æ2\Ñ\âñ¥Cu…n‹-X¡@~V2’2¡-‘¢Z£ANœk\Ú\Â6Oe\ÓA#\Éf–ÎJZ½Œyº¾ß²Düò\ëÏ¨¯kò¬r\Ñ\ÊJ \\NPÌ‹\n#4\æZHŒ\Ì\ïŞõûöc\ë¡\Ø{\ìœ:‚\ão\ïÅ©·bÃ†q47\éğRÁK3ò¬µi“ƒ\0\æ2K•Vta\ë{—q\å\ŞC¼û\Ã}\\ş\ég\\¹/ {ˆ~ÿ\ïÜ»‡÷	\ßõOp\ÊõÁ\ã\'¼\Ï=¼\ÇûÛ‡· \ÔÙˆ,6RC\Í0n}!ÖŠÿ|ÁbA\Ğ€·¾‡sW?\Æ\İ\'ğ\Õ\ï\Ş_1›nF¶¾\n\é´\ÙT\ÚhŠ¶–VkE‚¤	\å.$>ª]´4;¢ò/P 2×†\è\\-bx{T®†—•„R‰ğ\\ª_•0C\Ç)ó‹£‡ölÀ\Ù#\ÛqıøABx7\Ş>„N\ÂG\ãòş½¸¸{\'Nl\ÛBE[‹#³ó8Døö\0§f°}b[Fû°}fG·o\Â;|Ì¥ƒûqa\×.œÙºG¨°;ú±¶µ3l\È\â»£`VU°\ÉD±Â—0\Ò.\'\ÄY˜\åÖˆ¼\×\Ã=8„-#\Ø>0†C\Ø28Føú9o[{Ç±±wë»©°í\ç­vc@¨Ÿ\ØyÀ\éB³İŠ:›u´ú\ZZ}¥\Õ\n;[ªY-A^^&Š²3\á@•\Ø{F·I+aS‰“±¤\èKra”ˆ=´Ë¡­o\ã\ïò??ø\Õõõ0™L³ºr\Úta	mº\ÄsŒp¦Â‚ ¤D¦\æ\":«qù¥\\\ØK’Yˆø¢RD#<¯\0a\é9x)\ßì¢µ1Ojgd†2Ô£\ĞP…|\Ú^‰³{/]À\Û?}Gõû¾ù—¦\âİ£\nÂ‹?şŒË¿ü‚w9\ïmöú/÷q\é\Ç_ğ\ŞıĞ/ \ĞÒ€T™	9\n;š‡W\ãª¥°b±\å\å9?\È\ç¿<Á\Ï÷_X³X·ô!>q\ånß»‡eÿú\Î\Õ\È\Ğ\×#EIØ„ò•\Ö\"¾´ñ\Ìxq%&\Ä\çR\Í\\œF\ä¸<-\"òõˆÈ¦\êe¼o—BŞgG\\¶‘Yr„g•#<ƒ6$1b‘-úøŞ8s\Êu`\ŞÙ»—önÂ¥»p\å\È~\\Ù¿\ç÷\ì\Â\é-pl\Í\"\Ï.\à\à\ìöLc\Ç\ä0v\Î\á(KË•c´ñÓ§q\í\èq\\Ş»g6Ø™\ì Dk	\Õ\\s‹…\ãu¶L\\F\"öÚ¬\è4™YtŒÇ£ÌŠs¼ÿ:f\ÎõT»MCƒ\Ø24Œm£\Ó\ØF·\rˆA±*¸¦—¹”Š9\İ\Ò\Ê\Ö\ì\Æ \Û{Oe\rÚ¨²\r|\î\Z\Ñ|™\ç*\Å\îò\ì´R-ò2²9² £\Å\Z$E0SÍ´eù‰ÿ)€­¸6E)\ìj±YuU~zú\0?Àö\æ6ª¤Zy)\Ô\Ô\å0S	*%Rò•ŒIApL\ÉCHr&BR“™’Ë‘°”„Å¥Á—öÿR®š*\Å\\et \Å\ä@º¹™ú\ZdÀ|†t\×À,\Ú\Ö\îAÏº\è\Út\0[ö¢g\çQô\í:Á\Ç0¶÷\Æ÷ŸÀ\ÌÁ·1»\ï\ÆŸ\ÂüÁ‹wÍ²(T!NiG²Ô€lm&\×o\'hb¡zq\êóŸ(\ç/V\Û{ş\é\É3l?ù.G¾ÿ˜e\ä7(\Û¤\"|´\Ü$æ½„+U\Ï\Î%\ÉFK¥ºñ\Ã\Æ¥#X\Ñ„,Ó€H‚‘\Å)Œ\ÌT †F\äh¸Ô™x›Q™rD¤K–&AR.\åĞM8²s\rN\íÙŒw\à½ã»©ˆ\ÇiÁ‡p\å\àn\\Ü¿\ç¶l\Âñu‹8²0}³Ã„oˆpô`÷\êi¼s\ì\0\î\\z·/\\À‡\'O\á\Ò¸qN\Ï`\ï\È0623­im\Â\\K&\Å\év\Ù0‡*X<l\Ä#º\Ìf´±¹·hU\è\ä\åaB4\Ë\"²†ö»~x‡	\İ\È¶O1ÿMQ	\'<¶¼·¯\î\ÂLG7Æ©€c5nô1kvq\Ú.\ÖaZ\ÍT=*Œ\Z8¨€z¬z5\ÊJ\n’’Š\Ì\äX”\äg¢</š\â,˜™ç´²2\Ï\Ş-6u!”Â©,ƒ…óõõø¥\âÛŸ¾EcM=[°x.Z³B\rµ¬\0*™R©	\Ù2øG%\"06!1yˆˆ\ÍEPl³šƒ øG&\Â76\n/¥«\İ\È\ÔU!\ÓXª`¦–*H ³\ÄeC%²Œn‚\Äa«A®\Ù\ĞT‹Bk33#m\ÛÙ„[ò˜sÜ¼^\Éc¯aK­E¦½yº\n$ILH*q ¹Ô„b‰O>ÿŒ>\ÇC\æ¾3Ÿşø>ªŸg\"-zÏ…›ø\äÁC\Üù\á!\Î\Şù\r•H•›‘RB\èX4b\ËH,´½(\ZV„1Ï…\ç°\ì2\ÄºhN#³\Ê™–S%B³¼\à	\ÌVPù¤*§•#\"M…˜T-\ÕõØ¶yG·­Á\Ù\Ã\Ûp\í\ä1|pü\Ş;z\ï¼K»w\à\âöõx{\Ó&]³€s3\Ø9J0:˜½špdóZ\Üz÷<¾ù\à\î^yŸ \îÛ··n\Ãñ\Ù5\Ø74Š\í\Ìs›z:±¦³Ş£„µ•´K‡§ù³$Œ8+Ğ£7¡A*A£Vl\Ãu1\Ï\Õ`¢µ\r‹\İıT»1\Â>Iøfiùó\Ø:2Og	\àx\Ú\ÅöfqJ-z\İ5\è \Õ7ò¹\ë\Å\Ş)v½•:Ú«\Ñ«AiI!R“S‘›iv\n”YLòb\Ï\Î\r\âH:³X\çY^È¼X\ncm¸¢\ß=û\ß|÷\êù\ÄH\â\ÌF‹UT\'+†”Š“Y\n¿¨ø\Å\Ä\Ã7&~qU|¤*\Æ&\Ã\'!·¥À;’\0f+-HW;¨zUHSRµ.$ò‹H#„\Ù\Z;\ÒôuH1»‘N5\ÊX¨­B!Ì¥B\æ™+‘g©C6³cš­É¶zdYªi\ç\ÕH3ºf M–Y‘\"±\"±L\å)\ë÷÷Àö\Í#f\Æ/ÿ=€;.|Ä¦ô\ßPı\İ}\Ç’\Ë*\ÙbY.J-\ÌtT¾\"=\Â\nt*„g\ë•!ŠğE0\×\Å$°49B3‹8%dT\Åp¡~\âötÂ™\Ê\Ë\é*„\Ò~CS©„I\n”ªl´\á9Ù³\ç©~—À{\à\İ[ñö\roN¯_ƒ\ã´\ßT´cCX\×\ÉV[\ådÀógğõ\Íø\æÆ‡,1\ï\àÖ±S¸²\ï\Ş\Ùyg\Öl\Ç\á©i\ìÀ¶A±Ršv4c¶±\Óõ´\äºFL‰U\'Õ•\èµ:\Ğ(S ^¥C%	Œ‰Z\ÛD»ú°– o\Z§/²ø\Ìc\\\è¢Rv0ÿµ\Ğ~˜/\ëi¿n´¹L\Ì~´^ñ\ß\Âz-\ìš842X˜ı\Úr””\ä!Yl\ÉHCyn.ròS¡+\Éf,$P„M–SyeTC*œAªD99¸óô|üå‡¨©uÂ¢‘C_.N*ƒNY\Äi)$2	|	¼\"\Ó\à™@•‹C@T6|b	¡ôJÀ*B\è•\nŸˆ4¼”\Å|–!\ë\Éê¦v\"‰ª•¢²3ôWx‚¿\01‹Pf©+«cCÖ»‘f!\\fZ·Á…l*g¦‘\'tÙ¼o\Z­6WU\ÉÇ²­*EN\Ó ¡X\ä,R\Ëh-s\Û	Û¯xç«Ÿñ#\Ûô?–’½\ç?ÆƒG¿\â§\ßş\Şÿ\é)²ƒˆ/³#†\ÖMğ¢Š^”‡æ¾ˆ|9‚9\r\Ï\Ğ*ÁéœŸNSi±)\nóËˆ\äüH‚\ÆiX\áK)\ãı\Ê™\Ì\Ç$#‰ª988€\Ûqr\Ï\Z\\Ø»™o\Î¼“k\×ã¸€s¶;9]´\ÓÍ„h®¡\Z‹Íµø\è\ì9üô\é§ø\á\ã\Ûø\âú%|zú\Ş?tˆ\å\å Ÿ\ãNoÛ«\×Ó†G°…v•p­Øš\Ñ\\\Å\Æv,Ô·`²ª6;šT\n4*\Í¨²c˜Yp´¶‰™±3\ÍMX\ÓEğûF°apk™\ç{F±ºµStŒö8â®£r\Öx6\İ5\Ù,´^\\:*¼V\Ê\'N\ç&#L\å0\È%(\ËOGV|J\Ò2PŸ‚‚´$\èJ‹\àòvO¦Ë¡4\æ\âl\Ø	¡µ¤\nS5n<ü\×ï¼jw5´9Œ\åùP–e@^šu1ó#AL+W\á\0F\Ä\Ã;,^œúD\Äp$\Ã_\ì‰š\ïğ¼”¤\Ğ\Ğ\âŒT\'3Û¥ñJ=\å:¤ü\ÓUdğr&/gªd-Rµ”¶B\ÕL@j¬H\çc3	p¦PS²Z(Ÿñ´Ë¨¼r\Ä3£%H4Z\ïŸıŒ“\Şeü\ë¿4ımœø\às|ÿ\Ã¸÷\èwf\Â\çÈ´N\"ğ\ÅT1Ë©—¥e¡0\Ğbõ\áõô|„¦\ËBµMSòº„×…º2^ ˆ!\Zfj£Ál`IEğ¢©ˆ‰RD%+a«hÆ¶õó8²m‘\í•Yo\ãj›_`\á˜Ç™q\ìŸ\Æ\Îa¶N6\Ú5\â¯\ê\İ8½u3~ùòür‡ğ]¾€N\Ç‡\ã\ê\ŞCTÏƒ¸¸\ë\0\Ü\ãY³kˆ9®w€Í¶‹˜£µ\Îs,4·c¾¦	3„g€6\Ü,Ó£A\ÅV\\%\Ö\ç¹i\Ï.6\åjŒ\×6P-iù\âşq¾{”my\03-}#€ƒT\Ê~g\rZ\Í\Ô\èp8´FØ”Å´Q\r%›,ATP¥Š˜û²R<3‰ÿ\ÉMM@~n…l¾…´\ãX\äbĞ…jJP¦s\â\Ö\Óop\í\îu\Ô\Ò\ê\rZ-H1TEĞ”²³)KTRf\ë2¬\n¡Õ†…ced*VD\Åbe83_D|\ÂS< z…\ÅaEH^J,\×!Q\â`À\'pl™±´\ËhJnŠÒ€Â™¤\ä\í,r--Z\ÍRA\ÛNã—”©rÒ¶m„Í„D¾¹d%ËŒ\Ü\Â\ç1óùÄªf¬L\Úb!yeˆ+P\Ã\ÑĞƒ—\Î\à\Üû\áÙ“¿^ğ\Ê\'\ßãƒ?\Å/ÿ‚\ïş\Ær4ˆ\èb3,\Ìq´\à¡t*„\Ğ~C³%„Œ*—!A@j1‚SJ=\ê–¬@HAL.\àu)˜–Š§C3`0\áO+\å\í\ÅI,\åcc¢E¥•˜Ã\r³8²a{§\ØrG±gb\Z»F\Ùvi[{G\Øf	@}-\ËD#®9/?|w\Ş>«{v\â¢»¶\á³\ßÅ­»Ø‚©~k¶\á\àôjl\ç\ã7ô\raugfZ1Ç¼6\ÛØ…\É\Æ&L0Ğ\Ğr»\ÌvT–\ÊPÏ†\Ú\Ç\Ü=XY‹!\Ú\é@u¬\Â(A9o¦A\ì\ÜĞÉ–vÏ±ÇƒT=|\Ì\İM´ñ*£.ñÿ½l¯F•\Èp…l¸\ĞË‹X¨de%\È\Î\ÉBz\\<JrSQ\Â\ËYIQH@J|$\Êr2`’ªLhË™K‹©n…(\×9póñ·¸p\ã\",V#Ld\Ä\È\Ö[Á×«´¨\à0k¡·\\„T7ª\ÜJª\àR^^I\å[\ÂyÁ±/\ËCb°\"0/¥”«=«4b\ËH–TJÛ”‘È¼£\Ô0‘*© }Z$\0AM%|É´\í$¹‰v\Í\Ç(,TMB(\× ^Jõ“\êR\Î\ç ı†Q‘¢˜·B2ó9U\"Om@u[/>ûòküşlù\ä\Ç_pú\ê‡\Ø}\ê\Z\ÆØ¼“\ËÜˆ \íF\ä0¶[a¥\\—IK\åó…Pı‚S\nLØ‚S$J(CP\n­9I†ˆ8¾.aŒ¢‡\'•¤=\ÈğT)P†\ĞxZv\Z\ÏûD§ªQ\ÕØ‚k¦±g~Û§\Ør\Ç	\È]ƒƒT¯,¶\Ò:˜\É\êê±¦­\rg¶­Ç»»wzV·§M/,\âø\ê586³\ZG\'W\ãÈ”ÈŒ«±k|\Ï1Å^Lˆ3(ˆ\Íd.+\Ü²W£\ÇR…Õ¥X\n”¨*Ó MkC¿Sl;®\ÇP-\ï_S\Åû‹\ÇUÑš0\ÒØŒ‘ú&V×±E×¢\ÛV6›µ*\Ø	›‰öhd¦³\Ë\Ëa\"xZ%-R’\í\É|i‰\ÉH‹‹FyZ6J’“	`(\â¢‚ô°0d¥Q\rò`¯rÀ\á4B­•@ju\á\êıÏ±\ï\Ì8+t°Y´p\Ò\ê\ívz‚ªQ@«–# ^\0˜„\å¡1X\Ze¡Q0«B“±’Ê·<$ËƒÃ±\\\0_¢óä´˜B–)[¦\ÔD\å¢ú•k¢ú˜x]\ê@¬ŒS	\ç\Éõ/Z©ÂŠ\Â/VÓºgŸ^\ÄÇ–²x”(\ÇT›”\Ïê¼¼È´V\Ô28¿û\á¼w\çk|õ£\Ø;\â\Å.Râ¸ó·¿AÏ=\è_½Îv>l6­”m6”\n\ÆiŸ+8“JH›\rJ#tiù–O\à`¨P¶„\Â(A \í6<‘0¼\Ğ4\ä* \í8¹a	T¿8\Ú2¿°\à8hM%¦§§±ej›F‡°–¹\Ø\Ñ\éQ½5b=^¤\âL€\Ù\æf\ì\Ç.–­,\ëX6ö±­aûÀ0¶³nœÁ¶\áilš\Ç\ê–!¶\Şfô¸f\Úb]¤F\ì]S®xq<?£y\ÖTÄ–Z¢D­\ÊL;ua€¯5VO¥«m¥\ZV¡—óú	\âh•X\é\Ì\Ü\èv M\ìk®@KŸK«C®‚©LuI),Å¥„O$\×sÀ»²\\N\Õ\ËEbt:R£\ÄñÀq\ÈKbLBrD¢ƒ‘\âˆ¸ˆ`$\ÇA¡VA[Á\Ì/7 \ÇL\Õ\ëê¥©\ÎsH¦\ËL\ÕÓ•³)3AR’Y9“¸t,K‡WH:V„R\ÃŒ‰ğ\nŒ¡\n\ÆcUp¯¯J\ÂK\Ñ%\Ä\å\ÙŸodÃ¤‚\ÈH©´\ÑXf8¡„	|ñ8\Â§\à}h\Ù\Ñ2;\Ê8-\×#Fj@m;\ÖKõK(¥m—\Ú[(\ãcŠ‘œNkL\ÌEzV9Š\Ê\ÑBøv_|\ç>û\'>¿‹İ§oQù!óŞ£\ßcp\Ç1”ŠM‚–&äš«U¬BpPP)\"i£Q)Zf<ü™3E™#©qY‰%xq„)¾A2€ö\Z”\Ì( \ä}‚\ÓÔ¼/\ËI²Ş£€!‰\å4~‰ùğ\çc	B{o—\ç\Ï\Ä?¡w¶`¡‰Ğµ\ÑöÚ›0\İ\Ö\ì\Ù\Ú0\Åü3M%œ\ïnÁLg+lúi½®\ZªU\r&h±ó\Í]XÍ±\Ğ\ÔÇ¼Ø…~K-\Z™«ø=:ó5p[`(:=T™\È\Ó5œª \ÏQÁ§DƒÜ*d[òXw]Fj\Z\Ğ\'vzuØ©„´f\æ=ñW\r­N±Û¾F6^!%¢Pl\É`\é\ê\'‘@_Z\î9<A*\ÍG!\İ(>2™Q‘(LGZR,’“b\È@Dú!.81aŞˆŒ@4óul‰\ÉüsL.\ä\Û(¶¡r˜QF•f2¤™È—g X«B@\\\n–1.\'€\Ë\à²\Ğ$,\çõX,\r!x\Ñ;(\Ë\âğRLn)¢s\åˆ\Î\ç‹0£\ÅšE•‹)f\Ø\ç’%#”¥„´˜jG›\ãˆ*\ám„5†J—H{—\êÏ†šPL\Û%0\Ñ|³1\Å:$*K\ã\ÓóÁZ\Ï\àÄµ+øø\Ñ#|ÿ?\â›ÿñ‡.\ß\ÆO\á\è\Åó\ØzøL“\È3Ö¡@[‡\\m5\"\n\Øp©za©´Q\Â’J‰§ò¤\È\àŸ”°øø%#0¾€K^>’\nT¡g¥gXb	ür˜h\à}™ELf\ä4všP D\æG>&J™\\\ä\ì\Ø f»»1\ÙÑŒ¹&†8\Ñ\Ò\Ä\ÌV\é\ÆZL\ÔUzv½Z\ÍB±®¿ö —¥¡Z\ë€]ªB•R‹vCzLè¢½6³ U«QQ ‚%O3¿cc±	º<”y.(³¥Q²tPafÜ©Õ³\Éò½´²!>·PÏ¡\Ú6*^=\Ú\â´•T\ÂFtº\İ\è²U¢\ÍdE½‘¯¡¤ú•J¡.Ê…–ß½E*\áõ(6••B%gE\È \\\áÈ‰£ú¥\Ä\"=6)\ÑaˆDH@Bƒ\ï?~w\éŒ<\äB\Í\èU‹4ş&9–jdš-H7T Ÿ/\Ö\\\èp¡®·µ\É-ƒw<!¤\å®\n¢\í%\â\à8,\åXœHy90+XB¢ò™…\n\n–\'ñœQ ¬P°\"5bó	fóV¡¥´]^+$lef\Âg@$\ç\È\"\nÄ%*\Äi\ÃyQE„¶\\¨B2óŒ”\Í(—M«4?®µC\Ûa~\ïÌx3G\ß\ÅÁ³7°‡Šx\àø	üüô>\ìSs\È\Ò:Q ©E:[w4­)T4[.…!„ÅŸ–\ëŸL\ĞW\0U-Œ9Ï—–@\Ëõ£•\År~Bü=J(ol6‚i\0U\Ğ_(bR9¹€\0¾d*k­:’v\Æû\äò\Ç\ïeŞ›\ì\é\ÄXK=&[	\ÇT­·Q\ì£W\Å\âP…®¬\ë\ëÁ&±\Ã\é\È\Æ[»Y\0ªa\à©\Î\×B“[[º“££\Ğ;¿W+Zs¾\È›¼*Ó‰rB\'a-c©’ò±\ÆR¶V:‹›9»j\Ó,²£\Ê\Ón»]\è\âhsV¡\ÉfE«Õ„v)³_‹ÙŠ:´[c™ò\Âl\Â\\\0³T\nƒ¼ò\Ò\\\ÊJÊ‘Œ˜0–f¿x¤±•¦„‡#\È\'\0¡ş^÷	Et@\0üh—~i,rbE?#UŒÆ…X£Iº*\Ä\È)´óˆb9bË¹P³\r§\ê´(uPFƒÂª:d(VT\â•Q‰X\Z‡•±X·˜ı\Ät… ^\n\Ï\ãŸ\Ã\Î0C¥	Ï—#&WME,D8N•¯@D!;¿À0^£†I ÷a¾\"€‰9z‚Hk+2 \"§œ0Ó¾i%\ÊòR(ròø\áóQÌŒ˜Ge\È1U\"\×XBvüô9t\Îo\ÃÍ›\×ğ\è\écXz‘­v\"][‰d¶\ìpª´\Ó\0‚”T?\æÿ\Ø|ø\Æ\å²,\Ä\æ\Â?ŠV\Z[\Ä\Ìù\Ñ9œG0c\n©´kªbp‚È†¥´]5Ÿƒ™0¾¡±1Âº¸œYUŠ\n6\Ê\Ñ\î5\×b¸¹\n\ãM˜l\à`ö§õN±„,õb\æcK\Ş9²€i¶\Ûg=Û¦†2;4yz\èsµ0\ÑeN8\Ê\í\ÌJ6\Ê\n˜\n„ƒfUVLùf˜¤±\Ì\Ê\Â`ƒSfC5\ì\Z~õJ;\ê¨4µf—\ç\ÌZ\r67š\ì.\Â)\Î[£B“\Å\Èüç¤½QI·ª {\éK2 \ÍÉ„¦P\n»L›( %¹±\Éf\ç\"&*\Zq‘ñÈ‹@Vt8’Ybƒ€\Ë\â\åƒH„ùø\Ã/4‚nÃ…<‹<”\Ñ\ÕUˆ\Ğ\Ø#“,%(\n¾\éü\îsJYJ!¢\ÕG)´ˆ`È¨«Eyc\Ê\Z\Û\"M\ÅJ¿(ª`(–Ğ‚—²„,ÁKa\Ùy\ÉW#Td¬¼RÚ\á¹Å¼,ET3^®\Ñbûi>E­A6<_E¥“#Œ\êAXc¸´‡ñ1\Ä\æ®\ì.5Z\Ä\ç\È!¡\ÈÒ¡Q)Pjq W_…\ÖùyJ7N;ƒ–¹-¸òş%<yş–®Y¤0k¦Ğ®“\Å^T\å \Ñn…\â%\æx¬60®˜pes\äaôÉ‚o$o‹,$Œ„“\Û/6‡6@›÷M E\Òğ(\æQ\ÎˆcöKa™Í¬\èO¥H,‚?3ah¬ùt€A†\íÑF·Vc¨…\Æ\éz‚YW…¹\æF\Èb2Ğ­\âO‡§0\Öİ…fwœ:+œ\Ì\Ä\Ö\"‚X\ì`ğ7RÕœ´@4ù´\Ş\\Î§\íª 6\Ë¡s–WPl,p6‰Nõ‹cƒİ´\ájq\Ù\àFµ¹5,M\Æ\n\ÏAPuB©z\í6;:,U«‡KÁü(—\Ò\ŞedgCIµ3+$\Ğ)\Ä\ÙU!)^ˆğ\à(\Ï?gf\Ç\Ç#1*Il½á¾¾ôõB°·?\Â‚y9^Ì‰bõ–p>…ÑªJDR\í„fÁ+.^\Ù\åˆb„óc–.Q!†\Å*‚\ï%…y8·º9u\í(¬dÇI\á™‚•Á´\Şh*`8•0\Z/…d³\Ò\â\"`X­.§ÂŠó€*\Ïf¬P–€ \\BHU\ç\åğù\\6Q‚Jk	 :†P%£3ôÿB„fd	\ÒrPX\Ãš‹8fÀR¥R§¹&Ú«Î‚lfŠSï¼‹5qúü<}şd-È $2„\'—³1û&—3\ç•2\Û¦ø<\ÂD9|OA‹.„7\áò\É\Å\Ê8–\nZ±/\ÕÏ›\Ê\æ\Ëù>\ÑE’J(\Ô0\æE\Ş*GU•Q%¹\à‰yI\n¾F9™3kk\ë1\ŞÙ‰‘¶ZŒ\×\0\ë<»»×»=\åd\n¸¦_ü}ÿ(\Ë8¦º†\Ñ_ß†ö\Ê*V%œr+ŒR;Ár27…h²i»,š\\+\ÔÙ¢„˜a§*º4mp8›®V\çTU:!¬öœ*Î¥rJ+\ÌV–ŒJ:„S_»ü¡;XL\ZŒZT©¨x´_c1-· Ji,*\rlj4lÁ\Åyy\ÈLHBXhRc\â\Å˜\Z‰$0a¿l¿!şAˆòö/§¾ñt—Lş\Ş\Ì÷‘\åF„–9Hõ¢°x§Á;6+X0}Rsá•’ÿlŠ—Ü(\İ\ĞhA&m8³ÑL·y.+\Ò:\Úu	\"©Ä\é„7Š-Xlš\n`ˆI§\å¦\æó\És=»)	C>òr)ÁrP±şM\ì\ÊÄR@H\Å^%b\Å0aÍ¡¥‰-\rT\Ğ>>8¥Q©y\ÌIğ£\ÜûF\Ä\Òò’P$Õ¡T¯C\ÖÀŒ\çÂ©‹\ÇĞ¿i+Ÿ8‰û\Ï~Fq]?Ò¤V$ş±—sX²>	ùğa\áğ¥’y±0ø&2‚\ç“C¸ø\á	£W\çE‹•\Ç%0Fcm\Ù7’\n	* ot>#òÀ\Ûh½AT\Â`XwH¥j\Ê%:E©ÒŠ¡¶&ŒtqğKœh#€Í„²ƒ¥¤·“T¼©N•\Î!\Ìô`ª-\è¬may¨G‹”KY	«\Äc‘ºB3›©Ó£|\Êb;6Zr-\Ü\nG5\ê\rM¨U5>7jôh´Õ£\ÚROğ¨Œ­\Û\ÆbÁ|G«³–\é™\íô¨5X	Ë“yĞ F•B	‡ŒÙ³DœÓ°zy	f\îT( ,\ão‘ÁV‡ÀH\äD\Ç\"\'*ö…”h„z!–\î\ëOC±‚­\Õ\'+E%”\ï?\\n@¨ŒT¢ƒ/3øŠøT,‹I\Äòøl¬\âX“ŒE>9|ŒZ‰pªt\Z‹RncR\İ.\æ\ÂJ¤[\rH5©i·\"\×\éBq¥/E0À‹\ÍX\é\ãùû\ÙğO/€fB3ri\Í€ò~l‘¬ğş¼îŸ£\ä|f§\Ú/³c`V›jŸ«¡”\í@6Í°´T¤¤$b•X		oJp*_®S#_¯ „n~\ïÆ¶oÅ®‡ñ\ãÓŸP\àD\n‹@¢ÄŒÊ½/ŸÏÃ—\ê\åC\Õ\n¶Í¥\àùD¾\ÈtBOä”—½£¨†‘™T¾rBW@‹ö\Ìf%\Ô2Ë£„~TG_\æ\ÉV\Î÷\Ë/7^E\æÂ•\ÂÌ›n@J	õµu\îi\Ãp»£\ílÁ\Í-T\ÅFL´w Ù¦·…E¥»³=£˜\î\ZAos/hgF«G#!¬7Ö¢B_ƒ\nU³X,–”7´EXe,\rº:	\Ş\ß\Ä\\\ÇvÙ¦kD³®­–Z´\Ø\ë\ĞloF•¶TS›D\ç90¾Bk¥:V \Æ\Â\Öis¢\ÍUA¬ğ”zµ\Ésü²8‚M[F©~ªŸA&c	aùHg\ßO@DP,2b’‘L\æ±Ä `„xSı\á\ï‡ \Úïª°tøRDBh¯!l\æÁJ–S…†€I±Œ²<*“\Ó,‹L\Æòğ$¬\àw¿œ\"°<™Ñˆ\n*\×!‘\í8«®5.¤W8‘\ÉÏ•h\Ğ EgBšÃ†b6ú—‚\Å*±\Z\"¥Ø³R×—\Ğùe0X¦gzÖµ…\Ñú‚³\Ä:4¶J€ñ„2 “¹‰\0úQıB’©\"T@\Ş\'(•­‰	LÎ¥’d\"3%\ŞÁ\Éğ\nCPX\"¢y½H\"‡®\ÂÁLX‰cW`j\ß¬Û¹_?ø¹–N\ÏFq\íbUO-”ù\Ì[Xm,¿”\è,xñƒ{\0#³±‚KOD/\ç`yd¼Ã©ŒQl^©œ\æ`•€”_–\0\Ô7R\Â\Çe#óYfBh\Ïa1Ì«qü’“˜3“Ä–.í©„?*%ucÈ£rm‡<²·4c¸¥\íTºV®\ê&×±°\Ôu£§¡\í\Õlª•\í\èp´®6‚Ô„N^n³6 \ÑØ‚:U=j¨|¦ô»\Û\Ñ\çnD\Ûs¯÷8\Ğeo$PMl¹5h±T3:`+S\Ã\\¢d©\ĞPıŒpk©š7\ê©\"­n:\Ü\âxa‹\ç\ĞQ·R\r#S³˜yÙ TB\Å\ï»(¿\0	q1BtX2¨`i\áaH\rFp¨¯ø—¤\0„\Òz	\âò°L.ør”šZjG ?*«wj)V\ÒQ¼)+\âR°$ RX–G¤Q\rù]\'e\Ã\'%\Şüıh\É\Ñ\\R»\Ìf\Ä\ÚmH xiZ’\Í&¤TW\á¥\Ğø,\ÏNƒ!´K\ß>(%Á©b%/¡£Š±†{ö*\áõÀ¬\"BF¥¤b\nµ lş­\n[€ \äB–…BøS}’óXJ\ÊP\Æ\Ü\á\ÇÊ¿\"8\ŞşIT®x\æÁ,+Ë¡4˜qô\Â^l<ºk7¯\Ã\ç÷¿@šI\ÕfD’Xï˜§e«–\É%+‘_\íÔ—E\Ã;’ÀE¥Á7”T\Ønd\ZVHo¸2BÀIø\"h»„\Ò\'œjR\Ìy%XCu\'¬~±ü|´\ŞªŸ\ØœP\î9ıZ?gX\n›~*›\\.‹í²¡¦‰Xlöªen\Âdsšk\ĞTS…\Â\×\â®E¿«uTÅºNôÔ´` ºƒ5]\è«n&db/>P\rUğ~\ÎVv:\Û8mB®MÌº\r«MnAG5cJ%\ç9s´b>~>¶B1y¦Š\ê©DY‡f‡-UvtVQA-6Z²‘–«‚‘\ÅCœ6\Ø,\×zN)RZ˜‡¬¬„EÀ h¤rš\Å…„P±\ÂÙ—\å\Ã~>ÆŠx,Î€¯\Ø\İM\ìô\Ë2Tl \Ø0\ê¸7\â3°Š…pUB–Q\Ş\"€Kc\Òğ›\î[	,†Yùğ¢®¤SúŠµ&j=Rù³\ë\ê‘\É\"—QS¼\Ú\Z(šº˜ù€`\ÚZ \Ãd@*U/#\rÁ\ÉT»i½É´Õ”rV\î\\*cJ™\"\0\åı	™/­9X¬â ‚†@ÿ$Zßœ\ß\\tF!ÊŠs’€\0\æeşQX)ş\á\'$\É7Ÿ¶²÷\ÈN¿v\í\İ#¸öõ{ˆ§$J´ˆ-¦\æ)\Øb	!\\\É·2\åB4]B\ç\É\\Je\äK`³H³!]IWE\äH\Â\ÈÌ·2‚Š\Î\Û|ù/\Ş\æKı¢©\àÌ!1~^¹\Äp–ğ$#\"“\Ä\ÖB˜®‡„yk¨ª\×T‡A‚7\ÖHˆ8º\Zš<­·\ÅY‹‚\ÕSİ‚ŞšVô\×6a€Š3\â:	 ¹\İj;\Úe´\ĞB\ÛØš1`iDK©®øBh\Ãò aL02&h™S\ÕQ¥P\é¸€¥¤ Á;•×‹¡bğ\×+PI+¬£•\Õ\Û5T@+m˜ök6zş)\ÓI\Õ\Óñ~…¨‹\Ë \á4\'#q\ÌkAş±ˆ‰ñ¬xN‹	EŠ‘!ˆbD”_\0BÂ°’¯\ëCü\Ø\àCÙ€#\Ê\ì(1À‹öº2<oÅ”Á;Q\n/2³4>K#E\áw[P\nÿr5B¥,s*şv*-\Ê5ğ.W ˆ™?\Ş^4w2ª\ë‘[Û€\æÃ—’3\Ø(\ÓL±š€´\ÚQı?ş)\ÌL©Y9\Ò\ê\'l˜Š\Â\"À\Â\â\Ç\Çú\n©\å\ã\ã©H\É\é\ÌQ”`^\ë\èB\ãòQ”†²$J~B â¢£ƒ\ĞXÄ°\â\ç\ÒZf\×O\ã\Ò\Ç1¸fö†\Ä*œˆ-\ë5l\ã\Zør‰óN£¢¥R\ÑØ€Å¾ea©L\Ø+ƒ/?¼øR¼\Â\Ò$3_¡¥‡&aU\È–L½\"¸\0…! œK1s¢\ç	ı\ãdğO ‚ó\rM\äª\ã\ç3P\åuü\ÌVÄ¦\ÈPU\á\Â 3\ß@}¹÷\ÔÕ¡£Ú…vW-š­vÔ™m´LZŒv´¨\ìhp\ËGS¾5\Ì\Ê\Õ\é\å°2–8•p¦)\Ğ@K«)\ÖÁ’ …‚°\Éc¤\ĞEK¡Š.E\ßs±6ò}2î„Ì•Ñ\ÅAŸQKv9ª\å\Z4l¿Ph\äh\ç|±kQkT±M\ëi¿\ÈKŠ¡,/ƒ²´\Ò\ì\\d\Æ%#($A\ÑHŠ‰BvlR£Ã‘\Î\\\Z€Ø \0Dúø!$$«#h±\Ìqbg=B\èFBı¼™ñW1Ry\Ñıü\ÍüK\äd\ã¦Í†XT®d\î\ã‚Ë¬@…e7™‘hnB¼Ñ‰µ\rAJ\reZjL\ÒT­/Ò·hY¾$Ş‡6\ì—H\à™oR*U\ÙPÿ¤\\\æ#şpi\"´\çÀ??UÎ—PŠõqT)?6\Ò æ´€8\Úl\æõ@\Êrab:J“¢‘Ÿ’€\Ò\ÌT\È2 )H„^¬2°9\Ğ\Æl5?1ƒÁ™)\èiY±l|\Ñb{t>¿\06\îUI™XEUXIø–t\ïˆl\Ş\Ì¼—½\ÂùÅ„P		w¨˜\Ç<–\â™\ï\ÃË«B	 ­Ø‹ ú„zr¡d	?7³,SS\Åù…&ª©úl}	&„\'\è«$œ\Å\È+”£½®†\r·’¶\êB78\Ï^\Ş\0k)•†J¯\Ë,ƒ:¥¦L´ÉŠ=Ü¹:¸\Ód°%³‘¦\È9e>£\Ú\Zst°sŠQ@Ã…@_9?Oi@6JüS 	Î…<¼\Z¾7s†\ZµT qr\"q\Ş>qªN{%ó¥\åE‹F6Kñg\Õ\â¼.Viôù\åÌŠ¥P—”³i—Q\0r\Ì\\Œ\È\Ğx¤\Ä\Ç3ÿ\ÅPı\"‘M+NA[p¤OB˜ı‚¢h³E,™–ğ;`!ô\ÏQ\Ã/Wo\æĞ B.œ¥V(­¦\Í\æ\ÓıJ¸\àÊ¸À\Ê\ÌU™®\Ğ\"\\M\å4Û‘ÌœšVÑ€h“!:-¢\äR„k‹h\ã\ÆKA„G¬S+k}øƒ\Ù½\Ùı…\'eÀ\ëGˆ|ó(»¼œJu\ã|¯\Äø2ˆ<¶Š ú2Ü‹•À¾,^\çMGQFdI\áP\ç\ÆÁ,\ÉA¥¦n½5F›\Z0\Û×µ}½\Ø0Ô…™\î^h\Ø\ìØº¢¨€alØ«ø\"ğ\nx¼\ÃS<»ó¬¢\Ây…D\Ú--vE(§„lUp:VebEP¯3†ò3ñºï¿ŠÊ·*<•Š\ÉÁ,\È\çó‹b¾Œ\ë5üŒRB“T\\ğøe%P	cY\Ê\âiÓ±%P\ÉMh­r \Ë\åD·Kük¹5F\\lUj-j´vT*«\à`vµdjac´\Äka/„\ïAM(ÕCW]‚ú(f¼ˆ2˜R¨`Y´\Ñ|+\ZK\Ôh\àX\Ëµ^\â@³œeCic¹\àuU·¢\Õh±Ú¨¼¼Ÿ‰ kU°\É\n¡/\àû\ÌSAYXYA1J³‘š\é±\Õ@\ßP$\Ó1òcØ€‘NS\ãÃ…8\æÀ(\ZebaN–! Ğ„ÀrB‚òôğ\Ëg¤8—˜9ßŒ *Y@¡ÁEZªŸX?¨£\Âñ1\nÂ¤\Ä\é]H¬lBZe°1z;#Ë¥Îˆh‘TñH30ˆ\Ù*ª\È\Ì\Âv#®D¼PCªÈ„dN\æ=\æoa\Ï,-b¬$„Ë™¼bøS5½x=€\Ê\çO…ñ*@pD2Ê³\Óa*Lg6\ÉE­¦”\à•¢\ÎR‚¶\n=&\Z:™§z0À/t¼Ö…ş\Zqn6É®^\Ïñ½Á™%„…ğ	¥c(^\Év»Š®\n¥\ê…ex\ÔĞ—\n·R(^(of{[°‘-¥2.\çû\"˜+˜±V…—ñy¨¤¡À)šq‚£\Ê\Z©\á(öcûŠ\Ë0N\Ç\ÏQ~\â¾\â(.3m¥\Én÷¬ö\è ˆUh¯ªBw‡Û^6¾Af»aG\'\Æ*ú1]9€K†´õ06b\ÈÀò¡kC‚\íYÑŒM­3´aP_!M%zM•h\Ó8Ğ¡£\Ò\Zk\Ğhr¢‰ó\ë”lº\Õ\Ğ\ÅV]V‹ƒ,ş°F{iyT\Ñ\ì<\Ï÷5yEPdK<ÿcƒ \ßXD…Qñ’™»“‘‚\ì\è\ä;!D„#1„\" 8	K\Åz\Õt9ü	WP™™\ßG‘¾e,…eVøËœ”\áO‘ğ.¥¥*ìˆ<[KB™qcUV\äT\Ö\"™9\ÙV~x6÷K\r¢t\Ú1\íY£D˜^†—¼b\àM\ËˆJ€[Œ•Ì‡¹Ë‡MG(7¯û\Å%zn[Aõ[Ÿ\È’y`EGLö¨ !öb[û‚?>§¥,nu!ª\Ì%li\Åh°•>+a«\Çtk3»;\Ø,k0\ÜÚ³óM­\Ø=?…ş¶>Dñ\Ë+—E¥rP\İBY<˜‘V	\Ø<¯A+!œ!\â¶,,\É\Åò\àL¬Nõì±œ\Ã+€\ï9˜÷\'ˆ\Şa,&„w\\I\\\Å÷\ìM+öcÀ÷‹»t©¸\0J¨„\Ì*ñ´ğb.Th¾¦_\Z²Š¨v·\çSmluıluƒ5g;e¨\î\å‚4\â¨\Ã›î‚»kª\Å\Æú\Úa¬\ãXS7…Š>,Øº±h\íÁœ¹“ºVŒ\Û0diB\ë\Ñ× \İÀb\ãjFN3U£VA\Ô\Ú\Ğ,ş\îğ5\Ú]htP\Åy°%›*§\å¹(-(„*‹\ê\Ç™ƒ°\Ğ0O³M\æo˜Í’™.\âPL,²c¢‘CNˆ\nGlT\"#|ù=Fò7e™È R\ÑÙ ù™}	 ?\ÕĞ—¹\Õ_J”2\ë1øS­D;–R\åÕˆPÁ÷gs#¡®1Œ1\Ì~¡r\Õ ù>Ng@´Ş†X\ï§R\á%Ÿø8\Z_Jµ­Ó›\n\æÅ¬µ*&‰Ê–\Æ@šÈ‘À\Ëú1TDf)Ï–\r\Ç*.M\Ëy»\Ø\ãÁ7<‰\ë\Å+¯$$´<›Z‚z£µ\Ör4;™¥j´ƒ§×¶w`}7&\Z›\ĞYYu}ƒX\è`\Ó\ì\Æş­\ë°u¸\ÉùR‚_ô¢l°™	ˆVR\rH+‚²±‚\à-§\ê‰ıÎ–¬7ÙŠW–@¾~P2U‘·%q^<! \æ\\.X,2\ŞxU8\Z¾W±ºÆŸ\Í8Š\çSHE¤„©y±®QÜŸp¥B\Ù\Ö…£,T¢¶\â¦ZŒµ6a¬¥…\í·\ã\îF\Ì\Ö,6\àqk\r¦\ÂW\ÛZ1onÆ¬¹ÓºL\ë1mjÆ˜©	Ã¼<hbƒfû\ï3×¢¿¢}•\è­\êD›­\áòüyL¥\Â\Ä\ÂCu´T U;B®b\È7”I \É-‚2«€n“)sŸœ—s	[LD\"BX*¢â‘›œŠü\ädN‘%vB\rGfL8\'*ˆ\Â\n:†7£>•\í7¤\Ø¯<	‚™\íüKi¯%&ø±”„J*ØŠË©ŠRx³ùzK¥ğ£õ\n\0£\íUÈ¬fñpV3ò¾7D\ì-#J•ÙŸy\ÙÏ³Ê/=/ys	\à²%®Š¦¾\åqñXÇ¶H«¢úP\ÙV\ÑşÄ¶;ŸHÚ˜X\åAûò¦­\n\ãL5ô4\Óp>†/\'0o\Î\0>¶\ÆT†\Îj%:k\è­×£¯®k\ëøc5òGª¨\ÅtU¶cÿ\Ü,mZ‡\â4“«±\ĞÕ\ä5_0RÀGu­–\n\çG\Ø\ÄŞ´+ù2‚õÁ[& Œ\Å[!±œ—E+\æe\Ş\ç­ ~@ŸÈ‡T\Ò0B\Êy^AY¼¿(/\âX.taETòB~¶LFJ©òŸ¹\Í+†q‚€&À48,[#\êYšªl~&7F[\Z=»k57y\"Ä˜8x¨©“5˜$@“p\ÚPO¥«\Ã\áV»9ª0\Èy=\Æ\è\êÑ¯­FŸ©–Š×„..Œ\Î6´\Û\ZP§©‚\á\Ş%Q£Qg÷\é\Öj«D³ƒök3{ş1\ÓX*…,¯\0’\Ü<O\ã-.\ÈC!­89>\r¡¡±H\àB–‘š…\Â\Ôä§§ 89\ry	b;pÒ¨€ñQ1H¦\r\Çğ¾+˜\ÛÄº_¶\Ú\à3|òT?–2\èGõ*3Ã«\\E\åc‹¥úù@?– Kœ\ÚÀbaBŒµ‰\Ú**#\á\Ì.£°1\Ç\'`%Ë­w#OŠXÌ¾\ÎŸ!\0#€´\ïpZ\Z\Õn™Ø¬A\Ğ\"x yqºÂ³J(n\ã\ïG\èV…&`y$ô\Ú‡\É+„—#y[8Ÿ\'<šj‰öJ\rš­l³b¤\Û\é9W\ŞBg\ÖõNa¹i]o\Î\ïÚŠSkW\ãØºõ¬ÁT\ë\ç<\ÊÑ©¥–*\Ö3v\Ìr¾ÆŠ –Â´‚Ğ­@\Åyæ­ \ê­ ”B3±„ü–<–òú2ñOCl˜+}™ı’°\Ìs\'.¡Œ^\ÂÂ¹0ú2\'®`_œOUgù¢Ê¦0\åº\ê\Ä\Ów\â¸š;\Ğ\\QÁ‰ª\×Z‹‘\æ*ô\×SÁjk0\ÒĞ‚ñú6LÔ¶b²š¯‚Jga\Æ*gd^eBW‰vuómV]\éù\Íc5\êŒ\Ì{\êjT\È,Ğ—\Z`*5£Fm¦»Po;Z\ØÀ­6Ï‰\Íõù¥T¾L”\æg¡¬ \0\Å9¹\ÈJ\ÈF¿³ğ\à8¤1^¥¦  ÷I\ËBq’8#j,2\ã‘Æ˜•D+NŠŠF„8J->AùT:¶\î B\æM\ë\r–°ˆ\È8\ï%€\ê\'T0¬ÔÀ\íYA(9e\î\Ğh¦bn—2+¦\çcibV¦qN(ôl#^)\âûƒWF>V¥òûNa<\â\Âğ’•ky”XeÁ;„òb­6•K¨\Ú\nÂ¹œPz²­\Ë+,†?‰?Ë‡P±\r0<Š¶+€\â+òUh¢G	Wòy\ÃKwµc.\Ìö\×`\íP3ŒO`\Ï\Üzì¢Êµ\Ôbco;l\\‡·\×\Í\àğ\ÂZ¬_Ä–şA(3\ÏvÁB!d{\Ö\ÆS¹¸0\Ç>¾\ï€H*\Õ/8Køe¯ò\'´\ß%bwo‚·$0où\Å8\Ş\'€…ªÆ¥’ ®ğ\çe1Ÿ÷[Á¦º*¨À³	J¨\ëR/\Â\é\Å&\ÌÛŠ\ÜmHw´ \İP…Î£§a™C]%‹Gc#\Æ;\Ûh\Ã,Ì„½\Â\å¨D—»T÷>6ÁNG3³£¶µl€Ur,2;á¢‚¹a.vÁ!u\Ã\"±C\ËZ•¥ šC[ ‚“\ßmd\Ö[P\ÍQ/J‰½†\rXlVCŸ\Ò\Üf?ZpQJho)b\×3±•ƒñ¨€Ê§JË†<Sü‘N.J\Ò\ÒPDKNL@&¡H‰f;FX…Å’(UÓ‚	Z‘\È|jøÀ\0¶_¿=s p*¢ªD š*©bTS\rUô+¦‹¤ğ;½€ª\ç“\\\â\Ù4\çŸ\Î\Ë\ë¢\Èòw»\Â2\"¬ˆK\ÆK«™°\Ñ\å,«Â˜•D®\n‹ pT^_Á±‚Æ›R¾*œ?d„\0€\ÖÁ\Æ\Ä\ìNU¤Bx‡JB¸”mqEo‹¥µ§ ¿ÙŒ™\Ñj¬o\ÂÑ…iœÚ±×ÀÖ\Ï\é(†šz1\Ø5‹³;v\á\ÆÉƒ8ºv\í\å\â\ßz`\"—ñœ„zy¨P¿$B˜\à9\Ş`-cy@–„\ÄS“	õ§ú¦@\Úr\0§\Ëıó¡\0*(î·„\ã-\å¼ÿRql‚È‰„‘Ê¸œ*¹‚\Å\å-Zö*¿tF€B86 °k©º*4\î?\nõ\Ä\"\Ü}£h\'\êh\ÆdK†¨€=•UhµºP£´³<¸\àR[\à”\Ûa,\ÓAUd€¢H‹²t%r3,	\Ìji¦\ÉP–©òL\Ëi\ê,=\nÚ¯	µ\ê\n\æ@\ÂGt\ë\Å)v-¨³;PaP@STÀ¼—\ã9Ê­$?E™T»hÆZk^Z&¤Y\Ù|>N©’\å\é9|\í,*bòØ†scÎ¢IÁ\à÷˜YÎ–+¬\ÕL…\ÓÀ?W‚\0©•KE”[	…M×ˆ©@rÁ¤Bz³}ûd±ŠŸ\Ã;-×³}xy<;¬¡[•/–!±e%@l¼\È, \n2¿\'S\ã‹ñ\Òòğp,¡•zÑ‚–…ó	ø#‹}ùW´¡T•`‘·¢\Ø,ùCŠK‚£9 \Ó\ŞB\ÂñUqY\íX\ï\È™MÊ‹?\ê[œB`§z«°nª\Ûf;ñÎ–õø\à\ØA\\Ú¾‹½ƒ0(\Ø7½ˆ÷v\í\Åõ\İ{ñÉ‰“pIÈE‹¼¡±T%\ÂıVaeƒ\ïe™_Ù\Ê&¦q¼\Î\×L dñ´\\¾‚ô&Á{\Ó7oøó²\Ò7\n¯û†â€h>G4–øs\ê\Ã\Ï\å\Í\Çóı.÷c>ô¥]‹ÿdóK\ä¼D>\ã\İ!-tğ\ìy(Æ§¥c)\Øs†ùµ0Œ\ÏÁ\âta¨…%¤YüGpËƒ\İNBJh\ÜJ‹\ç¯^K2Ë›T\Ì\ìU‚\Ô\ÄRD3?‡\Ó\ÚÃ©¶	<%NŠş€ª,¡ˆT”™\à–‹\Ój\ØPm´{vDu\ëµ¯\Ês&şZ‹f…òœ|”qg\åQ‹X<rOQˆç‚Ÿ“D(iÇŠ\Âb\Èó \ËÊ…œ\ê\'\'$¥\Ì`‰©I´\áh\Ï6\â¥b£,\rü²Ká“«€Wnü	X ’\0\Ê\r”X¤`d\î[‘†·¢ùS\é–1~-‹eH¦\İ&\æaU,0.«¸p-‹¡(\Åay\nc\ïT\nJ\Z³5\Ñ\Ê$F%N_ZNu[F»õ&T\Ë)\Ãb\0—¸•A\ÑXIV\Óz\0\Â^	&A\\\"¶\í\Ì\åÁağ¦ºx\ÑöËƒb8¨D~)\É\Ä\ÌP\r¶M÷a\Û\Ğ®\î>€[{÷\á\ÜÚµX\ßİ\ã³ø\è\í“øh÷!|ñv­İ‰R\æwi!jK%â¿‚ /c‰XÆ¼¶,X¨a$0\âõ\ß$h¯0¾öQœ\×	\ã\n_\Ş\î7|xBõ¦w,/\Ç\àuB÷†–ø\Äñ~›üŸ\ï5±o\"o\'À¾TWo.l|\Ü|.ß¸|\ÔmÜ®#\'Q\Ô7Œ˜ŠjT\ï\Ø\ç\â&÷ ¯¦­m, 5Ì€,&=Uµlö´b\ÓHµJ(\è%T€L¶ú:N¿›H–Ÿ¤¨\\\ä$\çA‘¯D…†V«£½Ò®kY6šØ¢k/xk¶¹™9]¨µ[=g¸R–\æ¡8?—…#ET¸ÜŒL\ÄÆ§ ŒvšJk-cV\ä@Í‚¢\ÎÉ‚ø+XYV:¤™-REi\É(¤\nŠ\Ò~ŒLË¸\0\ë\á\ÍRá›­…w–œ°É©ˆ¢p\èVB\0i\Ë+˜\é–1¢-‹[¦rYVÄˆ‚QÂœ\Ç\ë	,Œ‰ŒN‰\ÙQ‡yti2KkF1Á“Á‹\ê\ëFU\äTl\Î}É‹?ª/-ly\á\n\á¡½­ „+CY\Ëi¯„Kd¯·˜±\Ş\"”oŠ}ù©v\Ë	\æ²PZ4ƒş\Ê@‚\ZHğ¨B\âh\'¡FK©Fş,6£\í\Ø85Šs›ññ±#8³¸;;û±µ©\ï\îÛ‡N\Â\í·\ßÁ‰\Å\Íhc€\Õ2À6•C—›\0\Úùr–a§Kù–R•–õb®{S@ ¦É„HÀ\çQÀ7ıbx\ïÓŸùğÿ\İ\Ò{\'–Ø¢õw\Üõî¸»ª”s@DI \"DDIB9\çX’JU¥J]¹+\ÇU³\Ûvw{\ìñ\Øn\Û=\á\İ	\ë\Î\Ü\ç7ó<\ëş¼\ßş\èû\ÃYN€ö·\Ã9_ \è\n\ë(¯\âo\Ôr9¿Œ\Å5?2\Ü\É\Ú.~\æy‘õ\nkø;_!ÁWTİŒ’\êÎ¼d;&¶±ÿ\Óo0\Ï\Â\ã¿xò\Ğ$\Ò7\ï\"q÷6,‹«\è\İ\Ø\Æ\ìµ{X%n\Í\äJ˜rg9MObwj†l8‰%1\ÊQh\ãôJ1z¼Acú$Ÿ#Š 3‚\\P¿@\à\æ\æ±Á$¼H9;š\ÃL2ƒ9\Ñ\×™V´#\ìsÀM\é³SzEK3ohÙ¨]­…‘\Ë\İ\ÕŸ\İA\ĞÀk\Ì\Ê\Ï‚\\Œsl\ÖÁmş1;)“ú’}n•…\ìgt!~&{£¨µ0Áv\r¡ŠÖ Z\ËP!^:°ÀˆLPª¦i%\è0*u^†Š>\Ôi=(%Ë•ul\í½?z>½\r:;j\rvHŒ>4úú¡¢5šE;“ı‰:ú£Áx\â±Se©\\\Ô\×^‹¬\×Ğ˜—¸2ú¬>\ZÿR.+ ¤\ç—3’+(¿°…\Ò&²”Š“\Z5-V<}vïœ»Œ\ï\î\İ\Ç/\î<\Â\Ã37ğl\ã_¾y?|şş\×¾\Çı\Åó@‡Sô4K\ÃAô\ë\0Dø ˜‹È´„eu<N\áñ$\íyv*\"\Ó8‚­ò@\Ê\æöd\ÆSuY±š\ÇX©\åg\Ê0W\\#>“9	\äBn[Ÿ\Zù[d\Ë*2i5¥·JG¹f!SX°÷\á\ç˜ÿL<x÷\ÅK¨õ\Å9¾N\0>€yq¡\ã«\È=}c«\ëØ˜š¦§\ÆñŠ\èµ~W67q™\Ó1“şù¥e&\å-l-®cqb£¼&\á\É\Ä4\Æ\ãô\Ş\Şü\Zv–±¯\ì0Eú\É\Ù,SoŠ,˜N#};£\ßaG/e\İ\Úe„Yg„®\Õ5\íAk€Oß‹AÊ±¯·C&/?ûh\ìø(\×^2¡\Ë\ä¢l\ë\á\ê\ìFC;I4qµ1\ÍZ”\ßa\Ô½(aB.¥ÿ/m4“húhÓŒ(f(,/\è‰\Ë56”3\éÖ¨Í¨\Õõ1|\Ğ\ïqY5¾NK_\È\0R+*-ôø¡ô„¡Š¤\ĞÎ‚\Ø6B\à\å&Ñ’A\Ë\ÈNT†\n ‰7d5ñ>PŒJ3½P‰`7\ŞÁh%”¯2ú¦\ÂA(\ÚvR\î\È|\å\Â\à3‘–q\Û\Ò:ª«ø¹F¹ºo]»…W—®\â[2\Æo¿ú\nß½xŸ¾qÿø\å—ø·~‡Ÿ={\Ï6\Ï`ŒtŸaIIXtö .*5\0òŠ…¤\Ö	\ÙLFi¬k&{\É\ÉZ5”U±Œ^®$\ÏnBv\å8]-G	¯¤’ë¹®¬’\ì^¥&°šÿ\Ïw(úÉ“\ÕJ\îGf¬’\âTµ¯¸§*[P\Ì\åú,6\ßÿ£÷_`ôÁ[<wR_¦\Ü\ZB—®3”!M \Æ\É\ŞŞ¥=\äDÿ\Ìó“8^[\Âñ\î:®\ío\ç;Ó1l\ë®ò\\¶ö±4¹€%1À\Í\Ô2\Æ\æ8_À™¹¬œ«£ôzh3iOt·Oat8†¸Ÿ\naw\Âa%\ë» \×k\ÑA¿\ÜN t·k\á4š\Ét&¸\Ï\âÀ\0·ó1!’%8w‰\Ç4\æô™[a\çş&]\'\ê\è³\ë¬I¦\ß8ªNT\èù\×q%}Å´\\%J¦Ú¦nP\Ôı#›y)±ôŒ•”\Şrz=\Ñ\\¢¢•€eA(Óš@¨^6T±4Z¢£\èˆM@“LAOo¬\à£2\è\Ò9h\'rLÁur²Š¥Âˆ\Ëy\á\É|\Å%\Â\ß\Õ`4õ•d—²[1=a	o~¡\\Aÿ$Z5)	\n²‡±ø\\R¯D9AQÒ \Ê{‹ssxz\áş\æ\í÷ñ?~õküúñKüó_\â³\Û\×@pynı	iˆŒ˜ğõ\"H³<Ø®A¥^\Ô!,§Ÿ+¦,\n\Öc (! «	4=eU°—Q®«\æÿVó‚ˆ…\Õ <ş\Ód·×„lt\Å\\^$–×° U’­«x_a%œÀ=Y£\äg	\nÈ„§kTğMn`\äÛˆ\ß|\Ù\ÇO1tUHp†\Ø<œd2SqšL\î\ÚØ…6=‡¾\ì–g\'p´¼ÀğµŒ+g\Öqc\×\Ïl\ã\Ê\Î6\é{\ÒEÌMbFH\æ›K\å°<6EÆ›¡\äN1|$ F\ÃL\r†1\Z\Æ\Èp\0‰\Ğ ¢ƒ‡–NQÅªZM*ô¼ñ\În²™.`5!(\Z$1!{ø¬øÉˆƒ\ámğ\ĞúEX\İp\Ói‡R.ı]•!@\Éõ£HI‰•ñ:*©r*3Š›Môzœš+v¡¢…>\à«`À¨¡¯«\Ó2·õQv=”qz÷!´\ÄG¡O ,§£—U§2\èÌ‘õ\ÒhI£55š¯%}¢T!EUYƒş¯œ\Ì\'@ULoU \'’AJ	\Ğb‚®¬–7‹2,˜²¢Š@#\ë\ä\ÇTYD¿U\Î(ÀY$\ã~Ü¶@¬o´\ã\í{w)·/ğ/Ÿÿÿö\ë\ß\ã\ëğ\îùcì§³8\Ì1!\ÏRzú¦œŒY­\Èõö!\Â\ÏJD\rÃ…ø²_1¥÷4¶@,¿/d“V(Ò­\à)ú¼bú½¢*\ÙQ\Æeô}§\Èà§¸\ß\é*·€@- ğ\n*…\ìªqŠ\ì”HÃ•<o²w!ç¥”iÿ\Â.Œ¼x}\ë‡\È<xˆ\Èõ»PDF\Ñ9<‹\Îôzg6\á^Ú‡61ƒ6z5\Ë\â&\Ò[ØœŸ\Â\Ş\ê™nwVpyk7\Ö)¯Xc\é_š\Â™`*;…\é\ì\Ã\Å4f\\&\È\n‘PÃ¾!„\\ı\ìu#J\Ïñ\r\"\è€‡€2\ë»\Ñ\Ú\Ø	¢Y©&‹µÁ¥·“\íD\å\ßn\Ù\\2|xm|&ô\ÛÈˆ\ÖøVú\Í&¸{ö¸\àeQùµôBa@b¦ü\Z‡P¡\éAó@‰”’K\Ñ\ë‘\íJ[{@Jo³%š>\Ô3\ÉWµ\r¢Ş¯¡\ÃÇ€Dc(‡–\ÑI‚+M|\Éh˜\Ú\Û\èmu<Gı%˜á¬\àl\Í&\Ñ\Ì\Âv¢XA\äM.\ãM¬\'a”\æÙ£Š\ì@¹-(¹^–«P\Ê]F£Zx3\Êu¡\0+\\F\0\nV,”\Ğ;’µ\n\ë\ZÈ€]ø\èú\rüñığ\ï\ß|/\ï=ÀS\İ5\Ô\Ùhû™\ìñ`=LT\Ş~&6\â4\Ô	K<úNT1)–\×ó\"&\Ûı\èÙ„‡‚@\áòqŒ5d3~şQ^ù½B\0‹\Ém\n\È\ÆPZ…%a×Îƒ°‰ \0$@+\è3Ë”bS~=1ô¯ƒºŸ•%9ñ\Æ\r\Än\Ş\çÅ¥„øG`š[E÷\ì\nZ|)\Ô\Ó3µ\Æ`¡\×K^¹‰y\Ê\í2¶5Ÿ\Ãö\â4½\á%–\é6•b˜\È\Ñ\Ï1t£Me1›˜\ÄdjúÂ€\ÓO\ày\á¦Oó˜v\rbÀ1‡Å‹öv´\ZR2»Z¦…©…Rªo\Ï3›\ÏÌ\á \0	6²¤\Ï\Î9C\Ç }Ÿ\ßA	¦\ì§÷;z\é	\è\Ñ1|Š\Ê\ÆöAH\\iTZÂ¨\ë\n ¨™÷UÅF	.ld¡g\à(¡¬¢\×+5\Í5nœ\ì0Q~-L½\'L\Ë2{m1Jjxªp6¾ö\Ì´¹Etğ|õ±Y\è\â“\ĞN‘ù¦s\ĞM,A›€zd\'J$uôxd/\Şh\Ñe\Â)©‚I—7 ,$ D¢,ªm ğ¸œ¾î¤´\à\"\éO\Õ\Öò¦s]4\ï\rÈô‚\"ˆI\Épó\É\íø\æ\î›x¸²‹™	l\rù±c	\í08‚tOAm\Æ\èû†»l\èÓ¶\" \×\Ã\ÒŞ„J!¹ô”Et)ª€\â4­ ‚\ìW\Éÿ¯2J\àL§…7­\âTŞˆ\Òr®«\ä9\áN\n©&+®”pH¥Erp;PNq›S•Rœ\äº\×(»¯¦¬é„Ÿ®gz\r2kª¾4œK\ÛH€\ÙE(}it\å\ĞŸ¢w1å¹¡´\ÅY\Ò\'\à\Ş>@tÿ<2\ãL°L¯S,\éÓ©²q\ÑYdcÁF¢b¼$r4\äIQ‹yˆ\ë‚„û\Ãpš<0\èº`0t\Â\Ä\ä\Ù\Í\Ùe° E£C\íQ-í’ŠŠcb\âu\Ò:ºMğ˜	,J¬\ÏA	&\0ú­†üÛ%\ØÚ…€ƒş¬°õbÀfZK…\éB\â\r\æŸ÷Uöô£¦\ÓC¿g¤Š1„Q~‹d]8%\ïDyK\ÊZ\ì(o#ğD\Õ{†\Ñ.¸\Ş>ŒfJS$KöË¢ÉŸ†:š \Ì\nÖ›6:\Æ;\r\İ\ä´K\Ğ\ÌM¢išœ™FG–òœ›Å‰rñ\ĞU0ŠLN¯§!³	/Gó\Î`QHù«˜ F½„Æ¾”2+oK(e,‰\Åoquo&on=”„,#–ò->¿u/vÖ±\ìôa\Å3„]_S\áZ*†\ÙA7’3B=jx:¥°µIÑ©¨†¾¢F%\Ã\rÁ_LÿwJBp§\é\Ñ^£ü\ä1(‚\Õ^#[,\Æ\ã{ÿù\Z\åW“U\Zü„\à;E\Æ+f\à(*\'{V²€Tˆôy§:Nó»`Ë“Uõx\0\áCxÇ†®\Ì\Ş}®ô\"ê»½Pö\r¡;·\Ê\Ä{™s*_LtòÁ$¥‰i>Hj÷C=œ†yv\æô:º\Éƒ\Ün\Ø\Ï\ä\ZF€….8Ã/„\Ø`Q†ŠAtø\á¡\Üúœ½°™Ğ‘]:4v´5¡o7£±Y¹Jj*K¥D–\Ëalí„µS¼\ß\í¤÷3 ¯«›\é¶¾®Nˆ7&-\\=ğ)Á\æn2¯1e9\Ø\ãd@±ÁD{#º³ı\0\É=1Hz\"¨cú-¥\ÔŠ\'!R3} %WaD\ÚÈ´\ë@µ)„Z÷0dQ(£SĞ¤fĞ”šƒš\Ò*T¡V¥56…¦$6’@\ÓğS/Yp~\í‹Kh›E\Ûd\Ò;‹öñ	\è\Æç¡£\\Ÿ(&ØŠ	\Z‘b\Ë)o\åB>\É<\"”ˆgi\"Q–Ur=oR!˜™Pø¾\Êoqu;N\Õ6\á’\ÈZÂ›YL@J\è\Ù¬o\â\Éú<¶¢~¤y·\ãI\Ü<š\Ãõ³¢w\Ï¶\Òıd)\íPÂ©–À ”B[£@g3ÿ3Ÿ€Û™L\Å#Ÿ¿yŠ  JO\Ö\Óˆd:\ÎO‰$,ş¿RF`µp%Vø½\nÁhõdA9Á¥\à2\×¸dÏ¼L—S‚	\Ö\ÓyFü‘	‹¹ÿÀ\æy,<x\Ã3¨h¶\Ò#€\Ö\à\ŞŒL­’@Œr2Ge¢Âªa€¬˜DoB\Ç\è¼9\ê~7Ádñ¡§\Ë7í…ƒ¿\ã\è\î…\×Şw\0}µ\Û\n}W´f\è5h!³)h]d”@e£\n¦P©¤Ñš­Ys›!Dk—6£,h‚Ë¤£d›Bmt*‰\Ûd„›\ëûMv2¢•\ÒLv\ì\åò4¢\ÑXJQ±À9©+r&\à2«¨\ÒV$\Õ\æ\'\ÑÒ­¸\Ñ©9Ex„ò\Z\'\ÛQ^“ı[[–¬eÀ wmd\ÈhMˆbšğ(Yp\Z\Úñ´\Í\ĞÿOC=\Æ0’ƒzœ`œ p{\Êô‰\n‘*	*\áû\Ê)gå¼©‚‹\è\ëNX¯I\É~”¤Òš:2aF` \Åd$ñ\æ4AxšU\"P\Êq©6Jsm½sş(\æaô·ta5•\Ä7\ï>À\ß~ı?½…;\Ó83Â”ÏŒ€F£ª\nFM%Xƒ\înzROº|²\åÿ‘\ÙN‹\Ô\Ê`qšiö¤\0=\×ˆG,<ö\Ó£`½Ó‚ıÈ’§(\ÏB†OUpÁ÷:™\ï$YòT…”@”¢¾Ox\Ä\Ó\Õ-‚-	À\Å\ç\ïcñ—P(QÛ ğ\Æ`ß„k\ë\0¦µM4F&\ĞL\ä\ßq–\ÒÕˆ\Ş It$\Æò\0\Õg¡q§\ĞN_\ØÑŸ…š\ë[uvh4\İh#c\êô]¦\r:­\Ú6#—›\Ğ\Èt© ôIx\Î\Õ<ŸZ^C)ƒTÑvú-]G7Ì¢>_{G¾nŸ•\à\è\âo9bw+¥¸‹\ìG°w;\ĞÇ!z?\íc\â°8˜„\Åck~„t\Ñ‹\Üş\ã›\r™5‚Zkz7Š\å](T\ZiÁÀFrM*;}…3§¡Š\ÏB¤\Ôò»†\ÒÚšZ \èf\Ñ\ã9˜šğtŞ†4“\ÛShg\âe@µˆ²ch™Ê¡ƒI¸ƒÒ«Ÿ\áş\ã8Q&:Š¡¿+# J)©E¤zÁte\Â;‰\×Vœ\n\êE¢l —\"«\àñ\æ‹wª\Â\ç•\Ö\àş\â=\êI²\â©2Šx\ïZKiC¾G]~\Ìx‚ø\î\Ã{ø÷\ß~Œ\ß÷>|qŒ»‡³ØğaÄ®£I†–ğ8S\ÛdÀƒ‘´“…‚\ìJÀ‰\ß\ì%$ötY`?M\Æ;]!#¸øŸu\ÍyY>\ÉmN\Óû.\ã\\HkE¿X@OX@y€¿QÀ\å…\å\"xü(Ñ¯¤¯qÿ\Â*m¾µ\İ\ÖGŸ!ı\æC4¸4\ä\È]aôÌ¬R^\×\áX>ƒ\Îøšı\ã¨\Ô\r Bi†¬Ë\æ¾\ÔñXf·˜ş\æ\Ğ\ì@\ã\ËBË›fL,¡‰«\0µrjU­Pˆ–gôW’#\ê¤]¨Ë•,\è¼fµ,\ĞÂ¾h::;\rL¾ôz™•~°Go…Modø0 ·³£\îNúŒ\İ\è£W\Ïm]\Æü\äî²ñ\\ùg€!»\0%t§•v!HVA½+‚\ê!”dE\Í&”¨lemâ½°uL\ÇuşT”V%\Ó\ÓpÍ‰Q(©bÊ±Ô©Y\È¢”#]r\ê\Ç@¥fğP\Æ\Çùp$\r[S3:\İUbf*Q\r½\à‰2aò\é\ç\n\Én\â\å¼ğt…¤üb‰„À~ ^O\ÒFy•S’É–ôNE\"xˆ·L\Í%u\â¹\ZY‰@8-Z\Õ\Ós•³K\ÉF\ëa\Ç\æğş½KøŸ\ßŠııøÍ—ñ\Ş\İ}¼±9‰ùıK‡e5ú\r\Z\ä¼\Öü£ókñ<\Èó€#CU‰D\ÛA¹%\ë1ÅŠ@qR<d&kŸ\Ë\n(¥Ed¹Ó‚\í81h”“5\Ë\É\ÎLÀ\'óADH1\Ì\íNrı\ë\Ä\\v²²S#\Ú]),¾û\n\é{(7³(“[ pFòĞ˜^aq½;\çx#&PEoT\Ü\ÒM3>¥g\Ú\Ô2L3LÆ¼QJg\ê\àef¶\å´dò\0+\àõ®lwñ7C\Ù\Âí˜¥Vú\Ç!‚5Jù\"\Øuazú¹>†·µ\Ş¼\â\Ùeµr\Ş\×e…\Ë(\Şh˜\ÑÛ¥#Ó™\ĞcTS’-°“\á†ô\Z\è\rzJqúmfş™¬II7 õE!\ç9\ÕX‡Qc	‘ıœ¨5P\Ãó8c\\G\Æsf!`¸ \Û7Gg\Â\ä,LMÙ…ü³¼\Æ\ä\"—p\Ù(šc‚\r…§ \ZŸƒ,‡\"š\á¶Sd=ú@^\Çf~n\à£\Ôšd^‘Px¹\"¦\×R2WTROv€l\àrúÀ’Z&\Ğz^5\ëZXB)³r.\';r¿2²Š\0b)¥°¨N¬crµO\èª	\ÆúM¸4=ƒø\Í\Ûø×¿ÿÿ÷o>Á/?¼‹g—Wq8B\Â\Ñ\nG³’¡£	z™$\Íò\ÒhKkS(–‘Uk\Z(Ád`²^	“°\0H²œ„\×+ \ï+(#C–qNF+¤\ïû	Sú©j\Ê+?‹ô{R¤\ãRZ‹¼K	VzC¦ßŸˆ\Ç1ha™’|š\ç2¼w	\ÓO\Ş\ÅÈ½7¡Ÿ[a\Èp0tD¡ŸZ§œL@KŸ\ã<{-e¤\ŞF•è¹‹\Û40Á¦_‡z0±‰¡¤“>\É0»ŒF\Êxq³\'-0\äXV¶	\Ì](9²\ë.v\ÑO`\ë\ÓS\è Ot;]ùT+\Zö{\é\İ<ú=ğX\\p\Ñ3:»»a·ˆV‡jú@\Ê0Á\é\Ôq\ê\ĞÁ¥\íF¯I{¨†e…\×\Ìı8i\r.\Ô\ìR\ç\ê¢±Q‚Á\"\ê\Ş\êú£¨\ã²z[\r\Ş8dC)(Bd<¦YMjM_ò\Ü\Ã\Ä=5¶ˆN­9‘¾·iT\0jM\ã<\×øY1‰\ÎÕ¼fmô\ÄB²›\Ü6Ê°&M¹‰)‡…\â\Ñ	R,¦Ÿ`¯\Ü\èóJº×™ˆO‘ı\n\è\Å\Û)eL¢dB&C²$‹\ÔÅ”À\Êöi¹D¼• g+oBø¹Š\Æy1\Æ÷¯\àş\é#üûŸ¾\Ä?_¾¸Œ[{9,Gd¿&ô(jĞ­j„»µaš\ëµ\Éa\Ì-§ù\âñI=}ÿ‡*‚xn\'\ã	O\'<WPQ¢R*\ÈÒ”\ìü3=²\Û)2µ ¯‰´[F°‘\á^P€µ\\I?(\Ç_U \Üö$¥ø”¼|„¹W¯}xÚMT\Ûh\Ğ\ëÌ“\Ñ2h\çEµm ]\Z‰BL¢•,\ĞFh¥GŠd vŠ^f£h]‚nb\İ\Ós¨\ëc`‘3]\Ê:Pm\rÂ³{Öµ]¨B°\Î\í!tt¡soğó6”\Z²£ıN&[·ƒ.z8§‰“3_\Ã\ÅG\æ¬\×\ÇÀ\á\î$\Ûq²\n\é¥;\È|½T!·}ı_/“±³J[\ï0ET6%RbklLğ\\Jp¨n\Å\ÉOy¤\Ép\"\ÑÎ¡)4\niŒeD€g†r;C	\'\èø™Ì¦\æy+S”f2šŠ\ÉW•\È@\Å\Ò2B\ÙgZ&rj\Ë„“£ô€“Ğ‰`B(o¥ùU‹Vq\ZTµhQ\ÑÒ„\êF5ªYRómp•ôˆ¨Qr]“¦\\´ÿĞ¢ZIFTv@6R­\ÒBªl‡¬ÅŠFı\Ú-¨ı\èº22ø‡¿~û\á}ü\Ë\ß\Ã_õo\ß>À¹ùR¶N˜Uµ00;ZZ2Øq[p~5Ñ¥±‰@!Áy\Å\ã° * xN‹g€\\‘ğ~\Ñk\"%d\'ó\Ïõ\Zñ“\Z%–\Ë\ëQb…|]„%ú\ÃSeRü¤š§¢%¼-÷o\Ğöcå£1û\Ö;ˆ\Ü!\0§fQ\ã€u\ï€ÁbnQª\'a\Ù\ÜESf\r±q\Èô24\Ù]{\è\Ù>y³;\Ãi”ûl@7¹\0ı\ì\nYÇƒB•¨L\ËDkó£gqÎ½³h&x\rc+ˆ\\¹\Èù\Ëğ­]\È÷\ä\ê ğ\Â\í\êB¿\Ë¿Ë‰€[ôñ\Ì\í$«õt\ÑóˆZ\á;a\Õw\Â\Şe€\Û\Ğ{7\ÙE\É&\è¼LÀ.k”ğ\×¤Y/€OG’L8\é\Ğ(\Z\ÈÖµ¢ñ\Ñ U8MBc”Œ–˜Gs`²¸\0\Ô”d45\×7E&	D’\á1Î—!¦\\SbU\Ùù<PU\Ã14‡†¸>Áğ\Â\ëA\É\Õ2õ*\'h32\ãd?¦o_\0\'B™8B\nı	?<±~8\èq\Û\Ñe·À\êî›	up°Şˆƒ¢.ô\Ù1\èo`\0ıa#2™(\Î-Ÿ\ÅŸ\á÷óü\æ7\ß\á\Ò\ê\Îğ\0ß¹p„ù›Wd¿OğÏ¿~?÷&\î\Ía>J\Ó*G§T½RA¨BªÛ€t_/\Î\îaj{6\'\ä¢wSJN­Ş„ü\èG”¼š\Ö_„—*D=A*ij\ê\ÚP+5¢<oÈŠB¶+\è!\éÿŠ\É~…&¯W4ñ\ê65ŠKdNN_K`––6¢Kô·÷Á+L<}‚\ÔıGè w\Ù`\ß\ÜC/K\":\Úñ¥`˜_…*\ÊTÈ”«\nS–`XÚ€÷\è\í#t\Í\î0õ­\Ğx\ÏB;2\r\ãô:d.\nh)J\Z»!¥\Ô\éxƒ[‚i¦\ç,Z£Sˆ½q±·0p\æš\Ş\0¼\î~ì¬\"\ès\åG!\nº	@ŸC^(†E\àõ3›(¿”c“‰‰X\Ôñ\ëBo·‘¡„ o>¬:8)\Åj§›\à‹B\êŠB\æ\Ò>„ò\Õ÷\' ˆ\ä\Ğ$ø@	n\ãğ(Ylœ)–L‡‚~·5+šYN¢‰\n\Ğ\ä±g*2\áHŠl8\nE:…\Æ\Ì<dš\"\Æ\Ïô€Šˆ\0\Z\Ã\nÁ&óôC\ÑCb2õ¡J+zÑ²2ü8q\"™AŒ+œ\"˜\èA_\È“›q\İc‚\Ãß…PÀHÜ‡xÒT<Œh\ÜÁ\ï½FyA\"^Û±07?û¯>|\ïó¾ÿÁ{xù\Ş+\Üğ7®\\\Åò\Ò&¾û\é#ü\î\ÏFöq4\çC¤‡7\\*G³LµT\n«\\…°N‹q¦¦µ\íu,.\Ï\âÆƒMl-\áø\Ú\n¯\ï\âÎ³kxğşm?¾Œø\Î>´¡14\Ù\Æ\à!‹Ü¿v¾¼‰w½;W·±>\ÉO5Àô\×\Ï\nøqaoûk9Lg‡rc,\â0w\ä{O†B=8\Ä\ì‹w‘{ğ£!ö\İ]”w»`\Ú\\ı`/ÿà¹±?	ı\"=‘\ZÊ”Œ \à\Í\èX\\\æ6G°nA\ï\æüg¯\åÃŠvr	Æ‰EÈº=(–w ¬\ÉF˜`8Y$CŒ¢¦3•ş\Ë\×0xpŒ¡\ÃK°2UZ¬VÜ½£2\á\0¯9¥8A\à‰N\Çc†û{1\ìp£\ß\ÎPB?\èş¯›¤»ı63\ÃG¯	ı:­v\Ô{<‹¶¼\r´µ½Ã¨bAúSø\Ç ó\'<\"F!ghŠD¡‚2©Š3T\Ñ\Ã53L¶¤\æòı½\È	2U*\r5\ÙN6<%Ó±\0ªj˜S\0—\á¥ÁI97»P/:%iTµ÷¡Z\Ó\rÑ›Y¾na»\'F\ÇCÈ\"=C<‚+f6`…~ˆ8\èFŒ\Ì86•Àø\\¹ùŒ\Í$‘#N\Ö$ƒ\Çû	\Îad¦¹nL:hz\Ù\Üúx\Â\ZFz¿×üõ|÷\Ñ=\Ü??\Ë\ä\Ûss\rZdh\ä\r0\Ñ[;´H÷cû\ì>|ı}ğbvzƒ,Ù± \Ö.l\á\è\Ön_\Æö\åóˆ¬…utö‰\rŒn\âówn\ãg/oà£‡xt~;ß£\é\Üh\Z¹\á¡üx·‹\é^\Û\Â\Õ3S8Z`\Ê»0\â\è\Ä\è K\Ög\ãX¹vÑ³o }ı.²w x|5¾8Ss\è>³‹&@i\Ú\Å5¨’s,å”œ }Q4\ã\Æ6úv.Ã²¶\r\×\Î|ôtş+7\Ñ\á*¬[û¨\ï\éG‰h\Ñ\'\Æ\Îı\ß¿\äÍ·P	\êÀ•+y	8¼}\'\Ã\Ã[o\İÂ™\íE$#Dõû	@R^/b,\\aŸ’,\n\ï•xh¦$“(Áıú,ğ\Ù,ùnNT\Ş4”)†ŒA(zc[‚\çÂ´:F½7G€¦ \íMCNFV\Óó*¢\"õ\nP‘\rÃ‚\é@\Èf\Í¢Š~X£\ÏK‘\0¨r\ê(•€şX\"ÚŒˆ†\è®jô”·uñ|»Q-ºC\Ñö¡FTT\Õö¢À«\ìt DG\0\ÎLg01\Ç\ä\Ô(\â\ã8x²]^lş\ãnŒ¤)ûs8÷\æÜºˆ£«°sı,\æ7§K\r\r\İH¤\Ş\ì,¢Œ\à\é\Ì(¼”6½\ên\äZ;\Şzt÷›ñ\Ñó\ë8»˜\Ä /’–©»µF¥··\Óeg\ë\ÂY\ìL\â\ÊùE2\Ú\æ²H\r1Zº\Ér!„iôû\'Ö°r\ã	\î}ñ+\ÜøÙŸ0wpÙ•},m\í\â\ÜÁ&\Óõ6\Ş\Ø_Á\Ù\å9,Mf1?>‚\\\"©t\ç\Ï\Ì\â\ÌbYQ±“,NF2Y°º|o¼ı%Æ®İ†‡!À9¿\ÄÕ«¾r¢+\×wp\æõ5ú½e\èg–\Ñ\ÄR\Ş£ù&\ËiÀ\ë,[°0¸¸ö0p\á:|oÀ\á\Z—®£\Î;\Ä\0¢%¸\ĞDŸ¥MSš\è½ê»‡	Š(¢\ï3„\ÜAÿş!¼Ë›0v¹À;xp\ã+SYd\"!$B>¤D—»C^$‚dC~öcxÀGIv\äŸ÷\rX\È|ö^øXúû˜”A\È\İ\Ãd\ïXş¢¤\ï\Ç&—õ½)4ùT¿\ÂOFt\ÇóSC(M8\Ëô\ÊÆ°!¼Ÿ,<‚\æğ\Ú½/\Óof	\n.W¤&!¦*PÚ«œTR^K\Ûm(ë° ´­;\ßaee³v‰l\×\áF¹Ş†š.ªõ^T2¹—j\Úq\â÷^\â\Ù\Ç\ï\ã\á‡o\ã\ÚûOqôø.v\Ü\Å\æ\İsØ¹zŒ\Õ\ãlÁ\á­;8s\ç:v¯\ãğ\ÒE$&Hûcvy\ç¯\\Cvqz‚NG/\"cK¸ù\î+\\xü\×\ï?\ÆıW\ï\âğ\ÆuL/¯ I*Ÿ\ÛE8³€\Å3\ç±tş\"¶¯?\ÂM‚ü\Şó‡8sõ\"\æ÷v±²¿‡±õ-¤f—1·³™ı3ğñ¢ŒL/ ³±¾ğ2¬\é\Æ\ça¡iw\r\Ä\åE±\Å\àô\r#*Z§1…ùúcdZM$É¨4¾1\î“\ÏÁE&ij3b\ï\Üeœ½÷‘‹o {qú\ÉEx\Ï r\ï.:§\×P\ç¬f&°5\Ğ\Î-óğ\æf ÷Óˆ‹Á¾\ç7a&Ó™¶.\ÈÈ­óp\î\å}a€òªŠeQat‘ìŠ\á\ÍbZ†²¨³øQa`R\İ=‹ğñuÃ·µ‡NK<½ƒ—/®\àxgó\ÙR1Ú /RQ/rQ*“=@&Ej0€°\Û?·\ß.z\È\ïE€\é¹\ÍB“\'‹f2 \ÌM\à\ÑJ=!’\0A4@O\È`\"¥Z)\èi«‡¢h £É™d\å‘,\ê\é\r…¬Š\ãmeÀhJ\Íüº@2»]ı(§¼–©Œ(Ó˜Q\ÜJO\Şj \àDûÁW\Ùj\çw\Ñû†-Ï€•\î\×\ÙÅ°k\Â	k\ßD~ôË®Á˜\ã0yG\Ğ\â†#”CoŒ7xd:RµFµƒF²\Å\ìD›İNN\Ò\î\è\Í6ôŠ“\ã2’GF\ç›\ZC0“Afj	‘\Ô¢£Kß›¸ø\è)23\ç°u\î&\Î?¹ù£\Ë_?\Ä\Åû÷q\á\î‚\í–\Ï\ãø\ác\Ê\ê\Ä\Él¹•%D\Çf	¶Ix\È\Z}#YôŒÀ\Ğ\ä1FaF\ĞatC\Û†ÁB›¹§N^HÕ…½\ï \Ú\Äøh\'vz=~2ƒ5¿÷a(;Sh\ì\è\n¬ô«\İ\ÙeX&\×	³0¯­¢\ÂÑ\î•uX¶¡e\0\Ñ/oA\Ãt\ÛÀ\Ô@\ĞK(G†…5V\É\\›ûdÀK°¹Àù!\Ã\Ë\Ü\ç¯0=fP\Çk&\ZG\Û\ä&ôs«ùw¦µ\æ”\ëza\İFø\Âø÷\Ïbpıº#¸I»ñ\ÅGp÷\Æl\Í`v,\É\Ô0¦a\Ì\Ğ\ØÏ11À\ÔH“ñF‡…4\Û\é]ˆzmp÷ñø‚P÷%¡tPj>†$”[‰—\ËB´¢M¯É¸—\è\ä¹\Ğ*i£¤\éq&\â,jù]\Î2tC\ÊÀ%b\×ñ\Z‹6\"¢©e±šÀk6B´”+S›ò]§Tª-¨\ĞrR[Q\×\æş±q:X¡u¢¶Ãƒ\ÚN/= Á\Ù6ˆ}‘)˜=C\Ğó\\b\à\ê,LÁ\Ì\Éº\éwLş4Ü”>ûpŠ7‘%Šônd\ï\äÁªy‚]ôH6\ZRG0JÙ!L\ï ¹h°‡&r\å\àO!9yˆµ\Ë\×q\á\Éd)y‘\Å\r¬^¼€\ä\Úœ\ÑYLí§œ^\'µb±™ô²\ä¹\Ò\è\äI·º†¡°@cB«5\0¥cª\ŞA\ÈM´»† \ï´BA_¡±\Ñ\ä÷ú\Ğ\Ğ\ã\Í÷u¨\ë\å¹q\í@\0Zz\Ì\Ñû¿h$­2AÆ‹¤7ú\Ù>‡\Ì\İ{ˆ0Áš¦WÑ™YF\ç\èô,ñš1ñ`MbX‰¼\×Ó‘ñyƒ¤d@Q“XF¦\Õ.‘97\ÖÉ”{è¦Œš\×w\Ñ\Ã\ím[g\á>¸\r¯I­5ypf,7\ÙQ\Ï÷0P\Ó9\0Cf\ç\ÏÂ·¿ÀöÁÎ’ñ¿úô\Ş~zw®\í\àpg³¹ÌŒe¤\"˜K%0‘¤eSù*_“#!” Œ…\éı¼—L¸”YeÿX¾»5™ƒ~“R,cò­fˆ¢g*ªH¤\êz%°x\ÄR¦mğ£Š²^iÍ‰bzº\"\Ñ_c«\r\Õ-”\Óv+*ZºP¢\î&	¸\Ö^”7š9w¡DoAY‹×¹›Ù‹\Ò\æ^‚Ö‡J÷\á~%dÉ’+N~õ\rúY¢Csg\à\ÎLÁ=¾Š\áE\ZjÊ¤{v©5\Ğ\ì÷Ef‘Y\Ø\Å@nÁ¹-xG¦0H–ğO/\Ã\Ï`pf\î‰M8\éÇ—\á\Ê\Íb\Ñ}(¹Šó\à\á7?\Ãá‹±w÷=l\\{‚\İ7`\áòLŸ{‹\×\îbŠ`\î\è\Z\æö/a‚¬‘œ_C€R;H úrS0ñ‚´t-ftYoj1\æ¯´Po…D\×M@Y!\ã\ÉÕ«ÍœD¯”\Ñ\êKÕ„\n\Ñò_¢CyC\ÊzD\Å\ÚÂ²*”KÚ°şòL¿x\Ï\ê>\Ìôw-\âZ	/,˜#ˆ:ú›jšw\íø\ìgö¡›_G3eH6À\Ô\è¢…bh\É\ÍC\Ç}»VSn\ÂFh#:\ÈhAJ{\Ûø,jXP\Ùr\Şõ}\è\é³d\ê\Z“-sğ\Â1úcnmÁ3»‰ù\Å%üôË§øä½‡xñ\à\n\Ş\Ü\ÇÁ\Æ,–Ç’X¤gœ\Ï\Æ0Ÿ‰1,&cù\îz\ç\ÆF\èË£ùn\Òdƒ”X¥y8ÿI:d\Z\æòx\ã‘D­‹\Ì\ç\á9¸\Û\ÊxÎµ†A”Q6EMŸ\âJZùú€¥\Z\Ñ\æƒÒª\éd‚5¢‚ +\'\Ë[¨6Š»ó\íBªô¬^ô#@(:1·‘!	P\r\ï…NÈ°\åZ3CJ7N\ì÷-®ıö;\\\ëK\\}ò.>ÿ\Z{œo=şw?Á,¥q\á\êSL\î]Gv\ë)–\Ş\èô†8\r&—`KOÀÌ’“”Q˜ ´\Şa\é5ºú¢\è\è C… aIk·08MA\ÈÚœ¨g	¨Rt¡NôñB€”¢¯—N§j$(M,E%\Ú&ˆWp¢ByŠJeù7%%J¼^Ö€Ó¥œ,®\Æ\É\Ò\ZN\\VT\×KkñWõ\\§À\ë\Åu8Y¡BA¡§¸\\\ìózY5·“ R~ğ\İÏ±ò\Ù{ˆ»®±etÄ–˜\É4\írJW]\'o„\Ñi N	^š¡£\ÂÀHğKLı¨‹\Ñ4¿€¹\rt.m\Ãvx¦½}÷\Ğ{t\ßñ1šÉ¤µVú/¦\æ\É9Jô\'È¤\"…Z	ğ †.\\‚û\è|{ ggğñ\ÇOñ\å\Ç\Ïğñ;oâ­§ô\ÈW÷±;/Z\ÌE1K°\Íf\\\ã¹$\çQ,Nci6¾,kl\Z-ôRz\İÊ¿„S\æ‚Š¦‰VFN0J˜†\ë	Di Mif1“õ(%”Õ¢&2KWLWŞ¡\Ï\'W\Ñ|©„‰¾R0¡òÇ®’K	D1•‰Š«—\è¡œlX\Êm\ÊZºQCğÖŠv$Ü¯ƒ $hOÌ¿û.¶ÿæ§˜yö´JeNŒ±\ÛÀ,í²£\Ö\ÒU§:3\Zò–\É6f\Z\ÊHZ85¶¢¶±‰L\Ó©²…lÓŠz¥\r¤\Şú\Æ.H4v4¨õ4q]£:\ß]…TƒÊ†6”\Õq.\é€\è‰@´~«¬Ö ¼F…2‚NT~-ª’p.Z­\ÉQ(ªNUÖ¡°DŠ‚r«LJpÕ ¨¸…¥\\W^MP\Ö\â$—Ÿ¬¬EAiUş\íÇ©Š:qù\ëñZeŠÊ¥\\V\Ã\ïµœ\Ú\Â\æO?Á\Â\Ë÷1ù\ä9ú/\äkó6%\Èpƒa4øbLnN\Ô1@Tu@Ì )6F\íÈ·+T\éP¯£¿\ZFs&\Íø:›»0lÀÊ©—¿\ç;)ÿ¶¤¢/„ÚQ´Šš5›;\è;¾\ã\ê\Ô!³N†7Y³ÀuR¾©)¼xş\0?ı\ä1>ÿ\è1>y÷\ÍüsÎ«\ç7°6=…\\\Ë\ã,Œ¥1ŸKaqjKS”\ã\É$ôô\Ë-d³&ñ^\Ú‚¼Ÿ!cx²ˆ¨²€¦ôl>\\U\Z\Âôf”N2UT‘ªG‰\ÆJ\0‰\êf\æ<–iºQ!¾·\æ\"»Q\0Ë¸¬ŒÛ—\ÓV©\İ(i\çv\ZŠE³M\á\r	\èâ®|X\É*\Ô*À+&N¤\İ\Ç\Ä\Ëw±ö›¯0~ÿdº(4F4ò\0zHumPvô@\Õ\ŞUK\'ä­´ó`;\Ú\Ñ\Ğ\ÚJ )YJ\ZP¯jL\ÑA5B®j\æ\ç¦ü\ë½F•5\Z9ª\ÛEw¢Fu=\Ê+kPN0”V)8±L‘¯şU#šN\Ö€’f‚R´¼k@1™°´RÂªjü¤Š€+k\"À\êÉŠ|“\âz5\Ê\ëô¨n\Ğ\æ\Â7´ö ¶\Õ\ÈBcC³\ÍO\ÙS¶\Ãôª!XQú\Íx)Ÿ¡tœai\Ûbõg?\Ç\âÇŸ`ú\É;ˆ?º\nû\Ö\è¦\Ét”\â:ú\ãz›\Õ\\¥º\Ë\r•?\ÌÏ¼2Àv^l\ákzPeñ ~h–\åX\Ö4Jz÷\Ï3QC\ÏA\Ö¤0I\ÏÂ¶½‹¡7\à¹x=+{¨£œw2a»)Ù}8\×(\ÃS\Ë8sş<~Jü\ê\ã\'ø\ìıGø\à\Õu¼xx‡«‹\Ø`’_ca4A ¦°:‘\ÄúLzyM|\êH&\ß|@%@/“Õ‰Q´³0(Ci”=8I²(À¢”Všã‰¶¿.z:Š(¹ÅF”ˆI\İI\ßF)&ó•µi\éE\È0s?3Š\ÚD\Í\é\Ö|§Ÿm”\Ó#[‰†Şs\ÑóVy““i˜\0l\'+¶¶S\æ)Á\ÙgÏz\ë&^=\Åî¯¿\Ã4Kœ\Ò\Ò•VCĞ©¡Ğ¶@©é€¼Q¥ZK\ÕYk¤\Í-Pˆ\î_›[¡ ³5lšv™²mšV\èô­\è2š\àô\Ú\Ñ\×o†µW\Ïõ\Z(¥*4H$(¥\ÖI\ĞP\'Gƒ´-ğôt#ara+{Ø½|\ç˜\ßxpw^\ÜÆ¥{ob’¾h÷ü\\¾sO_\İ\Ã[Ÿ½ÀûŸ¾‡¿}_ı\íGøöûOğ·?|…ø§Ÿ\áŸşõ3ü\Ó?Šÿñ\ãÿ\îüğ\Ã;øşo\áO¿{\ßüş!>û\è\Z.<{Œ¯¿\Æò\ç?CòÁ#$\ï\ß\Æ\àÅ‹\è;s\İ{Pe¦Q\ÃPS¥sæ»¢¨\âÅ­1S2^ˆ¹ª\èmJDß‰dÁ\ZÑµmo\Í\á1´§\ÒL\ËL\Óg¨\çòoª­T»h\ÌLÀ°¶\ï9z¾½³d¾´M/A>”†•Ó½^¢2\é(}ø\'=\Å¿ƒ/>xŒ\Ï^\Ş\Ã\Ë\'\×pû\Â\nv&3Xœ ÷a)7†•‰4&\'\Z“Sh\Î\å	Ÿ\×\è\É@*\êòQfC)T|(k\Òã¤´\r§e:‚M\Ç\ä&2©P¢fq“\é\ÇpÁÏ‚+\ÚzHJg;™­U‡:=eµ\Í\Ç\å\âüµ”i\\\È>\ê\rù\åµm\Z\åX±Q®¡\Í#1tö\Ó†Èº»x·õ\égÈ¾û\0£\Ïaò\åclşú§\áH;¨—¨Q-•¡VÙ„\Zy#\ÙNi“‚’\ÚH\ß&‡L*E½\\	‰´\ZMMX ‹«gA\ç\Ä\áÁ2~ó\Íyü\éWñü\î8\"Áf˜ôhoª\åöõPJj!•T£UU\r—İ„©±–§±²½„­ƒ-\ì\İ\Å\Ö\Õ#]?\Â\ä\ê¢”\ãCLo-c\ëü>6÷±M0nŸ\İ\Æú\Ù\ï\ãòÕ³¸Ep¾y÷,?>‡\'ñ\èş1\Ş=‡\Ço\â\Ñ\İ#Ü½½‹•©t6¬<£\Çı\äC¬~øFÈ†«\á:·+—\á:~=»Ğ¾º\nebœ\æš\éNt=f \0E2\nš…ñ6\Ò\\÷ó\Æó¯º”b\\5w”òBk&\ï\á%zÀ	\Ô\Ğ\ì\×\rÆ™ \ÉH\Ó\Óp\ìœ\ÅÀ¹K\è\İİ…vq\Íñ1˜Éšn2 ,\Ø\Ş\Ç\Ğ\Ø,=¹\Ï>~ˆO>x„O_\İ\Ä;O®\â\á\í=œİ OPŠ9‘\r\ç(\Ã\éL&t\r\Ø’¾¼y€~v„8È€\Ñ\Å@\Õ>HûĞ‰S\ÒF¼&S“\ÙÌ¨1£¢Û†\"°bZ&ñH¥L\ÓG#k5;Q©60|¸,¼?>‚^±BŒf‚³Å™.£”\ÌWL†«l¤2\è8\ïe\"ö \Ôd£xQ\ß7	Sw3mA+úD\î\é#L}ş!2\ï?G\ê\åCL|ñ;¿ú9&>}™ï ¼²ò©T\ækñV«>Y\r$fe\åQR…ú\ÚZÔŠvÊ­­d\ÇvAşü¿şˆ¿ü?\à\Ïş™^zeĞ¶×£Q&GmM9½\ŞiÈª«¡U©\à4\Û\á\íw 4Ô‹Hh\áX!&¹(/¨?×ŸÁÊ¾@9L\Î,\"5‘E0B8€¡\Ä\ÙH>ùML`eq[S\Øİ›Á\á\Æ$v6§°¹\Åi}£¹m02oKO\0Û¿ø“\ï¾\ÂÒ«—˜z÷9\"o\ŞG\×\æºf6ó\Ïöº\×W`X\İ K-£”2[È”\'º\'+e‰/¡|\ÕPË¹¬>\ß\ï2_*zG\Ñ\àG¼ò\ê\Û:‡\Öñ)\Ôõ\Æ8\rB>HY[€q“o—}p\Ã\Êš	ò®YQá•¬\ÉÿX\ßC\ß\Ìö¶·ğÁû·)ÁñÁ[·ğ\î\ã\Ëx|û,®­as:5\Ê\ï\Ü\Ø0f\ÆG\àIL -6öøL¾gñ–£qhŠT\n—Ÿ\0b*U˜pRÖŠSõ\Í(R\Ó6ñ¸k»ı,Dd?Ú¯²F\n›	8Á|•\"Dˆ\î›+:œ¨aÀ\ÈûA®/£\Ï/R7i\éùºXş>fÖ+¯E /X-,-‰9\Î\çÑ\ÈAK¢……ó„“±?F\é™|ù¹÷\Ş\ÂÌ«Wy@®şúK\Ì}A&$J%R\Ô(š!‘7£¾AN\0*PUWÁ Q…:z´zz5A\ÚH€š{ºpó\\<\ß\Çş\çoñÿ\ï\ßá·¿û\0¡AúÌ•hk¬G\rı]iU-*+¸]%\Z\åµ\Ğ\ÒOj\r\í0Rşmf\'¬\Ö˜=]°ùl\è\ìÀB”’\ã†0\Ì\ê‰a´;\Ğnu «\Ç\r›Ç…\Ş‚ØpÈƒd<ŒT:€\\ÔdØ…XĞpĞ„6}ó—\ßAqm\ÌQ\Zø\ç\Ï0õü%\"—¯büÁŒ<¹\Èu2\ßş\ÔÓ‹ù†Öšœ¨„9\Ép2Ype\İd;Kµ\ì\×B0\ê(\'¢\ËYƒ•\İS¿,ÀdiB\î\Z†ue\êñ‰ü\ê²dÀ\ä\Å7\ĞgºP\ì”\\\Ó\ŞZ\'VĞ’œEÿ\Ñğ\í_Dø\Ì%v¦g{÷Ù›x\ï\å¼|qo\ß?‡‡7öq\í\â6\Ø,6&¦°01†4P›˜†š\ÜE}`˜);ih:ÿ\ß2“›R\ÉT+3\àu©\Z§dZ”62’¡ªmù!W‹E÷j”\ßRÚ\nŠJz\Û\Ên1¿WŠş¹5.²ŸƒşŞM[ş\Ù_Y;¥\Ø\Ø‰e\0ò\Ş~4%¡ş32É´-\Òxm#¢Rjš\çG6\r£u$\Å\ë9‰ZJf{Á[—‘{\ëO\î\"ıô>¦^=\Ç\Ö/>\Ã\æg\ïÁ\êƒ\×gÀ€_€\ÛŸ¯\î€\Î\0—\r˜\àr·Á\ã\î\Ä\Ær\ßÿòş\áşõ\ïo\àO¿}¿ıö¼¹X\Èj\ËQEÖ«!s6\Ë\ë\Ğ\Ş*GG«ú6­MdH²dG#\Ìú6tuw\\]°°u÷y\á\Â\"Zv…B°\Ğn7¢©\\«\Ó\Ã`µ¢Ë¦…]Œ\îv!vb8\äB„\à÷÷b\ÈgAooì”¥Kœ	[†\Î\ØRWoa\ê\ÑcôŸ?†L\å»t‰‡\à»ö´;{h]#§\Ñ0\Ì\éO\ç{­¢„”õzP¬\'[Ğ´‹©¢“F\Ûl£\ÄõA\ê&ÀúÄ	H97e\æ w\ÆP«g˜q¹\é\Çxƒ²3\ĞÎ­Àw\Äÿ\İ!Ã®\íÁ0±\n•xµ²/@ÿ\Ñ\ÎÁ›šÆµûLÀWğò\Ñe<»y„{—vp\ã\Ü\ÎÓ®l\Îe\É~1\Òj“\Óh‡r(µmô\ÍL\îRsu‡%\ÒNÔ·\ât¾­O;ı]7j\Å\èG]bP Fl\é¢o\Çf°\å“ma»b$R‘\\%F7Æ‚\ä\nB2˜\"sOABR“}›	4‰HœŠI\\\ÉBEùo\ÊN£1+>\çĞ–œAsfI2`\Ë\Ì(\Ôsh]›…ÿ\Ú!‚o\ŞD\è\Ñ?¼ƒ\ÉO°LI¾òõs|ô\î\Ş{¯^\ì\â\Õ\Óm¼ıp\Ï,\áÉ›K¸g‰>kÿÏ¿…ÿøó{ø¯?‚ï¾»…k\Ç\ã¸x \rø\á\ïi„®©*U-\ÖNLOQ2\æ˜™öc|*ˆ±‰0Æ²Lpù\ØD\0c)/¬‘xÆ–fâ‰…bŠ’\Í(·„\Ş!;z\İvø\è7}¡x=†\íˆGú‘HºK¹\å\ïdø‰¸\r½^#ô¾\0e£•2\rSğ-aøğÃ—¯\Ğ\ïQ*\Å#’õx\ÎÁ{\é\"L»ûh¥“E\Çò\0T³\å\è	s¨µ‡\éŸ\èZlùö!Uz+\ê\É2\rÿgx+¥?9SoA!qóÓ”‰}L¨‡3P.\Ãyp½s\è\İ;O\É\ß\ÉË”i|\Şğ\Â%„\Î]\Æ\à\Ê&F\Çñô\ÍKx~‡ö\ÖYÜ¾¼…kG\Ë8f	;K£˜œJ\Ã,j+‡3ù”®¤\Ï\ZN“eÈ†Ád~dób‚ë´¼\r§”Zœ’Q\Ú@f£·«1øQk¢<\ëMôr:r*R\ÜI{\ÑmFuw\Z(\Ñò(ZÄ 3¢%%¾%:‰\ÆH\ZqÚ‹D\Íü¯\æD\Z\Í#?¶Q…‡\É\Ä<OQ%lMdı¦XŠLŠ@\ÌBšÀ‰\Î\å)4®Î¡ucú%ø®ò\Âcğ\Úİ¾€ô\ã{Xù\è¾ÿ\ç\ß\âÿ\åOø\Ëıÿû¿¾\Çü\×\ß\à/ùşó/¿£\Ïû5şüŸ\ß\âû\ï\à‡_?\Äûw¯O\á\Ì\Êö\æH…p\é\å\ès6c}>Šï¾¾?|ÿ\0\ßÿğ¿û\ãC|ÿû»ø\á÷\Ü÷wñ÷x\Äùsü\á‡ø\ã\ã7¿»Ÿıò6®m\áñ\Ã#üò—wñ\Ë_=Ä·¿¼o¿½ƒo¾½…Ÿs\ÓUü\â›\ëøú›[ø\é/®qş~ş\íM|ıõuüâ«›ø\ê‹ø\äóc\\º\ÉÀr°Í³óˆ\ï\í gi\î\Í3pmlÁ¶N\Ï\Ç\ïâ¡±x\Õ\æXYE\ßö6L[»hXb¨H¢šv@Œu¦m\æPf°ğ£¶ge4\çUjl~zDD\âd¾™)Ô‹Z\â¼Ñ¢\ç)1¼iy«=\ß#6¹\çñ•| 1­\Ù\ç%\ãy\Ïòú_yCg)\Ã\ëghG\ÂdÁÜ½Lö»z€¶p\å\ìö\Î\Ìaoe±\ÙE´E\æ	ˆI2oªaş7F•¤ÿóòµlf¼N+U ×£¸ k´t,8d4Q=ªB×…r1\0¥’?0BğP.“´\Å)\ëÁQ\×(T¹)´ŒMr\"\Ã1ü¨Y4Ñ¦4Ñ¿\ZF&¡¤\ßUò£\ãù°\ÕD\ï)z\Î×Œ\Ìœ”c†0U*	uF´YÀ‰\Ö\Õ	p…\0\\Fóú<¥`\î\Ë\ç\Ğs\é\0Ö›‡ğİ¸ŠÄ;X}÷¾óŞ¹¹Š\ç7fñô\Î^\ŞZÁûv\è÷\Öğù\ÓU\Ü;\Î\àşQwG°œ\ëÁ\Æ\â\06g\íğ{›1\Òß‰½\å0/\\·.f8O\â\Æ\ÅqÜ¹”\Â\Í\ã,n_\Ê\à\á•yÜ½2‰7È¨·\çñô\æ2Kı\ßZ@(>„\×gñÖ½E¼ıx/\ï\à\í§kd\ã\r¼÷Œ\Çğ\Ö.>|g¿³O_\î\á\Ë÷÷ğõ‡ûø\ÙGgñ‹O\Ï\â›/v9\ÇO¿<‹Ÿ}.¦ó\È\îì¢‡Ä³v\0ı\Íq*#/dS8I\'j\r‹õ˜–g–\ĞC\Z\×V c©­t\Ñ\ë\İ\ÚB³ù7d¸ü¥¸_\Z5$œ®0\Z8º&	^ú\Â2\Ñü±‘\Ò&Æ½k5ñ¦»\Ğ\Ğ\ËW×²¡›ÿ¡›Z„’\É\Ê\ì\Ü;\Ê7Tòî Ÿ\ç±Ş¼|ˆ\Û\×qó\â\Z\Î®\à,\Ã\Õö\æ<|S\Ëh\rNCI\ÉUŠ\n<>Y˜u=”Z;Š(¿#N‰^n¥:ˆA½+L´C\â5Y\ŞLIV“¤EE$7\Ë\ã™#°f\Ğ><E<\Çe|KhŸœ\å\\„›It\Ä2>\ÙWA†kŠ\Æó\ÕòG\æx]’h%K\æ«ó+\âi²#ƒ\Òhœû\Ï\áD\Ó\"Q;?–iú”y´®\Ï\Â|¸\îó0\ï\í£w‡%t±M#|óp\×÷½¸v\Åõƒ8\î\ì\Äñ`?‚G\çã¸±\Âõ!\\\Ş\nc:\åÀ\ÚB?\è¿z\åyº1\î\ÆB¦“#VŒ\'µ‹µb\"¦G&Ö†lÜŒlÌ‚ôpR\ÑvŒ«‘\ni1\îd€\Ğ1p\È\ĞklCx 	z\Ğô\0\×\rqo;’ş.$ƒ\íHù›‘\n´\"9Øh¸¿\n1¿‘t\"1¤BbP\Ç}»1š‹ a\æ©58\æ÷ §\'kı\ØEÆ™`Ã¨\ï£\ÊÒ‡R£)ÿŞ²ŠÁH\ÎÛ˜\ã…\åÅ—e&ó\İRHDM`š~¥h	&º›^B\ëA$\ŞDD¹|(…öñYH\Ä[&\ä2\r¾JG@0¼t¢¦\Ç\ë\Â™s÷\"³ô\éu¨§¶a];\Ï\Î|dg\ç\Üœ^\Î\ïn\â\Úş.Ÿ[Ç…ıel®`…\àµ\å¶ò\ŞOŒ&Q	a(iœ2\ç\Ê\äSzY\ÙO´×–\èP¤rBT‰Õ³Ü¾92\ÂIT<£iXT/\ã\ç8­»•\Ò/:jaÁÓµ\Ú\éİš(µ\êJ¬;iz»Tu1,1½r¾¯\Ñds˜^P<¤h*e»15›o\Ò¡\\ózŸ¨q÷¡‚¿\Â×J¿’!7ªL2i\Ò0Í¾\":y\Üu8\0c6†\ÔT“±.Œ˜	3¦c&\Ì%LX\Ê\Ø01c,dB6l€×¦ÂWƒ §•Ş¯fM\r½Ÿ\Î^\çpôTÁn\ád”\Â\ÖU‹}¬ú*\Øte°\è\ëa1\ÖÀ®¯„EW	[G\ÚZÊ¡¨)‡¶¥f]\r§*X:+¸-\Ó,·7*8\ÕÁ¬“ø\\\Éy\r,	z\ÚK`\Õ\Ô\Â\Ò\Îı¸\Ì\Ö!…c\ÈM>\Í\íE“7@©ô)ŒVT\ê(WFŞ¨NüD¢\Â¯¨\Å+¬\Æ_•)ñ“:UşmQ‡\rş”ö8Q\ëô¡\Ê\æF“€rxQ\åò\Ñ+aÔˆ*Q>?\Ä\Ø§›MxM4q­\ãd•\èè©ƒr¨#S†\Ğ\Z\'{0=Š\nU½>Tzú\é\ã\ĞDS!hüQ¨tvx¼}‰b4A:Db$S4\n™\Â(:Š´s\Îc¡­ \'-Uió=Cü÷\ÒZNRü_¢8\ÃEq\'\ÏÁØ³•=^&{\îk¥3\\•\Ùm¨\ì\å\ï9ü,xv\ÔZù[\Ö>\ÔzûQg\ï\çùz¸E\İdrqcw¢ŠûH¸®\Ü\Âß°\Ğ;Š§¼6V^·5ü½JCÿ§\Ô\Â\ãbá®°;ğÿA–Œ[#\0\0\0\0IEND®B`‚','image/png');
/*!40000 ALTER TABLE `imagenes_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresados`
--

DROP TABLE IF EXISTS `ingresados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresados` (
  `idIngresado` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `FechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Motivos` varchar(45) NOT NULL,
  `numeroHabitacion` int(11) NOT NULL,
  `FechaAlta` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idIngresado`),
  KEY `fk_Ingresados_pacientes1_idx` (`idPaciente`),
  KEY `fk_Ingresados_medicos1_idx` (`idMedico`),
  CONSTRAINT `fk_Ingresados_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresados`
--

LOCK TABLES `ingresados` WRITE;
/*!40000 ALTER TABLE `ingresados` DISABLE KEYS */;
INSERT INTO `ingresados` VALUES (1,4,2,'2017-07-06 06:00:00','accidente carro',2,NULL),(2,3,1,'2017-07-06 06:00:00','descarga electrica',3,NULL);
/*!40000 ALTER TABLE `ingresados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresados_empleados`
--

DROP TABLE IF EXISTS `ingresados_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresados_empleados` (
  `idIngresado_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `idIngresado` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idIngresado_empleado`),
  KEY `fk_ingresados_empleados_empleados1_idx` (`idEmpleado`),
  KEY `fk_ingresados_empleados_Ingresados1_idx` (`idIngresado`),
  CONSTRAINT `fk_ingresados_empleados_Ingresados1` FOREIGN KEY (`idIngresado`) REFERENCES `ingresados` (`idIngresado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresados_empleados_empleados1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresados_empleados`
--

LOCK TABLES `ingresados_empleados` WRITE;
/*!40000 ALTER TABLE `ingresados_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresados_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `concentracion` varchar(10) NOT NULL,
  `presentacion` varchar(20) NOT NULL,
  `via` varchar(10) NOT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (27,'Bencilpenicilina','1000 ml','Frasco Ampolla','In-venoso'),(28,'Dicloxacilina','120 mL','Frasco','Oral'),(29,'Amoxicilina','500 mg','Capsulas','Oral'),(30,'Cefazolina ','1 g','Frasco Ampolla','In-venoso'),(31,'Cefalexina ','500 mg','Capsula','Oral'),(32,'Ceftriaxona ','1 g','Frasco Ampolla','In-venoso'),(33,'Clindamicina ','300 mg','Frasco Ampolla','Oral'),(34,'Cloranfenicol ','500 mg','Capsulas','Oral'),(35,'Amikacina','1 g','Frasco Ampolla','In-venoso'),(36,'Furazolidona ','100 g','Tableta','Oral'),(37,'Fluconazol ','2 mg ','Frasco Ampolla','In-venoso'),(38,'Levofloxacina','500 mg','Tableta','Oral'),(39,'Aciclovir ','500 mg','Frasco Ampolla','In-venoso'),(40,'Abacavir','300 mg','Tableta','Oral'),(41,'Zidovudina ','10 mg','Frasco Ampolla','In-venoso'),(42,'Omeprazol ','40 mg','Frasco Ampolla','In-venoso'),(43,'Loperamida ','2 mg','Tableta','Oral'),(44,'Dimenhidrinato','50 mg','Tableta','Oral'),(45,'Metoclopramida ','10 mg','Tableta','Oral'),(46,'Benznidazol ','100 mg','Tableta','Oral'),(47,'Mebendazol ','500 mg','Tableta','Oral'),(48,'Beclometasona','50 mcg','Aerosol','Inhalado'),(49,'Nitroglicerina','0.2 mg/h','Parche','T-dermico'),(50,'Flufenazina','25  mg','Ampolleta','I-Muscular'),(51,'Medroxiprogester','150 mg','Ampolleta','I-Muscular'),(52,'Dorzolamida','5 ml','Frasco','Oftalmica'),(53,'Latanoprost','2.5 ml','Frasco','Oftalmica'),(54,'Permetrina','30 g','Tubo','Topico'),(55,'Tretinoina','31 g','Tubo','Topico');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `idMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(45) DEFAULT NULL,
  `idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idMunicipio`),
  KEY `fk_municipio_departamento1` (`idDepartamento`),
  CONSTRAINT `fk_municipio_departamento1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Sonsonate',2),(2,'San Antonio del Monte',2),(3,'Sonzacate',2),(4,'Nahulingo',2),(5,'Nahuizalco',2),(6,'Izalco',2),(7,'San Julian',2),(8,'Juayua',2),(9,'Salcoatitan',2),(10,'Armenia',2),(11,'Caluco',2),(12,'Armenia',2),(13,'Santa Catarina Masahuat',2),(14,'Santa Isabel Ishuatan',2),(15,'Santo Domingo de Guzman',2),(16,'Acajutla',2),(17,'Ahuachapan',1),(18,'Apaneca',1),(19,'Atiquizaya',1),(20,'Concepcion de Ataco',1),(21,'El Refugio',1),(22,'Guaymango',1),(23,'Jujutla',1),(24,'San Fransico Menendez',1),(25,'San Lorenzo',1),(26,'Tacuba',1),(27,'Turin',1),(28,'Candelaria de la Frontera',3),(29,'Chalchuapa',3),(30,'Coatepeque',3),(31,'El Congo',3),(32,'El Porvenir',3),(33,'Masahuat',3),(34,'MetapÃ¡n',3),(35,'San Antonio Pajonal',3),(36,'San Sebastian Salitrillo',3),(37,'Santa Ana',3),(38,'Santa Rosa Guachipilin',3),(39,'Santiago de la Frontera',3),(40,'Texistepeque',3),(41,'Antiguo CuscatlÃ¡n ',4),(42,'ChiltiupÃ¡n ',4),(43,'Ciudad Arce ',4),(44,'ColÃ³n ',4),(45,'Comasagua ',4),(46,'HuizÃºcar ',4),(47,'Jayaque ',4),(48,'Jicalapa ',4),(49,'La Libertad ',4),(50,'Santa Tecla',4),(51,'Nuevo CuscatlÃ¡n ',4),(52,'San Juan Opico ',4),(53,'Quezaltepeque ',4),(54,'Sacacoyo ',4),(55,'San JosÃ© Villanueva ',4),(56,'San MatÃ­as ',4),(57,'San Pablo ',4),(58,'Tacachico ',4),(59,'Talnique ',4),(60,'Tamanique ',4),(61,'Teotepeque ',4),(62,'Tepecoyo ',4),(63,'Zaragoza',4),(64,'Agua Caliente ',5),(65,'Arcatao Azacualpa ',5),(66,'Chalatenango',5),(67,'Comalapa CitalÃ¡ ',5),(68,'ConcepciÃ³n Quezaltepeque',5),(69,'Dulce Nombre de MarÃ­a',5),(70,'El Carrizal ',5),(71,'El ParaÃ­so',5),(72,'La Laguna ',5),(73,'La Palma ',5),(74,'La Reina ',5),(75,'Las Vueltas ',5),(76,'Nueva ConcepciÃ³n ',5),(77,'Nueva Trinidad ',5),(78,'Nombre de JesÃºs ',5),(79,'Ojos de Agua ',5),(80,'Potonico ',5),(81,'San Antonio de la Cruz ',5),(82,'San Antonio Los Ranchos ',5),(83,'San Fernando ',5),(84,'San Francisco Lempa ',5),(85,'San Francisco MorazÃ¡n ',5),(86,'San Ignacio ',5),(87,'San Isidro ',5),(88,'Labrador ',5),(89,'San JosÃ© ',5),(90,'Cancasque ',5),(91,'San JosÃ© ',5),(92,'Las Flores ',5),(93,'San Luis del Carmen ',5),(94,'San Miguel de Mercedes ',5),(95,'San Rafael Santa ',5),(96,'Rita Tejutla',5),(97,'Aguilares ',6),(98,'Apopa ',6),(99,'Ayutuxtepeque ',6),(100,'Cuscatancingo ',6),(101,'Ciudad Delgado ',6),(102,'El Paisnal ',6),(103,'Guazapa ',6),(104,'Ilopango ',6),(105,'Mejicanos ',6),(106,'Nejapa ',6),(107,'Panchimalco ',6),(108,'Rosario de Mora ',6),(109,'San Marcos ',6),(110,'San MartÃ­n S',6),(111,'an Salvador ',6),(112,'Santiago Texacuangos ',6),(113,'Santo TomÃ¡s ',6),(114,'Soyapango ',6),(115,'Tonacatepeque',6),(116,'Candelaria ',7),(117,'Cojutepeque ',7),(118,'El Carmen ',7),(119,'El Rosario Monte ',7),(120,'San Juan Oratorio de ConcepciÃ³n ',7),(121,'San BartolomÃ© PerulapÃ­a ',7),(122,'San CristÃ³bal ',7),(123,'San JosÃ© Guayabal ',7),(124,'San Pedro PerulapÃ¡n ',7),(125,'San Rafael Cedros ',7),(126,'San RamÃ³n ',7),(127,'Santa Cruz Analquito ',7),(128,'Santa Cruz ',7),(129,'Michapa ',7),(130,'Suchitoto ',7),(131,'Tenancingo',7),(132,'CuyultitÃ¡n ',8),(133,'El Rosario ',8),(134,'JerusalÃ©n ',8),(135,'Mercedes ',8),(136,'La Ceiba ',8),(137,'Olocuilta ',8),(138,'ParaÃ­so de Osorio ',8),(139,'San Antonio Masahuat ',8),(140,'San Emigdio ',8),(141,'San Francisco ',8),(142,'Chinameca ',8),(143,'San Juan Nonualco ',8),(144,'San Juan Talpa ',8),(145,'San Juan Tepezontes ',8),(146,'San Luis Talpa ',8),(147,'San Luis La Herradura ',8),(148,'San Miguel Tepezontes ',8),(149,'San Pedro Masahuat ',8),(150,'San Pedro Nonualco ',8),(151,'San Rafael Obrajuelo ',8),(152,'Santa MarÃ­a Ostuma ',8),(153,'Santiago Nonualco ',8),(154,'Tapalhuaca ',8),(155,'Zacatecoluca',8),(156,'Apastepeque ',9),(157,'Guadalupe ',9),(158,'San Cayetano Istepeque ',9),(159,'San Esteban Catarina ',9),(160,'San Ildefonso ',9),(161,'San Lorenzo ',9),(162,'San SebastiÃ¡n ',9),(163,'San Vicente ',9),(164,'Santa Clara ',9),(165,'Santo Domingo ',9),(166,'Tecoluca ',9),(167,'TepetitÃ¡n ',9),(168,'Verapaz',9),(169,'AlegrÃ­a ',10),(170,'BerlÃ­n ',10),(171,'California ',10),(172,'ConcepciÃ³n Batres ',10),(173,'El Triunfo ',10),(174,'EreguayquÃ­n ',10),(175,'Estanzuelas ',10),(176,'Jiquilisco ',10),(177,'Jucuapa ',10),(178,'JucuarÃ¡n ',10),(179,'Mercedes UmaÃ±a ',10),(180,'Nueva Granada ',10),(181,'OzatlÃ¡n ',10),(182,'Puerto El Triunfo ',10),(183,'San AgustÃ­n ',10),(184,'San Buenaventura ',10),(185,'San Dionisio ',10),(186,'San Francisco Javier ',10),(187,'Santa Elena ',10),(188,'Santa MarÃ­a ',10),(189,'Santiago de MarÃ­a ',10),(190,'TecapÃ¡n ',10),(191,'UsulutÃ¡n',10),(192,'Carolina ',11),(193,'Chapeltique ',11),(194,'Chinameca ',11),(195,'Chirilagua ',11),(196,'Ciudad Barrios ',11),(197,'ComacarÃ¡n ',11),(198,'El TrÃ¡nsito ',11),(199,'Lolotique ',11),(200,'Moncagua ',11),(201,'Nueva Guadalupe ',11),(202,'Nuevo EdÃ©n de San Juan ',11),(203,'Quelepa ',11),(204,'San Antonio del Mosco ',11),(205,'San Gerardo ',11),(206,'San Jorge ',11),(207,'San Luis de la Reina ',11),(208,'San Miguel San Rafael Oriente ',11),(209,'Sesori ',11),(210,'Uluazapa',11),(211,'Arambala ',12),(212,'Cacaopera',12),(213,'Chilanga ',12),(214,'Corinto ',12),(215,'Delicias de ConcepciÃ³n ',12),(216,'El Divisadero ',12),(217,'El Rosario ',12),(218,'Gualococti ',12),(219,'Guatajiagua ',12),(220,'Joateca ',12),(221,'Jocoaitique ',12),(222,'Jocoro ',12),(223,'Lolotiquillo ',12),(224,'Meanguera ',12),(225,'Osicala ',12),(226,'PerquÃ­n ',12),(227,'San Carlos ',12),(228,'San Fernando ',12),(229,'San Francisco Gotera ',12),(230,'San Isidro ',12),(231,'San SimÃ³n ',12),(232,'Sensembra ',12),(233,'Sociedad ',12),(234,'Torola ',12),(235,'Yamabal ',12),(236,'YoloaiquÃ­n',12),(237,'Cinquera ',14),(238,'Dolores ',14),(239,'Guacotecti ',14),(240,'Ilobasco ',14),(241,'Jutiapa ',14),(242,'San Isidro ',14),(243,'Sensuntepeque ',14),(244,'Tejutepeque ',14),(245,'Victoria',14),(246,'AnamorÃ³s ',13),(247,'Bolivar ',13),(248,'ConcepciÃ³n de Oriente ',13),(249,'Conchagua ',13),(250,'El Carmen ',13),(251,'El Sauce ',13),(252,'IntipucÃ¡ ',13),(253,'La UniÃ³n ',13),(254,'Lislique ',13),(255,'Meanguera del Golfo ',13),(256,'Nueva Esparta ',13),(257,'Pasaquina ',13),(258,'PolorÃ³s ',13),(259,'San Alejo ',13),(260,'San JosÃ© ',13),(261,'Santa Rosa de Lima ',13),(262,'Yayantique ',13),(263,'YucuaiquÃ­n',13);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(45) NOT NULL,
  `segundoNombre` varchar(45) NOT NULL,
  `idImagen` int(11) NOT NULL,
  `primerApellido` varchar(45) NOT NULL,
  `segundoApellido` varchar(45) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `fechanac` date NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DUI` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `residencia` tinytext NOT NULL,
  `idTipoSangre` int(11) NOT NULL,
  `estatura` decimal(10,2) NOT NULL,
  `idMunicipio` int(11) NOT NULL,
  `estado_civil` enum('Soltero','Casado') NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `ocupacion` varchar(30) NOT NULL,
  `telefono_emergencia` varchar(15) DEFAULT NULL,
  `persona_emergencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `DUI` (`DUI`),
  KEY `idMunicipio` (`idMunicipio`),
  KEY `idTipoSangre` (`idTipoSangre`),
  KEY `idImagen` (`idImagen`),
  CONSTRAINT `fk_pacientes_imagen` FOREIGN KEY (`idImagen`) REFERENCES `imagenes_perfiles` (`idimagenes_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacientes_municpio` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacientes_sangretipo` FOREIGN KEY (`idTipoSangre`) REFERENCES `sangretipos` (`idTipoSangre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (3,'Kevin','Geovanni',4,'Pleitez','QuiÃ±onez','M','2017-06-05','2017-06-05 21:50:10','11111111-1','pleitez93adadad','2323233','Col Santa Marta',3,1.80,43,'Soltero',1.70,'Estudiante','242424','Loida'),(4,'Erick','Balmore',5,'Galdamez','Salazar','M','1995-07-13','2017-06-08 15:57:33','32323242-4','erick95@gmail','23232323','Col Alguna',3,1.70,44,'Casado',120.00,'Estudiante','765565','Adriana '),(5,'dadad','adad',6,'dadad','dada','M','2017-06-08','2017-06-09 01:19:48','23232323-2','ksldksldk','22323','s;sd;sdk',5,2.30,103,'Soltero',1.20,'sldsds','kaldkaldk','s;skdsldk'),(6,'Beatriz','Adriana',4,'Martinez','Moreno','F','1994-11-08','2017-06-09 01:19:48','09674534-2','ssd','848','cdcdczdv<d',2,1.65,56,'Soltero',1.66,'Estudiante','98979','ERick :v');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes_enfermedades`
--

DROP TABLE IF EXISTS `pacientes_enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes_enfermedades` (
  `idPacienteEnfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL DEFAULT '0',
  `idEnfermedad` int(11) NOT NULL DEFAULT '0',
  `fechaDiagnostico` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Tratada','Curada','Terminal') NOT NULL,
  PRIMARY KEY (`idPacienteEnfermedad`),
  KEY `fk_paciente` (`idPaciente`),
  KEY `fk_enfermedad` (`idEnfermedad`),
  CONSTRAINT `fk_enfermedad` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedades` (`idenfermedad`),
  CONSTRAINT `fk_paciente` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes_enfermedades`
--

LOCK TABLES `pacientes_enfermedades` WRITE;
/*!40000 ALTER TABLE `pacientes_enfermedades` DISABLE KEYS */;
INSERT INTO `pacientes_enfermedades` VALUES (3,3,7,'2017-06-08 15:41:26','Tratada'),(4,3,1,'2017-05-08 06:00:00','Curada'),(5,4,5,'2017-06-08 16:07:34','Terminal'),(6,3,1,'2017-06-08 06:00:00','Terminal');
/*!40000 ALTER TABLE `pacientes_enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_medicamento`
--

DROP TABLE IF EXISTS `receta_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta_medicamento` (
  `idReceta_medicamento` int(11) NOT NULL,
  `idReceta` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  PRIMARY KEY (`idReceta_medicamento`),
  KEY `fk_receta_medicamento_recetas_medicas1_idx` (`idReceta`),
  KEY `fk_receta_medicamento_medicamentos1_idx` (`idMedicamento`),
  CONSTRAINT `fk_receta_medicamento_medicamentos1` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamentos` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_medicamento_recetas_medicas1` FOREIGN KEY (`idReceta`) REFERENCES `recetas_medicas` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_medicamento`
--

LOCK TABLES `receta_medicamento` WRITE;
/*!40000 ALTER TABLE `receta_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas_medicas`
--

DROP TABLE IF EXISTS `recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas_medicas` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `fk_recetas_medicas_pacientes1_idx` (`idPaciente`),
  CONSTRAINT `fk_recetas_medicas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas_medicas`
--

LOCK TABLES `recetas_medicas` WRITE;
/*!40000 ALTER TABLE `recetas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administradores'),(2,'Doctor'),(3,'Enfermero');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangretipos`
--

DROP TABLE IF EXISTS `sangretipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sangretipos` (
  `idTipoSangre` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTipoSangre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangretipos`
--

LOCK TABLES `sangretipos` WRITE;
/*!40000 ALTER TABLE `sangretipos` DISABLE KEYS */;
INSERT INTO `sangretipos` VALUES (1,'O-'),(2,'O+'),(3,'A-'),(4,'A+'),(5,'B-'),(6,'B+'),(7,'AB-'),(8,'AB+');
/*!40000 ALTER TABLE `sangretipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idrol` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Nombre_UNIQUE` (`usuario`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `fk_usuarios_roles2` (`idrol`),
  CONSTRAINT `fk_usuarios_empleados` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuarios_roles2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (6,'admin','21232f297a57a5a743894a0e4a801fc3','2017-05-18 21:19:38',1,NULL),(7,'kevi','47c6b15aca93873f58522f26300d181d','2017-05-18 21:42:18',1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistaempleados`
--

DROP TABLE IF EXISTS `vistaempleados`;
/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vistaempleados` AS SELECT 
 1 AS `ID`,
 1 AS `Nombres`,
 1 AS `Apellidos`,
 1 AS `FechaRegistro`,
 1 AS `Usuario`,
 1 AS `idrol`,
 1 AS `DUI`,
 1 AS `Residencia`,
 1 AS `idMunicipio`,
 1 AS `idDepartamento`,
 1 AS `email`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistapacientes`
--

DROP TABLE IF EXISTS `vistapacientes`;
/*!50001 DROP VIEW IF EXISTS `vistapacientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vistapacientes` AS SELECT 
 1 AS `idPaciente`,
 1 AS `Nombres`,
 1 AS `Apellidos`,
 1 AS `idImagen`,
 1 AS `sexo`,
 1 AS `FechaNacimiento`,
 1 AS `FechaRegistro`,
 1 AS `DUI`,
 1 AS `email`,
 1 AS `telefono`,
 1 AS `residencia`,
 1 AS `idTipoSangre`,
 1 AS `estatura`,
 1 AS `idMunicipio`,
 1 AS `idDepartamento`,
 1 AS `estado_civil`,
 1 AS `peso`,
 1 AS `ocupacion`,
 1 AS `telefono_emergencia`,
 1 AS `persona_emergencia`,
 1 AS `imagen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistapacientesingresados`
--

DROP TABLE IF EXISTS `vistapacientesingresados`;
/*!50001 DROP VIEW IF EXISTS `vistapacientesingresados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vistapacientesingresados` AS SELECT 
 1 AS `Nombres`,
 1 AS `Apellidos`,
 1 AS `sexo`,
 1 AS `Motivos`,
 1 AS `Habitacion`,
 1 AS `Medico`,
 1 AS `fecharegistro`,
 1 AS `FechaAlta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistausuarios`
--

DROP TABLE IF EXISTS `vistausuarios`;
/*!50001 DROP VIEW IF EXISTS `vistausuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vistausuarios` AS SELECT 
 1 AS `ID`,
 1 AS `usuario`,
 1 AS `Creacion`,
 1 AS `rol`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Empleado`(
	IN `pAsignarUsuario` TINYINT,
	IN `pIdEmpleado` INT,
	IN `pPrimer_Nombre` VARCHAR(50),
	IN `pSegundo_Nombre` VARCHAR(50),
	IN `pPrimer_Apellido` VARCHAR(50),
	IN `pSegundo_Apellido` VARCHAR(50),
	IN `pMunicipio` INT,
	IN `pDui` VARCHAR(50),
	IN `pEmail` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pUsuario` VARCHAR(50),
	IN `pPassword` VARCHAR(300),
	IN `pRol` INT,
	IN `pResidencia` TEXT


)
    MODIFIES SQL DATA
BEGIN

DECLARE v_idUsuario int;

select usuarios.idUsuario into v_idUsuario from usuarios where usuarios.idEmpleado = pIdEmpleado;

update empleados set empleados.primer_nombre = pPrimer_Nombre, empleados.segundo_nombre = pSegundo_Nombre,
empleados.primer_apellido = pPrimer_Apellido,empleados.segundo_apellido = pSegundo_Apellido,
empleados.idMunicipio = pMunicipio, empleados.Residencia = pResidencia,empleados.DUI = pDui,
empleados.email = pEmail,empleados.telefono = pTelefono 
where empleados.idEmpleado = pIdEmpleado;

if pAsignarUsuario = 1 then
	if v_idUsuario = 0 then
		insert into usuarios(usuarios.usuario,usuarios.password,usuarios.idrol,usuarios.idEmpleado) values(pUsuario,pPassword,pRol,pIdEmpleado);
	end if;
	if v_idUsuario = pIdEmpleado then 
		update usuarios set usuarios.usuario = pUsuario, usuarios.password = pPassword, usuarios.idrol = pRol, usuarios.idEmpleado = pIdEmpleado
		where usuarios.idEmpleado = pIdEmpleado;
	end if;
end if;
if pAsignarUsuario = 0 then 
	delete from usuarios where usuarios.idEmpleado = pIdEmpleado;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Paciente`(
	IN `pPrimerNombre` VARCHAR(50),
	IN `pSegundoNombre` VARCHAR(50),
	IN `pPrimerApellido` VARCHAR(50),
	IN `pSegundoApellido` VARCHAR(50),
	IN `pSexo` INT,
	IN `pFechaNac` DATE,
	IN `pDui` VARCHAR(50),
	IN `pEmail` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pResidencia` TEXT,
	IN `pTipoSangre` INT,
	IN `pEstatura` DECIMAL(10,2),
	IN `pMunicipio` INT,
	IN `pEstado_Civil` INT,
	IN `pPeso` DECIMAL(10,2),
	IN `pOcupacion` VARCHAR(50),
	IN `pTelefono_Emergencia` VARCHAR(50),
	IN `pPersona_Emergencia` VARCHAR(50),
	IN `pImagen` BLOB,
	IN `pIdPaciente` INT
)
    MODIFIES SQL DATA
BEGIN
DECLARE v_idImagen int;

select pacientes.idImagen into v_idImagen from pacientes
where pacientes.idPaciente = pIdPaciente;

update imagenes_perfiles set imagenes_perfiles.imagen = pImagen 
where imagenes_perfiles.idimagenes_perfil = v_idImagen;

update pacientes set pacientes.primerNombre = pPrimerNombre,pacientes.segundoNombre = pSegundoNombre,
pacientes.primerApellido = pPrimerApellido,pacientes.segundoApellido = pSegundoApellido,
pacientes.sexo = pSexo,pacientes.fechanac = pFechaNac,pacientes.DUI = pDui,
pacientes.email = pEmail,pacientes.telefono = pTelefono,pacientes.residencia = pResidencia,
pacientes.idTipoSangre = pTipoSangre,pacientes.estatura = pEstatura,pacientes.idMunicipio = pMunicipio,
pacientes.estado_civil = pEstado_Civil,pacientes.peso = pPeso,pacientes.ocupacion = pOcupacion,
pacientes.telefono_emergencia = pTelefono_Emergencia,pacientes.persona_emergencia = pPersona_Emergencia
where pacientes.idPaciente = pIdPaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Empleado`(
	IN `pIdEmpleado` INT

)
    MODIFIES SQL DATA
BEGIN
 delete from empleados where empleados.idEmpleado = pIdEmpleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Paciente`(
	IN `pIdPaciente` INT
)
    MODIFIES SQL DATA
BEGIN
DECLARE v_idImagen int;

select pacientes.idImagen into v_idImagen from pacientes where idPaciente = pIdPaciente;

delete from pacientes where pacientes.idPaciente = pIdPaciente;
delete from imagenes_perfiles where imagenes_perfiles.idimagenes_perfil = v_idImagen;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Empleado`(
	IN `AsignarUsuario` TINYINT,
	IN `pPrimer_Nombre` VARCHAR(50),
	IN `pSegundo_Nombre` VARCHAR(50),
	IN `pPrimer_Apellido` VARCHAR(50),
	IN `pSegundo_Apellido` VARCHAR(50),
	IN `pMunicipio` INT,
	IN `pDUI` VARCHAR(50),
	IN `pEmail` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pUsuario` VARCHAR(50),
	IN `pPassword` VARCHAR(300),
	IN `pRol` INT,
	IN `pResidencia` TEXT


)
    MODIFIES SQL DATA
BEGIN
DECLARE v_idEmpleado int;

INSERT INTO empleados(empleados.primer_nombre,segundo_nombre,empleados.primer_apellido,segundo_apellido,
empleados.idMunicipio,empleados.Residencia,empleados.DUI,empleados.email,empleados.telefono) values
(pPrimer_Nombre,pSegundo_Apellido,pPrimer_Apellido,pSegundo_Apellido,pMunicipio,pResidencia,pDUI,pEmail,pTelefono);

SELECT max(empleados.idEmpleado) into v_idEmpleado from empleados;

IF AsignarUsuario = 1 then
INSERT INTO usuarios(usuarios.usuario,usuarios.password,usuarios.idrol,usuarios.idEmpleado) values
(pUsuario,pPassword,pRol,v_idEmpleado);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_Paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Paciente`(
	IN `pPrimerNombre` VARCHAR(50),
	IN `pSegundoNombre` VARCHAR(50),
	IN `pPrimerApellido` VARCHAR(50),
	IN `pSegundoApellido` VARCHAR(50),
	IN `pSexo` INT,
	IN `pFechaNac` DATE,
	IN `pDui` VARCHAR(50),
	IN `pEmail` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pResidencia` TEXT,
	IN `pTipoSangre` INT,
	IN `pEstatura` DECIMAL(10,2),
	IN `pMunicipio` INT,
	IN `pEstado_Civil` INT,
	IN `pPeso` DECIMAL(10,2),
	IN `pOcupacion` VARCHAR(50),
	IN `pTelefono_Emergencia` VARCHAR(50),
	IN `pPersona_Emergencia` VARCHAR(50)
,
	IN `pImagen` BLOB
)
    MODIFIES SQL DATA
BEGIN
DECLARE v_idImagen int;

insert into imagenes_perfiles(imagenes_perfiles.imagen,imagenes_perfiles.tipo) values(pImagen,'image/png');
select max(imagenes_perfiles.idimagenes_perfil) into v_idImagen from imagenes_perfiles;


insert into pacientes(pacientes.primerNombre,segundoNombre,primerApellido,segundoApellido,sexo,pacientes.DUI,telefono,email,residencia,peso,ocupacion,pacientes.persona_emergencia,pacientes.telefono_emergencia,
pacientes.idTipoSangre,pacientes.idMunicipio,pacientes.idImagen,pacientes.fechanac,pacientes.estatura,pacientes.estado_civil)
values(pPrimerNombre,pSegundoNombre,pPrimerApellido,pSegundoApellido,pSexo,pDui,pTelefono,pEmail,pResidencia,pPeso,pOcupacion,pPersona_Emergencia,pTelefono_Emergencia,
pTipoSangre,pMunicipio,v_idImagen,pFechaNac,pEstatura,pEstado_Civil);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `enfermedadespacientes`
--

/*!50001 DROP VIEW IF EXISTS `enfermedadespacientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enfermedadespacientes` AS select `pacientes_enfermedades`.`idPacienteEnfermedad` AS `id`,`pacientes_enfermedades`.`idPaciente` AS `idPaciente`,`enfermedades`.`nombre` AS `nombre`,`enfermedades`.`tipo` AS `tipo`,date_format(`pacientes_enfermedades`.`fechaDiagnostico`,'%d-%m-%Y') AS `fechaDiagnostico`,`pacientes_enfermedades`.`estado` AS `estado` from (`pacientes_enfermedades` join `enfermedades` on((`pacientes_enfermedades`.`idEnfermedad` = `enfermedades`.`idenfermedad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaempleados`
--

/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaempleados` AS select `e`.`idEmpleado` AS `ID`,concat(`e`.`primer_nombre`,' ',`e`.`segundo_nombre`) AS `Nombres`,concat(`e`.`primer_apellido`,' ',`e`.`segundo_apellido`) AS `Apellidos`,date_format(`e`.`fechaRegistro`,'%d-%m-%Y') AS `FechaRegistro`,ifnull(`u`.`usuario`,'No Aplica') AS `Usuario`,`u`.`idrol` AS `idrol`,`e`.`DUI` AS `DUI`,`e`.`Residencia` AS `Residencia`,`e`.`idMunicipio` AS `idMunicipio`,`m`.`idDepartamento` AS `idDepartamento`,`e`.`email` AS `email`,`e`.`telefono` AS `telefono` from ((`empleados` `e` left join `usuarios` `u` on((`e`.`idEmpleado` = `u`.`idEmpleado`))) join `municipios` `m` on((`m`.`idMunicipio` = `e`.`idMunicipio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistapacientes`
--

/*!50001 DROP VIEW IF EXISTS `vistapacientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistapacientes` AS select `pacientes`.`idPaciente` AS `idPaciente`,concat(`pacientes`.`primerNombre`,' ',`pacientes`.`segundoNombre`) AS `Nombres`,concat(`pacientes`.`primerApellido`,' ',`pacientes`.`segundoApellido`) AS `Apellidos`,`pacientes`.`idImagen` AS `idImagen`,`pacientes`.`sexo` AS `sexo`,date_format(`pacientes`.`fechanac`,'%d-%m-%Y') AS `FechaNacimiento`,date_format(`pacientes`.`fecharegistro`,'%d-%m-%Y') AS `FechaRegistro`,`pacientes`.`DUI` AS `DUI`,`pacientes`.`email` AS `email`,`pacientes`.`telefono` AS `telefono`,`pacientes`.`residencia` AS `residencia`,`pacientes`.`idTipoSangre` AS `idTipoSangre`,`pacientes`.`estatura` AS `estatura`,`pacientes`.`idMunicipio` AS `idMunicipio`,`municipios`.`idDepartamento` AS `idDepartamento`,`pacientes`.`estado_civil` AS `estado_civil`,`pacientes`.`peso` AS `peso`,`pacientes`.`ocupacion` AS `ocupacion`,`pacientes`.`telefono_emergencia` AS `telefono_emergencia`,`pacientes`.`persona_emergencia` AS `persona_emergencia`,`imagenes_perfiles`.`imagen` AS `imagen` from ((`pacientes` join `imagenes_perfiles` on((`pacientes`.`idImagen` = `imagenes_perfiles`.`idimagenes_perfil`))) join `municipios` on((`municipios`.`idMunicipio` = `pacientes`.`idMunicipio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistapacientesingresados`
--

/*!50001 DROP VIEW IF EXISTS `vistapacientesingresados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistapacientesingresados` AS select concat(`p`.`primerNombre`,`p`.`segundoNombre`) AS `Nombres`,concat(`p`.`primerApellido`,`p`.`segundoApellido`) AS `Apellidos`,`p`.`sexo` AS `sexo`,`i`.`Motivos` AS `Motivos`,`i`.`numeroHabitacion` AS `Habitacion`,concat(`e`.`primer_nombre`,' ',`e`.`primer_apellido`) AS `Medico`,`p`.`fecharegistro` AS `fecharegistro`,`i`.`FechaAlta` AS `FechaAlta` from ((((`pacientes` `p` join `ingresados` `i`) join `empleados` `e`) join `usuarios` `u`) join `roles` `r`) where ((`p`.`idPaciente` = `i`.`idPaciente`) and (`i`.`idMedico` = `e`.`idEmpleado`) and (`u`.`idEmpleado` = `e`.`idEmpleado`) and (`r`.`idRol` = `u`.`idrol`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistausuarios`
--

/*!50001 DROP VIEW IF EXISTS `vistausuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistausuarios` AS select `usuarios`.`idUsuario` AS `ID`,`usuarios`.`usuario` AS `usuario`,date_format(`usuarios`.`fechaCreacion`,'%d-%m-%Y') AS `Creacion`,`roles`.`Rol` AS `rol` from (`usuarios` join `roles` on((`usuarios`.`idrol` = `roles`.`idRol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-10 19:42:01
