USE employees;

#Problem 2
SELECT DISTINCT last_name FROM employees WHERE first_name IN('Irena','Vidya','Maya') ORDER BY last_name DESC LIMIT 10;
#Answer: Zyda, Zweizig, Zuberek, Zongker, Zobel, Zirintsis, Zhiwei, Zhang, Zastre, Zallocco

#Problem 3
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5;
#Answer: Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baoccai Kushner, Petter Stroustrup

#Problem 4
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date LIMIT 5 OFFSET 45;
#ANswer: The offset would be page number minus one times the limit amount. So for page 1 it would be (1-1)5 = 0, page 2 would be (2-1)5 = 5 and so on. 
