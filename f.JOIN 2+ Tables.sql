#To calculate avg salary of M/F
select e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

#JOIN 2+ Tables
SELECT 
      e.first_name,
      e.last_name,
      e.hire_date,
      dm.from_date,
      d.dept_name
FROM 
    employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;
      
#Excercise: Select all managers first_name, last_name, hire_date, job_title, start_date, dept_name
##Logic: Employees  > LEFT Join dept_manager  > titles  > departments
SELECT 
      e.first_name,
      e.last_name,
      e.hire_date,
      t.title,
      m.from_date,
      d.dept_name
FROM employees e 
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

#Excercise:  Find avg salary of managers of each individual dept.
##Logic: Connect departments(LEFT TABLE)with dept_manager  > dept_ manager with salaries 
##Named departments as LEFT as O/P needs Dept_ name and AVG salary only.
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments d 
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;
 
#Excercise: How many male and female managers do we have in employees?
SELECT e.gender, COUNT(m.emp_no) AS 'Number of Managers'
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
GROUP BY gender;