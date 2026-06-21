CREATE DATABASE MYDB ;
USE MYDB;
create table employees (
 employees_id varchar(50),
 first_name varchar(50),
 last_name varchar(50),
 hourly_pay decimal(4,2),
 hire_date date 
);

select * from employees;

rename table employees to workers;
rename table workers to employees;

--add --column 
alter table employees
add phone_number varchar(15);
--alter --column

alter table employees 
rename column phone_number to email;


select * from employees;

alter table employees 
modify column email varchar(100);


--move--table--to fist --and --last 

alter table employees 
modify email varchar(100)
after last_name;
select * from employees;

--insertrows--
insert into employees
 values( 1,"sanjay","kumar","abc@gmail",10.25,"2023-05-25",856971364),
       ( 2,"sri","ram","sriram@gmail",15.00,"2020-06-06",12654789),
	   ( 3,"balu","subarmani","balusubramani@gmail",12.50,"2018-02-10",852136497),
	   ( 4,"raju","kumar","rajukumar@gmail",17.50,"2016-05-06",963215487),
	   ( 5,"ram","kumar","ramkumar@gmail",13.25,"2021-10-25",123971364);
select*from employees;

insert into employees (employees_id ,first_name )
 values(6,"karthik");

select first_name , last_name
from employees ;

select * from employees
where employees_id =2;

select * from employees 
where first_name = "ram";

select * from employees where hourly_pay >= 15;

select * from employees where hire_date  <= "2016-05-06";

select * from employees where employees_id != 1;


select * from employees where hire_date is null;

update employees
set hire_date = null 
where employees_id = 5;

select * from employees;

set sql_safe_updates=0;

delete from employees
where employees_id = 6;
select * from employees;

 --autocommit --commit --rollback 

rollback;

set autocommit = 0 ;

commit;

create table test (
my_date date ,
my_time);


