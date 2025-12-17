CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

--En el caso de Row Number en caso de empate se asignan de forma aleatoria cual va 
--Primero y cual va segundo
SELECT *, ROW_NUMBER() OVER(ORDER BY marks DESC) AS [Row Number]
FROM Students;


--Si hay un empate en la funcion RANK el proximo valor que toma se skippea 
SELECT *, RANK() OVER(ORDER BY marks DESC) AS [Rank Function] FROM Students;

--Este DENSE_RANK no hace SKIP sino que le pone el numero siguiente en caso de empate
--Deja los dos 11 por ejemplo y luego pasa al 2
SELECT *, DENSE_RANK() OVER(ORDER BY marks DESC) [Dense Rank] FROM Students;

--El orden podria ser ASC obviamente sin ningun problema, si eliminamos el DESC directamente 
--Se ordena ascendente

SELECT * FROM Students;

SELECT *, ROW_NUMBER() OVER(PARTITION BY subject ORDER BY marks DESC) [Row Number] FROM Students;

SELECT *, ROW_NUMBER() OVER(PARTITION BY subject ORDER BY marks) [Row Number] FROM Students;

SELECT *, ROW_NUMBER() OVER(PARTITION BY student_name ORDER BY marks DESC) [Row Number] FROM Students;

SELECT *,RANK() OVER(PARTITION BY student_name ORDER BY marks DESC) [Rank Desc] FROM Students;

SELECT *,RANK() OVER(PARTITION BY subject ORDER BY marks DESC) [Rank Desc] FROM Students;

SELECT *, DENSE_RANK() OVER(PARTITION BY subject ORDER BY marks DESC) [Dense Rank DESC] FROM Students;

SELECT *, DENSE_RANK() OVER(PARTITION BY student_name ORDER BY marks DESC) [Dense Rank DESC] FROM Students;