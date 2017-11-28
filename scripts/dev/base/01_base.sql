-- ## 基本查询

SQL> --	清屏
SQL> host cls

SQL> -- 查看当前用户
SQL> show user
USER 为 "SCOTT"

SQL> -- 当前用户下的表
SQL> select * from tab;

SQL> -- 设置行宽
SQL> set linesize 120
SQL> -- 设置列宽
SQL> col ename for a8
SQL> -- a8 a是字符串8是长度

SQL> -- sql 优化
SQL> /*
SQL> sql优化：
SQL> 【sql优化有那些方式】
SQL> 1.尽量使用列名代替*
SQL> 	Oracle 9i之后，可以认为是一样的
SQL> */


SQL> -- 修改错误的两种方法
SQL> -- no.1 稍微麻烦
SQL> -- c命令 change
SQL> 2
2* form emp
SQL> c form/from
SP2-0023: 未找到字符串
SQL> c /form/from
2* from emp
SQL> /

SQL> -- 第二种方法
SQL> ed
已写入 file afiedt.buf

1  select empno as "员工号",ename "姓名",sal 月薪,sal*12 年  薪
2* from emp
SQL> ed
已写入 file afiedt.buf

1  select empno as "员工号",ename "姓名",sal 月薪,sal*12 年  薪
2* from emp
SQL> /
select empno as "员工号",ename "姓名",sal 月薪,sal*12 年  薪
                                                  *


SQL> -- 别名里有空格或者关键字必须加引号
SQL> ed
已写入 file afiedt.buf

1  select empno as "员工号",ename "姓名",sal 月薪,sal*12 "年  薪"
     2* from emp

SQL> /

员工号 姓名             月薪     年  薪
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

员工号 姓名             月薪     年  薪
---------- ---------- ---------- ----------
7900 JAMES             950      11400
7902 FORD             3000      36000
7934 MILLER           1300      15600

已选择14行。

SQL> -- ed  edit

SQL> /*
SQL> sql中的null值
SQL> ：
SQL> 1，包含null值的表达式都为null
SQL> 2，在sql中，null！=null
SQL> *、
SQL> */
SQL> -- comm 如果为null，年薪即为null
SQL> -- 滤空函数
SQL> -- nvl()
SQL> -- nvl2()
SQL> -- nvl(a,b) 当a=null，返回b
SQL> ed
已写入 file afiedt.buf

1  select empno,ename,sal,sal*12 年薪,comm 奖金, sal*12+nvl(comm,0) 年收入
        2* from emp

SQL> /

EMPNO ENAME      SAL       年薪       奖金     年收入
---------- -------- ----- ---------- ---------- ----------
7369 SMITH      800       9600                  9600
7499 ALLEN     1600      19200        300      19500
7521 WARD      1250      15000        500      15500
7566 JONES     2975      35700                 35700
7654 MARTIN    1250      15000       1400      16400
7698 BLAKE     2850      34200                 34200
7782 CLARK     2450      29400                 29400
7788 SCOTT     3000      36000                 36000
7839 KING      5000      60000                 60000
7844 TURNER    1500      18000          0      18000
7876 ADAMS     1100      13200                 13200

EMPNO ENAME      SAL       年薪       奖金     年收入
---------- -------- ----- ---------- ---------- ----------
7900 JAMES      950      11400                 11400
7902 FORD      3000      36000                 36000
7934 MILLER    1300      15600                 15600

已选择14行。

SQL> -- 数据是核心
SQL> --
SQL> -- 查询奖金为null的员工
SQL> select *
          2  from
3  emp
4  where comm=null;

未选定行

SQL> --null!=null
SQL> ed
已写入 file afiedt.buf

1  select *
        2  from emp
3* where comm is null
SQL> /

EMPNO ENAME    JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- -------- --------- ---------- -------------- ----- ---------- ----------
7369 SMITH    CLERK           7902 17-12月-80       800                    20
7566 JONES    MANAGER         7839 02-4月 -81      2975                    20
7698 BLAKE    MANAGER         7839 01-5月 -81      2850                    30
7782 CLARK    MANAGER         7839 09-6月 -81      2450                    10
7788 SCOTT    ANALYST         7566 19-4月 -87      3000                    20
7839 KING     PRESIDENT            17-11月-81      5000                    10
7876 ADAMS    CLERK           7788 23-5月 -87      1100                    20
7900 JAMES    CLERK           7698 03-12月-81       950                    30
7902 FORD     ANALYST         7566 03-12月-81      3000                    20
7934 MILLER   CLERK           7782 23-1月 -82      1300                    10

已选择10行。


SQL> /*
SQL> SQL99 ANSI 1999
SQL> 标准
SQL> orcl不完全遵循，
SQL> */
SQL> -- dual 表 伪表


SQL> -- 查询员工信息：
SQL> -- ****的薪水是***
SQL> select ename||'的薪水是'||sal
2  from emp;

ENAME||'的薪水是'||SAL
----------------------------------------------------------
SMITH的薪水是800
ALLEN的薪水是1600
WARD的薪水是1250
JONES的薪水是2975
MARTIN的薪水是1250
BLAKE的薪水是2850
CLARK的薪水是2450
SCOTT的薪水是3000
KING的薪水是5000
TURNER的薪水是1500
ADAMS的薪水是1100

ENAME||'的薪水是'||SAL
----------------------------------------------------------
JAMES的薪水是950
FORD的薪水是3000
MILLER的薪水是1300

已选择14行。

SQL> -- select update insert delete commit
SQL> -- set col ed c
SQL> -- sql vs sql*plus
SQL> -- desc 是 sqlplus 语句
SQL> -- sql 不能缩写 ，，sqlplus可以缩写
SQL> -- describe == desc
SQL> /*
SQL> oracle服务
SQL> isql*plus 相当于tomcat
SQL> sqlpuls 的web版，11g中没有，9i和10g中有
SQL> 11g中被sql develop取代
SQL>
SQL> */
SQL>
SQL> -- isql*plus,明文，不安全