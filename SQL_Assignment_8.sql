-- Q1. Write an SQL query to fetch intersecting records of two tables.

use school;

create table students_new 
(  
	id int primary key identity(1,1),  
	first_name varchar(30) NOT NULL,  
	last_name varchar(25) NOT NULL,   
	email varchar(210) NOT NULL,  
	age int NOT NULL  
);  

-- inserting the values

insert into students_new(first_name, last_name, email, age)
values
	('Kavin','Peterson','kavin.peterson@verizon.net',15),  
	('Nick','Jonas','nick.jonas@me.com',18),  
	('Peter','Heaven','peter.heaven@google.com',16),
	('Michal','Jackson','michal.jackson@aol.com',17),  
	('Sean','Bean','sean.bean@yahoo.com',16),  
	('Tom ','Baker','tom.baker@aol.com',15),  
	('Ben','Barnes','ben.barnes@comcast.net',16),  
	('Mischa ','Barton','mischa.barton@att.net',18),  
	('Sam','Boro','sam.boro@yahoo.com',16),  
	('Eliza','Bennett','eliza.bennett@yahoo.com',15),  
	('Michal','Krane','michal.Krane@me.com',17),  
	('Randy','Orion','randy.orion@google.com',20),  
	('Brian','Blessed','brian.blessed@yahoo.com',20),  
	('Levin','Patinson','levin.patinson@verizon.net',18);

select * 
from 
students
INTERSECT
select * 
from 
students_new;

-- 'intersect' returns only those records which will be available in both the tables or select statements.



-- Q2. Write an SQL query to show records from one table that another table does not have.

select *
from 
students_new
where 
email not in
(	select 
	email 
	from 
	students
);


-- checking with another database Human_Resources

use Human_Resources;

select *
from 
Employees
where 
emp_no not in
(	select 
	emp_no 
	from 
	Current_Personnel
);

