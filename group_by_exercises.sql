USE employees;
DESCRIBE titles;

#Problem 2
SELECT DISTINCT title from titles;
#Answer: 7.

#Problem 3
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;
#Answer: Erde, Eldridge, Etalle, Erie, Erbe.

#Problem 4
SELECT first_name, last_name
FROM employees
WHERE last_name like 'E%E'
GROUP BY first_name, last_name;
#Answer: 846 unique combinations.

#Problem 5
SELECT last_name
FROM employees
WHERE last_name NOT LIKE '%qu%' 
AND last_name LIKE '%q%'
GROUP BY last_name;
#Answer: Chleq, Lindqvist, Qiwen.

#Problem 6
SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name NOT LIKE '%qu%' 
AND last_name LIKE '%q%'
GROUP BY last_name;
#Answer: Chleq-189, Lindqvist-190, Qiwen-168.

#Problem 7
SELECT first_name, gender, COUNT(*)
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name
ORDER BY first_name, gender;
#Answer: Irena- M(144),F(97) -- Maya- M(146),F(90) -- Vidya- M(151),F(81)

#Problem 8
DESCRIBE employees;
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1), 
SUBSTR(last_name,1,4), 
"_", 
SUBSTR(birth_date,6,2), 
SUBSTR(birth_date,3,2)))
AS username,
COUNT(emp_no)
FROM employees
GROUP By username
HAVING COUNT(emp_no) >= 2;
#Answer: Yes there are some usernames with more than one employee with the condition that each employee only has one employee number, this being true there are 13251 cases where this is true.

#Problem 9
#A
DESCRIBE salaries;
SELECT emp_no, avg(salary)
FROM salaries
GROUP BY emp_no;
#B
SELECT dept_no, COUNT(emp_no)
FROM dept_emp
WHERE to_date NOT LIKE '9999-01-01'
GROUP BY dept_no; 
#C
SELECT emp_no, COUNT(salary)
FROM salaries
GROUP BY emp_no;
#D
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;
#E
SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;
#F
SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no;
#G
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;
#H
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;