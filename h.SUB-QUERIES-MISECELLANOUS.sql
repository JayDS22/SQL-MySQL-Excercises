-- Alternative -1 to get names of managers
SELECT 
    e.first_name, e.last_name, m.dept_no
FROM
    employees e,
    dept_manager m
WHERE
    e.emp_no = m.emp_no
ORDER BY e.emp_no;

-- 1)Using SUBQUERIES (WHERE-IN)to get names of managers
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no IN (SELECT m.emp_no 
				   FROM dept_manager m);

#Excercise-1: Managers hired between 1990-1995
#Logic: Find matching between both tables as ref_column_name
SELECT * FROM dept_manager m
WHERE m.emp_no IN ( SELECT e.emp_no 
                    FROM employees e 
                    WHERE hire_date between '1990-01-01' AND '1995-01-01');

#2)Using EXISTS subquery nested with WHERE to get names of managers
SELECT e.first_name, e.last_name
FROM employees e
WHERE exists( SELECT * FROM dept_manager m
			  WHERE e.emp_no = m.emp_no);
              
##Excercise: All info. of employees with titles 'Assistant Engineer'
SELECT * FROM employees e 
WHERE EXISTS( SELECT * FROM titles t 
			  WHERE e.emp_no = t.emp_no AND t.title = 'Assistant Engineer');

--
--
--
-- ((((Very IMP)))) -- -------------------------------------------------------------------------------------------------------------------------------------              
#3) SQL subqueries nested in SELECT and FROM
#Excercise 1: Assign emp_no = 110022 as manager for 10001 to 10020 & emp_no = 110039 as manager for 10021 to 10040
-- For SET A (10001 to 10020)
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            e.first_name,
            e.last_name,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            e.first_name,
            e.last_name,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;
    -- -----------------------------------------------------------------------------------------------------------------------------------------ENDS
    -- ------------------<<<<<<<<<MOST IMP>>>>>>>>>---------------------------------------------------------------------------------------------STARTS
    #Excercise 2:
    -- Create Table 'emp_manager' --
    ## Created  a table || In order to fill the table used SUBQUERIES (SELECT-FROM) with Awesome logic 
    ## Created A,B,C,D sets and U as a last final set, by using UNION
    ##Used Dept_emp table for getting data related to dept of each individual employee
    ## Used MIN(de.dept_no), so that each employee should be assigned to only 1 department in the dataset.
    -- coz its possible employees are aligned with multiple departments --
	
    DROP TABLE IF EXISTS emp_manager;
    CREATE TABLE emp_manager
    (  emp_no INT(11) NOT NULL,
       dept_no CHAR(4) NULL,
	   manager_no INT(11) NOT NULL
	);
	
    -- SET A
INSERT INTO emp_manager 
SELECT U.* 
FROM (SELECT A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
UNION SELECT -- SET B
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B
UNION SELECT -- SET C
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
UNION SELECT -- SET D (vicecersa of SET C)
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D ) AS U;
    -- --------------------------------------------------------------------------------------------------------------------------------------------ENDS