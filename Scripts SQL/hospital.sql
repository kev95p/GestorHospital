-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
  `fechaCita` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCita`),
  KEY `fk_citas_pacientes1_idx` (`idPaciente`),
  KEY `fk_citas_medicos1_idx` (`idMedico`),
  CONSTRAINT `fk_citas_medicos1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_consultas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapan'),(2,'Sonsonate'),(3,'Santa Ana'),(4,'La Libertad'),(5,'Chalatenango'),(6,'San Salvador'),(7,'Cuscatlan'),(8,'La Paz'),(9,'San Vicente'),(10,'Usulutan'),(11,'San Miguel'),(12,'Morazan'),(13,'La Union');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
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
  `fechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idMunicipio` int(11) NOT NULL,
  `Residencia` text NOT NULL,
  `DUI` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `DUI` (`DUI`),
  KEY `idMunicipio` (`idMunicipio`),
  CONSTRAINT `fk_empleados_municipio` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (4,'juan ','alan','perez','nada','2017-05-18 15:47:09',12,'col alguna','232','wewew','23232'),(9,'Kevin','Geovanni','Pleitez','Geovanni','2017-05-22 11:46:09',1,'col Santa Marta','12345678-9','pleitez@gmail','12345');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad_medico`
--

DROP TABLE IF EXISTS `especialidad_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidad_medico` (
  `idespecialidad_medico` int(11) NOT NULL AUTO_INCREMENT,
  `idMedico` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  PRIMARY KEY (`idespecialidad_medico`),
  KEY `fk_especialidad_medico_medicos1_idx` (`idMedico`),
  KEY `fk_especialidad_medico_especialidades1_idx` (`idEspecialidad`),
  CONSTRAINT `fk_especialidad_medico_especialidades1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_especialidad_medico_medicos1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_medico`
--

LOCK TABLES `especialidad_medico` WRITE;
/*!40000 ALTER TABLE `especialidad_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad_medico` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_perfiles`
--

DROP TABLE IF EXISTS `imagenes_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes_perfiles` (
  `idimagenes_perfiles` int(11) NOT NULL AUTO_INCREMENT,
  `imagenes_perfilescol` tinyblob NOT NULL,
  PRIMARY KEY (`idimagenes_perfiles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_perfiles`
--

LOCK TABLES `imagenes_perfiles` WRITE;
/*!40000 ALTER TABLE `imagenes_perfiles` DISABLE KEYS */;
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
  `idEnfermero` int(11) NOT NULL,
  `numeroHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`idIngresado`),
  KEY `fk_Ingresados_pacientes1_idx` (`idPaciente`),
  KEY `fk_Ingresados_medicos1_idx` (`idMedico`),
  CONSTRAINT `fk_Ingresados_medicos1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingresados_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresados`
--

LOCK TABLES `ingresados` WRITE;
/*!40000 ALTER TABLE `ingresados` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Sonsonate',2),(2,'San Antonio del Monte',2),(3,'Sonzacate',2),(4,'Nahulingo',2),(5,'Nahuizalco',2),(6,'Izalco',2),(7,'San Julian',2),(8,'Juayua',2),(9,'Salcoatitan',2),(10,'Armenia',2),(11,'Caluco',2),(12,'Armenia',2),(13,'Santa Catarina Masahuat',2),(14,'Santa Isabel Ishuatan',2),(15,'Santo Domingo de Guzman',2),(16,'Acajutla',2),(17,'Ahuachapan',1),(18,'Apaneca',1),(19,'Atiquizaya',1),(20,'Concepcion de Ataco',1),(21,'El Refugio',1),(22,'Guaymango',1),(23,'Jujutla',1),(24,'San Fransico Menendez',1),(25,'San Lorenzo',1),(26,'Tacuba',1),(27,'Turin',1),(28,'Candelaria de la Frontera',3),(29,'Chalchuapa',3),(30,'Coatepeque',3),(31,'El Congo',3),(32,'El Porvenir',3),(33,'Masahuat',3),(34,'Metapán',3),(35,'San Antonio Pajonal',3),(36,'San Sebastian Salitrillo',3),(37,'Santa Ana',3),(38,'Santa Rosa Guachipilin',3),(39,'Santiago de la Frontera',3),(40,'Texistepeque',3);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes` (
  `idpaciente` int(11) NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(45) NOT NULL,
  `segundoNombre` varchar(45) NOT NULL,
  `primerApellido` varchar(45) NOT NULL,
  `segundoApellido` varchar(45) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `fechanac` datetime NOT NULL,
  `fecharegistro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DUI` varchar(10) DEFAULT NULL,
  `idPaciente_Detalles` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `residencia` tinytext NOT NULL,
  `idMunicipio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpaciente`),
  KEY `fk_pacientes_pacientes_detalles1_idx` (`idPaciente_Detalles`),
  KEY `idMunicipio` (`idMunicipio`),
  CONSTRAINT `fk_pacientes_municpio` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacientes_pacientes_detalles1` FOREIGN KEY (`idPaciente_Detalles`) REFERENCES `pacientes_detalles` (`idPaciente_detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes_detalles`
--

DROP TABLE IF EXISTS `pacientes_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacientes_detalles` (
  `idPaciente_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `peso` decimal(3,2) NOT NULL,
  `altura` decimal(3,2) NOT NULL,
  `tipo_de_sangre` varchar(10) DEFAULT NULL,
  `alergias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPaciente_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes_detalles`
--

LOCK TABLES `pacientes_detalles` WRITE;
/*!40000 ALTER TABLE `pacientes_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes_detalles` ENABLE KEYS */;
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
  CONSTRAINT `fk_recetas_medicas_pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_usuarios_empleados` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
/*!50001 VIEW `vistausuarios` AS select `usuarios`.`idUsuario` AS `ID`,`usuarios`.`usuario` AS `usuario`,date_format(`usuarios`.`fechaCreacion`,'%m-%d-%Y') AS `Creacion`,`roles`.`Rol` AS `rol` from (`usuarios` join `roles` on((`usuarios`.`idrol` = `roles`.`idRol`))) */;
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

-- Dump completed on 2017-05-23 21:56:20
