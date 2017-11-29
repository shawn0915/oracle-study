# Logical
逻辑结构


![Oracle存储模型](../img/OracleDB_Storage_Model.png)

## Tablespace
表空间

- 表空间将逻辑数据存储(段)从物理数据存储(数据文件)中抽象出来。
- 表空间可由多个数据文件组成。
- 元数据作为一组段存储在SYSTEM和SYSAUX表空间。

[SQL-Demo-Tablespace](../../scripts/arch/storage_tablespace.sql)

OMF, Oracle-Managed Files

> 表空间类型

- SMALLFILE

可以具有多个文件，而且所有数据文件都可以向上重调

- BIGFILE

只能有一个文件

## Segment
段

- 一个段可以包含位于多个数据文件的区间。
- 一个段包含多个区间，一个区间包含多个Oracle块，一个Oracle块包含多个操作系统块。

[SQL-Demo-Segment](../../scripts/arch/storage_segment.sql)


## Extent
区

一个区间是位于一个数据文件的多个连续块。


## Data Blocks
块

一个Oracle块是一个或多个操作系统块。

Oracle块是数据库的基本I/O单元。


## Reference

- [Data Blocks](https://docs.oracle.com/cd/E11882_01/server.112/e40540/logical.htm#CNCPT302)