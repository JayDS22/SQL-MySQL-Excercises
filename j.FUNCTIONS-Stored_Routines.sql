	-- Creating 1st FUNCTION --
    DELIMITER $$
    USE employees $$
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
    
    SELECT f_emp_avg_salary(11302);
    -- IMP NOTE --
    # If the program shows ERROR 1418, that means the SQL version has different default binary log. 
    # Adding all or any one (DETERMINISTIC, NO SQL, READS SQL DATA) just after RETURN Clause used with CREATE function
    
    -- # Excercise: Create function, that takes first & last name as info and returns salary of the newest contracts
    DELIMITER $$
    DROP FUNCTION IF EXISTS f_emp_info $$
    CREATE FUNCTION f_emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
    DETERMINISTIC
    BEGIN
    DECLARE v_max_from_date DATE;
    DECLARE v_emp_salary DECIMAL(10,2);
    
    -- For FROM DATE to be latest -- Coz SELECT-INTO can have only one parameter transfered at a time
    SELECT MAX(s.from_date)
    INTO v_max_from_date
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
    
    -- ForSalary --
    SELECT s.salary
    INTO v_emp_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date ;
    
    
    RETURN v_emp_salary;
    END $$
    
    DELIMITER ;
    
    SELECT f_emp_info('Aruna','Journel');
    
    