-- Create a employees_dup
DROP TABLES IF EXISTS employees_dup;
CREATE TABLE employees_dup (
      emp_no int(11),
      birth_date date,
      first_name varchar(14),
      last_name varchar(16),
      gender enum ('M','F'),
      hire_date date
      );
      
-- duplicate the structure of employees table and check table
INSERT INTO employees_dup
SELECT e.*
FROM employees e 
LIMIT 20;
SELECT * FROM employees_dup;

-- insert a duplicate of the first row
INSERT INTO employees_dup VALUES
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

-- UNION vs UNION ALL
-- Let's join 'employees' and 'dept_manager' tables & add missing cols. as NULL values, in each other as to satisfy the condition
SELECT
      e.emp_no,
      e.first_name,
      e.last_name,
      NULL AS dept_no,
      NULL AS from_date
FROM employees_dup e
WHERE e.emp_no = '10001'
UNION ALL SELECT
      NULL AS emp_no,
      NULL AS first_name,
      NULL AS last_name,
      m.dept_no,
	  m.from_date
FROM dept_manager m;

#Excercise: 
SELECT* FROM (
			   SELECT e.emp_no,
                      e.first_name, 
                      e.last_name,
                      NULL AS dept_no,
                      NULL AS from_date
				FROM employees e
			    WHERE last_name = 'Denis'
                UNION SELECT
                      NULL AS emp_no,
                      NULL AS first_name, 
                      NULL AS last_name,
                      m.dept_no,
                      m.from_date
				FROM dept_manager m) AS a
                ORDER BY -a.emp_no DESC; 
## IMP : This (-a) indicates that in Data set 'a' NULL values as per table_1 is represented first with 
-- || emp_no in Ascending but not starting with NULL, but a real value 
-- Thus, (-a) opposes DESC such that, emp_no starts with a VALUE not NULL