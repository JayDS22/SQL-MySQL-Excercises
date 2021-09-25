SELECT
     first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name)>250
ORDER BY first_name;

SELECT emp_no, AVG(salary) AS Average_Salary_per_annum
FROM salaries
WHERE salary>120000
GROUP BY emp_no
ORDER BY emp_no; #Using WHERE includes all the salaries above 120000, and not average

##Using HAVING to perform ops. with aggregate function is must.
SELECT emp_no, AVG(salary) AS Average_Salary_per_annum
FROM salaries
GROUP BY emp_no
HAVING AVG(salary)>120000
ORDER BY emp_no ASC;

## Extraxt the list of all names that encountered less than 200 times. Let the data reefr to people hired after 1st Jan. 1999
SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name)<200
ORDER BY first_name ASC;

##Employees with more than 1 contract post 2000-01-01
SELECT emp_no, COUNT(from_date) AS contract_count
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date)>1
ORDER BY emp_no;

#LIMIT function
SELECT * FROM dept_emp
LIMIT 100;