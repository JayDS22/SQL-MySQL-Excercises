SELECT 
    ee.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS Avg_salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees ee ON s.emp_no = ee.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = ee.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , ee.gender , calendar_year -- To get records with distinct year, department, gender || Without Duplicates
HAVING calendar_year <= 2002
ORDER BY d.dept_no;