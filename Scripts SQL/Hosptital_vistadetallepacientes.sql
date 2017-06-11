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
INSERT INTO `departamentos` VALUES (1,'Ahuachapan'),(2,'Sonsonate'),(3,'Santa Ana'),(4,'La Libertad'),(5,'Chalatenango'),(6,'San Salvador'),(7,'Cuscatlan'),(8,'La Paz'),(9,'San Vicente'),(10,'Usulutan'),(11,'San Miguel'),(12,'Morazan'),(13,'La Union'),(14,'Cabañas');
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
INSERT INTO `imagenes_perfiles` VALUES (2,'adjapdijqpdapdma;dma;ldd','image/png'),(3,'adjapdijqpdapdma;dma;ldd','image/png'),(4,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0x\0\0\0u��o\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0\�\�IDATx^L�Wp\\ٶ���I��H\�{$2�@zｷ	h@x�A\���嫶9g\�c��ޛ�\�m\�V�\�ÕԊ�ԭ\�P��G\�\�\�7\��aE�̕����1ǜ�\����\�ڷ8���y-�\��Q\�4ש4\�Rq�K�.�=*r��(_�Ld*ו��\�<\�Q�\'G�%\�**\�UQQ�\\�9**\�zq��]Y</K�E<\����6wi�JK�T^\�p\��(,W \�S0P \�7T��׫ҐK\��R����\�_\�\�Qy\�-��-\�\�\�Q�ϭR_����\'\��\'X�R.�\�W\�sݼ�7X\"�\�\�}~�\�kx�\�\0\��\�8���r��z�7WE\�|\�l�\\\�*-+�\�_�2�\�\�-V��K\�]j��j�;�١�\��U\�\�B�N/\�\��Z��\�Ե㝺s�_w6�u\�\�\�ң�#z|a���׳{�����^ګ\��\����zym^/n\�\�\�\�Cz}uE�oѻ����a��{L�\�ի��y|EO/\�\���Yݺ0�\�g�\�ۭ\�S:�2��3�:�oP�W��6׭C3]�wf�.�\��\\���\�\�+��\����\�\\\�\�\�szsgQ�.���zuoVo\�Ы�szukQ/��k3zv\�\�]گ�\�&tacP\'w\��F���Х\��:�ܦ�\�ʂ*�p��.նGu\���~�\�w����\��\�\�\��?�\��O\�=4�\�\�}:�\���]8��#\�\�\�ѥpeJee��TT��\�\�|�\�\�\\9*)+����\�)�\��ʳx^�\��b�\�8�\��mn>�|�B�\�e*P�h�\��xmH�:��uUֆUUW�%��\�j�][V�ٯ\�ƨ*\Z\�J6\'�l�*^PEUD�ʠ\�)�bl�d�\"\�I���*�*�*q�\�@�\�؇R`���\�<�U�e>�[\�~�\�\�\�\���]\\|\�\�ln��(O>o�\�z\�\��\�xģdܫ��2\r���<Q���j���\�\�C�:�\�\�\�#m�\���{rDwO\r\���a=87���\����\��>=��W/\������>��:��W��\��A��t@\�o-\�Սe�p�o��#zy�(\0<\�\�u\�\0xz�n�;���uqmD�M\�ܑ=��8��k�Z\�׭k\0\�\�\�i[hӝsSzy}N\�\�\�\���\0{Yo�\0�Cz\�\�\��\0\�\��\��g��\�>=��OOoN\���ݺuq��l\�ԙcM�~~�n\\\�׍�:�Ԯ�֠\����F���\�?\\\�\���V��\�;�\�o\0���:�4���=���.�i�\���\�ӎ�1U�\�\�#y\0�\�[ ���\�\0��|��e�J��r�@b\�/��\�pa\rO�\r�`,�\\~@K�*Q���JV\�U]\�WU]L�\�R���6�ʪ�&H\�CJ\���I(V�R܀\�k�\�<V\�>�\Z�Y\�}�~E*\�\�#ɠ�|\05�,�a�\0p\�\�\\HQ{ܯƚ2M��4\�]���%b��}*r\�~�y�+C�RN$���F#%�q\�\0���\���Z\�ש�z�]�\�ŕf]Zkҵ�-��ު\�\'�u\0ށ�\�֓�c�\�=���rP�^9�g��Mqߴ�_=\�\�\��=:;\r[\�\��\0\�\�!��	�][�G��ƚ^܀aʛ��\�\��y|J�WFu�Ĥ.\0�+\0r}��}\��\�t�\�(l5\�\�\0�e���\�\�\�=��޼\��W�\������\0+\�\�\�K\0q�}8\�Iq@O�\�\�\�+{t��snP�\�\���	�q\�>�S�\�\�\��ۗie)\�\�؞Z�Ï\�\���F����˿�-������ŕ]\�\�\���t\�\�-]\�\�҄�.\�\���j\�\�\0G\�//\\�\n�J�\��p\�ya��<G�J`	o)rW^(7�,��<~�*�<\�R\�\��@x�,�,Q]�\�J�������kcJ֧\0�O�z�s;^\�x�fʕLq_\0�,SF�W$���O�-�+\Z���\01G\��?fl\0�e\����9��:;�\��tBK^�T(ca!��r	���~�0\�\'\Z(V����\"_Cm>\�Mh\�@�N�չ\�*]:Ԭ\�+��~�Y\�\�{t\�T72ܧ�gG�\���\�\�\��E�vـ\0a�g��7@�\�\����\��i=�\�!�/�\"\�l\�.#��\��\�\���\�!2|�\�^]9�W7�\�t�xd�\�#���[\�OM\���w����� $�Ό\�\�[\�;c���0߬^ޙE\�\�`�W��\�\�\�id�π_sR������\�yiLW\�\�\�\�=���È\�\��ku�Q\r\��z�XTe�K�X��\�#�\�\�>Я��N����\�\���w]�sZ\�}:y\�\�^;��K\'�\��\Z�\�\�\�v�\�xä\�Q<~��\�\�Ld�P\�h��:;H%|L\��Wr�\�W�2/\�+7 r	�\0a$�T�JE>\�5^$���(�U�\�V\'`<?׃\�tTIX.;FW�6\�J�D2�0��Tr�W��*W���	�\'\�\0_�\�q>�\�\�/�?@�*�(\�\��\�:�7����ua�U\���4\�\�Q\�υ�u<`q���ݲ\�\\�8�R�_}�Dm�,;;CZ�\�ȁ�N\�W\�\�B�.#�W\�u�H�\�\�\�}�{lH�`���G��\�,�ɝ��h�^^�|��}q��<���g�\�9\�\�\�%=��\�md�=��xͽ��u�\�^Xv�n �W7�t�Ĵn��Cf�\�\�i���߇]/f?\�\�\�߭�vs0�{�y{Ϲ�{\�ד&��a>��qgL�_���yW`\�\��wyL�/O\���~\�Br\�\\\�FL\�.�N�j~��\����\\�v\�t�\�~��\�0\�ǰߧ�\rۖo~\�\��\�\����]G\�Ց\�G�z��Vϭkϡ�\�\�\��\�~\r\�\ZP\�h�j��a��\�9���b�b��\�\'�\�,�%��\�2t߼�I7�������#\��°L\�2\�G�ܰ`\�ݔۄy;@��p�\�<bʼ^e\\Id5YU\0�}U	X\�\0�\�Vy��!y<\\A��p)TQ&?�\Z��\�Q\��\�\0%�\ns8\�\��}�:ԑ\�ZW�\��T\�\�L�\�#�k񱄧b\�Sqq�J	O��L�b�bEj�qkk�oGX�\��\�>\0��\�2\�\�w�MW\�t	�wx��~\�㋻���A\�`�\�\\\�\�B\�\\\�\�߄y�n.\������\�\�*�p\�\\8��\�\�\�\�Y\�<�Kw\0ם�3�oF/-\�\��p�a\�G\��\�,���y��4��ȯ�+ Џ	O�痄���\�\n\0ȫ\�zp���1�d�9a\�\\\��!�\0�\�^@��\�\�pbPs3u��T\�ؕ�}\�HB�|\�:\���P��\�\��g\��\�\�+��O�U�\�\�][Ԯ�)�\\8�C׵x☆\�յ�D34���������\rJM\�0$P3���\�CJ��T\0%h\�\�W�\��0IӰF)\�\��\�740 \�I/`C*k\0Wm\n\�S,3 r_�IFv+`�JX1ؒ\04\�\�XE\�\�v*�8L\�2\�\�CP\�d�pA^\�#]�^o\�\�ך�;��U�w\�u�3�Pg��u\�\�\�T�.h\�R_R��B	�\�\�\��f\�\�9Ho�j�#M�F_�\��T\��\\�K�XnйC���f]=։D�\�;`�~\�\\\�\�}\0�\�va�\�n/9�oo�Fז�bAo\�[._\�XЛ[��\�62�7{s��>���;+�\����N\�=6�;��\���_^ �����a���\�,2i��H��\�5c\��\�\��.=ċ>�\�a\�\�7`\�\�H?�|\n�=��U��s��\�1\�l�\"\�	�w~/~pXg\���o�ZՕX��\�r=;�\��\�~�o\����À���~�7����_����\�����n<����]�Ʒ��S�/iq}U�W���ZZ�_Q\�vթ��Aaf�!�\�\��B�bPI+ϔI)T��oX\�.��*�;��J\�K�J�\�=�a��`�>E`��2\Z�\�	Hg�5�HS��Ÿ��t\�ȯ�8�vQ�[�\\\0I4i�$\�H.24��4���!�`Ч:B\�\���V\�\�p���\�i}�B��\���F��Qg��\�\�p�\\\��\�\�E\�\�jib ���UZ=י�5:3_�SK5xI@8נ�\�����q�[�N\��\�~�\�\08B գ�N\�}k	�����\�\�\��G�\�\�\��\�\�\��\��[\��\�%\��\�	G\0\�@\\0ޓK�z~i�ғk�����E@��p�� �__C\�	O�\���;�S\0�p/n\0b���I2�\�y,���4`\�\rۍ#Óp\\\�\�H\�\�c�z�[և49�R�*\�Z�F�\�\�g��?~�_����\�\��-\���cm�\��U�\���;}\�\���;w\�;�����\���/��\�;��\�y�W���^v\"�V\�ǬV�j�\���(��\�\�o��\\\�!Y���\��cY�r�3	#d�\�pȭbW��>\0l\�I\�$\�dm9\�t\\\��\����\�̯&��@c\�\"\�6\�V\�sKCe�j\0�\�\��|\�\�H��\�2\���TP��p�V.�@�%<�Itm�K�0ݹ�&�\�C*1\�\'�WH�4\�\�ǝ���X0�\�SC�G��BZ��\�\��*�>ؤ3Vz!���ՙ=\�:u��$ܦˎ\�\�\�u\�\�)xcT�N\r��顅�\���\�MX\�֊>$|xo�\�\'�\�\�{��\�\�a}x�(��\�\�\'xlCo\��bw\�\�u.oFR7k�\�H\�O�XY�p^\�Y�E\��\�<i�5\��\�m��\���\\G��O�\�`�[�\�\n`F�_�d�`=�\�i\��\�a�q�\�\�����\�q�\�8O 9եS�ݡ��P��\�\�\�7~xK?Gz�\�~�_��O�����~����-�����\�_|����\�:viC~\�~��\�\��\�;5�0�Pm��&�#�VVŕj��Qªj��ȋ�J\"�^\�ە�|�8`�P�\�\0y\�/\��n��\\0I \�Sq	@4.w�b��\�<!�\�j�\�f�\�\���\�*WF�\�n�\�\�H\\%0(ϊ\�?I:\Zr>7��\nF9!\�7o�%o���2��\��G|j\�U[C�\�\�\�weq\\\�C���:��$\�K;�\rZ\�\��n���%\�\�hGP˓0\�L�N\��N\�U\�\�L# �#Ȑ�aΓ0\�\�V];҅����\�Mx9��T=A�L\�^^A~��7x��\�O�\�\�\��\�\�\��\�\��Ä�>\�\�\'�\�\�q\�\�\�q�k@�\��1yw�\�u�\�$�\�\�%��A�0߈��\�o\�[�#Z�	~\�0�I��\��]��\���4߆	o\�\��\0�`���\�)\�<>��2���w\�\�\�1|\'I�|���\�҉#}\�j��e�l(\�uX���~�}���_�; 4	�Ox�ٙ9\�8��\��W\�q[K�\��\���_��\�\�9�[�G4\0�F\'�\�9ܯF\�pUG�Ru���\�\�Ǖ�N:�=3�\�\n�z��\�T\����cHa�r�e\0������\�=J�^\�qҭ�M��0������Vf�:^3�E`C��W\�`\��-���|o���2��c�y\�����E�~��Qxn\�`���C�6Ӭ\��m\0nX�\�ku�D�`\�\�њ�0S\�K\�\"`y�E���u`(���\Zm��N-\�\�\�R�N\��>H�ͩY\�\�Kε\��j��  �\�\0\�\��\�ó\�\�=\�\�~k�\�1\rX��\�3\0���\�\�}�\�>}t@�\�;�<\�\0\��H5\�|\�^\�x&\�6��\�\0�\�q\�\�-�\�\r\���\�!���\��C��5@:!\�J/�B�jI\�j��9	l{u����#ݳ��\�5\�[]�P2��\�\"�w\�\�Ե3ݺ�ѫ\��V\�\��BM@\��I}��K�\�_?\�\�ޯ��U��u���~�oi\�\�ё\�G�\�\��N�*(�\�R\�h��\�\�;ީ�]�\�S\�x��\0`C_+�^�JX�6J�T-\�\0c\0snޫ\n�0�\�5h,��Cܶ�B	�eϭ�\\�0�\�\'\��\�a\���0\n\�\�k-�8�-����\�WQ\�G���$	�\r$�^����\����r|`\0\�H��\�H�&��\�҅���N]]mֹ�v��\������y\�\n\�TS�ٱ(`\�u�\�\�R�\�.�\0F�x�\�ل\�\���\��^�\�\�#M��ѧ[\���ݺ{\n\�~\Z\0B�^�ԓs\�x�=�\�4I/�_�\��\�\�}�옾�tC�?9a?|\�G�\�;���V|D y�^\�_Ðo\�\"�w\0�s?��\��\��\�.a�׷9\�i`�\�\�a�p_i\�yHN\�>�\n<\�k¼=:��~\Z�\�\�D�\�:	�6)��\�e��s\�L�\�\�О�&�*��k	j	��O?����\�~�7�\�?����_9\0�B[�\�+\�\�֡_�\�g�\�Nd5�\�\�Au�v�m�C�C]\�b\�\�T\�`�\�e;�\� [5<7A@H8#�$\�02�\�\0\�Y\�9E\n�\�jq\06n��\0���үD-��d��	�\�UY�TUCTU\0�֪�\�1<g�\�@S�>�\\Ú0d�DNE7ߓ\�kLl�!�\�o�hc\�p\0D�#\��\��KK�+trWBgv�\��L��\�\�\��\Z\�U����F\�J�\�s����\\�\�IG-\0Cv�\�@<3�\���J�\�$t���\'<�بˤ\�k\�u�\�\�:�K7\�\�ğM@�\�!\0|\n\0���a�w�f	���\�!}�䰾����xvF��O!\�l?\\�\�\Z��\��\�\�1X�\�>\n\�(�\����y}\�\�^X0!2�Y}�6���\0��\0��G�lkz�\�{~��>��?~�>Ń\�c$�\'\��\����^B\��q\�>�b�\�\�\����NuuI�~u\��\�wn\�\'��_��C�ꯟB>ׯ��r�V?�ϟhKCsB;w\�\���G5t׫\ZV\�\�U`l\�oQs3rVkw�R�\rj\�iS}/U*O��QA �H����#�XÏ̖�\�\n\0��\0 F��Ū\0A�\�qD�\�p�\0\�Ƅ\�Ҋ\�uA\�0\�x\�xC�\�\����4[M�ψ���la8\�\Z$�\0=#r2�]\0\0�\�����P>v�H�\�q\�U\�Zt�P�nt\�\�\�pR3�|��$V���\�W�m\�\���\��\��^w�E\��2��;P�3x\�\r:~\0\0η\��Z/,ث\\^Z\�\��\�N\�\�\�}zxf)F9b�_\�|	�<:�\�\�W��\�מ���\��#��C<⇰\�;d�\�� ��\0Y~�=�8\�x\�O�Xp�\�8�\�׽9}��~l�y�v�����)\���O_n\�\�\r��\�\�I}�}z\n[\�\�.\��]��*	�\"�\�\n��͘o�^6���>�\�jn\�V\�{�z�����~��\��\�_I����~\�al8\0��\�\�ҵkz�\�=մ!{\rAu4���Cm��Yg���j�\Za���u��n�\�\��q_\\.���H��x�\�W�7O\�\�R\���0\\Q)�)Ɠ�8��\"�B�Ǒm7�\�\�|Y�����2ޣ�1\��+\Z	)2\�\"Q\�Tx\r�a�ɰ;\�Bn�\n\087\0�p��\�\0�1�\�\���\0�ucX��;@\����\�s�b�\���n]:@b]\�\�5@rz�U+#��o�\�Lw���{���H\�7\�h.j\��%��P�\�\��N���\�#\�\�\�\�\��T\��d�N\�vi��}l�G� \�ݺptT\�O\�у\��u\�\ZN~9\�{yƩ��Ȑ[�>\�\�ן�է�O\���\���M|\�]<\"��\�C�~Fp�����U\0uT�\�O_�;���2���c�\�>`?;�/��g\0�庾n�{�Կ\��^�\�^k^���O�\�G+\���;\�\�\�\�K;a�A]\�\�\����z�&&\ZT\r9M\�\�\�7�wW?�\��\�@@��O�3+B[1\Z)�r̖�\��\�_���yK��.�\�]�j\�mP�X\��c\�\�0i��RL%\�\�\0S�\�Mt<\�i��\�\�>\0���`���\�0��\�i�\n#�E^>rkCxI�\�V\�Hv\n/\�-��%�\0�D.I�V��1\��DMPE�8\�Y\�ͅݬ\�W.OI�>\�\�:�֍\"\�k����_$�d+�p9��=C	]_\�Ѕ�]Y\�\�ƞZ�\�\�J����),\�sH�\��\���F�[i\�E��k$\��f���Ց�*-�\�\�@_\\\�a\�\���\Z͌Uj\�X��w\�\�\�-\�k։\�g��\�\�^\�<���:\�\�Y@�L(9�<\�<	\ZȰ\�\�\0~L\�xwc\�\�\'��me@��\�O\0��#���\0�>\0a�\�4_\�>��k/O\�s��\�W\�~�\�	\�\�W\\�\�u\\~�\�\�@�@\�LI\�.\�\�=\�ӭ��t\�Ԉ\�n�\�\�N�>ү�Ƹ\Z�|z�\�e�\�wo��?}r	���ϟr�1\���N?wBHO����?��#�R�h�RU[R\�mxÎN\��\�\�\�JզI\�4U����\�zs�S֨j���\�\0&&+� �e�,��85@?^\�\�u�ҋ4�=0\n�m\�v�z\�-��ƼJ%#N餢!�ÄH9^�\�GP��X�\�ST\\�8�\�e`7�\r�\�� �x\��\�l\'U{�yN\n�O�\�E�d3��\�F���0R,w\�so.�\�\�AX�p�6v7\�p���Z\�W��HelM�^-\�J\�\�A��H�Xk@�[\�7�#��V���]j�\�\���\�\ZB\�m����B=�\�޶z\r6\�h��V�5Z�\�9\�\�\�;/ ͷ\�\�Y\��\�<�\r�$L|pi|c=0�\�\�s�\�C�\�G�\�ɐQ\��*��\�\�\�\0\��\�k�\�\�/`�gg\�}���\Z���������~\����\�`\�/��\ZL�9`�ƫS0\"��\�=��:�\�ڴ^��\�ګ���v\���]]\����b�\�\�\�R�*�\�S(ʷ����C��N?�ˇ��?�?\�\�\�~a��\�֎\�\�ש�\��\�a��O\0�\n<^�j�\�\�\�j��#�\�\0�\n$�	�Q\nfJ4\�U\�\��\�UJ�܊�*�\0dٍXH���!@H�En#0V�6\�W�\�\�?z�\��@\�\���bD��Q��T\�W8\�$\�\�b��%�\0\��n�s�ÄQl�?@\0!�zI\��0 s{\�<\�*�\��)y\�֐Z�D�@�[ua�U\�W:IĝZ\�\��f����\�R���]\rn�\0.\�<j�\�F���|�Z�C\r6��\"���?WQ� \��ıɈG\�|n�T^�>S����|WO��\�\�\�\�~k\�ܩ�\�&te�v�9�\0�\�\�$XX� {r\Z\�%x��[Ƽ!��a\�c@��s\�\�\������\�@�.�c\�\�\���7<�\�	2���\�6>z�D�Ϟ!�\�,��\�\r�՝%=��\��\��n�ߥ��G�X�Sx��}\Z\�٨z\�ե�\��\�_\�\��@?�\�G$\�כ\�\�`��@?��mH>Ӗ�\��\�\���o��\0PB�P�W��^\�j\�]\0\�륪���B�\�R)	\���\�j\�pD��\"1\��q\�W��<\�5\r\0 Rk\0�ac�d���\ZЬQ�\�\�)V\��8����q�?Q�pl@��\�I`	�,K�\�;d��\'�6\0n6 +uگ\�	Fƾ\�ч,��r�!��hi�V�1\�WW�\0ֈ:b\�ω0\�{�\�\�\r^��%�#�I�<\����\�\�:9W��5�\�\�מ.�z[��K�(\�\�Vv.+˒ߍ��\\�\0\��(�9 �Gª�E\�\�\�\�\�\�f-M�i}n\�\n�;7+.\�\�ekB=I\�8�7Vn1v�=\\��\�Hǟ>�&�O�\�\��8<\�\�dH+��\�B\��\�\�5�͑�\�\�=��?�\�h\�YJf�`�\�ޒ�ܙ\�#\0��\�ݻ2\r�\�2L\�\�\�>�x�I�gN\�PwGv�\�w\���?�\�\��\�	?�\��\�\�\����\�O��	\0$	�m\�ү~�C�\��($\�x\n�UcK��j�Rj��j�a?X\�X�8�w3f\"�\��\�fh%��\"Gb>����DD�I�\�hF����Q�\�`�Du,��_UL��]��O\0���-6 Y�\�	�\�<\�6������ Q\0h��&�\0�\�`4�2\�\�\�f\04�\����֝\�\'�\�\��l7W\�tq�U�z���^S1��}��\��������lօ�j�[n�\r\�1�\�\�\�JM��v�5\�R�\�z�Z�KT�.�\�\�xԚZ�\�\�B�\\YN���ԭ`9\n�P��6T�\�`���b\�\�5�\�\�kkzz�^_\�kP�?��x���\�\�m\�\�\�d\�|�)\��}\�\�h��k���a\�S�^ћ\�l�z\��7ǉ_ܘ\��[���s��{eƩ�\�<�SO�8�t�ĀN�\�ɍnmp���LG��\��{U?��d������ϒ0@���~���􋿽Ֆ��6��O?���!Q\�U!Dk\�aب��w�X\�\0p�\n�^E��x�$��\0�ֽlEik��\"�Q@�Dԑ\�(��\�P\�ȍÊ5X�\�\n\�	�Ȝ\�5�j�켟5p+P�/M�	kR\�8�2�\Z��^�;�\�\�$Q\�@\�OX\�\�	(~�\�\�V\Z*ŏ\���9֍{H\�6ZR\�>^�oѭÃ\\�\�\�b��MT�#�\�\����j~�\�)N_X��k	�n,U\�\�L�\�\����#�	�8\�ծ�����\�l���>�Κ��`\�T�K\�%y�\�\�]\�\�\�>�\�*+g_�\�{�_\��2\�\���j\�OZ֦t���\\�\�\�+\0\�\�*�y�d��T�?|v\�	+�>\"< �\��wx\�\�E�D\�\�\�\�Zh���ꂞ8��\�zzٺ\\`�\�K\0��\�ݻ����\�\��I]:9���\�\�\��\�\�\��-\�6\�$\�~�]K]\�m\�Ɖa}\�\��`�\����g\0��������w�\�V\�R���w\�SQ�\0\�\�8�6:X\�\�n�\"�\�\Z\�\�D��:^�P�P��s\� \�eĀh\r�$:\nSE�J3�N��� 	4Zm\�-�?���\\�~\�k\0�]GbS6��DW�\��T=\�m	\�g5G��G\0p����\�>ò���\��\�#x.�R`a\����R�a�J\��\�@	�@�g,\�\�\�j]?ҫ\��J*�D8\�U�5)+P+da�B\�$t~���љժ\�Z\�r�\�\�\�d�F���\�\� 	�/��=1Mv��ĵ�\'�\�\n\�\�h�\Zh\n��2�\�D�<�𕫢\�l��\n7�Kb\�kG]D�\��Z=�O\\�ХcS$h\���IB6\�Ar�����\�\r��\0��\�]X\�\�o�d7��ʺZ�Α��� �`��?��;�W7\�M�	]\���S\�8�S�����4�\�\�n\�\�\�\�ޱ\r\�kh�Z;���j\�a�cb�Z����֟�\�\�&\���0!�ӿ�\�\�ağ���~�O\0L�o0`5\��\�|�Ę�WB�8�\��p�\"���!R\\Q_�TC5� �XsÅ`�  �\�S�F4Q@�\�\�ٸ��8�-d,X\�=�݌9�1\��l5<����\�K��5\�6\�Eړ��zJ\rr\\�gsr�\�\�\�|0���\�\�g q\�\�o\�q@�Ϛ\Z�\0�\�OB\�v�u\�\0@w\�\��5ta�E\�\�zt\�P�nޥ\�6n\r6���̞X���\�u��~��+-��^�fjtx�4<\Z\�LwH���\0.�\�n۸\r�$��?�}���\�k_WD\�Q\��Ǝ\�\�\n3TT����4��)wQ�B�%a\�F$n�5��\�v�\�\�\�q������FR\�\���;^�IM�zv\�f�-\�ѹݺwf@l\�=}|�nry�Ȩ.\�\�ʘ�ڥ�\�.M\�i\�\�p��z+\�ڒR+y��1����\�cj���\Zu�!t�ԇ5>լѾ�N\�\�\�߸�>~�\��\�\�\0)�\�_n?�+�ۄ��|�_���Cm1\����� LD�\�\�ͱ;-�6\�\�&U\�\�b\�\\\�	\0�\�\�H\�7�򺨁ր�����\�B\�lޏ�c\�7\�vK6l2�5�&�\�JK\�)X\�\0��\��\�\�)�#���|�\�����e I�V�E6�������\�R�n\�<\�ܛ �\�Y�/�\�;2\�@\�\�:a�]Z��+\�\��:2�r\�|�_�\0Ҁ$\�\�\�\�v]^i\�ٹf�O\�iywLs!M��4k�pr�W���ƣ~��5�昆�#\ZFU���\Zj\r��	\�\�Tϭg?�e�*-ڦ��\��\�pI��Hӭx\�ަ�ƺbZ\�\�\�\�ʸn�<��\�\��zp~�{��\�4IzR�O\�\��\�#�~tHW\0\�\�#H)�yd�_\�\�ڳ�Z�\�q56DT\�o�J�\��\�}\�D\�+�/l\�ٍWu���b%���\�\�^�pr\�\�/��wo�c��gH�O�؟���a\���\�\�\����\�0����F_�\���\�\�#�8ۣ�0\ZXQ3�_\0gM�1c1�@�J��\�-\��0Lc\�V4�c�^\�a;�\r�ō\r�l*��\�\�Zd��4a]\�ƈ\0ݺ�Mz�	\"T���zk�� [ր\���PGl_�!��6\�~	A6��+�\��|\�\�;�9\�a��\��Y\�D��{�����0ׂԑ���i���;\�\�t���\'tv�N\�V�t\0^:Ҡ����k\�iב\�I-D4\�\�\�.\�IO�X�@|E\�V\�	QI(\nz}0\\���U���6w\�fgy�\�r�:\\���l�<�Jzy��\\զ�\��wh�¦\�Z ��\�֥�!\06��\�I�\'\'tkc�\�m\�\��c��έ�-\r\�\�\\�iP�;�\�l\�Oa?�\"�=�*)Η�ȥ��\�؝6�U\�\�\�d-vfF�\�U���\�f?\�j\�4\�w�\�<p�N��x��@��G0\�kg����o�\�|\��і��V���\�Z\�\r֛a7\�@\�bL�C�\"hF��`Cv#x��\�\�H��\��U� \�aփ���\�\0\�F&��+ZU\�c\�l��v\�u原�T�\�#\0��\�\r�\�\�$��@R_\�\���m�g��vD	��yK@i�#x�c�}��n�8\�\0\�\�d�������!m.R��\�6�b?p�\�|d�I�\��}�:y�C;�\�Ɂ�\�\���u:�X��+���\\_;Ү����ڥˇ;u~�^\�񊇐�\�n\rW���(+T ��@X~���,e�o�\�Rq�_�۶*7\r\��y~%�V\�t�b��6-�lՇ\n\�\�\�<P\�\�xSL\�=\�Z\Zk\�	$�\�L�\�\�\�\�b?>�U%(�\���\�\�\��]\�ӟ\�\�\�j��(U֜\���Y*\�\�\�g� 7Ky�\�ʇu��\�cS*�F��6ֳ\�Q\�I�P��\Z�\�������\'���]�|���[!�/0���ekɲ\���b\�\0\�\�ժg�^w��\�|�R�/\�!9�\0\�\�\�\�:[`�`,�6=�m6\�\�&��Aː�r临�x��@�yN)�\"��*<a\�o>.eMU��7q]��Lnk9<\�$�\�Y\�KE�ݏW�\�n?j)=\0c�����MKP���Y\�\�N&~4\���\�Y��<l�J�\�SAbL�=v\���\0����N\�k\�	�xlO5I�֟\�\�XB\�\0��z\0ؤ˫�ޥ�G�t\�\�n\�G�;ui���^���)M8�*J\�)R[ʣ!�\�\��7\�9#\'�}@��̴t\�flWi���߅�k�2\��\�ҭfH�#Y�v~�ք[P�w�k�=���\n-�Pv\�\�\�d�\��6a��6\�k�V�+��\�\�\�Z9Y\�hyI�\0,V��l.\�W,��\�`�ZB%j�(Uk]�:\�\�ߔ\�pGL}ml�1�v$\�ә\�\�`\r��I8I\�~~E?����S�\\6+\�����\�_?\�\��F���\�x�\�\�ϭM\�24ԣ[�N)ύ$�~(/�a,N\�3\�y�#�H�&wa\'���� \�m\�OY�\�d�	�\�(����\�&�\'�S��*.+0�6rbe�jB��^Y�9\�\�\n�\�`\�82\�Gڤs-QX0��[�%\�LnC��ac���\�.��-�\�W�?\0\r�e0�\�[��\�iX(�zT�{\��^\��\��{4�3\�%ul2EXHiG[X�vEud:�36��P��\���\�&9�\�\�q[vcD7\�Gum�O��t�`�\�vThf}��\\����fz;t`ߔ�Fv�8\�\�$tdf���P�m\�:t� ��];:z\�\Z���p\�\r\��\�E{*\\\�L����P\�\0p�9�\�;I�Kx���Z�a�\�\�5?V8+��5�v<sm�@\�e�j�@�`�j8n�\�Z~�\�D��yߦ\�r\�1����F��\�ݓ�5C�\�{G\�b\ZIh�@��ܬ\�txcD_�\�]�\�/���?~��\"�&\�?F�\�Y���Y�\�x0l���e��Q]ypF�\�r�/*Ŝ�\�)��3\�i&ŴL�c0#\�޶ rg\�	>\�\�1�߲�|3�\�<67\�&�X���\�di�\nfCJ�\0Y��ʙԔ�)�$\�\�Yai\�|`U\���i�&\�N��V��\�|Vh��\�&�~� �am`��`?\�N8��K��p\0]\�c\�]rc�\��-O)\�SĥK.��dIy��I�N\�m֙}uZLi�-�;}Z�\n\�\�L�\���W�\�*\���>\�>ޯ��\'twc�n\�%ιy\�hO�\r%5Kh\�\��MI�\�A\�\�\�\�\�vvt���\Z�\�mm\��\�N\�\�\�%���[5\�Ѫ��\Z\�i�\�v^�\�4��\�\�\�Ӿ�����m��&	A\�5��3#\0�7����Z�m\ZEj�\�6\�RS�\\\�B7�gs��sUT\�R��X�\�KU\�q)��7�<]�R�\�c�h�\�H\�kH�\�^[\�\������o_�~_\�\'Vz�ӧ�) �\�\���ş\0۟M�a��Z1�0\�\0�cmٷ{Lk�SR���\0���%�c̭v�\�\Z+1r\�Z�`>�\\\��_V�-\�S�}9�\�\�\�l2x�u��b*�E��Z\0�o�j@~a;\�xI���4 \�5>�g\�g�\�\�j�\�)B\�\�9�}Vp6��\�g\�7���on\"\�\�\Z�Z��\�\�L�w.O\�X\��\��U\�\�lۄz/\0�n�%G\�ُ��ul�0`�f�Ø~�6�\�\�u\���\�\�z�\�A\�Y\�}R��3��{bZW	\�\�t\�@�NMUkcg��\����E\0�\�\\�ɶf\�\�сA�hO�&�jd�&:k4\nHk\�0_�F*:��C\'f:���Q{��\�C\��+�b\�ߨ3�]:s�[\'f[ur�M�a��n$\�\���\����\0��H3{�k�����\�Y9��r\�+=k�23\���9*\�d\rؤ.~�\nN\�\�\�b\�\�Y�%��\�\�ݺx~P�I\�ߝԏ~�R?�\�kX����H,�l�\�?@�ʩZC\�\��핶�NtkmcQn�!�\��M�m^/`\�\�tF8�\�nֲ\�Rg�Wn\�n6߂\�l\�c}w6\�\Z��R	x-\r�b��\0\�7\�*a;UA�������n@���l����\��\�Dxm��N<�\�C\�m�0�\�0 �#Ƕ��86W\�\�![WN�\�\�\�r\�\�ܰ)\�\�\�m�7؂D.\�\�.v&ջ0\�ť���\�\\\�\�Τ�k8\��\�ů\�)���.u9\�\�\��pcR\�\�\�\�sS�jF\�Օ]\\l�\�jcO�\��h��\�\�@B��T{�\�0ZP;\�*4\�פ�\�\�\�5\�V�\�iv�Qˣ\��x�\��tryDGw\�\�@wH:\�5\�[��V<�\��\�M\'	o�\�\�r�\�C5��o�}�plD#����\�_?�\�&y��������L\�e��\\\�T\�I\�$�\0ǖ0�B\�ڃ���\�\�R�.�\�\�+ú�lE��\�M�跛E\��\�\�~?ٔ\�?��\�O`��:\�{�_�	�%\r�I6����Z�ί:�\�J\��H�\��r�\�\�e\�6\�\0TY\�.�\�3\�\�\�D\0\�$�4\n(\�oq\�\�9e\\�!�!���£(l�9#�ɱ��b0`�	@5\���*T+�`\�dm%�3�d\�o\�	0	nG�����>K�I󝥜0v�\�\�\�W\��\�Rk�~6xV2p\��\\V:\0�%�F�+6�Cv��.\�\�.��\���||b�\�QBD�G{�\�:�Zۙ\��\\�\�,\�\�\�\�^]_\�\���]ztږ\�\�\�\�^=89�/\�ֹ�V\�S��H�mk\�uZ\Z�\�\"29\�\�T{��RK���\0��A��-Z\�Ѣ\�ͼ�S��w\�\�R�Vƫ�\�\�*\'ÑQ�\'�?<�Son,\�Ç���\�A=��ЩC�\�\��f\'����\�\�\�\�\�W7\�:Z_���I-\�Pu<���t�d\�C��52ԫ����3�{U�1���j?�jc�AWO\���1ݾ�S���\��\�\�\�\�\�\�\��h^\�ƀ\��@������dm�c\0��������\�\���{G�g\��y8@aύ�\�lm>�O`\�۔F\0_f�\�9\�v�M8*C�\�9P$ϼ�=ǘ\�V!�	\�Z�SóڟIk,Wg�+�\�\�J.-�\�\0 ����{I���[b�a�0\0¾	�3\�6\'��=/\�\����\"�e\�C�\�j}\0\��X\��!�%\�-�\��JJ\n�=n�<P�3E�\�e,�,��\�.�Q)��\�G�`ӽ͍\�t|�.\�w\�\�u\�D?һCO\�\�ѫ�\0`Q��|xfO�ǩ��j\�ꮔ�\0�\�6�}G��I��I�\�\\_�\��\Z4ߕ\�Lr\�\�b�Ow\�\�R�6�����c:��I\�W\���\�~g>�G֬j�)\\;�kG:tx/8\�\��p�7١\�}�Z\�ӭ�]Z\�3��s\�Z\�?�)�vzpH+s{uzmQ�\�a�F�gP�\�Au�f`_뀹}���T��\�|��z�\��_R���lCo���X\�s$@\Z;ZH��_�3�Pb\0�\�*����E���@�@;����\�c�a\�\"LS���>��4�륁\0�\�H�M˴¯\�1O �b�\��pڱl}�`�%]\�mf8\0\�\�PoI٭\"��\�\�JUD�\��\�~\'\�Z�\r9c�\�z>!�����t�<Aa�Ŗ��>l\�\Z�T\�u86d\�FJ��\�|wkp-v\�r{\�\rH�=\�\0\�\0�ӿ��1?��*t^]h&�꾳\�ߞ/\�yY\���zza��9�{�u6<4��s]:>Q�\�~X�� \�vő\�\�\���\�5\�\Z#)\'t�0q\�wj�Ggf�t�l<��\�:?߁\�\�ֽCzumA�<>���8��>=\n\��y\�:��Q�\0\�\�d-l�\�\�\�\�N\�u�A�ݵ��ZMv5jOW���\�5��[3���og\�Y���\�7�\��07��\�\�ݺ�S����\�\'�\�?\\\��\0�\0�\�G��ؐ�5!�~?���㧛��\�\���tҰS�1\0Ɛ\�{�NB\�!O�\�\0,!|\�\�~\"�&1S_�\��1�V\���.j+�Z]�,d\��_�\0\�b�yH+�\�d$?\�\�\�耜\�dv��\�F�\��\0�0\�fY��g%k�5��B�	�\�\�)� �ި�\�V;E��ċ�s\�{\��7�ci\���y;+�\Z�\�I�\n�=V\���\�E%E*t\�s�q�,�)���d���4ݝ\�\�9�;���պ�ԩ�Gzuo}\0\�Ӌs{��¼^_�ӛˇ\0ጞ����u\�\�.ˤ��\�\��\�~�;8۵:8�jud��4۠#�m:��\�ث\���p�Ugg\0�T�.\�֕�6\�8ڦ�G{�\�ԸޑB?��|qN\�xzDo�\�\�u\�5:��ZG�o�\�\�t�\�\�\�h���\�5;+5\�\�sX\ZD�F�\Zj�i�1�1�\�\�XRKS�:�>�k\�w\��\�q=��_/\�\�\�G\�����>>\��\�L�܏��#.\r|?��T\�~+\�X���;�\'�[>�\�<�L�\�k>�\�Y��\�|h`�7�\�5?\�8+\�ؐV�\�\�	4���ⳮcB�\r�X3*�\�\�!<�\�Ɩ���l\�5+Ǥ\�T\�0���À\0\�\n\�1�->�L<��\�ڮ��\��?�\�z~���k�g��}��vͿ�\�H.l^��\0�<^A	\03`9�\��x.\0\�\r�\�.�\�b�Sd\�ؕ\�,Q\�=w�bg�`�;\���j�>\��zt���\�̸��׋K�\�լ\�]Yҫ���\�>�<w6<�G\'���Ԍ\�\� �\�\�ʨ\�͎\�\�\� ��]g\�\�84���tq�G7;ua�R���uk�C��\��x}Ho.\�\�G�\���\�#�\�۫���\��\�M>\�\�\�\�\�\�\�t\�Z\��tlo�ڭU\�v��Z�\�c$�\n\�j�i�b�3�q����Vk��\\k֍s;�\�֌�\�ݯ\'�\�\�\�I��\�,\��\\?�\�+��\�\�\0�z���a�aD\�����\0�O\�\�rp\Zn)+�\�\�7�\��p���\��Et�\0%`�ppKIC�_\�a@\�y1LW\���|�X�$\�Bx?gY\0��\Z!@���B0h \ZQІ\�U��\�\�2E\0�-Æ7�\�\'��~�{�\�|c�\�\�7���$)\�&���\�ZS\'Di\�\�|v	\'�\�1q�L�Dzm\�S1	ג���o�t�\0�� �\n�\�n�\n�~��\"K\�P{�ÂE��[��(����ǂ�UD��\�9ȭ_\�\�=%��<�_\�.\�\�\�k�z{mIo/\�\�\����\��\�Czqa\�^\��\�S�s|L\�\�v������\�2S\�ҭ�\�%\�\�\"P\�\\�ӽ�v=8ڧ\��\�	\�?���\�^\�W��W�\�U}p\� �sLw���\�[u�P�.\�Չ�Z#\�!\�,��\0Y\\{�*��\'�Gtp�Js\�$\��j�m\��ӵ�zv�}�7\��\���\�>��\�.�p\0퇶���\��>\0�\�\�\0�\��y�Ʉ�\�ǿ��J6��\�-f��|xɩ��C㓊I�E\�HVRƁs�<@e�47\�\�7�+�K[\�\�\�A�ڙ	�pb\�6�\�#,��\�V����3~l-\\a$\�\�\�VĊ���\�n�4lk�Y��55X\�uغ�\�? �\�\��9% ��m�ט��\�X\�\�\�[(�ۀ\�<�\0Z�-��lA�\"��\��\���[d��*,+T>*`�.o.�\�s���wE\��� �(�\�ѰVF��>�7��a9[�j�\�˳a�}���\�ƢޒP\�\�Xһk+zwuE\\YћKszu����[t�\�}r\�\09����y�}zxbpnV�u\�i\r���\�G|\�\�u\�\�N�\�7\�\��\�\��\�\�s�\�\�q���{�R\�\�\���#=�ylةM�\�\�б\���[��T=Z댚\�\�ia$�\�\�\r:3?�]x�=zx{�\�n\�<>aA�\�}�\�)\�ǿ\0_o�\�\��y\�\rm\�\�ڲ�����?t?��,�\�?�\�wi�����v\0�?6_פ��@8\0>����?\�`x,a:c�ȓu���R/,hu���[�\�J\"����&\�0����\�qPYS��\�V��nͦI$7�(~\���uUG+\0$`�ְ`<\n�t\�@^\�\�\�r]�Q\'�s\�\��\�v\�R/\'�\�\�qW�E\�\�\��B�F�;c����g`�s�+��1WYř*\�$�TzTVQ��$\'��P��M��`��\�\�a\�\�L�.�R\�ލܭ\�\'&�0�<�\�\�d�wזa�E.�ѵc�\�e���\�cKz}\� \�~�:@�/\�\�\��Y=C�èw\�t{�S���Jvc��l\�Ћӻ��y}�Κ�z����䤾��4�>�{@�Ώ�/C�\�\�].o��V�	�]\Z֩��w�N\�kљ��\��Dߧk룺~��Zk��ygB�\�y�`Q\�\��\�\�z�\�)}����=��\�߾\���\�\�~����\�\���\�\�\����BX\�~�%\��b]2�g��W��o��^X�+�f(\�vY6���)ix���?Ož/��8X\�v\���\�H�H�ɲ��2�\�Y\rՆ\�%�%�d��?f^0\�ܶi��H2�`��\�KE�I\�a$7�\�VX����F��XL�i���hpc�\�R;9,HI���|V`..e\�dq1�n߳\�\�p���h\��V�J�iy9ʆ�\nCy�\��>\0\�q)�0f\�k�ç�\"U\��\�k�@-2ܦ[�ܻG\����.=;5����\��\"\�Z,o�҇7�q��>���OnՇ��#���\��U|#R�\�j���>�\�ڈÈ�O�G���:�K�¨߸�\�v\\\�zrF\�|��o<;�\�,\���\�z`!�����f��G$���w\�\�ƨ.�\�\�2�\�卣;t��\�y|yF�nax�w�\�W\�ƻǜ,�6\�ߚ\�7���\�XF�\�+B\�s�\��\��\�\�\0>\��Lg\��Gx\�-!����~`j\'�XZF�\��[\�w�;��`u/��_j�ao�\�<�K^3�4/,\�3 \�Ж\rc9 Z�;[Dx<�tE�N\��f��mQ\"뤱1]k\"t\�c\�,�k�\�\�Pƭ�&	#���ձ�\�ϊ\�\�+m}�r+��\�>\�\�g\�fJ=Xc?<�7b��\�\�\�sN�\"��\��\�SD�\�\�y�|�~��\�\\�p�\\1X1�\�0d�@��BeÆ����u�k/�LJ���TI�I\��twmL�6�8r�\n6{\��\��\n ��!����)}q\�>�uX�\�9�\�os�p�ǯ,\�\�ٽ�ܸn\�׍�nG~\�\�0\��\�zz\�\�]ث\�\0\��V��{\��/\�.�]B�\�B�\�Scz`=�\'�]�bR��=H�n=�8����{�gx��U\�\�]ܫ\�7�\���䝭#so\�Y�\�\0���\���e=��WO_�\���z�\�#�?�\r\�����X�GH\��\��\�� \�\�g��_\08cF�c \�\�m�\�-��\"���ꀯ�8�\�b\�ِ\�\�,��{[�\�uC\�X�y>ذ�\�\�l\�փ�\�1�\�JH��I�hl�\�(෿IH\Z\0	!I��`p6k\�f�E�{\���vhsCI\0�l\�\�[\�u<�\�\Z*\�\"V�$�\�8����v\�8a�0X�@�S�f!��\�@Z3�r�U�ǖ�LW��9\�2\n��Y��\�(�\�+��T���yHs�2��J/\�\��FÍ\�\'	/�T9����$\rB�[|}����GO\��|H���K+�\�>���d�\�\��\�\��N\0\�\�wR�\�Z\�\'&\�W�I\�{\0\Z\��^_\�\�\�~�\���\�.=<2�gSz�~vkI_��\�߿���o���|�A��S�&Ĝ\��H/�~F}rv\\\��/�!�x\�Ϳ�@��\���\'[\���\��>|�\�\\���\08+��\0�\�\�9\�K�\�.`\����	�P\"˰\��	$\�\�1�e�?@�M�O�Do�\�\�\n� ������K\���E�W\�B�\�\�Z=��\�Ű���b>˅awF`�\�`p>矊l�ŀ���K�� bk��լ�\Z�Ä� �\�i��\���\n�4fD��)��\"�	�\�\n�Q��N���\�3\��\'\�\�\�ʆ�s`\�\\N�L\0�U��c\��rd\0���L\0W�,7\�#�d\�����(\���yT�!\�.�\�{�~��le\�\r���\�Y\�\�T_H�\�C\�I\�S�\�S�x���:�{�\�!\�))��E��z{qY�\�:�O\r��\0\�\��ڃS�\�&�ۂC7\��\���ސ�﯏\�\�\�n�Cח;H\�=�wdP��\�	,�\nv��\n쇄�#\�5���λ+�j���c@�{x�������\�Ԩ���\� ��j�ٿ-\�\�M[�|�^s�\���&[\����^\�|\�\��\�$V��_�x@<\�H�?�\r ��1�mo�]������\�	\��!RmAv��\�q�\�K�\�\��[�`�=�\�\�ۨB��l�EZ����\�KE޸\��y\�\�8�\�\"+۔r�\�m\�^�\�\"C�2˺d�1�\0�&����3��y@��~\'!\��\�/\Z+�	)n<c!R�(v�BVa�*\�v$1�$�\�yHi6L����\�w\�\0�ـ/&7o�Y��,F�\0\Z\0[�� �&՛\�K`)\0`^��L\�\�\�;e�,<c����\�i��\�鎙�\��DL\�I���0��z|rROO\�ի�\�NZ}se\�<\n\07`?$�\�:\�wR_{xV�\��חI\�0rxg��\��\\�nε\�\�!\��ؼ\�\�]zs~F�_?��\�:�o\�;�Ｘ�ﾾ\0�\�\�ON\�\�Y==;���Gt�Ġn�\�O�\�\�~vqo:K�ezI\��a9�#|�\�D��\�I�@g�hX�\�Ag\�\����W�\�_�D��]\������k؎퇿p�\�{�\��~wW\��-`�\�\�w\���~\�0\�~�|�-��Joo�&�\�P>&��$�\�A�Q\�Q\�a+c�Mp:ker\�M��a�2+\�Z\�\�\�U\�{�r\0�~\�����\�\�2��F�A묎 \�AJCj�6*r�\�\�2�Ò\�\�2�\�!\0\�.��r����`$c�T.\�*\�\�>�ǖ\�w\�\�D\�bߌ�\�Y:�e�v�)�\�\0\�L��k�0�(cق\0,��f`1��-���ґ�̼<��\�i\'Ad�?�#�*t|�V�w\�\��V]D2o�:\�ۥ���g\��s��\�!XkQ\�@�om�z��\�\��\�S���-8D\Z�U6\�t}�[��6\�2�zm�]w�À]N*~qf9����&���ǧ���7�o\�_\�\\\�xI@�\�\�=�7H�Gx��|\�\��\0>�Ϻl\�ygɵO�e>�:k	���\r���u�u\�ܤ��f��\��\�c}痏�=\0�\�_&��{�~\�%�����\��.2�]\�>�Ќ�+� 5�t\��[�9��\r)\��T^I^0\�	E�m���|k\�/.s�&,`Vz�ǋa�*��\�\��\��F���\�?9�)�66lNc!�I\rri\���b\�ʏ$Glخ\�\��9]4>\�\�\�//��jr�\�������\\<�\�\rfK\�\0+\�(9q2�J���N��\'\r\�\�k�6\�\\YJC��I3,�9qR�*\�O\"�yx\�\\}\�\�\�/\�@���ޤd7\�7\�\�\���ʎ�֦+�\�i[!\���]?�\�::��\�;u\�zzv� �J\�=�Onn\�\�+��\��:�ˁ�2�gH\�\�Cc���E\��\�vX�MwW\��ȼ�z�>E�-�|\�����\�9���u��{\0�2�~T_�\�\�^=;�\���Ҧ;��g\�\'��\�>g-\�gmEփz{�~�0�pU=$�ܳ%}m\��~\0<��\'Gu\�~�\�}�WO�\0��+�G�\���\�@��+�0�A�{�1|\��g�!\��~\�d@d\�ޒ[�]�*��=\�\�@�	���d\0B�f}s��!��\�:L,Y�\��e��\�s\�0ߗ\��c��\�:H���X�C_�\��r\��U��@0��(A�\�FP<r\�\�a\�t���MN��\0���\�\�i�2h&�\�V���w\0\�\�0��q�e\0�\0m>\�/ؔ\�4<d&\�3�t\'\�U\���ǌ\�����K$�g;uA\�\�\�\�PAN�z\�:\�r�!su2�Ó	g\�҅�n]]\�H����\�	\'��8�\�L��~x7�\�|�\�\�	}xeMoϯ\���]�i\�\�\�j�\�K�Y\�ҝE\�weH\�\�wj����\�\�\�\0pE_���|��\�~��./鋇+�\�\�t\�ӽ�0\�$\�+�:��?n?;�O/.M;�濽I\�%�pcYڒ���m[E^O/\�u������Wn/\�\�W�\�?~�o��������/�:��\��\��_\�~�H\�qZ��~痯�a\�sJ6ʇ�\�G0`Q�*\�Q;=�<T(��f�\0v\�\\�6`OPq�	~+Psݟ/��\�\�/a\�\r�ƀ�7��ܶ?1�r�\�\�\�6)먱\�4>Ohͣ�ʾ]/�\"u\�&��XuPEU^\'}Z-.\�(\0]6Ld[>L�3a�m9۵� M\�M`��*&\�\�x�ڎ�\�p�\�\��ڜ\0(a�\�<\'�\�\�X�Jx�\��R�G�|F:�\�\�Vd��_�?��\�\�\�\�\�Pce�&��\�\�Ю\Z�H�Nب\�@�ܤKx�Qɘߣ�g0��W��Z�\�%��0KB\00㛋+zx|�N\�\�\��\�ԣ�Ʉo��\'\���\�\�U}��&\��w�\�_`�￁\�\�\�򊾅$\r�p��|PO\��r�n�[\� 8�lo�E\�a�[�x@R\�\�C\�\�<��Ow�\�a\�3��\�\�.5-��aw���tk����\�\�j\�ʲ��=�������G��/�\�_~	�~�P��L\�u�������	�#5�!$]!�.\�sa�8A\�\n]nq�\n��\"�\�:L|��Ұ5�\�\�}\�P\\����\��\r���)��W�`	���\���vg��̀t\0/X���p� R�|��?\�.�\�\\����N�\0�=/Sې\��M`8`3I6/X��\\��\�v\�K+1�8�`�\�3 �|\��\0lK(*�}x	\�FD2\��,~� �\"\�1#�¤\�YY\�\�5�u�if\0/8�\�\�\�J��\'	#�N\�\�\�ng,�\�\�<\�N=9>�\��B�;=��\�p\�\�;�ܻ+�`��vT�����M,t�F2��`\�w\��)��\�\�5y���\�\'g�O/I�o\�\�oo\�\�6\0�\�������O�\�ِܰ�\�\������{n��|c��|s� ��z@O.L\�֩��tbH�հ�YU�\ZU3ת\�x���I�5�lM(\�\\�x_�&�M\����\�?�����mL����l\�w	*?�����$\�\�RP�Mn�s�\��$�4O��$(�!\�\�*6m\�\ZB��V\�+\�@Z\�HQ�\0\�\"cDG�(��\�\�L&E#\�V��u��9\�5\0�1$w��ʊ�0^؇ܖ\��H�Ac!Ҫ�jr\�E�I\�Y\02\r\�MC��fj+\'�\�h\��\�\�\�xH4~-��ێ\�\���\0]6`��\�4@�\�g�\��\\�rCx= �d���\�<�@k> o77\�@%|9\Zm�joH\�Z\�\�\�xLי\�VdoP\�\�uc�G��\�\�C���n�<w\09>�\�ga�3����\0\�M>�uf�Y��w\�\�2y��\0S�\���^9�ϑm\�\�o�\�?޿�o\�~��슾���~�!��\�=}�\�e|!,��t{\�@6\�\�&�?:5&[\n��\��.ِ\��\"��j63\��Y\�9�Cֻu\�h���\�+>٠\�T�*���r�\�Xo}H��J�wV�\�\�Q��N{N\�UX��\�\�ӷ~�H���\�Nۖm\��%@�\�#\0�O�<�oS&�\������]\�\�\�\"��\�\�2���n��Y-�	�����\��\�=\��\n��\�\��\�@R\�t\�-�\�߼�z+ux�u+&�\���&(We��Y/�~Hw���1��\�A��\�g\�*\�\�3s| \�/�f\�\�}\��ii9\�ڎ\�\�f>\�ؑ-�\�-\�\�\��0�y\�|\�vA��K6�j�ϫLN�\\��t��#�\�E\�~~�\�\�\�4=Cq~��\Z\0\����\�\�X�ә}�����b\�{\�\��\�$b���q�8k~\�z�\��3H3lt����ՅN]\�ת�k;�tcߗ\r\r���\�\�\���p�\�-�\�}\���\��k�����\�W7�//���\\\�>;��==\���Ç\�\�=f��\�\���ؿ���fE\����\0I~b\�y�٣��w\��vj�P��\�\�)9V�Į&%�{ڔ\�\�6ݭP��M\�\0�	F�\�\�V��V��j.\�T5ܢ��1�?<�\��xM\��\'��m\��{\��I\�\��\�<`�V\�l�N�\�D���r,?H\Z\�t៊�_�g�-�Z��TJ\�(rÌ\�\"�W�\�G��\�>R�1!�,\�6�Rj��\�+uVF��UVW�\�j@WPa\n\�Kὒ.\�,��\r\�f\�\\d0ے0׳\�\0��p|\���u�\�<K\�\�h\0\�$�}\�[mG2�Y�\��=\'[\�\�߶�\�c�1v�\�$��/��:\�;�;g�3`xcM_ZV��3��	\�tk��4<$�tx4����N٬��F]Y\�7\�r\�\�CX\�\�\�\�z~v�w/\�:\�\��Q��M��C:G�ܣGH��s�#,�<�lZ�\�\�\��Wo�\�?<8�o>��o=��o�����B\n�\�s�\�#\�\��\�\�\�\0^7�\�v���\���]�q��\�\�9/\�u�G\�{t�p�-��i0\r\�*�\�\0X�\�T�R�\�JL\�]\�\nw\����*�e��* �J[R�w��\�:�\�\�)ҙT\�d���\�\�O\�����Ͽ��\�-yi��@\'1��D���H��Xnq,��g\�%62\�A�a�B\�R�)�\�mU)��\0Z��!}E�ƙ���[هo5\�\�5�>X\�\�\�I�>�\0�I<�\�dwӇ\�x�d�Z�3��%�#�[a�\�\�M�S�#�7\�hH�y6�k\�`\��y\�\�L��\�2��,��\�}6������τes,�p\"�{�~\��\�aմ�\�\�\�x_5\�u%��-���>\�\�\rka(�՝I\�oli�33-\�_�^_�;!\�!�\�1L�\�\�4lHHؘ\�\�\�c�\�Q�3��\�0h��.��Ig�\'�\�\�:�y�\�z}��|$�����	��\���\�y\��>%L|`�L^گ7W��\�Ο\"\�\'�\�^\���r�\r<��pf��^iב\�ZM\�x}U0] lTbg�;\Z�hg\�U�@�\�բҺ$*.OC\\>�\�mek��-\�V� \nl\��\n�\�\�zf�u�銾�cK�x�|@t*���0\�[���\�\�\�_\\�L^a�|�͟�.\��euC{<P:��k-\�0�%h�\r鹐�P�Gގ���\�\0[ʫB����\�C��Hn�\�KAl�2���,d?��\�1ydK\�$؊\'3\0n\'\��X�n/���m��|B\�\�I�-�פo\�{Y��\�!\�\0h\�R&L�\��fr�Y\�\�f�\�V�v��7\'My�\�T\�\�RG<_\�n\�붚`Ls]a-�\'�\�@Ǧ�tr�Rg\�\�B��$�\�\�@�`}�\�	��s\�.\�\\\�S\�ЭC�tiv@\'��4M:4T��l\�\�\������u�\�>rAo/�\�\�\�\'����\�O�\��\�:�\r!ѯ�\��I$\�p��>�\0\���\�W\0\��\�ѹ=�OйE¾ttHg\�zut�Q��kUѝP��J��Z�\�mVl�o�Q\�6\�\0bb�S��*�\�#�T\�UZ���0\"Ǿ�J�\�	+mq�_����3ؙR��U�~W=\0\��亲t�\�b���\�u\�&\0*\�\���BkNp�ws\�\�K2u\�\�\�/�O�\��1 ڰ^�\\P\�si�ɚ\\H���\\\�\��/�d8/\�V^\rҗ\0�!@��\���\�r\�ʔ]N\�\0��x\�,\'���0�1- 4t;# (�#�V�IC�\�-p\�#ǀs���\��`X\�n��h33�}%*��\�\0>;H\�pץ,�c�3�\�a�N�t�{8�:/�}Urՙ*VwE��Z#:�\�\���ky$�����c\�O\�o\�\�\�>]=ԥ\�+���\'��6�;H�\r\�\��\�\�ͅ�xp�\��kc�W\'��je�Q�;R\�\�v��Bkc\r:;ۯ[k�zt\�\�\��ֺl��\��8u\�\�\�\��$�.�]\�ׅC��\r\�_\�?^^F��\�u��\�\�\�)\�?3��\'�\�\�a>\�f\�!��j\�\���\'���	)�c�J��)���lVx N��\�-��ܵ\��`CL�mI��\�*3@6�^\�Hsl\�W�-*�%�do\�Cj��\�Y%:\�t\�P�\�YʅA\n�,�\�BJ��\�i��5�S�\�\\\�\�/\0��&jSX�\0�\���\�`�`W\0�vk�\�nTE)?\�W��\����<��\�{\�G�|��p@��0\�\�Tn�Ȅ	\�f\��\�\�2�\�Bd\�@eEf\0\�YYf;@\�^\\\�\����\�0���{?7]���4B\'U�\��\"�ƀ����E\�ɀ�2��↉]\�0\'�\�\\d����*}0`E��*�4\�\�\�DGP���\0ůE<\�ʎ�\�&�\0S�ST��Ԏ�v\���]\�\�|��ҕ�][���uiߐNNwjc�K�F;4;ڣŝ��\�ց�Mu7s�E�mH����\�\�ݣS���|trV׎L\����w\��_��O\�\�\�)=�\0��}i�Sfyt�םڡkǆt�P�N.v\�Ёz\��\��I\�0��\�(\�[�\�\0R<ڠ�D�b;z\�:\�\�\�0b�\n\�\��%��L#�\�\0�>n�{\�\�/\0\�+6>@Y\�]IH�<��\\84�ƾZ�\�3\0f\0�m\�:!9\�Y\�&nG+B��\\c�\�^{\�\0X\0���E-,*�5I\�\�bۃ*m-���\��{T�\� tX�7\�Qv\�\r�|\�Ez����\�a��I�\�˲`\�L+>��#\�l\�R\�\0\�		�\�\�\�J$\�\�\�_��t�\�B\�֜\�-�\�b����m�YHz+�����c.�aoK\��[{N������X�ٖ�\����e\�Kn�`�G;\�\0`/L\�\�\�p\\Kca�\��\�j��\�\�كx;�K�\�f矘\�\� x���l�I\�gO3���\"us}\r�i�F\Z����Q{;	;�\�\�\�@\�i\�\�p��\�6�uj���C��53\\X�tbnX��`�\�\�8:�\�gI\�\��:\�\�\�\�ݺrLw6v\�\�J�\��ut�U{&ꔨ)% �\�\nd4)_OJe�o\0�\r�T*2^E(ia\�	a\�f\'%�c=J����om�J\�+Tܐ��`\��Kkc��\�I��&d�>�-9��\�%i\�73����Z\�L�\�\�4\�\���;h��\�\�!\02�8fDja\�tҗ��2�\�\�¢g�R�%@2�\�,\�L�%5!W�Td\�-q��\0P�P�\��Cc@|`n9f\��Y6\"\�֙:\�K\��3K\�i\0���ß�W`^\�\��;\�tVp�$lъ\�L-\�m{\�i8\�\'�Zѻ \�g\�Л��\���\0b7\0�\�c\�l\�5{��\�T\�\�Ww�X]�\�\�+\�pK�����\�y\�zZ�iu�\�iV\�\�Ӫ��5�b����Y\��\�`�\�j�<V�\�F\��\�\�`o���Wk��V��U\Z\�\0�r\�W_�\�\n�t\�ko�\�G`E�w\0v`�\�vt5\0P�7\�\�,�q`�E|!]X\�\�ݍ	=\�s�\�Խ\�΂\�\����J\'jTG��T\0H���:I��	:*0?�Gv���Q\�7:֩0�\�iTd�\�M��6J 	a�8ޕ�OED\�\Z޷vl$��v�\"\�eM\�\0\�\�&\�wwi\0�q`O9.M\����\���S��b��S��2�\0\�˃\��]PX\�\\\�G\�춱�\�\�a8�\�&\����\����\�M�-��91�r\��=��\�\��H�9!��\�l�|�g��n���]\�\��\�>l@��}-�n�ۿd:\��\n6�\�tL�~��nO�.�\�\�x���mX�rX\�\�\�\�֨`�\r0k\�\�\�8\�I��\�[��f�#��\�\�uV�4\�P���p\���ٞ��Z\ZNiuG/�\���#���r5T�\Z\��$hGw\\\�\�Ѿ>[��N;[�\Z��R?�5\�R�N\08\�^��8\�X��M�\�\�׮��V\0ר�#=�l\� j�\�`s`�\�ޑ\�lԱ�>��Sg�{uqm@W��\�~]>ܦ��`ϩ&\�ߑP?�mK\�|�\�\nH\0tyG\�f)\�hVh�N\�\�1\�/�M�sByQ�\0R]�ĺk��JW�\'\�%\�A��\�0����\�C� ͞���\�\�;�?6ڮ��v���[@\�\�\�\�\��8��\r\�6�x\�g`s\0gI\�\�K\�f�0\"���\�Ùp\n�n~HWE\0\�t\�\�na�\���\�\�gG7%�0TN\Z\0\�t\00�I��V�C͗e�,��_n\�\0�Z�\�K��2ʶL�/\'s3l\�m�M��\rk���\��\��\�\�$`Y�\'\�\�G8	\0��\�l!a\'�\�\�B޳Jxo\�\�\�\�\�I\�f������\'S-	`�:�\\jOi�3z7�xo_�0\���x0�\'�kx�ٯf~�ژ[mUau\�5ҘԞ\�j\�\"�u\�¦1�6\�h\0�>\�T�ކ\Zu4&4\�Ӡ\�!�\�ݤ��:�4Wk��Y�FZ�{�\�\�\���N\�F�`�)if�^I�N7i��\�]�\��j\��i\�\��jOh|(�H�@�B�`�\�\�\�c\�\�`�ޔ\�#5\n\0wq�?\rW\���;k\�x6D\�\��\�lp!��X�cv�\�KjI\�5lu��|*[�ٜ�t\r���sg���+3P\�\�D\�\�LU�\��O\�Ƌ�\�|\�.���\�N?^�k\�7\�i\���p\�^\��k[��\��\�enp�%˕E\n͍��6�\�ƁC��2�8\0g6\��j��\0�s	H2|�\�\�2I�[�s\0X:rkekV\0�6&\\@!��p��\��呤sC�� ,\�	�\�|\�\�f\�!\�9Ƃ�Ƃ�p\�3yG\�3���M�a+�݋\�v���\�UE\Z\��j�ӧ���6Lg	6�]\�\�\Z@�*K`@-\�S?R4\�Ѯ����H}\rq\�%���R=uI��.\�:\�\�[�ce\��O=m\rj��K[5\�n�\�7iWO���\��&��U\�\�_\rw\'5E�\�\�^\�,�6>P�\�\�ݟҞ!$w�Fs0\�j٧\�2B�	�\�b�JZ8~|�\r��{�\Z$��(A$\n�\�;j\"H�V+\�U�2oQ-a�\�O��\"\����T\0��9,X��\�Ic\�\n+\�5\�\�(�`���\�=\�ȏ����\r\�\�T�\'�\�f�\0\�|Qvq: E�\r�\�~\0\�j�6Ƕ$X�pG\�9sJ�\0�[\�X�\�a>�0�\�ζ\\X0���̍���1`�\�&�d\�,+�\���2\0Z�P\0�BI�|`&0�m��,��a%K��Xad\�\�ja\�l\�\�\�{\0��\�m��o]7_?\'H�Us\��Y�\�\�\��j\r\rƦi��O�\r\�\�\��\�j�\�9�\�\"\�=U\�jOj��D�\�<x�r\�!�O���O\ZDE:8�Z�-��!�\�:��mqMv��\�j�W_mJCu	g������H�\0��\�\�c�5�`ϸ�:�4+�t�\0>|\0�jS7�\�YQ�\�\�{��fmHW�\�`�.\�\�\�\�(@\�UOl\�\�\�\�Q��Z\�\"�i�o;�թ��*��\�p#x@�l`�Fe\�ry_���x\�֘�\���2\�\�{a�\�N���,��Dr*�b�{��\�sK6���\�NLfrl\�\�\�\�\�\��\�٢\�y\05���\�\�&%\�4\�\�Ö\�\�L�^�<�!���m;�ȇ\��\�\�+Lp\0�%Ϝ�\"n^\�\�Hp�r\�\�0�e�P�mu�0lg�񥛥k������\�� ��M�\��O��a6+ǘ��f�\�E��?;�Y\�\��?\0;\�J0|v�1��x`\�L\��|F�\�\�n9��l\���\��m_���\nd�3Y�c�j\0��$\�\re\�\�\�\�&�b\02�B\�\�\�XkXm\�\0�5D\0`��bR���\�&	\'ݚ\�\�\�3\�Y�\��Ru�\�\Z\���NMvh\�Mt��vRo�f�\�53��Ȑ�\0u�\�-��:x2\�U,\�S\'|7\�[0\�V\�g��yUĉYT�q\"�Zm�-#$~|j)\�\�\�#��\�\������\0e/�\�w���x\�<,��*H\ZN�\0\0B\n`��`\���b\�1|�5��4@㻺UߕP�\�!\�\Z��\�`Dn�e;�!\�V\�\�@�\���\n@���rjs�\'�Z�4\�z`]ts�� \�S!>��\�\rPf%���h~�ٹ\\\�\�Fso\�lȭɄ��a3|�M2��z��\�}\�ڴ,�|\�p`m[\�9I�\�\r�\Z\0Ӷk+>0��\'�3�C\"\�\n�>AR0L��m�\�7\�\�1�h&�\�)뤧)\��4q&J\�\�\�V�\�[\�Q_�X����\\;Z\�4\�^�\�\�@�i�=�\��*\���7�\��\�\�\Z\�8��3\�HuB��x��0a�R�0\�<\�\��^�=8�+�&uuu�\�̏\��\�\�aX\�\��\���_ܥ��F-\�jiP�Ŝ��w!\�\�5aU�K���nl�\�!c\Z돫��-|6�\�/q\�a^5���B�̀�\�\�\�$�t.\0ki_��\�xH~����%�R�!\�%\�0\�NSI.\�e�\r/\�Ƀ\�+\�W$`,LX�\�\�W\��o\�AV�sӴ{�U|�I�I�y�L�Nz\�&�\�WD��[̒�\�\� qvۂK9\�-�+\�cC~�\�\"ks�z�r\�&�[\0��\�h��~d�\�0\�0\�Cn��Ӡ�_t�Ȣ�\�a(�p@�A\"\�-E��\�4W���ltc[��]�f�\�\�Ɖ�\r��޿\�\�z/=]_\�\�\�{��c����nn��\�gq�l\\N9��V,7Æ\�`Xk\�7�f)z\�Vf���\'K5\�B�-O}u\�#\r�F:\�\�Q\�\�<\�+2́�U�쟑f{*�0X�\��\nn�5\�\�\�tM\\SU�\Z�Ii�}0\�h�W�H�A�t��R\��juv�GW֦u\�،�ٯ\�k�tanL�ztx�A\�CI\0t{a\�1R��\�E���\�&}vջ�\��G[#�D1?֊c�\�ojǣ�2�� \�%y;�\�vح�0\���x0��uV��*\�m�]\�Hڭ�h��\nA&�*%p������烉<��\�M�\�`�.��\�_\�Y�s�<\�\�.��<d-7�\�\�\0�\\\Z(I�V��P\�\�0c\�\��z\�h1h\�\�\�\�ǋq`m�׆\�\"Ŏ\�9gcǐ\��\0\�\�҆Ŭ�caÆ\�l\� ˽N�8P\�zlL�\�j\�\�6\�\�H\�\�8\0b\0|�\�}n;u@�\�6�P{���5\�\�ͮ\�\r\��[y<͆\�H\�9~N>\��y2M�o�\�̠\�4��MAN�T0K-�`7ad��T�u�8I.\"xx��3���1�qf�zI�3�\���1\�P\�\�,>m�>��\�*͵4h�\�U�t�8\ZhnC�vZ�y\�\�\��x��Uj\0�\���\�\�\�S�U\�u��O *\�\�<�\�\��\�G�\�}j�:�{M\�`��b�\�!	yT�P!O+2\�J\�H\�\�^-A�\�FF��\�|_oRe|\'\�K\��\�S�\�r\�\�\'��P�\�j����Q���hV+�;�\�V��`TN�v\�\�\�\"��@�2�y\�\\��1\�\�\�y�\0/�\�\Z�����\�\�\\�^;ku�B+��Ay�?�m3\\�!�y<�˙\�H.4�\r\�dE\0&`̅��\ro���\�\�,�\�F<\0��:��R.�1b�ӹm\�9R�\�0�\��=�	r�=�d���df\�c�4\�\�f�Ѽ\�{6\\gA\�6��\�-a�\��\0��b�L~�t�)\�\�\�we)\�\�\\��\�\�p�\�\\\�q���X�nX0\�\�3\��|m�3$\�\��Π&ZH\�=q-q\��[$hko\�юv���\�\����[�՟\\�1\�\�\�ϐlw��0���IM6Ui�1�麔\�\�k��t/�4in�Fk\r\�g�\�}m\�\�S�\�}!U�l\����*��3\0\�`\0��@\\,L�c\�<\�r=\�N\"��\�\�\�Yk\�\Z�;y�\�\�$2\�W\\� \�6���\�+�\��9\�yV�0�3\�SJ\��ۻ`�-��\��\�c�/%pe\�lb6>\�/\��>�����Y-\��ڡ�\�m��L\"�0W�\��l��\�\0B\�+�˄	͠p.r�	X�s�\�\�|�);=�H��F\0`�	6\�n��Dc\'�ȥ3\�\�\���DV\�2\���<|!\0�Q�/K(\�en\�W�q\�\���\�<\�R�W8[a}�+�g�^���I\�i\0ܚr:Y|�\�D\�-+\�v�I��}l���\��	�9.U{�K�\�|\r4�	\"~\�����\�\�\�\0����r�\��5\�W�7�\�|[\�V�\�M\�\�\�\��Аև�h�oH�-��\�-�wi`.�\�h��N\�ܡ#m:\�S��#\�:<ѩ��E���\Z錫�#��\�6�\\\�P7V)��� �\�\�s�%\��O\\H��P\�[K�`AlCI\�\�[\���v�?tq\�vDT\�9\�\�0pQu9A�@\�(ƆǑ`1{�k����`Ŭ#jKl���\��9HTV.���>,8�����!9�k��C��e�w&\�!l�#=�P�\�\���B\�x&��z=�N>܆\��\�<\����\�\0\r㟋4[X\�&��\�@y\�pA \�Pa�lngz�H�j^�\��*\�\�jK\0@��^�J����\�\�\�>�\'|��c?c;\�nsD��?h��~Z�\�#�\�u�5g�:�\�#\�0e:�\�\�oR�\��\�/U/pX��֋\�\n��ޣ�h�Ѓ��i�_sC\��\"��:�\�\�\0\�A�8\�ј��O�Ab\��|��\�RCB\�u�Z��\�Zs��!�gG�uiϤ.\�\Z\�\��1�#_\Zֱ�\ZnpV?���\�=@�I\�0\�`w\\\�sͺtf�VԪ\�.\�\�1e\�.�\\\0Dnԇ?#\�G\�n�\�j&�g8.\����\�3��\����X��+k���V(~��\�[TGаB3�\�\�8�&hC�Kl���\"\�֕\"�\��\0W�&�\�G&�U�\�\��\�\0H\�\�T\���,\r\�&.�D�\�ˏW\�\�\�1��~�Ђ�Ky�\�\�\�F\Zr\�\�\�3m\�Lh@\��4��K��k�\�|�o�%_|X�\�\�4\"8��\�z1\�g`4)v\ZS��liu\��m�\�\"`\�j\0��-�ڌ@�\�u綍�8a�9\�I�JZ���4�\�\�2\�\�v��.>�hsbR�ò��mSI1>+PIʬ5)����\Z wV\����\�\�\�\�\��B#0\�hL�\�Q-%tpG V\"\�B\�_����G�v{����q0dU\\\�I��6\�PG���5;ח;`L\�ho63\�\�Ii��39ծ\�*\�\�_n\�\�1]9;�����\�\�V�*\�\�Ε��T��붂1\'Cik\np2��� b\0,3\�G���}\�\�l\�Vd��D\0o\�v��\�\"ޫ0��ƃ�ڙݲ\�V.\�l����Ł\�\�\��\�������\�H����n~\�l\�3p�_p\Z`�(�\�ǙV�_p�\��Hn�M�A\�\�\���a\0�\���e�I�(�\�-qf�\0��3ß\�\�Y�a�\�<�]f\�,w\�r&�&�9֊o�ػ�x_*\�_D\nF\Z����WsFD8Y��\r)����&�\�)c!$�o\�n\�\�Zs\�\�\�:�B��\��t�7۷9!&y���Y\��c\�m\��\�46��_k�`�*I\�\r\���z\�50![GU�S�h�k_o�\�\�\�oB�#)�rV\�Z�\�\�(\�I\�\�URX\�oQ�w�\�D�Ţ4s����dD�ɀ�S1\rT\0���zkC\���՚\�Q�\�GB\�\�\�Xiׅ�>]٘\�\�\�Z��\�=N�)U�\n�\�\��\�ő`H�$\\Ҕ��ͺ�k�X����B\�-�\0@o\�Mב�r\�FB\nPD���0[Щ�8��ch�\�\�J�e�L��\0�\� (\0�\�p�V��\r�r�d�.�}���,Rv\�K\�#��6��+�2\�gi�5�����k]\�\�Ve#0\\��Z\�l��N��1^Ї�q�l\�\�\�2�\�\� �X�\�\n\0�\�\��\' \��\��V�+/!�H�����QDR\�\�l��o����(\�8��ݶ\�\�)�\���>\�\�+�pһ)Ѱ�\�\n�m�����+V�I\�TF)I\�\�>\�p\0���-�\��e\Z\��\�bU\��cEj%|u\��\0�K=\�n\�Țx�\�78;�lq��W9@���VS-:��Z+{���CCM0f�&�a6|W�o\�d�bM��V�o-q>#�!��\�v\�ӥ�\�J\�\�J\�\�X�\�\'�\�M�pbXWN�\�\�|�\�Z/�;\�+`�\�U*kvY3)@. ���a �\0��V\�\�\ZT�eo�<}\�r\�R|aYW��A@>Tς\'։\�^`C���x�{�[�\�΅�J��)�>�\�m�3�\�\�\\+�\0<�%\�,�#	\��fr 39(�,E~Y����yh\�S]&\�\�9��0K��>c��L:3�\�Q� \�\r�\0lF(1�fX\�;L��e88\�&�~\�9n�ʝz����Ho)\05PZ\'�\�p�3f����Խ\��\�\��\�\���TN\'3,h2��\�Z�\r�9�\�:d\0\�V��n�\�0\'2m\�\�uY��Ӕ\�%\'߶lcL�N���u\�\���\��1+B��\r����%Y�.Rpom�.Մ�c|\�xO\0\�\�\�\n�\�\��\�Uژn\���V��\�ك}:s`H\'�����WG&�5E@\�i����\�̎V?د3}:�ءs��~�้Jd;q�C��\���~m�v����y~g�+\0�Ϲ\���XRx�I1\�\�AN\�$r�I1�\�\�\��\�ං4\��4��9չ\�\�d#KHk6�Qȱ,�s��F�\�\0�	v�|H�}�i��7���^�м�\�v�\�,B�-��ae~\�l\�\�<C��>�޵q�*\�\�r+4\�`T�a#V\�5�bG��|$\�jMR\�tβ�/�\�B�1`�\�++Wz��^!!�fdY6U`f�\�*U\�\�\�ˑh\0�^�\0,\�6� �o��:\0\�{&��L\�\�g3\�,�~_�ͤقH��\�\�J56�d[.>\�r��I�\������\��\n�\�f{��\��pVf��\���Εa�C�\"5�6U\�\�)t���+Y\ns��\��k$\�\�%^\�\�\�J\���V��\�H\0f~�\�\�a�94��k�d��\�[�n\�\�{{tqu�n��\���;u\�\�.-u\�\�l��1\�I�\�w\�A]Xԩ��7�U\�qqnCa��TQ\"�\�)�>\�\�\��\�\0ưr\�9�VZ	\�C�\�+\�ѐ8��\�Iڵ^\�\�X\0�*\�ͱ�u�gv\�z,�\0�\�\�ـ�M\�\�K�\�\�\�\�\\���m\�\"\�e[�٘\�\0h��	9p�cga\�M�s`���\�\01�����˹��ԃ��t��\\��\��\�\�\�u\�\"��\�:�m��A\�:����\0��$6�\�la$\�\�\�\�e���r?\�3\0ZA\�\Z\0қ�sxM��\�a�\0�/4Z\�\��KgK3�6�\����\�\��ִ�c\�s�q\�4���۲2��e{6\�\�\n[�\�L\�.4\�\�6�d<��\�g��\nlH\�\\\�R{m!�Ϋ\�\nBI�[U�\�^TcWS�&;BN9f64�8\�\r\�N\�\��\��\�\�>-\�\�\�\�Y��8�\��zuvqH\�Wg����\�\\\\��\�)�\�\�\�\�Z�\�.ê���N��xo[�\�\ZD�+�r�\�0\0$pC\"ŵ	y\0`c/�\�J@��ۺ�-`\��\\0�\r�f۱\�\�7%+��T�c\Z�\�g#\\�r\�\�p�dc\�\�\�D�i�\�BW\0Y\����2eAX[l\�\��e\�\�\�\�\�Y����ǖ��&ۼ\�vg�hk��R\���kR*n$�X�=��\��ϥu�X]�\�\0\��	>\0&\�؏\�r\�\�?6g�9%�l|V�1�3�\�Cj\rh�]\�\�gl]\�qo.�\�w@\��Ú[	E\�-� \�i&�\��3Ro:>\�\ZU\��u6w\��b��\�mNS�VX\��Iq~�Â�L��\�ou�\�\ZL>x-�s�u+����5�i�i\�\0���\�G�2\0\�\�jx�.\�HZ>�l\�\�\�c^\�\�\�PL��{j�@Y�l\�*�pqw�\��j\�V��\�\�\�n@6٦\��;e+��\�9�Z\Z�\��D���ƕ}�0^�N��\�\�,	�ۯP _nc>[͂�Qbr[@�l�4��Έ����j� 0pU�xSR.���V)t�0�5�X3o6,�Kz΋¨1��p��6\��s\�\��9&(��xTI�\��l�Na�@�\�-&�\�t���L�\r�e���\�v@Ȗ(}$\�HF��3\�YN�\��Ŷ��\Z�\\�\�Y\r\�\�m\��d6(m\�+3ml�M\�\�\�\�I\�Lrp	\r6=�tk_07\�w�H\Z�\�a:�l\�\�\�\�\�tn^/?B��Bb\�(+ٜ8\�J\'Pm\�\�К�@+��o\�hdzRj�=K����nL�fh�l��g��\�M�M�3\��@L\�3aJ[a\�\Zl\Z[m!�m\��*\�\�ާ�\�ф*�U����L\�u$c�\�z �\n),Tm�D\�Un�\0\�\�6���Y�ے\�7ڠ���H*@\�\��x�k\�\�\�\�o����4=\�g]\�A͎Wh}�S\'\�Zud�F��^�B\�rG�Ă\�t56\�f�6<�)gNo�\\��z�	mur�\�dHY�R�\�u�2�7�\���\�`1\�7\�T�Z\�\�� ��\�L�\������Qa\�FE �h ���-V\�2\�\�\�ޮt6+Lgs��ӬH\�A,\�D�\0_KL\�\�\��<\n+؉\n\�\'tk]ι\�P\�w�\��\�H,\� �Լ)8�\�E�P6\��d[=�/es�sm�\�\�km\":_6yu\�\��g\�r���\�!�V\�1�gi�c;f�\�:��\�mE\�*�n	ضt$\�6K�\�:\�}����\�\��>Ɗ�/PP+\�\0�-\r9lh ̂-3�6Dg\�\�\��\0b\�E\r\�+K\�lM\0u~�r\��7����\\}\�~u7�\�b%����@5��F~Ӿ���\"\�o�8\"��־\���&5\�׌��\rU;=~\�M��\�D�N,w\�\�j�Vgk�|~\��TP� \nmdI�\��Ң*�c\�5\0��I )6@\�x��X� a\�\'ڠAA8@�D~M��I6Vo\0\�O�xVϳK0��ڴY\�F:��1\�cқ^L���\�\�j�9A���$�\�r�\�\06c��[\�/�=�\�\�yO�\�銶U(\���1��&��\�xIʺ\'\0�u8$l\0\Z\0ZǋM�	p\�\0�\�\0Hl��b����\�:�i�F20�N�o�\�m��a.cr֥;_�\�#\�6k@0�Z�\�:����6b˧eB��\�\0Z���\�\rm)\�\�u\0cE�%s���\�\�a�t�\�\\wR0�\�!!\�VS0?��o�Fާؖ�ଆi\�M��\r�\�\�\�3<E\�\�lN!�0^�1\�\�(\�HsP\�a���[B�1�ʐ\�\"E��T�D�\�25T\�\���O�)�\��ۋOk�N��:��Θ�\��%��Z��,���\0m�P�\�1���M\n���ch�.6\�Q\���\��\\�Q�\�ҕ\�H�V���\��\��ra��p\�Q.\�P��y\0����`J�|Xߦ3�eK۱�DlJk.\'k�g\�\'Eɀ��hFi6X ��[L6�\�\�\nЖ~-�Z�9�m;\�\�\�l8Ɩ\\�D7_��\�\�\�=蹝P����R�1��U�5v�C�\\\� ����π!\�OXe<�6\�ǲ!\rX�\��VӳL:	\�\Z2�]\�\�\�e\�\�3\0��O�u��P��w{��\�&��դ\�d\��3G��\�m%h�g].ܶ�۶��1cdv�\��grk�\�2\�㥛D�t�\��93\�Fh\rv\�\\i\��f�Pw�O�M\r�6&���R;\�+����\�x�u0U�(U\�4\0�\�>�8\�q�b\"R�0^��\�P�	\�\�՞\�\Z�!�\\86�3G�t�X��\�L�>��@\�Ê+�J�!@��\�\0!l�¥\��د1\�e\�\�\�s!���K�RHq��\�VZ�d�\�E��\�\�\�h6l�t�l\�\�+	4y�<\�\�wø��l\�f+:\�t\���[X3B~<\��ZY5�?X��j�\�d8\�ˀ&t\�\�6g4\�o��Z�*!%\�X_!g�!�\�ސ3\�\�v\�\�\�\�@<\�<�3\�i�\0\�\Z%[ǋ��95;�ּ�����5\�z�m�?k���\�tvҖ\�HG~3\�u�+\�\n�<\�\�-\�\��1\��t\�>��\�\\�\�\ZH��^,\�n\�E�#\�\�X�6�)�V�\��s\�ϩn2\��6BB\�\�-�R\rh\�k@j�h�s��n���\�`˰�B<O6?rɯ�\�]Wo}X#-�V��\n\�\�%x�ذYB;�R\�՗\�DR��+5\�oChQ\r��Z��\�n���Ўt\'4��N�Vzui�WW7v\�\���.�\�I\08�d\'8a͞�P�:BD}D�\�lx�\0X�\�+tŵ0am\�i<(�����n\�\"X��cme5g �*!ҭU58�\�ɞ\�\���	Wy�X����\�s�����{�7G��}l!xkv�\nI&rl��\�0\��{��?z\�Ȃ��\�t\��#G�\"\�b3ޣ��3��I͏@\�\��HCV�\�\'�e�j̸ZR��mx��)���0bC2�6~k��O{�.�i_\�Z�6*\�6v\���遽,hJ2��,.\r�9ȳyM\�|yL/q���\��\�׊�\�a\���y;\�\��qƊ<�=\���c\��9\�<p�Cn\��\�|v\�:�\��\�\�\�\�\�=s�!�~8˳�d\\g[H\�\�M\�~�7Wm�^��\�\r�G[�\�Ú$8L�Uh�M\�hOL{�bx�F\�K\�ER�/�kc�_ǖ;tb�K�W�tq�G7�\r\�\�\�	\�8�C7N�\��\�a]\���T�3\�\����\�ᮎ9�;nn�Xb\�6\��>W[}\r@�E�\0BsL\�0_1�p\�\�\�\�X팈\�q,�I���x\0�/φKm�!\���P@c7���iC�v�a����̎��p9�Δ[T��\�Ʃf\"�\�F2\�\0cZ\�{\�}�X�\�]q�8cJlb1_\�*\�F��\�b$9�\0�\�h\n=\�\�r� i\0\�N�/�\�ڇr&Yq\�\Z2�<\����\�3ʶ�Sk�wB�Fа���\�vﰞIw�S\'\��q��\�d�~�\0p[�X\��/�9l�5�m�\�\�\�j{V�1��$L8����\���&c��\0m�3�l^\�6�6\�\�\0h`ܔs�e\�i\��6k��\�a����HO��(\��)v<��N�^\�m/�&D�Gt`�J��at�ZG��<\�\�zuq�Wg\"�C�x�O\��\�2w�Ĉ��\Zs\�\�{\�խ�⴮ݩ�Q%�\�\�\�DNa:/,\�	��6\�4���ƀMU��8\�\�qm�\�M�I\�5>gB��\�\�n9(�M�\�	Z�ܗ�{Uh�\�)k����\�	\�X0�2\Z\�\�\0h�\��\��OT9�Xk��jB���b\�U��\0�!�i\0.;s��\�\����pVg(�G	`�-�b �+@�M0�\�\��\0�G.�\�Θ��r�\'s�;��z\����lh��\�a,tX/_�����\���\�\�vf`\�Lθ/ݮ#\�$\�,kP\�L��s\�~\�y\�f�\�l/ �Y(q�\��tj�XΊ�v�\�VX\�B�\���V�����.\��\�-��6)\�>cD��fs��4��FKΖ�\��Y�6ϋ\�`��=9샇�ߘ�h�%\�\�Z�[�ft����\��x�\�\'`���|tL��!�;t�\�0��Q���yj\\w.\�\�Ë3z|uNw/\�Kt\��^͎ת6i�\�la�ԩͺ\�g\�)Q�E\�\��4\0��\n\��\�f@�\�e\r��A��4c�l=ǳ\�`5���q\�\n��E��\"Z��1\�\�\�Ŭ$l>u6\'�M\�Nu#gd�\�\�1\�\�xZ�Vdf\��[��P,G\�	�����:�\�_\�U��Ze�| �\��tZ��\�\�E1�\�s�\�Q\0=;������9\���\�8k��\0b2�V&�\�\��\�t+L�\�3@ZA�f%\Z���fLh�Ú�t\�\�0�\�1\0\�<�,��\��\�cN�I\�\�{l�	-\�n\�\�\0�M�\�3\Z\�9mZBraBҿ\�\�!���\�f�\�\0h�\�\�\�aA�1$�y/g��c8��c\�R�%�<��\��y��\�\�T��\0�J͏\�\�\�X�N\�\�\���:�1��\�\'u�\�\��q]��OM\��q\�\�}�oJ��\�ד+��\�\�\�\�3:�LT�\�Gx�q\�+6\�|\�\0υ_wj�\�\�\�Z�\�U�x<B4\�\�W;����u�X�Ur,�\Z�\�\r�{�N��c�Tf+[dV3�(\�\�f)\Z\0�!8^o\�/9\�t�1[VdF@\�M�\��\ZM\�T��ë2�\�:\"j\�Y��\��\n�U\�[-)\�p�U\�|AaȌ��\�\�`4\�)���Jn�\�\����V\"��\�V\�4�ʙ\�\�,�\�B̿X,`\��K\�p�\�F�^��2�\��[\�fA:\�[FX�P�@M�9��\�� 3ly�\�M\0\��4\�\�Z��\�,��9�\nЌ%\�+,{�����\�tV�\�o\�[y]&ҿ=�ِ�%\r�\�\�w�b9�\�\�\�-*8P#��}\�I-\�l\�\�j�O� ���zrB\�\��<6v\�\�\�\�\���{�\�Yݻ8����\�-~cA��\�\���%ݿ��+��4ѝRUrs\\J�&�VNA��U�\0�κ]\�&`�/;�����\n�\�1�Z��3�g!\��\�_J/\�2��\�1\��\�\�<Ҭ�lf\�myX+g��}\�L��Ykb\����bl����k�\�[O\0�*?AH\�\�o�[�kz.��f�T���`�j�Ê�ȼͶ�����\�\�\�Ԇxq\�\�\�\�&�\�s���5V;\��\�\�\"\�jwV>���ec��%�c�m��K�\�*5	p&�։L�Ȁ·#�\�`\�\�\�p�:7`9RMܷE*���6J\���1݀)\�@�-(X���0�I��\�;\�\�.&�+�8�΀��:�Y9\�<��A�\r\�Y�vҵ�	,�\�Y�\�FN�#ٰe��o<�$o\�y�\�V��\���\�mՙ�>]Y١k\'`��I\�:5�\'މ����\��\��\�9=�:��\�\���^9���ޝ\r�C\�\\\�\"\�M*�RJ��L��\0]�\��*UT����\�Jk�\�R0�kmS\�d96u�H�MO�~\�lng����\��V�lq�����\�t�Gzy\����\�V�JB2P5g\�=p�aS{Q�\�FRd���Lmq\�\rȬ?�%�;K�Z�j\'R\�lw[>��9�V\��\��\�\�G\�m~g�\�yv\�I°�M6��\���ِ\r\�`s\�\��pZ<dNԨ@��8�g\0\�AˆŜ?�1Y�!����\��/�n	�\�kM\n�%v9\�&�۝\�\�m\n\�Z˔�/J�2��\�\�c�-:n�>�a�T+��>�a=\�0ڼ�\�FZ�[	0�\�\�j�_�\���}%� �3���a\�Z\0\�G\�E��\��b�.\�睘ҵ�I]�\�Q�\�H���yf�n\�\�6�=8�W�/\��f�\��z|iYw�\�\�\�l�Zj\�\�K\0�\n�x\�\�B*�!LpK����a�@�\�c�z$��ErH�9f��TN\�0�fC�Nۜ)�%^0X�9F:\�\�e�\��\�\�\�ì\0rmMX�4�����\�i6\�}lnO&�f��[	\'?\�S�+˙f�%3k�\�\���\�U(Z���J%0\���\n��\�\Z8��\0`3���>v��\�\�\�ˏ�Dbеݶ���\�a\�ʳ\"�\�o1ޘ\�\0V\�\�\�\�\�� ���K�о��\�\�\�V�/`Y�\�Ǝ\�\0�-\�a�B�V���aE\��p!�ۥ\�OkL^�\�t\�l\��\��9� s\�\n�H�dL\�xC�\�\�#\"\��t�2�\�mV\�\�v\Z_	/�:\�\�q\�Jz�\�O۬!f�>\��6W�7\�L\��B�S@��׻�6�\n\���w\�\0����\�{\��\�x\\�/�O\�����9�\"\n�vK`�[�&�c9�tŶh�ю!@�Yj6,gCkX�l|^�f%#�\\�\��_�I\�Jk&��Ԟ\��c�X\�d\�\�xA#�<c3�S吅�ߍ\�ck\�d�9�\�/��r��h���hM���-\�\�+3�\���\�I�U�9��T\�o\�lU��\�&�ۢB\�\�e�^\0��,�[J⌰Hn\�!8�M\�4j\�Cb��\�\�Y�6���9�U\"\�acE�\n�l�\�fZ�ikX�\�lvt�\�\�5�#\�o\�\�Y7Jf)2]\n{\"��J�6+�\�8r)�Y\r��8\�y�ͼ�(�\�\�eaĤ\�XD\��V\�r\��\�\�v\�	%\�m�f$\��\�ٌ5M���|6,\��\�u�ɂ[3\0~R\�Z3mq8�XMD&jur�O��O\�2^\�:`�~f���ݥ[�\�͓�\��A\�9� \�D\�\�\��O\�HKH��W@\�0\�a�\"+�\�\�^��,�rL\��!m\�\�\�!\�|��ˀ\0��%/h�#�\�ؠXx�\\Xє\�|���%Y�����\��˱\�[�\�tBb��vW�S\�q�Ba!��0s|6;�\0F;�9@q�fnSff�3)\�_�\�*��*��:RU=_\�YG\�\�_+�6\�\�d�\�&��\�y\�gnt��2Z&5ٙa\�\�-�-�a�ng�\�\r���\�	�\r�m\�!mCj\�tj\�)sp�l-�Ngd\0��K\0Yxk\�\0h\�0��6Oi\�t�\�@j���\0�\�\�x\�\\�q[		�ļ���NGv����\�Yk\�V�Ú\Z�5�i�V\�\�r�\�\��c��\��\���V\�1d�qf뜶\�\�r	Q.|Y}g\\�\�5:�j�\�H���\0 \�\�0\�S��1A\nF�O\�\�M���\�A]<2��\�j�H��\�*X��Yѹ\�����\�m^���J6ت �`�,8�߽��u�\�b6��\�\�l\�ϗc��\�RF\"N\�����`�\�\�Y˖��\n$\�,mg\�a�\�,�b5\\�x�%��#\�Jp��G:\�~�<[��\�o\�\�xO9\�+�|�v4*2���%\"��\�\��y䩴��7\nY8\0�����b$^�N�H���2gvtXgk\�+\�a��\�\�6\�\�p��P���mi&��T�{\�\�\���ۋ���ǋ�Y?�\r�9Q\�L\�\�9A\�FNҍ�=�is\\\�uEQe�@��7�<` �\01�\0(���h�T�e\�e;\�\���\�!�[�T*q\\�\�7k\�\�\�+\0�\�~\�\�w�}�{��\0h.r�V��Ywմ��\�\0\'f�Z�\0GzofJ��� ����5�,\�4\�:6]P\��c��b�޲\�`8L��\�.����ཛ\��\�\'w\�\�_�.�\�\�\0\�g\���l�e�fX\���8!��,\�)�/~��?~^�����u�([\��|�T\�\Z�vM�\�bj\�1�0\�`��\n\� ����p͞Z2{	\n\�H�\ZNKe� c�\�@\0\�\�\�P^\�p,��\�ӽB���@l���;��\�~�.\�\�0C\�7�u��bl\�\�.����-Sn��Q���e9���r�ݷ\�\�\�\�}��Q\��\�\�\�~Yc�\�(�^�\��\�M\�\�λ��}A�\�l���#㹲\�Ybi�	\�)7\�\"D\��\�dd\�y=[i&�n\�cUܷ0\Znl�	�z�\�:=M���,�\rZ?�a\�\�	�\r\0���$\rh\�q)(\�ȡ\����+�\��uP4\�z\�#ϵ�EW\02\�\\L��\"c�\�k~�&\�IQx}��\�\n>�\�<:;/G\�h4��ᒏ?8)��\�\�߭`��\�\�qL���\�\��%����\�>/\����\�/��i�\�n\�˻�r\�D?��\�\�>g\\��\�+4\��XS�\0\�xhZk\����4x�\�0\�9cc��3\�J�>h����4Zх\�\�ӣ\\r\�cXw\�1\�	�����)·)T�_\�`=\�\�\�+��\��ՅUN��\�h�\�\�;Oʋ��]ο{��q��\�o3S\�\�\�f�\r��\��Q[\�\�\r\�\�\�t�@TH\��rK�=\\�`1\�\�@��%埠�\�ӎVHEV�t���\����4dF\�\�T\�I�?�񭉴\��&�@\�\rD7\�\�\�\�\��\�Th�ʲy\�gm��4�Rs\�	�\�v���7k?�\�\�k���fz�iN�T�\�tZ���\r\�\0D�1\�Y�\�\�6���z�\�{\�\��U9\�|\��ly�?B��\��\�7��	�C����\���y�3�W_�*o\�f��=�V�u0�P�\Zof��-�\"�f\��~\��f�,51`C\�����\�\0P@Zn�v\�>;\�|\�\�\�\�<��\0c00Q\��|??-Ѳ $-T\�\�:�z��\�?/a_HGw\�\�n��δz\�r��\�\�\��\�\\�\�uy��U9�\�\�+<+\\���C@ȍ�sy\�_�\�ү\��0�t1�a��Q�h\�+�\�Il�\�!LN\��2Ki\�Y���6�h�H~\� s��=�uF���\�<p�\�P�@��e�_c\�|�,\n��j�\�U��\�iJ\�R�\�ϨEtgE3\�5\�.H�M*p\�0��~�\Z\0^s\���\�j\�\0P]h����c���\�C&\��c��V\�`�/޼)���^9}\�yyrq\��6\����\�_�?���\������\�~V�^�ӯ?-��)|\��?A\�,8���\�3Xm\�jD�\�\n0�\�\�\����R75�\�Ǫ��\�2F�\�\����	\�s�ʅ�\�>\'\�p�d�`��z_�aK;�)�\�yޝ���dŵ\�\�\�l�؀���ȼϔi�l]�N��\��\�\�{�\�\�}�\��\�\�\�ee����=,G.\�cf\�R/��1\�\09;�Ο�?�ܼᕴސ��`��f*\�M���~\�\�.��\�oRr�\�<��;;�I�S��Y\�m]H��S�k���\�Ec\�цܰ�� }\��q\�	K�*���0\�Ct�|6H�	�B��d^\�h\�T\�\�x20�Ӕ�?���Q\��]\�;\�d��+�\�79DW=\�Yp�	\�\�~쮰\��8TC\'�3K\�\�w����\��\�\�\�\��\�\���?R��\�/�\�<\0|�3$�\�M\�B,y\�K\0�B�͍\����{��{+Ht\ne=@�*\"\�\��� P\Z\�u\�>\�i\�fȫ�b�׀z��^��\�-F�-eA�\�=��ю̈́0��	Αl+Lz��r\�\nG4		�<;��\���\�{x�\�\�Ň7\����\�\�+\0�x\\\����G\0p�\�ߚ�Ã\�Y1n���n\�g\�0�d8\'��\0Յ,s��`�ֽߘ�\�xa\�1�]�Z\�\�/�\�J�\��Ȁ)XO\0\� }]�z袢^=���	g\0�ŗAN@XY���;�\�=�=���7h���G=\��b��ݶ�V�5�k̬\�\Z\�Ņﮈ��Z@��\�I\0:\0\�439L!\�Ȇ:��deXp̵���\�\0r��K\�\�\�8\�݇ߕ_�\��>-��\�\�8o��n�\�����lgk\�{\�\�\�\�s@(\�$6F�L�08z�΄7�\��Z,\�\�\���)��\�\�D��9z�Ur\�3�$\��{\��U~���ւs^���W�\�\�!\"\�->��%9B���>/�ɕ�\'��\�[�Ϯ\�\�n�tQ-`ԝG�Zt��F�^rQW�\��OGBc\�I\\\��m`�$��1t�Akc�\�L�\�,Ǒ}8\�9+La5\�#c}S�\��\�\�\�:����)\�AMK�\Z\�IQ\0�\�~񸝫�΄��5\�IaU��k��8�m\�\�̟�}�$��\�bXC?<<�\�5,X�^(V0��v\r���,+J\�?\�\�bN\'��\�\�/\�+�\�	m\�lr]\�=�EhCSz\�\r	�|Z~�٫�\�\\~�ٛ\�\�oO\� �s�VS�\�l.�>��tCoNy\��\�\�rx�\0\�gb�&P\�\�\�qW$�U\"Z!\�n\�g�O��\�\�\�\�\�ɝ`\�\�z�\��\��\�<\�\�,�\r�i�[n\�\�u\����-\�\�\�N�i�EI�$(\0\��\'8�,\�ܖ\'���{�	�(���\�\r�{�,ot��|���{�\�5.x\�\�_�\��\��)H�\� ;$\�˅����׆x�\�~�\�\�\��:�0:\\�ݍ�ں<�\�vU�L\�B�~m�̲���a�i�9f��\�\n�\�f��p�\�py`\�\�z\�b�\�hѫU\�)�h��[S�W�c���\�)\�\��/+𲘽er���\���g&E\�\�`�\�>\�\���(�5\�����\�8\��Y���±x�yr�eK�Ԭ�2\�O�\�<_��\�.�k�^�\�Ȁa<��\�`�D�״�\�^��qM��fv�G\0�\�\n\0\�1K�\�\�o\�\�ZL�\�Zׅ\�j�q�q�L\0S���[@RC\����0�Y��\�:�~�[�w\�����\��\�#��+\�S�x^�a�\rfvz�*+2\�x+^[�	\'\�/ ۫\nB.���[��抛\����~�\�\�EÊ�x�\�z�p�RW��fۏf��XU\\a��M\�٩jwPm*9\�Z��5\"�nW\� �\0�E�\�\�\�\�\�Ƈ�׭4;ƻ���`\�Ў�80\�\�\r\�0\�\�hC(�v٨G2-��̉\Z\�<�Y4�k\"lC�4f��\�\�+��Xk�d�\�\0�N\n�m��;\�>��\0fr`A���x�|�\�5��v�r\�F��\0���{�\�\�\"<+r��9^I\�e�;�\��jA\0�GkF\�R�xÆ\�\0\�X�0uH\�`\����k�¹yf	�6\�w\�\�\�r\�51�F��Zq��6\�$s\�.Rr\�l]|�|x�\�\r�_=.��\�\�\�v7F�5�\�?\�\0�=K��\�iif\�\"^�\'\�P#�͖\�a\�l��x=\�Y��\�sf@\�\�\�h�QE�`\�\�1��\�\�\�e�\�+=X��\�\����\Z<`{�\���vlX�Gk\�@�&$�\Z̽\�\�^��G�\�2�-\� �O��\�0\"f���6���\�}\�/4T�\�h�\rÅ\ZЀ3L\�,7$����\�L\�%lh\�1�\0�l�&�\�67\"]�[\�қ\�\�\�\�Ѕ�\�\�T�̪i3�\�\�\�U�x����H�h���@�)��9y?&2\�Q&\��3\�&!hnӷ[Ϙ1\\(����\�\�{J���EC2X� \�Z\�\�9�;\�f�\�hYZ1@ }L\�(\�\�\�pɦ�$�[\�\�\�eG�����-���Na;+`M�-`{��\�\0�\�7{�0To�g�\�o�0bk̈�FՍ5�\�f�3N1l�\�V/X��\�\�2�8Sc^\�\�\�N\�\��~�<�\":�\����n\�i�\�z��jy�U\0{�5���\�C�X�>�\�,L�r��),�5��a(\�)l\�sff���F�M��\�F6\��\�L�\�\�?^1\�;k�e@\�\�3���sx.-\'\\W�\�\��\�\�I3e\�c�ƴ\�@ڃI�a/&E�b�k\�eY�g\�C\�\����\\?\�1\�M	Fd�Uš\0�&	L��X���2�S��IF�^�`~Sx\�\�\� a��WS\r�\�9��TC�&�=�j,N�\�si�}\�5bѧ\�[\�q��\�����8x��\�a�\�ȷj\�\Z�\�r�NG�Ysk��TDs#Kc~Ʋ.�	.V\�\�mF\��x-\�t\�\�yi�3��\��L�$�\�ó��Y\���*%q3~Φ\�@{�\�+\��8�8�\�!N	�&h\rhf��W��\�B&�ڂ�g`�<cҳ&\�\�g��g�%HPZf2�ŵ\�Q\�\\�]��}~\0��xʀD&�\"\�|s<a&D\�y�sm\�\�,I�Iƻ\�@�\��aD\���\Z�\r6h$�\�b[[�\�0�c�;{�by���^|���\0\�B^�\�]�jٻ�\�5�:Q3i\�ew\0�(\0k\0��6á�@\�\�Mp�\�\��� �\�\�3H�\�\�B�\�\�e<k\���nM�+!\�rW�\��d�\Z��\�G\�2z\��,�G��Y\�:q\��kˮβ\�ҭT\�7x;���\�=ͬ\���UY_\"F��\�\�l�fm\�\�J���Sx0�\�/P��N�`f��\�A��c\0\'\�}82�B\�s\�1i����p��e�\�p0\�.��`\�\�\�E\�5�N��F\�9�%5��D�\�>1U<U<mk\�&�TA��b l7\�9�Ղ\r�V��\\e���(6\�D���/�\�H0r\�\�$\�\�\�vg姌�\�^\\�Ąh�l\�\��SXM\�:�����N+w�\�%��-��\"\'r>-�\�@�/��>@\�k\�<?�6\�8(�\���\Z7\�\��Y\�ĦrE3�<2��u(�4�:z\�V�8ff<Zƭa\\W�g8��\�&T�#Ȅ{JR!�<��ڕv����Q��\�8-\�m/�W�\�hS��\�w/ʣW\�ʣ�]Au�\�\�Y�v�\0r.~y�*K@3\�$[\�	\�\�\� f���х���\�Q\��\�V����MŹ\\\�\�\r\r�Q�X��5�l�1���\�z5@z\0B�\�?��id\�\�+n\�\�qzi���\�Ccl\�3\0\�,�B:Z\n��@� eeu R\"感\r\�\�\�q}p�O�\�k4�\�/��dð#cn\��\r�\�B&��\�&�ab�o6�\��\�S�g�t!V\n��\�Ȍ�aK:\�\�5@e�f\'O�5}��&\0ڭ�\�\��&��w��\�q|�6V,\'��m\�c`.\� �\�,2�!�X�\�u\\�w#�\�:Cj\�\��Y��\\[*	1�\0e�0ᩐ��fWXO>oǈ\�J\�+A\0B���\�\\b!��X����ט߳�9|qU�8 K!�ݖR�9���Ϲ��tR\�n\�\�쇀��\�l\�\�\�\\��*S�\�Y�\�,U;S�\�Z!\�\�7\0\��[�q\�1Ej�?\�\n��	\�W��F�;\�.�q�f*pd�Zm&�\�k֦�3Ng+��E8#3Ve\�\�\�x�7�_\�1Rs_��\Zft)���\����d\�Yl�\�\�!,���\�\�	����7�\0A9\�:aXp�>b\�f\�\'�.��<\�\�?\�K:\Z8\�#\�0-E3W�D~@(;\�JL�֥�J\�[��;�\�\�\�*m�葪o���Ē{\�\�{\�g�\�\�v��ٝ`6Sȸ�L��=_\�\�\�\�#Y�{�.�7�Xx�m�!\�w�\�z`�K\��3�\�v�Ȥ�\Z�����|\�3\0\�z��U9|�q:�1˗e�,�\�]l2#��\�ZW�9N�i5gќ�ꞯ��E�ܔ��\�\�$�(:JoLӂV�\�\�k��A\Z\��M�;\�Z�\�\0�\\\�!�\�\�<0�2\�\r\�IeY�)���\�DU\0\��2\��Y�\\/a`\�=��	�~JOB���<\��*�|�\n	Q�pG\�\nS7�וz\�ql\0t<Y\0$\�\�k\�N\\�rd��kmMa &ʜ�@��\�|\�xG�\���v�0�\Z6���\�\���km��o\�9\�*>u�^�ȃg�	�ep�{-6\'���HQc\�\0��5�:�ź��	\�\�)\�\�jF1x6���\�)fX���\�\�K�j\�aY֚o3Z}�H�{\\Z\�IU\��Sw.��=�\\#�\�Uq��3�\�\��\�\�C�\�n\�X\�l2|\07�>q\�2�t3��qB4�\�\�\�	�\r�\�97\�\�o\�\�Y\�\�rS\�\�uEs�_0�Xql�w�\�9C��q5\0\��\�*���A\�j\�RWO7�>\�A�NKY�e\nM6��\��1\�\�J�o�\�\r\�a��\n멗�\�#�\ZYPs\"\�0\�\�Q��30�>�zʂph+�KW\�1cM��N\�W���]\�*)^E\"H�!+C�\�P�\��\���\�;\�\�R\�M&\�\Zi��/&�\�\n���\�C6 ,+��\��9\�dDX^}h�]-\Z\�K\'\��K)R\r���ih\rƓ�\��c�1�\�\�\�X�\�\�Q�&-x���\�\�x\�\\y\��S.��V�T\�%晉�u�\�r�\�\�\�]�\�%\0Dϭn���{��}`\��\�\�b#��Q�\�.jn\�\�/\�d\0kQ����p���:PCcNl<�\�=i6�I1\rfߖ�&X�,3e��|��`�[5!\0l8м �e\�R�\�\�\0\�p�	_\n�0ꬱ�0\�S�ל7qI�P\�_	0p��\Z\�,�:\�\�#�\�L$��\�\���\�\�M\�\�\�[\��:�\�r�\r��f�\�\�w0i���k�)y}��`7Xk�/\�\\8�\�k�l��\�5\�\�RW�\�\�C�A��\\\'),=3>hw\n=\�`\\𾮤\nk\�}��/<\0Y��X\�l>��Xs52]x�\�:\�;�\��--XȲL\�p\�I�\�IY\�L}�0\�IWB[O\�qB^\�	@WT�^t\�\�ͮ�\��z�\�0\�ʃ�h^XKt\ZJZ\�\"�9�\�{c�Z��7\������\�\�t744�M\�)���\�\�_t\�,�t\����1\�\�\���Y\�\�sІ����,j\�\�VJQ\�Ơ0����/a���\�Ǆ�\'\�\�h\�\�j��\�Ο��\01�\�PӉ���\�}\�\Z\�ϴ\��5w��54\�3U\�\�\�\�:L�#\�;��\�\��Q�&[\'��)�g��g\�k�.��\�\�;�\�hF���\�\�%��V\�	�y\��?ku\r��>\�\�0K\�30e*\�cr?\�\�s^��΂e]&ױ�)Mչ�\��\�j����2\� v\n�at�fw���\n�E\�s�\�D\�\\~\�-�\�3\�:�/�:o�\���}�`=\�uY\�,n\�	\���+\�~\Z\\�\�s�\�/��)����X秫�\�܎5[�f�\0Hf�\�˟��M\�ޑ@��\�Ѐ\�x\�\��\�\�q,l�Q\�Y��\0\��՘`3\�H�\�\�\�T� ���O�k�\�\�I\�LݰJ�\�$\�Av\�\�$�f\�LE\�,DM�\�n\�\r\�\�98�tg������Y�\�\�\�\�kMr��.S�hO@\�,��F�h2u0]j+K#�ON\0�:�\�:\\s\�<U\���x�5��[�\�\��=1D��x#\��\�-\�o��\�)\�<)�tX/�8v\�#~�Q\��\�xX��\�Dc�ߧ\�\�cO-�M$�\�j�]K�35:\�\�\�@\�3\�9��^\�q�dZ�]aӭ㻧\�\��M9�{R\��\���\�\�\0\�^0l�>\'\�\�5+�~�\�\�0$7�kc^[\�d�tJ{c�hs�E�\Z~�Fуi\�\�C\nSa>\�\� K�LhO��\�\�\�Ђ~_ڱ��1�2�A[4Vh\�\�\�\�\�$Ccj�\���a&�X�y|��Q�@�	\0`\0;!f�\�wC\�k�\�&�f&G��\�\\�\�Ӥ�p\�\�<\�gP�P���Zz����Hx\�;x\�\�\"\�3�����kQ틆��lG�\�3Hn��lU\�\\:U\�2�L�(�\�LT�^ө\�\n\��߻\�\r\04_,��7��c�p(b2S\��}a�-�\�1\�\�p2\�zYj{y�yp�\�Ѐ��k�{�\�ӳ:!\�~\0\�?,�Ѱ<D&��\0\�J�S�c�\�\��G\�T\�d?h�c\�ľq�O\��˧esز��7��ˋ��ǉ-~�>\�;JQN\�<\�\Z�ij~ q@Ǭ\����\'7\�f\�.�N�\�T\r	<j�f\�\�\�\\��=�V�wư`\r\�\�\n\�\���N�^)&QS\�F�\�tV1\�t�d@>��\�!�g��f\�F�)�5\�akP00h�g���B͆�t\�]\�0���\���u�h\�og�q��)��0\�X\�)#3��q!U{�ã41pk@\�a�\��m��Յ\\WmD�\�{�pskIrg[j�ԆfOj�F4�\�=�q\rY,��\�ء\����dRV%�\�z.�\��|0ɩ\'\�3\�\�ʋM\�[���r�=���R1^\�|�ay&���\�S�[�/���\�i�\�\�܂��Ӳ\����0�\�L�\��>�a���J�F@#JѮ���\n��G\�\�|\\u\��\�I:\��\�\�>��jd��IV�d\��yE����0�n;\0�;3\�g��av�R\�6��{|�5M\�\�\�`�\�J�\�Y�)9~����p�\��	3l\�(\�P���$\�9Y �\'�\'n\�7\�=Y*0��%lXж\�:�+�*\�\�\�;�g��yؖI;�\rF<ҳ\�T�\'�&4\r=�\��\�\�ޝ4z��l\�c\�0�\�`��3h��\�~��^�\�\�T\�|�\�P2��\�\�dCCM/�\��}t3��L��\�M���\�\"\�e�;\�p2}d\��Yr-V\�o�A�\��n0��\�qa7\\\�\r\�ڋ\'��0��M�\�\\\�\�+lq͗\�\0)9[q\�1Øs\�\�t\�Ө\\�@\�r�\Zf�q�d5��0u���=\�\�-�\�\�\�0p�Ť\�\�~~�`A\���\"\�\�\�gI�^��^\0r��uK(M� �T0�8�u��Ƶ�\��j@&\'�\�\�=�+\��14�r\'��,w�ܿ+H\��\\wV\�Y��2��\�F��޶�g*&Z)�eL�Gz�|��4\�Ea\Z3/S�\0\�\�\�\�3���\� kbeEXص�\�+��\�\�9;z�\�[>��:}j<3D�\����\�J&�@oق�K5�-\�\�B�\\\��Jv4�f\�љf\�X�z٬�V\�\�\�2=\'\���\�M��z�~�A��٢�6\�Ľ,�lJ�$\�r�\�5(>\0D�p*\0�[om\\l\�L\�\�5f\����/\�\�Ѕ0�\�\�\�:\�\��\�\�Ҡ\\�hO\r\��F�Y+��4\�CXɴݠ?(o��a���n���ZWW�\�\�.*t�\��~�>\�3�\�Ze��M�i7f��d��\�w���\\�:\0��\�ʖ\\W4)�\�\0�d:\����\�~ŀ%\�_\�\�\�󴅰M4�n\09\\\�19`A\�}�{\r��\�1D�w\�!\�@fS/\�3\"\�\��7t�`.\r5���m�\�g�f<\0V�x�\�_5��p3*�y<\�n	�m\��\0ձ�c\�\�^=\'ד��~��\�r+>�,�	��%���%�\�3\�3\�ʙ]�\�C�ׇ�*\�Ǡ��W\�4Θ�3\�\\g\�\r-�>3&[�|�\�l]6̀�YL�\Z�as��~\��\���t5�9_L3��\��Y���N(��b\�,8\�|� \\�S�~\�leQ��LĠ	k\�t2z\�\�\0췳��:-1�i�bXjLr6�Y�Y477\�c\�T\�%kr:��V\�I�S�\�0\�����8(0�5�Vbg\�cY\�\�\�n\��\�\�P�i�\�\�=O\�gD������\�E�3A:p=���[r͕K9у�?i5\��}�\�\�:*<\'W�%Tu\�D=aBك�\�\�\��v��Q�\�k�\��|\�Dt<�9׿\�\��\�eSA\0�$5z\�\�`�~�W猡\�\�~\�9�#�Ig\�e	�$#\0��h�\�\�\�5b|\�\�2Y�\�h\�	�\�\�rVh{\�q��\�\�&�d?u\�:]�V\\!\�ۘ\�^�\�k\0\�bgec�k�\��g\��c\�2\\P\�-{��+n\��\�P���fK���w��A≩��_\�l��m@�+�u ���\�\0\�3<`i\Z�4G�mW�,b0�\�j5Ah!��\�`\�HGPZ�oQB�w���Aqy�Y\r���i�@�v\�\\+�7\�VA�\�ρ\�N��y]\�bŵ�]\�e�<�\� \'\�\�4~\�*c�y�\�̈\�Rs�d-kTd�T�0�Nu����vLgY�CG.;O1Б\r�J�՛ar\�\�d�\'K��⽾߰�E�ݢv\�ֳԪ\�\�\�$\�\n$�%;2\�\�{e��y�>�!Di\�L:@3d� ��S7j<�\�\ZЭ\�%hǣl8×a�\�t��Ŵfaqf�\�g���2�x�?�jA�*fV.�vR:��\�%&\�Co\�\��\�a*�}<-\0R�d��\�\����<7��+\�\�#�d�\�*\n\�VƗ\0��%c�.V\�1AsLKo�\�u�\�=V-y�\�jY5�>36h��\�\�ͷKB\'I\�3���V�DC�H�99\���L�T�0@\��S&��I\���w\0�J\�7f�5\�ޓ�,^Z��J�C>���\���w��\��\�5�{���b\�\�\�|��Hڍ{�O��՘�DЕ\�L=f\�:�긜\0\n@m���\n���\�\"\�{4a�]G�\n\Zp\�Ĉ9;\�d�:�s\�m���{gcH�@6x\\q_\�3=���q\�.\�3Y�g���\�\0þ|\�<�摡\na\�qL���c�������\��$n6�~�*�`NfD�/\��\�3\r5�\0@�py#@Z\�\�6�\�\�o\0�\�<(\�y\�T>,�����o��\��`\�[�+\�WvF̼������c�{M�w\���\�{S�\0e��L\�O7���M�[���K\�a�э)�T�p\�ؘ��5�4��ɬ�K\�}�߻\���\�mL��dۃ;����]��\�Fu�\�\�y\r�[Ȱ+�\�&\�]\�\��\�+\�9Y�����\ZKc1/ߓ\�\�la\0\�A�1\�ܟ׾\�^\rq�T�ڐq��\�2p�\��]_\�\"��-RƍztĒ�\�\�\��wR2�kZ\'L�\��R��}G<g�3�j���d���><P^$*9+\0\0\0\0IEND�B`�','image/png'),(5,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0N\�U\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0�\0\0�\0\0�\�\0\0��\0\0{�\0\0�\0\0;\�\0\0^cJe\0\0giCCPICC Profile\0\0X\�՘wPTϓ�\�mf\�%\�s\�Ar\�9#�\�A�D� Y@�*D%��DA�\"HT�H�U�����\�\�\�y�y]��\�N��\�\0nBB`\0E�Y\�ir\�;8r�\�P��x�$���h����Q�>#�#\�џ���N(=<\�\��̉\�\�\�H\�\�Ćs	�\0\0\�M\�O��!2<�\�4a\���O��\�?\�\�7��\�cm�E\�e\008!\�\0\�M��#\�ݛh�\0E\�\�\0�U\�}Ĺp%�	�\�YDp�Ov���M��6	\�������oxH\0!�_K`@\�wP.(���ox�m݃�m�C\��\�=�l��p���\��\nӵ�\�?B�?�����\�2�k\'\\\�?�������\�\�QV:�~\�\�\�\�\�<��\�|u\r��o��\�w��0:@p\0-\���\'\�6�.��\0\�]L�gt\�ω\�\n�	����\�\� ~��\"A\�b\"R��\����\\{�\�\�5э�[\��2qn��ֹ4\0\�>C�\�[��\�	\0��\�{dX\�o\�\�	�\�5M\�@H9�ԉ3m̀5p\0.��\�:��@2HgA(��\\u\�:�	\�A\���\0\�`,�U�l��\�AhQC�;\�	CR��\n\�@Ɛ%\�\0�B\�P	��NCg����\�\�\�\rC�\�shڀ>A{08���\��`\�0�\�f\r;�\�ba��X	�v\r\�끍��a˰w�8��\�\�\��pQ�\\nw�{�\�\�	�Lx1�\�\���\��\��\Z��E(#�6wD(\"��(E\�!\���\'�\�6\��G� ��JH�=\�y��,F\�\"[�\�i\�*�+\n��C�\�Q�(�*��*G5��Q��W�4\Z͈F��\�\�t:\r}}\r�\0=�^E\�bH1\�)�.\��I�c\Z0�1S�5\�\n^%3��\\�\�$�$\�$�$?��X~�\n\�\Z\�MƖ`��\�\�gRRR.RERR_\�$\�\��C�+�\�qT8!�\��\��]\�u\�\�>\��x>�:\��\��\�\���K�]2j2122�D�2�6�)��\�$\�\�\Z\�.\�\�\�\�\�\�\�7)H(�(�(	ew(f(v(�)%)\�()�((�)ש\�T|T:TT�T����^Qé����ݩOS_��^�A\��\�\��ќ��N3F�MKE+CkKM[F{�v�N\�Gg@@�Kw�\�\�=+��\'}}��7fuO�L�f�i�=FFF\�|\�v\�E&��\�I�\n��Mf\Zfefw\�L\�\�s,0!K�8�K,�,;�l�z�!�X�X7\�\�\�\�\��\�\n\�\�m�S������?`\�Aˡ��Q\�\�ϱ\�\�©\�\�Y\�9\�����ˆ+���k�˭�\�\�]\�\�˽\�\�\�c\�s���g���W�ׇ�<\� \�7>~>;�t�v�u~~�X�F����@�@��SA�����`�\��LHV\�G�Lh\\&,\'\�+\\.<)�Q	��ŉj�F�6���щ������\�w\�?�����,1/I%i(�\"\�)�IJH\�]�L\�4^ZW:Q�C������L�̬,���l�l�쁜�\\�\\�܆<����E�\Zs�,�!E���b�b�\�w%9���J�E����׏��<v�\�+.�J�ʲ*���j�\�\Z�\ZA�F\�:���z�������\�5����a���ߴ��⵺�\�\�zڙ\�c:T:6:�:K�\\�޺��\�z�zqz\��H}#�|�Vw�z�mCy\�x\�~#���Q�\�Kc!\�0\�N���\�9�S^\� \�v3`f`v\�lќ\�<\���\�\�ܢ\�⍥�\�)\�A+j�V\rV_�5�s�\�ml\"mzm\�m�m\�m�\�i\�\�-ۋ\�\�ۏ809�:t8�mkw�t���V�e�Ӝ�\�?}|؅\�%�\�\�	���\\��v�\r��3B\ra\�\��\�۶���y�w\���*��k^*^^\�\�*\�\�7|\�|�}6}�|K}?�\��U�}�7�\�`\��	t\r�D\�\�\�<\"���Z�fV�!&9���g\"W�T�ʢvOڞ�M=\Z#���{%\�\�{��T�x��\�(�-�7�;15q5I/�.�\��8E\"� \�\�i�ӝ���I��\�\�iL#KK�IWN���\�?c\�23=2��8[|v?\�=\�Q�dvI�Q�W\�X�\\nE*/(\�Y�Z~]eAl��s&\�\�\n9\n3��(\Z.�)�<�=y~�ĸ�\�υ���>�\�e�e\�Y.f\\�V\�Q>U�^\�T\�Zy�r�ʷj�Z�������\�Rԥ7�m/^Q�R_\�T{��\�j\�\�\�:˺�z�����\�FXcd\�\�5\�k׵�w4�6U7\�5��nD\�x\�\�\��\�\�\�\�[\n��n�޾\�Jݚ\��Ŵm���/w8tL\�1�\�۩\�\�zW\�\�\�.ή�{��r\�c\�\�?z�`�;�{�ǻ\�U\�\��>�����cFCu�\rj>R\�\ZV\Z��H\�Q��\�Hۨ\�h\�c\�ǭcrcm\��\����\�&\�O�M�<\�~���ӑi\�\�\�g6\�fg�g�g=fן<�85�c>i���H�X�ĲT�B�E�\��\�їV/\�_��z�:���j\���\�5���u���\rݍ��NoW߅�����E�u���\�\�?�n\�o�~�x�)\�3\�\�_d��\�\�,}\r��\�[\�.\�n\�w�\�{v{k?N\��K:����Ba�_�\0�\�`^^\0|�J\�\0��\0\0\��;7����\���kqC7`pZ�kD2���#\�\�2�R\�0x�������J�Z�Ɣ֛.�>�����\��C�y֏\�d✖\\�ܙ<\�\�|w�&g���WDVE7\�>���!��\�\�\�\�2\�q\��)*�(�*�VT\�W\�U\�\�`\�d\�bԦ\�!\�E\�\�}\�\�2xe8k4j\�c\�jZoVi^bQhyΪ�:\�&\�6\�.\�>\�\�c�S�s\�q�?�P�S\�y^%\�\�>��\�~m�w��φ��\�\�D�E\�EN\�E\�4\��\�͝\�N@&2$	$˦��\�K59c�f�n��c�s\��.Y.\�.9��y�q9\�j\�=+\�*A\\`*�(ӹ\�XTq���\�f�\�w�I��\�\�^��K��l\�j���������R��M�[�]Z\�ڼ\��:�\�vF܍ꊾ{?�ArwF\��ޫ}]���\�9I�\�\�?��O�ȟ,�:���i\�t\�ԙ�٨\�As^�.��&K:/�-ˮ��~\���g�\�\r\�\Z\�:\�\�[�w��\�-�\�\��\�[\�\�?\��T�9\�\�\�\�\�\�ߪw���\��\�\���گ;H8�>::\"�_�CED�S���\�p�%�C��B2�!\�\�\�ŷ�u�wPܥ\�\Z���yK���@�\�\�\�\�\�\�\"\�*\�f\�\�Ǒ\�y�������w�o�\\`Rp���������HtKvK�H�\��\�>�\�\�ThSlQjT�t�T�@5C-Q=B\�_\�U\�Z[WGQWX�U�`�i8g4d\�jRc�g�`j\�i\�deimh�i�`\'f\�\��\�H\�s\�q^?�\�2ybص�\�\��\�}\�\�\�\�3\�\�>�K~/��V_��\r��SE�F\�G�t��I�͉�8u=�n\�Pⓤ�䕔\�\�k�\�g6\�ަ��g#c=�\�\�լ�\�+9˹��6�w\�!\n\���\���\\.M*˻XU\�R\�[9]��~���\�\�ڰ�\�u��}\r��߮�7�5+\�0iq�\�y+\�vXkt[|{JG�����w\�u\�+�_�������w�o���!͠А��\�#���\�\�\�uc]\�\'\�\'W�6�l?�2�\�\�\�\��\�\�4_@,\"�P/\�\�\�����_��*�\�]�Xw\��~�.n�\�V\����ۗ>\�|*�\\�%k\'\�\�\�o��\�6{�?T��x�p��m��VH\�\�!�Db�U e\�!p�d�\�\������\�\�t\�ޣ\�f�d|\�t\�\�\�j�\�^\�1̹�\r\�a\�\�S\�7�<!\�#\"%\Z\'�,�.�%Y uA�J\�\�5��\�;�ڕێ\�V��z]�V�Z�T3O+];A\'L\�[\�Q\�\�@\�P܈\�o�o�\�t\�l\���E�e�U��y�l\�\�v1�An��N�\�J\�E\\\�OP�b	H7�;\�\��By�}о(?�?\"\0���BQa\�\�\���\nQz\'��	1A�1qgN\�ė$T\'\�&\�\'ץ\\9]�Zz�0-;=�����̀�\�Y\�\�9���yj�\Z�\�,\n����O,ɸp��bٕ�\�\�\�*TW=�^��~��V\�^�c}`Cbc޵\�\�-M\�\�#7��\�ޜ�5w{�u�\�i�T\���ǝ�\�v�\�\�\��{�g�w�o��\�!\� ېذ\�#\��Q\�\�\'\�N�\�LO�N]|R��\�t��\�\�\�sg\�S㖢_D/ǭ$�<��\�u\�\�\�7}k\�K\�\�\�n\"��޳\�V�h�)�s��[;\�_�\�2~W\�s��_qp��\�O��>#�)(9\0j\���\�\0-\0�n\�\'\0\�x\0�L�38�\0��7~@Ě�Pf�$�*0ǉ�|2��l\0\�`|�H!>H�X&BUP/�X�\�\�4Xl��\�\�=\�E�a�B�hFl!Ő�\�v\�!J��Z\"VW�\�&󈄇$�d	���!Ő��\�\�tq�x^|	�\�\�y<�E\"%�2���\�\n�,� �\�\�T:F����R�20\�2���r�N��a�g\�\�(\�4Ⴘ:�\�x\�x6y��B� �Q�!Oa	\�=�>ѳb6\�\�$H\�KyI�\�\�\�|����%_����\�\�|\�^\�N\�A턺�F�f�V��%�\�q�U�]C��1��������	�(\�\\�\�!�\r;�����c�S�s\��d�rW�l�{ｸ�|�}�\������X�v��GdF~;\��<\�,n(^+�7I+y��\�T\�[3�2����r��\n\�U	��h_�-/��诊�Q�txe\�jQ�g�\�uʦw7�o6\�\�i�\�8ީ\�%z���Q\�f\�\���\��p\�H�\�\��\�\�\�\'�\�3\�\�X�\�\���\��7Z\�}\�t�o;|\�\�I\�e\�k;����~��\Z�\0> \r4�9 �p�\�@+\�DIC\�P0�݄�A�0�),v6	;����\�9�>�B\Z���x��@F\"�PH�9���VE\�_c�0�M�:,	6���i�����ƿ!s%[$?N��\�e������O\�\�|�͡���a ahd4g\�e�\�l\�Xn���q�-��r\�s\�rNq\�p�`y�f�Y�3��-�*d\',\"�mKw��DH.H�IȄ\�Z\�\�ɳ( >*.+M)\�W\�WTW��F�6F�MW^\�R?\� \��Ѵ�)�������e�U��=�;4\�\�Ύ�Nw�ߺ��0q�\'\\w[� �\��:\�\�\�\�\�\�\�P�,��4\\$\"+�\�\�\�ѣ��q�\�j���/�\�O��&�~?C7�Q�Q�p�n^_�ֹ�\"�\�\�ke�\�芲*\�\�K\�\�i]n�\�5�\�\�\�\�->�\�[1m����]�\r�yz���\����F3�N�N�?���q�|�p!\��r\�\�G�?��o��;�u�\��O�_N}\����\�x\��/��\0\�vb$Q\0����D\�\���\�#z_��\"��Z�a`0{X�6ۇ�í\�\��\r;\�Q�G�!͐\�\�u\r\�f\�*�\'�.\�\"1#1#i\�b��\�qR9\�\nw��w\�O����k��R\�P�PZS.SQ\�B\Za�~ZW\�}�Rz�Y�XFv\�A�Pf6\�1�dVy\�m�k\������\\�ٹ_�T�z��\��\�\"Ao�c\�4\�[\"��Ub\�\�\��\��w�/Ȝ�%\�\�K+p*R*!����\�W�����kHi\�k�#X�\��\�8C9#7\�,b;gv`�a�e\�K\�_\�\�n\�3:;�8\�u�\�\"}\"Ե��\�\�\�\�\�Y\�\�\�\�\�\�\�\��9P=(7x%T.,7�}�uTO�L\��8\�S�	\�m\�\�)��Ng�ғ3\�3����gr=�b\nEy\�\�KZJu˖ʣ+\�\�j/î4_��\�lxs\�FS\�\r˛�a�K\��\�T\�M�\����G��g\0��\�P��\�ш1�	�)\�\'�\�\�3#\�;\�\�\�^\�$��[5[\���]\�|��\�v槐/�_�v%�8��1?�\�%-�+|@8M\0�KGG��\0@\0p�t��\�\�\�\��\�X\0�;\�����XC@�,���\�	)\0��\�Tҕ�\�\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0\0tEXtSoftware\0plasq skitch�W�\�\0\0�IDATx^\�mkG�����*a�F�8%�`�`��\�T�Q�\nQ�\�\�\��\�d<��Z�vW{\�\�ׇ��F/3�\�9���K�uh9�-\'��\�\�>��؇��\�rbZN\�C\�O̷oߢ�uh�Q��\�J�{��7�0���\����\��sRZ\�&\�;*\�\0�ç\�cF�1\��>H\�\��}�\�-B\�Rf�\�\�\�\��\'\�\�\�\�\�\�\��r���G�!\�Z\��u�X\\___^^��pF�ѫW�޽{��ۭ<\�޼\'5�\�\�\�l60[�~�\��zggg\�\�S �۷o\�\�\�0&�{�eL3hy1>}��y6�=�\�)�(k3\�+�\�w`2�|��!ҝ-�<Cr\�9��kҘ���Z�V\�\�$�����W!\�P�N��\"�n�\r~����@\�\�\�[�A4>��W���\0�ų�(h\�\�=�\�_��|�ᅕzhy1�\�o�7���>\�I5��\0\�\�{\�֧�)\�KT�\�˗/eѝ�^-\�f�y�\�ӧ�S\�w�\�\�\�ׯ�\"giB\��J\�)����_6�?\�I-$;\��uD8\�}\'K/\�Hw \�ݧ\"?\�\��\���\n\�k�D�d2\�1���W+�\�?\nѫ;��˖�\�\�,�\�nwuu\�(bh�\�:D_KS\�G\���QgCq�W/f\�O������O�S��3\�~Œ�j\�ގ�/zu�f�,f�!�\�\�_~q�_�\�Be/�\'z^�C�\�MM�fG@�lkt����sX�\�kt�K��\�ڧ�\��\ZCV�{F�X\�\�rLD\�\����Yi�c�v=L�6�\�\�\��-Gt��͕�N\�\�\�˖#�6��\�X�\�R|+\�\�X�3΋�׫$Af�(\�Y�k=�\�g\�LB՟:�]\�-/ˡ?��\��$)cF<\�dv1�\�(4\�s�{�$%�t�K��q�^�]\�ł\�QтZ=�Mɳ.��_o���,E\�y���\�\�5�E�U,\�j�1���\�-S�\�[ђ��\�\�\�a$\�e�A~�\�\�T�s��H\�\�T\�v\�r��X�s;Y.A~���i�\�\�\\�\�R�\�\Z99�\�\�X\�b�b�����\�\�Dڱ`�v��N\"G\"��~�ڵ\�#�[�|�XH\'={D�j�\�\�\�D-X~~~\�:����\re�������\��\�\�\� �\'sP��LT}��mG<<<�&֏>ˣh�~�A\�aѢ�:ם\�\�\�\n��\��\�ZY?�,OD��\�o��\�Ϻ�����\�)?��M��\�!/a\��s3>+\�rnyv��T{Ѣ\�ri谹yԶ��kk娱<-W�R\��\�6n���b\��=�\�\�\�ܚ\�j9JN={�\�T�\�\�\��錳�3��\�5��.\�����!<���Y�r�,�\�\Z]3Z+��|\�:�t\�v���Rh9��\�XdI\��b�V˹�\�0���Z\�.\�\�m�[I\���5p\"f9\�-?��A\�����\�բ\��p=�\����,\�/�\�\�%2Z\���\�\�\'�ɳG�?H[�MJ\��&�~p�\��<j|u(�}�N \�,?\r�Z\�\�\�w�N\����\�\�1\�\�?F]\'�n�N\�Oϗ��kq\�\�\\\��\���ˈ\��H��y\�\�4�j\�X-f�ώ���|\�\�QY����\rێ�Yx\r�i���h\��\���O�e���\��Pl9:�u\����\�}�\��\�]W�n�1����4\�\'X5�����lI\�(ʁ\�,\�n�~�����}�V֏J\�\�\\�L&\�%�]P\r�&~z-�Ftg9`\�\�?}�\�X?\�-/�u!\�0��\���\r4\�>�P�<r\r��\ri��\\1��,�www�sHK�>(D}\�0���,m!���r\�\�\���өt94���,d9\�/\�6&�\�\���ɵ/ z�XxU+\��!�;�\�\�\�s�\�x��+6\�܈\�\���\�16\�\�d9\���c�Hx}}.Բ.(��c��\�];�U�5\����O\�c\�@\n��@�\�ݚ\�qތ�49+���&�T\�\�-\�u����f9�[�\�\�\\T�A\��v��FL\�\�r`\�r���T\�#�|�#�Γx��:;J^��,�v4�ITTw�\�l�����X�\�l\�:�\�o�ifѰ�����^`QZ\�䩕�Y\�]_�Vҩ�B�gB\�Z\�r��Z�DX�X|���\�cs%\��\�a��\\��\\�ޒa�o6\�:V�=\�:\�uof�\�\��\0��\�gM\�[\�W޿\�:93��\n\�Z&�NOF���N\���v:m�!\n�T,RqJ���2&\�\� Y��\�ϟ?g��>�Lr�U�\�,\�\�\�^����\'��\�*9��\� ���o�\��#S\��o��&\�\0f#ᩬ\�\�\�r\�\�\�\�\�\� \�?~�\�-\�dW?$;\�\�>޻\'��U�\�aŰ���\�]�\��X�\�N��/��w\"\�V�|+D���\�\�ќs�Z�cWI���\�\�\�e-w`dE�\"f{�B���\'?~t�<J�����\����?A�\"��Z\�pY�A\��\'\��\�̧3\\���\�h�\���?�r$��	��\�\�[\�BP��{�\�}�Z�\��Nc\��To�\���s���^87|d�<��Oԇ�0�ϣM-�;Z�9\�\�7�չ�\\.3?�R-/@調�%��g�6�\�e\�\�yg-/\�իWN=p?�Z^��eL!��R-/F\�\��,��\n�<F\�иϏ�,A�\�Z^�ƫ�>}�\�\�=y\n-�\�?���K�\�-�m\��A\�Kq\�\�O�Aˋ�.\��\�K\�ũg-�I�\�=��Mhy�wݹ�y\�$��;Ҋֹ�\�W\�}�Z^�\�G9߻�\ZZ^\�\�-A\�cdub�X8w��ۯxև��\�\�\�&��{�\�)��\'2şNmD\�\n�S\�<�\�L�S�L\�\rA�\r\�I-�\�~�\�0Ι\�B��Wt�\�\��E\'\�C0˿\�O}h\\ZI)\\l\��d-��\�Ӷe\�\�9�\\\�\��\�\0\��Fz\�\Z�s|�h�E\�3љ\�\�ŝ ���\�-���ǅ�g�ZF\Zw(�\�4y�V����?\�0\�s\�r\�\�j�\�(�<#v��\�;8\�\�J44]^^><<�O�v,\�@�\�e�%�}�\\F��y�y1pI#HC�\�\��LzSY^��P��}\�S\�L&��n�\�x~\rTc���\�n\�J栘��<u]���1k��`�V�#~\�Z�\�(�\�\�\�0Ņ���n˳\�/_������p���\�e \�\�\�\�Q�\��\�~S�K��\� w���k\�)5?&Z\�fRw#��p\�l6�\�,�\�\�L$�I�qm���T̨�|�ZaN�wY\�K7{�����zo�UѶ\�\�:Nf��\�v$\�۷o\�\�\�\��꣝uG}�#�\�\r�gy\�Fu�\�n���<�P��	K�<���7~��\'��~+`b$�9yV\Z�%�\�\�www�\r\�a\�\�\�ja�cʏ�~���k\�pM�k|�\�AY��pG\�H�\���\�>�\�[�T|h���2&�^�z�o°*Q3ˊ\�\�\\!\'g����\��>A�\�73[#t}(\�;�@n\�w�\�\��SQ?t\�G�\�u\�\�:\�d�������kb��^�\\\�R?e�\�v����ܮf\�	~��\\�\�\�\���\�\'�|�Z�\�!\�A��\�n?e\�	,Kp�\����=�޹\�\��X,X�\�00�Ϻ�?\�\�\�3�L\n\�\�=U,\�5�\�K�\��\�\�߿w~tL\�crmdR\�|�}]\�\�p����Z��p�Q\�\�˗\�\�oR\��\�\�<\�t\�~��B<�R\0-\'e�Ѧ��X0�vo�\�NRf����mڴ\�:e\'f��\�!�=|\�j\�Q�ގ\�J�[���m�܌p:P\����\�\�\�mf9\�\\�8!!\�âv�˥PIS<��\n�O��e�/T�\�1���ҥ-\��<]\�ܛ\�4^}��\�yv\�ї�-O_�\�\ZMB%\�u�\�<;���Ot^\�C\�%�^\�Lk\�਺|�\\�7BH��ߊiFs\�7�~阜�0\�\�q\�\�\���\�q�f���g\��h4j�\�\�\�r\�o޼�\�&�S\�D���t\nH\�W��{\�dX!�S�\�U�\�j\�Z�����ca\r\�\��W]�,�6�\�\�Gj	i�0La�\\�R!�aY���Lѫ�G�tIh�\�,O���\�T�\�8�J��\�,\�\�!9!^�CWK-�\� �~�;�e�\�i�ȴ�:цY���T��0E\'�s\�)�����z�6�� k�o�Xj9�A8�],��d�\�!��U��u9�� CC��0�\�\��W,\0�Y�Ą\�yZ��\�r�r�9&ѱ�����.B�����+\�h%�,\�f&�\�\�9Z\�~\�Q��\n,u\���\�r\�d\�\�9q�\��o߾�(g���\��(߼y\�d-�\�r�������\�Xܓ2T��Ć+����\�*\��\��Z\�\�y|���k\�<{,�\�f\�\�D2@�ө\�ڰb\�\�В\��>-{,�]O�$�a\�\�t��Pj��$\�S24�\��2Ъ,\��>��\�Ze�z�v\�AȀA��V+gmU�s�h�z1��.���q\�AȰ�\�eˈ�*\�y�,\�\�z1�\��ׯ_�\� d��x�\�M��\��\0��b	Pt\0\0\0\0IEND�B`�','image/png'),(6,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0x\0\0\0u��o\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0\�\�IDATx^\����\\g�\���\�\�\�\�*�,�\�\�\�\�\�p�\�eff�WW\�\�,Yd,ٖ%ٲ\�lK[���x�yS��\�\��n\�\�F\�w�\�7N\�I\���\�KϞ\�ǳ�?ⷧ?�s�ك3~{��\�)\�3�\����=�s<�\�)�r<|�?��\r���*\�޹�Oo�㸄Oo]\�\��p����q\�0n\\ދ.\�\��{p�\�!\\;W/\�\�\��p\�\�6\\>��\�låS�86\���p\��:\\<�班\�ǹË8{p\Zo�\�ۇ�p��O�����صe��C\�����R{3��5\�W\� �Ȍ$�\�\"#\��uH\�S#*W��,	\"\�\��X���,�F\�#\"*�\�\�	\�KG`D2|\"\�\��\�8���/0\r~A���\���\' (2Aq��\�ArJ23���[��\�d\�!\'+�\�\�\�\�Fvr62����Z���l$\'$\")>\�Qq��JDth�\��U~~�Z�����O\0|��b�7�,[�ז��\�\�\\��\�X�?��\n��i9��\�K9�q,ǿ���c���R\�\�o��\�Wy! 2\�ىH,HClj\n\"��q	)�\n\�w��A��\�X��#$$\�QA��C&�yY1Z;\��\��G�\�?Y\�\�o��\����Ql�h\�Kϟ>\��g/��q�o\��o\0���x\�#<\�=�\��p�\"���,���6��\�\�~t�\�8�O�\�ͫGp\��>\�zwn��^܇.\�ōw�\���\��\��ms�\�No\��3[�ޙM�zz��X\�{�\�����l=�����3�zd��\�\�	�98�{\'��y�s�\�\��\�݉�)#�eVdI�\�*�!�P�8\���Db�\�\�E\�HQ\"-S���L\�$ &%1�9��\�DHt\"\�\�9\rKC\0��N�wH\"������\�TD��I\�|<!˖�$��\"T\�r�KP�J����*WBY\"���ҼB\��d�斢85�)�\�O\�Bjb4����\Z\�\�N�oX$�}\"@��\�\�	//o�Z�˖�\��-\�˯��?�W^~�\��\�k�\�~\r/�\��˟�\�\�?/�\��\�\�\�J�&F\"� �c��\�\�\n\�>���\rB�<:�a\���ATP\"\"����\�\�@*-FwK�?�\�\0����\�\�:�\r\�\rx\�\�SB�o�ܑ7z.�\�����\���\�!\�#@}L\0\�/>\��_\\·�\�\�˛7N\��\�ã�}\�n_م��\�\�GT��\�\�\�\r��T\�[y�0~�\�|xa7>8�	\�ۄ\�6r�� n$��x��n�X�k�\�\�S�\�\�.�\Zť\�Ӹpt\��\�aρ\�X�u=C\�T5�\�P�<��\�Jd�i���ER���%:\�\�QP�A�L�\�2)2r�\\�\n$�)��\\B8s��\�\"�\n��H*aDD\"Bb\���h�\�\�\\$�\�\"-�9\�y(.(�TB��\n\n�tr\�uj8u:��JX5:\�4fX*�dj\�ʋ�*,��@Ya	Js������\�D$\�\'!1����\� D�E#.,aQ����r,_@U��민E�ۛ��W��\�U�-\�\�W�u^^�^���\0����H>��_���\�?\�\�A�*%0;u��O@xp,_7\�Q)�O�CVf*J\n�P.+GS��?�+W7��=}�Oo\�\�\�Z�D�\"�����B\��~�#p��x���6��~}x?{?\�9�\�n�\�W7�\�.\��\��#�\��*\�>\�&��\\=��9���|rin_ڍ\��\�G\�l�:n\�G�ࣳkq�\�z\�8��\�\�\�:\\;�\ZǇ\'����9\\;3�+���\��>���6cbq#\�Gaiꄦ�\�\�\Z\�\�ȕ\�S�CA�j=d\Z=�L;�V;�r=J\n˩^j\�ˑ��DFj!R�	X&m5\r��H�\�Ft��ODL|2m�����2HʥЪ\�0\�΀z�\r��\nԹ\�h�;P\�0�\�©Y�\Z�UZ*�\Z\r�J=\�R	��q%YY\�\�L@QF\"�\�S������d��X*P\"!ELX9��\�\�oy\�\�W�\�W�\�ϯ�¿��\�\��\�-�\�\�oЂi\�^J{~~s	^]�K�}\�K\�V��ת@���Vy@�.��BN\�b\Z����\�s�K%��9\�\�\�ςD��\�\�:Z�\�)\�\�ٳ�x�\�W|rk6�9�\�_!��c<��M?��?~�1\��|	\�~���W\�W×��\��\�΍]�\�ݞ˟|p�p\�ç\�\�\�]\��\�λ��j��j���nǝK9\�Ӳ���7\��ŵ�}nn�_M	\�>|{�\n�O\\�\�]1��mS�pQmU\�W4CniE���2a#t\�*\'*ݵ��jDeu=\�N�\�j�\�V��z\���\\�\�\�RH�KP^�@^����\"�y1!1)i\�\�\�(#�*�\'�\�\�\�$Pn��v�]VtVנ����5\�r�\�\��&w%\Z+�h�Т\�fA�M�Z�5��R�s�)b+\�]�\r	m�4\'�YQ(J\'q�H��52��$\��XB_~��Q���\Z�{\���2��ڛ�G�f|�*�\��ex\�u��\�����y\�>\�B\�\�\��N\�\�Cʅ+�\��!̨�HIOBNF2\n��!/)Dk[-�\�\�(�ޯ��\�~lw�\��\�\�\�x��e\���4~�\���{_\�\��� ~t��x�\�� >�����_\�\��#N?ڋ�n\�\�t3\�|�\�|��.f\�\����N|q}>o\�^ۉO�o�zn!�k�	����|ti-�\�\ZZ�NY��\�7ab�V\�OΣ��\�\�N*[`t5�આ\�݌\��N4�u������\�\�\�EW{\�[{QW׀��J8.�l�p3R)W�8���P�\n��_��)!\�B�������9Q\�p��ʆ�\��RF\�;0\�ь�\�\Z�6�\�\�\�Fg��5\�v�S;\�\�&�8\�3�Qk\��N\�R�\��)+��8��$h\n3�\�L�<9\ZىQ�\�HD\�6}|�ly�$���0\�	\���_	��x}a\\A�^�7�-c�AXD F|��\�\�\�\�	\��pĦ\� !9�\�\�Ņ/əi\�\�(A~\�GY\�\���^��\�r{GX�X��7�=}�\'��Ó�7�\�s�\�˓��3����\�\�\���\�a|y\�\0�<��y��\�q��]��\�|\�~|��)n\�\�\�{�\�\�{���\�\�{xy/����\0o#�\���\r��\�\��\�M�{u\�\\YK\�^K�\�\�\�00?��\�I���\�\�[]\\\rmhj\�@wG\'�1>9���\�\�\�bfzc#�\�\�\�COW7\�Ӆ��&�45���\n��\n���6\�I�\�5ձ�L�B�\���5�׆J\�P���&���a��\rݭ�jk\�Ha�Z6\�`�j\�\�\�\��u��w���P�,huQO�v\�dp\�iͪb�e�ʲa)τF�=\�Q����\�8dą#�\�5\�ϟ�8��\�\�_�\�k�P\r_YA5�\�������׼_d\�WW@_��\�A�*�\�ɡ1) )\�CIy!b�Y|B��\�\��\�iɉ\�JLBFz*r�\�Pʬ*�e���%\�__�I��\'� {{\�\�g�\�al�t�\���\�/x�\�c<��\���4!<�_�8F9\�\���\����w�P\�O�5���\�\�w�\�;�\�{8/\�w��q�w	)\���	\�\�ލ\�o\�$�\��\�\�\���Ý����\r��\�\"\�fAY�c\�\�,b`qu]��mDu[/�G\�0��\Z�׮���X��\�\�E�^���5SX��\�\�\�8�\�	\���{�\�\�Ն\�\�Bي��4\�ա\�\�\0��\n�\�AH�qT�zt\��m��]}�\�\�\�T7�z;1\�ݍɞ6��\�a����؆B:\�܀��ZѢfO-ձƁ\�J�\�̑�f%�ԥp�\�XdJh\��Py����E 7>IQ�C��`,[J�ޢ\�\�W^�b3^�?����-�\��.VǼ�W^[\�&�\n^K\�\���\�p�0\�m4RY|\�S������P$\'�\"->\�)\�\�LIa\�HAi���h\�ah�Ϟ�\�\�Sfy�ٳ��g\�\�����?}�\r߿L/\�\�wo\�\�o\�\���N\�/�\�\�/�\��g\'8x��\��\���~��8m�j\�����\��\��\���\��\��\��|?݇��؇_>\�\�˄�ǭ}�\�\���6|�\�f\�M8w~6oۈ�\�[\�82�\��q�ں\�>0�m۷cߡc\�sh7v\�ن=\�7b��M\�\�\�;�o\�\�-�y\�Z���\�\�T?\�gF�85�ɉ	L�b��͍�\�j\�eZkj9�	^zZ1\�܊ѮL��>Lb��\�38��\�~\�\�I�\�dw&�m�F����*6UBz\�\�%w8\�h��\�X\�K�5KP�/�K��\ni:l\�\�\�f\'�81Y\�l��!�eyX�қ�x)^g!y�5�\�W�$V\�0�B��kx�/�o���`�ry!\"\�\���Ɉ,	��.-9,@\�\�\�c)*\�M�JW��*;\�[�\�\�?�\r>�>�s�g����\�l\�\���|\���;<~t\r\�]\�\�\�\�\�3x���\"\��\�A;�_�>\�\�\'=\���\�\�\�\�¯��˗bz\�3~�\�|u�<��_Ľ�9��~��\0S?�\"~F	\��h\�n\�\�s����cl\Zm\�h\����s�kp\��I\\�ro_8�ӧ�\�\�ɽ8y� N?���w\�Ў-سi=v�[�T\���XOk^=7���1uӾ[\�\�ނ!�ao}�k�P{;�;{0\�ݏ\��a\���!\�\r�b�\�͏\rbnt���1;�\�ۃٞ޿#��k�\�dC&�\�	q5��\�\���+\�^aD�S�f�\rV	�\�:	*��p��AW�Iz\Z\n\�\�Bb=n%|�\�xm\�2���O!y�\�\���M\�\�\��\�\�TC\��/�~K��\�\���FXx \"C�w�\r\�3�\�k\�T�D�\�\�f�|�B/gQ�*	�#C\�x��t�Bf�go\��\0�E�>��Y�&>x�\'?�Ǔ\�\�&���\�\�Ṡ�	�g���8=�ߜ�bro�\�a\���\0~}�P�B�\�ü~��9���	\�=�\�ϟ\�\�/��Owwўw㛛;p��>̭]���yԏ��A�Z۱c\�|��-|�\�M���\\z\�m�{\�,Ο?B�\����8@5ܷy#��_�m��en�\n8�\��QL�b�\n8N+�\�\�\�uc���c\0Se�\��\ra��s5_wntk�0?:\�y�#��C\�\���.L�ua�?\�Մ�\�:L�\�272Ҋ�j\�\�]\�LXmF�K��\n\rv\�\�1\�ZS�\nfAcQ\Z\�9\�(H�B:˂ȁ\�+��\���ڛ�x�*�*�\�Ϝ�\�\�K�\�\�X\��*��+�\�7B�Ʋ\0�� 4\�\�!��d�LHD\�h6완\�$Gz6�o^\n\n�U\�a6)\�4��}c\��\���(\����\�\�ݏO`�\�F����o���-<~p\r�\�]�\�{\���\��H5��/���?p��\'=��p�~:\�)�\�\��0򶯏\���P\�o�{���\�\�TLBH0\�}��s\'m� my\'���W\�o�&\�\�\�\��h���M,�Ξç_}�O\�\��G]\�{\�\���wO㝳\'q\�\�A;��wo\��-�صn[�\�1�\',�\�\�\��u�0M�t�X�\�v\�8L\�\�\�\�`/F�n|\�|nal\0#qkh\�#X�2.\�\�N\�Ӣg�:0\�ׂ*꘰\�V�+0Ė\�WeA/[r{��v�e9��\�JM\�3H\�R�\"Ƀ\"?ElŹ11	��wV��\�́���\�3��\����I���%�\�u�	ϋ\0�\"8<��(���$�.�a\��u�\�\�\�ɗAZT��&�\Z6tK�\Z�J+Z�\���\'xSBт\�\�\�\�0a\�K\���~��S����\�\�\���ޗ���W��/�ӽox�k\�{�\r\���=\�>\�?��>��b<~�{�x�?~�+\�c<�\��\�\�#<b�{��!>�}��n\�\�\�s\\\��{\���3\�\�\��s����x\�\"!��ǿ~�G�^\�\�_�\��O���(Ѫ\����{\���\0s?\�\��(\�̄�iǿ~�>ݍ�>َ�n\�\�]p�X=K]��HW�]\�W\�}��_\�ƭ\�\�p���\�)\\8so=����\�\�\�8�m{\�\�`\�\�,\�Nc~�Ӵ\�1�\��0��\�g�;1\�˂1\�K{%T�n�g�\�\�13������q���\Z��`��F�ߺ��%̋r��\�\r2���\�c��	\�\�,(,%,!��U\�\�q\�]i\"�F�\�V\�d��\�\\�*m)\�l\�K�\�Q@\0c��\��eAX�\��/[�W�z\�ϯ/\��\��?\�\�?�\�\�M|\rzk^�z��\"<$\0QQQH��B[uJr\n\�\�c��l(*)�F�!xz\�*�L,aV\�\rvЂE|�����a^\\��;�	\�l^�\�\�\���\�M��+ǽ[\�C�\'\�\rBx\�q����\�-�t�3��P����\�\�\�[�u�>��0���O\�\�!_\�\�3�\�\��\�\�/�\����\�E\���,n\�z|t�\��}p\�\�?�k7\���\�y�\�\�\���\�qܼs_��	��\�.�  7?�����чGqッ��\�}�\��=�\��~Nw\�\�\r^�hn\�<�;|�Oo\�\��`�r�&3\�wvb-\�D\�\�j�`�\�\�\�\�j|����\�\��\�\������]�\�\'p\�\�A����:�\�YFm^��k����hr\0��d3EX\�\�\�(-u3j�g�x?ֳ1�\�\�\�Yl��Ɔ�l\�\�\�3X7\����`�\���kF��0L�\�\� m��p���\�\��\�\�\�<X\�\�\�:�*0PmEO�\r\�}�#UP�&�5UF	qI\���\�K�AFH$�h�bk\��~X�t%\�X\�C;^�W^y��y\�%�����̉\�\�\�ヨ�\0$\�#-6Y�\�HΕ`f\�$���u�n\��J�J�\�@\���\�\�j*`A�\�?\0�B�\�G�M\��g�\�o�(�F*\�_벸��i��~��\�z��/�����\���ɏTN��\�\�_�\�Ͽ\�\�Ry��?\��w\���1�!t\��p�����\��)�)���u\�U\�4n޾��o_\�\���\���p��}x\��\\}w\�}w.�ߊ�g7\����8��z�}r\r\�\�n@\��j�\�>T�\�\�6l\��\\Ƿ\�\�\�ן\�&�W���gp�\��\�=T��8�c=oY��kf���n��\�&�\�\Z\�\�jf��q\�\�lp��\�5:��N(\�\�$\�o�c������q/�g��\�\r�`-x�*9O%\\\0sތ�\�nfȉn�\��z�6Uc�\�\�6\\�~�\�>Z�\0G�˂n�\Z]N�-24\�\�̂%pk\���Bh�3P�����8��Ms,#\�V2\��\�7XH\�+���]�\��\��Wώo\��\�^\�\n_D� 1.\n��\�JKB^a)\�\�]�#\�w���E\�(�ɨ �Zt2\�\�\Z8\�68��\�n\�\�߿c�Æ+�=d�{�\�YB��y[\�*\�\�\��\0�wx\�<��\���\�6�\�|\�\��{ψ����\�x?ώ��b��x���?��\�7ޏ�y*\�Ì*l�)��\��G��Ǆ�?��G�~����{_\��/\"V\�\�>\�\�ϯa㾽h�A]\�4jz�\�l�͏\�×�\�\�\�^í�\�\�\�٣8t7N�\�\�\�\�\�\�5ط�\�;?\�\�6��c�Kd��~؍�\�XKWPըf�i�\�X8ֱm��\�m��\�~7\�%$��T�9>n�*J+�.�aaD��hăl\�]����7b�mx��\�\�@�\�`���NV\�1\�<\�\�3�يYHleh�HP\�2\�\�J`�eBU����TĄ\��\�/�\0�\��́KV\�\�o�\�k���\�\�Y/�g�ʫK�撷�\�/\0aAHL�Evb��Yj\�˰\�\�N\\��.&\�g`0i�җCȧ\�\���\���l\�2�w����?\�O\�@1\�f8\nU�O����\�\���\�x\��#?��gYB��a`\nU�T�\�ۨ�\�����՝\��\�\�x\����\�\\��T�=\�&�cnۦ��`�XO�\\;ڋ�#,BY>h5�8\�P�a�(mzbi��=c[�\�uz�6L�&f�#\'YH\�<qqh�y�wc5��ȁ�,#=}�\�oe�i��\�t\�F\�\�\�B\r\�\�`\�\�w\�\�Q�AW��v+T�A��6�\�m�\�.σ�0�IH��\n��c\�*o,[\�F\�2�\�?����l�,$o�E5\\�7^[�W�����/�#B���\�\�8\�\�\�h¹O\�Ï\�psk�����\rE\�j�0kհj�9��u;0B\'x��}�꽰\�? @2�ݹ}����>�b�Hu\�{\�m��߉\�\��\�:�y\�fܸy��1�\�{�\�2\�\�}8�\�o#���Ʈ�il�Ė�!l\"�\�	֚\���~\�R�\���<\��\�0˱H%\�H�\�01�-S\�<Aۥ�m��\�t�K�����e!Y3&�|�03+Q\r=\�	�`7al\�,[�lw&;ź�\Z7Ua��ᾖ\�՘\�_kc�@�ۆ.�.ZfZ�\Zu�S�*�ŰIJ!a�O�GD`V��\�P��\���\�M�V\�7}9}���d^\��\�l���I\0���\�9ِ�K���ƍ�_\�\�\��@g\�XT\���tZX\r��Z��f\�U�\�?\�M�\�\�����X\rs�y}\�$3\�u\0Şٿ��~	\�\�l\�EM[7�\�\�\�Bswn]\�\']\�{\�\�O�\�\�[qd\�\Z\�_$�cؾz\�\�\'�ev����\�B���eas\�j~ѫ\�Zײ\r�����!�S\�46C঱�\�	\�43�-XC\0\��E�#��m�=@d�Y=\�\�\�\�\�BgΚ\�h\�d[s`F\ZYF؆�,\"vtV\�\�]E]�\�ҡɥG��âD�Y�b9�\�\\(\ns�����\�(\��`,]\�C�׽=;(�L_����*\��+\��&!V���T(J2��\�\�V\�ƭ�_\�\�?cq\�jM\rJ=s��yP�U��\�H�ߋm�Ϩx]\r#,�9#ӧ�`\�43\�}~\�f�\'�_�\�\�\"jis�\�رg>�~So��^�xO\��\�;pd\�F\�\���a\n�\�\�`\'a\�>O�f���\rc\�$q��pd�002������c+3��\�m3kh\�s�w�`N{@\�8J���\�i�\�\���	N\�\�a\�f\�2� ��Ђg;	`K5�\�:\'\�0\��\�K\0�	`o�}T��\n;\�\Z4ThQgעQ��W[�H\�h�\�iÙ�����o\0\�o.��B���exM�\�>��\�o�!���U~H��Eqq6�ey\�I\�a�k\�\�?\��\�\�\�u0�	�Q�^�A\r��\0\�4�t[��Mx����x�\r@QB�z�ֺd�y\�/\�\�ݏ��k\'j{�Q\�܊];�\�����q�>�rW\��X�C\�hÛpx�zپ�7.b\�&B��0���%SE��d�\r\�41F��X\�\�\�f\�\��ޖ\�\�\�\"�\�\��\�6���M��\��yiכ\�*\Z�8>\�z�1G�0؃�\�f\�t6`���E�\Zc�\�>Z�`��\nh�\�\�[Y�n�\�v*��\�\�Т\�f@�S�Z�\Z.u,��9���A`H8V�c�2�m��\�%x��Ob��\�\�\�\�|f@\�tJ|JK��JJa,/EuG;�x�>��ua�\��zfa�:,TD�M�J���T@a��v5\�SB��\�{���~���_�3\��\�C4mі?�\�\�lމ��nT74b\�\�M�v�4\�Y|�\�I\\;w\�:��v\�\�#;q\��v�ٻ\rGwo\�\�]l\�[Wc\�\�\�]3�\�l\�;gǩn�\�1l�%��c\�Dk\�H7��n��\�cj5��`QHx\�F+K\�\�i^�����h޾i|��\�\�^Zr;\��\Z1\�Q�\�?6\�\r5�\�~-�\�u�M�ϊ�J�h�m\Z	_�\�>\�QC5l �jL��\�!))	�A����V��\�\��x]\�M���:a|\�\�c\�o,���\�\�L���:y̓U\���\�}~���v\r\�̜F#��*\�Fl3�a�\�\�t\�\�\�B\0\��;\0��LH�}�0�B�_����\�\\b?�\��?�\�\�^8\�s�z\\y��\�	\\9\�\�y�\��\'\�\��8|/\�ہ3�w\�\�^6\�\�،\�\�<���Ş�s̈3TD��Ql��m`��ma\�\�1C\\X `TM�-�q�4�	ǎٵ�\�>;�\�s�?Ed6\�2%TU�\�\�\�`-�]5�\�&���\�\�\�NB\'����\�\�aF�M�VBP\��\�F��\�sZ\�,\�\�\�`�@^���\�X����\�\'�\nF��	��\�J�a_ϖ�\�\�XJk^�� egCWZF�͆AU�\��|�\�3\�,�\��\��Yá��jh�Z`1\�\�d\�\�n\"p\��\\y�X�+�?�\�\�}\��	2�X�(>���لO��k--ضu޽p\�;�s\'\��\�x�\�n\\<u\�>�+o\�\��\�C8wd7N\�ێ;	\�u8��j�n�VS�\�:B��-�\�T8BD��\�S%\�\�jB�\�g\�4���d��\Z\�_�s3\�\�L��M{\�o\�4a\��lb1Y\��(6\�u���4`��\r�譫DW���U�\�nF�À;��^�E\�Aۥ\n\�q\�2�U��V��W��Дg\"/-\�!��\rb\��YF���+�����\�R,[�аx�d���90ʋaѪ\�h\nx�P=��\�\�`�\�9T@=�:5�jBh6�\�b.\�d���\0�����v�P7\�Z�9\0\�)?~�\�n_G���\'L�۸\Z\�\�\�\��\�\�Ź��p�\�\�=wW\�\�3�\0��q�{� \�؃3��\��\�\�\�[��q=\�p\�vіw-P	\��*\�\�\�X=�]�\�{�j77Oś�m/�l_$��W��yl���M��̊Mü\�\�X���i���֠����6��\�\�\�\���e��9�\�H\�\����VXo֢\�Z7�X5�\�ł`P��(\'�!��\�\�,_\�K�e�X��-Y�\�\��\���li \�Cb KK��$\rJ9,:*[W�y\�B�\�\�n\�\n�\�\n�\�\�\"�A���\�ag�tR���ۨt\��;\0�yr\�=|��1���W\0\�N�>��ց18k\�0�0�\�\�vS��\�\������P��q\�mB\�\�W\�>��T�w�S�\�\�\�{pb�&-y3K\�\�\r8�n�g;�\�\�y\�_����\�\�ͱs�p.�\�\�7K(g8���S�GX�2nd\�\"��9�cK^�\�@\�z:1\�֊��t\�Ԣ��\Z�5U�W\\z\ZB��¬`;U\�P�S�mҡ\�`F�Q�\Zт�T\�\�p[\�pP	U��\�NJEhH40�\0�\�ҥ�h�b۰-�-_2\�\����uF5j\\j\��w\�\�\'��{}�\r[��nq�`P¬)�U��\�f�Q@h7�������Ū�ȁB�b\�\�#\�4�O��8\�Yl�\�\�\�\�}�\�\�0\�\�c����᝸pb?.P\�.�?���/\�e^�|��\'^8y���\�ً3w\�\�ލ8�im\�\�B��=kf�oq\r��^K%�­\�ԣ~B�sq=vіw6a�ۘ\r�D�7N�\�\�X\�\�<7��\�q\��\r`��\�M,\�pZ+\�a3���l,z(�FH�%(\�+A1���`\�Ű�%�Ԩ�xJT�U�b>s[	���L�UI\�LCLT��i�\�i��\�eo���^X��\���-\�\�-��UF�%:tPq���/lt��M03���FZ�A��ި�\�i����gpг;�\�\��b5�x�\��O~��\nx�y��`S��\�Oۥ�\��\�_�\�\�Aت�10؏ㇶ���\��_9���a)9��\�!t�q\�\�^�<$�\�^�\�O�ݽ�ed+nX\�n���l\�v�3�P>��g��8ֻw\�\Z�\�\�Q9Q2D\�e9���\�1���\�\�b�קF�0\�?�ΆN8Lu���Y$\�\� g\�\"5��)%�O\�E|bc���(*Urb6�ӊP��UY	U�.\rad��hPi#�6\�TAE~6�\�\�\�\��+C�\�\�`��,K�b�_\��\�!\�H�K\�\�(g�)������U����\��	�b�T}+۷�֬\�Qӂu:9�V	\�N�\��}��7\0q\\�X�\'ԏ�˩���-QB��\0|1\�a\�\�?zu�m\�\�\�}[��\�G\�/\�\�\�Wq�\�E\\}�m�?q�\�\�±]\�p`�&ض�\�.Y��\�a\�Y\�X�f���\�\�n\�\�\�Z=\�ъy�y�Ȧ+VF\��\�b\��3\�\�!\�\��4V\�`zh#=\�ho\�\�\\��|�\n��ȰEe!,*�� >!i�\n�∁oP��b\�\�� �HD�\�!)&y\�\�I�\�P\�3�Y�\�\\�Q=�\�I\�F�^�K#��`��\nD�0�c�\��IP\�\�Q)���\�\�(3�I�G_s�|r��=Ě\rkac�6jʡՖC����mv�YB{��ܳ\ZF\�/VH�u��/�\�\�_p���\�0\��\�P�\'Ɨ��\�(��w�\���\�-�+\��Wp\��)?q{�x;�n\�浫����\�@6�����ds�z����\�X\�,\'Z\�\�,ۮXQ-�\���ݎ	\�=�Mc|�\�i�#|�\�\�\�hO?���Q\�h��Ĉ�x\�\Z�Рd&\�?$~q\nJB`p��E@`\Z\��2\�@��c\�\�K5�b�`����@�_,\"£���mq\�\Z\�)\�XA\���\�C^N.�°r3\�r,_\�i\�ɑ\�\�2c\�\�dT�AR��bZ\�V��,諪Ņ����_1\�|k7��\�j�aK6����8,̨N;�{v\���\0��N�y�\'�\���۸�\�6\�\�/hG�߹p�\\\��}�z\�fL�^\�m`x=�C\�\�DWk�\�`���6�tuc��C#�\�tc\�\�63\�m�����Tl\�\�-S\�~7b\�\�j��\�.�c��MS�F:�\�Q\���\Z�H�LB|x:BB�\Z(F�\�	_,�\�\�����|d&!\'M���d�\�O\�Azr���\���E .*	E0H�PM�t�HT�⢐�$\'�\n�\�\�be�2f����$\'N9s�J��M��K\nP�0�CgE�Æ]w\���\�5B�P\�0���&-��\�\�\"bwk18\�@\�XX<�����(��r��?��u<\�w��)\r\�8\��\�\�Sظu+:�FQ\�<�\�\�.��J��.\\��\�\\(-6��\�\0�T\�)5�\Z�V5���@�uc�����\���J���m��Ɖ\�rk\'g1?2��>*_\� �[�\�V\������K����\�d�$Ąd!64	\�\�xY)�(\�*��j��\�a��`�\�`*S{N`�+.��DiQ�s���]���$�\�\'\"7-\�B\�\�p\�\�T\�\�T2Hs\�&\��\�l��>A\�H��Q\"���U\�R4�h��\�Y��f�]�\Z���X�v\�>�3�\�`��XD4�0[\ZMf��zT\�9������a�0�\"ڳ\�\���\�:��O��:��9u�]�\r\�ĉ=X�y:G�u6@i��\�\\��	\��I\�HLW 21�H`6\�ʐ���yGeF�ю�J7��\�0\�%�\r\�ځ1\�;�[f����X˜�04�\�\�L��c��-�8\�N£Fyzr�򑑘FE+@nb\n\�sP��y1��\\�\\�\n��C\�ba�B\�\�Vs��\�˩��H%0�+؆5��f�$?\�i���W�V�j�.e1\�%������h\�^�\re�ΆUV�Ji9\Zj\�镨\������ψ�\�\Z\�+�89\��\�\�\�]+,l\�Z��\0\�n5�n��\�i\�=�\���\�\'�P� \�s�S\�/���l�_qX\��nC�ſ�ɇ�\Zƞ}\�\�\�\�i���\�J+�W �K{2U)�M3&�����\�@PX*\�C�����\\SideX449ĩ5Z1\�х�\�nLwТ\�G0\�.����⍰\�V��\�Q�F}%lR#\�OI~9\�eP\�\�A�We>G��\�aUi��\�>��2\�Qeg\�2$Nu,�\�!V\0+\�)K	�v�&U,T0�\\\�)\"NUM�G\r��K-�FR¢��&\�\�\�\�pȊs�@�)S�Yk@�\�̡Gmy>:\�v��	`%\�\����e���Ū�Y��jh\�{v�\�\�\���✓�3\�2�O���3~��\��������ll�\�\�F�̂\�B%�T\�\�V\";�ii\�H�/�5f#6<\��Y	\�@lX:\�R���O;S����\�R�6w�j�0Tߊ�11�iA/\�u�\�\�e�B�\�\r�\�\0�S_X]Q1�9e0\�H�\�/�!�&Z�գzVT\�m�6�Pgu�\�lA�ل\Z�UT�JB\�M�\�j�HP!�\�E \\V[�\n��O�\"�*\'[�,��\���h,_\�M\0SP�V\0y|\Z�r\�k\�h�V�\�\�@�N�V���ܵذe~`�����\��\�_c���\�\�$�\�\�b��\��yT\���\�񟿰\�\�Ŷ\�Bǝ|�\�\�̀\���4wu\�E0��T-M�T���\�\�\�\�R�Aŀ^�\"f�LZdn\\6�S2�����\�hʔ���\�h�W�����\r\�s5����\��\�`F\�g/%`�M��u^	\��<),\�FB`\�k\�\�U0(hs\�\nX\�{R��jX˨n%\�\��\�PP�\\3mإ\"tj*\"[l[�\�5�\�(@T@%�\�2\�e��]����#(0\�\�0eI`-Q�\�\�D�Ձ�\n~�\�F�\�v\Z\�p�\�a<`�����\�\�\�K��ږ�{g\�z�\'����N<��[��	\�^�`��1���g|r� K\��MqO�\�m�ҝ/ѿ�$Zg�cߙ���\�8\�\�\�S\����O\�\�ُ\�lr������B�Ņ*��M���\rV*�\�:��fy�%e\�\�2�r!\�Ȇ,]�|\�rJ�.��!\�Rm,h�b����\Z��*��+\�\�Y�\�\�%!T��0\�vՙ,YE\�r�\�(�\"#RB]�R���bf��H�\�i�ż�Gu.H.\�\�En*3c\n�GZ&J���\�g+)���A����x�\��6T��p\Z\��,E0ȋ������D\��PтKSS\�(��]J�f���\�\�\\I%4�Ѣd���1\�݁����\��\�,\�\�\�\�®�A\�li41V��໫00\��G	����\\�\��q\�\�Al�����D��J*\Z�Xb@B��\�R�\�\��\�7�\�\�|�\�\��\�=;�k\�v�v4\�Mۨs��\�\�T�\�mE�8�����3�=2[1\���P\�&%Őf�H\�� \�(�\"��R5�Q�&\�e��mT\�v��ZШ4\�E\�\�\�z\�Y�Pf@�[J�KPN�Jⳑ� Ե�,\'\�刍+��_\"|�Ұ\�\'\�VF�/0��\���G�O����\0	UL��IV\0�FFœ\�e�37�PmP{\�V��\�J	l\Z\"\�\�\����((�sQ���F\�\�\�\�S�5�\�\�@�A\�L�F_MF\��?y�g߉\�I8\\b�?Z0\�W����\�\�\�k�\�\�\����\�8�g5\�\���\�π\�0O�i�f|�͵�%Fd\�I�\�L��M\�V\�û��x\�\��\��g�=y���\�۷��FoWj�&Թ�hu\�~8��\�\�\�0<�D�r�\�\�J*�9�2d%\� �\� 1E\�)(IL!\0�T\�XY ��\Z�Q	��0\�Ԁ�\��R%\\r�hnd\�%�g\�SˡH/`\�C~BRř�\�ʑ�eFy�\�IR���c�o\�Z�+\�\�O\���\�\�\n\�XD���Ǡ4%�ϝ�$�\�u:\��g7-�մ\�Z��(\"\����\n�\�s\".8�<%վ\n\�2�. MJ3�h�MT�f�õ�P����Yn\�\�Z�\�bw|\�T[�I;����\�n����\�����B�^l~�B\�\�;��\���<�\�G8t\�(.^:ˆ6���j4&��]����{���\�\�\�y̳g��ݷ\�\�\�\�\�Åg0:؉:7�Y�.�\�2TR9�l�eejdf\�/�@*��XHd�\r�C�,�⊑C���P�^��\�L\�(�G=fZ��\�7�\�}�kjd	!\�RQ8\� \�*��\ng\�g.\�+C)L\n\�F\\X\�㥐�V@��E^�\n�i	H@�\�.\��H���\�#*$	1\�(\�L���\0\��\"\�\�\�̱\�,,Z\�;t��D��&\���jIRc<901,�\�-\Z�&6s;\�A�Ԅ.�B�ـ�\�\nt׻\�88���\��{#�l���&���V��\�jD\�@;�<g�\0\�\�O\�����c�\�$\��g�;\��W�\��˓\�q\��_��3gNb\��4F��1Xk\���S�㏨í�wx�g���}��N\\9���K�0?>�֦J\�g�4W�b��\\9�R��Ñ EXX>��Ӑ�@d~#�|h�2%��	�(\�̆�\�\�+�����W��\�\�X\�\���of\�S�\" �̓YY\�\��\�\�h�*�)��|��\�Bh�\��%\Z��\�̖Zh�VM�r\�\�Hi\�e̊���P��\�\�2XY�i�uT�F��16\�d�C�&����\�nF-��MS\�ϙφ���\"ς�MeHN\�{+aӶ�\�e�\n\�\�_[�\�jj{�8�mth`��>�E͌,Ξ�bq\�J�=]l�_>\�_\��bݧ���Q�,!B\��\�	\�w�\�cq�6�8�;wl\�\��0F\�\�0T_\'�r-���M�ܕw�4����<\�x㋏��\�^�{\�6΍a���l~�R%rs�HN)Cf�ji\�K\�\r˄�_&��<g�\���D\�et\�y�R\�ިp\�Z)\�[밅�m\�:q��أ\�NXh*�����\�gN\�Q���M6\�!V�T�����T�!7�D56\�huefX\n�0�`e\�t�ǮT�\�P\�a���IŮթ\�^�hu\�\�^�C[�\�̴\�*4�#\�*�M�\�\�&\�hP���\�DHRrQ\Z�\�D��4THuha{owY\�W]��*7#	\�XW�\���\�\�\0�\�n3A\�V�\�h�U+��b�|*�8,���\0�\�\�Õ\�\�\�AI\��w�7�n\�Kb�\�\�~\�O\�c�~\�GX۳�)\�?\0����\'��厽}�wnBZMe-ڹ�\�1kٴ:f�b�J��e\r\���\�yJ\�\�?���=\�\�\��\�c�p�\�\�ݼ\�9\n����`�0Y*�P9P����T\�\�\�\�F	U��MSY��N����\�P\�\�\"�5\Z\�\�XF9ک\0����ONb�\�(6�tc���\0jѪQ�^&Cei*J�Q)c�\�X\\��V\�\�h\�U0�YY\"*Q������\�^�F�\�F�MT�z�J�\�2	m3Vi.\Z��-��B�nF�\�J3z\�v�/�TZ\�DE�eD��P�� �\r:;!	Q�\�\�\��,Ʉ�ѥ���\�iA��\n����@�:z�#޿<y���1\�\�F��ߍF����\�nS�YaAW_�o�_(ߋ�b��g\�~���r�\�\�\'\���\��\�>���\�~°\�y\�d\��\0�w���\�|�-��>�M\�\�\�R\�g��\r�\�.h�2(\�\�Y��\rM�k\\�|&a\�\";~�\�O8v�>x��\�(��\�vr�##����p͞\�\�2%AT\�\\n�\�X���pqTk\�TM��\�Z4Q%\�\�&`\�Xc36��	lĆ�6\�2��\�t����Ǫcq��%)g1!�j\�2#*\�z-\�^*\Z)�܀\�\�L0\�֌*�\ZNY9l\��|?\�V�&����\n+:\�\�\�1Õ\�\nH۩~�zԺ��avsu\�ɥ\�LKAbx4r\"�a(H�KVWy1\�a��;\�\�c],\"\���@%���\�&����\�X�\�jĽ>��W��\r��߿(VH?}�-n\��C?��)n>��\����N>�\"�Fdf�\�B1D/�Ǒ\�p\�\�l_g�\������\�\�D�^�^�\�f)�f\'n\�yϓ��B	$�GΝ�\�[�p\�\�1�s|\�>�{��\�\�A��7�����hc�r�B�A�\�\��\�\�L֠w�\�F�\�U�3;\�R�\�詶c��\r\�FG�uj�G�i���\nn�t\�\�hӖ�IE��JQOm0\�i�64Y\�h��\�(\�p<G�\n6����JSRN��<BZ\�B!\',ף\�B\� ��U�\�\�{�\�\�\��R��	}�\�\�Q�f��6Luu\�Q\�\�j\�릳�\'Fzl\�E��X\�\ZLF�Z՞`�\�*�8���\��\�٪��S����\�*\0\�\�ը�3\�<\�M\�\�n%?bE�\�) Ϙ���2�-n|��\���?��hK����O)�\��\�9\�@\���5\�\�٭�w�\��ֳ�\���ql\��l_�\�\�v����m\\\�JV��ý�?z*\�3F�_Y`n~�!>��Cܺ~\Z7/\��\�q�\�vl^=���v*i=z�N4۬�>3\Z	N�^l\�` W\�rj�6�H5說&�n�\��\�\�`�\�16�m\�=\�m�\��y�\�\�m2�ӠB�F��\��m%z��]\�h=���q��9��\��yN\�@��\�\�\�D�C���Z%N\\Y��\�\ZS�G�\�Fk�=\�\�\�\"6Pe@�K�\�Ԡ���6\\\�\��b\�21N�1\'%�\"7!�\�|��8~\�\�Q̞JB\�G\�q!`�0j\n\�l\��O�\�\�䣓�\�ad\�+���[�;�*�ו�¦\�\�QO�����\"�	\�\�y\�&�q��nl�r\�O\�=\�\�ܳ?>\�\'O��\�ϟ\���gx�\�_�\��\��\�\�\�dB��\�\�9�\Z/��\�\���\�T\��\�\�8_\�u\"\��G����E<P\��\�\���?��o^\��\\O�^�PxN\�\�\�\�\�/>\�	L���:t\�\�0\�Ƞ*\�c��j+�εw����\���\�\�\����\�\�\��p\��\����I\�\����\��\�\�a�@�ф:\�xK�K\�%�P\�B@\�\�iw�l�n\�\�s\�j�\�\�B\�����{�\����\�\r��q`\�jF�Y�n1�T&\�W�^�~�CN�wf�a��@�0\\\�\�X]�\��,W��,3]\�\�\��\�̉ym��mo\�Tk=\�\�\�h�\�x}-�	`��c*`��U�\�\n#Uքj�`���%\'�(��OZ��J\�\�\�W\�붡�\�\�R41\�\�[�\�\��x��>Z���d�N\n�L��\n��B\�H�\�]MT�\��=\���A+\0���\�9�������o\���a]@��v\�\�mG�\�^��=��M\�п\�,�w]�\��˘=r3Ǯ`�\�U�9�!֞�\�\�\�Ʀ��b\��O��\�X�\\�\��@�\� ���P���S�����7�����\�\�q�;Nad\�iL\�8�5{\�a\�\�X\�s}Ӌ�hj���`u\�\�h��Je�Re��Ym㞃��\\��\���;|��O�\��\�O\�⓻\�	\�����\�\�x�\�1�?���,z\��2\�\�\�,\�@�ɂ6��	��V[��*NKU�\�\r՘km�ƾn\�7��3\�\�\�Ρ!lfAZl�\�4�a,����赩\�G z	� �~���T�\�:\�44b����5��z\�t�buO/\�\r�b\��06�a-_k�{\r���\�\�v�a��\�sv�\�\�\n* \�#\�\�e@��8qQ\rs�ۮ�ՠ��()���e���\�l\�j~6\�\'���U[a�A�(���\�\�؃\�\�?z�+Z;[asjX>\�0I�\�*eT�rڱ6�]b�ԟ�>�\�T��\�1�o\�\�Y^�V6���%5m(��\�\�](�邬�\�N���7n\�\�7���-\�y\�:6�s.\\!|\�zƦw\�ņ�W\�;\�t�,6�<\�\�:4�o�w��S�\n��c5\'��(�\�\��\�\�s\�{Ff3N\�l\�~2W\n*Z�goF��	\�\�&\�p\�jj���E��\ni�\n$*�Ȕ6\"�ԍ�r2%\�H�����B�����F��\�\nd(\\��p�\�~�߻��\�i|t\�8>�p7\�9\�9U\�yf\���,}X\�ׅE����^\�\�bW�ws^\�p�\Z^�\�l\"�\�2ޏ�s�82?�\�ӓ\�5:��=X\�֌�:Ze��\�1�\�\���f6c=z,:��a~�$�-���\�ނ>nug;h}�o�\0`\�`\�t{\�5.R�WwQ\r��0C`\�j\�0\�H0\����0U8ـ\�Ϋ�3],\n&\�fY^12\�b�)(�\�]Sg�\�r�\�\�w҆kٔ5ee0��k%�p��\���O����iP(aTFQB\�\�\�-\�\��ME	�E�gK���~�._݆5Sf�$���\�Ռg;J]�܊<w=��!�\�\�\���p\�\�%�}���\�{�\�후\�\�\�\�_\�㽇�\�\�_�>\��%λv�!\\s� k\�F����I�A�X�o\�M\�k�N-��\�\�p��#�L5��C\0X��0�,5\�2\�!WߊLM\r24UHV8�&�!E\�@���[]�AB�	�EV\�되o@L�\rqz$j_�G\\q���-P\"�Ăի�\�3�\�\�|x�>\�寮���؎?��6\�=�G6\�c\�\�8vM�c+Um\�8��c,\Z㄁Mwu_;6ub�\��l�ǉ�qbq���ۙW�6c�ym���ϡB�M�>�N\Z\�5�^+\�Ꝙmi\�bG\�vR\�z\�9:�+;����Y�\�P?6�u\�bt\���0\�܂\�\�F���\�*���6L�h5-U7���\�WAF�\�R�\�+�[�f�%�m\�c\�z�\�PHsa��A\�˶�6���\n�\�4Qu-V���>%PP!5J\�@*�\�X\��O�\�Ͽ&pB��7\�/̅?\�飻�xq=˞/�1\��ȷ>\�XTQ���V�[�<�8p�*\��\�;��\���\�\�x\�g��\�c\�bF�Bu{\�\�\\{�\�\'���	��t\�?|\�\�V��[Q\�\���\�!<\"|�8�#�\�]E\���9\�\�]Z㗿\�{\����e��<�<Cr4���jU�)2R\�\�\�J̈+4\">�#_K�L�&t��jD\Z�o\�0#�P�\�b5��Ԉ\�R!!O��\�>\\`\�z�\0><{w.��\�.\���.\�\�w\�\�\�\�Gp^��v�g\�\�4vN�c\�\�$vO.^\�<܏�T\�338�c;\�\�ڎ�[7\�䆍T\�E���\�:��X?��y��mq�\�t�9L��qb����z-�Z\�K\0�p����[�8ưup����{��]\�̷��\���\\\��\�\�\�\�2\�\��Cu�n�-X�@~V2�2�-��Z�A�N�k\�\�6Oe\�A#\�f�΁JZ��y��߲D��\�Ϩ�k�r\�\�J�\\NP̋\n#4\�ZH�\�\�ގ���c\�\�{\���:�\�o\�ũ�bÆq47\��R���K3򬵞i���\0\�2K�Vta\�{�q\�\�C��\�}\\�\�g\\�/�{��~�\�ܻ��	\��Op�\���\�\'�\�=�\��ۇ��\�و,6RC\�0n}!֊�|��bA\�����sW?\�\�\'��\�\�\�_�1�nF��\n\�\�T\�h���VkE��	\�.$>�]�4;��/P 2׆\�\\-bx{T�����R��\\�_�0C\�)���l�\�#\�q��ABx7\�>��N\�G\������{\'Nl\�BE[�#��8D��\0�f�}b[F��}fG�o\�;|̥��qa\�.�ٺG��;����3l\�\����`VU�\�D�0\�.\'\�Y�\�ֈ�\�\�=8�-#\�>0�C\�28F��9o[{Ǳ�w뻩�흞\��vc@��\�y�\�B�݊:�u��\ZZ}�\�\n;[�Y-A^^&��3\�@�\�{F�I+aS����\�Kra��=�ˡ�o\�\��??�\���0�L��r\�ta	m�\�s�p���D�\�\":�q��\\\�K��Y���RD#<�\0a\�9x)\�좵1Oj�gd�2ԣ\�P�|\�^��{/]�\�?}G������\�ݣ\n?��˿��w9\�m��/�q\�\�_�\��Ѝ/�\�ҀT�	9\n;��W\����b�\�\�9?\�\�<�\��_X�X��!>q\�n߻��e��\�\�\�\�\�#EI؄�\�\"���\�xq%&\�\�R\�\\�F\��<-\"���Ȧ\�e�o�BޞgG\\��Yr�g�#<�6$1b�-��ލ8s�\�u`\�ٻ��n¥�p\�\�~\\ٿ\��\�\�\�-pl\�\"\�.\�\�\��L�c\�\�0v\�\�(K˕c��ӧq\�\�q\\޻g6ؙ\� Dk	\�\\s��\�u�L\\F�\"�ڬ\�4�Yt��ǣ̊s��:f\��T�MC�\�24�m�\�\�F�\r�A��*������9\�\�\�\�\�\� \�{Oe\rڨ�\r|\�\Z\�|�\�*\�\��\��R-�2�9���\�\Z$E0Sʹe����)���6E)\�j��YuU~z�\0?��\�6��Zy)\�\�\�0S	*%R��IApL\�CHr&BR���ˑ����ť����R���*\�\\et \�\�@����\Zd�|�t\��,\�\�\�AϺ\�\�t\0[��g\�Q�\�:���\�0��\����\���1�\�\��\�����wͲ(T!NiG�Ԁlm&\�o\'hb��z�q\��(\�/V\�{�\�\�3l?�.G���e\�7(\���\"|�\�$潄+U\�\�%\�FK���\�\��#X\��,ӀH��\�)�\�T �F\�h�ԙx�Q�rD�K�&AR.\�ЎM8�s\rN\�ٌw\�㻩�\�i��p\�\�n\\ܿ\�l\��u�8�0�}�Äo�p�`�\�i�s\�\0\�\\z�/\\��\'O\�\��q�N\�`\�\�0623�im\�\\K&\�\�v\�0�*X<l\�#�\�f����hU\�\�\�aB4\�\"����~x�	\�\��O1�MQ	\'<�����\�\�LG7Ʃ�c5n�1kvq\�.\�aZ\�T=*�\Z8��z�z5\�J\n����\�\�X�\�g�</�\�,��紲2\�\�-6u!�©,���������\�۟�EcM=[�x.Z�B\r��\0*�R�	\�2�G%\"06!1y��\�EPl�����G&\�76\n/��\�\�\�U!\�X��`��*H �\�eC%��n�\�a�A��\�\�T�Bk33#m\�ل[�sܼ^\�c�aK�E��y�\n$ILH*q �Ԅb�O>��>\�C\�3���>��g\"-zυ��\��C\��\�!\�\��\r�H���RB\�X4b\�H,��(\ZV�1υ\��\�2\��hN#�\���S%B���\�	\�VP��*��#\"M��T-\��ضyG���\�\�\�p\�\�1|p�\�;z\��K�w\�\���x{\�&]��s3\�9J0:���pd�Z\�z�<��\�\�^y��\�ۍ��n\��\�5\�74�\�\�s�z:���ޣ����K����$�8+У7�A*A�Vl\�u1\�\�`��\r�\��T�1\�>I�fi��\�:2Og	\�x\�\��fqJ-z\�5\�\�7�\�\�\�)v��:ګ\��AiI!R�S��iv\n�YL�b\�\�\r\�H:�X\�Y^ȼX\ncm��\�=�\�|�\��\�H\�\�F�UT\'+����Y\n���\�\�\�7&~qU|��*\�&\�\'!����;�\0f+-HW;�zUHSR�.$�H#�\�\Z;\��uH1��N5\�X��B!̥B\�+�g�C6�c��ɶzdY�i\�\�H3��f�M�Y�\"�\"�L\�)\�����\�#f\�/�=�;.|Ħ�\�P��\�}�\��\�*\�bY.J-\�tT�\"=\�\nt*�g\�!��E0\�\�$�49B3�8%dT\�p�~\��t\�\�\�*�\�~CS��I\n��l�\�9ٳ\�~��{\��\�[���\roN�_�\�\�T��cCX\�\�V[\�d���g��\��\�Ƈ,1\�\�ֱS��\�\�\�yg\�l\�\�i\���A�R�v4c��\���\�FL�U\'Օ\�:\�(S�^�C%	��Z\�D���� o\Z��/��\�c\\\��Rv0��\�~�/\�i�n��L\�~�^�\�\�z-\�842X��\�r��\�!Yl\�HCyn.r�S�+\�f,$P�M�SyeTC*�A�D99���|�凨�u¢�C_.�N*�NY\�i)$2	|	�\"\�\��@��C@T6|b	��J�*B\��\n��4��\�|�!\�\�ꐦv\"�����3�Wx��\01�Pf�+��cCֻ�f!\\fZ���l*g���\'tټo\Z�6WU\�ǲ�*EN\� �X�\�,R\�h-s\�	ۯx竟�#\��?���\�?ƃG�\�\��\��\�)����/�#�\�M�^��澈|9�9\r\�\�*��霟NSi�)\n�ˈ\��H�\�iX\�K)\��\��\�\�$#��988�\�qr\�\Z\\ػ��o\���k\�㸀s��;9�]�\�̈́h��\Z�͵�\�\�9��\��\�\�\��\��%|z�\�?t�\�\� �\�Noہ�\�ӆG���v�p�ؚ\�\\��\�\�v,Է`��6;�T\n4*\���c�Yp�����3\�MX\�E��F�apk�\�{F���St��8⮣r\�x6\�5\�,�^\\:*�V\�\'N\�&#L\�0\�%(\�OGV|J\�2P�����$\�J�\���vO�ˁ�4\�\�l\�	���\nS5n<�\�／jw5�9�\��P�e@^�u1�#A�L+�W\�\0F\�\�;,^��D\�p$\�_\��\�����\�\�\�T\'3ۥ�J=\�:��\�Ud�r&/g�d-R����B\�L@j�H\�c3	p�PS�Z(��˨�r\�3�%H4�Z�\����\�e�\�4�m��\�s|�\���\�wf\�\�ȴN\"��\�T1˩��e�0\�b�\����|��\�B�MS�ׅ�2^� �!\Zfj��l`IE����RD%+a�hƶ��8�m�\�Yo\�j�_`\�ǁ�q\��\�\�a�N6\�5\�\�\�8�u3~���r��]���N\��\�\�\�CTσ��\�\0\�\�Y�k�9�w�Ͷ�����\�s,4�c��	3�g�6\�,ӣA\�V\\%\�\�i\�.6\�j�\�6P-i�\��q�{�my\03-}#��T\�~�g\rZ\�\�\�p8�FؔŴQ\r%�,ATP�����R<3��\�MM@~n�l���\�X\�bЎ�jJP�s\�\�\�op\�\�u\�\�\�\rZ-H1TEД��)KTRf\�2�\n�Ն�ced*VD\�be83_D|\�S< z�\�aEH^J,\�!Q\�`�\'pl���\�hJn�Ҁ�\�\�,r--Z\�RA\�N㗔�rҶm�̈́D��d%ˌ\�\�\�1��Īf�L\�b�!ye�+P\�\�Ё��\�\�\��\�ٓ�^�\�\'\�ハ?\�/���\��\�r4�\�b3,\�q�\��t*�\�~C�%��*�!A@j1�SJ=\���@HAL.\�u)����C3`0\�O+\�\�\�I,\�cc�E���Þ\r�8�a{�\�rG�gb\Z�F\�vi[{G\�f	@}-\�D#��9�/?|w\�>��{v\���\��\�ŭ�؂�~k�\�\��jl\�\�7�\raugfZ1Ǽ6\�؅\�\�&L0Џ\�r�\�vT�\�Pφ\�\�\�=XY�!\�\�@u��\�(A9o�A\�\�ЁɖvϱǃT=|\�\�M��*�.���l�F�\�p�l�\�ˋX�de%\�\�\�Bz\\<JrSQ\�\�YIQH��@J|$\�r2`��Lh˙K��n�(\�9p��p\�\",V#Ld\�\�\�[�׫��\�0k���\\�T7�\�J�\�R^^I\�[\�y��/\�Cb�\"0/���=�4b\�H��TJ۔�ȼ�\�0�*��}Z$\0AM%|ɴ\�$��v\�\�(,TMB(\� ^J��\�R\�\���Q����B2�9U\"Om@u[/>��k��l�\�\�_p�\�\�}\�\Z\�ؼ�\�܈�\�F\�0�[a��\\�IK\��P��S\nL؂S$J(CP\n�9I��8�.a���\'��=\��T)P�\�xZv\Z\��D��Q\�؂�k��g~ۧ\�r\�	�\�]��T�,�\�:�\�\�걦�\rg��ǻ�wzV���M/,\��\�586�\ZG\'W\�ȔȌ��k|�\�1�Ŏ^L�3(�\�d.+\��W�\�R��եX\n��*ӠMkC�Sl;�\�P-\�_S\���\�Uњ0\�،��&VױEע\�V�6��*\�	���hd��\�\�a\"xZ%-R�\�\�|i�\�H��FyZ6J��	`(\�����0d�Q\r�`�r�\�4B��@ju\�\��ϱ\�\�8+t�Y�p\�\�\�vz��Q@��# ^\0��\�1X\Z�e�Q0�B���ʷ<$˃ñ\\\0_��䴘B�)[�\�D\���k���x]\�@��S	\�\��/Z�\�/VӺg�^\�ǖ�x�(\�T��\�ꐼ�ȴV\�28��\��w\�k|��\�;\�\�.R⸍�Aώ=\�_�Ξv>l6��m6�\n\�i�+8�JH�\rJ#ti���O\�`�P��\�(A \�6<�0�\�4�\�* \�8�a	T�8\�2��\�8hM%����ej�F�����\�\�\�Q�5b=^�\�L�\�\�f\�\�.���,\�X6���a��0���n���\�il�\�\�!�\�f��f\�b]�F\�]S�xq<?��y\�TĖZ�D�\�L;ua��5VO��m�\ZV����	\�h�X\�\�\�\�v�M\�k�@K�K��C���LuI),ť�O�$\�s���\\N\�\�Ebt:R�\���q\�K�bLBrD���\����`$\�A�VA[�\�/7 \�L\�\�ꁥ�\�sH�\�L\�ӕ�)3AR�Y9��t,K�WH:V�R\����\n��\n\�cUp��J\�K\�%\�\�\��odä�\�H��\�Xf8��	|�8\��\�}h\�\�2;\�8-\�#Fj@m;�\�K�K(�m�\�[(\�c���NkL\�EzV9�\�\�B�v_|\�>�\'>��ݧoQ�!�ޣ\�cp\�1��M��&䚫U�Bp�PP)\"i�Q)Zf<��3E�#��qY�%xq�)�A2��\Z�\�(�\�}�\�Լ/\�I�ޣ�!�\�4~���\�c	B{o�\�\�\�?�w�`��е\��ڛ0\�\�\�\�\�0\��3M%�\�n�Lg+l�i��\Z�U\r&h��\�]Xͱ\�\�Ǽ؅~K-\Z����=:�5p[`(�:=T�\�\�5���\�Q���D�܁*d[�Xw]Fj\Z\�\'vzuة��f\�=�W\r�N�۾�F6^!%�Pl\�`\�\�\'�@_Z\�9<A*\�G!\�(>2�Q�(LGZR,��b�\�@D�!.81aވ�@4�ul�\���sL.\�\�(��r�QF�f2��ȗg�X�B@\\\n�1.\'�\�\�\�$,�\��X,\r!x\�;(\�\��RLn)�s\�\�\�0�\��E��)f\�\�%#�����jG��\�*\�m�5�J�H{�\�φ�PL\�%0\�|�1\�:$*�K\�\���Z\�\�ĵ+��\�#|�?�\����.\�\�O�\�\�\��\�z�L�\�3֡@[�\\m5\"\n\�p�za��Q\��J����\�\�������%#0��K^>�\nT�g�gXb	�r�h\�}�ELf\�4�v�P��D\�G>&�J�\\\�\�\� f��1\�ь�&�8\�\�\�\�V�\�\�ZL\�Uzv�Z\�B���������Z\�]�B�R�vCzL袽6��U�QQ��%O3�cc�	�<�y.(����Q��tPafܩճ\���!>�Pϡ\�6*^=\�\��T\�Ft�\�\�U�\�dE�������J�.ʅ�߽E*\��(6��B%gE\� \\\�ȉ���\�\"=6)\�a�DH@B�\��?~w\�<\�B\�\�U�4�&9�jd�-H7T ��/�\�\\\�p����\�-�w<!�\�\n�\�%\�\�8,\�X�Hy90+XB��\n\n�\'�Q �P��\"5b�	f�V����]^�+$lef\�g@$\�\�\"\nĞ%*\�i\�yQE���\\�B2�\�(�M�4�?��C\�a~\�̝x3G\�\���7���x\��	���>\�Ss\�\�:Q��E:[w4�)T4[.�!�ş�\�L\�W\0U-�9ϗ�@\����\�r~B�=J(�ol6�i\0U\�_(bR9��\0�d*k�:��v\��\��\�\�eޛ\�\�\�XK=&[	\�T��Q\�W\�\�P����\�\��&�\�\�\�\�[�Y\0�a\��\�\�B�[[����\�;�W+Zs��\���*ӉrB\'a�-c���\�R�V:��9��j\�,���\�\�n�]�\�\�hsV�\�fE�Մv)�_�ي:��[c��\�l\�\\\0�T\n���\�\\�\�Jʑ�����0��f�x������#\�\'\0��^�	Et@\0�h�~i,rbE?#U�ƅX�I�*\�\�)��b9b˹P�\r�\�(uPF�ª:d(VT\�Q�X\Z����X����\�t� ^\n\�\��\�\�0C�	ϗ#&WME,D8N���@D!;��0^��I���a�\"��9z�Hk+2 \"��0Ӿi%\��R(r��\��Q̌�Ge\�1U\"\�X�Bv��9t\�o\�͛\��\�\�cXz��v\"][�d�\�p�����\�\0��T?\��\�|�\�\��,\�\�\�?�V\Z[\�\��\�9�G0c\n���k�bp�Ȇ��]5���0���1º��YU�\n6\�\�\�5\�b��\n\�M��l\�`���N��,�b\�cK\�9��i�\�g=ۦ�2;4yz\�s�0\�eN8\�\�\�J6\�\n�\n��fUVL�f���\�\�\�`�SfC5\�\Z~�J;\�4�f�\�\�Z\r67�\�.\�)\�[�B�\�\��礽QI���{\�K2 \�Ʉ�P\n�L�( %���\�f\�\"&*\Zq��ȍ�@Vt8�Yb��\�\�\�H���\�/4�nÅ<�<�\�\�U�\�\�#�,%(\n�\��\�sJYJ!�\�G)��`Ȩ�Eyc\�\Z\�\"�M\�J�(�`(�Ђ���,�Ka\�y\�W#Td��Rڝ\�ż,ET3^�\�b�i>E��A6<_E��#�\�AXc����1��\�\�\�.5Z\�\�\�!�\�ҡQ)Pjq W_�\���yJ7N�;���-���%<y���Y�0k�Ю�\�^T\� \�n�\�%\�x�60��pes\�a�ɂo$o�,$���\�/6�6@��M�E\��(\�Q\��c�Ka�ͬ\�O�H,�?3ah��t�A�\�юF�Vc��\�\�z�YW��\�F\�b2Ѝ�\�O��0\�݅fw�:+�\�\�\�\"�X\�`�7R՜�@4��\�\\Χ\��6\��s�WPl,p6�N��c�ݴ\�jq\�\�F��5,M\�\n\�APuB�z\�6;:,U��K��(�\�\�e�dgCI�3+$\�)\�\�U!)^���\�(\�?gf\�\�#1*Il�ι��B��?\��y9^̉�b��p>�ѪJDR\�f�+.^\�\�b��c�.Q!�\�*�\�%�y8��9u\�(�dǐI\������\�h*`8�0\Z/�d�\�\�\"`X�.���*\�f�P���\\BHU\�\���\\6Q�Jk	�:�P%�3��B�fd	\�rPX�\���8f�R�R��&ګ΂lf�S＋�5q��<}�d-Ƞ$2�\'��1�&�3\�2\���<\�D9|�OA�.�7\��\�\�\�8�\nZ�/\�ϛ\�\�\��>\�E�J(\�0\�E\�*GU��Q%�\��yI\n�F9�3kk\�1\�ى��Z�\�\0\�<���׻=\�d�\n��_�}�(\�8���\�_߆�\�*V%�r+�R;�r27�h�i�,�\\+\�٢��a�*�4mp8��V\�TU:!���*ΥrJ+\�V��J:�S_����;XL\Z�ZT��x�_c1-� Ji,*\rlj4l�\�yy\�LHBXhRc\�\��\Z�$�0a�l�!�A����/���t�L�\�\���\�F��9H���x��;6+X0}Rsᕒ�l��܎(\�\�hA&m8�эL�y.+\�:\�u	\"�ā\�7�-Xl�\n`�I�\�\��\�s=�)	C>�r)�rP��M\�\�ĐR@H\�^%b\�0a͡��-\rT\�>>8�Q�y\�I�\��F\�\��P$աT�C�\���\�©�\�пi+�8��\�~Fq]?ҤV$���sX�>	��a\��y�0�&2�\��C��\�	�W\�E��\�%�0Fcm\�7�\n�	*�ot>#��\�h�AT\�`�XwH�j�\�%:E�Ҋ��&�tq�K�h#�̈́������T��N�\�!\��`�-\�may�G��KY	�\�c��B3��ӣ|\�b;6Zr-\�\nG5\�\rM�U5>7j�h�գ\�RO��\�\�b�|G���\�\���5X	ˎ�yРF�B	��ٳD�Ӱzy	f\�T(�,\�o���V���H\�D\�\"\'*�����h�z!��\�\�OC���\�\'�+E%�\�?\\n@���T��/3���T,�I\���l�\�X���E>9|�Z�p�t\Z�RncR\�.\�\�J�[\rH5��i�\"\�\�Bq�/E0��\�X�\�\���\��O/�fB3ri\���~l�����\�|f�\�/�c`V�j����\�@6Ͱ�T��$b�X		oJp*_�S#_� �n~\�ƶoŮ��\�ӟP\�D\n�@�Čʽ/�Ϗ×\�\�C\�\n�ͥ�\��D�\�tBO䔗������T�rBW@��\�f%\�2ˣ�~TG_\�\�V\��\�/7^E\�\�̛n@J�	��u\�i\�p��\�l�\�-T\�FL�w��٦��E���=��\�\ZAos/�hgF�G#!�7֢B_�\nU�X,��7�EXe,\r�:	\�\�\�\\\�v٦kD����Z�\�\�\�loF��TS�D\�90�Bk�:V�\�\�\�is�\�UA��z�\�s��8�M[F�~��A&c	a�Hg\�O@DP,2b���L\�Ġ`�xS�\�\� \�練t�RDBh�!l\��J�S���I����<*�\�,�L\���$�\�w��\"�<�ш\n*\�!�\�8��5.�W8�\�ϕh\� EgB�Æb6���\�*�\Z\"�سRח\��e0X�gzֵ�\����\�:4�J��2 ���\0�Q�B��\"T�@\�\'(����	LΥ�d\"3%\��\��\nCPX\"�y�H\"��\��LX�cW�`j\��۹_?���N\�Fq\�bU�O-��\�[Xm,��\�,x�{\0#���K�OD/\�`yd�é�Ql^��\�`���_�\0\�7R\�\�e#��YfBh\�a1̫q����3�Ė.�?�*%ucȣr�m�<��4c��\�T�V��\�&ױ�\�u���\�\�l��\�\�p��6�ԄN^n�6�\�؂:U=j�|���\�\�\�nD\�s��8\�eo$PMl�5h�T3:`+S\�\\�d�\�P��pk��7\�\"�n:\�\�xa�\�\�Q�R\r#�S��y٠TB\�\�(�\0	q1BtX2�`i\�aH\r�Fp�����\0�\�z	\��L.�r��ZjG ?*�wj)V\�Q�)+\�R�$� RX�G�Q\r�]\'e\�\'%\���h\�\�\\�R�\�f\�\�mH xiZ�\�&�TW\�\��,\�N�!�K\�>(%��b%/�����{�*\����\"BF��b\n� l���\n[��\�B��B�S}��XJ\�P\�\�\�\�ʿ\"8\��IT�x\��,+ˡ4�q�\�^l<�k7�\�\���@�I\�fD�Xe��\�%+�_\�ԗE\�;��E��7�T\�nd\ZVHo�2B�I�\"h��\�\'�jR\�y%XCu\'�~��|�\���\��P\�9�Z?gX\n�~*�\\.�����Xl��en\�ds�k\�TS�\�\�\�E��uTźN�Դ`���5]\�n&db/>�P\rU�~\�V�v:\�8mB��M̺\r�MnAG5cJ%\�9s�b>~>�B1y��\�D�Y�f�-UvtVQA-6Z������\�C�6\�,\�zN)RZ�����E��h�r�\���P�\�ٗ\�\�~>Ɗ�x,�΀�\�\�M\��\�2Tl�\�0\��7\�3���pUB�Q\�\"�Kc\���\�[	,�Y����S���&j=R��\�\�\�\"�QS��\�\Z(�����`\�Z \�d@*U/#\r�\�T�i�ɴՔrV\�\\*c�J�\"\0\��	�/�9X�⠂�@�$Zߜ\�\\tF!ʊs����\0\�e�QX)�\�\'$\�7����\�N�v\�\�#���{��$J��-�\�)\�b	!\\\��2�\�B4]B\�\�\\Je�\�K`�H�!]IWE\�H\�\�̷2��\�\�|�/\�\�K���\�́!1~^�\�p���$#\"�\�\�B����yk���\�T�A�7\�H�8�\Z�<��\�Y��\�S݂ޚV�\�6a��3\�:	��\�j;\�e�\�B\�ؚ1`iDK���Bh\��aL02&h�S\�Q��P\����� �;�׋�b�\�+PI+���\�\�5T@+m��k6z�)\�I\�\��~���\� \�4\'#q\�kA�����xN�	E��!�bD�_\0B°��\�C�\�\�Cـ#\�\�(1����2<oŔ�;Q\n/2�4>K#E\�w[P\n�r5B�,s*�v*-\�5�.W ��?\�^�4w2�\�[ۀ\�×�3\�(\�L����\�Q�?�)\�L�Y�9�\�\�\'l���\�\"�\�\�\�\��\n�\�\�\�H\�\�\�Q�`^\�\�B\��Q����$J~B ⢣��\�Xİ\�\�\�Zf\�O\�\�\�1�f��\�*��-\�5l\�\Z�r��N���R\�؀žea�L\�+�/?��R�\�\�$3_���&aU\��L�\"�\0�! �K1s�\�	�\�d�O���\rM\���\�\�3P\�u�\�VĦ\�PU\�\� 3\�@}��\�ա�څvW-��vԙm�LZ�v��\�h�p\�GS�5\�\�\�\�\�2�8�p�)\�@K�)\��� ���\�c�\�EK��.E\�s�6�}2�̕ѐ\�A�QKv9�\�\Z4l��Ph\�h\�|�kQkT�M\�i�\�K��,/���\�\�\\d\�%#($A\�H��BvlR�Ñ\�\\�\Z�ؠ\0D��!$$�#h�\�qbg�=B\�FB����W1Ry\���\��K\�d\��͆XT�d\�\�ˬ@�e7��hnB�щ�\rAJ\reZjL\�T�/ҷhY�$އ6\�H\��oR*U�\�P��\\\�#�pi\"�\��?�?UΗP��qT)?6\� 洀8\�l�\��@\�rab:J������\�\�T\�2�)H�^�2�9\�\�l5?1���)\�iY�l|\�b{t>�\06\�UI�XEUXI��t\�l\�\�����\��ńP		�w��\�<�\�\�\�˫B	 �؋���zr�d	?7�,�SS\���&���l}	&�\'\��$�\�\�+�����\r���\�B7�8\�^�\�\0k)��J�\�,�:��L�Ɋ=ܹ:�\�d�%���\�9e>�\�\Zst�s��Q@Å@_9?Oi@6J�S 	΅<�\Z�7s�\Z�T qr\"q\�>q��N{%�\�E�F6K�g\�\�.Vi��\�̊�P���i�Q\0r��\�\\�\�\�x�\�\�3�\�P�\"�M+N�A[p�OB����h�E,���;`!�\�Q\�/Wo\�РB.��V(��\�\�\��J�\�ʸ�\�\�U��\�\"\\M\�4ۑ̜�Vрh�!:-�\�R�k�h\�\�KA�G�S+k}��\��\���\'e��\�G�|�(����Ju\�|�\��2�<�� �2܋���,^�\�MGQFdI\�P\�\��,\�A��n�5F�\Z0\�׍�}�\�0ԅ�\�^h\�\�غ���alث�\"�\nx�\�S<��\�y�D\�--vE(��lUp:VebEP�3��3�ￊʷ*<��\��,\�\��b��\�5��RB�T\\��e%P	cY\�\�iӱ%P\�Mh�r�\�\�D�K�k�5F\\l�Uj-j�vT*�\�`v�djac��\�ka/��\�A�M(ՎCW]��(f��2�R�`Y�\�|+\ZK\�h\�X\��^\�@��eCic�\�uU���\�h�ڨ�����kU�\�\n�/\��\�SAYXYA1J����\�\�@\�P$\�1�c؀�NS\�Ð�8\��(\Z�ebaN�!�Є�rB����\�g�8��9ߌ *Y@��EZ��X?��\��1\n¤\�\�]H�lBZe�1z;#˥Έh��T�H30�\�*��\�\�\�v#�D�PC��ȄdN\�=\�oa\�,-b�$�˙�b�S5�x=�\�\�O��*@pD2ʳ\�a*Lg6\�E���\���\�R��\n=&\Z:��z0�/t�օ�\Zqn6ɮ^\����%���	�c(^\�v���\n�\�ex\�З\n�R(^(of{[��-�2.\��\"�+��V���y����)�q��\�\Z�\�(�c��\�0N\�\�Q~\�\�(.3m�\�n���\� �Uh��Bw�ۍ^6�Af�aG\'\�*�1]9�K���06b\���kC��\�YьM�3�aP_�!M%zM�h\�8С�\�\Zk\�hr���\�l�\�\�\�V]�V��,��F{iyT\�\�<\��5yEPdK<�c� \�XD�Q񒙻����\�\�\�;!D�#1�\" 8	K\�z\�t9�	WP����\�G��e,�eV�˜�\�O��.��*숐<[KB�qcUV\�T\�\"�9\�V�~�x6�K\r�t\�1\�Y�D�^���b\�M\��J�[��̇�ˇMG(�7��\�%zn[A�[�\��y�`EG�L���!��b[��?>��,nu!�\�%li\�h��>+a�\�tk3�;\�,k0\�ڎ��M�\�=?���>D�\�+��E�rP\�BY<��V	\�<�A+!�!\�,,\�\��\�L�N�쁱�\�+�\�9��\'�\�a,&�w\\I\\\��\�M+�c����t��\0J��\�*��b.Th��_\Z���v�\�Smlu�lu��5g;e�\�\�4\�\��k�\�\��\�a�\�XS7���>,غ�h\������V�\�0diB\�\�נ\��b\�jFN3U�VA\�\�\�,�\��5\�]htP\�y�%�*�\��(-(�*�\�\������\�0O�M\�o�͒�.\�PL,�c��CN�\nGlT\"#|�=F�7e�ȠR\�٠��}	�?\�З�\�_J�2\�1�S�D;�R\�ՈP��gs#��1�1\�~�r\� ��>Ng@�ކX\�R\�%��8\Z_J��ӛ\n\�Ŭ�*&�ʖ\�@�ȑ�\��1TDf)ϖ\r\�*.M\�y�\�\��7<�\�\�+�$$�<�Z�z��\�r4;��j����׶w`}7&\Z�\�YY�u}�X\�`\�\�\���\�u�\��R�_��l��	�VR\rH+����\�-�\��Ζ�7يW�@�~P2U��%q^<! \�\\.X,2\�xU8\Z�W��Ɵ\�8��\�SHE����y��Qܟp�B\�\���,�T���\�Z��6a���\�\�\�F\�\�,6\�qk\r�\�W\�Z1onƬ�ӺL\�1mjƘ�	ü<hb�f�\�3ע��}�\�\�D����\���yL�\�\�\�Cu�T�U;B�b\�7�I�\�-�2��n�)s���s	[LD\"BX*�⑛���\�dN�%vB�\rGfL8\'*���\�\n:�7��>��\�7�\��<	��\��Ki�%&����J*؊˩�Rx��zK���\n\0�\�UȬf�pV3�7D\�-#J�ٟy\�ϳʎ/=/ys	\��%����\�q�XǶH����P\�V\��Ķ;�HژX\�A���\n\�L5�4\�p>�/\'0o\�\0>�\�T�\�j%:k\�ף��k\��c5�G��\�tU���c�\�,�mZ�\�4���\�Ձ\�5_�0R�Gu��\n\�G\�\�޴+�2���[&��\�[!���E+\�e\�\� ~�@�ȇT\�0B\�y^AY��(/\�X.taET�B~�LFJ����\�+�q��&�48�,[#\�Y��l~&7F[\Z=�k�57y\"Ę8x���5��$@�p\�PO��\�\�V�9�0\�y=\�\�\�ѯ�F����ׄ..��\�6�\�\ZP����\�\�%Q�Qg�\�\�j�D���k3{�1\�X*�,�\0�\�<O\�-.\�C!�89>\r���H\�B����\�\�䧧�89\ry	b;pҨ��Q1H�\r\��+�\�ĺ_�\�\�3|�T?�2\�G�*3ë\\E\�c����@?�� K�\��baB���\�**#\�\�.��1\�\'`%˭w#O�X̾�\��!\0#��\�pZ\Z\�n�جA\�\"x��yq�³��J(n\�\�G\�V�&`y$�\��\�+��#y[8�\'<�j��J\r��l�b�\�\�9W\�Bg\��Na��i]o\�\�ڊSkW\�غ���T\�\�<\�ѩ���*\�3v\�r�Ɗ �´�Э@\�y歠\� �B3����<���2�OCl�+}����\�s\'.��^\�¹0�2\'�`_�OUg��ʦ0\�\�\�\�w\���;\�\\Q���\�Z��\�*�\�S�jk0\�Ђ��6LԶb����Jga\�*gd^eBW�vu�mV]\��\�c5\�\�{\�jT\�,З\Z`*5�Fm��Po;�Z\���6ω\����T�L�\�g���\0\�9�\�J\�F���\�8�1^��� ��I\�Bq�8#j,2\�Ƙ�D+N��F�8J->A�T:�\� B\�M\�\r���\�8�\�%�\�\'T0�Ԏ�\�YA(9e\�\�h�bn�2+�\�cibV�q�N(�l#^)\���WF>V���Na<\�\���ky�Xe�;��b�6�K�\�\n¹�Pz��\�+,��?�?ˇP�\r0<��+��\�+�Uh�G	W�y\�Kw�c.\��\�`\�P3��O`\�\�z읢ʵ\�bco;�l\\��\�\�\��\�Z�_Ė�A(3\�v��B!d{\�\�S��0\�>�\�H*\�/8K�e��\'��\�%bwo��$0o�\�8\�\'���ƥ�����\�e1��[���*���	J�\�R/\�\�\�&\�ۊ\�mHw� \�P�Σ�a�C]%�Gc#\�;\�h\�,̄�\�\�D��T�>6�NG3����l�Ur,2;ᢂ�a.v�!u\�\"�C\�Z����C[���\�md\�[P\�Q/J���\rXlVC���\�\�f?ZpQJho)b\�3����ʧJˆ<S��N.J\�\�P�DKNL@&�H��f;�F�X�Œ(Uӂ	Z�\�|j��\0�_�=s��p*��D��*�bTS\rU�+����;���\�\\\�\�4\��\�\�\�\��w�\�2\"��K\�K���\�\�,��D�\n� pT^_���ƛR�*�?d�\0�\��\�\�\�NU�Bx�JB��mqEo������ٌ�\�j�o\�хi�ڱ׏�֎\�\�(��z1\�5��;v\�\�Ƀ8�v\�\�\�\�z`\"��zy�P�$B�\�9\�`-cy@��\�S�	�����@\�r\0�\���\0�*(\�-�\��Rql�ȉ��ʸ�*��\�\�-Z�*�tF�B�86��k��*4\�?\n�\�\"\�}�h\'\�h\�dK���=�Uh��P���<�\�R[\��\�a,\�AUd��H��t%r3,	\�ji�\�P���L\�i�\�,=\nگ	�\�\n\�@\�Gt\�\�)v-��;PaP@ST���\�9ʭ$?E�T�hƏZk^Z&�Y\�|>N��\�\�9|\�,*b�؆sc�΢I�\���YΖ+�\�L�\��?W�\0��KE�[	��M׈��@r��Bz�}�d���\�;-׳}xy<;��[�/�!�e%@l�\�,�\n2�\'S\��\���p,��zт���	�#�}�W��T�`���\�,�C�K��9� \�\�B\��UqY\�X\�\��Mʋ?\�[�B`�z��n�\�f;�Ζ��\�\�A\\ھ���0(�\�7���v\�\��\�{�ɉ�pI�Ȏ�E����T%\��Vae�\�e�_َ\�&��q�\�\�L d�\\���&�{\�7o��\�7\n���⍀h>G4��s\�\�\�\�\�\���.�c>��]��d�K\�D>\�\�!�-t�\�y(Ƨ�c)\�s���0�\��\�ta��%�Y�Gp˃\�NBJh\�J�\�^K2ː�T\�\�U�\�\�RD3?�\�\�é�	<%N����,��T��\���\�j\�Pm�{vDu\��\�s&�Z�f��|�qg\�Q�X<rOQ�炟�D(iǊ\�b\�� \�ʅ�\�\'\'$�\�`��I�\�h\�6\�b�,\r��Kᓫ�Wn�	X��\0\�\r�X�`d\�[������S\�1~-�eH�\�&\�aU,�0.��p-��(\�ay\nc\�T\nJ\Z�5\�\�$F%N_ZNu[F��&T\�)\�b\0���A\�XI�V\�z\0\�^	&A\\\"�\�\�\��a�x\��˃b8�D~)\�\�\�P\r�M�a\�\��\�>�[{�\�\�ڵX\�ݎ�\��\�\��h�!|�v�݉R\�wi!jK%⏿��/c�XƼ�,X�a$0\��\�$h�0��Q��\�	\�\n_\�\��7|xB��w,/\�\�uB����\��~���\�5�o\"o\'��TWo.l|\�|.߸|\�m܏�#\'Q\�7���jT\�\�\�\�&�� ���m, �5̀,&=U�l��b\�H�J(\�%T�L��:N��H����\\\�$\�A��D��V���ҮkY6�آk�/�xk���9]��[=g�R�\�8?��#ET�܌L\�Ƨ �v�Jk-cV\�@͂�\�ɂ�+XYV:���-REi\�(�\n�\�~�L˸\0\�\�\�R᛭�w���ɩ��p\�VB\0i\�+�\�1�-�[�rYVĈ�Q\�\�	,���N�\��Q�yti2KkF1����\�\�FU\�Tl\�}ɋ?�/-ly\�\n\���� �+CY\�i��Kd����\�\"�o�}��v\�	\�PZ4��\�@�\ZH�B\�h\'�FK�F�,6�\�\�85�s���#8��;;����\�\�ۇN�\�\�\���\�\�hc�\�2�6�C���\0\��r�a�K��R���b�{S@ �ɄH�\�Q�7�bx�\�ӟ���\�\�{\'�آ�w\����s@DI \"D�DIB9\�X�JU�J]�+\�U��\�vw{\��\�n\�=\�\�	\�\�\�\�7�<\���\��\��\�YN���\�9_ \�\n\�(�\�o\�r9��\�5?2\�\�\�.~\�y��\nk�;_!�WT݌�\�μd;&���\�o0\�\�\�x�\�$\�7\�\"q�6,��\�\�\�\�\�{X%n\�\�J�rg9MObwj�l8�%1\�Qh\��J1z�Ac��$�#��3�\\P�@\�\�\��$�H9;�\�L2�9\�\��V��#\�s�M\�SzEK3oh٨]����\�\�\��\�A\��k\�\�\��\\�sl\��m�1;)���}n��\�gt!~&{���0�v\r��֠Z\�P!^:���LP���i%\�0*u^��>\�i=(%˕ul\�?z>�\r:;j\rvH�>4�����5�E;���:���x\�Se�\\\�\�^��\�И��2��>\Z�R.+��\�3��+(���\�&����\Z5-V<}v�\�\�\�\�/\�<\�\�37�l\�_�y?|��\��\���\��@�S�4K\�A�\�\0D� ��ȴ�eu<N\��$\�yv*\"\�8���@\�\��d\�Su�Y��\�X�\�g\�0�W\\#>�9	\�Bn[��\Z�[d\�*2i5��JG�f!SX��\�\��L<x�\�K��\�9�N\0>�yq�\�\�=}c�\�ؘ����\��\�~W67q�\�1����e&\�-l-�cqb��&\�\�\�4\�\��\�\��\Zv����\�0�E�\�\�,So�,�N#};�\�aG/e\�\�e�Yg��\�5\�Ak�OߋAʱ��C&/?��h\��(\�^2�\�\�l\�\�\�\�FC;I4q�1\�Z�\�a\��(aB.��/m4�h�hӌ(f(,/\�\�56�3\�֨ͨ\��1|\�\�qY5�NK_\�\0R+*-���􄡊�\�΂\�6B\�\�&ђ�A\�\�NT��\n��7d5�>P�J3�P�`7\��h%��2��\�A(\�vR\�\�|\�\�\�3��q\�\�:����F��o]��W��\�[2\�o��\n߽x��q��\���~��={\�6\�`�t�aII�Xt� .*5\0����\�	\�LFi�k&{\�\�Z5�U��^�$\�nBv\�8]-G	���빮��\�^�&���\�w(�ɓ\�J\�Gf��\�T����*[P\�\���,6\����_`��[<wR_�\�\ZB��3�!M \�\�\�ޥ=\�D�\��8^[\��\�:�\�o\�;Ӎ1l\���\\����4��%1�\�\�2\�\�8_��������zh3iOt�Oat8���\naw\�a%\���\�k\�A�\�N�t�k\�4�\�t&��\�\��\0��1!�%8w�\�4\���[a\��&]\'\�\�\�I�\�8��NT\��\�q%}Ŵ\\%J�ڦnP\��#�y)�􌕔\�rz=\�\\����eA(Ӛ@�^6T�4Z��\�M@�LAOo�\�2\�\�9h\'rL�ur���\�y\�\�|\�%\�\�\�`4��d��[1=a	o~�\\A�$Z5)	\n����\\R�D9AQҠ\�{�ssxz\��\�\���?~�k���K��_\�\�\�@�pyn�	i�����\"H�<خA�^\�!,��+�,\n\�c�(! �	4=eU���Q��\��V���\� <�\�d�ׄlt\�\\^$�װ�U���x_a%��=Y�\�g	\nȄ�kT�Mn`\�ۈ\�|\�\�O1tUHp�\�<�d2Sq�L\�\�؅6=��\��g\'p����+g\�qc\�\�l\�\�\�6�\�{�\�E̎MbFH\�K\�<6Eƛ�\�N1|$ F\�L\r�1\Z\�\�p\0�\� ����NQŪZ�M*���\�n��.`5!(\Z$1!{����Ɉ�\�m�\��E�X\�p\�i�R.�]�!@\���HI���:*�r*3��M�z��+v���>�\�`�����\�2��Qv=�qz��!�\�G�O��,���U�2\�̑�\�hI��55��%}�T!EUY����\�\'@ULoU \'�AJ	\�b����7�2,����@#\�\�\�TYD�U\�(�Y$\�~ܶ�@�o�\�\�{w)�/�/����\�\�\�\���\��c짳8\�1!\�Rz�����Y�\���!\�\�JD\rÅ���_1��4��@,�/d�V(ҭ\�)��b���*\�Q\�e�}�\�৸\�\�*��@- �\n*�\�q�\�HÕ<o�w!祔i�\�.��x}\�\�<x�\���PDF\�9<�\��zg6\�^ڇ61�6z5\�\�&\�[؜�\�\�\��nwVpyk7\�)�Xc\�_��\��`*;�\�\�\�\�4f\\&\�\n�Pþ!�\\�\�u#J\��\r\"\����2\�\�\�\�	�Y�&������\�D\�\�n\�\\2|xm|&�\�Ȉ\��V�\�&�{��\�eQ���Ba�@b��\Z�P�\�A�@���K\�\��\�J[{@Jo�%�>\�3\�W�\r��ޯ�\�ǀDc(��\�I�+M|\�h�\�\�\�mu<G�%�ᬝ\�l\�&\�\�\�v�XA\�M.\�M�\'a�\�ٍ��\�@�-�(�^��P\�]F�Zx3\�u�\0+\\F\0\nV,�\�;��\n\�\ZȀ]�\��\r�����\�\�|�/\�=�S\�5\�\�h��\��`=LT\�~&6\�4\�	K<�NT1)�\��\"&\��\�ل���@\��q�5d3~�Q^��B\0�\�m\n\�\�PZ�%aם΃���\0$@+\�3˔bS~=1�������%9�\�\r\�n\�\�ť��G`�[E�\�\nZ|)\�\�3�\�`�\�K^��y\�\�2�5�\��\�4�\�%�\�6�b�\�\�\�1�t�Me1��\�dj�\�O\�y\�O�v\rb�1�ŋ�v�\ZR2�Z����R�o\�3�\�̐\� \0	6��\�\�9C\� }�\�A	�\��;z\�	�\�\�1|�\�\��AH\\iTZ¨\�\n����UŐF	.ld�g\�(���\�+5\�5n�\�0Q~-L�\'L\�2{m1Jjx�p6��\���Et�|��Y\�\�\�N���s\�M,A���zd\'J$u�xd/\�h\�e\�)��I�7��,$�D�,�m 𸜾�\�\"\�O\�\��s]�4\�\rȞ�\"�I\�p�\�\��\�\�x����	l\r��c�	\�08�tOAm\�\����l\�Ӷ\"�\�\�\�ބJ!���Et)��\�4���\�W\���2J\�L��7�\�Tވ\�r��\�9�\�N\n�&+���pH�Erp;PNq�S�R�\�\�(����鄟��gz\r2k��4�K\�H��\�E(}it\�\���w1幡�\�Y\�\'\�\�>@t�<2\�L�L�S,\�ө�q\�Ydc�F�b��$r4\�IQ�y�\���\�p�<0\�`0t\�\�\�\�\�\�e��E�C\�Q-풊�cb\�u\�:�M�	,J�\�A	&\0����ۏ%\�څ�������b�f�ZK�\�B\�\r\��U����\�C�g��1�Q~�d]8%\�DyK\�Z\�(o#�D\�{�\�.�\�>�fJS$K�ˢɟ�:��\�\n֛�6:\�;\r\�\��K\�\�M�i���FG��ŉr�\�U0�LN��!�	/G�\�`QH��� F��ƾ�2+oK(e,�\�oquo&on=��,#��->�u/vֱ\��a\�3�]_S\�Z*�\�A7�3B=jx:���Iѩ����F%\�\r�_L�wJBp�\�\�^���\�1(�\�^#[�,\�\�{���\Z\�W��U\Z��\�;E\�+f\�(*\'{V��T��y�:N�`˓U�x�\0\�Cxǆ�\�\�}���\"껽P�\r�;�\�\�{�s*_�Lt��$��i�>Hj�C=��yv\��:�\��\�n\�\�\�\ZF��.8Ð/�\�`Q��At�\�\������Б]:4v�5�o7��Y�J�j*K�D�\�al턵S�\�\��3����\���N�7&-\\=��)�\�n2�1e9\�\�d@��D{#���\0\�=1Hz\"�c�-�\��\'!R3} %WaD�\�ȴ\�@�)�Z�0dQ(�SФfД���\�*T��V�56��$6�@\��S/Yp~\�Kh��E\�d�\�;���	\�\�硣\\�(&؊	\Z�b\�)o\�B>\�<\"��gi\"Q�Ur=oR!���P��\�oqu;N\�6\��\�ZYL@J\�\��o\�\��<��~�y��\�I\�<�\����w\��\��d)\�P©����B[�@g3�3��ۙL\�#��y���JO\�\��d:\�O�$,��RF`�p%V��\n�h�dA9��\�2\��dϼL�S�	\�\�yF��	����\�y,<x\�3�h�\�#�\�\�\��L��@�r2Ge�ªa���DoB\�\��9\�~7�d�\�7텃�\�\�\�\�ޏw\0}��\�\n}W��f\�5�h!�)h]d�@e�\n�P��њ�Ys��!Dk�6��,h�ˤ�d�Bmt*�\�d��\��Mv2��\�Lv\�\��4�\�X�JQ��9�+�r&\�2���\�V$\�\�\'\�ҭ�\��9Ex��\Z\'\�Q^��[[��e��wmd\�hM�b��(Yp\Z\���\�\���OC=\�0��z�`� �p{\��\n�*	*\��\�)g弩��\�\�NX�I\�~��Қ:2a�F` \�d$�\�4Ax�U\"P\�q��6Jsm�s�(\�a��ta5�\�7\�>�\�~�?��;\�83ό�F��\nFM%X�\�nzRO�|�\���\�N�\�\�`q�i��\0=\��G,<�\��`�ӂ�Ȓ�(\�B�OUp��:�\�$Y�T��@����Ox\�\�\�-�-	�\�\�\�c�P(Q۠�\�`߄k\�\0��M4F&\�L\�\�q�\�Ո\� It$\��\0\�g�q�\�N_\�џ��\�[uvh4\�h#c\��]�\r:�\�6#��\�\�t���Ix\�\�<�Z^C)��Tсv�-]G7̢>_{G�n��\�\�\�o9bw+���\�G�w;\�ǐ!z?\�c\��8��\�ck~�t\��\��\�\r�5�Zkz7�\�](T\Zi��FrM*;}��3����\�B�\��\�ښZ \�f\�\�9���tކ4�\�Shg\�e@���ch�ʡ�I��ҫ�\��\�8Q&:���+#�J)�E�z�te\�;�\�V�\n\�E�l��\"�\��\�w�\�\�\�\��\�=\�I�\�2�x\�ZKiC�G]~\�x��\�\�{��\�~�\��>|q����؞�aĮ��I���8S\�d�������\�J��\�\�%$�tY�`?M\�;]!#���u\�yY>\�mN\���.\�\\Hk�E�X@OX@y��Q�\�\�\"x�(ѯ��q�\�*m��\�\�G�!�\�C4�4\�\�]a�̬R^\�\�X>�\����\�\�\r�Bi��ˏ\�\��Xf���\�\�\�@\�\�B˛fL,����\0�rjU�P��g�W�#\�]�˕,\�f�,\�¾h::;\rL��z��~�Go�Mod�0����\�N��\�\�W\�m]\��\��\\�g�!�\0%t��v!HVA�+�\�!�dE\�&��l�em⽰uL\�u�T�V%\�\�p͉Q(�bʱԩY\���#]r\�\�@�f�P\�\���p$\r��[S3:\�Ubf*Q\r�\��2a�\�\�\n\�n\�\��t���b���~��^O\�Fy�S�ɖ�NE\"x��L\�%u\�\ZY�@8-Z\�\�s��K\�F\�a\�\����K��\�����͗�\�\�}��9���K�e5�\r\Z\�\����k�<\��#CU�D\�A�%\�1Ŋ@qR<d&k��\�\n(�Ed�ӂ\�81h��5\�\�\�L�\'�ADH1\�\�Nr�\�\�\\v���S#\�]),��\n\�{�(7�(�[�pF�И^�aq�;\�x#&PEoT\�\�M3>�g\�\�2L3LƼQJg\�\�ef�\��d�\0+\���lw�7C�\�\�혥V�\�!�5J�\"\�uaz��>���\��\�\�e��r\�\�e�\�(\�h�\�ۥ#ә\�cTS�-��\���\Z\�\rzJq�mf����II7 �E!\�9\�X�Qc	����5P\��8c\\G\�sf!`� \�7Gg\�\�,LMم���\�\�\"��p\�(�c�\r���\Z��,�\"�\�Sd=�@^\�f~n\�\���d�^�Px�\"�\�R2W�TROv�l\�r���Z&\�z^5�\�ZXB)�r.\';r�2��\0b)���N�cr�O\�	\��M�4=��\�\��׿���o>�/?��g�Wq8B\�\�\nG����	z�$\��\�hKkS(��Uk\Z(�d`�^	��\0�H���\�+�\�+(#C�qNF+�\��	S��j\�+?��{R�\�RZ��K	VzC�ߟ�\�1ha���|�\�2�w	\�O\�\�Ƚ7��[a\�p0tD��Z��L@K�\�<{-e�\�F�蹋\�40��_�z0�����>\�0��F\�xq�\'-�0\�XV�	\�](9�\�.v\�O`\�\�S\�Ot;]�T+\Z�{\�\�<�=�X\\p\�3:��a��V�j�@\�0�\�\�q\�\���\�F�I{���e�\�\��8i\r.\�\�R\�\���Q��\"�\�\�\����\�z[\r\�8dC)(Bd<�YMjM_�\�\�\�=5��N�9���iT\0jM\�<\��Y1�\�ռfm�\�B��\�6ʰ&M���)��\�\�	�R,��`�\�\��J�י�O��\n\�\�\�)eL�dB&C�$�\�Ŕ�\��i�D���g+oB���\�y1\���\��\�#����\�?_���[{9,Gd�&�(jЭj���a�\�\�a\�-��\��I=}��*��xn\'�\�	O\'<�WPQ��R*\�Ҕ\��3=�\�)2� ���[F��\�^P��\\I?(\�_U�\��$����|��W�}xڍMT\�h�\�\�̓\�2h\�E�m��]\Z�BL��,\�Fh�G�d�v�^f�h]�nb\�\�s�\�c`�3]\�:Pm\r³{ֵ]�B�\�\�!tt�so��6�\Z����N&[��.z8���3_\�\�G\��\�\��\�\�$\�q�\n\�;\�|�T!�}�_/���J[\�0�ET6%RbklL�\\Jp��n\�\�Oy��\�p\"\�Ρ)4\ni��eD�g�r;C	�\'\���̦\�y+S�f2��\�W�\�@\�\�2B\�gZ&rj\�����Ў�`B(o��U�Vq\ZT�hQ\�҄\�F5�YR�mp�􈍝�Qr]���\\��ТZIFTv@6R�\�B�l��ŊF�\�-���\�22���~��\�}�\�\�\�_�o\�>���R�N�U�00�;ZZ2ؐq[p~5�ѥ��@!��y\�\����* xN�g�\\��~\�k\"%d\'�\��\Z�\Z%�\�\�Qb�|]�%�\�SeR�����%�-�o\��c壏1�\�;�\�!\0�fQ\��u\��b�nQ�\'a\�\�ESf\r�q\��24\�]{\�\�>�y�;\�i��l@7�\0�\�\nYǃB��L\�Dk�gqν�h&x\rc+�\\��\��\��]\��\�\� �\�\�\�B�\��ˉ�[��\�\�$��t\���Z\�;a\�w\�\�e�\�\�{7�\�E\�&\�L�.k��\���Y/�OG�L8\�\�(\Z\�ֵ��\� U8M�Bc����Gs`��\0\��d45\�7E&	D�\�1Η!�\\SbU\��<PU\�14���>��\�\�A\�\�2�*\'h32\�d?�o_\0\'B�8B\n�	?<�~8\�q\�\�e��\�	up�ވ��.�\�1\�o`\0�a#2�(\�-�\��\����\�7\�\�\�\�\��\0߹p���Wd�O�Ͽ~?�&\�\�a>J\�*G�T�RA�B�ۀt_/\�\�aj{�6\'\�wSJN�ބ�\�G���\�_��*D=A*ij\�\�P+5�<oȊB�+\�!\���\�~�&�W4��\�65�KdNN_K`��6�K����+L<}�\��G螠w\�`\�\�C/K\":\��`�_�*\�TȔ�\n�S�`Xڀ�\��\�#t\�\�0��\�x\�B;2\r\��:d.\nh)J\Z�!�\�\�x�[�i�\�,Z�S��q��0p\��\�\0�\�~쬎\"\�s\�G!\n�	@�C^�(�E\��3�(��c���X\��\�Bo������o>�:8)\�j��\��B\�B\�\�>��\��\'��\�\�$�@	n\��(Yl�)�L��~�5+�YN��\n\�\�g*2\�H�l8\nE:�\�\�<d�\"\�\�􀊈\0\Z\�\n�&��C\�Cb2��J+zѲ2�8q\"�A��+�\"�\�A_\���q\�c�\�߅P��H܇xҏT<�h\��\�FyA\"^۱07�?��>|\�����{x�\�+\��7�\\\��\�&��\�#�\�\�F�q4\�C��7\\*G�L�T\n�\\��N�q���\�u,.\�\�ƃMl-\��\�\n�\�\�γkx��m?���\�>��14\�\�\�!�ܿv���w���;W��>\�O5��\�\��\n�qao�k9Lg��rc�,\�0w\�{�O�B=8\�\�w�{��!�\�]�w�`\�\\��`/�๱?	�\"=��\Zʔ��\�\�\�X\\\�6G�n�A\�\��g�\�Êvr	ƉEȺ=(�w��\�F�`8Y$C���3��\�\�0xp��\�K�2UZ�Vܽ�2\�\0�9�8A\��N\�c��{1\�p�\�\�PB?\��������6�3\�G�	�:�v\�{<����\r���èbA��S��\� �\'<\"�F!g�h�D��2��3T\�\�53L��\����\�	2U*\r5\�N6<%ӱ\0�j�S\0�\��I97�P/:%iT���Z\�\rћY�na�\'F\�Cȍ�\"=C<�+f�6`�~�8\�F�\�86���\\���\�$��#N\�$�\��	\�ad��n�L:�hz\�\��x\�\ZFz�׏��|�\�=\�??\�\�\�ss\rZdh\�\r0\�[;�H�c�\�>|�}�bvz�,ٱ \�.l\�\�\��n_\��\�󈬞�ut��\r�n\��wn\�g/oࣇxt~;ߣ\�\�h\Z�\��x��\�^\�\�\�3S8Z`\��0\�\�\�\�K\�g\�X�vѳo }�.�w x|5�8Ss\�>��&@i\�\�5��s,唜 }Q4\�\�6�v.ò�\r\�\�|�t�+7\�\�*�[��\�\�G�h\�\'\�\��\��\�ͷP	\���+y	8��}\'\�\�[o\�\�E$#D��	@R^/b,\\a���,\n\�xh�$�(���,�\�,�nNT\�4�)��A(zc[�\�´:�F�7G�� \�MCNFV\��*�\"�\nP�\rÂ\�@\�f\���~X�\�K�\0�r\�(���X\"ڌ��\�j���u�|�Q-�C\���FTT\������\�t�DG\0\�Lg01\�\�\�(\�\�8x�]^l�\�n��)�s8�\�ܺ����s�,\�7�K\r�\r\�H�\�\�,��\�\�\�(���6�\�n\�Z;\�zt����\��\�8��\� /�����F���\�eg\�\�Y\�L\�\��E2\�\�H\r1Z�\�r!�i��\'ְr\�	\�}�+\��ٟ0wpٕ},m\�\�\��&\��6\�\�_�\�\�9,Mf1?>�\\\"��t\�\�\�\�\�bYQ��,NF2Y��|o��%Ʈ݆�!�9��\�ի�r���+�\�wp\��5��e\�g�\�\�R\���&\�i��\�,[�0����0p\�:|o�\�\Z���\�;\�\0�%�\�D��MS�\�껇	�(�\�3�\�A��!�˛0v��;xp\�+SYd\"!$B>�D��C^$�dC~�cx�GIv\��\rX\�|�^�X�����A\�\�\�d\�X���\�\�&���)4��T�\�OFt\��SC(M8\��\�ư!��,<�\��\��/\�of	\n.W�&!�*Pګ�TR^K\�m(밠��;\�aee��v�l\�\�F�ކ�.��^T2��j\�q\��^\�\�\�\�\�\�o\�\��Oq��.v\�\�\�\�sعz�\�\�l��\�;8s\�:v�\��\�E$&H�cvy\�\\Cvqz�NG/\"cK��\�+\\x�\�\�?\��W\�\��\�uL/� I*�\�E8��\�3\�t�\"��?\�M��\��8s�\"\��v������-�f�1�����3��L/ �����2�\�\�\�a�iw\r\�\�E�\�\��\r#*Z�1���cdZM$ɨ4�1\�\��E&ij3b\�\�e�����o�{q�\�Ex\� r\�.:�\�P\����f&�5\�\�-��\�f �ӈ���\�7a&ә�.\�Ȟ��p\�\�}a��eQat�쐊\�\�bZ�����Qa`R\�=���u÷��NK�<���/�\�xg�\�R1ڠ/RQ/rQ*�=@&Ej0��\�?�\�.z\�\�E�\�\�B�\'�f2�\�M\�\�J=!�\0A4@O\�`\"�Z)\�i���h �əd\�,\�\�\r���\�me�hJ\���@2�]�(�����(ӘQ\�JO\�j \�D���W\�j\�w\���-π�\�\�\�Űk\�	k\�D~�ˮ��\�0yG\�\��#�Co�7xd:R��F��F�\�\�D�ݏNN\�\�\�\�6���\�2�GF\��\ZC0�Afj	�\���Kߛ��\�)23\�u\�&\�?����\�_?\�\���q\�\��\��\�\��\�c\�\�\�\�l��%D\�f	�Ix\�\Z}#Y���\�\�1FaF\�atC\���B���N^H�Յ�\� \�\��h\'vz=~2�5��a(;�Sh\�\�\n���\�\�eX&\�	��0���\�я\�uX��e\0\�/oA\�t\��\�@\�K(G��5V\�\\��d�K�����!\�\�\�\�0=fP\�k&\ZG\�\�&�s��w��\��\�za�\�F�\���\�bp��#�I��\�Gp�\�l\�`v,�\�\�0�a\�\�\�ώ11�\�H��F��4\�\�]�zmp����P�%�tPj>�$�[��\�B��M��ɸ�\�\�\�*i��\�q&\�,j�]\�2t�C\��%b\��\Z�6\"��e���k6B��+S��]�T�-�\�rR[Q\�\���q:�X�u��Ã\�N/= �\�6�}�)�=C\��\\b\�\�,L�\�\��\�wL�4ܔ>�p�7�%��nd\�\���y�]�H6\ZRG0Jَ!L\� �h��&r�\�\��O!9y��\�\�q\�\�d)y�\�\r�^��\�\��\�YL힧�^�\'�b���\�\�\�\�I�����@cB�5\0�c�\�A\�M��� \�BA_��\�\���\�\�\�\��u�\�\�q\�@\0Zz\�\���h$�2AƋ�7��\�>�\�\�{�0���WљYF\�\��,�1�`MbX����\�ӑ�y��d@Q�XF�\�.�97\�ɔ{覌�\�w\�\�\�m[g\�>�\r�I�5ypf,7\�Q�\��0P\�9\0Cf\�\�·�����Β���\�~zw�\�\�pg��̌e�\"�K%0��eS�*_�#!����\����L��Ye�X��5��~�R,c�f��g*�H��\�z%�x\�R�m𣊲^i�͉bz�\"\�_c�\r\�-�\�v+*Z�P�\�&	�\�^�7�9w�DoAY��׹�ً\�\�^�ևJ�\�~%dɒ+N~�\r�Y�Csg\�\�L�=��\�E\Zjʤ{v��5\�\��Ef�Y\�\�@n��-xG�0H��O/\�\�`pf\�M8\�Ǘ\�\�\�b�\�}(���\�\�7?\�ዏ�w�=l\\{�\�7`\��L�{�\�\�b�`\�\�\Z\��/a����_C�R;H �rS0�t-ftYoj1\��Po�D\�M@Y!\�\�ի͜D��\�\�KՄ\n\��_�CyC\�zD\�\�²*�Kڰ��L�x\�\�>\��w-\�Z�	/,�#�:��j�w\��\�g���_G3eH6�\�\��bh\�\�C\�}�VSn\�Fh#:\�hAJ{\��,jXP�\�r\��}\�\�d\�\Z�-s�\�1�cnm�3���\�%��˧�佇x�\�\n\�\�\��\�,�ǒX���g�\�\�0���1,&c�\�z\�\�F\�ˣ�n\�d��X�y8�I:�d\Z\��x\�D��\�\�\�9��\�\�xε�A�Q6EM�\�JZ����\Z\�\�Ҫ\�d�5�� +\'\�[�6���\�B���^�#@(:1��!	P\r\�NȰ\�Z3CJ7N\��-���;\\\�K\\}�.>�\Z{�o=�w?�,�q\�\�SL\�]Gv\�)�\�\���8\r&�`KO�̒���Q� �\�a\�5���\�\� C��aIk�08MA\�ڜ�g	�Rt�N��B�����N�j$(M,E%�\�&�Wp�By�Je�7%%J�^րӥ�,�\�\�\�\ZN\\VT�\�Kk�W�\\��\�\�u8Y�BA���\\\��zY5����R~�\�ϱ�\�{������etĖ�\�4\�rJW]\'o�\�i N	^����\��H�KL���\�4����\rt.m\�vx��}�\�{t\��1�ɤ�V�/�\�\�9J�\'Ȥ\"�Z	� �.\\��\�|{��gg��\�O�\�\�\���;o⭧�\�W��;/Z\�E1K�\�f\\\�$\�Q,Nci6��,kl\Z-��Rz\�ʿ��S\�����VFN0J��\�	Di Mif1��(�%�բ&�2K�WLWޡ\�\'W\�|����R0��Ǯ�K	D1�����\���lX\�m\�Z�QC�֊v$�ܯ� $hO̿�.��様y��JeN��\��,�\�\�U��:3\Z��\�6f\Z\�HZ85�����L\����lӊz�\r�\��\�.H4v4���4q]�:\�]�T�ʆ6�\�q.\�\�@�~��֠�F�2�NT~-��p.Z�\�Q(�NU֡�D��r�LJpՠ����\\W^MP\�\�$����EAiU�\�ǩ�:q���\��Ze�ʥ\\V\�\��\�\�\�O?�\�\��1�\�9�/\�k�6%\�p�a4�bLnN\�1@Tu@̠)6F\�ȷ+T\�P���\ZFs&\��:��0l�ʩ��\�;)����/�ځQ���5�;\�;�\�\�\�!�N�7Y���uR��)�x�\0?�\�1>�\�1>y�\��sΫ\�7�6=��\\\�\�,��1�KaqjKS�\�\�$��\�-d�&�^\����!cx��������l>\\U\Z\��f�N2U�T��G�\�J\0�\�f\�<�i�Q!��\�\"�Q�\0˸��ۗ\�V�\�(i\�v\Z�E�M\�\r	\�⎮|X\�*\�*�+&N�\�\�\�\�w����0~�d�(4F4�\0�zHumPv�@\�\�UK\'䭝���`;\�\�\�\�J�)YJ\ZP�j�L\�A�5B�j\�\��\�F�5\Z9�\�Ew�Fu=\�+kPN0�V)8�L���U#�N\���f�R��k@1���R�ªj����+k\"�\�ɐ�|��\�z5\�\���n\�\�\�7����\�\�BcC�\�O\�S�\���!XQ�\�x)��t�ai\�b�g?\�\�ǟ`�\�;�?�\n�\�\�\�t�\�:�\�z�\�\\���\�\r�?\�ϼ2�v^l\�kzPe�~h�\�X\�4Jz�\�3QC\�A\���0I\�¶���7\�x=+{���w2a�)ٞ�}8\�(\�S\�8s�<~J�\�\�\'�\��G�\�\�u�xx���\�`�_�ca4A ��:�\��LzyM|\�H&\�|@%@/�ՉQ��0(Ci�=8I�(���V�㉶�.z:�(�ōF��I\�I\�F)&�i\�E\�0s?3�\�D\�\�\�|��m�\�#[��ޏs\��Vy��i�\0l\'+��S\�)�\�gϐz\�&^=\�\�4K�\�\��VCЩ�ж@�逼Q�ZK�\�Yk�\�-P�\�_�[� �5l�v��m�V\���\�2�\��\�\�\�o��W\��\Z(�*4H$�(��\�I\�P\'G���-���t#��ara+{ؽ|\�\�xpw^\�ƥ{ob��h��\\�sO_\�\�[��������}_�\�G���O�?|����\���3�\�?���\��\���\�;��o\�O�{�\���!>�\�\Z.<{����\��\�?C��#$\�\�\�\�ŋ\�;s\�{Pe�Q\�PS�s滢�\�ŭ1S2�^����\�mJD߉d�\Zѵmo\�\�1��\�L\�L\�g�\��o��T�h\�L���\�9z���d��M/A>���ӽ^�2\�(}�\'=\���/>x�\�^\�\�\�\'\�p�\�\nv&3X����a)7���4&\'\Z�Sh�\�\�	�\�\�\�@*\��QfC)T|(k\�㤴\r�e:�M\�\�&2�P�fq�\�\�p�ς+\�zHJg;��U�:=e�\�\�\�\����i\\\�>\�\r�\�m\Z\�X�Q��\�#1t�\��Ⱥ�x��\�gȾ�\0�\�a�\�cl���\�H;���Q-��Vل\Zy#\�Ni���\�H\�&�L*E�\\	��\ZMMX ��gA\�\�\��2~�\�y�\�W��\�8\"�f��ho�\���PJj!�T�UU\r�݄����������-\�\�\�\�\�#]?\�\�\����\�CLo-c\��>6��M0n�\�\��\�\�\��ճ�Ep�y�,?>�\'��\��1\�=�\�o\�\�\�#ܽ����t6�<�\��\�C�~�FȆ��\�:���+�\�:~=�о�\neb�\�\�Nt=f \0E2\n���6\�\\��\�󯺔b\\5w��Bk&\�\�%z�	\�\�\�\�\rƙ�\�H\�\�p\�\���K\�\�݅vq\��1�ɚn2��,\�\�\�\�\�,�=��\�>~�O>x�O_\�\�;O�\�\�\�=�ݠOP�9�\r\�(\�\�L&t\r\������y�~v�8Ȁ\�\�@\�>H�ЉS\�F�&S�\�̨1��ۆ\"�bZ&�H�L\�G#k5;Q�60|�,�?>�^�B�f��ř.��\�WL��l�2\�8\�e\"��\�d�xQ\�7	Sw3mA+�D\�\�#L}�!2\�?G\�\�CL|�;��9&>}����T\�k�V�>Y\r$fe\�QR��\�ZԊvʭ�d\�v��A�������?\�\���^zeжףQ&GmM9�\�iȪ��U�\�4\�\�\�w 4ԋHh\�X!&�(/�?�ן�ʾ@9L\�,\"5�E0B8��\�\�H>�ML�`eq[S\�ݛ�\�\�$v6���\�i}��m0�2oKO\0ۿ��\�\�ҫ��z�9\"o\�G\�\��f6�\���\�W�`X\� K-��2[Ȕ\'�\'+e�/�|\�P�˹�>\�\�2_*zG\�\�G��\�\�:�\��)\��\�8\rB>HY[�q��o�}p\�\��	�YQᕬ\��X\�C\�\��������)���[��\�\�\�x|�,��as:�5\�\�\�\�0f\�G\�IL�-6���L�g�qh�T\n��\0b*U�pR֊S�\�(R\�6�k��,Dd?گ�F\n�	8�|�\"D�\�+:��a�\��A�/�\�/R7i\���X�>f�ց+�E �/X-,-�9\�\�ў\�AK���󄓱?F\�|���\�\�̫Wy@���K\�}A&$�J%R\�(�!�7��AN\0*PUW� Q�:z�zz5A\�H��{�p�\\<\�\��\�o��\�\�᷿�\0�A�̕hk�G\r�]iU-*+�]%\Z\�\�\�Oj\r\�0R�mf\'�\��=]��l\�\��B��\��0\�\�a�;\�nu��\�\r�ǅ�\��؍pȃd<�T:�\\ԁd؅XЁpЄ6}�\�Aqm\�Q\Z�\�\�0��%\"��b���<��\�u2\��\�Ӌ��֚���9\�p2Ype\�d;K��\�\�B0\�(\'�\�Y��\�S�,�diB\�\Z�ue\����\��d��\�\�7\�g�P\�\\\�\�Z\'VВ�E�\��\�_D�\�%v��g{�ٛx\�\��|qo\�?��7�q\�\�6\�,6&��01�4P����\�E}`�);ih:�\�2��R\�T+3\�u�\Z�dZ�62����m�!W�E�j�\�Rڍ\n�Jz\�\�n1�W���5.����ގM[�\�_Y;�\�\��e\0�\�~4%��32ɴ-\�xm#�Rj�\�G6\r�u$\�\�9�ZJ�f{�[��{\�O\�\"��>�^=\�\�/>\�\�g\��\�\�g��_��\���\�\�\0�\r�\�r��\�\�\�\�r\����\���\�o\�O�}������X�\�j\�QE֫!s6\�\�\�\�*GG��6�MdH�dG#\��6tuw\\]��u�y\�\�\"Zv�B�\�n7���\\�\�\�`��˦�]�\�v!vb8\�B�\���b\�gAoo씥K�	[�\�\�RWoa\�\�c��?��L\�t��\���;{h�]#�\�0\�\�O\�{�����zP�\'[д����F\�l�\��A\�&��Đ	H97e\� w\�P�g�q�\�\�x��3\�έ�w\��\�!î\��0�\n�x��/@�\�\����Ƶ�L�W��\�e<�y�{�vp\�\�\�Ӯl\�e\�~1\�j�\�h�r(�m�\�L\�Rsu�%\�NԷ\�t��O;�]7j\�\�G]bP Fl\�o\�f�\�ma�b$R�\\%F7�Ƃ\�\nB2�\"sOABR�}�	4�H��I\\\�BE�o\�N�1+>\�Ж�Asf�I2`\�\�(\�sh]���\�!�o\�D\�\�?��\�O�LI���s|�\�\�{�^\�\�\�\�m��p\�,\�ɛK�g�>k�Ͽ����{��?�ﾻ�k\�\�x \r�\�\�i���*U-\�NLOQ2\����c|*���0ƲLp�\�D\0c)/��xƖf≅b��\�(���\�!;z\�v�\�7}�x=�\�G��H��K��\�\�d���\r�^#��\0e��2\rS�-a��×�\�\�Q*\�#��x\��{\�\"L��h��E\��\0T��\�\�	s���\�\�Zl��!Uz+\�\�2\r�gx+�?9SoA!q�Ӕ��}L��3P�.\�yp��s\�\�;O\�\�\�˔i|\��\�%�\�]\�\�\�&F\���\�Kx~���\�Yܾ��kG\�8f	;K���J\�,j+�3����\�\ZN�eȆ�d~d�b�봼\r��Z��Q\�@f���1�Qk�<\�M�r:r*R\�I{\�mFuw\Z(\��(ZĠ3�%%�%:�\�H\Z�qڋD\���\�D\Z\�#?�Q��\�\�<OQ%lMd��X�L�@\�B����\�\�)4�Ρuc��%���\�c�\�ݾ��\�{X�\���\�\�\��\�O�\������\��\�\�\�/���/��\��5���\�\��\�\��_?\��w�O\�\�\��\�H��p\�\�\�s6c}>�ﾾ�?|�\0\�����\�C|����\��\���w��x\��s�\��\�\�7������6��m\��\�#��w�\�_=ķ���o���o����s�\�U�\�\����[�\�/�q�~�\�M|��u�⫛�\��\��c\\�\��r��ͳ�\�\�gi\�\�3pml��N\�\�\�⡱x\�\�XYE\��6L[�h�Xb�H��v@�u�m\�Pf����ge4\�Ujl~zDD\�d��)ԋZ\�Ѣ\�)1�iy�=\�#�6�\��| 1�\�\�%\�y\���_yCg)\�\�ghG\�d�ܽL��z��p\�\��\�\�aoe�\�E�E\�	�I2o�a�7F������lf�N+U ף�� k�t,8d4Q=�Bׅr1\0��?0B�P.��\�)\��Q\�(T�)��Mr\"\�1��Y4Ѧ4ѿ\ZF&��\�U��\���\�D\�)z\�׌\���c�0U*	uF�Y��\�\�	p�\0\\F��<�`\�\�\�\�s\�\0֛��ݸ�ĝ;X}���޹��\�7f��\�^\�Z��v\��\���\�U\�;\�\��QwG��\��\�\�\06g\��{�1\�߉�\�0/\\�.f8O\�\�\�qܹ�\�\�\�,n_\�\�\�yܽ2�7Ȩ�\���\�2K��\�Z@(>�\�g�ֽE��x/\�\�\�kd\�\r���\��\�.>|g���O_\�\�\��������\�Gg�O\�\�/v9�\�O�<��}.��\�\�좇ĳv\0�\�q*#/dS8I\'j\r����g�\�C\Z\�V c��t\�\�\�\�B��7�d������_\Z5�$��0\Z8�&	^�\�2\����\�&ƽk5�\�\�\�Wײ�����Z���\�\�\�\�;\�7T����\�޼|�\�\�q�\�\Z\��\�,\�\��\�<|S\�h\rNCI\�U�\n<>Y�u=�Z;�(�#N�^n�:�A�+L�C\�5Y�\�LIV��EE$7\�\�#�f\�><E<\�e|Kh��\�\\��It\�2>\�WA�k�\��\��G\�x]�h%K��\��+\�i�#�\�h��\�\�D\�\"Q;?��i���y��\�\�|��\��0\�\�w�%t��M#|�p\����v\���8\�\�\��`?�G\�㸱\���!\\\�\nc:\��\�B?\�z\�y�1�\�\�B��#V�\'���b\"�G&ֆl܌l̂�pR\�v���\ni1\�d�\�1p\�\�klCx�	z\��\0\�\rqo;��.$�\�H���\n�\"9؎h��\n1��t\"1�BbP\�}�1���a\�58\����\'k�\�Eƙ`è\��\�҇R�)�޲��H\�ۘ\�\�ŗe&�\�RHDM`�~�h	&��^B\�A$\�DD�|(���YH\�[&\�2\r��JG@0�t��\�\�\��s�\"���\�u���a];\�\�|dg\�\��^\�\�n\�\��.�[ǅ�el�`�\�\��\�O�&Q	a(i�2\�\�\�SzY\�O�ז\�P�rBT�ճܾ92\�IT<��iXT/\�\�8����\�/:ja�Ӑ�\�\�ݚ(�\�J�;iz�Tu1,1�r��\�ds�^P<�h*e�15�o\��\\�z��q����\�׏J��!7�L2i\�0;\":y\�u8\0c6�\�T��.���	3�c&\�%LX\�\�01c,dB6l�צW����ޯfM\r��\�^\�p�T�n\�d�\�\�U�}��*\�te�\�\�a1\�����EW	[G\�Zʡ�)���f]\r�*X:+�-\�,�7*8\�����\\\�y\r,	z\�K`\�\�\�\�\���\�\�!�c\�M�>\�\�E�7@���)�VT\�(WFިN�D�\���\�+�\�_�)�:U�mQ�\r���8Q\���\�\�F���rxQ\��\�+aԈ*Q>?\�\���MxM4q��\�d�\�詃r�#S�\�\Z\'{0=�\nU�>Tz�\�\�\�DS!h�Q�tvx�}�b4A:Db$S4\n��\�(:��s\�c���\'-Ui�=C��\�ZNR�_�8\�Eq\'\��؍��=^&{\�k�3\\�\�m�\�\�\�9�,xv\�Z�[\�>\�z�Qg\�\��z��E\�drqcw���H��\�\�߰\�;���6V^�5��JC��\�\�\�b᮰;���A��[#\0\0\0\0IEND�B`�','image/png');
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
INSERT INTO `municipios` VALUES (1,'Sonsonate',2),(2,'San Antonio del Monte',2),(3,'Sonzacate',2),(4,'Nahulingo',2),(5,'Nahuizalco',2),(6,'Izalco',2),(7,'San Julian',2),(8,'Juayua',2),(9,'Salcoatitan',2),(10,'Armenia',2),(11,'Caluco',2),(12,'Armenia',2),(13,'Santa Catarina Masahuat',2),(14,'Santa Isabel Ishuatan',2),(15,'Santo Domingo de Guzman',2),(16,'Acajutla',2),(17,'Ahuachapan',1),(18,'Apaneca',1),(19,'Atiquizaya',1),(20,'Concepcion de Ataco',1),(21,'El Refugio',1),(22,'Guaymango',1),(23,'Jujutla',1),(24,'San Fransico Menendez',1),(25,'San Lorenzo',1),(26,'Tacuba',1),(27,'Turin',1),(28,'Candelaria de la Frontera',3),(29,'Chalchuapa',3),(30,'Coatepeque',3),(31,'El Congo',3),(32,'El Porvenir',3),(33,'Masahuat',3),(34,'Metapán',3),(35,'San Antonio Pajonal',3),(36,'San Sebastian Salitrillo',3),(37,'Santa Ana',3),(38,'Santa Rosa Guachipilin',3),(39,'Santiago de la Frontera',3),(40,'Texistepeque',3),(41,'Antiguo Cuscatlán ',4),(42,'Chiltiupán ',4),(43,'Ciudad Arce ',4),(44,'Colón ',4),(45,'Comasagua ',4),(46,'Huizúcar ',4),(47,'Jayaque ',4),(48,'Jicalapa ',4),(49,'La Libertad ',4),(50,'Santa Tecla',4),(51,'Nuevo Cuscatlán ',4),(52,'San Juan Opico ',4),(53,'Quezaltepeque ',4),(54,'Sacacoyo ',4),(55,'San José Villanueva ',4),(56,'San Matías ',4),(57,'San Pablo ',4),(58,'Tacachico ',4),(59,'Talnique ',4),(60,'Tamanique ',4),(61,'Teotepeque ',4),(62,'Tepecoyo ',4),(63,'Zaragoza',4),(64,'Agua Caliente ',5),(65,'Arcatao Azacualpa ',5),(66,'Chalatenango',5),(67,'Comalapa Citalá ',5),(68,'Concepción Quezaltepeque',5),(69,'Dulce Nombre de María',5),(70,'El Carrizal ',5),(71,'El Paraíso',5),(72,'La Laguna ',5),(73,'La Palma ',5),(74,'La Reina ',5),(75,'Las Vueltas ',5),(76,'Nueva Concepción ',5),(77,'Nueva Trinidad ',5),(78,'Nombre de Jesús ',5),(79,'Ojos de Agua ',5),(80,'Potonico ',5),(81,'San Antonio de la Cruz ',5),(82,'San Antonio Los Ranchos ',5),(83,'San Fernando ',5),(84,'San Francisco Lempa ',5),(85,'San Francisco Morazán ',5),(86,'San Ignacio ',5),(87,'San Isidro ',5),(88,'Labrador ',5),(89,'San José ',5),(90,'Cancasque ',5),(91,'San José ',5),(92,'Las Flores ',5),(93,'San Luis del Carmen ',5),(94,'San Miguel de Mercedes ',5),(95,'San Rafael Santa ',5),(96,'Rita Tejutla',5),(97,'Aguilares ',6),(98,'Apopa ',6),(99,'Ayutuxtepeque ',6),(100,'Cuscatancingo ',6),(101,'Ciudad Delgado ',6),(102,'El Paisnal ',6),(103,'Guazapa ',6),(104,'Ilopango ',6),(105,'Mejicanos ',6),(106,'Nejapa ',6),(107,'Panchimalco ',6),(108,'Rosario de Mora ',6),(109,'San Marcos ',6),(110,'San Martín S',6),(111,'an Salvador ',6),(112,'Santiago Texacuangos ',6),(113,'Santo Tomás ',6),(114,'Soyapango ',6),(115,'Tonacatepeque',6),(116,'Candelaria ',7),(117,'Cojutepeque ',7),(118,'El Carmen ',7),(119,'El Rosario Monte ',7),(120,'San Juan Oratorio de Concepción ',7),(121,'San Bartolomé Perulapía ',7),(122,'San Cristóbal ',7),(123,'San José Guayabal ',7),(124,'San Pedro Perulapán ',7),(125,'San Rafael Cedros ',7),(126,'San Ramón ',7),(127,'Santa Cruz Analquito ',7),(128,'Santa Cruz ',7),(129,'Michapa ',7),(130,'Suchitoto ',7),(131,'Tenancingo',7),(132,'Cuyultitán ',8),(133,'El Rosario ',8),(134,'Jerusalén ',8),(135,'Mercedes ',8),(136,'La Ceiba ',8),(137,'Olocuilta ',8),(138,'Paraíso de Osorio ',8),(139,'San Antonio Masahuat ',8),(140,'San Emigdio ',8),(141,'San Francisco ',8),(142,'Chinameca ',8),(143,'San Juan Nonualco ',8),(144,'San Juan Talpa ',8),(145,'San Juan Tepezontes ',8),(146,'San Luis Talpa ',8),(147,'San Luis La Herradura ',8),(148,'San Miguel Tepezontes ',8),(149,'San Pedro Masahuat ',8),(150,'San Pedro Nonualco ',8),(151,'San Rafael Obrajuelo ',8),(152,'Santa María Ostuma ',8),(153,'Santiago Nonualco ',8),(154,'Tapalhuaca ',8),(155,'Zacatecoluca',8),(156,'Apastepeque ',9),(157,'Guadalupe ',9),(158,'San Cayetano Istepeque ',9),(159,'San Esteban Catarina ',9),(160,'San Ildefonso ',9),(161,'San Lorenzo ',9),(162,'San Sebastián ',9),(163,'San Vicente ',9),(164,'Santa Clara ',9),(165,'Santo Domingo ',9),(166,'Tecoluca ',9),(167,'Tepetitán ',9),(168,'Verapaz',9),(169,'Alegría ',10),(170,'Berlín ',10),(171,'California ',10),(172,'Concepción Batres ',10),(173,'El Triunfo ',10),(174,'Ereguayquín ',10),(175,'Estanzuelas ',10),(176,'Jiquilisco ',10),(177,'Jucuapa ',10),(178,'Jucuarán ',10),(179,'Mercedes Umaña ',10),(180,'Nueva Granada ',10),(181,'Ozatlán ',10),(182,'Puerto El Triunfo ',10),(183,'San Agustín ',10),(184,'San Buenaventura ',10),(185,'San Dionisio ',10),(186,'San Francisco Javier ',10),(187,'Santa Elena ',10),(188,'Santa María ',10),(189,'Santiago de María ',10),(190,'Tecapán ',10),(191,'Usulután',10),(192,'Carolina ',11),(193,'Chapeltique ',11),(194,'Chinameca ',11),(195,'Chirilagua ',11),(196,'Ciudad Barrios ',11),(197,'Comacarán ',11),(198,'El Tránsito ',11),(199,'Lolotique ',11),(200,'Moncagua ',11),(201,'Nueva Guadalupe ',11),(202,'Nuevo Edén de San Juan ',11),(203,'Quelepa ',11),(204,'San Antonio del Mosco ',11),(205,'San Gerardo ',11),(206,'San Jorge ',11),(207,'San Luis de la Reina ',11),(208,'San Miguel San Rafael Oriente ',11),(209,'Sesori ',11),(210,'Uluazapa',11),(211,'Arambala ',12),(212,'Cacaopera',12),(213,'Chilanga ',12),(214,'Corinto ',12),(215,'Delicias de Concepción ',12),(216,'El Divisadero ',12),(217,'El Rosario ',12),(218,'Gualococti ',12),(219,'Guatajiagua ',12),(220,'Joateca ',12),(221,'Jocoaitique ',12),(222,'Jocoro ',12),(223,'Lolotiquillo ',12),(224,'Meanguera ',12),(225,'Osicala ',12),(226,'Perquín ',12),(227,'San Carlos ',12),(228,'San Fernando ',12),(229,'San Francisco Gotera ',12),(230,'San Isidro ',12),(231,'San Simón ',12),(232,'Sensembra ',12),(233,'Sociedad ',12),(234,'Torola ',12),(235,'Yamabal ',12),(236,'Yoloaiquín',12),(237,'Cinquera ',14),(238,'Dolores ',14),(239,'Guacotecti ',14),(240,'Ilobasco ',14),(241,'Jutiapa ',14),(242,'San Isidro ',14),(243,'Sensuntepeque ',14),(244,'Tejutepeque ',14),(245,'Victoria',14),(246,'Anamorós ',13),(247,'Bolivar ',13),(248,'Concepción de Oriente ',13),(249,'Conchagua ',13),(250,'El Carmen ',13),(251,'El Sauce ',13),(252,'Intipucá ',13),(253,'La Unión ',13),(254,'Lislique ',13),(255,'Meanguera del Golfo ',13),(256,'Nueva Esparta ',13),(257,'Pasaquina ',13),(258,'Polorós ',13),(259,'San Alejo ',13),(260,'San José ',13),(261,'Santa Rosa de Lima ',13),(262,'Yayantique ',13),(263,'Yucuaiquín',13);
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
INSERT INTO `pacientes` VALUES (3,'Kevin','Geovanni',4,'Pleitez','Quiñonez','M','2017-06-05','2017-06-05 21:50:10','11111111-1','pleitez93adadad','2323233','Col Santa Marta',3,1.80,43,'Soltero',1.70,'Estudiante','242424','Loida'),(4,'Erick','Balmore',5,'Galdamez','Salazar','M','1995-07-13','2017-06-08 15:57:33','32323242-4','erick95@gmail','23232323','Col Alguna',3,1.70,44,'Casado',120.00,'Estudiante','765565','Adriana '),(5,'dadad','adad',6,'dadad','dada','M','2017-06-08','2017-06-09 01:19:48','23232323-2','ksldksldk','22323','s;sd;sdk',5,2.30,103,'Soltero',1.20,'sldsds','kaldkaldk','s;skdsldk'),(6,'Beatriz','Adriana',4,'Martinez','Moreno','F','1994-11-08','2017-06-09 01:19:48','09674534-2','ssd','848','cdcdczdv<d',2,1.65,56,'Soltero',1.66,'Estudiante','98979','ERick :v');
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
