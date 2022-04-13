-- Q1. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

use Human_Resources;

-- excluding the first names "Sumant" and "Mary" instead of "Vipul" and "Satish"

Select * 
from Employees
where first_name not in ('Sumant', 'Mary');


-- Q2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * 
from Employees
where first_name like '_____h';


-- Q3. Write a query to validate Email of Employee.

use advworks2019;

select * from [Person].[EmailAddress]
where EmailAddress like '%@%';

select * from [Person].[EmailAddress]
where EmailAddress not like '%@%';
