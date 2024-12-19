-- Create Customers table
CREATE DATABASE StoreDB;

-- Use Database
USE StoreDB;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES 
(1, 'Aniroop', 'Kanpur'),
(2, 'Akash', 'Pune'),
(3, 'Subrat', 'Jaipur'),
(4, 'Harish', 'Goa'),
(5, 'Shreyansh', 'Delhi'),
(6, 'Anjum', 'Noida'),
(7, 'Nahin', 'Kashmir'),
(8, 'Savi', 'Patna'),
(9, 'Prajjwal', 'Merrut'),
(10, 'Ambati', 'Chennai');

Select * from Customers;

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES 
(101, 1, '2024-01-15', 150.00),
(102, 2, '2024-02-20', 200.00),
(103, 1, '2024-03-10', 300.00),
(104, 3, '2024-03-15', 120.00),
(105, 3, '2024-04-05', 180.00),
(106, 4, '2024-05-10', 220.00),
(107, 5, '2024-05-20', 90.00),
(108, 6, '2024-06-15', 400.00),
(109, 7, '2024-06-20', 250.00),
(110, 8, '2024-07-10', 180.00);

Select * from Orders;

SELECT Orders.OrderID, Customers.CustomerName, Orders.Amount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Amount > 150
);

SELECT SUM(Amount) AS TotalQ1Amount
FROM Orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-03-31';


SELECT Customers.CustomerID, Customers.CustomerName, SUM(Orders.Amount) AS TotalAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Amount > 150
)
GROUP BY Customers.CustomerID, Customers.CustomerName;

SELECT CustomerID, SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY CustomerID;

SELECT CustomerID, SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) > 250;

