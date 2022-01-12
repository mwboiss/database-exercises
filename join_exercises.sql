#Join Example Database

#Problem 1
USE join_example_db;
DESCRIBE roles;
DESCRIBE users;

#Problem 2
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles
ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

SELECT users.name as user_name, roles.name as role_name
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

#Problem 3
SELECT roles.name as role_name, COUNT(users.name) as user_name_count
FROM roles
LEFT JOIN users
ON roles.id = users.role_id
GROUP BY roles.name;

#Employees Database

#Problem 1
USE employees;
#Problem 2
SELECT d.dept_name AS 'Department Name', 
					CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

#Problem 3
SELECT d.dept_name AS 'Department Name', 
					CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY d.dept_name;

#Problem 4
SELECT t.title AS Titles,
			COUNT(t.emp_no) AS COUNT
FROM titles AS t
JOIN dept_emp AS de
ON t.emp_no = de.emp_no
JOIN departments AS d
ON d.dpt_no = de.dept_no
WHERE d.dept_name = 'Customer Service' AND t.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY t.title;

#Problem 5
SELECT d.dept_name AS 'Department Name',
			CONCAT(e.first_name, " ", e.last_name) AS 'Name',
			s.salary AS 'Salary'
FROM employees AS e
	JOIN  salaries AS s
	  ON e.emp_no = s.emp_no
	JOIN dept_manager AS dm
	  ON dm.emp_no = s.emp_no
	JOIN departments AS d 
	  ON d.dept_no = dm.dept_no
	WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
	ORDER BY d.dept_name;	

#Problem 6
SELECT d.dept_no,
			d.dept_name,
			COUNT(de.emp_no)
FROM dept_emp AS de
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE de.to_date = '9999-01-01'
		GROUP BY d.dept_no, d.dept_name
		ORDER BY dept_no;
		
#Problem 7
SELECT d.dept_name,
			AVG(s.salary) AS average_salary
FROM salaries AS s
		JOIN current_dept_emp AS de
		 ON s.emp_no = de.emp_no
		JOIN departments AS d
		 ON d.dept_no = de.dept_no
WHERE s.to_date = '9999_01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#Problem 8
SELECT e.first_name, e.last_name
FROM employees AS e
	JOIN salaries AS s
		ON e.emp_no = s.emp_no
	JOIN dept_emp AS de
		ON s.emp_no = de.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
	WHERE s.to_date = '9999-01-01' AND d.dept_name = 'Marketing'
	ORDER BY s.salary DESC
	LIMIT 1;
	
#Problem 9
SELECT e.first_name, e.last_name, 
									s.salary, d.dept_name
FROM employees e
	JOIN salaries s USING(emp_no)
		JOIN dept_manager dm USING(emp_no)
			JOIN departments d USING(dept_no)
WHERE dm.to_date = '9999-01-01'
	ORDER BY s.salary DESC
		LIMIT 1;

#Problem 10
SELECT d.dept_name, ROUND(AVG(s.salary), 0) average_salary
FROM salaries s
	JOIN dept_emp de
		ON de.emp_no = s.emp_no
	JOIN departments d
		ON d.dept_no = de.dept_no
	GROUP BY d.dept_name
	ORDER BY average_salary DESC;

#Problem 11
SELECT CONCAT(e.first_name, ' ', e.last_name) 'Employee Name', 
					d.dept_name 'Department Name', 
						CONCAT(mn.first_name, ' ', mn.last_name) 'Manager Name'
FROM (
		SELECT e.first_name, e.last_name, dm.dept_no, dm.to_date
		FROM employees e
			JOIN dept_manager dm
				ON dm.emp_no = e.emp_no
		) mn
		JOIN dept_emp de 
			ON de.dept_no = mn.dept_no
		JOIN employees e
			ON e.emp_no = de.emp_no
		JOIN departments d
			ON d.dept_no = de.dept_no 
		WHERE de.to_date = '9999-01-01' AND mn.to_date = '9999-01-01';
	
#Problem 12 DID NOT FINISH , Attempts below.
SELECT d.dept_name 'Department Name', CONCAT(e.first_name, ' ', e.last_name) 'Employee Name', MAX(s.salary) 'Highest Salary'
FROM departments d
	JOIN dept_emp de
		ON d.dept_no = de.dept_no
	JOIN salaries s
		ON de.emp_no = s.emp_no
	JOIN (
		SELECT e.first_name, e.last_name
		FROM employees e
		JOIN salaries AS s
			ON e.emp_no = s.emp_no
		JOIN dept_emp AS de
			ON s.emp_no = de.emp_no
		JOIN departments AS d
			ON d.dept_no = de.dept_no
	)	
	GROUP BY d.dept_name;

SELECT hs.Department_Name, CONCAT(e.first_name, ' ', e.last_name) 'Employee Name', hs.Highest_Salary 
FROM (
	SELECT d.dept_name Department_Name, 
						MAX(s.salary) Highest_Salary
	FROM departments d
		JOIN dept_emp de
			ON d.dept_no = de.dept_no
		JOIN salaries s
			ON de.emp_no = s.emp_no
	GROUP BY d.dept_name
	) hs
	JOIN departments d
		ON d.dept_name = hs.Department_Name
	JOIN dept_emp de
		ON de.dept_no = d.dept_no
	JOIN employees e
		ON de.emp_no = e.emp_no;

SELECT d.dept_name, ROUND(AVG(s.salary), 0) average_salary
	GROUP BY d.dept_name
	ORDER BY average_salary DESC;

SELECT e.first_name, e.last_name
	WHERE s.to_date = '9999-01-01' AND d.dept_name = 'Marketing'
	ORDER BY s.salary DESC
	LIMIT 1;

SELECT * FROM current_dept_emp LIMIT 2;
SELECT * FROM departments LIMIT 2;
SELECT * FROM dept_emp LIMIT 2;
SELECT * FROM dept_emp_latest_date LIMIT 2;
SELECT * FROM dept_manager LIMIT 2;
SELECT * FROM employees LIMIT 2;
SELECT * FROM salaries LIMIT 2;
SELECT * FROM titles LIMIT 2;

SELECT Department, Highest Salary, Employee
FROM departments d
	JOIN dept_emp de
		ON de.dept_no = d.dept_no
	JOIN salaries salaries
		ON s.emp_no = de.emp_no
	JOIN employees e
		ON e.emp_no = s.emp_no