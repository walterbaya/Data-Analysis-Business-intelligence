

--Default Constraint
--Se usa para darle valores por defectos a las columnas

--Case 1: La tabla no existe
CREATE TABLE test_default(
	EID int DEFAULT 5,   -- por defecto va a tener un 5
	firstname VARCHAR(256) DEFAULT 'Rohit',
	lastname VARCHAR(256),
	age TINYINT 
)


INSERT INTO test_default(lastname, age) VALUES ('Singh', 34);

INSERT INTO test_default(lastname) VALUES ('Grover');

SELECT * FROM test_default;

--Case2: La tabla ya existe

ALTER TABLE test_default ADD default 25 FOR age;

INSERT INTO test_default(lastname) VALUES ('Jain');

SELECT * FROM test_default;