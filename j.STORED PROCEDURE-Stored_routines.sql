#1) <<<<<<<<<<<<STORED PROCEDURES>>>>>>>>>>>>>>

-- Creating 1st Procedure
USE employees;
DELIMITER $$
DROP PROCEDURE IF EXISTS select_employees $$
CREATE PROCEDURE select_employees()
BEGIN 
     SELECT * FROM employees
     LIMIT 200;
END $$
DELIMITER ;

call employees.select_employees; -- Calling out the Stored Routine

-- Excercise 1: Construct procedure with AVG salary of all employees
USE employees;

DELIMITER $$
DROP PROCEDURE IF EXISTS Avg_salary $$
CREATE PROCEDURE Avg_Salary()
BEGIN 
     SELECT AVG(salary) AS Avg_pay
     FROM salaries;
END $$
DELIMITER ;

CALL employees.Avg_salary()

-- Excercise 2: Construct procedure with INPUT Value to be filled --

DELIMITER $$
DROP PROCEDURE IF EXISTS emp_salary $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER) -- This IN bracket is to give input value
BEGIN 
     SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
     FROM employees e 
     JOIN salaries s ON e.emp_no = s.emp_no
     WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

CALL employees.emp_salary(10001); -- Use this () to give INPUT Values --

#2) Stored Procedure with O/P and I/P VALUES
-- Excercise 3: Execute procedure to search average salary of a emp, using its emp_no

-- **IMP NOTE: OUT in UPPERCASE used, so we have a option to fill its value || OUT in lowercase, that we have only option to give INPUT values ** --
DELIMITER $$
DROP PROCEDURE IF EXISTS emp_avg_salary_out $$
CREATE PROCEDURE emp_avg_salary_out (IN p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2)) -- IN is used for INPUT -- OUT is used to give certain O/P
BEGIN 
     SELECT AVG(s.salary)
     INTO p_avg_salary -- Put this SELECTED O/P into DECLARED O/P field
     FROM employees e 
     JOIN salaries s ON e.emp_no = s.emp_no
     WHERE e.emp_no = p_emp_no ;-- INput Value should have reference in WHERE Clause
END $$
     
DELIMITER ;
     
CALL employees.emp_avg_salary_out(11020);

-- Excercise 4: Create Procedure with full name as I/P and Emp_no as O/P --
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), out p_emp_no INTEGER)
BEGIN 
     SELECT e.emp_no
     INTO p_emp_no
     FROM employees e 
     WHERE e.first_name = p_first_name AND e.last_name = p_last_name ;
END $$
DELIMITER ; 
     

