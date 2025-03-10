-- -- select sysdate from dual;

-- -- select systimestamp from dual


-- select current_date from dual

-- -- select current_timestamp from dual

-- select dbtimezone from dual


-- +00:00: UTC ( Coordinated Universal Time) (UTC) (+5.30 : Day light savings)




-- select sysdate,sysdate+7 as nextweek from dual
--select sysdate,sysdate-17 as previousweek from dual
-- select hire_date,hire_date+7 as nextweek from hr.employees

-- select systimestamp,systimestamp+interval '2' hour from dual

-- select systimestamp,systimestamp+interval '2' minute from DUAL

-- select systimestamp,systimestamp+interval '2' second from dual


-- select systimestamp,systimestamp+interval '2' year from dual


-- select systimestamp,systimestamp+interval '2' month from dual

--select systimestamp,systimestamp+interval '2' DAY+interval '4' hour from dual


-- 2025-03-19 : Date (YYYY-MM-DD)
-- T: Seperator(Start of the Time Component)
-- 04:51:16.128515: : HH:MM: SS: Microseconds
-- Z : Zulu time format (UTC+00:00)

-- select hire_date ,extract(year from hire_date) year,extract(month from hire_date) as month
-- ,extract(day from hire_date) as day from hr.employees


--select add_months(sysdate,6) from dual
--select hire_date,last_day(hire_date) from hr.employees


-- select sysdate,next_day(sysdate,'Tuesday') from dual

-- select abs(months_between(hire_date,sysdate))/12 as yearsofexp from hr.employees

-- ### to_char
-- ### to_date
-- ### to_timestamp


--select to_Char(sysdate,'day') from dual


-- null value functions

-- select null from dual

-- select nvl(null,20) from dual

-- select nvl(salary,50000) from dual

-- nvl2(expression,value_if_not_null,value_if_null)

-- nvl2(null,30000,40000)

-- 1000  
 
-- null
-- 1000 
-- 2000 

-- select nvl2('data','has value','has no value') from dual

-- coalesce
--returns first non null value


--select coalesce(null,null,22220,10,null) from dual


-- select coalesce(hire_Date,sysdate) from hr.employees 


-- ### if hire date is avaliable ,it will be used, if null vlaues is there then sysdate will be used



-- select coalesce(commission,bonus,0) from hr.employees



-- commision : not null is as it is , bonus,onus is not null used , if it is null value 0