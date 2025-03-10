select * from sh.SALES;
select sysdate from dual;
select systimestamp from dual;
select dbtimezone from dual;
select sessiontimezone from dual;
select sysdate+interval '7' Day from dual;
select sysdate+INTERVAL '-17' Day from dual;
select sl.time_id,sl.time_id+7 from sh.sales sl;
select sysdate,sysdate+INTERVAL '2' Hour from dual;
select sysdate,sysdate+INTERVAL '2' Minute from dual;
select sysdate,sysdate+INTERVAL '2' Second from dual;
select sysdate,sysdate+INTERVAL '2' Year from dual;
select systimestamp,systimestamp+INTERVAL '2' Month from dual;
select systimestamp,systimestamp+INTERVAL '2' Day +INTERVAL '4' Hour from dual;
select distinct EXTRACT(YEAR FROM TIME_ID) AS YEAR,EXTRACT(MONTH FROM TIME_ID) AS MONTH,EXTRACT(DAY FROM TIME_ID) AS DAY from sh.SALES;
select TIME_ID,LAST_DAY(TIME_ID) AS LAST_DAY_MONTH from sh.SALES;