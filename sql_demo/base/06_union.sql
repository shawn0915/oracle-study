-- ## 集合运算

SQL> /*
SQL> 查询10号和20号部门的员工
SQL> 1. select * from emp where deptno in (10,20);
SQL> 2. select * from emp where deptno=10 or deptno=20;
SQL> 3. 集合运算
SQL> 	select * from emp where deptno=10;
SQL>  +
SQL> 	select * from emp where deptno=20;
SQL>
SQL>
SQL> 集合运算符
SQL> union     union all
SQL> intersect
SQL> minus
SQL> */
SQL> select * from emp where deptno=10
2  union
3  select * from emp where deptno=20;

EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ----- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80       800                    20
7566 JONES      MANAGER         7839 02-4月 -81      2975                    20
7782 CLARK      MANAGER         7839 09-6月 -81      2450                    10
7788 SCOTT      ANALYST         7566 19-4月 -87      3000                    20
7839 KING       PRESIDENT            17-11月-81      5000                    10
7876 ADAMS      CLERK           7788 23-5月 -87      1100                    20
7902 FORD       ANALYST         7566 03-12月-81      3000                    20
7934 MILLER     CLERK           7782 23-1月 -82      1300                    10

已选择8行。

SQL> --利用集合运算实现group by的增强
SQL> select deptno,job,sum(sal) from emp group by deptno,job
2  union
3  select deptno,sum(sal) from emp group by deptno
4  union
5  select sum(sal) from emp;
select deptno,sum(sal) from emp group by deptno
                                         *



SQL> /*
SQL> 注意：
SQL> 1.参与运算的各个集合必须列数相同
SQL> 	且类型一致
SQL> 2.采用第一个集合的表头作为最后的表头
SQL> 3.
SQL> 	如果排序，必须在每个集合后使用相同的order 毕业
SQL> 	order by
SQL> 4.可以使用括号
SQL> */



SQL> select deptno,job,sum(sal) from emp group by deptno,job
2  union
3  select deptno,to_char(null),sum(sal) from emp group by deptno
4  union
5  select to_number(null),to_char(null),sum(sal) from emp;

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 ANALYST         6000
20 CLERK           1900
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。

SQL> break on null
SQL> select deptno,job,sum(sal) from emp group by deptno,job
2  union
3  select deptno,to_char(null),sum(sal) from emp group by deptno
4  union
5  select to_number(null),to_char(null),sum(sal) from emp;

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 ANALYST         6000
20 CLERK           1900
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。

SQL> -- 评判性能最简单的标准，执行时间
SQL> -- 打开sql执行时间
SQL> set timing on
SQL> select deptno,job,sum(sal) from emp group by deptno,job
2  union
3  select deptno,to_char(null),sum(sal) from emp group by deptno
4  union
5  select to_number(null),to_char(null),sum(sal) from emp;

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 ANALYST         6000
20 CLERK           1900
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。

已用时间:  00: 00: 00.04
SQL> select deptno,job,sum(sal) from emp group by deptno,job
2  union
3  select deptno,to_char(null),sum(sal) from emp group by deptno
4  union
5  select to_number(null),to_char(null),sum(sal) from emp;

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 ANALYST         6000
20 CLERK           1900
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。

已用时间:  00: 00: 00.04
SQL> select deptno,job,sum(sal) from emp group by rollup(deptno,job);

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
10 CLERK           1300
10 MANAGER         2450
10 PRESIDENT       5000
10                 8750
20 CLERK           1900
20 ANALYST         6000
20 MANAGER         2975
20                10875
30 CLERK            950
30 MANAGER         2850
30 SALESMAN        5600

DEPTNO JOB         SUM(SAL)
---------- --------- ----------
30                 9400
29025

已选择13行。