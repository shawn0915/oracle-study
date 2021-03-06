# Lock
锁

[SQL-DEMO-LOCK](../../scripts/dev/sql_statements/sql_dml_lock.sql)

## 作用

锁是数据库用来控制共享资源并发访问的机制。
锁用保护正在被修改的数据，在多用户环境下保持数据的完整性和一致性。
直到提交或回滚了事务之后，其他用户才可以更新数据。


## 类型

- 行级锁
  - 默认锁定级别
- 表级锁
  - 行共享 ROW SHARE, RS
  - 行排他 ROW EXCLUSIVE, RX
  - 共享 SHARE, S
  - 共享行排他 SHARE ROW EXCLUSIVE, SRX
  - 排他 EXCLUSIVE, X


## 排队机制 enqueue

如果多个会话请求同一行的排他锁，将按请求顺序，为这些会话授予排他锁。


## Dead Lock 死锁

死锁是**锁定争用**的一种特殊情况，并且通常由数据库本身自动解决。

死锁是一种程序设计错误。产生原因是试图执行在逻辑上不可行的操作。

