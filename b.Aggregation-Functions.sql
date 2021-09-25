#COUNT()
SELECT COUNT(dept_no) AS 'Number of departments'
FROM departments;

#SUM
SELECT SUM(salary) AS 'Total Man-power Exp'
FROM salaries
WHERE from_date> '1997-01-01' ;

#MAX AND MIN
SELECT MAX(salary) AS 'Highest-Paid'
FROM salaries;

#ROUND
SELECT ROUND(AVG(salary),4)
FROM salaries
WHERE from_date >  '1997-01-01';

#IFNULL() and COALESCE()
SELECT dept_no, IFNULL(dept_name, 'Department name not provided') AS dept_name
FROM departments;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(40) AFTER dept_name ;

SELECT * FROM departments_dup;
SELECT 
      dept_no,
      dept_name,
      coalesce(dept_manager, 'N/A') AS dept_manager
FROM departments_dup
ORDER BY dept_no;

SELECT 
      ifnull(dept_no, 'N/A') as dept_no,
      ifnull(dept_name, 'Name not provided') AS dept_name,
      coalesce(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no;



