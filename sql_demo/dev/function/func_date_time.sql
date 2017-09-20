/*
日期时间函数
 */

-- 显示数据库所在的时区
SELECT DBTIMEZONE FROM DUAL;

-- 显示会话所在的时区
SELECT SESSIONTIMEZONE FROM DUAL;



-- 日期函数

-- 给指定日期加上指定的月数后的日期值
SELECT ADD_MONTHS(sysdate,2)  FROM dual;

-- 返回两个日期直接的月份差
SELECT floor(MONTHS_BETWEEN(sysdate,to_date('2017-9-1','yyyy-mm-dd')))  FROM dual;

-- 返回指定日期当月的最后一天的日期值
SELECT sysdate,LAST_DAY(SYSDATE) FROM dual;

-- 返回指定日期之后的下一个星期几的日期值，（1~7代表星期日-星期六）
SELECT NEXT_DAY(sysdate,1) FROM dual;

-- 提取日期中年月日的指定部分(YEAR,MONTH,DAY)
SELECT EXTRACT(YEAR from sysdate) FROM dual;

-- 提取字符串日期中的时分秒的指定部分(HOUR,MINUTE,SECOND)
SELECT EXTRACT(HOUR from timestamp '2008-08-08 10:11:12') FROM dual;
SELECT EXTRACT(MINUTE from timestamp '2008-08-08 10:11:12') FROM dual;
SELECT EXTRACT(SECOND from timestamp '2008-08-08 10:11:12') FROM dual;

-- 抽取当前时间的时分秒（hh24,mi,ss）
select to_char(sysdate,'hh24') from dual;
select to_char(sysdate,'mi') from dual;
select to_char(sysdate,'ss') from dual;

-- 按指定部分截断当前时间
select trunc(sysdate,'year') from dual;

SQL> -- 日期函数

SQL> select sysdate from dual;

SYSDATE
--------------
01-8月 -13

select to_char(sysdate, 'fmDDth MONTH') from dual;

20TH SEPTEMBER

SQL> select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;

TO_CHAR(SYSDATE,'YY                ')
-------------------
2013-08-01 15:35:35

SQL> select systimestamp from dual;

SYSTIMESTAMP
---------------------------------------------------------------------------
31-8月 -17 05.13.33.154665 下午 +08:00

已选择 1 行。


SQL> select to_char(systimestamp,'yyyy-mm-dd hh24:mi:ss*ff') from dual;

TO_CHAR(SYSTIMESTAMP,'YYYY-MM     '
-----------------------------
2017-08-31 17:17:37*897684

已选择 1 行。



SQL> -- systimestamp 时间戳
SQL> -- orcl内部的计时器
SQL>
SQL> -- 昨天 今天 明天


SQL> select (sysdate-1) 昨天, sysdate 今天, sysdate+1 明天
2  from dual;

昨天           今天           明天
-------------- -------------- --------------
31-7月 -13     01-8月 -13     02-8月 -13

SQL> -- 员工的工龄

1  select ename, hiredate, (sysdate-hiredate) 天, (sysdate-hiredate)/7 星期
2* from emp
SQL> /

ENAME      HIREDATE               天       星期
---------- -------------- ---------- ----------
SMITH      17-12月-80     11915.6567 1702.23667
ALLEN      20-2月 -81     11850.6567 1692.95095
WARD       22-2月 -81     11848.6567 1692.66524
JONES      02-4月 -81     11809.6567 1687.09381
MARTIN     28-9月 -81     11630.6567 1661.52238
BLAKE      01-5月 -81     11780.6567 1682.95095
CLARK      09-6月 -81     11741.6567 1677.37952
SCOTT      19-4月 -87     9601.65666 1371.66524
KING       17-11月-81     11580.6567 1654.37952
TURNER     08-9月 -81     11650.6567 1664.37952
ADAMS      23-5月 -87     9567.65666 1366.80809

ENAME      HIREDATE               天       星期
---------- -------------- ---------- ----------
JAMES      03-12月-81     11564.6567 1652.09381
FORD       03-12月-81     11564.6567 1652.09381
MILLER     23-1月 -82     11513.6567 1644.80809

已选择14行。

SQL> select last_day(sysdate) from dual;

LAST_DAY(SYSDA        )
--------------
31-8月 -13

SQL> -- MONTHS_BETWEEN 计算工龄


SQL> select (sysdate-hiredate)/30 no1, MONTHS_BETWEEN(sysdate,hiredate) no2
2  from emp;

NO1        NO2
---------- ----------
397.188887 391.505375
395.022221 389.408601
394.955554 389.344085
393.655554 387.989246
387.688887 382.150536
392.688887        387
391.388887 385.763439
320.055554 315.440859
386.022221 380.505375
388.355554 382.795697
318.922221 314.311826

NO1        NO2
---------- ----------
385.488887 379.956988
385.488887 379.956988
383.788887 378.311826

已选择14行。

SQL>
SQL> -- 114月后
SQL> select ADD_MONTHS(sysdate,114) from dual;

ADD_MONTHS(SYS
--------------
28-2月 -27

已选择 1 行。

SQL> -- 从今天开始算(2013-8-1),星期四，下一个星期四
SQL> select NEXT_DAY(sysdate,'星期四') from dual;

NEXT_DAY(SYSDA  )
--------------
08-8月 -13

SQL> --下个星期一
SQL> select NEXT_DAY(sysdate,'星期一') from dual;

NEXT_DAY(SYSDA )
--------------
05-8月 -13
SQL> --对日期进行四舍五入

SQL> select round(sysdate,'month') no1,round(sysdate,'year') no2,trunc(sysdate,'year') no3
2  from dual;

NO1            NO2            NO3
-------------- -------------- --------------
01-8月 -13     01-1月 -14     01-1月 -13

SQL> --隐性转换的前提，被转换对象是可以转换的
SQL> --显式转换
SQL> --2013-08-01 16:26:12 今天是星期一
SQL> select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss "今天是"day') from dual;

TO_CHAR(SYSDATE,'YYYY-MM-DDHH24:MI:                        ')
-----------------------------------
2013-08-01 16:28:32 今天是星期四
