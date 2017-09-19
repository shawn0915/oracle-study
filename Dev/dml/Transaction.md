# Transaction 事务

[SQL-DEMO](../../sql_demo/dev/dml/transaction.sql)

## 数据库事务

**ACID**

- Atomicity 原子性
- Consistency 一致性
- Isolation 隔离性
- Durability 持久性

### 执行SELECT

服务器进程将数据块从数据文件读取至数据库缓冲区缓存(SGA)，而DBWn进程则将数据块从数据库缓冲区缓存写入数据文件。

### 执行UPDATE

“撤销”不是“重做”的逆过程！对于表段、索引段或撤销段的数据块的变更来说，重做可以保护所有的数据块变更。就重做而言，撤销段只是另一个段，对这个段所做的任何变更都必须是持久的。


## 事务的边界

- 事务开始 begin
- 事务提交 commit
- 事务回滚 rollback

显式事务控制语句：COMMIT/ROLLBACK/SAVEPOINT

隐式终止事务：

- 发出DDL或者DCL语句
- 退出用户工具
- 客户会话终止
- 系统崩溃


## 事务控制

```oracle
COMMIT / ROLLBACK / SAVEPOINT / SELECT FOR UPDATE 
```

执行`COMMIT`命令时，DBWn进程不会进行任何操作。

重做日志流包含所有变更：应用于数据段和撤销段的更改(针对已提交和未提交的事务)。

任何DDL命令，`GRANT`或`REVOKE`都将提交当前事务。

`SAVEPOINT`让会话回滚部分事务。


## 事务隔离级别

```oracle
READ COMMITED
SERIALIZABLE
```


