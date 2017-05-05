-- 1)
(
  SELECT Participante.dni AS identificacion, CategoriaIndividual.nombreDeModalidad
  FROM Participante
  JOIN Competidor ON Participante.dni = Competidor.dni
  JOIN ParticipaEn ON Competidor.dni = ParticipaEn.dni
  JOIN CategoriaIndividual ON ParticipaEn.idCategoria = CategoriaIndividual.idCategoria
  ORDER BY ParticipaEn.idCategoria
) UNION (
  SELECT nombreDeFantasia AS identificacion, CategoriaGrupal.nombreDeModalidad
  FROM Equipo
  JOIN CategoriaGrupal ON Equipo.idCategoria = CategoriaGrupal.idCategoria
  ORDER BY idCategoria
);

-- 2)
SELECT nombrePais, COUNT(nombrePais) AS cantidad
FROM (
    SELECT Escuela.nombrePais
    FROM (
       SELECT dniPrimerPuesto AS dni
        FROM CategoriaIndividual
      UNION ALL
        SELECT dniSegundoPuesto AS dni
        FROM CategoriaIndividual
      UNION ALL
        SELECT dniTercerPuesto AS dni
        FROM CategoriaIndividual
    ) AS Dnis
    JOIN Participante ON Participante.dni = Dnis.dni
    JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  UNION ALL
    SELECT Escuela.nombrePais
    FROM (
        SELECT nombrePrimerPuesto AS nombre
        FROM CategoriaGrupal
      UNION ALL
        SELECT nombreSegundoPuesto AS nombre
        FROM CategoriaGrupal
      UNION ALL
        SELECT nombreTercerPuesto AS nombre
        FROM CategoriaGrupal
    ) AS Nombres
    JOIN Competidor ON Competidor.titular = Nombres.nombre
    JOIN Participante ON Competidor.dni = Participante.dni
    JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
    GROUP BY Nombres.nombre, Escuela.nombrePais
) AS Paises
GROUP BY nombrePais
ORDER BY cantidad DESC
LIMIT 1;

-- 3)
SELECT nombrePais, SUM(puntaje) AS puntajeTotal
FROM (
    SELECT Escuela.nombrePais, puntaje
    FROM (
       SELECT dniPrimerPuesto AS dni, 3 AS puntaje
        FROM CategoriaIndividual
      UNION ALL
        SELECT dniSegundoPuesto AS dni, 2 AS puntaje
        FROM CategoriaIndividual
      UNION ALL
        SELECT dniTercerPuesto AS dni, 1 AS puntaje
        FROM CategoriaIndividual
    ) AS Dnis
    JOIN Participante ON Participante.dni = Dnis.dni
    JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
  UNION ALL
    SELECT Escuela.nombrePais, puntaje
    FROM (
        SELECT nombrePrimerPuesto AS nombre, 3 AS puntaje
        FROM CategoriaGrupal
      UNION ALL
        SELECT nombreSegundoPuesto AS nombre, 2 AS puntaje
        FROM CategoriaGrupal
      UNION ALL
        SELECT nombreTercerPuesto AS nombre, 1 AS puntaje
        FROM CategoriaGrupal
    ) AS Nombres
    JOIN Competidor ON Competidor.titular = Nombres.nombre
    JOIN Participante ON Competidor.dni = Participante.dni
    JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
    GROUP BY Nombres.nombre, Escuela.nombrePais
) AS EscuelasYPuntaje
GROUP BY nombrePais
ORDER BY puntajeTotal DESC;

-- 4)
  SELECT dniPrimerPuesto AS dni, idCategoria, "Primero"
  FROM CategoriaIndividual
  WHERE dniPrimerPuesto IS NOT NULL
UNION ALL
  SELECT dniSegundoPuesto AS dni, idCategoria, "Segundo"
  FROM CategoriaIndividual
  WHERE dniSegundoPuesto IS NOT NULL
UNION ALL
  SELECT dniTercerPuesto AS dni, idCategoria, "Tercero"
  FROM CategoriaIndividual
  WHERE dniTercerPuesto IS NOT NULL
UNION ALL
  SELECT Competidor.dni, CategoriaIndividual.idCategoria, "No llega al podio"
  FROM Competidor
  JOIN ParticipaEn ON Competidor.dni = ParticipaEn.dni
  JOIN CategoriaIndividual ON ParticipaEn.idCategoria = CategoriaIndividual.idCategoria
  WHERE NOT (
    Competidor.dni = CategoriaIndividual.dniPrimerPuesto
    OR
    Competidor.dni = CategoriaIndividual.dniSegundoPuesto
    OR
    Competidor.dni = CategoriaIndividual.dniTercerPuesto
  )
UNION ALL
  SELECT Competidor.dni AS dni, CategoriaGrupal.idCategoria, "Primero"
  FROM Competidor
  JOIN Equipo ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN CategoriaGrupal ON Equipo.idCategoria = CategoriaGrupal.idCategoria
  WHERE nombrePrimerPuesto IS NOT NULL
UNION ALL
  SELECT Competidor.dni AS dni, CategoriaGrupal.idCategoria, "Segundo"
  FROM Competidor
  JOIN Equipo ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN CategoriaGrupal ON Equipo.idCategoria = CategoriaGrupal.idCategoria
  WHERE nombreSegundoPuesto IS NOT NULL
UNION ALL
  SELECT Competidor.dni AS dni, CategoriaGrupal.idCategoria, "Tercero"
  FROM Competidor
  JOIN Equipo ON Equipo.nombreDeFantasia = Competidor.titular OR Equipo.nombreDeFantasia = Competidor.suplente
  JOIN CategoriaGrupal ON Equipo.idCategoria = CategoriaGrupal.idCategoria
  WHERE nombreTercerPuesto IS NOT NULL
UNION ALL
  SELECT Competidor.dni, CategoriaGrupal.idCategoria, "No llega al podio"
  FROM Competidor
  JOIN Equipo ON Competidor.titular = Equipo.nombreDeFantasia OR Competidor.suplente = Equipo.nombreDeFantasia
  JOIN CategoriaGrupal ON Equipo.idCategoria = CategoriaGrupal.idCategoria
  WHERE NOT (
    Equipo.idCategoria = CategoriaGrupal.nombrePrimerPuesto
    OR
    Equipo.idCategoria = CategoriaGrupal.nombreSegundoPuesto
    OR
    Equipo.idCategoria = CategoriaGrupal.nombreTercerPuesto
  )
ORDER BY idCategoria, dni

-- 5)

-- 6)

-- 7)

-- 8)
