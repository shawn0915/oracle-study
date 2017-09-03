-- ## 子查询

SQL> /*
SQL> 查询的两个重点
SQL> 1.多表查询
SQL> 2.子查询
SQL>
SQL> 子查询的作用
SQL> ？
SQL> */
SQL>
SQL> --查询工资比SCOTT高的员工信息
SQL> --1.SCOTT的工资
SQL> select sal
       2  from emp
3  where ename='SCOTT';

SAL
----------
3000

SQL> --查询比3000高的员工
SQL> set linesize 120
SQL> col sal for 9999
SQL>
SQL> select *
       2  from emp
3  where sal>3000;

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7839 KING       PRESIDENT            17-11月-81      5000                    10

SQL> --将上面的两步，合成一步，

SQL> --子查询所要解决的问题：
SQL> --当问题不能一步求解的时候，考虑使用子查询
SQL> --子查询 相当于查询语句的嵌套
SQL> select *
       2  from emp
3  where sal> (select sal
4  		from emp
5  		where ename='SCOTT');

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7839 KING       PRESIDENT            17-11月-81      5000                    10

SQL> /*
SQL> 注意的问题：
SQL> 1.将子查询放入括号中
SQL> 2.采用合理的书写风格
SQL> 3.可以在主查询的 where select from having 后面，放置子查询
SQL> 4.不可以在group by后面放置子查询
SQL> 5.from后面放置子查询，特别注意
SQL> 6.主查询和子查询可以不是同一张表，只要子查询返回的结果，主查询可以使用，即可
SQL> 7.一般不在子查询中使用order by，只在一种情况下使用，在Top-N分析问题中，必须使用order by
SQL> 	（在oracle中没有top关键字，在sql server中有）
SQL> 8.一般先执行子查询，再执行主查询；但相关子查询除外
SQL> 	（相关子查询？）
SQL> 9.单行子查询，只能使用单行操作符；多行子查询只能使用多行操作符
SQL> 10.not in (10,20,null)
SQL> 	 注意子查询的null问题
SQL> */
SQL> --可以在主查询的where select from having 后面，放置子查询
SQL> --select
SQL> select ename,sal,(select job from emp where empno=7839) myjob
       2  from emp;

ENAME        SAL MYJOB
---------- ----- ---------
SMITH        800 PRESIDENT
ALLEN       1600 PRESIDENT
WARD        1250 PRESIDENT
JONES       2975 PRESIDENT
MARTIN      1250 PRESIDENT
BLAKE       2850 PRESIDENT
CLARK       2450 PRESIDENT
SCOTT       3000 PRESIDENT
KING        5000 PRESIDENT
TURNER      1500 PRESIDENT
ADAMS       1100 PRESIDENT

ENAME        SAL MYJOB
---------- ----- ---------
JAMES        950 PRESIDENT
FORD        3000 PRESIDENT
MILLER      1300 PRESIDENT

已选择14行。

SQL> --5.from后面放置子查询，特别注意
SQL> --查询员工的姓名和薪水
SQL> select *
       2  from (select ename,sal from emp);

ENAME        SAL
---------- -----
SMITH        800
ALLEN       1600
WARD        1250
JONES       2975
MARTIN      1250
BLAKE       2850
CLARK       2450
SCOTT       3000
KING        5000
TURNER      1500
ADAMS       1100

ENAME        SAL
---------- -----
JAMES        950
FORD        3000
MILLER      1300

已选择14行。

SQL> --可以增加更多的已知条件
SQL> --6.主查询和子查询可以不是同一张表，只要子查询返回的结果，主查询可以使用，即可
SQL> --查询部门名称为SALES的员工信息

1  select *
     2  from emp
3  where deptno=(select deptno
4  		from dept
5* 		where dname='SALES')
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30
7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30
7900 JAMES      CLERK           7698 03-12月-81       950                    30

已选择6行。

SQL> select *
       2  from emp e,dept d
3  where e.deptno=d.deptno and d.dname='SALES';

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30         30 SALES
CHICAGO

7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30         30 SALES
CHICAGO

7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30         30 SALES
CHICAGO


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7900 JAMES      CLERK           7698 03-12月-81       950                    30         30 SALES
CHICAGO

7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30         30 SALES
CHICAGO

7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30         30 SALES
CHICAGO


已选择6行。

SQL> --sql优化，：如果子查询和多表查询都可以使用，尽量使用多表查询
SQL> 	--理论上
SQL> 	--实际上，有可能子查询比多表查询更快，原因，对子查询的优化
SQL>
SQL> --9.单行子查询，只能使用单行操作符；多行子查询只能使用多行操作符
SQL> 	--单行子查询，只返回一行
SQL> 	--多行子查询，
SQL> 		--多行操作符
SQL> 			--in,any,all
SQL> 	--in: 在集合中
SQL> 	--查询部门名称为SALES和ACCOUNTING的员工信息




1  select *
     2  from emp
3  where deptno in (select deptno
4  		from dept
5* 		where dname='SALES' or dname='ACCOUNTING')
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10
7839 KING       PRESIDENT            17-11月-81      5000                    10
7934 MILLER     CLERK           7782 23-1月 -82      1300                    10
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30
7900 JAMES      CLERK           7698 03-12月-81       950                    30
7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30
7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30

已选择9行。



SQL> select *
       2  from emp e,dept d
3  where e.deptno=d.deptno and d.dname='SALES' or d.dname='ACCOUNTING';

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7369 SMITH      CLERK           7902 17-12月-80       800                    20         10 ACCOUNTING
NEW YORK

7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30         10 ACCOUNTING
NEW YORK

7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30         10 ACCOUNTING
NEW YORK


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20         10 ACCOUNTING
NEW YORK

7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30         10 ACCOUNTING
NEW YORK

7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30         10 ACCOUNTING
NEW YORK


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10         10 ACCOUNTING
NEW YORK

7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20         10 ACCOUNTING
NEW YORK

7839 KING       PRESIDENT            17-11月-81      5000                    10         10 ACCOUNTING
NEW YORK


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30         10 ACCOUNTING
NEW YORK

7876 ADAMS      CLERK           7788 23-5月 -87      1100                    20         10 ACCOUNTING
NEW YORK

7900 JAMES      CLERK           7698 03-12月-81       950                    30         10 ACCOUNTING
NEW YORK


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7902 FORD       ANALYST         7566 03-12月-81      3000                    20         10 ACCOUNTING
NEW YORK

7934 MILLER     CLERK           7782 23-1月 -82      1300                    10         10 ACCOUNTING
NEW YORK

7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30         30 SALES
CHICAGO


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30         30 SALES
CHICAGO

7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30         30 SALES
CHICAGO

7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30         30 SALES
CHICAGO


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30         30 SALES
CHICAGO

7900 JAMES      CLERK           7698 03-12月-81       950                    30         30 SALES
CHICAGO


已选择20行。


SQL> select *
       2  from emp e,dept d
3  where e.deptno=d.deptno and (d.dname='SALES' or d.dname='ACCOUNTING');

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10         10 ACCOUNTING
NEW YORK

7839 KING       PRESIDENT            17-11月-81      5000                    10         10 ACCOUNTING
NEW YORK

7934 MILLER     CLERK           7782 23-1月 -82      1300                    10         10 ACCOUNTING
NEW YORK


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30         30 SALES
CHICAGO

7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30         30 SALES
CHICAGO

7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30         30 SALES
CHICAGO


EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME
---------- ---------- --------- ---------- -------------- ----- ---------- ---------- ---------- --------------
LOC
-------------
7900 JAMES      CLERK           7698 03-12月-81       950                    30         30 SALES
CHICAGO

7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30         30 SALES
CHICAGO

7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30         30 SALES
CHICAGO


已选择9行。

SQL> --and优先级比or高
SQL>
SQL>
SQL> --any 和集合的任意一个值比较
SQL> --查询工资比30号部门任意一个员工高的员工信息
SQL> select *
       2  from emp
3  where sal > any (select sal from emp where deptno=30);

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7839 KING       PRESIDENT            17-11月-81      5000                    10
7902 FORD       ANALYST         7566 03-12月-81      3000                    20
7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20
7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10
7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30
7934 MILLER     CLERK           7782 23-1月 -82      1300                    10
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7876 ADAMS      CLERK           7788 23-5月 -87      1100                    20

已选择12行。

SQL> select *
       2  from emp
3  where sal > (select min(sal) from emp where deptno=30);

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20
7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30
7698 BLAKE      MANAGER         7839 01-5月 -81      2850                    30
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10
7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20
7839 KING       PRESIDENT            17-11月-81      5000                    10
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30
7876 ADAMS      CLERK           7788 23-5月 -87      1100                    20
7902 FORD       ANALYST         7566 03-12月-81      3000                    20

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7934 MILLER     CLERK           7782 23-1月 -82      1300                    10

已选择12行。

SQL> 	--大于集合中的最小值
SQL>
SQL> --all 和集中的所有值比较
SQL> --查询工资比30号部门所有员工高的员工信息
SQL> select *
       2  from emp
3  where sal > all (select sal from emp where deptno=30);

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20
7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20
7902 FORD       ANALYST         7566 03-12月-81      3000                    20
7839 KING       PRESIDENT            17-11月-81      5000                    10

SQL> select *
       2  from emp
3  where sal >  (select max(sal) from emp where deptno=30);

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20
7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20
7839 KING       PRESIDENT            17-11月-81      5000                    10
7902 FORD       ANALYST         7566 03-12月-81      3000                    20

SQL>
SQL> -- not
SQL> -- not in (10,20,null)
SQL> --多行子查询中的null值
SQL> --查询不是老板的员工信息
SQL>
SQL> select *
       2  from emp
3  where empno not in (select mgr from emp);

未选定行

SQL> --()中出现null，所以出现''
SQL> --查询是老板的员工信息
SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where empno not in (select mgr from emp where mgr is not null)
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80       800                    20
7499 ALLEN      SALESMAN        7698 20-2月 -81      1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81      1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81      1250       1400         30
7844 TURNER     SALESMAN        7698 08-9月 -81      1500          0         30
7876 ADAMS      CLERK           7788 23-5月 -87      1100                    20
7900 JAMES      CLERK           7698 03-12月-81       950                    30
7934 MILLER     CLERK           7782 23-1月 -82      1300                    10

已选择8行。