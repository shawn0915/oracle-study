/*
单行函数
 */

/*
字符函数
 */
SELECT
  lower('hello WorLd')   转小写,
  upper('hello WorLd')   转大写,
  initcap('HelLo worLd') 首字母大写
FROM dual;

转小写      转大写      首字母大写
----------- ----------- -----------
hello world HELLO WORLD Hello World

已选择 1 行。

hr@XE>


SQL> -- concat 连接
SQL> select concat('Hello','World') from dual;

HelloWorld

SQL> -- 连接符
SQL> select 'Hello'||' World' from dual;

Hello World

SQL> -- length 字符数 lengthb 字节数

SELECT
  length('你好')  字符数,
  lengthb('你好') 字节数
FROM dual;

字符数     字节数
---------- ----------
2	    6

已选择 1 行。

hr@XE>

SQL> -- lpad 左填充， rpad 右填充
SQL>
SELECT
  lpad('abc', 10, '*') 左填充,
  rpad('abc', 10, '*') 右填充
FROM dual;

左填充     右填充
---------- ----------
*******abc abc*******

已选择 1 行。


SQL> -- trim 去掉前后指定的字符
SELECT trim('h' FROM 'hello world')
FROM dual;

TRIM('H'FR
----------
ello world

已选择 1 行。


SQL> -- instr (In-string)
SQL> -- 在母串中查找子串，找到返回下标（从1开始），否则返回0
-- INSTR函数通常与SUBSTR函数结合使用，以便从电子数据流中提取已编码的数据。


SELECT instr('hello world', 'll') FROM DUAL;

INSTR('HELLOWORLD','LL')
------------------------
3

已选择 1 行。

SELECT instr('hello world', 'lo') FROM DUAL;

INSTR('HELLOWORLD','LO')
------------------------
4

已选择 1 行。

SQL> -- substr
SQL> -- sbustr(a,b) 从a中，第b位开始取，取右边所有的字符
SELECT substr('hello world', 4, 4) FROM DUAL;

SUBS
----
lo w

已选择 1 行。

SQL> -- replace
SELECT REPLACE ('hello world', 'l', ' ') FROM DUAL;

he  o wor d

已选择 1 行。



-- ===============================================================

/*
数字函数
 */

-- ROUND
SELECT ROUND(54.456, 2) no1, ROUND(23.643, 1) no2, ROUND(24.21, 0) no3, ROUND(2.43, -1) no4 FROM DUAL;

NO1	  NO2	     NO3	NO4
---------- ---------- ---------- ----------
54.46	 23.6	      24	  0


-- TRUNC
SELECT TRUNC(54.456, 2) no1, TRUNC(23.643, 1) no2, TRUNC(24.21, 0) no3, TRUNC(222.43, -1) no4 FROM DUAL;

NO1	  NO2	     NO3	NO4
---------- ---------- ---------- ----------
54.45	 23.6	      24	220


-- MOD 取余



-- ===============================================================


/*
转换函数
 */

-- 查询员工的薪水 货币符号，两位小数，千位符
SELECT salary, to_char(salary, 'L999,999,999.99') FROM employees;


-- ===============================================================


/*
通用函数
 */


SQL> -- nvl2(a,b,c) 当a=null时，返回c，否则返回b
SQL> SELECT salary*12+nvl2(commission_pct, commission_pct, 0) FROM employees;

SAL*12+NVL2(COMM,COMM,0)
------------------------
9600
19500
15500
35700
16400
34200
29400
36000
60000
18000
13200

SAL*12+NVL2(COMM,COMM,0)
------------------------
11400
36000
15600

已选择14行。

SQL> -- nullif(a,b) 当a=b时，返回null，否则返回a
SQL> SELECT nullif('abc', 'abc') FROM DUAL;

NUL
---


SQL> SELECT nullif('abc', 'abcd') FROM DUAL;

NUL
---
abc

SQL> SELECT COALESCE ('', '1', '', '2') FROM DUAL;

C
-
1

SQL> -- 从左至右找到第一个不为null的值
SQL> SELECT salary, commission_pct, COALESCE (commission_pct, salary) FROM employees;

SAL       COMM COALESCE(COMM,SAL)
---------- ---------- ------------------
800                           800
1600        300                300
1250        500                500
2975                          2975
1250       1400               1400
2850                          2850
2450                          2450
3000                          3000
5000                          5000
1500          0                  0
1100                          1100

SAL       COMM COALESCE(COMM,SAL)
---------- ---------- ------------------
950                           950
3000                          3000
1300                          1300

已选择14行。

SQL> SELECT salary, commission_pct, COALESCE (salary, commission_pct) FROM employees;

SAL       COMM COALESCE(SAL,COMM)
---------- ---------- ------------------
800                           800
1600        300               1600
1250        500               1250
2975                          2975
1250       1400               1250
2850                          2850
2450                          2450
3000                          3000
5000                          5000
1500          0               1500
1100                          1100

SAL       COMM COALESCE(SAL,COMM)
---------- ---------- ------------------
950                           950
3000                          3000
1300                          1300

已选择14行。



SQL> -- 条件表达式
SQL> if-then-else

SQL> --CASE表达式
SQL> --DECODE函数
SQL> ---case,sql99的语法，类似basic，比较繁琐
SQL> ---decode，oracle自己的语法，类似java，比较简洁
SQL>
SQL> --根据职位涨工资，总裁1000，经理800，其他400
SQL> select ename,job,sal 涨前薪水，case job when 'PRESIDENT' then sal+1000
2  					when 'MANAGER' then sal+800
3  					else sal+400
4  					END 涨后薪水
5  from emp;
)
ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
SMITH      CLERK            800       1200
ALLEN      SALESMAN        1600       2000
WARD       SALESMAN        1250       1650
JONES      MANAGER         2975       3775
MARTIN     SALESMAN        1250       1650
BLAKE      MANAGER         2850       3650
CLARK      MANAGER         2450       3250
SCOTT      ANALYST         3000       3400
KING       PRESIDENT       5000       6000
TURNER     SALESMAN        1500       1900
ADAMS      CLERK           1100       1500

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
JAMES      CLERK            950       1350
FORD       ANALYST         3000       3400
MILLER     CLERK           1300       1700

已选择14行。

SQL> ED
已写入 file afiedt.buf

/*
decode

if job=PRESIDENT => sal + 1000
else if job=MANAGER => sal + 800
else sal + 400
 */
SELECT
  ename,
  job,
  sal               涨前薪水,
  decode(job, 'PRESIDENT', sal + 1000,
         'MANAGER', sal + 800,
         sal + 400) 涨后薪水
FROM emp;

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
SMITH      CLERK            800       1200
ALLEN      SALESMAN        1600       2000
WARD       SALESMAN        1250       1650
JONES      MANAGER         2975       3775
MARTIN     SALESMAN        1250       1650
BLAKE      MANAGER         2850       3650
CLARK      MANAGER         2450       3250
SCOTT      ANALYST         3000       3400
KING       PRESIDENT       5000       6000
TURNER     SALESMAN        1500       1900
ADAMS      CLERK           1100       1500

ENAME      JOB         涨前薪水   涨后薪水
---------- --------- ---------- ----------
JAMES      CLERK            950       1350
FORD       ANALYST         3000       3400
MILLER     CLERK           1300       1700

已选择14行。


-- ===============================================================

