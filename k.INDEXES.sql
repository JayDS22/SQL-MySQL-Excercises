-- Example:1 Create a Index to speed up a normal query --
SELECT * FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

-- Example 2: Create a index with all employees having Georgi Facello
SELECT * FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX i_name ON employees(first_name, last_name);

SHOW INDEX FROM employees FROM employees;

ALTER TABLE employees
DROP INDEX i_hire_date;