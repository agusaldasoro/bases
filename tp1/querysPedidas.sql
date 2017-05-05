-- 1)

SELECT Participante.nombre, Participante.apellido, Participante.dni, CategoriaIndividual.nombreDeModalidad
FROM Participante
JOIN Competidor ON Participante.dni = Competidor.dni
JOIN ParticipaEn ON Competidor.dni = ParticipaEn.dni
JOIN CategoriaIndividual ON ParticipaEn.idCategoria = CategoriaIndividual.idCategoria
ORDER BY ParticipaEn.idCategoria;

SELECT nombreDeFantasia
FROM Equipo
ORDER BY idCategoria;

-- 2)
SELECT Escuela.nombrePais, cantOroInd, cantOroGrup, cantPlataInd, cantPlataGrup, cantBronceInd, cantBronceGrup
FROM Escuela
JOIN (
  SELECT Escuela.nombrePais paisOroInd, COUNT(CategoriaIndividual.dniPrimerPuesto) cantOroInd
  FROM CategoriaIndividual
  JOIN Participante ON CategoriaIndividual.dniPrimerPuesto = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS OroInd ON paisOroInd = Escuela.nombrePais
JOIN (
  SELECT Escuela.nombrePais paisPlataInd, COUNT(CategoriaIndividual.dniSegundoPuesto) cantPlataInd
  FROM CategoriaIndividual
  JOIN Participante ON CategoriaIndividual.dniSegundoPuesto = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS PlataInd ON paisPlataInd = Escuela.nombrePais
JOIN (
  SELECT Escuela.nombrePais paisBronceInd, COUNT(CategoriaIndividual.dniTercerPuesto) cantBronceInd
  FROM CategoriaIndividual
  JOIN Participante ON CategoriaIndividual.dniTercerPuesto = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS BronceInd ON paisBronceInd = Escuela.nombrePais
JOIN (
  SELECT Escuela.nombrePais paisOroGrup, COUNT(DISTINCT CategoriaGrupal.nombrePrimerPuesto) cantOroGrup
  FROM CategoriaGrupal
  JOIN Equipo ON CategoriaGrupal.nombrePrimerPuesto = Equipo.nombreDeFantasia
  JOIN Competidor ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN Participante ON Competidor.dni = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS OroGrup ON paisOroGrup = Escuela.nombrePais
JOIN (
  SELECT Escuela.nombrePais paisPlataGrup, COUNT(DISTINCT CategoriaGrupal.nombreSegundoPuesto) cantPlataGrup
  FROM CategoriaGrupal
  JOIN Equipo ON CategoriaGrupal.nombreSegundoPuesto = Equipo.nombreDeFantasia
  JOIN Competidor ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN Participante ON Competidor.dni = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS PlataGrup ON paisPlataGrup = Escuela.nombrePais
JOIN (
  SELECT Escuela.nombrePais paisBronceGrup, COUNT(DISTINCT CategoriaGrupal.nombreTercerPuesto) cantBronceGrup
  FROM CategoriaGrupal
  JOIN Equipo ON CategoriaGrupal.nombreTercerPuesto = Equipo.nombreDeFantasia
  JOIN Competidor ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN Participante ON Competidor.dni = Participante.dni
  JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  GROUP BY Escuela.nombrePais
) AS BronceGrup ON paisBronceGrup = Escuela.nombrePais
GROUP BY Escuela.nombrePais
HAVING MAX(cantOroInd + cantOroGrup + cantPlataInd + cantPlataGrup + cantBronceInd + cantBronceGrup);

/*
SELECT Pais.nombre
FROM Pais
JOIN Escuela ON Pais.nombre = Escuela.nombrePais
JOIN Participante ON Escuela.nombre = Participante.nombreDeEscuela
JOIN Competidor ON Participante.dni = Competidor.dni
*/

-- 3)

-- 4)

-- 5)

-- 6)

-- 7)

-- 8)
