INSERT INTO employees ( emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999901, '1999-05-09', 'Jay', 'Guwalani', 'M', '2021-01-13');

SELECT * FROM employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT * FROM titles
LIMIT 10;

INSERT INTO titles (emp_no, title, from_date)
VALUES (999901, 'Senior Engineer', '1997-10-01');
SELECT * FROM titles
ORDER BY emp_no DESC
LIMIT 10;

#INSERT INTO SELECT from diff table and enter in diff.
CREATE TABLE departments_dup
( dept_no CHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL
);

SELECT * FROM departments_dup;

INSERT INTO departments_dup (dept_no, dept_name)
SELECT dept_no, dept_name
FROM departments;

SELECT * FROM departments_dup
ORDER BY dept_no;


INSERT INTO departments(dept_no, dept_name) VALUES ('d010', 'Business Analysis');
SELECT * FROM departments;