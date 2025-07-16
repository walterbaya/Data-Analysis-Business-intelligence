

SELECT * FROM Employees

SELECT firstname FROM Employees

SELECT firstname, Salary FROM Employees

SELECT firstname, lastname FROM Employees

SELECT EmployeeID, CONCAT(firstname, ' ',LastName) FROM Employees 

SELECT EmployeeID, CONCAT(firstname, ' ',LastName) [Full Name] FROM Employees 

SELECT EmployeeID, CONCAT(firstname, ' ',LastName) AS [Full Name] FROM Employees 