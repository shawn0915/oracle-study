# Oracle Database Architecture

- [内存结构](../Mgmt/Memory.md)
  - SGA
  - PGA
- [进程结构](../Mgmt/Progress.md)
  - 用户进程
  - 服务器进程
  - Background Process, 后台进程
- 存储结构
  - 物理结构
  - 逻辑结构

```oracle
Oracle服务器=Oralce数据库+Oracle实例
数据库=物理结构+逻辑结构
实例=后台进程+内存结构
```

## 物理结构

- 模式 schema
- [表空间 tablespace](../sql_demo/mgmt/arch_tablespace.sql)
  - 段 segment
  - 区 extent
  - 块 data blocks
- [数据库文件](../sql_demo/mgmt/arch_db_file.sql)
  - 控制文件 .ctl
  - 数据文件 .dbf
  - Redo日志文件 .log
- 可插拔数据库(PDB)(12c)
- 日志档案
- 块变化跟踪文件
- Flashback日志
- 恢复备份(RMAN)文件

## Oracle DBMS

==> [进程管理](../Mgmt/Progress.md)

## Oracle 工作区域

用户/模式

在Oracle中，用户和模式同义

