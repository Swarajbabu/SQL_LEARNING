CREATE DATABASE college;
USE college;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumi", 93, "A", "Mumbai"),
(103, "omkar", 85, "B", "Mumbai"),
(104, "raj", 96, "A", "Delhi"),
(105, "chetan", 72, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

-- order of mentioning clauses in sql query 
--- select
--- from 
--- join 
--- where 
--- group by 
--- having
--- order by
--- limit

SELECT * FROM student;

-- learning about the different types of select queries

-- to select all the data from the table
select * from student;

-- if we want to see the only 3 columens of data
select rollno,name,grade from student;

-- to select data with condition we called where clause
select * from student where city="Delhi";

-- to select data with condition on marks we called where clause
select * from student where marks>80;

-- to select data with multiple conditions we use AND , OR operators
select * from student where marks>=85 and city="Mumbai";

-- to select data with distinct values or unigue values 
select distinct city from student; -- it will give only unique city names
--output
-- Pune
-- Mumbai
-- Delhi


-- Arithmetic Operators: + (add), - (subtract), * (multiply), / (divide), % (modulus)
-- Comparison Operators: =, !=, >, <, >=, <=
-- Logical Operators: AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY, <> or != (symbol in sql or not equal to)
-- Bitwise Operators: & (AND), | (OR)

-- using logical operators
select * from student where marks between 80 and 90; 
select * from student where marks>=90 or city="Pune";
select * from student where not city="Delhi";
select * from student where marks>=85 ALL;
select * from student where marks<=70 ANY;
select * from student where city in ("Mumbai","Delhi");
select * from student where city not in ("Mumbai","Pune");
select * from student where city like "D%"; -- cities starting with D
select * from student where city like "%i"; -- cities ending with i
select * from student where marks <> 85 or marks not null; -- marks not equal to 85 and marks not null

-- limit clause where we can limit the number of rows to be displayed
select * from student limit 3;

-- limit with condition
select * from student where marks>=80 limit 4;

-- order by clause is used to sort the data in ascending or descending order
select * from student order by marks asc; -- ascending order
select * from student order by marks desc;-- descending order
select * from student where marks > 80 order by marks desc; -- condition with order by marks > 80 and order by desc
select * from student order by grade asc; -- order by grade in ascending order A to Z


-- aggregate functions in sql
-- count() , sum() , avg() , min() , max()


select count(*) from student; -- it will give the total number of rows present in the table
select sum(marks) from student; --sum of all marks
select avg(marks)  from student;  -- average of all marks
select min(marks) from student; -- minimum marks
select max(marks) from student;  -- maximum marks
select Round(avg(marks),2) from student; -- average of marks with 2 decimal places
select length(name),name from student; 
select left(name,3) from student; -- it will give first 3 characters of name EX : Swaraj -- swa
select right(name,3) from student; -- it will give last 3 characters of name EX : Swaraj -- raj

-- group by clause in sql
-- it is used to group the data based on one or more columns
-- grade wise average marks
select grade , avg(marks) from student group by grade order by grade asc;

-- city wise count of students in descending order of city
select city , count(rollno) as City_wise_students from student group by city order by city desc;

--city wise maximum marks
select city, max(marks) as Hig_Marks_city_wise from student group by city; 

--city wise minimum marks
select city, min(marks) as low_marks_city_wise from student group by city;

-- grade wise count of students in ascending order of grade
select grade, count(rollno) as grade_wise_count from student group by grade order by grade asc; 

-- city and grade wise count of students ordered by grade in ascending order
select city,grade ,count(rollno) as city_grade_wise_count from student group by city,grade order by grade asc;

-- city wise average marks having average marks greater than 80 using having clause
select city, avg(marks) from student group by city having avg(marks)>80;