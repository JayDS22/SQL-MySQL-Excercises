-- Task 4: Create a Procedure --
DELIMITER $$
DROP PROCEDURE IF EXISTS filter_salary $$
CREATE PROCEDURE filter_salary(IN Start_range FLOAT, IN End_range FLOAT)
BEGIN 
     SELECT e.gender, d.dept_name, ROUND(AVG(s.salary),2) AS salary
     FROM t_salaries s 
     JOIN t_employees e ON s.emp_no = e.emp_no
     JOIN t_dept_emp de ON e.emp_no = de.emp_no
     JOIN t_departments d ON de.dept_no = d.dept_no
     WHERE s.salary BETWEEN Start_range AND End_range -- Where for normal conditions and HAVING for condition with aggregate functions
     GROUP BY d.dept_no, e.gender;
END $$
DELIMITER ;

CALL filter_salary(50000,90000);