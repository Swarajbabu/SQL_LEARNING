
-- 177. Find the nth highest salary from the Employee table.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N-1;            -- Adjusting N to be zero-based index for OFFSET
  RETURN (
    select distinct salary from Employee order by salary desc limit 1 offset N
  );
END

-- 176. Alternative approaches to find the second highest salary
select (select distinct salary from Employee order by salary desc limit 1,1) as SecondHighestSalary;
--                              or                                  --
select max(salary) as SecondHighestSalary from employee where salary < (select max(salary) from employee);


-- 184. Find the employees with the highest salary in each department.
-- Step 1: Find the maximum salary for each department.
    -- SELECT departmentId, MAX(salary)
    -- FROM Employee
    -- GROUP BY departmentId;

-- Step 2: Select employees whose (departmentId, salary)
-- matches the (departmentId, maximum salary) from Step 1.
select d.name as Department,
       e.name as Employee,
       e.salary as Salary 
from Employee as e
join Department  as d
on e.departmentId = d.id
where (e.departmentId,e.salary) in (select departmentId, max(salary) from Employee group by departmentId);

-- 185. Find the customer who has placed the largest number of orders. only sinle customer will be returned
select customer_number from Orders group by customer_number order by count(*) desc limit 1;

-- // 185. Alternative approach to find the customer who has placed the largest number of orders.
-- it will return all the customers who have placed the largest number of orders.
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(*) = (
    SELECT COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_number
    ORDER BY order_count DESC
    LIMIT 1
);

-- 619. Find the numbers that appear only once in a table.
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS t;

-- 607. Find the sales_id of all salespersons who have never made a sale to the company named 'RED'.
SELECT nameFROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders AS o
    JOIN Company AS c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

-- 1141. Find the number of active users per day for the last 30 days.
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- 570. Find the names of all managers who have at least 5 direct reports.
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);