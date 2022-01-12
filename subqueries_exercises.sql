#Subqueries Exercises

#Problem 1	
SELECT CONCAT(e.first_name, ' ', e.last_name)
	FROM employees e 
		JOIN dept_emp de USING(e.emp_no)
	WHERE de.to_date = '9999-01-01' 
		AND e.hire_date = (
		 SELECT hire_date		 
		 	FROM employees		 
		 	WHERE emp_no = 101010	
		);
#Answer: 55
		 
#Problem 2
SELECT DISTINCT t.title
	FROM titles t
	WHERE t.title 
		IN(SELECT t.title
				FROM employees e
					JOIN dept_emp de USING(emp_no)
					JOIN titles t USING(emp_no)
				WHERE de.to_date = '9999-01-01' 
					AND e.first_name = 'Aamod');
#Answer: 6

#Problem 3
SELECT COUNT(emp_no)
	FROM employees
	WHERE emp_no NOT IN(
			SELECT emp_no
			 	FROM dept_emp
			 	WHERE to_date = '9999-01-01');
#Answer: 59900

#Problem 4
SELECT CONCAT(first_name, ' ', last_name)
	FROM employees
	WHERE gender = 'F'
		AND emp_no IN(
				SELECT emp_no
					FROM dept_manager
					WHERE to_date = '9999-01-01');
#Answer: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

#Problem 5
SELECT emp_no
	FROM salaries
		WHERE emp_no IN(
			SELECT emp_no
				FROM dept_no
				WHERE to_date = '9999-01-01')
			AND salary > salary IN(
					)
	
SELECT * FROM current_dept_emp LIMIT 2;
SELECT * FROM departments LIMIT 2;
SELECT * FROM dept_emp LIMIT 2;
SELECT * FROM dept_emp_latest_date LIMIT 2;
SELECT * FROM dept_manager LIMIT 2;
SELECT * FROM employees LIMIT 2;
SELECT * FROM salaries LIMIT 2;
SELECT * FROM titles LIMIT 2;
