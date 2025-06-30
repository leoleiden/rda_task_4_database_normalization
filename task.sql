DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouses (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  CountryID INT NOT NULL,
  FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE ProductInventory (
  ProductID INT NOT NULL,
  WarehouseID INT NOT NULL,
  Amount INT NOT NULL,
  PRIMARY KEY (ProductID, WarehouseID),
  FOREIGN KEY (ProductID) REFERENCES Products(ID),
  FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Додавання тестових даних
INSERT INTO Countries (ID, Name) VALUES 
(1, 'USA'),
(2, 'Canada');

INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES 
(1, 'Main Warehouse', '1234 Warehouse Ave', 1),
(2, 'Secondary Warehouse', '5678 Storage St', 2);

INSERT INTO Products (ID, Name) VALUES 
(1, 'iPhone 13'),
(2, 'Samsung Galaxy S21');

INSERT INTO ProductInventory (ProductID, WarehouseID, Amount) VALUES 
(1, 1, 100),
(2, 1, 50),
(1, 2, 200),
(2, 2, 150);
