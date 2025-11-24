create database [SQL Questions]

use [SQL Questions]

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

--Write an SQL Query to find names of customers who have placed an order

SELECT DISTINCT c.CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

--Find the list of customers who have not placed any orders

SELECT DISTINCT c.CustomerName FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID WHERE OrderID IS NULL;

--List all orders along with the product name and price

SELECT o.OrderID, o.OrderDate, p.ProductName, p.Price FROM Orders o INNER JOIN Products p ON o.ProductID = p.ProductID;

--Find the names of customers and their orders, including customers who haven't placed any order

SELECT DISTINCT c.CustomerName, o.OrderID FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

--Retrieve a list of products that have never been ordered

SELECT DISTINCT p.ProductName FROM Products p LEFT JOIN Orders o ON p.ProductID = o.ProductID WHERE o.OrderID IS NULL;

--Find the total number of orders placed by each customer

SELECT c.CustomerName, COUNT(o.OrderID) [Total Number Of Orders] FROM Orders o RIGHT JOIN Customers c ON c.CustomerID = o.CustomerID  GROUP BY c.CustomerName;

--Display the customers, the products they've ordered and the order date. Include customers 
--who haven't placed any orders.

SELECT * FROM Orders o LEFT JOIN Customers c ON c.CustomerID = o.CustomerID LEFT JOIN Products p ON p.ProductID = o.ProductID; 