-- ## 其他数据库对象

/*
synonym 同义词
view 视图 viw_
sequence 序列 seq_
index 索引
 */




-- 同义词
-- 私有同义词
create synonym emp for scott.emp;
-- 公有同义词
create public synonym emp for scott.emp;


SQL> -- 视图
SQL> /*
SQL> 表，是物理概念
SQL> 视图， 一个定义
SQL>  视图，逻辑概念，视图中的数据都是从表中来
SQL>  视图从基表中获取数据
SQL>
SQL> --视图
SQL> --第一个视图： 员工号，姓名，月薪，年薪
SQL>  --视图本身不包含数据
SQL> create view viewtest
SQL> as
SQL> create empno,ename,sal,sal*12 annlsal from emp;
SQL> ;
SQL> create view viewtest
SQL> as
SQL> create empno,ename,sal,sal*12 annlsal from emp;
SQL> */



SQL> create view viewtest
  2  as
  3  select empno,ename,sal,sal*12 annlsal from emp;
create view viewtest
  *
  第 1 行出现错误:
  ORA-01031: 权限不足


SQL> -- 授予权限
SQL>  -- grant create view to scott;
SQL>  /*
SQL> cmd
SQL> sqlplus / as sysdba
SQL> */
SQL> /

视图已创建。

SQL> --操作视图和操作表的方式相同
SQL> select * from viewtest;

EMPNO ENAME             SAL    ANNLSAL
---------- ---------- ---------- ----------
7369 SMITH             800       9600
7499 ALLEN            1600      19200
7521 WARD             1250      15000
7566 JONES            2975      35700
7654 MARTIN           1250      15000
7698 BLAKE            2850      34200
7782 CLARK            2450      29400
7788 SCOTT            3000      36000
7839 KING             5000      60000
7844 TURNER           1500      18000
7876 ADAMS            1100      13200

EMPNO ENAME             SAL    ANNLSAL
---------- ---------- ---------- ----------
7900 JAMES             950      11400
7902 FORD             3000      36000
7934 MILLER           1300      15600

已选择14行。

SQL> -- 视图的优点
SQL>
SQL> --优点：简化查询
SQL> --类似于java中的封住
SQL> --
SQL> --封装
SQL>
SQL>
SQL>
SQL> --视图不能提高性能
SQL> create or replace view view2
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e,dept d
5  where e.deptno=d.deptno
6  with read only;

视图已创建。

SQL> select * from view2;

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7782 CLARK            2450      29400 ACCOUNTING
7839 KING             5000      60000 ACCOUNTING
7934 MILLER           1300      15600 ACCOUNTING
7566 JONES            2975      35700 RESEARCH
7902 FORD             3000      36000 RESEARCH
7876 ADAMS            1100      13200 RESEARCH
7369 SMITH             800       9600 RESEARCH
7788 SCOTT            3000      36000 RESEARCH
7521 WARD             1250      15000 SALES
7844 TURNER           1500      18000 SALES
7499 ALLEN            1600      19200 SALES

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7900 JAMES             950      11400 SALES
7698 BLAKE            2850      34200 SALES
7654 MARTIN           1250      15000 SALES

已选择14行。

SQL> -- with check option
SQL> create view view3
  2  as
  3  select * from emp where deptno=10;

视图已创建。

SQL> insert into view3 values (**,10);
insert into view3 values (**,10)
*
第 1 行出现错误:
ORA-00936: 缺失表达式


SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10

7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('1111','ki','clerk','7839','17-11月-81',11,2,10);

已创建 1 行。

SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20);

已创建 1 行。

SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10




SQL> create or replace view view3
  2  as
  3  select * from emp where deptno=10
4  with check option;

视图已创建。

SQL>
SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20);
insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20)
*
第 1 行出现错误:
ORA-01402: 视图 WITH CHECK OPTION where 子句违规



SQL> create view dept_sal
  2  as
  3  select min(e.sal) minsal,max(e.sal) maxsal,avg(e.sal) avgsal
       4  from emp e,dept d
5  where e.deptno=d.deptno
6  group by e.deptno;

视图已创建。

SQL> select * from dept_sal;

MINSAL     MAXSAL     AVGSAL
---------- ---------- ----------
950       2850 1566.66667
11       3000 1814.33333
11       5000    2190.25

SQL> --视图中使用DML的约束很多
SQL>
SQL> --不在视图中使用insert update
  SQL>  delete 语句
2
SQL> --可以使用with read only选项评比对视图的DML操作
SQL>
SQL>
SQL> host cls


/*
sequence
序列


CREATE SEQUENCE 序列名
[START  WITH  数字]  起始数字，升序默认为序列最小值，降序默认为序列最大值
[INCREMENT BY 数字] 步长(正数代表升序，负数代表降序)，默认为1
[MAXVALUE  数字|NOMAXVALUE] 序列可生成的最大值，NOMAXVALUE（默认值）时升序最大值为1027，降序最大值为-1
[MINVALUE 数字|NOMINVALUE] 序列的最小值(必须小于等于start with指定的数字，并小于MAXVALUE) ，NOMINVALUE （默认值）时升序最小值为1，降序最小值为-1026
[CACHE 数字|NOCACHE] 指定内存中预先分配的序号数，NOCACHE（默认值，缓存20个序列号)
[CYCLE|NOCYCLE]  CYCLE序列到达最大值或最小后，继续从头开始生成，NOCYCLE（默认值）序列到达最大值后停止继续生成值

 */


SQL> create sequence myseq;

序列已创建。

SQL> --主要提供主键值
SQL> --可以提高效率
SQL> --储存在内存中
SQL>
SQL> /*
SQL> 序列不连续：
SQL> 1.内存 ，长度20
SQL> 2.序列是一个公有对象
SQL> 	table a,table b，，，都可以用
SQL> create table testseq
SQL> (tid number,tname varchar2(20));
SQL> */


SQL> /*
SQL> 序列不连续、裂缝：
SQL> 1.回滚
SQL> 2.系统异常
SQL> 3.多个表同时使用同一序列
SQL> */
SQL>
SQL>

SQL> create table testseq
  2  (tid number,tname varchar2(20));

表已创建。

SQL> select myseq.NEXTVAL from dual;

NEXTVAL
----------
1

SQL> /

NEXTVAL
----------
2

SQL> select myseq.CURRVAL from dual;

CURRVAL
----------
2

SQL> /

CURRVAL
----------
2

SQL> select myseq.NEXTVAL from dual;

NEXTVAL
----------
3

SQL> /

NEXTVAL
----------
4

SQL> select myseq.CURRVAL from dual;

CURRVAL
----------
4

SQL> insert into testseq from testseq;
insert into testseq from testseq
*
第 1 行出现错误:
ORA-00926: 缺失 VALUES 关键字


SQL> insert into testseq values (myseq.NEXTVAL,'AA');

已创建 1 行。

SQL> select * from testseq;

TID TNAME
---------- --------------------
6 AA

SQL> insert into testseq values (myseq.NEXTVAL,'AA');

已创建 1 行。

SQL> /

已创建 1 行。

SQL>
SQL>
SQL> /

已创建 1 行。

SQL> select * from testseq;

TID TNAME
---------- --------------------
6 AA
7 AA
8 AA
9 AA

SQL> rollback
2  ;

回退已完成。

SQL> insert into testseq values (myseq.NEXTVAL,'AA');

已创建 1 行。

SQL> select * from testseq;

TID TNAME
---------- --------------------
10 AA


-- 从1开始，步长为1，没有最大值
create sequence my_seq
nomaxvalue

-- 从10开始，步长为2，没有最大值，缓存30个序号
create sequence my_se2
start with 10
increment by 2
nomaxvalue
cache 30

-- 从1开始，步长为1，最大值为10，不缓存，到最大值后从头开始生成
create sequence my_se3
start with 1
increment by 1
maxvalue 10
nocache
cycle


SQL>
SQL> -- 索引

SQL> create index myindex on emp(deptno);

索引已创建。


-- 查询序列

SELECT	sequence_name, min_value, max_value,
  increment_by, last_number
FROM	user_sequences;


