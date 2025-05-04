CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE transactions (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- 1a. Select all transactions from the United Kingdom
SELECT * FROM transaction
WHERE Country = 'United Kingdom';

-- 1b. Get top 5 highest quantity transactions
SELECT Description, Quantity
FROM transaction
ORDER BY Quantity DESC
LIMIT 5;

-- 1c. Group by Country and get total quantity
SELECT Country, SUM(Quantity) AS TotalQuantity
FROM transaction
GROUP BY Country;

-- 1d. Group by Description and sort by total quantity sold
SELECT Description, SUM(Quantity) AS TotalSold
FROM transaction
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 5;

-- Creating customers table
CREATE TABLE customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Inserting some customer data
INSERT INTO customers VALUES
('17850', 'Alice'),
('13047', 'Bob'),
('12583', 'Charlie');

SELECT t.InvoiceNo, c.CustomerName, t.Description
FROM transaction t
INNER JOIN customers c ON t.CustomerID = c.CustomerID;

SELECT t.InvoiceNo, t.Description, c.CustomerName
FROM transaction t
LEFT JOIN customers c ON t.CustomerID = c.CustomerID;

SELECT c.CustomerName, t.InvoiceNo
FROM transaction t
RIGHT JOIN customers c ON t.CustomerID = c.CustomerID;

SELECT Description, Quantity
FROM transaction
WHERE Quantity > (
    SELECT AVG(Quantity) FROM transaction
);

SELECT Country
FROM transaction
GROUP BY Country
HAVING SUM(Quantity * UnitPrice) > 1000;

SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM transaction
GROUP BY Country
ORDER BY TotalRevenue DESC;

SELECT AVG(UnitPrice) AS AveragePrice FROM transaction;

SELECT Description, AVG(Quantity) AS AvgQty
FROM transaction
GROUP BY Description
ORDER BY AvgQty DESC
LIMIT 5;

CREATE VIEW top_products AS
SELECT Description, SUM(Quantity) AS TotalSold
FROM transaction
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 10;

SELECT * FROM top_products;



