-- Views: Views in SQL are virtual tables that are created by querying one or more tables in the database. They allow users to simplify complex queries, encapsulate logic, and present data in a specific format without storing it physically.
-- It wont store the data physically, but it will store the query definition. When you query a view, the database executes the underlying query and returns the result set as if it were a table.

-- Creating a View:
CREATE VIEW IT_Employees AS
SELECT emp_id, name
FROM employees
WHERE department = 'IT';

-- Querying a View:
SELECT * FROM IT_Employees;

-- Modifying a View:
CREATE OR REPLACE VIEW IT_Employees AS
SELECT emp_id, name
FROM employees
WHERE department = 'IT';

-- Dropping a View:
DROP VIEW IT_Employees;

-- Listing all Views:
SHOW FULL TABLES
WHERE Table_type = 'VIEW';