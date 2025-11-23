CREATE DATABASE [SQL Basics Questions] 

USE [SQL Basics Questions]


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);

--1) Obtener todas las columnas de la tabla de empleados

SELECT * FROM employees;


--2) Obtener solamente el FirstName y LastName de la tabla de empleados

SELECT firstname, lastname FROM employees;

--3) Obtener todos los empleados que trabajan en 'IT'

SELECT * FROM employees WHERE department = 'IT';

--4) Obtener todos los empleados con salario mayor a 70,000

SELECT * FROM employees WHERE salary > '70000';

--5) Ordenar los resultados por LastName en orden ascendente

SELECT * FROM employees ORDER BY lastname ASC;

--6) Selecciona todos los distintos departamentos de la tabla de empleados

SELECT DISTINCT department FROM employees;

--7) Conta el numero de empleados en cada departamento

SELECT department, COUNT(*) [Number Of Employees] FROM employees GROUP BY department;

--8) Encontra el salario maximo en la tabla de empleados

SELECT MAX(salary) [Max Salary From Finance Department] FROM employees WHERE department = 'finance';

--9) Halla el salario promedio de los empleados en el departamento de finanzas

SELECT AVG(salary) [Average Salary From Employees In Finance] FROM employees WHERE department = 'finance';

--10) Obtene todos los empleados cuyo LastName empiece con 'M'

SELECT * FROM employees WHERE lastname LIKE 'M%';

