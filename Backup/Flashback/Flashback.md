# Flushback 闪回

- Flashback Drop
- Flashback Query
- Flashback Data Archive
- Flashback Database

[SQL-DEMO-FLASHBACK](../../sql_demo/backup/flashback.sql)

## Flashback Drop

不能对表截断而只能对表删除执行闪回操作。

## Flashback Query

闪回查询的三种形式都依赖UNDO段的使用。

## Flashback Data Archive

FBDA, Flashback Data Archive进程

在介质损坏的情况下，如丢失数据文件，闪回技术无能为力。这种情况下必须借助于标准的备份、还原和恢复过程。


## Flashback Database

不同于重做日志，不能多路复用和归档闪回日志，它们是自动创建和管理的。
闪回数据库要求归档日志模式并使用`ALTER DATABASE OPEN RESETLOGS`来创建数据库的一个新化身。






===================================================================================

- 从回收站还原已删除的表

- 使用闪回事务
- 执行闪回表操作
- 配置和监视 闪回数据库并执行闪回数据库操作

- 闪回指定表


闪回恢复区。闪回恢复区应大于数据库、最后一次完整备份以来所有增量备份以及尚未备份到磁带的所有归档重做日志文件的大小的总和。


- 闪回版本
- 闪回事务

