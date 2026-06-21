/*1. Create a table Employees with the following fields:
• EmployeeID – INT, PRIMARY KEY, AUTO_INCREMENT
• Name – VARCHAR(50), NOT NULL
• Email – VARCHAR(100), UNIQUE
• Salary – DECIMAL(10,2), NULL allowed */

create database eng
use eng
create table Employees (
Employees_id int primary key auto_increment,
Employees_name varchar(50) not null,
Email varchar(100)unique,
salary decimal(10,2)  null 
);

select * from Employees ;
 select * from Departments;

/* 2.Insert 5 records into Employees. Include at least one NULL salary.*/
insert into Employees values 
(1, 'sanjay','sanjay@email.com',50000.00 ),
( 2,'Alice','Alice@email.com',60000.00 ),
( 3,'Bob','Bob@email.com',90000.00 ),
( 4,'John','John@email.com',NULL ),
( 5,'Sri','Sri@email.com',20000.00 ),
( 6,'David','David@email.com',30000.00 );


insert into Employees(Employees_name,Email,Salary) values
( 'boy','boy@email.com',96000.00); 


/*3. Create a table Departments with: • DeptID – INT, PRIMARY KEY, AUTO_INCREMENT  • DeptName – VARCHAR(50), NOT NULL*/

 Create  table Departments( 
 DeptID  INT PRIMARY KEY AUTO_INCREMENT,
 DeptName  VARCHAR(50) NOT NULL
 );
 select * from Departments;
 insert into Departments values 
(101,'hr'),
(102,'it'),
(103,'Sales');

/*4. Add a Foreign Key in Employees table to link DeptID → Departments(DeptID).*/

alter table Employees add column DeptID INT;

alter table Employees add constraint Employees_Departments 
foreign key(DeptID) references Departments(DeptID);

select * from Employees ;
set sql_safe_updates=0;

update Employees 
set DeptID = 103
where Employees_id = 5 and 6;

update Employees 
set DeptID = 103
where Employees_id = 3;

update Employees 
set DeptID = 102
where Employees_id = 2;


/*5. Try inserting an employee with a non-existing DeptID and observe the
error*/
 insert into Employees values (8,'ben','ben@gamil',40000.00,104); 
 /*Error Code: 1452. Cannot add or update a child row:
 a foreign key constraint fails (`eng`.`employees`, CONSTRAINT `Employees_Departments` FOREIGN KEY (`DeptID`) REFERENCES `departments` (`DeptID`))*/

/* 6. Alter Employees table: Add a column JoiningDate (DATE). */

alter table Employees 
add column JoiningDate date;


/*7. Update all employees’ salaries by increasing 10%.*/

update Employees  
set salary = salary*1.10;
set sql_safe_updates=0;


/*8. Delete all employees whose Salary is NULL.*/
delete from Employees 
where salary is Null;

select * from Employees ; /* 4 row delete */

/* 9. Display all employees working in the ‘Sales’ department.*/

select * from Employees 
inner join departments  on Employees.DeptID = Departments.DeptID
where Departments.DeptName = 'sales';  

/* 10. Display all employees whose salary is greater than or equal to 50,000.*/

select * From Employees
Where Salary >= 50000;

/* 11. Sort employees by Salary in descending order. */

select * From Employees
order by Salary Desc;

/* 12. Display Employee Name as StaffName using an alias. */
select Employees_name as StaffName
From Employees;

/*13. Calculate yearly salary (Salary * 12) and show as AnnualSalary.*/

select Employees_name , Salary, (Salary * 12) AS AnnualSalary From Employees;


/* 14. Count total number of employees in the company.
15. Count employees in each department.
16. Count distinct department IDs used in Employees table.
17. Display the total salary paid to all employees (SUM).
18. Display average salary of each department.
*/

select Count(*) From Employees; -- we delete one row so 5 

select DeptID, Count(*) From Employees
group by  DeptID;

select Count(distinct DeptID) 
From Employees;


select Sum(Salary) 
From Employees;
 
select DeptID, avg (Salary) 
From Employees
group by DeptID;

/* 19. Find all employees whose Salary is NULL.
20. Display all employees and replace NULL Salary with 0 using IFNULL(Salary,
0).*/

Select * From Employees
Where Salary is null;  /* we delete table in 8 q */

Select Employees_id , Employees_name , ifnull(Salary, 0) 
From Employees;


/* 21. Write an INNER JOIN to list employees and their department names.
22. Write a LEFT JOIN to show all employees even if they don’t have a
department.
23. Write a RIGHT JOIN to show all departments even if there are no
employees in them.
**24. Create a Managers table (EmpID, ManagerID).
Write a SELF JOIN to display Employee Name and Manager Name.**/

Select  * From Employees 
inner join  Departments on  Employees.DeptID  = Departments.DeptID;

 Select Employees_name,salary,DeptName   From Employees 
Left join Departments  on Employees.DeptID   = Departments.DeptID;

Select Employees_name,salary,DeptName  From Employees 
right join Departments  on Employees.DeptID  = Departments.DeptID;


create table managers(
EmpID int ,
Emp_name varchar(50),
ManagerID int  
);

insert into  managers values 
(1,'sanjay',2),
(2,'kumar',0),
(3,'john',2);

select * from managers;


select e.Emp_name,m.Emp_name AS Manager_name from managers e       /* e/ m are object of this self join - self join has one table so need other table , we create object them */
inner join managers m on e.ManagerID =m.EmpID;

/*25. Display department-wise total salary using GROUP BY.
26. Display only those departments whose total salary is greater than
1,00,000 using HAVING.*/ 

select  DeptName, sum(salary ) as totalsalary 
from Employees
group by  DeptName ;





select DeptID,sum(salary) as totalsalary  from Employees
group by DeptID
having sum(salary)>100000;


/* 27. Create a view vw_HighSalary to show employees with salary above
60,000.
28. Select all data from the view.
29. Update an employee's salary through the view (check if allowed).
30. Drop the view*/


create view vw_HighSalary
as select * from employees 
where salary> 60000; 

select *from vw_Highsalary;

update vw_Highsalary
set salary = 1000000
where Employees_id = 2;

drop view vw_Highsalary;


Select  E.Employees_name,D.DeptName,E.salary From Employees as E
inner join  Departments as D on  E.DeptID  = D.DeptID;


