-- Example 1: --------------------------------- <<<< LOCAL Variables >>>> ---------------------------------------------------------------------------
    DELIMITER $$
    USE employees $$
    DROP FUNCTION IF EXISTS f_emp_avg_salary $$
    CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2) -- Here RETURNS, gives return value not the variable
    READS SQL DATA
    BEGIN
    
    DECLARE v_avg_salary DECIMAL(10,2); -- Data type here and in return clause should be similar
    SELECT AVG(s.salary)
    INTO v_avg_salary FROM 
    employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no ;
    
    RETURN v_avg_salary;
    END $$
    
    DELIMITER ;
    # variable "v_avg_salary can't be used outside BEGIN-END block > Causes ERROR.
    
 -- ------------------------------------------------------   <<< SESSION VARIABLE >>  ----------------------------------------------------------------
 
 SET @s_var1 = 0;
 
 DELIMITER $$
 DROP FUNCTION IF EXISTS f_emp_avg_salary $$
 CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
 READS SQL DATA
 BEGIN
 -- No declaring this time --
 SELECT AVG(s.salary) INTO @s_var1
 FROM employees e
 JOIN salaries s ON e.emp_no = s.emp_no
 WHERE e.emp_no = p_emp_no;
 RETURN @s_var1;
 END $$
 DELIMITER ;
 
 SELECT @s_var1; -- To check the session variable individually
 
 -- --------------------------------------------------- <<<<GLOBAL VARIBLES>>>> -----------------------------------------------------------------------

SET @@global.max_connections = 1; -- Now we can only have one session running in the SQL globally. Starting a new session will show error. 