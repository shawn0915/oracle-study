# Oracle Storage 存储结构

- [物理结构](#物理结构)
- [逻辑结构](#逻辑结构)

## 物理结构

- Schema, 模式
- [Database Files, 数据库文件](#数据库文件)
  - Control Files, 控制文件
  - Database Data Files, 数据文件
  - Online Redo Logs, 联机Redo日志文件
  - [Others](#others)
- 可插拔数据库(PDB)(12c)
- 日志档案
- 块变化跟踪文件
- Flashback日志
- 恢复备份(RMAN)文件



### 数据库文件

[SQL-Demo](../../sql_demo/mgmt/arch_db_file.sql)

#### Control Files, 控制文件 controlnn.ctl

多路复用控制文件(multiplexing the controlfile)
如，所有生产数据库将把三个控制文件副本放在三个独立设备上

#### Database Data Files, 数据文件 tablespacenamenn.dbf

服务器进程对数据文件执行读操作，而DBWn对数据文件执行写操作。

#### Online Redo Logs, 联机Redo日志文件 redonn.log

就每个数据库而言，要保证其正常运行，至少必须有两个联机重做日志文件组；
要保证安全，每组至少要有两个成员。

#### Others

> Instance Parameter File, 实例参数文件

[pfile/spfile](../../Mgmt/Instance/Instance.md)

> Password File, 口令文件


> Archive Redo Log Files, 归档重做日志文件


> Alert Log and Trace Files, 警报日志和跟踪文件




## 逻辑结构

- [Tablespace, 表空间](#tablespace)
  - [Segment, 段](#segement)
  - Extent, 区
  - Data Blocks, 块

### Tablespace

- 表空间将逻辑数据存储(段)从物理数据存储(数据文件)中抽象出来。
- 表空间可由多个数据文件组成。
- 元数据作为一组段存储在SYSTEM和SYSAUX表空间。

[SQL-Demo](../../sql_demo/mgmt/arch_tablespace.sql)


### Segment

- 一个段可以包含位于多个数据文件的区间。
- 一个段包含多个区间，一个区间包含多个Oracle块，一个Oracle块包含多个操作系统块。


## 其他

> 管理方案对象

- 分区表
- 索引组织表
- 簇
- 联机重组

> 管理存储

- 表空间监视
- 段收缩
- 恢复挂起语句
- 传输表空间
- 平台传输数据库

> 自动存储管理

- ASM 准备环境
- 利用 DBCA 创建 ASM 实例
- ASM 磁盘组上创建表空间
- 通过 asmcmd 查看生成的数据文件
- 命令行删除磁盘组
- 命令行创建磁盘组
- 修改磁盘组
- 利用 RMAN 将数据库文件系统迁移到 ASM
