
-- Lesson-02: Creating Scalable Tables (Real-World Business Scenario: Enterprise Employee Management)
CREATE TABLE Department (
    DeptID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(100)
);

CREATE TABLE Employee (
    EmpID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    DeptID INT,
    Salary DECIMAL(12,2),
    JoiningDate DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_department FOREIGN KEY (DeptID) REFERENCES Department(DeptID) ON DELETE SET NULL
);

CREATE TABLE Product (
    ProductID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductName VARCHAR(200) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(12,2) CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity > 0),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(12,2),
    Status VARCHAR(50) DEFAULT 'Pending',
    CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);
