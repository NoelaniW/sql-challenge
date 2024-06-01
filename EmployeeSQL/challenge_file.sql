-- drop table if exists employees cascade
-- drop table if exists departments cascade
-- drop table if exists salaries

-- create table titles (
-- 	title_id varchar primary key not null,
-- 	title varchar not null
-- )

-- select * from departments
-- drop table if exists employees
-- drop table if exists titles cascade
-- drop table if exists salaries

-- create table employees (
-- 	emp_no int not null,
-- 	emp_title_id varchar not null,
-- 	birth_date date not null,
-- 	first_name varchar not null,
-- 	last_name varchar not null,
-- 	sex varchar not null,
-- 	hire_date date not null,
-- 	primary key (emp_no),
-- 	foreign key (emp_title_id) references titles (title_id)
-- )

-- create table salaries (
-- 	emp_no int not null,
-- 	salary int not null,
-- 	primary key (emp_no)
-- )

-- create table departments (
-- 	dept_no varchar not null,
-- 	dept_name varchar not null,
-- 	primary key (dept_no)
-- )

-- create table dept_emp (
-- 	emp_no int not null,
-- 	dept_no varchar not null
-- )

-- create table dept_manager (
-- 	dept_no varchar not null,
-- 	emp_no int not null
-- )

---1)list employee number, name, sex and salary.
select emp_no, last_name, first_name, sex
from employees

select * from salaries

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s
on (e.emp_no = s.emp_no)

---2)list employee name and hire date in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date < '1986-12-31'

---3)list manager of each department including their dept number, dept name, 
------emp no and name.

select * from dept_manager

select dm.dept_no, dm.emp_no, d.dept_name, e.first_name, e.last_name
from dept_manager dm
left join departments d on dm.dept_no = d.dept_no
left join employees e on dm.emp_no = e.emp_no

---4)list department number, employee number, last name,
-------first name, and department name.

select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
left join employees e on de.emp_no = e.emp_no
left join departments d on de.dept_no = d.dept_no

---5)list first name, last name, sex of emplpyees with first
-------name Hercules and last name starts with B

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

---6)list employees in Sales department and employee number,
-----last name and first name.

select * from departments

select d.dept_name, de.emp_no, e.last_name, e.first_name
from dept_emp de
left join departments d on de.dept_no = d.dept_no
left join employees e on de.emp_no = e.emp_no
where dept_name = 'Sales'

---7)list employees in sales and development departments, emp number,
------last name and first name and department name.

select d.dept_name, de.emp_no, e.last_name, e.first_name
from dept_emp de
left join departments d on de.dept_no = d.dept_no
left join employees e on de.emp_no = e.emp_no
where 
	dept_name like '%Sales' or dept_name like '%Development'

---8) list frequency counts, descending, of all employees by
-----last name.

select * from employees

select last_name, count(last_name) as counts
from employees
group by last_name
order by counts desc








