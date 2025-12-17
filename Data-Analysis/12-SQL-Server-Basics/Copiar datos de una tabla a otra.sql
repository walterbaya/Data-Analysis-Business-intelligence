DROP TABLE Sales;

CREATE TABLE Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)
);

INSERT INTO Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 6, 120.00, 104, 2, 201, NULL),
(1, '2023-08-03', 12, 300.00, 105, 3, 205, 'Credit Card'),
(3, '2023-08-04', 7, 140.00, 106, 3, 206, 'Debit Card'),
(1, '2023-08-05', 9, 270.00, 107, 2, 202, NULL),
(2, '2023-08-06', 15, 375.00, 108, 1, 207, 'Cash'),
(1, '2023-08-07', 4, 140.00, 109, 2, 203, 'Credit Card'),
(NULL, '2024-12-13', NULL, NULL, NULL, NULL, NULL, NULL);



-- Case 1: La tabla a la que se va a copiar no existe

SELECT * FROM Sales;

--Esto copiara el contenido de Sales en Sales_Copy

SELECT * INTO Sales_Copy FROM Sales;

SELECT * FROM Sales_Copy; 


--Podemos Copiar algunas columnas solamente

SELECT productid, quantity INTO ProductQuantity FROM Sales;

SELECT * FROM ProductQuantity;


-- Case 2: La estructura de la tabla ya existe y solo queremos pasar el contenido.

--Podemos copiar solamente la estructura con SELECT TOP 0

SELECT TOP 0 * INTO Sales_Structure FROM Sales;

SELECT * FROM Sales_Structure;

--Aca insertamos todo lo de sales en sales structure
INSERT INTO Sales_Structure SELECT * FROM Sales;
