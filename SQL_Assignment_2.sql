/*** Since the Worker table is not available, so using Human_Resource Database ***/

use Human_Resources;

-- Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select 
left(first_name, 3) as first_3
from dbo.Employees;

-- Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select * from dbo.Employees;

-- checking the position of the alphabet 'e' in 'Anneke'

select 
CHARINDEX('e', first_name) as e_position
from dbo.Employees
where first_name = 'Anneke';

-- Q-3. Write an SQL query to print the name of employees having the highest salary in each department.

select * from [dbo].[Current_Personnel];
select * from dbo.Departments;

select 
cp.sid_Employee,
cp.emp_no,
emp.first_name,
emp.last_name,
cp.current_salary,
dept.dept_name
INTO dbo.emp_new
from dbo.Current_Personnel cp inner join
dbo.Departments dept on cp.sid_Department = dept.sid_Department inner join
dbo.Employees emp on cp.sid_Employee = emp.sid_Employee
order by sid_Employee;

select
first_name,
current_salary as max_salary_dept,
dept_name
from dbo.emp_new
where 
current_salary in (select max(current_salary) from dbo.emp_new group by dept_name);


