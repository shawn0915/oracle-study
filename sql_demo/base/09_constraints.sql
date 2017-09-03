-- ## 约束

SQL> -- 约束
SQL> -- 约束的类型：

SQL> /*
SQL> not null
SQL> unique
SQL> primary key
SQL> foreign key
SQL> check
SQL>
SQL>
SQL>
SQL> --check 约束
SQL> create table test2
SQL> (tid number,
SQL>  tname varchar2(20),
SQL>  gender varchar2(4) check (gender in ('男','女')),
SQL>  sal number check (sal >0)
SQL> );
SQL> select * from tab;
SQL> select * from table
SQL> select * from
SQL> ---
SQL> */
SQL>  create table test2
  2   (tid number,
  3    tname varchar2(20),
  4    gender varchar2(4) check (gender in ('男','女')),
  5    sal number check (sal >0)
  6   );

表已创建。

SQL> insert into test2 values(1,'Mike','难',-22);
insert into test2 values(1,'Mike','难',-22)
*
第 1 行出现错误:
ORA-02290: 违反检查约束条件 (SCOTT.SYS_C0011101)


SQL> -- 约束  的名字
SQL>
SQL> -- 外键约束 级联操作
SQL> 	--on delete cascade
SQL> 	--on
SQL> 	--on delete set null
SQL>
SQL> 	-- 一般情况下，
SQL> 	-- 用 on delete set null
SQL> 	-- 作用：将子表的相关依赖记录的外键值设定为null
SQL>
SQL> host cls

SQL>



SQL> ED
已写入 file afiedt.buf

1  create table myperson(
  2  pid varchar2(18) constraint myperson_PK primary key,
  3  pname varchar2(4) constraint myperson_Name not null,
  4  gender varchar2(4) constraint myperson_Gender check (gender in ('男','女')),
  5  email varchar2(30) constraint myperson_Email UNIQUE,
  6  deptno number constraint myperson_FK references dept(deptno) ON DELETE NULL
7* )
SQL> /
deptno number constraint myperson_FK references dept(deptno) ON DELETE NULL
*
第 6 行出现错误:
ORA-00905: 缺失关键字


SQL> ED
已写入 file afiedt.buf

1  create table myperson(
  2  pid varchar2(18) constraint myperson_PK primary key,
  3  pname varchar2(4) constraint myperson_Name not null,
  4  gender varchar2(4) constraint myperson_Gender check (gender in ('男','女')),
  5  email varchar2(30) constraint myperson_Email UNIQUE,
  6  deptno number constraint myperson_FK references dept(deptno) ON DELETE SET NULL
7* )
SQL> /

表已创建。

SQL> insert into myperson values ('p001','Mike','male','haha@163.com',10);
insert into myperson values ('p001','Mike','male','haha@163.com',10)
*
第 1 行出现错误:
ORA-02290: 违反检查约束条件 (SCOTT.MYPERSON_GENDER)


SQL> insert into myperson values ('p001','Mike','男','haha@163.com',10);

已创建 1 行。

SQL> select * from myperson;

PID                PNAM GEND EMAIL                              DEPTNO
------------------ ---- ---- ------------------------------ ----------
p001               Mike 男   haha@163.com                           10

SQL> insert into myperson values ('&pid','&pname','&gender','&email',&deptno);
输入 pid 的值:  p001
输入 pname 的值:  Kitty
输入 gender 的值:  女
输入 email 的值:  12@123.com
输入 deptno 的值:  20
原值    1: insert into myperson values ('&pid','&pname','&gender','&email',&deptno)
新值    1: insert into myperson values ('p001','Kitty','女','12@123.com',20)
insert into myperson values ('p001','Kitty','女','12@123.com',20)
*
第 1 行出现错误:
ORA-12899: 列 "SCOTT"."MYPERSON"."PNAME" 的值太大 (实际值: 5, 最大值: 4)


SQL> /
输入 pid 的值:  p001
输入 pname 的值:  Mike
输入 gender 的值:  男
输入 email 的值:  12@12.com
输入 deptno 的值:  20
原值    1: insert into myperson values ('&pid','&pname','&gender','&email',&deptno)
新值    1: insert into myperson values ('p001','Mike','男','12@12.com',20)
insert into myperson values ('p001','Mike','男','12@12.com',20)
*
第 1 行出现错误:
ORA-00001: 违反唯一约束条件 (SCOTT.MYPERSON_PK)


SQL> /
输入 pid 的值:  p002
输入 pname 的值:  cc
输入 gender 的值:  女
输入 email 的值:  kk
输入 deptno 的值:  20
原值    1: insert into myperson values ('&pid','&pname','&gender','&email',&deptno)
新值    1: insert into myperson values ('p002','cc','女','kk',20)

已创建 1 行。

SQL> select * from myperson;

PID                PNAM GEND EMAIL                              DEPTNO
------------------ ---- ---- ------------------------------ ----------
p001               Mike 男   haha@163.com                           10
p002               cc   女   kk                                     20


-- 无效化约束
ALTER TABLE		employees
DISABLE CONSTRAINT	emp_emp_id_pk CASCADE;
-- 激活无效约束
ALTER TABLE		employees
ENABLE CONSTRAINT	emp_emp_id_pk;

-- 查询定义约束的列
SELECT	constraint_name, constraint_type,
  search_condition
FROM	user_constraints
WHERE	table_name = 'EMPLOYEES';