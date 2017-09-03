-- ## 事务


SQL> /*
SQL> Oracle 中的事物
SQL> 事务
SQL> 1.事务的起始标志：DML语句
SQL> 2.事务的结束标志：提交：显式提交 commit
SQL>                            隐式提交 DDL语句
SQL>                                    truncate本身是提交，
SQL>                                    正常退出exit
SQL>                    回滚：显式 rollback
SQL>                            隐式 非正常退出，掉电，宕机（系统出错）
SQL> */
SQL>
SQL> --保存点 savepoint
SQL> --控制事务
SQL>

SQL> create table testsavepoint
  2  (tid number,tname varchar2(20));

表已创建。

SQL> insert into
2   testsavepoint values(2,'Mary');

已创建 1 行。

SQL> savepoint a;

保存点已创建。

SQL> insert into
2   testsavepoint values(32,'Maryaa');

已创建 1 行。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa

已选择2行。

SQL> commit;

提交完成。

SQL> rollback to savepoint a;
rollback to savepoint a
*
第 1 行出现错误:
ORA-01086: 从未在此会话中创建保存点 'A' 或者该保存点无效


SQL> rollback
2  ;

回退已完成。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa

已选择2行。

SQL> insert into
2   testsavepoint values(322,'Maryaaa');

已创建 1 行。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa
322 Maryaaa

已选择3行。

SQL> savepoint b;

保存点已创建。

SQL> insert into
2   testsavepoint values(3222,'Maryaaaa');

已创建 1 行。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa
322 Maryaaa
3222 Maryaaaa

已选择4行。

SQL> rollback to savepoint b;

回退已完成。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa
322 Maryaaa

已选择3行。

SQL> rollback;

回退已完成。

SQL> select * from testsavepoint;

TID TNAME
---------- --------------------
2 Mary
32 Maryaa

已选择2行。

SQL>
/*
SQL> 数据库的隔离级别
SQL> 数据库提供4种事务隔离级别
SQL> sql1999标准
SQL>
SQL> Oracle支持sql99中2种事务隔离级别
SQL> READ COMMITED,SERIALIZABLE
SQL> 默认的事务隔离级别为：READ COMMITED
SQL>
SQL> Oracle提供的事务隔离级别有3个
SQL> READ ONLY
SQL>    --不属于sql99
SQL>
SQL> Mysql支持4种事务隔离级别
SQL> 默认--REPEATABLE READ
SQL>
SQL>
SQL> READ ONLY
SQL> 只读，可以查询，
SQL>
SQL> READ COMMITED
SQL> 读已提交数据，
SQL> 只允许事务读取已经被其他事务提交的变更，可以避免脏读，但不可重复读和幻读问题依然可能出现
*/
