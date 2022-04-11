/* 
Write a Query to add an employee who earlier was the part of the organisation and now back to join the oragnisation again
on the same payroll when he/she left.
*/

-- Query to check the employee history
select 'Employees' as T1, * from Employees where emp_no in (10021);
select 'Emp_Location' as T2, * from Employee_Location where emp_no in (10021);
select 'Emp_Movement' as T3, * from Employee_Movements_History where emp_no in (10021);
select 'Emp_Position' as T4, * from Employee_Position_History where emp_no in (10021);
select 'Emp_Salary' as T5, * from Salary_History where emp_no in (10021) order by 5 desc;

-- adding the returned employee into the current_employees table
insert into Current_Personnel(sid_Employee, emp_no, current_salary, current_location, sid_Department, sid_Location, sid_position)
select
emp.sid_Employee,emp. emp_no, 
(select max(current_salary) from Salary_History where emp_no = emp.emp_no) as current_salary, 
eml.City, 
emmh.sid_Department,
eml.sid_Location,
emph.sid_Position
from Employees emp inner join
Employee_Location eml on emp.emp_no = eml.emp_no inner join
Employee_Movements_History emmh on emp.emp_no = emmh.emp_no inner join
Employee_Position_History emph on emp.emp_no = emph.emp_no
where emp.emp_no = 10021;

-- checking if the employee row contains any null values
select * from Current_Personnel where emp_no = 10021;

/* Since the sid_location column have null value, so we have to update it with correct value */

select * from Geography

-- Updating the sid_location
update Current_Personnel
set sid_location = geo.sid_Location
from Current_Personnel cp inner join
Geography geo on cp.current_location = geo.City
where sid_Employee = 21;



