USE employees;
SELECT * FROM employees
WHERE emp_no = 999901;

UPDATE employees
SET 
   first_name = 'Varsha',
   birth_date = '1978-08-09',
   gender = 'F'
WHERE
emp_no = 999901;

SELECT * FROM departments_dup
ORDER BY dept_no;
COMMIT;

UPDATE departments_dup
SET 
   dept_no = 'd011',
   dept_name = 'Quality Control';
   
rollback;
COMMIT;


SELECT * FROM departments
ORDER BY dept_no;

UPDATE departments
SET 
   dept_name = 'Data Analysis'
WHERE dept_no = 'd010';
COMMIT;
   
   