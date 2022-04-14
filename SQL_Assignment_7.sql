-- Q1. Write an SQL query to show only odd rows from a table.

-- using Human_Resources database
use Human_Resources;

with num_table as
(
	select
	*, 
	DENSE_RANK() 
		over 
		(order by emp_no) as record_num
	from Employees
)
select * 
from 
num_table
where 
record_num % 2 = 1;


-- Q2. Write an SQL query to clone a new table from another table.

-- using school database
use school;

select *
into 
students_copy
from 
students;

select * from students_copy;


