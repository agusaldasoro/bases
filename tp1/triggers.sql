DROP TRIGGER IF EXISTS competidor_insert;
DROP TRIGGER IF EXISTS competidor_update;
DROP TRIGGER IF EXISTS competidor_after_insert;
DROP TRIGGER IF EXISTS competidor_after_update;
DROP TRIGGER IF EXISTS participa_en_insert;
DROP TRIGGER IF EXISTS participa_en_update;
DROP TRIGGER IF EXISTS juez_insert;
DROP TRIGGER IF EXISTS graduacion_insert;
DROP TRIGGER IF EXISTS graduacion_update;
DROP TRIGGER IF EXISTS categoria_individual_insert;
DROP TRIGGER IF EXISTS categoria_individual_update;
DROP TRIGGER IF EXISTS categoria_grupal_update;

DELIMITER $$

CREATE TRIGGER competidor_insert BEFORE INSERT ON Competidor
FOR EACH ROW BEGIN
  IF (
    (
      SELECT FLOOR(COUNT(1) / 5)
      FROM Competidor
      JOIN Participante ON Competidor.dni = Participante.dni
      JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
      WHERE Escuela.nombre IN (
        SELECT Participante.nombreDeEscuela
        FROM Participante
        WHERE Participante.dni = NEW.dni
      )
    ) >= (
      SELECT COUNT(1)
      FROM Coach
      JOIN Participante ON Coach.dni = Participante.dni
      JOIN Escuela ON Participante.nombreDeEscuela = Escuela.nombre
      WHERE Escuela.nombre IN (
        SELECT Participante.nombreDeEscuela
        FROM Participante
        WHERE Participante.dni = NEW.dni
      )
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Se necesita agregar al menos un coach mas';

  ELSEIF (
    NEW.titular IS NOT NULL AND NEW.suplente IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un competidor solo puede ser titular o suplente';

  END IF;
END; $$

CREATE TRIGGER competidor_after_insert AFTER INSERT ON Competidor
FOR EACH ROW BEGIN
  IF (
    (
      SELECT COUNT(nombreDeEscuela)
      FROM Competidor
      JOIN Participante ON Competidor.dni = Participante.dni
      WHERE NEW.titular = Competidor.titular OR
            NEW.suplente = Competidor.suplente OR
            NEW.titular = Competidor.suplente OR
            NEW.suplente = Competidor.titular
    ) > 1
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Los competidores de un equipo deben ser de la misma escuela';

  END IF;
END; $$

CREATE TRIGGER competidor_update BEFORE UPDATE ON Competidor
FOR EACH ROW BEGIN
  IF (
    NEW.titular IS NOT NULL AND NEW.suplente IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un competidor solo puede ser titular o suplente';

  ELSEIF (
    EXISTS (
      SELECT 1
      FROM Competidor
      WHERE NEW.dni = Competidor.dni AND (NEW.titular = Competidor.titular OR NEW.suplente = Competidor.suplente)
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Se necesita agregar al menos un coach mas';

  END IF;
END; $$

CREATE TRIGGER competidor_after_update AFTER UPDATE ON Competidor
FOR EACH ROW BEGIN
  IF (
    (
      SELECT COUNT(nombreDeEscuela)
      FROM Competidor
      JOIN Participante ON Competidor.dni = Participante.dni
      WHERE NEW.titular = Competidor.titular OR
            NEW.suplente = Competidor.suplente OR
            NEW.titular = Competidor.suplente OR
            NEW.suplente = Competidor.titular
    ) > 1
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Los competidores de un equipo deben ser de la misma escuela';

  END IF;
END; $$

CREATE TRIGGER participa_en_insert BEFORE INSERT ON ParticipaEn
FOR EACH ROW BEGIN
  IF (
    EXISTS (
      SELECT 1
      FROM ParticipaEn
      WHERE dni = NEW.dni AND
        idCategoria IN (
        SELECT idCategoria
        FROM CategoriaIndividual
        WHERE nombreDeModalidad IN (
          SELECT nombreDeModalidad
          FROM CategoriaIndividual
          WHERE idCategoria = NEW.idCategoria
        )
      )
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya esta anotado para esta modalidad';

  END IF;
END; $$

CREATE TRIGGER participa_en_update BEFORE UPDATE ON ParticipaEn
FOR EACH ROW BEGIN
  IF (
    EXISTS (
      SELECT 1
      FROM ParticipaEn
      WHERE dni = NEW.dni AND
        idCategoria IN (
        SELECT idCategoria
        FROM CategoriaIndividual
        WHERE nombreDeModalidad IN (
          SELECT nombreDeModalidad
          FROM CategoriaIndividual
          WHERE idCategoria = NEW.idCategoria
        )
      )
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya esta anotado para esta modalidad';

  END IF;
END; $$

-- CREATE TRIGGER juez_insert BEFORE INSERT ON Juez
-- FOR EACH ROW BEGIN
--   IF (
--     (
--       SELECT MAX(nivelDeGraduacion)
--       FROM CategoriaIndividual
--       JOIN Categoria ON CategoriaIndividual.idCategoria = Categoria.id
--       WHERE Categoria.numeroDeRing = NEW.numeroDeRing
--     ) < (
--       SELECT nivelDeGraduacion
--       FROM Arbitro
--       WHERE Arbitro.numeroDePlaca = NEW.numeroDePlaca
--     )
--   ) THEN
--     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nivel del arbitro debe ser superior al que arbitra';

--   END IF;
-- END; $$

CREATE TRIGGER graduacion_insert BEFORE INSERT ON Graduacion
FOR EACH ROW BEGIN
  IF (
    NEW.nivel < 1 OR NEW.nivel > 6
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Las graduaciones van entre 1 y 6';

  END IF;
END; $$

CREATE TRIGGER graduacion_update BEFORE UPDATE ON Graduacion
FOR EACH ROW BEGIN
  IF (
    NEW.nivel < 1 OR NEW.nivel > 6
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Las graduaciones van entre 1 y 6';

  END IF;
END; $$

CREATE TRIGGER categoria_individual_insert BEFORE INSERT ON CategoriaIndividual
FOR EACH ROW BEGIN
  IF (
    NEW.nombreDeModalidad = 'Formas' AND NEW.nivelDeGraduacion IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La modalidad Formas no clasifica por graduacion';

  END IF;
END; $$

CREATE TRIGGER categoria_individual_update BEFORE UPDATE ON CategoriaIndividual
FOR EACH ROW BEGIN
  IF (
    NEW.dniPrimerPuesto = NEW.dniSegundoPuesto OR
    NEW.dniSegundoPuesto = NEW.dniTercerPuesto OR
    NEW.dniTercerPuesto = NEW.dniPrimerPuesto
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un competidor no puede quedar en mas de una posicion';

  ELSEIF (
      NEW.dniPrimerPuesto IS NULL AND (NEW.dniSegundoPuesto IS NOT NULL OR NEW.dniTercerPuesto IS NOT NULL)
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puede haber segundo o tercero sin primero';
  ELSEIF (
      NEW.dniPrimerPuesto IS NOT NULL AND NEW.dniSegundoPuesto IS NULL AND NEW.dniTercerPuesto IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puede haber tercero sin segundo';

  ELSEIF (
    NEW.dniPrimerPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM ParticipaEn
      WHERE idCategoria = NEW.idCategoria AND dni = NEW.dniPrimerPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El primer puesto debe haber participado en la categoria';

  ELSEIF (
    NEW.dniSegundoPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM ParticipaEn
      WHERE idCategoria = NEW.idCategoria AND dni = NEW.dniSegundoPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El segundo puesto debe haber participado en la categoria';

  ELSEIF (
    NEW.dniTercerPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM ParticipaEn
      WHERE idCategoria = NEW.idCategoria AND dni = NEW.dniTercerPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tercer puesto debe haber participado en la categoria';

  ELSEIF (
    NEW.nombreDeModalidad = 'Formas' AND NEW.nivelDeGraduacion IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La modalidad Formas no clasifica por graduacion';

  END IF;
END; $$

CREATE TRIGGER categoria_grupal_update BEFORE UPDATE ON CategoriaGrupal
FOR EACH ROW BEGIN
  IF (
    NEW.nombrePrimerPuesto = NEW.nombreSegundoPuesto OR
    NEW.nombreSegundoPuesto = NEW.nombreTercerPuesto OR
    NEW.nombreTercerPuesto = NEW.nombrePrimerPuesto
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un equipo no puede quedar en mas de una posicion';

  ELSEIF (
      NEW.nombrePrimerPuesto IS NULL AND (NEW.nombreSegundoPuesto IS NOT NULL OR NEW.nombreTercerPuesto IS NOT NULL)
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puede haber segundo o tercero sin primero';
  ELSEIF (
      NEW.nombrePrimerPuesto IS NOT NULL AND NEW.nombreSegundoPuesto IS NULL AND NEW.nombreTercerPuesto IS NOT NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puede haber tercero sin segundo';

  ELSEIF (
    NEW.nombrePrimerPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM Equipo
      WHERE idCategoria = NEW.idCategoria AND nombreDeFantasia = NEW.nombrePrimerPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El primer puesto debe haber participado en la categoria';

  ELSEIF (
    NEW.nombreSegundoPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM Equipo
      WHERE idCategoria = NEW.idCategoria AND nombreDeFantasia = NEW.nombreSegundoPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El segundo puesto debe haber participado en la categoria';

  ELSEIF (
    NEW.nombreTercerPuesto IS NOT NULL AND
    NOT EXISTS (
      SELECT 1
      FROM Equipo
      WHERE idCategoria = NEW.idCategoria AND nombreDeFantasia = NEW.nombreTercerPuesto
    )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tercer puesto debe haber participado en la categoria';

  END IF;
END; $$

DELIMITER ;
