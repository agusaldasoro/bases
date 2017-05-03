CREATE TABLE IF NOT EXISTS Escuela (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Pais (
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Graduacion (
  nivel varchar(255) NOT NULL,
  PRIMARY KEY (nivel)
);

CREATE TABLE IF NOT EXISTS Genero (
  valor char NOT NULL,
  PRIMARY KEY (valor)
);

CREATE TABLE IF NOT EXISTS MaestroInstructor (
  numeroDePlacaInstructor int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  numeroDeCertificado int NOT NULL,
  nivelDeGraduacion varchar(255) NOT NULL,
  nombreDeEscuela varchar(255) NOT NULL,
  PRIMARY KEY (numeroDePlacaInstructor),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion(nivel),
  FOREIGN KEY (nombreDeEscuela) REFERENCES Escuela(nombre)
);

CREATE TABLE IF NOT EXISTS Equipo (
  nombreDeFantasia varchar(255) NOT NULL,
  PRIMARY KEY (nombreDeFantasia)
);

CREATE TABLE IF NOT EXISTS Participante (
  dni int NOT NULL,
  numeroDeCertificado int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  nombreDeEscuela varchar(255) NOT NULL,
  nombreDeGraduacion varchar(255) NOT NULL,
  foto varchar(255) NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (nombreDeEscuela) REFERENCES Escuela(nombre),
  FOREIGN KEY (nombreDeGraduacion) REFERENCES Graduacion(nivel)
);

CREATE TABLE IF NOT EXISTS Coach (
  dni int NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Participante(dni)
);

CREATE TABLE IF NOT EXISTS Competidor (
  dni int NOT NULL,
  peso int NOT NULL,
  fechaDeNacimiento date NOT NULL,
  suplente varchar(255),
  titular varchar(255),
  sexo char NOT NULL,
  PRIMARY KEY (dni),
  FOREIGN KEY (dni) REFERENCES Participante(dni),
  FOREIGN KEY (suplente) REFERENCES Equipo(nombreDeFantasia),
  FOREIGN KEY (titular) REFERENCES Equipo(nombreDeFantasia),
  FOREIGN KEY (sexo) REFERENCES Genero(valor)
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

CREATE TABLE IF NOT EXISTS Ring (
  numeroDeRing int NOT NULL,
  PRIMARY KEY (numeroDeRing)
);

CREATE TABLE IF NOT EXISTS Arbitro (
  numeroDePlaca int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  nombreDePais varchar(255) NOT NULL,
  nivelDeGraduacion varchar(255) NOT NULL,
  PRIMARY KEY (numeroDePlaca),
  FOREIGN KEY (nombreDePais) REFERENCES Pais (nombre),
  FOREIGN KEY (nivelDeGraduacion) REFERENCES Graduacion(nivel)
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
