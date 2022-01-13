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


#Helpers
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

ALTER TABLE temp_payment_from_sakila MODIFY amount amount * 100 INT();


