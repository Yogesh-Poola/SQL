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
DECLARE
    num_of_rows NUMBER;
BEGIN
    select count(*) into num_of_rows from hr.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Total No.of Rows is '||num_of_rows);
END;

--------------------------------------------------
-- 6. Fetching MAX Salary
--------------------------------------------------
DECLARE
    max_salary NUMBER;
BEGIN
    select MAX(salary) into max_salary from hr.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Maximum Salary is '||max_salary);
END;

--------------------------------------------------
-- 7. Fetching MIN Salary
--------------------------------------------------
DECLARE
    min_salary NUMBER;
BEGIN
    select MIN(salary) into min_salary from hr.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Minimum Salary is '||min_salary);
END;

--------------------------------------------------
-- 8. Fetching AVG Salary
--------------------------------------------------
DECLARE
    avg_salary NUMBER;
BEGIN
    select AVG(salary) into avg_salary from hr.EMPLOYEES;
    DBMS_OUTPUT.PUT_LINE('Average Salary is '||avg_salary);
END;

--------------------------------------------------
-- 9. Fetching First Employee Name Using Subquery
--------------------------------------------------
DECLARE
 first_emp VARCHAR2(100);
BEGIN
    select first_name into first_emp from hr.EMPLOYEES where EMPLOYEE_ID = (select MIN(EMPLOYEE_ID) from hr.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('First Employee Name is '||first_emp);
END;

--------------------------------------------------
-- 10. Fetching Data Using EXISTS
--------------------------------------------------


--------------------------------------------------
-- 11. Selecting Employee with Highest Salary
--------------------------------------------------
DECLARE
    high_salary VARCHAR2(100);
BEGIN
    select first_name into high_salary from hr.EMPLOYEES where SALARY=(select MAX(SALARY) from hr.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('Person with highest salary : '||high_salary);
END;

--------------------------------------------------
-- 12. Fetching Department Name
--------------------------------------------------
DECLARE
    dept_name VARCHAR2(50);
BEGIN
    SELECT department_name INTO dept_name FROM departments WHERE department_id = 10;
    DBMS_OUTPUT.PUT_LINE('Department: ' || dept_name);
END;

--------------------------------------------------
-- 13. Fetching Employee Count in a Department
--------------------------------------------------
DECLARE
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count FROM employees WHERE department_id = 20;
    DBMS_OUTPUT.PUT_LINE('Employees in Department 20: ' || emp_count);
END;

--------------------------------------------------
-- 14. Fetching Sum of All Salaries
--------------------------------------------------
DECLARE
    total_salary NUMBER;
BEGIN
    SELECT SUM(salary) INTO total_salary FROM employees;
    DBMS_OUTPUT.PUT_LINE('Total Salaries: ' || total_salary);
END;

--------------------------------------------------
-- 15. Fetching Employee Joining Date
--------------------------------------------------
DECLARE
    hire_date DATE;
BEGIN
    SELECT hire_date INTO hire_date FROM employees WHERE id = 107;
    DBMS_OUTPUT.PUT_LINE('Employee Hire Date: ' || hire_date);
END;

--------------------------------------------------
-- 16. Selecting Second Highest Salary
--------------------------------------------------
DECLARE
    sec_highest number;
BEGIN
    select distinct salary into sec_highest
    from (select salary,DENSE_RANK()over(order by salary desc) AS ranking from hr.EMPLOYEES) where ranking=2;
    DBMS_OUTPUT.PUT_LINE('Secong Highest Salary is '||sec_highest);
END;


--------------------------------------------------
-- 17. Selecting Employees with Same Salary as John
--------------------------------------------------
DECLARE
    salary_john_count NUMBER;
BEGIN
    select count(*) into salary_john_count from hr.EMPLOYEES 
    where salary in (select salary from hr.EMPLOYEES where first_name='John');
    DBMS_OUTPUT.PUT_LINE('Persons with Same Salary as John : '||salary_john_count);
END;

--------------------------------------------------
-- 18. Fetching Manager Name of an Employee
--------------------------------------------------
DECLARE
    mgr_name VARCHAR2(100);
BEGIN
    select first_name into mgr_name from hr.EMPLOYEES 
    where EMPLOYEE_ID=(SELECT MANAGER_ID from hr.EMPLOYEES where employee_id=102);
    DBMS_OUTPUT.PUT_LINE('Manager Name for Lex is '||mgr_name);
END;

--------------------------------------------------
-- 19. Fetching Number of Employees Who Earn Above Average Salary
--------------------------------------------------
DECLARE
    count_above_avg NUMBER;
BEGIN
    SELECT COUNT(*) INTO count_above_avg FROM employees 
    WHERE salary > (SELECT AVG(salary) FROM employees);
    
    DBMS_OUTPUT.PUT_LINE('Employees Earning Above Average: ' || count_above_avg);
END;

--------------------------------------------------
-- 20. Fetching Employee Name and Role
--------------------------------------------------
DECLARE
    emp_name VARCHAR2(50);
    emp_role VARCHAR2(50);
BEGIN
    SELECT name, job_title INTO emp_name, emp_role FROM employees 
    WHERE id = 112;
    
    DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_name || ', Role: ' || emp_role);
END;
