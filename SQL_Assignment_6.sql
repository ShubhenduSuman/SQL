use Human_Resources;


-- Q1. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * 
from 
Employees
where 
(YEAR(hire_date) = 2014 and 
MONTH(hire_date) = 02)
order by 
DAY(hire_date);


-- Q2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select 
emp_no, 
current_salary, 
COUNT(*) as count_num
from 
Salary_History
group by 
emp_no, current_salary
having 
COUNT(*) > 1;


-- Q-3. How to remove duplicate rows from Employees table.

-- using school database

use school;

-- creating a students table

create table students (  
	id int primary key identity(1,1),  
	first_name varchar(30) NOT NULL,  
	last_name varchar(25) NOT NULL,   
	email varchar(210) NOT NULL,  
	age int NOT NULL  
);  

-- inserting the values

insert into students(first_name, last_name, email, age)
values
	('Kavin','Peterson','kavin.peterson@verizon.net',15),  
	('Nick','Jonas','nick.jonas@me.com',18),  
	('Peter','Heaven','peter.heaven@google.com',16),
	('Michal','Jackson','michal.jackson@aol.com',17),  
	('Sean','Bean','sean.bean@yahoo.com',16),  
	('Tom ','Baker','tom.baker@aol.com',15),  
	('Ben','Barnes','ben.barnes@comcast.net',16),  
	('Mischa ','Barton','mischa.barton@att.net',18),  
	('Sean','Bean','sean.bean@yahoo.com',16),  
	('Eliza','Bennett','eliza.bennett@yahoo.com',15),  
	('Michal','Krane','michal.Krane@me.com',17),  
	('Peter','Heaven','peter.heaven@google.com',20),  
	('Brian','Blessed','brian.blessed@yahoo.com',20),  
	('Kavin','Peterson','kavin.peterson@verizon.net',18);


/* 
Defining row number to every records in the table. 
If there are any duplicate records then that row will get no. 2, 3 and so on according to the multiple occurences in the table.
*/

with tab as 
(	select 
	*, 
	ROW_NUMBER() 
		over 
		(partition by first_name, last_name, email 
		order by first_name) as duplicate_record
	from 
	students
)
delete 
from 
tab 
where 
tab.duplicate_record > 1;


-- Checking for any duplicate records
select 
*, 
ROW_NUMBER() 
	over 
	(partition by first_name, last_name, email 
	order by first_name) as duplicate_record
from 
students;
