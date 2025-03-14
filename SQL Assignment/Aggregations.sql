select * from hr.EMPLOYEES;
-- 1. Count the number of employees in each department
-- This query we use aggregate function count and group it by department
select emp.DEPARTMENT_ID,count(*) from hr.EMPLOYEES emp group by emp.DEPARTMENT_ID;

-- 2. Find the average salary in each department
-- This query we use aggregate function average and group it by department
select emp.DEPARTMENT_ID,avg(emp.salary) from hr.employees emp group by emp.DEPARTMENT_ID;

-- 3. Find the maximum and minimum salary in each department
-- This query we use aggregate functions MAX & MIN and group it by department
select emp.DEPARTMENT_ID,max(emp.salary) AS maxsalary,min(emp.salary) AS minsalary from hr.EMPLOYEES emp group by emp.DEPARTMENT_ID;

-- 4. Find the total salary paid in each department
-- This query we use aggregate function SUM and group it by department
select emp.DEPARTMENT_ID,sum(emp.salary) from hr.EMPLOYEES emp group by emp.DEPARTMENT_ID;

-- 5. Count the number of employees in each job role
-- We are grouping by JOB_ID column and doing count of employees in that JOB Role
select emp.JOB_ID,count(*) from hr.employees emp group by emp.JOB_ID;

-- 6. Find the average salary for each job role
-- We are grouping by JOB_ID column and use aggregate function AVERAGE
select emp.JOB_ID,avg(emp.salary) from hr.employees emp group by emp.JOB_ID;

-- 7. Find the maximum salary for each job role
-- For JOB ROLE we use the column JOB_ID and use the MAX function
select emp.JOB_ID,max(emp.salary) from hr.employees emp group by emp.JOB_ID;

-- 8. Find the minimum salary for each job role
-- We use JOB_ID column and group it. For getting minimum we use the MIN function and use it on Salary Column
select emp.JOB_ID,min(emp.salary) from hr.employees emp group by emp.JOB_ID;

-- 9. Find the total salary paid for each job role
-- We use JOB_ID column for job role and use SUM function to get total
select emp.JOB_ID,sum(emp.salary) from hr.EMPLOYEES emp group by emp.JOB_ID;

-- 10. Count the number of employees hired in each year
-- We have Date column in YYYY-MM-DD Format. We extract year part using EXTRACT function. Then we do a count to get employees hired in that specific year
select EXTRACT(year from emp.hire_date) AS YEARCOLUMN,count(*) from hr.employees emp GROUP BY YEARCOLUMN order by YEARCOLUMN;

-- 11. Find the total salary paid in each location
-- We dont have location_id in EMPLOYEES table. We join EMPLOYEES & DEPARTMENTS table and do SUM Aggregation
select dep.location_id,sum(emp.salary) from hr.EMPLOYEES emp INNER JOIN hr.DEPARTMENTS dep on emp.department_id=dep.DEPARTMENT_ID group by dep.LOCATION_ID;

-- 12. Find the number of employees in each manager's team
SELECT manager_id, COUNT(*) AS team_size FROM hr.employees WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 13. Find the highest salary for each manager
SELECT manager_id, MAX(SALARY) FROM hr.employees WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 14. Find the average salary for each manager's team
SELECT manager_id, AVG(SALARY) FROM hr.employees WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 15. Count the number of employees hired in each month of the year
-- We have Date column in YYYY-MM-DD Format. We extract MONTH part using EXTRACT function. Then we do a count to get employees hired in that specific MONTH
select EXTRACT(month from emp.hire_date) AS MONTHCOLUMN,count(*) from hr.employees emp GROUP BY MONTHCOLUMN order by MONTHCOLUMN order by MONTHCOLUMN;

-- 16. Find the department with the highest total salary
-- We do a SUM aggregation first and then to a DESC order to Sort. From there we will fetch the first row
select emp.DEPARTMENT_ID,SUM(emp.salary) AS MAXSAL from hr.EMPLOYEES emp group by emp.DEPARTMENT_ID order by MAXSAL desc 
fetch first row only;

-- 17. Find the job role with the highest average salary
-- We do a AVG aggregation first and then to a DESC order to Sort. From there we will fetch the first row
select emp.JOB_ID,avg(emp.salary) as AVGSALARY from hr.EMPLOYEES emp group by emp.job_id order by AVGSALARY DESC
fetch first row only;

-- 18. Find the number of employees in each city
-- For getting CITY column we have to join 3 tables based on the common column. Then we do COUNT Aggregation by CITY
select loc.CITY,count(*) from hr.EMPLOYEES emp 
INNER JOIN hr.DEPARTMENTS dep on emp.department_id=dep.DEPARTMENT_ID
INNER JOIN hr.locations loc on dep.LOCATION_ID=loc.LOCATION_ID
group by loc.CITY;

-- 19. Find the number of employees who have a commission, grouped by department
-- In order to ensure employees have a Commission we make sure to include NOT NULL
select emp.DEPARTMENT_ID,count(*) from hr.employees emp WHERE emp.COMMISSION_PCT IS NOT NULL group by emp.DEPARTMENT_ID ;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
