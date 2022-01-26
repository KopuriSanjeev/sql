
-- creating TABLE
create table employees
(
	emp_no number,
	emp_name varchar(20),
	emp_dept varchar(20),
	emp_sal number
);

-- insert into TABLE
insert into employees values(1,'suresh','engg',10000);
insert into employees values(2,'ganesh','IT',20000);
insert into employees values(3,'mahesh','services',15000);
insert into employees values(4,'kushi','IT',1000);
insert into employees values(5,'durga','engg',120000);
insert into employees values(6,'naresh','cleaning',5000);


-- Query1 
-- Display the 2nd highest salary
-- way 1 using subquery. below subquery excludes top salary person and from the remaining data set, max sal will be fetched.
select max(emp_sal) as Second_highest_salary
from employees
where emp_sal not in (select max(emp_sal) from employees);

-- way 2. 
select max(emp_sal) as Second_highest_salary
from employees
where emp_sal < (select max(emp_sal) from employees);


-- Query 2
-- Display Department wise highest Salary
select emp_dept,max(emp_sal)
from employees
group by emp_dept;


-- Query 2
-- Display number of employees in each Department
select emp_dept,count(*)
from employees
group by emp_dept;

--OR

select emp_dept,count(1)
from employees
group by emp_dept;


-- Query3
-- Display Alternate Records
select * from
( select emp_name,emp_no,rownum rn
from employees
order by rn
)
where mod(rn,2) <> 0;


-- Query 4
-- Display Duplicate of a Column
select emp_dept,count(*)
from employees
group by emp_dept;

-- The above query displays non duplicate values also (count is 1)
select emp_dept,count(*)
from employees
group by emp_dept
having count(*)>1;
-- to filter date in GROUP clause we need to use having (not where clause)


-- Query 5
-- Display date of column in the increasing order of the frequency.
select emp_dept,count(*)
from employees
group by emp_dept
order by count(*);


-- Query 6
-- Display list of all employees whose name starts with M
select *
from employees
where emp_name like 'm%';


-- Query 7
-- Display list of all employees whose name ends with I
select *
from employees
where emp_name like '%i';


-- Query 8
-- Display list of all employees having M in any position of their name
select *
from employees
where emp_name like '%m%';


-- Query 9
-- Display list of all employees whose name doesn't contains M in any position
select *
from employees
where emp_name like '%m%';


-- Query 10
-- Display list of all employees whose name contains exactly 5 letters
select *
from employees
where length(emp_name) = 5;

--OR  take 5 underscores
select *
from employees
where emp_name like '_____';


-- Query 11
-- Display list of all employees whose name contains 4th letter as 'e' and 6th letter as 'h'
select *
from employees
where emp_name like '___e_h';


-- Query 12
-- Display list of all employees whose hire date is in December
select *
from employees
where hiredate like '%DEC%';


-- Query 13
-- Display list of all employees whose name contains exactly 2 'L's
select * 
from employees
where emp_name like '%LL%';


-- Query 14
-- Display list of all employees whose name starts with m and ends with h
select * 
from employees
where emp_name like 'm%h';


-- Query 15
-- Display nth row in SQL. To display 4th ROW
-- rownum doesn't work with > or =
-- so select all colums till 4th row and minus all colums till 3rd row to get 4th row.
select * from employees
where rownum <=4
minus
select * from employees
where rownum <=3
;


-- OR
-- By using subquery and alias approach, we can use = with rownum and also we can display rownum
select * from
(select rownum r, emp_no,emp_name from employees)
where r=4;

-- OR

select * from
(select rownum r, employees.* from employees)
where r=4;


-- Query 16
-- Diplay the list of all employees whose row number is 1,3,6
select * from
(select rownum r, employees.* from employees)
where r in (1,3,6);
