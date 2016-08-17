CREATE TABLE Categories (
            CategoryID int NOT NULL,
            CategoryName VARCHAR(255),
            Description VARCHAR(255),
            PRIMARY KEY (CategoryID)
);

CREATE TABLE Suppliers (
            SupplierID int NOT NULL ,
            SupplierName VARCHAR(255),
            ContactName VARCHAR(255),
            Address VARCHAR(255),
            City VARCHAR(255),
            PostalCode VARCHAR(255),
            Country VARCHAR(255),
            Phone VARCHAR(255),
            PRIMARY KEY (SupplierID)
);

CREATE TABLE Products (
            ProductID int NOT NULL ,
            ProductName VARCHAR(255),
            SupplierID int,
            CategoryID int,
            Unit VARCHAR(255),
            Price numeric(15,2),
            PRIMARY KEY (ProductID)
);

CREATE TABLE OrderDetails (
            OrderDetailID int NOT NULL ,
            OrderID int,
            ProductID int,
            Quantity int,
            PRIMARY KEY (OrderDetailID)
);

CREATE TABLE Orders (
            OrderID int NOT NULL ,
            CustomerID int,
            EmployeeID int,
            OrderDate DATE,
            ShipperID int,
            PRIMARY KEY (OrderID)
);

CREATE TABLE Customers (
            CustomerID int NOT NULL ,
            CustomerName VARCHAR(255),
            ContactName VARCHAR(255),
            Address VARCHAR(255),
            City VARCHAR(255),
            PostalCode VARCHAR(255),
            Country VARCHAR(255),
            PRIMARY KEY (CustomerID)
);

CREATE TABLE Employees (
            EmployeeID int NOT NULL,
            LastName VARCHAR(255),
            FirstName VARCHAR(255),
            BirthDate DATE,
            Photo VARCHAR(255),
            Notes TEXT,
            PRIMARY KEY (EmployeeID)
);

CREATE TABLE Shippers (
            ShipperID int NOT NULL,
            ShipperName VARCHAR(255),
            Phone VARCHAR(255),
            PRIMARY KEY (ShipperID)
);
