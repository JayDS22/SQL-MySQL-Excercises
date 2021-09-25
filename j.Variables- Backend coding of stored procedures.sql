-- Creating a Backend coding on which PROCEDURE is implemented --

set @p_avg_salary = 0; -- Creating a variable for storing 0/P value and assigning 0 for convenience
call employees.emp_avg_salary_out(11200, @p_avg_salary); -- Extracting values from DS, and assign it to created variable
select @p_avg_salary; -- Asking software to display the O/P

-- Excercise: 1 (Creating a variable using emp_info with ARUNA JOURNEL as name)
set @v_emp_no = 0;
call employees.emp_info('Aruna','Journel',@v_emp_no);
select @v_emp_no;