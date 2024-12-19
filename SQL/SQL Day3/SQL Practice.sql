USE prod;

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(50),
    Location NVARCHAR(50)
);

-- Insert data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName, Location)
VALUES 
    (1, 'TechCorp', 'New York'),
    (2, 'MobileCo', 'San Francisco'),
    (3, 'FurniBest', 'Chicago'),
    (4, 'GadgetWorld', 'Los Angeles'),
    (5, 'PrintShop', 'Houston'),
    (6, 'AccessoriesHub', 'Seattle'),
    (7, 'SoundPlus', 'Austin');

-- Calculate subtotal for each Category using ROLLUP
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    SUM(Stock) AS TotalStock,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY ROLLUP(Category);

-- Procedure to insert a new product into Products table
CREATE PROCEDURE InsertProduct
    @ProductID INT,
    @ProductName NVARCHAR(50),
    @Category NVARCHAR(50),
    @Price DECIMAL(10, 2),
    @Stock INT,
    @Supplier NVARCHAR(50)
AS
BEGIN
    INSERT INTO Products (ProductID, ProductName, Category, Price, Stock, Supplier)
    VALUES (@ProductID, @ProductName, @Category, @Price, @Stock, @Supplier);
END;

EXEC InsertProduct @ProductID = 11, @ProductName = 'Webcam', @Category = 'Accessories', @Price = 85.00, @Stock = 100, @Supplier = 'AccessoriesHub';

Select * from Products;

-- Procedure to update the stock of a product
CREATE PROCEDURE UpdateProductStock
    @ProductID INT,
    @NewStock INT
AS
BEGIN
    UPDATE Products
    SET Stock = @NewStock
    WHERE ProductID = @ProductID;
END;
EXEC UpdateProductStock 
    @ProductID = 1, 
    @NewStock = 45;

Select * from Products;

-- Procedure to retrieve products by Category and show subtotal for total Stock
CREATE PROCEDURE GetProductsByCategory
    @Category NVARCHAR(50)
AS
BEGIN
    SELECT 
        ProductName,
        Price,
        Stock,
        Supplier
    FROM Products
    WHERE Category = @Category;

    -- Subtotal for the specified Category
    SELECT 
        @Category AS Category,
        SUM(Stock) AS TotalStock,
        AVG(Price) AS AveragePrice
    FROM Products
    WHERE Category = @Category;
END;

EXEC GetProductsByCategory @Category = 'Electronics';


