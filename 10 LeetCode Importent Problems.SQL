
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