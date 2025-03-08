-- Creating Customer Table with Enhanced Data Points
CREATE TABLE Customer (
    CustomerID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    City VARCHAR(100),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserting Customers
INSERT INTO Customer (CustomerName, Email, City) VALUES
    ('Emma Watson', 'emma@email.com', 'New York'),
    ('Daniel Radcliffe', 'daniel@email.com', 'London');

-- Enhanced Order Processing with Advanced Insights
ALTER TABLE Orders ADD COLUMN OrderType VARCHAR(50) DEFAULT 'Online';

-- Advanced Business Queries for Sales Insights
-- 1. Top 5 Best-Selling Products in the Last 6 Months
SELECT p.ProductName, SUM(o.Quantity) AS TotalSold
FROM Orders o
JOIN Product p ON o.ProductID = p.ProductID
WHERE o.OrderDate >= NOW() - INTERVAL '6 months'
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 5;

-- 2. Identifying High-Value Customers
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;

-- 3. Revenue Growth Trends
SELECT DATE_TRUNC('month', OrderDate) AS Month, SUM(TotalAmount) AS Revenue
FROM Orders
GROUP BY Month
ORDER BY Month;

-- 4. Customer Retention Analysis
SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY OrderCount DESC;

-- 5. Dynamic Pricing Strategy Based on Sales Trends
UPDATE Product
SET Price = Price * 1.1
WHERE ProductID IN (
    SELECT ProductID FROM Orders WHERE OrderDate >= NOW() - INTERVAL '3 months'
);

-- Optimized and Future-Ready for 2025 Use Case
