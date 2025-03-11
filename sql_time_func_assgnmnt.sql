--Retrieve the current system date.
select sysdate from dual;
--Retrieve the current timestamp including fractional seconds.
select systimestamp from dual;
--Get the database time zone.
select dbtimezone from dual;
--Get the session time zone.
select sessiontimezone from dual;
--Find the next week’s date from SYSDATE.
select sysdate+interval '7' Day from dual;
--Subtract 17 days from SYSDATE.
select sysdate+INTERVAL '-17' Day from dual;
--Retrieve the TIME_ID and calculate TIME_ID + 7 for all sales transactions.
select sl.time_id,sl.time_id+7 from sh.sales sl;
--Add 2 hours to the SYSTIMESTAMP.
select sysdate,sysdate+INTERVAL '2' Hour from dual;
--Add 2 minutes to the SYSTIMESTAMP.
select sysdate,sysdate+INTERVAL '2' Minute from dual;
--Add 2 seconds to the SYSTIMESTAMP.
select sysdate,sysdate+INTERVAL '2' Second from dual;
--Add 2 years to the SYSTIMESTAMP.
select sysdate,sysdate+INTERVAL '2' Year from dual;
--Add 2 months to the SYSTIMESTAMP.
select systimestamp,systimestamp+INTERVAL '2' Month from dual;
--Add 2 days and 4 hours to SYSTIMESTAMP.
select systimestamp,systimestamp+INTERVAL '2' Day +INTERVAL '4' Hour from dual;
--Extract year, month, and day from the TIME_ID column.
select distinct EXTRACT(YEAR FROM TIME_ID) AS YEAR,EXTRACT(MONTH FROM TIME_ID) AS MONTH,EXTRACT(DAY FROM TIME_ID) AS DAY from sh.SALES;
--Find the last day of the month for each TIME_ID.
select TIME_ID,LAST_DAY(TIME_ID) AS LAST_DAY_MONTH from sh.SALES;
-----------------------------------------------------------------
--Retrieve all records from the sales.sh table.
select * from sh.SALES;
--Get the total number of sales transactions recorded.
select count(*) from sh.SALES;
--Retrieve unique product IDs from the sales.sh table.
select distinct PROD_ID from sh.SALES;
--Get all sales details where the quantity sold is more than 5.
select * from sh.SALES sl where sl.QUANTITY_SOLD>5;
--Find the total revenue by multiplying price and quantity for all sales.
select sum(sl.QUANTITY_SOLD*sl.AMOUNT_SOLD) AS TOTALREVENUE from sh.SALES sl;
--Find the average sale amount per transaction.
select avg(sl.AMOUNT_SOLD) as AVGAMT from sh.SALES sl;
--Retrieve the top 5 highest sales transactions by amount.
with cte as(select sl.*,ROW_NUMBER()over(PARTITION by sl.AMOUNT_SOLD order by sl.QUANTITY_SOLD desc) AS NUMBERING from sh.SALES sl)
select * from cte where NUMBERING<=5;
--Retrieve all sales made for a specific product ID (P1001).
select * from sh.SALES sl where sl.PROD_ID='40';
--Count the number of transactions per product.
select sl.PROD_ID,count(*) from sh.SALES sl group by sl.PROD_ID;
--Find the total number of unique customers who made purchases.
select count(distinct sl.CUST_ID) from sh.SALES sl where sl.QUANTITY_SOLD>=1;
-------------------------------------------------------------------------------
--Retrieve all sales transactions that occurred in the last 30 days.
select * from sh.sales sl where sl.TIME_ID>=sysdate+INTERVAL '-30' DAY;
--Extract the year from the sales date column.
select EXTRACT(YEAR from sl.TIME_ID) from sh.sales sl;
--Extract the month from the sales date column.
select EXTRACT(MONTH from sl.TIME_ID) from sh.sales sl;
--Find the total sales for each month.
select EXTRACT(MONTH from sl.TIME_ID) AS MONTHCOL,count(*) from sh.SALES sl group by MONTHCOL;
--Retrieve sales records for transactions that occurred on weekends.
with cte2 as (select sl.*,to_char(sl.TIME_ID,'DY') AS DAYOFWEEK from sh.sales sl) select *from cte2 where DAYOFWEEK IN ('SAT','SUN');
--Find the first and last recorded sales transaction dates.
select min(sl.TIME_ID) AS OLDESTRNXDATE,max(sl.TIME_ID) AS LATESTRNXDATE from sh.sales sl;
--Retrieve sales transactions that happened on a specific date ('2024-03-01').
with cte3 as (select sl.*,to_char(sl.TIME_ID,'YYYY-MM-DD') AS NEWDATE from sh.SALES sl) select * from cte3 where NEWDATE='2019-01-02';
--Count the number of sales transactions that happened in the last 7 days.
select count(*) from sh.sales sl where sl.TIME_ID>=sysdate+INTERVAL '-7' DAY;
--Retrieve sales that occurred during a specific time range (09:00 AM - 12:00 PM).
--select to_char(sl.TIME_ID,'HH24:MM:SS'),sl.* from sh.SALES sl where to_char(sl.TIME_ID,'HH24:MM:SS') = '12:00:00';
