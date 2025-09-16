create database if not exists cars_data;

use cars_data;
select * from cars;
select * from customers;
select * from sales;
select * from dealers;



CREATE TABLE Cars (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    FuelType VARCHAR(20),
    Price DECIMAL(12,2)
);
INSERT INTO Cars (Brand, Model, Year, FuelType, Price) VALUES
('Toyota', 'Corolla', 2020, 'Petrol', 1200000.00),
('Honda', 'Civic', 2021, 'Diesel', 1500000.00),
('Hyundai', 'Creta', 2022, 'Petrol', 1800000.00),
('Tata', 'Nexon EV', 2023, 'EV', 1700000.00),
('Mahindra', 'Scorpio', 2019, 'Diesel', 1600000.00),
('Maruti', 'Swift', 2021, 'Petrol', 800000.00),
('Kia', 'Seltos', 2022, 'Petrol', 1500000.00),
('Ford', 'Ecosport', 2020, 'Diesel', 1100000.00),
('BMW', 'X5', 2023, 'Petrol', 7500000.00),
('Mercedes', 'C-Class', 2022, 'Diesel', 6000000.00);


-- 2. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);
INSERT INTO Customers (FirstName, LastName, City, Phone, Email) VALUES
('Amit', 'Sharma', 'Mumbai', '9876543210', 'amit.sharma@example.com'),
('Priya', 'Patil', 'Pune', '9823456789', 'priya.patil@example.com'),
('Rohan', 'Mehta', 'Delhi', '9812345678', 'rohan.mehta@example.com'),
('Sneha', 'Kulkarni', 'Bangalore', '9898765432', 'sneha.kulkarni@example.com'),
('Vikas', 'Verma', 'Chennai', '9765432189', 'vikas.verma@example.com'),
('Neha', 'Gupta', 'Hyderabad', '9754312890', 'neha.gupta@example.com'),
('Karan', 'Yadav', 'Ahmedabad', '9743210987', 'karan.yadav@example.com'),
('Meera', 'Nair', 'Kochi', '9732109876', 'meera.nair@example.com'),
('Siddharth', 'Singh', 'Lucknow', '9721098765', 'siddharth.singh@example.com'),
('Pooja', 'Chopra', 'Jaipur', '9710987654', 'pooja.chopra@example.com');


-- 3. Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    CustomerID INT,
    SaleDate DATE,
    SalePrice DECIMAL(12,2),
    PaymentMode VARCHAR(20),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
    INSERT INTO Sales (CarID, CustomerID, SaleDate, SalePrice, PaymentMode) VALUES
(1, 3, '2023-05-12', 1180000.00, 'Cash'),
(2, 5, '2023-06-18', 1490000.00, 'Credit Card'),
(3, 1, '2023-07-25', 1800000.00, 'Net Banking'),
(4, 7, '2023-08-10', 1695000.00, 'UPI'),
(5, 2, '2023-09-14', 1580000.00, 'Cash'),
(6, 9, '2023-10-05', 790000.00, 'Debit Card'),
(7, 4, '2023-11-22', 1495000.00, 'Net Banking'),
(8, 8, '2023-12-30', 1080000.00, 'Cash'),
(9, 6, '2024-01-15', 7400000.00, 'Credit Card'),
(10, 10, '2024-02-20', 5950000.00, 'UPI');

-- 4 . Dealers Table 
CREATE TABLE Dealers (
    DealerID INT PRIMARY KEY AUTO_INCREMENT,
    DealerName VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15)
);

INSERT INTO Dealers (DealerName, City, Phone) VALUES
('Star Motors', 'Mumbai', '9811111111'),
('Speed Auto', 'Pune', '9822222222'),
('Green Wheels', 'Delhi', '9833333333');


--  List top 5 most expensive cars
SELECT Brand, Model, Price 
FROM Cars 
ORDER BY Price DESC 
LIMIT 5;


-- Find city with the highest number of customers
SELECT City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY City
ORDER BY TotalCustomers DESC
LIMIT 1;

-- Find which brand generated the highest sales
SELECT ca.Brand, SUM(s.SalePrice) AS TotalSales
FROM Sales s
JOIN Cars ca ON s.CarID = ca.CarID
GROUP BY ca.Brand
ORDER BY TotalSales DESC
LIMIT 1;


    