--DATA ANALYIS
--1. List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM "employees"
JOIN salaries
	ON employees.emp_no = salaries.emp_no;


--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM "employees"
where hire_date between '1986-01-01' and '1986-12-01'



--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
 SELECT d.dept_no, 
		d.dept_name, 
		d.dept_name, 
		dm.emp_no, 
		e.first_name, 
		e.last_name
  FROM "departments" as d
  JOIN "dept_manager" as dm
    ON d.dept_no = dm.dept_no
  JOIN "employees" as e
    ON e.emp_no = dm.emp_no;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
 SELECT d.dept_no,
 		e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "employees" as e
   JOIN "dept_emp" as de
     ON e.emp_no = de.emp_no
   JOIN "departments" as d
	 ON de.dept_no = d.dept_no;



--5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
 SELECT e.first_name,
 		e.last_name,
		e.sex
   FROM "employees" as e
  WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';


--6.List each employee in the Sales department, including their employee number, last name, and first name.
 SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "employees" as e
   JOIN "dept_emp" as de
     ON e.emp_no = de.emp_no
   JOIN "departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "employees" as e
   JOIN "dept_emp" as de
     ON e.emp_no = de.emp_no
   JOIN "departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as "ln_frequency"
  FROM "employees" as e
 GROUP BY last_name
 ORDER BY "ln_frequency" DESC;


