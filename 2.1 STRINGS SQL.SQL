-- 1. Database Setup
-- Create a new database named mom
CREATE DATABASE mom;

-- Switch to the mom database
USE mom;

-- 2. Create Table
-- Table to store employee details
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(100),
    department VARCHAR(30),
    phone VARCHAR(20)
);

-- 3. Insert Sample Data
-- Insert 5 sample employee records
INSERT INTO employees VALUES
(1, 'Swaraj', 'Babu', 'Swaraj.Babu@gmail.com', 'IT', '9876543210'),
(2, 'Rahul', 'Kumar', 'rahul.kumar@yahoo.com', 'HR', '9876501234'),
(3, 'Priya', 'Sharma', 'priya.sharma@gmail.com', 'Finance', '9123456780'),
(4, 'Amit', 'Verma', 'amit.verma@gmail.com', 'IT', '9988776655'),
(5, 'Sneha', 'Reddy', 'sneha.reddy@yahoo.com', 'Marketing', '9000011111');

-- ==========================================
-- STRING FUNCTIONS
-- ==========================================

-- LENGTH: Returns length of string in bytes
-- CHAR_LENGTH: Counts total number of characters
SELECT first_name, LENGTH(first_name) AS length FROM employees;
SELECT first_name, CHAR_LENGTH(first_name) AS characters FROM employees;

-- UPPER: Converts text to uppercase (capital letters)
-- LOWER: Converts text to lowercase (small letters)
SELECT UPPER(first_name) AS uppercase_name FROM employees;
SELECT LOWER(email) AS lowercase_email FROM employees;

-- CONCAT: Joins two or more strings together
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- CONCAT_WS: Joins strings using a separator (With Separator: '-')
SELECT CONCAT_WS('-', first_name, last_name, department) FROM employees;

-- SUBSTRING: Extracts part of a string (starts at position 1, takes 3 characters)
SELECT SUBSTRING(first_name, 1, 3) FROM employees;

-- LEFT: Takes characters from the beginning (first 3 letters)
-- RIGHT: Takes characters from the end (last 3 letters)
-- MID: Same as SUBSTRING (starts at position 2, takes 3 characters)
SELECT LEFT(first_name, 3) FROM employees;
SELECT RIGHT(first_name, 3) FROM employees;
SELECT MID(first_name, 2, 3) FROM employees;

-- TRIM: Removes spaces from both start and end
-- LTRIM: Removes spaces from the left side only
-- RTRIM: Removes spaces from the right side only
SELECT TRIM(first_name) AS name FROM employees;
SELECT LTRIM(first_name) AS name FROM employees;
SELECT RTRIM(first_name) AS name FROM employees;

-- REVERSE: Reverses the letters in a string
SELECT REVERSE(first_name) FROM employees;

-- REPEAT: Repeats a string multiple times (repeats 3 times)
SELECT REPEAT(first_name, 3) FROM employees;

-- REPLACE: Replaces text with new text (changes 'gmail.com' to 'outlook.com')
SELECT REPLACE(email, 'gmail.com', 'outlook.com') FROM employees;

-- ASCII: Returns the numeric ASCII code of the first character
SELECT ASCII(first_name) FROM employees;

-- INSERT: Inserts text into a string (starts at pos 1, replaces 0 chars, adds 'Mr. ')
SELECT INSERT(first_name, 1, 0, 'Mr. ') FROM employees;

-- INSTR: Finds the position of a specific character (finds '@' in email)
SELECT INSTR(email, '@') AS position FROM employees;

-- SPACE: Generates blank spaces (adds 3 spaces between names)
SELECT CONCAT(first_name, SPACE(3), last_name) FROM employees;

-- ==========================================
-- PRACTICE: COMBINING FUNCTIONS
-- ==========================================

-- Combines CONCAT (join names) and UPPER (convert result to capital letters)
SELECT UPPER(CONCAT(first_name, ' ', last_name)) FROM employees;
