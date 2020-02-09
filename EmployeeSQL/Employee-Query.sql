List the following details of each employee: employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary  from employees emp, salaries sal
where emp.emp_no = sal.emp_no;

--List employees who were hired in 1986.
select * from employees where hire_Date > '1986-01-01'

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
-- Without JOIN
select dept.dept_no as "Department Number", dept.dept_name as "Department Name", e.emp_no as  "Manager #", 
e.last_name as "Manager Last Name" , e.first_name as "Manager First Name", 
dm.from_date as "Employment Start Date", dm.to_Date as "Employment End Date"
From Departments dept, dept_manager dm, employees e
where dept.dept_no = dm.dept_no
and dm.emp_no = e.emp_no
-- With JOIN
select dept.dept_no as "Department Number", dept.dept_name as "Department Name", e.emp_no as  "Manager #", 
e.last_name as "Manager Last Name" , e.first_name as "Manager First Name", 
dm.from_date as "Employment Start Date", dm.to_Date as "Employment End Date"
From Departments dept
LEFT JOIN dept_manager dm ON dept.dept_no = dm.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select e.emp_no "Employee Number", e.first_name "First Name", e.last_name "Last NAme", dept.dept_name "Department Name" from departments dept
LEFT JOIN  dept_emp de 
ON dept.dept_no = de.dept_no
LEFT JOIN  employees e 
ON de.emp_no = e.emp_no

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
-- Without JOIN
select e.emp_no "Employee Number", e.first_name "First Name", e.last_name "Last Name", dept.dept_name "Department Name" from departments dept, dept_emp de, employees e
where dept.dept_name = 'Sales'
and dept.dept_no = de.dept_no
and de.emp_no = e.emp_no
-- With JOIN
select e.emp_no "Employee Number", e.first_name "First Name", e.last_name "Last Name", dept.dept_name "Department Name" from employees e --departments dept 
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no -- 
LEFT JOIN departments dept ON dept.dept_no = de.dept_no
WHERE dept.dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
-- Without JOIN
select e.emp_no, e.first_name, e.last_name, dept.dept_name from departments dept, dept_emp de, employees e
where 
( dept.dept_name = 'Sales' or dept.dept_name = 'Development')
and dept.dept_no = de.dept_no
and de.emp_no = e.emp_no

-- With JOIN
select e.emp_no "Employee Number", e.first_name "First Name", e.last_name "Last Name", dept.dept_name "Department Name" from employees e 
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no 
LEFT JOIN departments dept ON dept.dept_no = de.dept_no
WHERE ( dept.dept_name = 'Sales' or dept.dept_name = 'Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name "Same Last Name", count(last_name) "Counts" from employees
group by last_name
order by last_name desc