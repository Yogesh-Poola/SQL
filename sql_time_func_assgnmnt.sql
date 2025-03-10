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
-----------------------------------------------------------------
select * from sh.SALES;
select count(*) from sh.SALES;
select distinct PROD_ID from sh.SALES;
select * from sh.SALES sl where sl.QUANTITY_SOLD>5;
select sum(sl.QUANTITY_SOLD*sl.AMOUNT_SOLD) AS TOTALREVENUE from sh.SALES sl;
select avg(sl.AMOUNT_SOLD) as AVGAMT from sh.SALES sl;

with cte as(select sl.*,ROW_NUMBER()over(PARTITION by sl.AMOUNT_SOLD order by sl.QUANTITY_SOLD desc) AS NUMBERING from sh.SALES sl)
select * from cte where NUMBERING<=5;

select * from sh.SALES sl where sl.PROD_ID='1001';
select sl.PROD_ID,count(*) from sh.SALES sl group by sl.PROD_ID;
select count(distinct sl.CUST_ID) from sh.SALES sl where sl.QUANTITY_SOLD>=1;
-------------------------------------------------------------------------------
select * from sh.sales sl where sl.TIME_ID>=sysdate+INTERVAL '-30' DAY;
select EXTRACT(YEAR from sl.TIME_ID) from sh.sales sl;
select EXTRACT(MONTH from sl.TIME_ID) from sh.sales sl;
select EXTRACT(MONTH from sl.TIME_ID) AS MONTHCOL,count(*) from sh.SALES sl group by MONTHCOL;
with cte2 as (select sl.*,to_char(sl.TIME_ID,'DY') AS DAYOFWEEK from sh.sales sl) select *from cte2 where DAYOFWEEK IN ('SAT','SUN');
select min(sl.TIME_ID) AS OLDESTRNXDATE,max(sl.TIME_ID) AS LATESTRNXDATE from sh.sales sl;
with cte3 as (select sl.*,to_char(sl.TIME_ID,'YYYY-MM-DD') AS NEWDATE from sh.SALES sl) select * from cte3 where NEWDATE='2019-01-02';
select count(*) from sh.sales sl where sl.TIME_ID>=sysdate+INTERVAL '-7' DAY;
select * from sh.SALES sl where to_char(sl.TIME_ID,'HH24:MM:SS') between '09:00:00' AND '12:00:00';