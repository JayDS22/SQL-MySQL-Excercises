#Remove the duplicates from 2 tables
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM departments_dup
WHERE dept_no = 'd009';

#Add back the initial records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

#LEFT JOIN
SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
    dept_manager_dup M
LEFT JOIN
    departments_dup D ON M.dept_no = D.dept_no
GROUP BY emp_no
ORDER BY M.dept_no;

#Reversing the two tables and applying LEFT JOIN
SELECT D.dept_no, M.emp_no, D.dept_name
FROM 
     departments_dup D
LEFT JOIN
    dept_manager_dup M on M.dept_no = D.dept_no
ORDER BY D.dept_no;

#How to obtain only non-matching values from left table.
SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
      dept_manager_dup M
LEFT JOIN
    departments_dup D ON M.dept_no = D.dept_no
WHERE dept_name IS NULL
ORDER BY M.dept_no;

#Excercise: Manager with last name =Markovitch
SELECT E.emp_no, E.first_name, E.last_name, D.dept_no, D.from_date
FROM 
    employees E
LEFT JOIN #We want to find last_name of manager with 'Markovitch'
    dept_manager D ON E.emp_no = D.emp_no
WHERE E.last_name = 'Markovitch'
ORDER BY dept_no DESC;

#RIGHT - JOIN
SELECT D.dept_no, M.emp_no, D.dept_name
FROM 
      dept_manager_dup M
RIGHT JOIN
    departments_dup D ON M.dept_no = D.dept_no
ORDER BY D.dept_no;
