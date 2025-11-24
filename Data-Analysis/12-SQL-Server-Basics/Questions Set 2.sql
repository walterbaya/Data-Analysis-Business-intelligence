-- Depende de Questions Set 1, porque alli se generan las tablas.

SELECT * FROM Employees;

--1 Como obtenemos todos los empleados que trabajan en 'IT' y tienen salario mayor a 75.000?

SELECT * FROM employees WHERE department = 'IT' AND salary > '75000';

--2 Como encontramos los empleados que trabajan en el departamento 'Finance'?

SELECT * FROM employees WHERE department != 'FINANCE';

--3 Como obtenemos los empleados que trabajan en 'HR' o que tengan un salario menor a 60.000

SELECT * FROM employees WHERE Department = 'HR' OR Salary < '60000';

--4 Como encontramos los empleados cuyo salario esta entre 60000 y 70000 y que ademas trabajen en 'Finance'

SELECT * FROM employees WHERE Salary BETWEEN 60000 AND 70000 AND Department = 'Finance';

--5 Como encontramos todos los empleados que trabajen en el departamento 'IT' y que no tengan un salario mas grande que 80000

SELECT * FROM employees WHERE Department = 'IT' AND NOT Salary > '80000';

--6 Como obtenemos todos los empleados que trabajen en 'HR' o 'Finance' y tengan un salario mas grande que 65000

SELECT * FROM employees WHERE (Department = 'HR' OR Department = 'Finance') AND Salary > '65000'; 

--7 Como obtenemos los empleados cuyo lastname empiece con 'D' y que no trabajen en 'HR'

SELECT * FROM employees WHERE LastName LIKE 'D%' AND (NOT Department = 'HR');

--8 Como encontramos los empleados que no trabajan en 'IT' y que tengan un salario mas grande que 70000

SELECT * FROM Employees WHERE Department <> 'IT' AND Salary > '70000';

--9 Como seleccionamos los empleados que trabajen en 'IT' y qie ademas tengan un salario mas grande que 75000 pero su primer nombre no empiece con 'La'

SELECT * FROM Employees WHERE Department = 'IT' AND Salary > '75000';

--10 Como encontramos los empleados que no trabajen en 'HR' o en los departamentos de 'IT'

SELECT * FROM Employees WHERE Department <> 'HR' AND Department <> 'IT';