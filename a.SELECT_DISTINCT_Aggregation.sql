SELECT DISTINCT hire_date
FROM employees;

#Aggregate Functions
SELECT COUNT(emp_no)
FROM employees;

SELECT AVG(salary)
FROM salaries;

SELECT COUNT(DISTINCT first_name)
FROM employees;

##No. of contracts >= $100000
SELECT * FROM salaries;
SELECT * FROM salaries
WHERE salary >= 100000;

SELECT COUNT(*)FROM salaries
WHERE salary >= 100000;

##No. of managers
SELECT * FROM dept_manager;
SELECT COUNT(emp_no)
FROM dept_manager;

SELECT COUNT(*)FROM dept_manager;


