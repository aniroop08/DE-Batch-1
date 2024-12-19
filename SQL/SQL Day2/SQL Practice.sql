Create database prod;
Use prod;

-- Creating a new Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    Supplier NVARCHAR(50)
);

-- Inserting data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock, Supplier)
VALUES 
    (1, 'Laptop', 'Electronics', 1200.00, 50, 'TechCorp'),
    (2, 'Smartphone', 'Electronics', 800.00, 100, 'MobileCo'),
    (3, 'Desk Chair', 'Furniture', 150.00, 20, 'FurniBest'),
    (4, 'Tablet', 'Electronics', 400.00, 75, 'GadgetWorld'),
    (5, 'Printer', 'Office Supplies', 200.00, 30, 'PrintShop'),
    (6, 'Office Desk', 'Furniture', 300.00, 10, 'FurniBest'),
    (7, 'Monitor', 'Electronics', 250.00, 60, 'TechCorp'),
    (8, 'Keyboard', 'Accessories', 50.00, 200, 'AccessoriesHub'),
    (9, 'Mouse', 'Accessories', 25.00, 250, 'AccessoriesHub'),
    (10, 'Headphones', 'Accessories', 75.00, 150, 'SoundPlus');

-- Update the price of a product in the Products table
UPDATE Products
SET Price = 1300.00
WHERE ProductID = 1;

-- Delete a product from the Products table
DELETE FROM Products
WHERE ProductID = 2;

-- Select ProductName and Category from the Products table
SELECT ProductName, Category
FROM Products;

-- Retrieve all rows for products in the Electronics category
SELECT * 
FROM Products 
WHERE Category = 'Electronics';


-- Retrieve all products with a price greater than 100
SELECT * 
FROM Products 
WHERE Price > 100;

-- IN: Filter products in specific categories
SELECT * 
FROM Products 
WHERE Category IN ('Electronics', 'Furniture');

-- DISTINCT: List unique categories in the Products table
SELECT DISTINCT Category 
FROM Products;

-- AND/OR: Filter products with a price above 100 and in the Electronics category
SELECT * 
FROM Products 
WHERE Price > 100 AND Category = 'Electronics';

-- BETWEEN: Select products with a price between 50 and 300
SELECT * 
FROM Products 
WHERE Price BETWEEN 50 AND 300;

-- LIKE: Select products with names starting with 'L'
SELECT * 
FROM Products 
WHERE ProductName LIKE 'L%';

-- Column & Table Aliases: Use aliases for a clearer output
SELECT P.ProductName AS Name, P.Price AS Cost 
FROM Products AS P;

-- String Function: Convert ProductName to uppercase
SELECT UPPER(ProductName) AS ProductNameUpper 
FROM Products;

-- Date Function: Get the current date
SELECT GETDATE() AS CurrentDate;

-- Mathematical Function: Round the Price to the nearest integer
SELECT ROUND(Price, 0) AS RoundedPrice 
FROM Products;


-- System Function: Get the current system user
SELECT SYSTEM_USER AS CurrentUser;

-- Group by Category and count products in each category
SELECT Category, COUNT(*) AS ProductCount 
FROM Products 
GROUP BY Category;

-- Calculate the average price of products
SELECT AVG(Price) AS AveragePrice 
FROM Products;

--Filter Data using SQL Queries
SELECT * FROM Products WHERE Category = 'Electronics' AND Price > 100;

--Total Aggregations using SQL Queries
SELECT SUM(Price) AS TotalPrice 
FROM Products;


--Group By Aggregations using SQL Queries
SELECT Category, AVG(Price) AS AvgPrice 
FROM Products 
GROUP BY Category;

--Order of Execution of SQL Queries
SELECT Category, COUNT(*) AS CategoryCount
FROM Products 
WHERE Price > 100 
GROUP BY Category 
ORDER BY CategoryCount DESC;

--Rules and Restrictions to Group and Filter Data in SQL Queries
SELECT Category, AVG(Price) AS AvgPrice
FROM Products 
WHERE Price > 100 
GROUP BY Category 
HAVING AVG(Price) > 200;

--Filter Data based on Aggregated Results using Group By and Having
SELECT Category, COUNT(*) AS NumProducts 
FROM Products 
GROUP BY Category 
HAVING COUNT(*) > 1;



