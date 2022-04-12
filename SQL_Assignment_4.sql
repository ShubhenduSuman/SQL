use Human_Resources;

-- Q1. Write a SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
 
 select
 REPLACE(first_name, 'a', 'A') as firstname
 from dbo.Employees;


-- Q2. Write a SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from emp_new

/* 'emp_new' table; created by joining current_personnel, department & employee tables. */

select *
from emp_new
order by 
first_name asc , dept_name desc;


-- Q3. Write an SQL query to fetch the names of workers who earn the highest salary.

select
emp_no,
first_name,
last_name,
current_salary
from emp_new
order by 
current_salary desc;

