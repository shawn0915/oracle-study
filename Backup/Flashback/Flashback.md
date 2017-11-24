# Flushback 闪回

- [Flashback Drop](#flashback_drop)
- [Flashback Query](#flashback_query)
- [Flashback Database](#flashback_database)
- [Flashback Data Archive](#flashback_data_archive)


[SQL-DEMO-FLASHBACK](../../sql_scripts/backup/flashback.sql)

## Flashback_Drop

不能对表截断而只能对表删除执行闪回操作。

Flashback Drop命令仅使用于表，但是也会恢复所有相关的对象--外键约束除外。

Flashback Drop不适用于存储在SYSTEM表空间中的表：通过上面介绍的查询不能找到这些表，因为直接将它们删掉并清除了。

## Flashback_Query

闪回查询的三种形式都依赖UNDO段的使用。

所有形式的闪回查询依赖撤销数据来重构它在过去某个时间点的数据。

可以查询以前某个时间点的数据库，但是永远不能对过去版本的数据执行DML。

### 闪回版本

伪列

关键字`versions between`

闪回版本查询不能用于外部表、临时表或V$视图。原因是这些对象都不生成撤销数据。

### 闪回事务

`SELECT ANY TRANSACTION` 和 `FLASHBACK ANY TABLE` 权限必须授予将使用闪回事务功能的用户。

可以在 `FLASHBACK_TRANSACTION_QUERY` 视图中查看事务，`UNDO_SQL` 列作为反转更改的一条语句的构成部分。

通常由于约束违例造成的冲突可能使用闪回事务失败。

## Flashback_Database

不同于重做日志，不能多路复用和归档闪回日志，它们是自动创建和管理的。
闪回数据库要求归档日志模式并使用`ALTER DATABASE OPEN RESETLOGS`来创建数据库的一个新化身。

闪回恢复区。闪回恢复区应大于数据库、最后一次完整备份以来所有增量备份以及尚未备份到磁带的所有归档重做日志文件的大小的总和。


### 使用闪回数据库

> 工具

SQL*Plus/RMAN/Database Control

> 方法

- 关闭数据库
- 加载数据库
- 闪回到某个时间点、SCN或日志切换序列号
- 使用`RESETLOGS`打开数据库


## Flashback_Data_Archive

闪回数据归档

FBDA, Flashback Data Archive, 后台进程捕获行的前映像，将它们保存到归档中，并且清除已超过保留期限的数据的归档。

在介质损坏的情况下，如丢失数据文件，闪回技术无能为力。这种情况下必须借助于标准的备份、还原和恢复过程。


