
create database org;
create table worker(
worker_id int not null primary key,
first_name char(25),
last_name char(25),
salary int,
joining_date datetime,
department char(25));



INSERT INTO worker(worker_id, first_name, last_name, salary, joining_date, department) VALUES
(001, 'Monika', 'Arora', 1000000, '2020-02-14 09:00:00', 'HR'),
(002, 'Niharika', 'verma', 80000, '2020-06-14 09:00:00', 'Admin'),
(003, 'Vishal', 'singhal', 300000, '2020-06-14 09:00:00', 'HR'),
(004, 'Amitabh', 'singh', 50000, '2020-06-14 09:00:00', 'Admin'),
(005, 'Vivek', 'bhati', 75000, '2020-06-14 09:00:00', 'Account');


create table bonus(
worker_ref_id int,
bonus_amount int,
bonus_date datetime,
foreign key(worker_ref_id)
   references worker(worker_id)
   on delete cascade);


INSERT INTO bonus(worker_ref_id, bonus_amount, bonus_date) VALUES 
(1, 5000, '2020-02-16'),
(2, 3000, '2020-06-16'),
(3, 4000, '2020-02-16'),
(4, 4500, '2020-05-16'),
(5, 3500, '2020-06-16');


select * from worker;

SELECT UPPER('hey');
select 7+3;

select * from worker where  department='HR';
select * from worker where salary between 80000 and 100000;
select * from worker where department='HR' OR department='Admin' or department = 'Account';

--AND/OR/NOT
select * from worker where department='HR' AND salary = 300000;
select * from worker where department='HR' OR salary = 300000;

--to reduce OR statements use (IN)
select * from worker where department IN('HR','Admin');
select * from worker where department NOT IN('HR','Admin');

select * from worker where salary is NULL;
select * from worker where salary is nOT NULL;

--PATTERN MATCHING
select * from worker where first_name LIKE '%i%';
select * from worker where first_name LIKE '_i%';
select * from worker where first_name LIKE '__i%';

--Sorting
select * from worker order by salary desc;
select * from worker order by first_name;


--group by 

--same working
select department,count(*) as no_of_workers from worker group by department;
select count(department) as no_of_workers from worker group by department;

--sum
select department,sum(salary) as total_Salary from worker group by department;

--average
select department,avg(salary) as total_Salary from worker group by department;

--min 
select department,min(salary) as total_Salary from worker group by department;
select department,min(salary) as minimum_sal from worker where department='HR' group by department;

--distinct
select distinct department from worker;

--having 
select department,count(*) from worker group by department having count(department) >1; 

