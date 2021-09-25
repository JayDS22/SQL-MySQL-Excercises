SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
    dept_manager_dup M
INNER JOIN
    departments_dup D ON M.dept_no = D.dept_no
ORDER BY M.dept_no;

#Excercise :  Extract a list containing info. about all managers' employee numbers, first and last name, dept_no and hire_date
SELECT M.emp_no, M.dept_no, E.first_name, E.last_name, E.hire_date
FROM 
    dept_manager M
INNER JOIN
    employees E ON M.emp_no = E.emp_no
order by dept_no;

#Duplicate Records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003' , '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

#check table
SELECT * FROM dept_manager_dup
ORDER BY dept_no;

SELECT * FROM departments_dup
ORDER BY dept_no;

#Altering the INNER JOIN program to remove duplicates.
SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
    dept_manager_dup M
INNER JOIN
    departments_dup D ON M.dept_no = D.dept_no
GROUP BY emp_no
ORDER BY M.dept_no;