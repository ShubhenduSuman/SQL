-- Q1. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

use Human_Resources;

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
where salary_rank.denserank = 5;


-- Q2. Write an SQL query to fetch the list of employees with the same salary.

select * 
from 
Current_Personnel
where 
current_salary in
(
	select 
	current_salary 
	from 
	Current_Personnel 
	group by 
	current_salary
	having 
	count(current_salary) > 1
) 
order by 
current_salary;

