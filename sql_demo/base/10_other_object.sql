-- ## 其他数据库对象

/*
synonym 同义词
view 视图 viw_
sequence 序列 seq_
index 索引 sql_demo/ddl/index.sql
 */




-- 同义词
-- 私有同义词
create synonym emp for scott.emp;
-- 公有同义词
create public synonym emp for scott.emp;









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




-- 查询序列

SELECT	sequence_name, min_value, max_value,
  increment_by, last_number
FROM	user_sequences;


