-- Q1. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

use Human_Resources;

select 
RTRIM(first_name) as firstname 
from Employees;


-- Q2. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select
distinct dept_name,
LEN(dept_name) as dept_length
from dbo.Departments;


-- Q3. Write an SQL query to fetch nth max salaries from a table.

with nth_sal as
(
	select sid_Employee, emp_no, current_salary,
	DENSE_RANK() over (order by current_salary desc) as denserank
	from Current_Personnel 
) 
select * 
from nth_sal 
where nth_sal.denserank = N;

/* for nth max salary, place any value at the place of 'N'. For ex:- */

with nth_sal as
(
	select 
	sid_Employee, emp_no, current_salary, 
	DENSE_RANK() over (order by current_salary desc) as denserank
	from Current_Personnel
)
select *
from nth_sal
where nth_sal.denserank = 5;