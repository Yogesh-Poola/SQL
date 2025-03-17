select * from hr.EMPLOYEES;
--------------------------------------------------
-- 1. Simple SELECT INTO Statement
--------------------------------------------------
DECLARE
    salary_var number;
BEGIN
    select salary into salary_var from hr.EMPLOYEES where EMPLOYEE_ID=101;
    dbms_output.put_line(salary_var);
END;

--------------------------------------------------
-- 2. SELECT Multiple Columns INTO Variables
--------------------------------------------------
DECLARE
    fname VARCHAR2(50);
    lname VARCHAR2(50);
BEGIN
    select first_name,last_name into fname,lname from hr.EMPLOYEES where EMPLOYEE_ID=101;
    dbms_output.put_line(fname||' '||lname);
END;

--------------------------------------------------
-- 3. Handling No Data Found Exception
--------------------------------------------------
DECLARE
    email_var VARCHAR2(100);
BEGIN
    select email into email_var from hr.EMPLOYEES where EMPLOYEE_ID=99;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Employee Does Not Exist');
END;

--------------------------------------------------
-- 4. Using SELECT with CASE Statement
--------------------------------------------------
DECLARE
    salary_value VARCHAR2(10);
BEGIN
    select CASE when salary>5000 then 'High' else 'low' end into salary_value from hr.EMPLOYEES where EMPLOYEE_ID=101;
    DBMS_OUTPUT.PUT_LINE('Employe 101 Salary is '||salary_value);
END;

--------------------------------------------------
-- 5. Using COUNT() with SELECT INTO
--------------------------------------------------


--------------------------------------------------
-- 6. Fetching MAX Salary
--------------------------------------------------


--------------------------------------------------
-- 7. Fetching MIN Salary
--------------------------------------------------


--------------------------------------------------
-- 8. Fetching AVG Salary
--------------------------------------------------


--------------------------------------------------
-- 9. Fetching Employee Name Using Subquery
--------------------------------------------------


--------------------------------------------------
-- 10. Fetching Data Using EXISTS
--------------------------------------------------


--------------------------------------------------
-- 11. Selecting Employee with Highest Salary
--------------------------------------------------


--------------------------------------------------
-- 12. Fetching Department Name
--------------------------------------------------



--------------------------------------------------
-- 13. Fetching Employee Count in a Department
--------------------------------------------------


--------------------------------------------------
-- 14. Fetching Sum of All Salaries
--------------------------------------------------


--------------------------------------------------
-- 15. Fetching Employee Joining Date
--------------------------------------------------


--------------------------------------------------
-- 16. Selecting Second Highest Salary
--------------------------------------------------


--------------------------------------------------
-- 17. Selecting Employees with Same Salary as John
--------------------------------------------------


--------------------------------------------------
-- 18. Fetching Manager Name of an Employee
--------------------------------------------------


--------------------------------------------------
-- 19. Fetching Number of Employees Who Earn Above Average Salary
--------------------------------------------------


--------------------------------------------------
-- 20. Fetching Employee Name and Role
--------------------------------------------------
