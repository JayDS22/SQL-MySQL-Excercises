#New JOIN SYNTAX
SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
    dept_manager_dup M
INNER JOIN
    departments_dup D ON M.dept_no = D.dept_no
ORDER BY M.dept_no;

#OLD JOIN SYNTAX :WHERE clause
SELECT M.dept_no, M.emp_no, D.dept_name
FROM 
    dept_manager_dup M,
    departments_dup D
WHERE M.dept_no = D.dept_no; #Thus, O/P is similar with JOIN and with WHERE clause as well.

#Excercise: Using OLD syntax (WHERE)
SELECT E.emp_no, E.first_name, E.last_name, D.dept_no, E.hire_date
FROM 
    employees E,
    dept_manager D
WHERE E.emp_no = d.emp_no;

#JOIN and WHERE TOGETHER
##To join employee and salaries table and see employees with > 145,000
SELECT E.emp_no, E.first_name, e.last_name, s.salary
FROM 
    employees E
LEFT JOIN
	salaries S ON E.emp_no = S.emp_no
WHERE s.salary>145000
ORDER BY e.emp_no;

##To avoid error 1055
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY','');

#JOIN and WHERE together Excercise
SELECT e.first_name, e.last_name, t.title, e.hire_date
FROM employees e 
LEFT JOIN titles t ON e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND last_name = 'Markovitch'
ORDER BY e.emp_no;



