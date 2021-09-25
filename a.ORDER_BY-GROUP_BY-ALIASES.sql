SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT * FROM employees
ORDER BY first_name, last_name ASC;

SELECT * from employees
ORDER BY hire_date DESC;

#GROUP BY clause

SELECT emp_no, gender, first_name, last_name
FROM employees 
WHERE gender = 'M'
GROUP BY first_name
ORDER BY emp_no ASC;

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name 
ORDER BY first_name ASC;

#Using ALIASES (AS) to rename
SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
ORDER BY first_name ASC;

##Shows no. of employees with a specific salary above 80k
SELECT salary, COUNT(emp_no) AS emps_with_same_salary 
FROM salaries
WHERE salary> 80000
GROUP BY salary
ORDER BY salary;