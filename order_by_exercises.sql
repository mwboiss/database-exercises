#Problem 1
USE employees;

#Problem 2 
SELECT * FROM employees WHERE first_name IN('Irena','Vidya','Maya') ORDER BY first_name;
#Answer: First: Irena Reutenauer, Last: Vidya Simmen

#Problem 3
SELECT * FROM employees WHERE first_name IN('Irena','Vidya','Maya') ORDER BY first_name, last_name;
#Answer: First: Irena Acton, Last: Vidya Zweizig

#Problem 4
SELECT * FROM employees WHERE first_name IN('Irena','Vidya','Maya') ORDER BY last_name, first_name;
#Answer: First: Irena Acton, Last: Maya Zyda

#Problem 5
SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ORDER BY emp_no;
#Answer: 899, First: 10021 Ramzi Erde, Last: 499648 Tadahiro Erde

#Problem 6
SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ORDER BY hire_date DESC;
#Answer: 899, Newest: Teiji Eldridge, Oldest: Sergi Erde

#Problem 7
SELECT * FROM employees WHERE hired_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY birth_date, hire_date DESC;
#Answer: 362, Khun Bernini, Douadi Pettis
