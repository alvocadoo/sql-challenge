-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no ;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
ORDER BY hire_date ASC ;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_managers dm
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
ORDER BY d.dept_name ASC ;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
ORDER BY d.dept_name ASC ;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC ;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' ;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' 
ORDER BY d.dept_name ASC ;

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(emp_no) as same_last_name
FROM employees
GROUP BY last_name 
ORDER BY same_last_name DESC ;