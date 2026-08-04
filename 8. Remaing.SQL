-- select Into: Creates a new table and inserts the result of a SELECT statement into it

SELECT CustomerName, ContactName INTO Customers2 FROM Customers;

-- Create a new table with all columns from Customers where Country is 'USA'
SELECT * INTO US_Customers
FROM Customers
WHERE Country = 'USA';



-- Case statement: Used to create conditional logic in SQL queries
SELECT ProductName, Price,
CASE
  WHEN Price < 20 THEN 'Low Cost'
  WHEN Price BETWEEN 20 AND 50 THEN 'Medium Cost'
  ELSE 'High Cost'
END AS PriceCategory
FROM Products;