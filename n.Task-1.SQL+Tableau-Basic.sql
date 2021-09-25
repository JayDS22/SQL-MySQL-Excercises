SELECT emp_no, from_date, to_date
FROM t_dept_emp;

SELECT DISTINCT emp_no, from_date, to_date
FROM t_dept_emp; -- Thus, the count of rows for both the conditions is similar, thus eac employee has only one contract

-- Task: 1
SELECT YEAR(tde.from_date) AS calendar_year, te.gender, COUNT(te.emp_no) AS num_of_employees
FROM t_employees te
JOIN t_dept_emp tde ON te.emp_no = tde.emp_no
GROUP BY calendar_year, te.gender
HAVING calendar_year >= '1990';