-- ## 过滤和排序


SQL> --查询10号部门员工
SQL> select *
       2  from emp
3  where deptno=10;


SQL> -- 字符串大小写敏感
SQL> --查询名叫KING的员工信息
SQL> select *
       2  from emp
3  where ename='KING';

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7839 KING       PRESIDENT            17-11月-81           5000
10


SQL> select *
       2  from emp
3  where ename='king';

未选定行

SQL> --日期格式敏感
SQL> --查询入职日期为 17-11月-81的员工
SQL> select *
       2  from emp
3  where hiredate='17-11月-81';

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7839 KING       PRESIDENT            17-11月-81           5000
10


SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where hiredate='1981-11-17'
SQL> /
where hiredate='1981-11-17'
*
第 3 行出现错误:
ORA-01861: 文字与格式字符串不匹配

SQL> --报错



SQL> /*
SQL> 9i之前的日期格式
SQL> DD-MON-YY
SQL> 9i之后
SQL> DD-MON-RR
SQL> */
SQL> --RR的算法
SQL> --当前时间
SQL> select sysdate from dual;

SYSDATE
--------------
31-8月 -17

已选择 1 行。

SQL> -- 查询系统参数
SQL> select * from v$nls_parameters;

PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_LANGUAGE
SIMPLIFIED CHINESE

NLS_TERRITORY
CHINA

NLS_CURRENCY
￥


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_ISO_CURRENCY
CHINA

NLS_NUMERIC_CHARACTERS
.,

NLS_CALENDAR
GREGORIAN


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_DATE_FORMAT
DD-MON-RR

NLS_DATE_LANGUAGE
SIMPLIFIED CHINESE

NLS_CHARACTERSET
AL32UTF8


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_SORT
BINARY

NLS_TIME_FORMAT
HH.MI.SSXFF AM

NLS_TIMESTAMP_FORMAT
DD-MON-RR HH.MI.SSXFF AM


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_TIME_TZ_FORMAT
HH.MI.SSXFF AM TZR

NLS_TIMESTAMP_TZ_FORMAT
DD-MON-RR HH.MI.SSXFF AM TZR

NLS_DUAL_CURRENCY
￥


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_NCHAR_CHARACTERSET
AL16UTF16

NLS_COMP
BINARY

NLS_LENGTH_SEMANTICS
BYTE


PARAMETER
----------------------------------------------------------------
VALUE
----------------------------------------------------------------
NLS_NCHAR_CONV_EXCP
FALSE


已选择19行。

SQL> -- v$nls_parameters 数据字典
SQL> --修改日期格式
SQL>
SQL> --alter 修改
SQL>
SQL>

SQL> /*
SQL>
SQL> java 中
SQL> int a = 0;
SQL>
SQL> plsql
SQL> number a := 0;
SQL> := 赋值
SQL>
SQL> */
SQL>
SQL> -- between ... and
SQL> --薪水在1000-2000的员工
SQL> select *
       2  from emp
3  where sal between 1000 and 2000;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择6行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where sal between 2000 and 1000
SQL> /

未选定行

SQL> /*
SQL> 1.含边界
SQL> 2.小值在前，大值在后
SQL> *、
SQL> */
SQL>
SQL>
SQL> --in  在集合中
SQL> -- 查询10和20号部门的员工
SQL> select *
       2  from emp
3  where deptno in (10,20);

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择8行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where deptno in (10,20,null)
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择8行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where deptno not in (10,20,null)
SQL> /

未选定行

SQL> -- 结论：如果集合中含有null值，不能使用not in操作符，但可以使用in
SQL> -- 原因，子查询

SQL>


1  select *
     2  from emp
3* where deptno in (10,20,30)
SQL> /

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

SQL> --like
SQL> --模糊查询
SQL> -- %，_
SQL> --查询名字以s打头的员工信息
SQL> select *
       2  from emp
3  where ename like 'S%';

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20

SQL> --查询名字是四个字的员工
SQL> select *
       2  from emp
3  where ename like '____';

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7839 KING       PRESIDENT            17-11月-81           5000                    10
7902 FORD       ANALYST         7566 03-12月-81           3000                    20

SQL> insert into emp
2  (empno,ename,sal,deptno)
3  values(1001,'Tmo_123',2000,10);

已创建 1 行。

SQL> select *
       2  from emp
3  ;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
1001 Tmo_123                                              2000                    10
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

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择15行。

SQL> -- 查询名字中含有下划线的员工
SQL> select *
     2  from emp
3* where ename like '%_%'
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
1001 Tmo_123                                              2000                    10
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

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择15行。

SQL> --使用转义字符
SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where ename like '%\_%' escape'\'
  '
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
1001 Tmo_123                                              2000                    10

SQL> --声明转义字符  escape
SQL>  ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* where ename like '%a_%' escape'a'
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
1001 Tmo_123                                              2000                    10

SQL> -- 习惯用'\'
SQL>


SQL> --逻辑运算符
SQL> --and or
SQL> -- where解析条件的时候，从右至左


SQL> --sql优化，
SQL> -- where condition1 and condition2
SQL> -- where condition2 and condition1
SQL> --可能实现的条件放and右边
SQL>


SQL> --排序  (order by)
SQL> --查询员工信息，按照月薪排序
SQL>
SQL> select *
       2  from emp
3  order by sal;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10

已选择14行。

SQL> --默认升序

1  select *
     2  from emp
3* order by sal desc
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7839 KING       PRESIDENT            17-11月-81           5000                    10
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7369 SMITH      CLERK           7902 17-12月-80            800                    20

已选择14行。


SQL> -- a 命令 append
SQL> -- a后面的空格，2个，2个以上
SQL> a  append
3* order by sal desc append
SQL> /
order by sal desc append
*
第 3 行出现错误:
ORA-00933: SQL 命令未正确结束


SQL> a desc
3* order by sal desc appenddesc
SQL> /
order by sal desc appenddesc
*
第 3 行出现错误:
ORA-00933: SQL 命令未正确结束


SQL> a
SP2-0004: 无须追加。
SQL> a desc
3* order by sal desc appenddescdesc
SQL> ;
1  select *
     2  from emp
3* order by sal desc appenddescdesc
SQL> /
order by sal desc appenddescdesc
*
第 3 行出现错误:
ORA-00933: SQL 命令未正确结束


SQL> a  desc
3* order by sal desc appenddescdesc desc
SQL> /
order by sal desc appenddescdesc desc
*
第 3 行出现错误:
ORA-00933: SQL 命令未正确结束


SQL> --a 追加
SQL> select *
       2  from emp
3  order by sal;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10

已选择14行。

SQL> a  desc
3* order by sal desc
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7839 KING       PRESIDENT            17-11月-81           5000                    10
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7369 SMITH      CLERK           7902 17-12月-80            800                    20

已选择14行。

SQL> -- order by 后面 +列名 ，表达式，别名，序号
SQL> select ename,sal,comm,sal*12+nvl(comm,0)
       2  from emp
3  order by sal*12+nvl(comm,0);

ENAME             SAL       COMM SAL*12+NVL(COMM,0)
---------- ---------- ---------- ------------------
SMITH             800                          9600
JAMES             950                         11400
ADAMS            1100                         13200
WARD             1250        500              15500
MILLER           1300                         15600
MARTIN           1250       1400              16400
TURNER           1500          0              18000
ALLEN            1600        300              19500
CLARK            2450                         29400
BLAKE            2850                         34200
JONES            2975                         35700

ENAME             SAL       COMM SAL*12+NVL(COMM,0)
---------- ---------- ---------- ------------------
SCOTT            3000                         36000
FORD             3000                         36000
KING             5000                         60000

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select ename,sal,comm,sal*12+nvl(comm,0) 年收入
     2  from emp
3* order by 年收入
SQL> /

ENAME             SAL       COMM     年收入
---------- ---------- ---------- ----------
SMITH             800                  9600
JAMES             950                 11400
ADAMS            1100                 13200
WARD             1250        500      15500
MILLER           1300                 15600
MARTIN           1250       1400      16400
TURNER           1500          0      18000
ALLEN            1600        300      19500
CLARK            2450                 29400
BLAKE            2850                 34200
JONES            2975                 35700

ENAME             SAL       COMM     年收入
---------- ---------- ---------- ----------
SCOTT            3000                 36000
FORD             3000                 36000
KING             5000                 60000

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select ename,sal,comm,sal*12+nvl(comm,0) 年收入
     2  from emp
3* order by 4
SQL> /

ENAME             SAL       COMM     年收入
---------- ---------- ---------- ----------
SMITH             800                  9600
JAMES             950                 11400
ADAMS            1100                 13200
WARD             1250        500      15500
MILLER           1300                 15600
MARTIN           1250       1400      16400
TURNER           1500          0      18000
ALLEN            1600        300      19500
CLARK            2450                 29400
BLAKE            2850                 34200
JONES            2975                 35700

ENAME             SAL       COMM     年收入
---------- ---------- ---------- ----------
SCOTT            3000                 36000
FORD             3000                 36000
KING             5000                 60000

已选择14行。

SQL> -- 序号排序
SQL> ed
已写入 file afiedt.buf

1  select ename,sal,comm,sal*12+nvl(comm,0) 年收入
     2  from emp
3* order by 5

SQL> /
order by 5
*
第 3 行出现错误:
ORA-01785: ORDER BY 项必须是 SELECT-list 表达式的数目


SQL> -- order by 跟多列
SQL> select *
       2  from emp
3  order by deptno,sal
4  ;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7839 KING       PRESIDENT            17-11月-81           5000                    10
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* order by deptno,sal desc
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7839 KING       PRESIDENT            17-11月-81           5000                    10
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7900 JAMES      CLERK           7698 03-12月-81            950                    30

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* order by deptno desc,sal
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7839 KING       PRESIDENT            17-11月-81           5000                    10

已选择14行。

SQL> -- desc 作用于离它最近的一列
SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* order by deptno desc,sal desc
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7369 SMITH      CLERK           7902 17-12月-80            800                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7839 KING       PRESIDENT            17-11月-81           5000                    10
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10

已选择14行。


SQL> -- 查询员工信息，按照奖金排序
SQL> -- 奖金中有null
SQL> select *
       2  from emp
3  order by sal;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* order by comm
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10

已选择14行。

SQL> ed
已写入 file afiedt.buf

1  select *
     2  from emp
3* order by comm desc
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30

已选择14行。

-- nulls last

1  select *
     2  from emp
3  order by comm desc
4* nulls last
SQL> /

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7654 MARTIN     SALESMAN        7698 28-9月 -81           1250       1400         30
7521 WARD       SALESMAN        7698 22-2月 -81           1250        500         30
7499 ALLEN      SALESMAN        7698 20-2月 -81           1600        300         30
7844 TURNER     SALESMAN        7698 08-9月 -81           1500          0         30
7788 SCOTT      ANALYST         7566 19-4月 -87           3000                    20
7839 KING       PRESIDENT            17-11月-81           5000                    10
7876 ADAMS      CLERK           7788 23-5月 -87           1100                    20
7900 JAMES      CLERK           7698 03-12月-81            950                    30
7902 FORD       ANALYST         7566 03-12月-81           3000                    20
7934 MILLER     CLERK           7782 23-1月 -82           1300                    10
7698 BLAKE      MANAGER         7839 01-5月 -81           2850                    30

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------------- ---------- ---------- ----------
7566 JONES      MANAGER         7839 02-4月 -81           2975                    20
7369 SMITH      CLERK           7902 17-12月-80            800                    20
7782 CLARK      MANAGER         7839 09-6月 -81           2450                    10

已选择14行。

SQL> -- null排在后面