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
