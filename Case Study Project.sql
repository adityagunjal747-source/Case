create database bmw_car_sales;
USE bmw_car_sales;
select * from bmw_car_sales.bmw;

-- 1. Find the total number of cars sold (sum of Sales_Volume).
SELECT SUM(Sales_Volume) AS Total_Cars_Sold
FROM bmw_Car_Sales.bmw;

select * from bmw_car_sales.bmw;


-- 2. Find the average price of cars grouped by Model.
SELECT Model, AVG(Price_USD) AS Avg_Price
FROM bmw_Car_Sales.bmw
GROUP BY Model;

-- 3. List all cars priced above $100,000.
SELECT Model, Year, Region, Price_USD
FROM BMW_Car_Sales.bmw
WHERE Price_USD > 100000;

-- 4. Count how many cars are available by Fuel_Type.
SELECT Fuel_Type, COUNT(*) AS Car_Count
FROM BMW_Car_Sales.bmw
GROUP BY Fuel_Type;

-- 5. Find the most expensive car in each Region.
SELECT Region, Model, MAX(Price_USD) AS Max_Price
FROM BMW_Car_Sales.bmw
GROUP BY Region, Model
ORDER BY Max_Price DESC;

-- 6. Find the average mileage of cars by Transmission type.
SELECT Transmission, AVG(Mileage_KM) AS Avg_Mileage
FROM BMW_Car_Sales.bmw
GROUP BY Transmission;

-- 7. Get the top 5 models with highest sales volume.
SELECT Model, SUM(Sales_Volume) AS Total_Sales
FROM BMW_Car_Sales.bmw
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;

-- 8. Find the year with the highest total sales volume.
SELECT Year, SUM(Sales_Volume) AS Total_Sales
FROM BMW_Car_Sales.bmw
GROUP BY Year
ORDER BY Total_Sales DESC
LIMIT 3;

-- 9. Find the most popular car color (based on total Sales_Volume).
SELECT Color, SUM(Sales_Volume) AS Total_Sales
FROM BMW_Car_Sales.bmw
GROUP BY Color
ORDER BY Total_Sales DESC
LIMIT 3;

-- 10. Find all cars with sales classification = 'High'.
SELECT *
FROM BMW_Car_Sales.bmw
WHERE Sales_Classification = 'High';

-- 11. Calculate average engine size per model.
SELECT Model, AVG(Engine_Size_L) AS Avg_Engine_Size
FROM BMW_Car_Sales.bmw
GROUP BY Model;

-- 12. Find the region contributing the most to total sales volume.
SELECT Region, SUM(Sales_Volume) AS Total_Sales
FROM BMW_Car_Sales.bmw
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 1;

-- 13. Find cars whose price is above their region’s average price.
SELECT Model, Region, Price_USD
FROM bmw c
WHERE Price_USD > (
    SELECT AVG(Price_USD)
    FROM bmw 
    WHERE Region = c.Region
);

-- 14. Find the cheapest model in each fuel type.
SELECT Fuel_Type, Model, MIN(Price_USD) AS Min_Price
FROM BMW_Car_Sales.bmw
GROUP BY Fuel_Type, Model
ORDER BY Min_Price;

-- 15. Rank cars by price within each Region.
SELECT Model, Region, Price_USD,
       RANK() OVER (PARTITION BY Region ORDER BY Price_USD DESC) AS Price_Rank
FROM BMW_Car_Sales.bmw;

-- 16. Show sales volume percentage contribution of each model.
SELECT Model,
       SUM(Sales_Volume) AS Model_Sales,
       (SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM BMW_Car_Sales.bmw)) AS Sales_Percentage
FROM bmw_car_sales.bmw
GROUP BY Model;

-- 17. Find the average price of cars manufactured after 2020.
SELECT AVG(Price_USD) AS Avg_Price_After2020
FROM BMW_Car_Sales.bmw
WHERE Year > 2020;


-- 18. Find the most sold model in each region.

SELECT Region, Model, MAX(Sales_Volume) AS Best_Sales
FROM BMW_Car_Sales
GROUP BY Region, Model
ORDER BY Region, Best_Sales DESC;


