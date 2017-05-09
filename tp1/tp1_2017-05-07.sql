LOCK TABLES `Categoria` WRITE;

INSERT INTO `Categoria` (`id`, `numeroDeRing`, `genero`, `nombreDeEdad`)
VALUES
	(1,1,'M','Adultos'),
	(2,1,'F','Adultos'),
	(3,2,'M','Juveniles'),
	(4,3,'F','Juveniles'),
	(5,4,'M','Adultos'),
	(6,5,'F','Adultos');

UNLOCK TABLES;

LOCK TABLES `CategoriaGrupal` WRITE;

INSERT INTO `CategoriaGrupal` (`idCategoria`, `nombreDeModalidad`, `nombrePrimerPuesto`, `nombreSegundoPuesto`, `nombreTercerPuesto`)
VALUES
	(1,'Combate Por Equipos','Hambursecta','Milasecta','Pizzasecta');

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

UNLOCK TABLES;
