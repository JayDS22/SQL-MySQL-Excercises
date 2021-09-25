SELECT * FROM emp_manager
ORDER BY emp_manager.emp_no;

-- Drill-1
SELECT e1.*
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

SELECT DISTINCT e1.*
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

-- Alternative method
SELECT e1.*
FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE e2.emp_no IN (SELECT manager_no 
					FROM emp_manager); -- All employee nos. of e2 will be selecting only manager nos.
                    
SELECT manager_no
FROM emp_manager;