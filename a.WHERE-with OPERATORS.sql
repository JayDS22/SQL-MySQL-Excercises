SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' AND gender = 'M';
    
 #OR Operators   
SELECT 
    *
FROM
    employees
WHERE first_name = 'Denis' OR last_name = 'Katiyar' ;

#RULE-1 AND>OR
SELECT * FROM employees
WHERE last_name = 'Denis' AND gender = 'M' OR gender='F'; #Gives wrong output

SELECT * FROM employees
WHERE last_name = 'Denis' AND (gender = 'M' OR gender='F'); #gives right output

SELECT * FROM employees
WHERE gender = 'F' AND (first_name = 'Marc' OR first_name ='Kellie');

#IN-NOTIN Operator
SELECT * FROM employees
WHERE first_name IN ('Denis','Mark','Cathie'); 

#LIKE-NOTLIKE
SELECT * FROM employees
WHERE last_name LIKE ('Den%');

SELECT * FROM employees
WHERE last_name NOT LIKE ('Den%','Mar%'); #Wromg only one pattern in ()

SELECT * FROM employees
WHERE last_name LIKE ('%en%');

SELECT * FROM employees
WHERE last_name LIKE ('%ar');

SELECT * FROM employees
WHERE first_name LIKE ('Mar_');

SELECT* FROM employees
WHERE hire_date LIKE ('2000%'); #Employees hired in year-2000

SELECT * FROM employees
WHERE emp_no LIKE ('1000_'); #Employees with emp_number starting with 1000 and is 5 digit

#BETWEEN-AND
SELECT * FROM employees
WHERE emp_no BETWEEN '10000' AND '10230';

SELECT * FROM employees
WHERE hire_date BETWEEN '1985-06-26' AND '2003-10-10';

SELECT*FROM employees
WHERE emp_no NOT BETWEEN '10000' AND '10300';

##All info with "salaries" table with contracts between 66000 to 70000 dollars per year
SELECT * FROM salaries;

SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;
##Retrive a list with all individuals whose employee number is not between '10004' and '10012'
SELECT*FROM employees
WHERE emp_no NOT BETWEEN 10004 AND 10012;
##select the number of all departments with number between
SELECT*FROM departments;
SELECT*FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

#IS NOT NULL/ IS NULL
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
#Comparision Operators
SELECT * FROM employees
WHERE first_name != 'Marc' ;

SELECT * FROM employees
WHERE hire_date >= '2000-01-01' AND gender = 'F';

SELECT * FROM salaries;
SELECT * FROM salaries
WHERE salary > '150000';




