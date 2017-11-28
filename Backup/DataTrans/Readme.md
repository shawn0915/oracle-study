# 数据迁移

[SQL-DEMO-DATATRANS](../../scripts/backup/dataTrans.sql)

## 分类

- SQL*Loader数据迁移
- 表空间传输TTS

表空间在传输前必须是只读的。

- 数据文件的迁移
- 分区表迁移
- 外部表 External Table

用户SYS始终拥有目录，但任何用户要创建目录，必须获得`CREATE DIRECTORY`权限。

## 工具

- ORACLE_LOADER
- ORACLE_DATAPUMP
- 物化视图的prebuilt迁移方式

## 可恢复空间分配

扩容

## 段重组

- 行迁移

UPDATE语句导致行迁移。INSERT和DELETE语句不会导致行迁移。

用MOVE重组表将呈现所有不可用的相关索引。

- 段收缩

表收缩操作生成撤销和重做数据。索引得到维护，因为收缩实现为一组DML事务。在压缩期间没有表锁定，但在移动单独行时将锁定它们。

`SHRINK SPACE COMPACT`命令重组段的内容，但不返回空间给表空间。

表必须位于采用**自动段空间管理**功能和启用了**行移动**的表空间中，否则不能收缩。如果不满足这些条件，MOVE就是重组表的唯一方式。

不能收缩位于空闲列表管理的表空间中的表、有LONG列的表或是有refresh-on-commit物化视图的表。