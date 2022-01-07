######### Functions Exercises

#Problem 2
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ;

#Problem 3
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ;

#Problem 4
SELECT Datediff(NOW(),hire_date) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25';

#Problem 5
SELECT min(salary) FROM salaries;
SELECT max(salary) FROM salaries;

#Problem 6
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1), SUBSTR(last_name,1,4), "_", SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username FROM employees;
