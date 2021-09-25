-- Example 1 : CASE Statement
SELECT emp_no, first_name, last_name,
 CASE 
    WHEN gender = 'M' THEN 'Male'
    ELSE 'Female'
 END AS gender
FROM employees;

-- Alternative for example-1
SELECT emp_no, first_name, last_name,
 CASE gender
    WHEN 'M' THEN 'Male'
    ELSE 'Female'
 END AS gender
FROM employees;

-- Example 2: Exception : Using IF()
SELECT emp_no, first_name, last_name,
IF (gender = 'M', 'Male', 'Female')
From employees;

-- Excercise 1 : Salary Difference for promoted employee to Manager -- IMP--
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by $30k'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20k and less than $30k'
        ELSE 'Salary was raised less than $20k'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

------ -- Excercise:2 Check if employees in employee table are a manager or not

SELECT 
      e.emp_no, e.first_name, e.last_name,
   CASE
       WHEN dm.emp_no IS NOT NULL THEN 'Manager'
       ELSE 'Employee'
	END AS is_manager
FROM employees e 
JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

-- Excercise 3: Check if the top 100 employees are still employeed or not

SELECT e.emp_no, e.first_name, e.last_name,
    CASE
        WHEN de.to_date > SYSDATE() THEN 'Still Employeed'
        ELSE 'Not Employeed'
	END AS current_employee
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;

