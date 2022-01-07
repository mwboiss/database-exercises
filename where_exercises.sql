#Problem 1 
USE employees;
Describe employees;

#Problem 2
SELECT * FROM employees WHERE first_name IN('Irena','Vidya','Maya');
#Answer: 709

#Problem 3
SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
#Answer: 709

#Problem 4
SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
#Answer: 441

#Problem 5
SELECT * FROM employees WHERE last_name LIKE 'E%';
#Answer: 7330

#Problem 6
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
SELECT * FROM employees WHERE last_name NOT LIKE 'E%' AND last_name LIKE '%E';
#Answer: Starts or ends with 'E' = 30723, Ends with 'E' and does not start with 'E' = 23393

#Problem 7
SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
SELECT * FROM employees WHERE last_name LIKE '%E';
#Answer: Starts and ends with 'E' = 899, Ends with 'E' regardless of start = 24292

#Problem 8
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
#Answer: 135214

#Problem 9
SELECT * FROM employees WHERE birth_date LIKE '%-12-25';
#Answer: 842

#Problem 10
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25';
#Answer: 362

#Problem 11
SELECT * FROM employees WHERE last_name like '%q%';
#Answer: 1873

#Problem 12
SELECT * FROM employees WHERE last_name like '%q%' and last_name NOT LIKE '%qu%';
#Answer: 547