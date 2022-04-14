-- Q1. Write an SQL query to show the top n (say 10) records of a table.

use Human_Resources;

select top 10 * 
from
Employees;


-- Q2. Write an SQL query to determine the nth (say n=5) highest salary from a table.

with salary_rank 
as 
(
	select *, 
	DENSE_RANK() 
		over 
		(order by current_salary desc) as denserank
	from 
	Current_Personnel
)
select * 
from salary_rank
where 
salary_rank.denserank = 5;

