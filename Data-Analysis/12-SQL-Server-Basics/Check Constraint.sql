-- Check Constraint

-- Comprueba que se cumplan ciertas condiciones
-- Si fallan las condiciones no vamos a poder insertar en la tabla el registro.

--Case 1: Table no existe

CREATE TABLE test_check (
	EID INT,
	firstname VARCHAR(256),
	age TINYINT CHECK(age >= 10)
);


INSERT INTO test_check VALUES (1, 'Mayank', '20');

--Como no cumple con el check no permite ingresarlo
--Check es una validacion que hacemos para las columnas
INSERT INTO test_check VALUES (1, 'Mayank', 9);


SELECT * FROM test_check;


-- Case 2: Tabla existe

--Si ya hay valores que violan la restriccion no nos va a permitir
--Crear la restriccion

UPDATE test_check SET EID = 11 WHERE EID = 1;

ALTER TABLE test_check ADD check (eid > 5);

--Esto va a fallar, no nos va a permitir ingresar este valor.
INSERT INTO test_check VALUES(3, 'Nitin', 34);