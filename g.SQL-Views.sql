SELECT * FROM dept_emp;
SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no
HAVING Num > 1;

-- Create View -- 
-- Latest date of emp contract
-- Try running select statement seperately
CREATE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
## Go to Views in left col. >  Check the box icon >  Direct view with automated Syntax opens.

-- Excercise: Extract AVG salary of all managers registered in DB (Individually) --
DROP VIEW IF EXISTS Average_manager_pay_scale;
CREATE VIEW Average_Manager_pay_scale AS
SELECT emp_no, AVG(salary) AS Average_Pay
FROM salaries WHERE emp_no IN (SELECT emp_no FROM dept_manager)
GROUP BY emp_no;

-- Excercise: Extract AVG salary of all managers registered in DB (Overall) --
DROP VIEW IF EXISTS Average_manager_pay_scale_overall;
CREATE VIEW Average_Manager_pay_scale_Overall AS
SELECT round(AVG(salary),2) AS Average_Pay
FROM salaries WHERE emp_no IN (SELECT emp_no FROM dept_manager);