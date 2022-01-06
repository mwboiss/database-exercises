#1 and 2 are procedural.

#3
USE employees;

#4
SHOW TABLES;

#5
SELECT * from employees;
SHOW CREATE TABLE employees;
# emp_no:int, birth_date:date, first_name:varchar(14), last_name:varchar(16), gender:enum('M','F'), hire_date:date.

#6 Numeric types are most likely in most of them as id's but most likely in salaries.

#7 String types are most likely in all of them as names of employees or departments.

#8 Date types are most likely in most of them but current_dept_emp, dept_emp_latest_date are the most likely suspects.

#9 they both have id's that can be used with dept_emp table to relate employees to their respective departments.

#10
SHOW CREATE TABLE dept_manager;