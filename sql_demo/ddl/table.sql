-- ## 管理和创建表

SQL> -- 数据库对象
SQL>  -- 12个
SQL> -- 表！
SQL> 	-- datalink，，分布式数据库
SQL>
SQL> -- 创建，修改，删除

SQL> 	-- create table 权限
SQL> 	-- 存储空间
SQL>
SQL> -- 创建表
shawn@XE> create table test1
  2  (tid number,
  3  tname varchar2(20),
  4  hidatedate date default sysdate);

表已创建。


shawn@XE> insert into test1(tid,tname) values (1,'shawn');

已创建 1 行。

shawn@XE> select * from test1;

TID TNAME		HIDATEDATE
---------- -------------------- --------------
1 shawn                01-9月 -17

已选择 1 行。


SQL> create table emp20 as select * from emp where 1=2;




SQL> create table emp10 as select * from emp where deptno=20;

表已创建。

SQL> select * from emp20;

未选定行

SQL> select * from emp10;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7369 SMITH      CLERK           7902 17-12月-80            800
20

7566 JONES      MANAGER         7839 02-4月 -81           2975
20

7788 SCOTT      ANALYST         7566 19-4月 -87           3000
20


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7876 ADAMS      CLERK           7788 23-5月 -87           1100
20

7902 FORD       ANALYST         7566 03-12月-81           3000
20


SQL>
SQL>
SQL> -- 快速建表
SQL> -- 创建表： 包含 员工号，姓名，月薪，年薪，部门



SQL> create table empincome
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e, dept d
5  where d.deptno=d.deptno;

表已创建。

SQL> select * from empincome
2  ;

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7369 SMITH             800       9600 ACCOUNTING
7499 ALLEN            1600      19200 ACCOUNTING
7521 WARD             1250      15000 ACCOUNTING
7566 JONES            2975      35700 ACCOUNTING
7654 MARTIN           1250      15000 ACCOUNTING
7698 BLAKE            2850      34200 ACCOUNTING
7782 CLARK            2450      29400 ACCOUNTING
7788 SCOTT            3000      36000 ACCOUNTING
7839 KING             5000      60000 ACCOUNTING
7844 TURNER           1500      18000 ACCOUNTING
7876 ADAMS            1100      13200 ACCOUNTING

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7900 JAMES             950      11400 ACCOUNTING
7902 FORD             3000      36000 ACCOUNTING
7934 MILLER           1300      15600 ACCOUNTING
7369 SMITH             800       9600 RESEARCH
7499 ALLEN            1600      19200 RESEARCH
7521 WARD             1250      15000 RESEARCH
7566 JONES            2975      35700 RESEARCH
7654 MARTIN           1250      15000 RESEARCH
7698 BLAKE            2850      34200 RESEARCH
7782 CLARK            2450      29400 RESEARCH
7788 SCOTT            3000      36000 RESEARCH

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7839 KING             5000      60000 RESEARCH
7844 TURNER           1500      18000 RESEARCH
7876 ADAMS            1100      13200 RESEARCH
7900 JAMES             950      11400 RESEARCH
7902 FORD             3000      36000 RESEARCH
7934 MILLER           1300      15600 RESEARCH
7369 SMITH             800       9600 SALES
7499 ALLEN            1600      19200 SALES
7521 WARD             1250      15000 SALES
7566 JONES            2975      35700 SALES
7654 MARTIN           1250      15000 SALES

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7698 BLAKE            2850      34200 SALES
7782 CLARK            2450      29400 SALES
7788 SCOTT            3000      36000 SALES
7839 KING             5000      60000 SALES
7844 TURNER           1500      18000 SALES
7876 ADAMS            1100      13200 SALES
7900 JAMES             950      11400 SALES
7902 FORD             3000      36000 SALES
7934 MILLER           1300      15600 SALES
7369 SMITH             800       9600 OPERATIONS
7499 ALLEN            1600      19200 OPERATIONS

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7521 WARD             1250      15000 OPERATIONS
7566 JONES            2975      35700 OPERATIONS
7654 MARTIN           1250      15000 OPERATIONS
7698 BLAKE            2850      34200 OPERATIONS
7782 CLARK            2450      29400 OPERATIONS
7788 SCOTT            3000      36000 OPERATIONS
7839 KING             5000      60000 OPERATIONS
7844 TURNER           1500      18000 OPERATIONS
7876 ADAMS            1100      13200 OPERATIONS
7900 JAMES             950      11400 OPERATIONS
7902 FORD             3000      36000 OPERATIONS

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7934 MILLER           1300      15600 OPERATIONS

已选择56行。

SQL> create table empincome
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e, dept d
5  where e.deptno=d.deptno;
create table empincome
  *
  第 1 行出现错误:
  ORA-00955: 名称已由现有对象使用


SQL> delete table empincome;
delete table empincome
*
第 1 行出现错误:
ORA-00903: 表名无效


SQL> delete empincome;

已删除56行。

SQL> create table empincome
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e, dept d
5  where e.deptno=d.deptno;
create table empincome
  *
  第 1 行出现错误:
  ORA-00955: 名称已由现有对象使用


SQL> create table empincome2
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e, dept d
5  where e.deptno=d.deptno;

表已创建。

SQL> select * from empincome2;

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

SQL> --建表：empincome
SQL>
SQL> --创建视图
SQL> create view empincome2
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e, dept d
5  where e.deptno=d.deptno;
from emp e, dept d
*
第 4 行出现错误:
ORA-00955: 名称已由现有对象使用


SQL> --?视图
SQL>
SQL>
SQL> --rowid
SQL> --行地址
--索引表
--B图索引
--二叉树索引
SQL> select rowid,empno,ename from emp;

ROWID                   EMPNO ENAME
------------------ ---------- ----------
AAAR3sAAEAAAACXAAA       7369 SMITH
AAAR3sAAEAAAACXAAB       7499 ALLEN
AAAR3sAAEAAAACXAAC       7521 WARD
AAAR3sAAEAAAACXAAD       7566 JONES
AAAR3sAAEAAAACXAAE       7654 MARTIN
AAAR3sAAEAAAACXAAF       7698 BLAKE
AAAR3sAAEAAAACXAAG       7782 CLARK
AAAR3sAAEAAAACXAAH       7788 SCOTT
AAAR3sAAEAAAACXAAI       7839 KING
AAAR3sAAEAAAACXAAJ       7844 TURNER
AAAR3sAAEAAAACXAAK       7876 ADAMS

ROWID                   EMPNO ENAME
------------------ ---------- ----------
AAAR3sAAEAAAACXAAL       7900 JAMES
AAAR3sAAEAAAACXAAM       7902 FORD
AAAR3sAAEAAAACXAAN       7934 MILLER

已选择14行。

SQL>  -- 当成指针
SQL>
SQL>  -- select语句中有表达式，必须使用别名
SQL> host cls

SQL>
SQL>
SQL>
SQL>
SQL> -- 修改表
SQL>
SQL>   -- 追加新列，修改列，删除列，重命名列
SQL>
SQL> desc test1
名称                                      是否为空? 类型
----------------------------------------- -------- ----------------------------
TID                                                NUMBER
TNAME                                              VARCHAR2(20)
HIDATEDATE                                         DATE

SQL> alter table test1 add photo blob;

表已更改。

SQL> desc photo;
ERROR:
ORA-04043: 对象 photo 不存在


SQL> desc test1;
名称                                      是否为空? 类型
----------------------------------------- -------- ----------------------------
TID                                                NUMBER
TNAME                                              VARCHAR2(20)
HIDATEDATE                                         DATE
PHOTO                                              BLOB

SQL> alter table test1 modify tname varchar2(40);

表已更改。

SQL> alter table test1 drop column photo;

表已更改。


SQL> desc test1
名称                                      是否为空? 类型
----------------------------------------- -------- ----------------------------
TID                                                NUMBER
TNAME                                              VARCHAR2(40)
HIDATEDATE                                         DATE

SQL>  -- rename
SQL> alter table test1 rename column tname to username;

表已更改。

SQL> desc test1
名称                                      是否为空? 类型
----------------------------------------- -------- ----------------------------
TID                                                NUMBER
USERNAME                                           VARCHAR2(40)
HIDATEDATE                                         DATE

SQL> rollback
2  ;

回退已完成。

SQL> desc test1
名称                                      是否为空? 类型
----------------------------------------- -------- ----------------------------
TID                                                NUMBER
USERNAME                                           VARCHAR2(40)
HIDATEDATE                                         DATE

SQL> host cls

SQL>
SQL>
SQL>
SQL>
SQL> -- 删除表


SQL> drop table TEST1;

表已删除。


shawn@XE> select * from tab;

TNAME			       TABTYPE	CLUSTERID
------------------------------ ------- ----------
BIN$WBuzuN0wK/fgUAB/AQBZHQ==$0 TABLE

已选择 1 行。

shawn@XE> show recyclebin;
ORIGINAL NAME	 RECYCLEBIN NAME		OBJECT TYPE  DROP TIME
---------------- ------------------------------ ------------ -------------------
TEST1		 BIN$WBuzuN0wK/fgUAB/AQBZHQ==$0 TABLE	     2017-09-01:14:16:31

SQL> -- 清空回收站
SQL> purge recyclebin;

回收站已清空。

SQL> show recyclebin

SQL> -- 如何将回收站的文件恢复————>返回















