USE employees;
COMMIT;

SELECT * FROM employees
WHERE emp_no = 999901;

DELETE FROM employees
WHERE emp_no = 999901;

ROLLBACK;


SELECT * FROM departments
ORDER BY dept_no ; 
COMMIT;

DELETE FROM departments
WHERE dept_no = 'd010';

ROLLBACK;
