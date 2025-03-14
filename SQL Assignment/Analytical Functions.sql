-- 6. Assign a rank to employees based on their salary within each department.
select DEPARTMENT_ID,EMPLOYEE_ID,salary,
RANK()OVER(PARTITION BY SALARY ORDER BY SALARY DESC) AS SALARYRANK from hr.EMPLOYEES emp;

-- 7. Find the top 3 highest-paid employees in each department.
-- Using CTE
with cte as
(
select DEPARTMENT_ID,SALARY,
RANK()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS SALARYRANK from hr.employees emp
)
select * from cte WHERE SALARYRANK<=3;

-- Using In-Line Sub Query
select DEPARTMENT_ID,EMPLOYEE_ID,SALARY from 
(select DEPARTMENT_ID,EMPLOYEE_ID,SALARY,
RANK()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS SALARYRANK 
from hr.employees)
WHERE SALARYRANK<=3;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
select DEPARTMENT_ID,EMPLOYEE_ID,salary from
(select DEPARTMENT_ID,EMPLOYEE_ID,salary,
DENSE_RANK()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS SALARYRANK from hr.employees)
WHERE SALARYRANK=2;

-- 9. Compute the cumulative total salary of employees ordered by hire date.
select emp.EMPLOYEE_ID,emp.HIRE_DATE,emp.salary,
SUM(SALARY)OVER(ORDER BY emp.HIRE_DATE DESC) AS cumulativeSalary from hr.EMPLOYEES emp;

-- 10. Assign a row number to each employee in each department.
select emp.DEPARTMENT_ID,emp.EMPLOYEE_ID,
ROW_NUMBER()OVER(PARTITION BY emp.DEPARTMENT_ID ORDER BY EMPLOYEE_ID) AS EMPROW
from hr.EMPLOYEES emp; 

-- 11. Find the salary difference between each employee and the next highest-paid employee.
select EMPLOYEE_ID,salary,lead(salary)over(order by salary) AS NEXTSAL,(salary-lead(salary)over(order by salary)) 
AS SALDIFF from hr.EMPLOYEES;

-- 12. Calculate the previous month’s salary for each employee using LAG().
select emp.EMPLOYEE_ID,emp.salary,emp.HIRE_DATE,
lag(salary)over(partition by emp.employee_id order by emp.hire_date) AS PREV_SAL from hr.employees emp;

-- 13. Identify employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.
SELECT employee_id, hire_date, salary, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM employees;

-- 23. Identify employees who were hired in the same month and year as someone else.
-- Uses COUNT() OVER() to count employees hired in the same month-year.
SELECT employee_id, hire_date, 
       COUNT(*) OVER (PARTITION BY EXTRACT(MONTH FROM hire_date), EXTRACT(YEAR FROM hire_date)
       --ORDER BY hire_date
       )AS SAMEMONTHHIRES
FROM hr.employees;
