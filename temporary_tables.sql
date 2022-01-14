#Temporary Tables Exercise

USE employees;

#Problem 1
CREATE TEMPORARY TABLE innis_1658.employees_with_departments AS
	SELECT e.first_name, e.last_name, d.dept_name
		FROM employees e
			JOIN dept_emp de USING(emp_no)
			JOIN departments d USING(dept_no)
		WHERE de.to_date > NOW();

USE innis_1658;

#A
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

#B
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

#C
ALTER TABLE employees_with_departments DROP COLUMN  first_name;
ALTER TABLE employees_with_departments DROP COLUMN  last_name;

#D
#When we created the table we could have brought the names over concatenated with the alias of full name.

#Helpers functions
DESCRIBE employees_with_departments;
SELECT * FROM employees_with_departments;
DROP TABLE employees_with_departments;
ALTER TABLE employees_with_departments DROP COLUMN full_name;

#Problem 2
USE sakila;
DESCRIBE payment;

CREATE TEMPORARY TABLE innis_1658.temp_payment_from_sakila AS
	SELECT * FROM payment;
		
USE innis_1658;

SELECT * FROM temp_payment_from_sakila;
DESCRIBE temp_payment_from_sakila;

ALTER TABLE temp_payment_from_sakila MODIFY amount decimal(10,2);
UPDATE temp_payment_from_sakila SET amount = amount * 100;
ALTER TABLE temp_payment_from_sakila CHANGE COLUMN amount amount_in_cents int(10);

#Problem 3
USE employees;
DESCRIBE departments;

CREATE TEMPORARY TABLE innis_1658.current_vs_historical_avg_salary AS
	SELECT d.dept_name, 
				AVG(hs.salary) historical_avg, 
				AVG(cs.salary) current_avg,
    		 (AVG(hs.salary) - (SELECT AVG(salary) FROM salaries))/
    		 (SELECT stddev(salary) FROM salaries) historical_zscore,
    				(AVG(cs.salary) - (SELECT AVG(salary) FROM salaries WHERE to_date >NOW()))/
    			(SELECT stddev(salary) FROM salaries WHERE to_date > NOW()) current_zscore

		FROM salaries hs
			JOIN dept_emp de USING(emp_no)
			JOIN departments d USING(dept_no)
			JOIN (
					SELECT salary, emp_no
					FROM salaries
					WHERE to_date > NOW()) cs USING(emp_no)
		GROUP BY d.dept_name;
		
SELECT * FROM current_vs_historical_avg_salary ORDER BY current_zscore;

#From my interpretation of the salary data Sales would be the best department to work for and Human Resources would be the worst. Not only does Sales have the highest current and historical averages but they consistently pay over 1 standard deviation above the mean. Human resources on the other hand have the lowest averages and pay well below the mean of the company. 