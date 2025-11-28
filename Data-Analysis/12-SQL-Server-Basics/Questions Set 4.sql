create database [SQL Questions 3]

use [SQL Questions 3]

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);


SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;

--1) Identify pairs of customers in the same country

SELECT c1.Country, c1.CustomerID, c1.CustomerName,c2.CustomerID, c2.CustomerName FROM Customers c1 INNER JOIN Customers c2 ON c1.Country = c2.Country AND c1.CustomerName <> c2.CustomerName AND c1.CustomerID < c2.CustomerID;

--2) Find the customer who has spent the most on their orders

SELECT TOP 1 c.CustomerName [Customer Name], SUM(p.Price) [Price Sum] FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID INNER JOIN Products p ON p.ProductID = o.ProductID GROUP BY c.CustomerName ORDER BY SUM(p.Price) DESC;

--3) Find customers who have ordered more than one type of products

-- Hay que elegir entre todos los clientes, hacer un inner join otra vez con las ordenes y con los productos, y seleccionar donde sum > 2

SELECT DISTINCT c.CustomerName, COUNT(p.ProductID) FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID INNER JOIN Products p ON p.ProductID = o.ProductID GROUP BY c.CustomerName HAVING COUNT(p.ProductID) > 1;

--4) List all products and their corresponding orders, using RIGHT JOIN, including products that have never been ordered 

SELECT ProductName, Price, OrderID, OrderDate FROM Orders o RIGHT JOIN Products p ON o.ProductID = p.ProductID; 

--5) Retrieve all orders placed by customers from the USA.

SELECT DISTINCT OrderID, OrderDate, CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID WHERE c.Country = 'USA';

--6) Find the names of customers who have ordered a product priced aboce $500 

SELECT DISTINCT ProductName, Price FROM 
Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN Products p ON p.ProductID = o.ProductID 
WHERE p.Price > '500';


INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(106, 2, '2024-09-04', 1001);


--7) Find the customers who have ordered the same product more than once

SELECT c.CustomerID, o.ProductID FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, o.ProductID HAVING COUNT(*) > 1;  


-- Yo lo que quiero hacer es contar la cantidad de veces que un mismo producto
-- Fue comprado por un customer
-- Eso seria ver la tabla de orders y ver cuantas veces aparece un mismo productID
-- Dado un CustomerID 

  