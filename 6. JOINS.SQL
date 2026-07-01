use college1;
CREATE TABLE EMP (
    EMP_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    DEPT_ID INT
);

INSERT INTO EMP VALUES
(1, 'Amit', 101),(2, 'Rahul', 102),
(3, 'Sneha', 101),(4, 'Priya', 103),
(5, 'Rohit', 104),(6, 'Anita', 102),
(7, 'Vikas', 105),(8, 'Neha', 101),
(9, 'Suresh', NULL),(10, 'Pooja', 106);

CREATE TABLE DEPT (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

INSERT INTO DEPT VALUES
(101, 'IT'),(102, 'HR'),
(103, 'Finance'),(104, 'Sales'),
(105, 'Marketing'),(106, 'Support'),
(107, 'Admin'),(108, 'Research'),
(109, 'Security'),(110, 'Training');

select * from DEPT;
select * from EMP;

--- INNER JOIN: Returns records that have matching values in both tables
--- syntax: SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;
--- example:
select * from EMP inner join DEPT on DEPT.DEPT_ID = EMP.DEPT_ID;

--- using alias names for tables
select * from EMP as E inner join DEPT as D on D.DEPT_ID = E.DEPT_ID;

--- left JOIN: Returns all records from the left table (EMP), and the matched records from the right table (DEPT). The result is NULL from the right side, if there is no match.
select * from EMP left join dept on Dept.DEPT_ID = emp.dept_id;

--- right JOIN: Returns all records from the right table (DEPT), and the matched records from the left table (EMP). The result is NULL from the left side, when there is no match.
select * from emp right join dept on Dept.DEPT_ID = emp.dept_id;

--- FULL JOIN: Returns all records when there is a match in either left (EMP) or right (DEPT) table records
--- Note: FULL JOIN is not directly supported in MySQL, but can be achieved using UNION of LEFT JOIN and RIGHT JOIN
SELECT * FROM EMP
LEFT JOIN SALARY ON EMP.EMP_ID = SALARY.EMP_ID
UNION
SELECT EMP.EMP_ID, EMP.NAME, SALARY.SALARY
FROM EMP
RIGHT JOIN SALARY ON EMP.EMP_ID = SALARY.EMP_ID;


--- SELF JOIN: A self join is a regular join, but the table is joined with itself.
SELECT * from EMP as E join  as E on E1




---------------------------------------------------------------------------------------------------------

-- SELECT columns
-- FROM Table1 T1
-- JOIN Table2 T2
-- ON T1.common_column = T2.common_column;

-- INNER JOIN
-- = Common records only

-- LEFT JOIN
-- = All Left + Matching Right

-- RIGHT JOIN
-- = All Right + Matching Left

-- FULL JOIN
-- = Everything from both tables

-- CROSS JOIN
-- = Every possible combination

-- SELF JOIN
-- = Table joined with itself

----------------------------------------------------------------------------------------------------------
-- If I am having two tables with common column and I want to fetch data from both the tables then I will use join

create database babu1;
use babu1;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Employees VALUES
(1,'Ram',101),
(2,'Shyam',102),
(3,'Mohan',103),
(4,'Ravi',101),
(5,'Sita',NULL);

INSERT INTO Departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Sales'),
(104,'Marketing');

SELECT * FROM Employees;
SELECT * FROM Departments;

-- INNER JOIN: Returns records that have matching values in both tables
select E.EmpName,D.DeptName from 
Employees E
inner join Departments D on
E.DeptID = D.DeptID;

-- LEFT JOIN: Returns all records from the left table (Employees), and the matched records from the right table (Departments). The result is NULL from the right side, if there is no match.
SELECT E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D
ON E.DeptID = D.DeptID;

-- RIGHT JOIN: Returns all records from the right table (Departments), and the matched records from the left table (Employees). The result is NULL from the left side, when there is no match.
SELECT E.EmpName, D.DeptName
FROM Employees E
RIGHT JOIN Departments D
ON E.DeptID = D.DeptID;

-- FULL JOIN: Returns all records when there is a match in either left (Employees) or right (Departments) table records
SELECT E.EmpName, D.DeptName
FROM Employees E
left JOIN Departments D
ON E.DeptID = D.DeptID

union

select E.EmpName, D.DeptName
from Employees E
right join Departments D
on E.DeptID = D.DeptID;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- If I am having 3 tables with common column and I want to fetch data from all the tables then I will use join

