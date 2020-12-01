--employee salaries
SELECT emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no);

--employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--department managers
SELECT dm.emp_no,
		dm.dept_no,
		e.first_name,
		e.last_name,
		d.dept_name
FROM dept_manager as dm
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees as e
		ON (dm.emp_no = e.emp_no);
		
--employee departments
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		d.dept_name
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no);
		
--Hercules lookup
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Sales Department
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		d.dept_name
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

--Sales and Development Department
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		d.dept_name
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--employee frequency
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
