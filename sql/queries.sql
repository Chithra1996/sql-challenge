---List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e , salaries s 
where e.emp_no = s.emp_no;

---query columns from employees table
select * from employees;


--List first name, last name, and hire date for employees who were hired in 1986
select last_name, first_name, hire_date
from employees 
where hire_date > '12/31/1985' and hire_date < '01/01/1987';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
left join manager as m
on d.dept_no = m.dept_no
left join employees as e
on m.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_employees as de
left join departments as d
on de.dept_no = d.dept_no
left join employees as e
on de.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' 
and e.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees as e
left join dept_employees as de on 
e.emp_no = de.emp_no
left join departments as d on 
de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees as e
left join dept_employees as de on 
e.emp_no = de.emp_no
left join departments as d on 
de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- create a column to hold the count of last name groups
select last_name, count(*)
as "frequency_of_last_names"
from employees
group by last_name
order by "frequency_of_last_names" desc;
