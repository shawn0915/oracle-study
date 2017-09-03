-- ## 多表查询



SQL> --等值连接
SQL> --查询员工信息： 员工号，姓名，月薪，部门名称
SQL>

1  select empno,ename,sal,dname
     2  from emp,dept
3* where emp.deptno=dept.deptno
SQL> /

EMPNO ENAME             SAL DNAME
---------- ---------- ---------- --------------
7782 CLARK            2450 ACCOUNTING
7839 KING             5000 ACCOUNTING
7934 MILLER           1300 ACCOUNTING
7566 JONES            2975 RESEARCH
7902 FORD             3000 RESEARCH
7876 ADAMS            1100 RESEARCH
7369 SMITH             800 RESEARCH
7788 SCOTT            3000 RESEARCH
7521 WARD             1250 SALES
7844 TURNER           1500 SALES
7499 ALLEN            1600 SALES

EMPNO ENAME             SAL DNAME
---------- ---------- ---------- --------------
7900 JAMES             950 SALES
7698 BLAKE            2850 SALES
7654 MARTIN           1250 SALES

已选择14行。

SQL> -- 不等值连接
SQL> --查询员工信息：姓名 月薪 工资级别
SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

SQL> select * from salgrade;

GRADE      LOSAL      HISAL
---------- ---------- ----------
1        700       1200
2       1201       1400
3       1401       2000
4       2001       3000
5       3001       9999

SQL> select ename,sal,grade
       2  from emp e,salgrade s
3  where e.sal between s.losal and s.hisal;

ENAME             SAL      GRADE
---------- ---------- ----------
SMITH             800          1
JAMES             950          1
ADAMS            1100          1
WARD             1250          2
MARTIN           1250          2
MILLER           1300          2
TURNER           1500          3
ALLEN            1600          3
CLARK            2450          4
BLAKE            2850          4
JONES            2975          4

ENAME             SAL      GRADE
---------- ---------- ----------
SCOTT            3000          4
FORD             3000          4
KING             5000          5

已选择14行。

SQL>
SQL> -- 外连接
SQL> --按部门统计员工人数： 部门号， 部门名称， 人数
SQL> select d.deptno,d.dname,count(e.empno)
       2  from dept d,emp e
3  where d.deptno=e.deptno
4  group by d.deptno,d.dname;

DEPTNO DNAME          COUNT(E.EMPNO)
---------- -------------- --------------
10 ACCOUNTING                  3
20 RESEARCH                    5
30 SALES                       6

SQL> select * from dept;

DEPTNO DNAME          LOC
---------- -------------- -------------
10 ACCOUNTING     NEW YORK
20 RESEARCH       DALLAS
30 SALES          CHICAGO
40 OPERATIONS     BOSTON

SQL> --少一个部门。。。
SQL> select * from emp where deptno=40;

未选定行

SQL> --40号行政部没人
SQL> /*
SQL> 外连接解决的问题：
SQL> 当条件不成立的时候，仍然希望在结果中包含不成立的记录
SQL>
SQL> 左外连接，，右外连接
SQL> select d.deptno,d.dname,count(e.empno)
SQL> from dept d,emp e
SQL> where d.deptno=e.deptno
SQL> group by d.deptno,d.dname;
SQL>
SQL> 左外连接：
SQL> where d.deptno=e.deptno 当不成立时，等号左边代表的表的信息依然被包含
SQL> 写法：where d.deptno=e.deptno(+)
SQL> !叫法和写法是相反的
SQL>
SQL> 右外连接：
SQL> where d.deptno=e.deptno 当不成立时，等号右边代表的表的信息依然被包含
SQL> 写法：where d.dept(+)=e.deptno;
SQL> */
SQL> select d.deptno,d.dname,count(e.empno)
       2  from dept d,emp e
3  where d.deptno=e.deptno(+)
4  group by d.deptno,d.dname;

DEPTNO DNAME          COUNT(E.EMPNO)
---------- -------------- --------------
10 ACCOUNTING                  3
40 OPERATIONS                  0
20 RESEARCH                    5
30 SALES                       6

SQL> select d.deptno,d.dname,count(e.empno)
       2  from dept d,emp e
3  where d.deptno=e.deptno(+)
4  group by d.deptno,d.dname
5  order by d.deptno;

DEPTNO DNAME          COUNT(E.EMPNO)
---------- -------------- --------------
10 ACCOUNTING                  3
20 RESEARCH                    5
30 SALES                       6
40 OPERATIONS                  0

SQL>
SQL>
SQL> --self join 自连接
SQL> --查询员工信息： ***的老板是***
SQL> select * from emp;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择14行。

SQL> select e.ename||'的老板是'||b.ename
       2  from emp e,emp b
3  where e.mgr=b.empno;

E.ENAME||'的老板是'||B.ENAME
----------------------------
FORD的老板是JONES
SCOTT的老板是JONES
TURNER的老板是BLAKE
ALLEN的老板是BLAKE
WARD的老板是BLAKE
JAMES的老板是BLAKE
MARTIN的老板是BLAKE
MILLER的老板是CLARK
ADAMS的老板是SCOTT
BLAKE的老板是KING
JONES的老板是KING

E.ENAME||'的老板是'||B.ENAME
----------------------------
CLARK的老板是KING
SMITH的老板是FORD

已选择13行。

SQL> ---一张表可以有不同的别名
SQL> --利用表的别名，将同一张表视为多张表
SQL>
SQL> --层次查询
SQL> --自连接查询大表的话，就会出现性能上的问题
SQL>
SQL> --对同一张表的前后两次操作，进行连接

--伪列 level

SQL> select level,empno,ename,mgr
       2  from emp
3  connect by prior empno=mgr
4  start with mgr is null
5  order by 1;

LEVEL      EMPNO ENAME             MGR
---------- ---------- ---------- ----------
1       7839 KING
2       7566 JONES            7839
2       7698 BLAKE            7839
2       7782 CLARK            7839
3       7902 FORD             7566
3       7521 WARD             7698
3       7900 JAMES            7698
3       7934 MILLER           7782
3       7499 ALLEN            7698
3       7788 SCOTT            7566
3       7654 MARTIN           7698

LEVEL      EMPNO ENAME             MGR
---------- ---------- ---------- ----------
3       7844 TURNER           7698
4       7876 ADAMS            7788
4       7369 SMITH            7902

已选择14行。

SQL> ---start with empno=7844; 可以从任一节点开始
SQL>
