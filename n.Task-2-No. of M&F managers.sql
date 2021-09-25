-- Task 2: Compre no. of M & F managers for different dept. for each year post 1990
SELECT d.dept_name, ee.gender, dm.emp_no, dm.from_date, dm.to_date, e.calendar_year,
       CASE WHEN YEAR(dm.to_date)>= e.calendar_year AND YEAR(from_date)<= e.calendar_year THEN '1'
            ELSE '0'
	   END AS activ
FROM (SELECT YEAR(hire_date) AS calendar_year
	  FROM t_employees
      GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm  -- 'Calendar_year' should have a cross join with the managers table, to extract the data of managers only
                              -- tHAT'S why subquery is used
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

-- WRONG IDEA, AS IT ONLY GIVES Active 1 value for all and not 0

SELECT d.dept_name, ee.gender, dm.emp_no, dm.from_date, dm.to_date, YEAR(ee.hire_date) AS calendar_year,
       CASE WHEN YEAR(dm.to_date)>= YEAR(ee.hire_date) AND YEAR(from_date)<= YEAR(ee.hire_date) THEN '1'
            ELSE '0'
	   END AS activ
FROM t_dept_manager dm 
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no;