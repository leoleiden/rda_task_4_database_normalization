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

-- Оновлена структура ProductInventory з ID
CREATE TABLE ProductInventory (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  ProductID INT NOT NULL,
  WarehouseID INT NOT NULL,
  Amount INT NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ID),
  FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Оновлені INSERT-записи
INSERT INTO Countries (ID, Name) VALUES 
(1, 'USA'),
(2, 'Canada');

INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES 
(1, 'Main Warehouse', '1234 Warehouse Ave', 1),
(2, 'Secondary Warehouse', '5678 Storage St', 2);

INSERT INTO Products (ID, Name) VALUES 
(1, 'iPhone 13'),
(2, 'Samsung Galaxy S21');

-- Додаємо ID в INSERT
INSERT INTO ProductInventory (ID, ProductID, WarehouseID, Amount) VALUES 
(1, 1, 1, 100),
(2, 2, 1, 50),
(3, 1, 2, 200),
(4, 2, 2, 150);
