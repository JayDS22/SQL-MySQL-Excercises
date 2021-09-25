#CROSS JOIN, to join all values of Dept_manager and connecting them with each departments
SELECT dm.*, d.*
FROM 
    dept_manager dm
CROSS JOIN
    departments d
ORDER BY dm.emp_no, d.dept_no;

#using a alternative-1 for same O/p
SELECT dm.*, d.*
FROM dept_manager dm, departments d
ORDER BY dm.emp_no, d.dept_no;

#Using Alternative-2 for same O/P 
SELECT dm.*, d.*
FROM dept_manager dm
INNER JOIN departments d 
ORDER BY dm.emp_no, d.dept_no;  #O/P is same, bcoz no ON or WHERE clauses with conditions have been applied

#O/P showing all dept apart from one managed already
SELECT dm.*, d.*
FROM 
    dept_manager dm
CROSS JOIN
    departments d
WHERE d.dept_no<>dm.dept_no
ORDER BY dm.emp_no, d.dept_no;

#Using CROSS JOIN and JOIN for 3 Tables

#Excercise 1: All possible connections b/w dept_manager and dept_no 9 table
SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d 
WHERE d.dept_no = 'd009'
ORDER BY dm.emp_no;

#Excercise 2: 10 employees with all possible departments they can be assigned to
SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE emp_no < 10011
ORDER BY e.emp_no, d.dept_name;