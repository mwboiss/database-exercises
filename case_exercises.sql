#Case Statements Exercises

USE employees;

#Problem 1
SELECT e.emp_no,
 								de.dept_no, de.from_date, de.to_date,
 							IF(de.to_date = '9999-01-01', 1, 0) is_current_employee
 FROM employees e
 		JOIN dept_emp de USING(emp_no)
 		ORDER BY emp_no;
 		
#Answer: This doesn't account for an employee who has worked at a previous department. They will show up as current employee in one and not in their previous department. I will attempt to try a scenario where I only show current departments and a scenario where my is_current_employee column show current for previous departments of current employees. 		

 		
 #Problem 2
SELECT CONCAT(first_name, ' ', last_name), 
							CASE 
							WHEN last_name < 'I' THEN 'A-H'
							WHEN last_name < 'R' THEN 'I-Q'
							ELSE 'R-Z' END Alpha_Group
FROM employees;

#Problem 3

SELECT COUNT(CASE WHEN birth_date < '1960-01-01' 
												THEN '50' 
												END) 'Born in the 1950\'s',
						COUNT(CASE WHEN birth_date 
												BETWEEN '1960-01-01' AND'1970-01-01'
												THEN '60'
												END) 'Born in the 1960\'s'
FROM employees;

#Answer: 50:182886, 60:117138, I chose only 50's and 60's because I checked the data first I hope that this is all that is needed.

#Problem 4
SELECT CASE	
							WHEN d.dept_name 
								IN('Research','Development')
									THEN 'R&D'
								WHEN d.dept_name 
									IN('Sales','Marketing')
										THEN 'Sales & Marketing'
								WHEN d.dept_name 
									IN('Production', 'Quality Management')
										THEN 'Prod & QM'
								WHEN d.dept_name 
									IN('Finance', 'Human Resources')
										THEN 'Finance & HR'
								WHEN d.dept_name 
									IN('Customer Service')
										THEN 'Customer Service'
							END Department_Group, AVG(s.salary) Salary_Average
FROM salaries s
	JOIN dept_emp de USING(emp_no)
		JOIN departments d USING(dept_no)
GROUP BY Department_Group;
