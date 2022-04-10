-- Creating Worker table under Emp Database.
CREATE DATABASE Emp;

Use Emp;

CREATE TABLE Worker (
ID INT PRIMARY KEY IDENTITY(1,1),
FIRST_NAME VARCHAR(30) NOT NULL,
MIDDLE_NAME VARCHAR(30),
LAST_NAME VARCHAR(30),
PHONE INT NOT NULL UNIQUE,
EMAIL VARCHAR(30) NOT NULL UNIQUE,
DATE_OF_JOINING DATE,
DEPARTMENT VARCHAR(30) NOT NULL); 


INSERT INTO Worker(FIRST_NAME, MIDDLE_NAME, LAST_NAME, PHONE, EMAIL, DATE_OF_JOINING, DEPARTMENT)
VALUES
('Yogesh', 'Vaishnav', Null, 0000000001, 'yogeshvaish@mail.com', '2019-10-03', 'Documnet Control'),
('Vishal', 'Vishwakarma', Null, 0000000002, 'vishalvish@mail.com', '2019-11-07', 'Engineering'),
('Ajit', Null, 'Yadav', 0000000003, 'ajityad@mail.com', '2019-12-12', 'Executive'),
('Ashish', Null, 'Yadav', 0000000004, 'ashishyad@mail.com', '2019-12-25', 'Engineering'),
('Tanvi', Null, 'Thakur', 0000000005, 'tanvi@mail.com', '2020-01-20', 'Finance'),
('Sam', Null, Null, 0000000006, 'sam@mail.com', '2020-03-03', 'Marketing'),
('Ron',Null, Null, 0000000007, 'ron@mail.com', '2020-05-16', 'Sales'),
('Sara', Null, Null, 0000000008, 'sara@mail.com', '2020-07-01', 'Sales'),
('Zara', Null, Null, 0000000009, 'zara@mail.com', '2020-08-20', 'Marketing'),
('Yoji', Null, Null, 0000000010, 'yoji@mail.com', '2020-03-10', 'Sales');

SELECT *
FROM Worker;


-- Q1) Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME
FROM Worker;


-- Q2) Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT
FROM Worker;

-- Q3) Write an SQL query to show the last 5 record from a table.

SELECT *
FROM (SELECT TOP 5 *
FROM Worker
ORDER BY ID DESC) AS A
ORDER BY ID ASC;