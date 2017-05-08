CREATE TABLE IF NOT EXISTS Pais (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Graduacion (
  nivel int NOT NULL,
  PRIMARY KEY (nivel)
);

CREATE TABLE IF NOT EXISTS Genero (
  valor char NOT NULL,
  PRIMARY KEY (valor)
);

CREATE TABLE IF NOT EXISTS Equipo (
  nombreDeFantasia varchar(255) NOT NULL,
  idCategoria int,
  PRIMARY KEY (nombreDeFantasia)
);

CREATE TABLE IF NOT EXISTS Edad (
  nombre varchar(255) NOT NULL,
  edadMinima int NOT NULL,
  edadMaxima int NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Peso (
  nombre varchar(255) NOT NULL,
  pesoMinimo int NOT NULL,
  pesoMaximo int NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Modalidad (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Ring (
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS Escuela (
  nombre varchar(255) NOT NULL,
  nombrePais varchar(255) NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (nombrePais) REFERENCES Pais (nombre)
);

CREATE TABLE IF NOT EXISTS MaestroInstructor (
  numeroDePlacaInstructor int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  numeroDeCertificado int NOT NULL,
  nivelDeGraduacion int NOT NULL,
  nombreDeEscuela varchar(255) NOT NULL,
  PRIMARY KEY (numeroDePlacaInstructor),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion (nivel),
  FOREIGN KEY (nombreDeEscuela) REFERENCES Escuela (nombre)
);

CREATE TABLE IF NOT EXISTS Participante (
  dni int NOT NULL,
  numeroDeCertificado int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  nombreDeEscuela varchar(255) NOT NULL,
  nivelDeGraduacion int NOT NULL,
  foto varchar(255) NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (nombreDeEscuela) REFERENCES Escuela (nombre),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion (nivel)
);

CREATE TABLE IF NOT EXISTS Coach (
  dni int NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Participante (dni)
);

CREATE TABLE IF NOT EXISTS Competidor (
  dni int NOT NULL,
  peso int NOT NULL,
  fechaDeNacimiento date NOT NULL,
  suplente varchar(255),
  titular varchar(255),
  sexo char NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Participante (dni),
  FOREIGN KEY (suplente) REFERENCES Equipo (nombreDeFantasia),
  FOREIGN KEY (titular) REFERENCES Equipo (nombreDeFantasia),
  FOREIGN KEY (sexo) REFERENCES Genero (valor)
);

CREATE TABLE IF NOT EXISTS CompetenciaIndividual (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (nombre) REFERENCES Modalidad (nombre)
);

CREATE TABLE IF NOT EXISTS CompetenciaPorEquipos (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre),
  FOREIGN KEY (nombre) REFERENCES Modalidad (nombre)
);

CREATE TABLE IF NOT EXISTS Arbitro (
  numeroDePlaca int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  nombreDePais varchar(255) NOT NULL,
  nivelDeGraduacion int NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (nombreDePais) REFERENCES Pais (nombre),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion (nivel)
);

CREATE TABLE IF NOT EXISTS Juez (
  numeroDePlaca int NOT NULL,
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (numeroDeRing) REFERENCES Ring (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS ArbitroCentral (
  numeroDePlaca int NOT NULL,
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (numeroDeRing) REFERENCES Ring (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS PresidenteDeMesa (
  numeroDePlaca int NOT NULL,
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (numeroDeRing) REFERENCES Ring (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS Suplente (
  numeroDePlaca int NOT NULL,
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (numeroDeRing) REFERENCES Ring (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS Categoria (
  id int NOT NULL,
  numeroDeRing int NOT NULL,
  genero char NOT NULL,
  nombreDeEdad varchar(255),
  PRIMARY KEY (id),
  FOREIGN KEY (numeroDeRing) REFERENCES Ring (numeroDeRing),
  FOREIGN KEY (genero) REFERENCES Genero (valor),
  FOREIGN KEY (nombreDeEdad) REFERENCES Edad (nombre)
);

CREATE TABLE IF NOT EXISTS CategoriaIndividual (
  idCategoria int NOT NULL,
  nombreDeModalidad varchar(255) NOT NULL,
  nivelDeGraduacion int,
  nombreDePeso varchar(255),
  dniPrimerPuesto int,
  dniSegundoPuesto int,
  dniTercerPuesto int,
  PRIMARY KEY (idCategoria),
  FOREIGN KEY (idCategoria) REFERENCES Categoria (id),
  FOREIGN KEY (nombreDeModalidad) REFERENCES CompetenciaIndividual (nombre),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion (nivel),
  FOREIGN KEY (nombreDePeso) REFERENCES Peso (nombre),
  FOREIGN KEY (dniPrimerPuesto) REFERENCES Competidor (dni),
  FOREIGN KEY (dniSegundoPuesto) REFERENCES Competidor (dni),
  FOREIGN KEY (dniTercerPuesto) REFERENCES Competidor (dni)
);

CREATE TABLE IF NOT EXISTS ParticipaEn (
  idCategoria int NOT NULL,
  dni int NOT NULL,
  PRIMARY KEY (idCategoria, dni),
  FOREIGN KEY (idCategoria) REFERENCES CategoriaIndividual (idCategoria),
  FOREIGN KEY (dni) REFERENCES Competidor (dni)
);

CREATE TABLE IF NOT EXISTS CategoriaGrupal (
  idCategoria int NOT NULL,
  nombreDeModalidad varchar(255) NOT NULL,
  nombrePrimerPuesto varchar(255),
  nombreSegundoPuesto varchar(255),
  nombreTercerPuesto varchar(255),
  PRIMARY KEY (idCategoria),
  FOREIGN KEY (idCategoria) REFERENCES Categoria (id),
  FOREIGN KEY (nombreDeModalidad) REFERENCES CompetenciaPorEquipos (nombre),
  FOREIGN KEY (nombrePrimerPuesto) REFERENCES Equipo (nombreDeFantasia),
  FOREIGN KEY (nombreSegundoPuesto) REFERENCES Equipo (nombreDeFantasia),
  FOREIGN KEY (nombreTercerPuesto) REFERENCES Equipo (nombreDeFantasia)
);

ALTER TABLE Equipo ADD CONSTRAINT fk_id_categoria FOREIGN KEY (idCategoria) REFERENCES CategoriaGrupal(idCategoria);
