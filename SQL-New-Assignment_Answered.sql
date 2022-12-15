--SQL-New-Assignment

CREATE TABLE Employee_Table (Employee_ID int PRIMARY KEY, First_Name varchar(50), Last_Name varchar (50), Salary int, Joining_Date datetime, Department varchar(50))

INSERT INTO Employee_Table
Values
(1, 'Anika', 'Arora', 100000, '2022-02-14 9:00:00', 'HR'),
(2, 'Veena', 'Verma', 80000, '2011-06-15 9:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2020-02-16 9:00:00', 'HR'),
(4, 'Sushanth', 'Singh', 500000, '2020-02-17 9:00:00', 'Admin'),
(5, 'Bhupal', 'Bhati', 500000, '2011-06-18 9:00:00', 'Admin'),
(6, 'Dheeraj', 'Diwan', 200000, '2011-06-19 9:00:00', 'Account'),
(7, 'Karan', 'Kumar', 75000, '2020-01-14 9:00:00', 'Account'),
(8, 'Chandrika', 'Chauhan', 90000, '2011-04-15 9:00:00', 'Admin')

SELECT * from Employee_Table

CREATE TABLE Employee_Bonus_Table (Employee_Ref_ID int FOREIGN KEY REFERENCES Employee_Table(Employee_ID), Bonus_Amount int, Bonus_Date datetime)

INSERT INTO Employee_Bonus_Table 
Select 1, 5000, '2020-02-16 0:00:00' Union All
Select 2, 3000, '2011-06-16 0:00:00' Union All
Select 3, 4000, '2020-02-16 0:00:00' Union All
Select 1, 4500, '2020-02-16 0:00:00' Union All
Select 2, 3500, '2011-06-16 0:00:00'

Select * from Employee_Bonus_Table

Create Table Employee_Title_Table (Employee_Ref_ID int, Employee_Title varchar(50), Affective_Date datetime)

Insert into Employee_Title_Table
Values
(1, 'Manager', '2016-02-20 0:00:00'),
(2, 'Executive', '2016-06-11 0:00:00'),
(8, 'Executive', '2016-06-11 0:00:00'),
(5, 'Manager', '2016-06-11 0:00:00'),
(4, 'Asst. Manager', '2016-06-11 0:00:00'),
(7, 'Executive', '2016-06-11 0:00:00'),
(6,	'Lead', '2016-06-11 0:00:00'),
(3, 'Lead', '2016-06-11 0:00:00')

SELECT * from Employee_Table
Select * from Employee_Bonus_Table
Select * from Employee_Title_Table

-- Query - 1 (Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.)
Select First_Name from Employee_Table as Employee_Name

-- Query - 2 (Display “LAST_NAME” from Employee table in upper case.)
Select upper(Last_Name) from Employee_Table 

-- Query - 3 (Display unique values of DEPARTMENT from EMPLOYEE table.)
Select Distinct Department from Employee_Table

-- Query - 4 (Display the first three characters of LAST_NAME from EMPLOYEE table.)
Select LEFT(Last_Name, 3) from Employee_Table

-- Query - 5 (Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.)
Select Distinct Department, LEN(Department) as departmentNameLength from Employee_Table

-- Query - 6 (Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. a space char should separate them.)
select concat(First_Name,' ',Last_Name) AS Full_Name from Employee_Table

-- Query - 7 (DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.)
SELECT * FROM Employee_Table ORDER BY First_Name ASC

-- Query - 8 (Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.)
SELECT * FROM Employee_Table ORDER BY First_Name ASC, Department DESC

-- Query - 9 (Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table)
Select * from Employee_Table where First_Name='Veena' OR First_Name='Karan'

-- Query - 10 (Display details of EMPLOYEE with DEPARTMENT name as “Admin”.)
Select * from Employee_Table where Department='Admin'

-- Query - 11 (DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’)
Select * from Employee_Table where First_Name like 'V%'

-- Query - 12 ( DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.)
Select * from Employee_Table where Salary BETWEEN 100000 AND 500000

-- Query - 13 (Display details of the employees who have joined in Feb-2020)
Select * from Employee_Table where (Month(Joining_Date) = 2 AND Year(Joining_Date)=2020)

-- Query - 14 (Display employee names with salaries >= 50000 and <= 100000.)
Select * from Employee_Table where Salary BETWEEN 50000 AND 100000

-- Query - 16 (DISPLAY details of the EMPLOYEES who are also Managers)
select * from Employee_Title_Table where Employee_Title = 'Manager'

--Query - 17 (DISPLAY duplicate records having matching data in some fields of a table)
Select First_Name, count(First_Name) as Tot_Dup_Records from Employee_Table group by First_Name having count(First_Name)>1
--OR--
Select Salary, count(Salary) as Tot_Dup_Records from Employee_Table group by Salary having count(Salary)>1

-- Query - 18 (Display only odd rows from a table.)
Select * from Employee_Table where Employee_ID %2 = 1

-- Query - 19 (Clone a new table from EMPLOYEE table.)
Select * from Employee_Table;
Select * INTO Employee_Table_Clone from Employee_Table;
Select * from Employee_Table_Clone;

-- Query - 20 (DISPLAY the TOP 2 highest salary from a table.) 
Select Top(2) * from Employee_Table order by Salary Desc

-- Query - 21 (DISPLAY the list of employees with the same salary.)
Select * from Employee_Table as E1 
where Salary IN
(Select Salary From Employee_Table as E2 where E1.Employee_ID <> E2.Employee_ID)

--Query - 22 (Display the second highest salary from a table.)
Select MAX(Salary) as Emp_Salary from Employee_Table as E1 Where E1.Salary Not In (Select MAX (Salary) from Employee_Table)

-- Query - 23 (Display the first 50% records from a table.)
Select Top 50 percent * from Employee_Table

-- Query - 24 (Display the departments that have less than 4 people in it.)
Select Department, COUNT(Department) as Dept_Count From Employee_Table Group By Department Having COUNT(*) <4

-- Query - 25 (Display all departments along with the number of people in there.)
SELECT Department, COUNT(*) FROM Employee_Table GROUP BY Department;

-- Query - 26 (Display the name of employees having the highest salary in each department.)
SELECT First_Name, Last_Name, Salary, Department from Employee_Table 
WHERE Salary IN (SELECT MAX(Salary) FROM Employee_Table GROUP BY Department);

-- Query - 27 (Display the names of employees who earn the highest salary.)
SELECT First_Name, Last_Name, Salary, Department from Employee_Table  where Salary=(select max(Salary) from Employee_Table)

-- Query - 28 (Display the average salaries for each department.)
SELECT Department,AVG(Salary) as AVERAGE_SALARY FROM Employee_Table GROUP BY Department;

-- Query - 29 (Display the name of the employee who has got maximum bonus.)
SELECT Employee_Table.First_Name, Employee_Table.Last_Name, Employee_Table.Department, Employee_Bonus_Table.Bonus_Amount from Employee_Table, Employee_Bonus_Table
WHERE Bonus_Amount IN (SELECT MAX(Bonus_Amount) FROM Employee_Bonus_Table);

-- Query - 30 (Display the first name and title of all the employees)
Select Employee_Table.First_Name, Employee_Title_Table.Employee_Title from Employee_Table, Employee_Title_Table
Where Employee_Table.Employee_ID = Employee_Title_Table.Employee_Ref_ID