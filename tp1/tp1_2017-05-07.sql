# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.34)
# Database: tp1
# Generation Time: 2017-05-07 19:57:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Arbitro
# ------------------------------------------------------------

LOCK TABLES `Arbitro` WRITE;
/*!40000 ALTER TABLE `Arbitro` DISABLE KEYS */;

INSERT INTO `Arbitro` (`numeroDePlaca`, `nombre`, `apellido`, `nombreDePais`, `nivelDeGraduacion`)
VALUES
	(1,'Juan','Perez','Argentina',6),
	(2,'Juan','Perez','Brasil',6),
	(3,'Juan','Perez','Paraguay',6),
	(4,'Juan','Perez','Uruguay',6),
	(5,'Juan','Perez','Chile',6),
	(6,'Juan','Perez','Argentina',6),
	(7,'Juan','Perez','Brasil',6),
	(8,'Juan','Perez','Paraguay',6),
	(9,'Juan','Perez','Uruguay',6),
	(10,'Juan','Perez','Chile',6),
	(11,'Juan','Perez','Argentina',6),
	(12,'Juan','Perez','Brasil',6),
	(13,'Juan','Perez','Paraguay',6),
	(14,'Juan','Perez','Uruguay',6),
	(15,'Juan','Perez','Chile',6),
	(16,'Juan','Perez','Argentina',6),
	(17,'Juan','Perez','Brasil',6),
	(18,'Juan','Perez','Paraguay',6),
	(19,'Juan','Perez','Uruguay',6),
	(20,'Juan','Perez','Chile',6),
	(21,'Juan','Perez','Argentina',6),
	(22,'Juan','Perez','Brasil',6),
	(23,'Juan','Perez','Paraguay',6),
	(24,'Juan','Perez','Uruguay',6),
	(25,'Juan','Perez','Chile',6),
	(26,'Juan','Perez','Argentina',6),
	(27,'Juan','Perez','Brasil',6),
	(28,'Juan','Perez','Paraguay',6),
	(29,'Juan','Perez','Uruguay',6),
	(30,'Juan','Perez','Chile',6);

/*!40000 ALTER TABLE `Arbitro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ArbitroCentral
# ------------------------------------------------------------

LOCK TABLES `ArbitroCentral` WRITE;
/*!40000 ALTER TABLE `ArbitroCentral` DISABLE KEYS */;

INSERT INTO `ArbitroCentral` (`numeroDePlaca`, `numeroDeRing`)
VALUES
	(6,1),
	(7,2),
	(8,3),
	(9,4),
	(10,5);

/*!40000 ALTER TABLE `ArbitroCentral` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Categoria
# ------------------------------------------------------------

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;

INSERT INTO `Categoria` (`id`, `numeroDeRing`, `genero`, `nombreDeEdad`)
VALUES
	(1,1,'M','Adultos'),
	(2,1,'F','Adultos'),
	(3,2,'M','Juveniles'),
	(4,3,'F','Juveniles'),
	(5,4,'M','Adultos'),
	(6,5,'F','Adultos');

/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CategoriaGrupal
# ------------------------------------------------------------

LOCK TABLES `CategoriaGrupal` WRITE;
/*!40000 ALTER TABLE `CategoriaGrupal` DISABLE KEYS */;

INSERT INTO `CategoriaGrupal` (`idCategoria`, `nombreDeModalidad`, `nombrePrimerPuesto`, `nombreSegundoPuesto`, `nombreTercerPuesto`)
VALUES
	(1,'Combate Por Equipos','Hambursecta','Milasecta','Pizzasecta');

/*!40000 ALTER TABLE `CategoriaGrupal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CategoriaIndividual
# ------------------------------------------------------------

LOCK TABLES `CategoriaIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaIndividual` DISABLE KEYS */;

INSERT INTO `CategoriaIndividual` (`idCategoria`, `nombreDeModalidad`, `nivelDeGraduacion`, `nombreDePeso`, `dniPrimerPuesto`, `dniSegundoPuesto`, `dniTercerPuesto`)
VALUES
	(2,'Combate',3,'Flacos',1,2,3),
	(3,'Formas',4,NULL,NULL,NULL,NULL),
	(4,'Rotura de Potencia',5,NULL,7,8,9),
	(5,'Salto',2,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `CategoriaIndividual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Coach
# ------------------------------------------------------------

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;

INSERT INTO `Coach` (`dni`)
VALUES
	(1),
	(6),
	(11),
	(16),
	(21);

/*!40000 ALTER TABLE `Coach` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CompetenciaIndividual
# ------------------------------------------------------------

LOCK TABLES `CompetenciaIndividual` WRITE;
/*!40000 ALTER TABLE `CompetenciaIndividual` DISABLE KEYS */;

INSERT INTO `CompetenciaIndividual` (`nombre`, `tipo`)
VALUES
	('Combate','Combate'),
	('Formas','Formas'),
	('Rotura de Potencia','Rotura de Potencia'),
	('Salto','Salto');

/*!40000 ALTER TABLE `CompetenciaIndividual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CompetenciaPorEquipos
# ------------------------------------------------------------

LOCK TABLES `CompetenciaPorEquipos` WRITE;
/*!40000 ALTER TABLE `CompetenciaPorEquipos` DISABLE KEYS */;

INSERT INTO `CompetenciaPorEquipos` (`nombre`)
VALUES
	('Combate Por Equipos');

/*!40000 ALTER TABLE `CompetenciaPorEquipos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Competidor
# ------------------------------------------------------------

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;

INSERT INTO `Competidor` (`dni`, `peso`, `fechaDeNacimiento`, `suplente`, `titular`, `sexo`)
VALUES
	(1,50,'2017-05-04',NULL,'Hambursecta','M'),
	(2,50,'2017-05-04',NULL,'Hambursecta','M'),
	(3,50,'2017-05-04',NULL,'Hambursecta','M'),
	(4,50,'2017-05-04',NULL,'Hambursecta','M'),
	(5,50,'2017-05-04',NULL,'Hambursecta','M'),
	(6,50,'2017-05-04',NULL,'Pizzasecta','M'),
	(7,50,'2017-05-04',NULL,'Pizzasecta','M'),
	(8,50,'2017-05-04',NULL,'Pizzasecta','M'),
	(9,50,'2017-05-04',NULL,'Pizzasecta','M'),
	(10,50,'2017-05-04',NULL,'Pizzasecta','M'),
	(11,50,'2017-05-04',NULL,'Milasecta','M'),
	(12,50,'2017-05-04',NULL,'Milasecta','M'),
	(13,50,'2017-05-04',NULL,'Milasecta','M'),
	(14,50,'2017-05-04',NULL,'Milasecta','M'),
	(15,50,'2017-05-04',NULL,'Milasecta','M'),
	(16,50,'2017-05-04',NULL,'Otro Equipo','F'),
	(17,50,'2017-05-04',NULL,'Otro Equipo','F'),
	(18,50,'2017-05-04',NULL,'Otro Equipo','F'),
	(19,50,'2017-05-04',NULL,'Otro Equipo','F'),
	(20,50,'2017-05-04',NULL,'Otro Equipo','F'),
	(21,50,'2017-05-04',NULL,NULL,'F'),
	(22,50,'2017-05-04',NULL,NULL,'F'),
	(23,50,'2017-05-04',NULL,NULL,'F'),
	(24,50,'2017-05-04',NULL,NULL,'F'),
	(25,50,'2017-05-04',NULL,NULL,'F'),
	(26,50,'2017-05-04','Hambursecta',NULL,'M'),
	(27,50,'2017-05-04','Hambursecta',NULL,'M'),
	(28,50,'2017-05-04','Hambursecta',NULL,'M'),
	(29,50,'2017-05-04','Pizzasecta',NULL,'M'),
	(30,50,'2017-05-04','Pizzasecta',NULL,'M'),
	(31,50,'2017-05-04','Pizzasecta',NULL,'M'),
	(32,50,'2017-05-04','Milasecta',NULL,'M'),
	(33,50,'2017-05-04','Milasecta',NULL,'M'),
	(34,50,'2017-05-04','Milasecta',NULL,'M'),
	(35,50,'2017-05-04','Otro Equipo',NULL,'F'),
	(36,50,'2017-05-04','Otro Equipo',NULL,'F'),
	(37,50,'2017-05-04','Otro Equipo',NULL,'F');

/*!40000 ALTER TABLE `Competidor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Edad
# ------------------------------------------------------------

LOCK TABLES `Edad` WRITE;
/*!40000 ALTER TABLE `Edad` DISABLE KEYS */;

INSERT INTO `Edad` (`nombre`, `edadMinima`, `edadMaxima`)
VALUES
	('Adultos',18,35),
	('Juveniles',14,17);

/*!40000 ALTER TABLE `Edad` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Equipo
# ------------------------------------------------------------

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;

INSERT INTO `Equipo` (`nombreDeFantasia`, `idCategoria`)
VALUES
	('Hambursecta',1),
	('Milasecta',1),
	('Otro Equipo',1),
	('Pizzasecta',1);

/*!40000 ALTER TABLE `Equipo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Escuela
# ------------------------------------------------------------

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;

INSERT INTO `Escuela` (`nombre`, `nombrePais`)
VALUES
	('Buenos Aires','Argentina'),
	('Sao Paulo','Brasil'),
	('Santiago de Chile','Chile'),
	('Asuncion','Paraguay'),
	('Montevideo','Uruguay');

/*!40000 ALTER TABLE `Escuela` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Genero
# ------------------------------------------------------------

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;

INSERT INTO `Genero` (`valor`)
VALUES
	('F'),
	('M');

/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Graduacion
# ------------------------------------------------------------

LOCK TABLES `Graduacion` WRITE;
/*!40000 ALTER TABLE `Graduacion` DISABLE KEYS */;

INSERT INTO `Graduacion` (`nivel`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6);

/*!40000 ALTER TABLE `Graduacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Juez
# ------------------------------------------------------------

LOCK TABLES `Juez` WRITE;
/*!40000 ALTER TABLE `Juez` DISABLE KEYS */;

INSERT INTO `Juez` (`numeroDePlaca`, `numeroDeRing`)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5);

/*!40000 ALTER TABLE `Juez` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MaestroInstructor
# ------------------------------------------------------------

LOCK TABLES `MaestroInstructor` WRITE;
/*!40000 ALTER TABLE `MaestroInstructor` DISABLE KEYS */;

INSERT INTO `MaestroInstructor` (`numeroDePlacaInstructor`, `nombre`, `apellido`, `numeroDeCertificado`, `nivelDeGraduacion`, `nombreDeEscuela`)
VALUES
	(1,'Juan','Perez',1,6,'Buenos Aires'),
	(2,'Juan','Perez',2,6,'Sao Paulo'),
	(3,'Juan','Perez',3,6,'Montevideo'),
	(4,'Juan','Perez',4,6,'Asuncion'),
	(5,'Juan','Perez',5,6,'Santiago de Chile');

/*!40000 ALTER TABLE `MaestroInstructor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Modalidad
# ------------------------------------------------------------

LOCK TABLES `Modalidad` WRITE;
/*!40000 ALTER TABLE `Modalidad` DISABLE KEYS */;

INSERT INTO `Modalidad` (`nombre`)
VALUES
	('Combate'),
	('Combate Por Equipos'),
	('Formas'),
	('Rotura de Potencia'),
	('Salto');

/*!40000 ALTER TABLE `Modalidad` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Pais
# ------------------------------------------------------------

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;

INSERT INTO `Pais` (`nombre`)
VALUES
	('Argentina'),
	('Brasil'),
	('Chile'),
	('Paraguay'),
	('Uruguay');

/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ParticipaEn
# ------------------------------------------------------------

LOCK TABLES `ParticipaEn` WRITE;
/*!40000 ALTER TABLE `ParticipaEn` DISABLE KEYS */;

INSERT INTO `ParticipaEn` (`idCategoria`, `dni`)
VALUES
	(2,1),
	(4,1),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(4,6),
	(4,7),
	(4,8),
	(4,9),
	(4,10);

/*!40000 ALTER TABLE `ParticipaEn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Participante
# ------------------------------------------------------------

LOCK TABLES `Participante` WRITE;
/*!40000 ALTER TABLE `Participante` DISABLE KEYS */;

INSERT INTO `Participante` (`dni`, `numeroDeCertificado`, `nombre`, `apellido`, `nombreDeEscuela`, `nivelDeGraduacion`, `foto`)
VALUES
	(1,1,'Juan','Perez','Buenos Aires',1,'Foto'),
	(2,2,'Juan','Perez','Buenos Aires',1,'Foto'),
	(3,3,'Juan','Perez','Buenos Aires',1,'Foto'),
	(4,4,'Juan','Perez','Buenos Aires',1,'Foto'),
	(5,5,'Juan','Perez','Buenos Aires',1,'Foto'),
	(6,6,'Juan','Perez','Montevideo',2,'Foto'),
	(7,7,'Juan','Perez','Montevideo',2,'Foto'),
	(8,8,'Juan','Perez','Montevideo',2,'Foto'),
	(9,9,'Juan','Perez','Montevideo',2,'Foto'),
	(10,10,'Juan','Perez','Montevideo',2,'Foto'),
	(11,11,'Juan','Perez','Asuncion',3,'Foto'),
	(12,12,'Juan','Perez','Asuncion',3,'Foto'),
	(13,13,'Juan','Perez','Asuncion',3,'Foto'),
	(14,14,'Juan','Perez','Asuncion',3,'Foto'),
	(15,15,'Juan','Perez','Asuncion',3,'Foto'),
	(16,16,'Juan','Perez','Sao Paulo',4,'Foto'),
	(17,17,'Juan','Perez','Sao Paulo',4,'Foto'),
	(18,18,'Juan','Perez','Sao Paulo',4,'Foto'),
	(19,19,'Juan','Perez','Sao Paulo',4,'Foto'),
	(20,20,'Juan','Perez','Sao Paulo',4,'Foto'),
	(21,21,'Juan','Perez','Santiago de Chile',5,'Foto'),
	(22,22,'Juan','Perez','Santiago de Chile',5,'Foto'),
	(23,23,'Juan','Perez','Santiago de Chile',5,'Foto'),
	(24,24,'Juan','Perez','Santiago de Chile',5,'Foto'),
	(25,25,'Juan','Perez','Santiago de Chile',5,'Foto'),
	(26,26,'Juan','Suplente','Buenos Aires',1,'Foto'),
	(27,27,'Juan','Suplente','Buenos Aires',1,'Foto'),
	(28,28,'Juan','Suplente','Buenos Aires',1,'Foto'),
	(29,29,'Juan','Suplente','Montevideo',2,'Foto'),
	(30,30,'Juan','Suplente','Montevideo',2,'Foto'),
	(31,31,'Juan','Suplente','Montevideo',2,'Foto'),
	(32,32,'Juan','Suplente','Asuncion',3,'Foto'),
	(33,33,'Juan','Suplente','Asuncion',3,'Foto'),
	(34,34,'Juan','Suplente','Asuncion',3,'Foto'),
	(35,35,'Juan','Perez','Sao Paulo',4,'Foto'),
	(36,36,'Juan','Perez','Sao Paulo',4,'Foto'),
	(37,37,'Juan','Perez','Sao Paulo',4,'Foto');

/*!40000 ALTER TABLE `Participante` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Peso
# ------------------------------------------------------------

LOCK TABLES `Peso` WRITE;
/*!40000 ALTER TABLE `Peso` DISABLE KEYS */;

INSERT INTO `Peso` (`nombre`, `pesoMinimo`, `pesoMaximo`)
VALUES
	('Flacos',50,60),
	('Gordos',90,120),
	('Normales',61,90);

/*!40000 ALTER TABLE `Peso` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PresidenteDeMesa
# ------------------------------------------------------------

LOCK TABLES `PresidenteDeMesa` WRITE;
/*!40000 ALTER TABLE `PresidenteDeMesa` DISABLE KEYS */;

INSERT INTO `PresidenteDeMesa` (`numeroDePlaca`, `numeroDeRing`)
VALUES
	(11,1),
	(12,2),
	(13,3),
	(14,4),
	(15,5);

/*!40000 ALTER TABLE `PresidenteDeMesa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ring
# ------------------------------------------------------------

LOCK TABLES `Ring` WRITE;
/*!40000 ALTER TABLE `Ring` DISABLE KEYS */;

INSERT INTO `Ring` (`numeroDeRing`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5);

/*!40000 ALTER TABLE `Ring` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Suplente
# ------------------------------------------------------------

LOCK TABLES `Suplente` WRITE;
/*!40000 ALTER TABLE `Suplente` DISABLE KEYS */;

INSERT INTO `Suplente` (`numeroDePlaca`, `numeroDeRing`)
VALUES
	(16,1),
	(17,1),
	(18,1),
	(19,2),
	(20,2),
	(21,2),
	(22,3),
	(23,3),
	(24,3),
	(25,4),
	(26,4),
	(27,4),
	(28,5),
	(29,5),
	(30,5);

/*!40000 ALTER TABLE `Suplente` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
