LOCK TABLES `Pais` WRITE;

INSERT INTO `Pais` (`nombre`)
VALUES
  ('Argentina'),
  ('Brasil'),
  ('Chile'),
  ('Paraguay'),
  ('Uruguay');

UNLOCK TABLES;

LOCK TABLES `Graduacion` WRITE;

INSERT INTO `Graduacion` (`nivel`)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6);

UNLOCK TABLES;

LOCK TABLES `Genero` WRITE;

INSERT INTO `Genero` (`valor`)
VALUES
  ('F'),
  ('M');

UNLOCK TABLES;

LOCK TABLES `Equipo` WRITE;

INSERT INTO `Equipo` (`nombreDeFantasia`, `idCategoria`)
VALUES
  ('Hambursecta',NULL),
  ('Milasecta',NULL),
  ('Otro Equipo',NULL),
  ('Pizzasecta',NULL);

UNLOCK TABLES;

LOCK TABLES `Edad` WRITE;

INSERT INTO `Edad` (`nombre`, `edadMinima`, `edadMaxima`)
VALUES
  ('Adultos',18,35),
  ('Juveniles',14,17);

UNLOCK TABLES;

LOCK TABLES `Peso` WRITE;

INSERT INTO `Peso` (`nombre`, `pesoMinimo`, `pesoMaximo`)
VALUES
  ('Flacos',40,60),
  ('Gordos',90,120),
  ('Normales',61,90);

UNLOCK TABLES;

LOCK TABLES `Modalidad` WRITE;

INSERT INTO `Modalidad` (`nombre`)
VALUES
  ('Combate'),
  ('Combate Por Equipos'),
  ('Formas'),
  ('Rotura de Potencia'),
  ('Salto');

UNLOCK TABLES;

LOCK TABLES `Ring` WRITE;

INSERT INTO `Ring` (`numeroDeRing`)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

UNLOCK TABLES;

LOCK TABLES `Escuela` WRITE;

INSERT INTO `Escuela` (`nombre`, `nombrePais`)
VALUES
  ('Buenos Aires','Argentina'),
  ('Sao Paulo','Brasil'),
  ('Santiago de Chile','Chile'),
  ('Asuncion','Paraguay'),
  ('Montevideo','Uruguay');

UNLOCK TABLES;

LOCK TABLES `MaestroInstructor` WRITE;

INSERT INTO `MaestroInstructor` (`numeroDePlacaInstructor`, `nombre`, `apellido`, `numeroDeCertificado`, `nivelDeGraduacion`, `nombreDeEscuela`)
VALUES
  (1,'Juan','Perez',1,6,'Buenos Aires'),
  (2,'Juan','Perez',2,6,'Sao Paulo'),
  (3,'Juan','Perez',3,6,'Montevideo'),
  (4,'Juan','Perez',4,6,'Asuncion'),
  (5,'Juan','Perez',5,6,'Santiago de Chile');

UNLOCK TABLES;

LOCK TABLES `Participante` WRITE;

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

UNLOCK TABLES;

LOCK TABLES `Coach` WRITE;

INSERT INTO `Coach` (`dni`)
VALUES
  (1),
  (6),
  (11),
  (16),
  (21),
  (26),
  (29),
  (32),
  (35);

UNLOCK TABLES;

LOCK TABLES `Competidor` WRITE;

INSERT INTO `Competidor` (`dni`, `peso`, `fechaDeNacimiento`, `suplente`, `titular`, `sexo`)
VALUES
  (1,50,'1993-05-04',NULL,'Hambursecta','M'),
  (2,50,'1993-05-04',NULL,'Hambursecta','M'),
  (3,50,'1993-05-04',NULL,'Hambursecta','M'),
  (4,50,'1993-05-04',NULL,'Hambursecta','M'),
  (5,50,'1993-05-04',NULL,'Hambursecta','M'),
  (6,50,'1993-05-04',NULL,'Pizzasecta','M'),
  (7,50,'1993-05-04',NULL,'Pizzasecta','M'),
  (8,50,'1993-05-04',NULL,'Pizzasecta','M'),
  (9,50,'1993-05-04',NULL,'Pizzasecta','M'),
  (10,50,'1993-05-04',NULL,'Pizzasecta','M'),
  (11,50,'1993-05-04',NULL,'Milasecta','M'),
  (12,50,'1993-05-04',NULL,'Milasecta','M'),
  (13,50,'1993-05-04',NULL,'Milasecta','M'),
  (14,50,'1993-05-04',NULL,'Milasecta','M'),
  (15,50,'1993-05-04',NULL,'Milasecta','M'),
  (16,50,'1993-05-04',NULL,'Otro Equipo','F'),
  (17,50,'1993-05-04',NULL,'Otro Equipo','F'),
  (18,50,'1993-05-04',NULL,'Otro Equipo','F'),
  (19,50,'1993-05-04',NULL,'Otro Equipo','F'),
  (20,50,'1993-05-04',NULL,'Otro Equipo','F'),
  (21,50,'1993-05-04',NULL,NULL,'F'),
  (22,50,'1993-05-04',NULL,NULL,'F'),
  (23,50,'1993-05-04',NULL,NULL,'F'),
  (24,50,'1993-05-04',NULL,NULL,'F'),
  (25,50,'1993-05-04',NULL,NULL,'F'),
  (26,50,'1993-05-04','Hambursecta',NULL,'M'),
  (27,50,'1993-05-04','Hambursecta',NULL,'M'),
  (28,50,'1993-05-04','Hambursecta',NULL,'M'),
  (29,50,'1993-05-04','Pizzasecta',NULL,'M'),
  (30,50,'1993-05-04','Pizzasecta',NULL,'M'),
  (31,50,'1993-05-04','Pizzasecta',NULL,'M'),
  (32,50,'1993-05-04','Milasecta',NULL,'M'),
  (33,50,'1993-05-04','Milasecta',NULL,'M'),
  (34,50,'1993-05-04','Milasecta',NULL,'M'),
  (35,50,'1993-05-04','Otro Equipo',NULL,'F'),
  (36,50,'1993-05-04','Otro Equipo',NULL,'F'),
  (37,50,'1993-05-04','Otro Equipo',NULL,'F');

UNLOCK TABLES;

LOCK TABLES `CompetenciaIndividual` WRITE;

INSERT INTO `CompetenciaIndividual` (`nombre`)
VALUES
  ('Combate'),
  ('Formas'),
  ('Rotura de Potencia'),
  ('Salto');

UNLOCK TABLES;

LOCK TABLES `CompetenciaPorEquipos` WRITE;

INSERT INTO `CompetenciaPorEquipos` (`nombre`)
VALUES
  ('Combate Por Equipos');

UNLOCK TABLES;

LOCK TABLES `Arbitro` WRITE;

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

UNLOCK TABLES;

LOCK TABLES `Juez` WRITE;

INSERT INTO `Juez` (`numeroDePlaca`, `numeroDeRing`)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5);

UNLOCK TABLES;

LOCK TABLES `ArbitroCentral` WRITE;

INSERT INTO `ArbitroCentral` (`numeroDePlaca`, `numeroDeRing`)
VALUES
  (6,1),
  (7,2),
  (8,3),
  (9,4),
  (10,5);

UNLOCK TABLES;

LOCK TABLES `PresidenteDeMesa` WRITE;

INSERT INTO `PresidenteDeMesa` (`numeroDePlaca`, `numeroDeRing`)
VALUES
  (11,1),
  (12,2),
  (13,3),
  (14,4),
  (15,5);

UNLOCK TABLES;

LOCK TABLES `Suplente` WRITE;

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

UNLOCK TABLES;

LOCK TABLES `Categoria` WRITE;

INSERT INTO `Categoria` (`id`, `numeroDeRing`, `genero`, `nombreDeEdad`)
VALUES
  (1,1,'F','Adultos'),
  (2,1,'M','Adultos'),
  (3,2,'F','Adultos'),
  (4,3,'M','Adultos'),
  (5,4,'F','Juveniles'),
  (6,5,'M','Juveniles');

UNLOCK TABLES;

LOCK TABLES `CategoriaIndividual` WRITE;

INSERT INTO `CategoriaIndividual` (`idCategoria`, `nombreDeModalidad`, `nivelDeGraduacion`, `nombreDePeso`, `dniPrimerPuesto`, `dniSegundoPuesto`, `dniTercerPuesto`)
VALUES
  (2,'Combate',3,'Flacos',1,2,3),
  (3,'Formas',NULL,NULL,NULL,NULL,NULL),
  (4,'Rotura de Potencia',5,NULL,7,8,9),
  (5,'Salto',2,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

LOCK TABLES `ParticipaEn` WRITE;

INSERT INTO `ParticipaEn` (`idCategoria`, `dni`)
VALUES
  (2,1),
  (2,2),
  (2,3),
  (2,4),
  (2,5),
  (4,6),
  (4,7),
  (4,8),
  (4,9),
  (4,10);

UNLOCK TABLES;

LOCK TABLES `CategoriaGrupal` WRITE;

INSERT INTO `CategoriaGrupal` (`idCategoria`, `nombreDeModalidad`, `nombrePrimerPuesto`, `nombreSegundoPuesto`, `nombreTercerPuesto`)
VALUES
  (1,'Combate Por Equipos','Hambursecta','Milasecta','Pizzasecta');

UNLOCK TABLES;

UPDATE Equipo SET idCategoria = 1 WHERE nombreDeFantasia <> 'Otro Equipo';
