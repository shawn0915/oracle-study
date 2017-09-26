# Oracle Recovery Manager 恢复管理器(RMAN)

[SQL-DEMO-RMAN](../../sql_demo/backup/rman.sql)

[RMAN Concept](rman_concept.md)


## 配置 Oracle Recovery Manager

- RMAN 常用命令

```oracle
list
report
delete
```
`DELETE EXPIRED`命令不删除任何文件，它只更新RMAN存储库。`DELETE OBSOLETE`命令将删除文件并相应地更新存储库。

- 管理 flash_recovery_area
- 创建 RMAN catalog
- 控制文件自动备份


## 使用 Oracle Recovery Manager

- RMAN 交互方式
- “干净”备份
- 备份
- 管理备份数据
- 启、停块跟踪


## 数据恢复顾问 Data Recovery Advisor

诊断修复工具。

DRA只能用于单实例数据库的环境。它不能用于RAC集群数据库，也不能用于Data Guard备用数据库。

使用DRA流程：

- 访问数据故障
- 列出故障
- 提供修复建议
- 执行修复

如果不首先要求DRA列出故障，则DRA不会生成任何建议。对于最近一次列出之后发生的任何故障或修复的任何故障，DRA不提供任何建议。


## 高级功能

### 恢复目录

RMAN存储库总是存在于RMAN目标数据库控制文件中，但是它只能恢复由`CONTROLFILE_RECORD_KEEP_TIME`参数所指定的数据。
恢复目录是一个额外的存储区，它可以无限期地保留数据。

到目标数据库的RMAN连接通常是作为SYS用户发起的，因为一般需要发出启动和关闭命令。不需要指定`AS SYSDBA`--该工具假定如此。

RMAN可执行文件的版本必须与目标数据库相同，并且低于或等于用来创建目录的RMAN版本。

### 存储脚本


### 使用RMAN创建数据库

> `DUPLICATE`命令完成的工作

- 为复制数据库创建控制文件。
- 将目标数据文件还原到复制数据库，或直接从运行中的数据库复制。
- 执行不完整恢复，一直恢复到最后的归档重做日志文件为止。
- 关闭然后重启辅助实例。
- 使用`RESETLOGS`选项打开辅助数据库，以创建联机重做日志文件。
- 为辅助数据库生成新的DBID。

### 表空间时间点恢复(TSPITR)


### 虚拟专用目录

有助于多个DBA之间的职责分工。
一个或多个虚拟专用目录共享同一个基本恢复目录。

### 为异步I/O配置RMAN

- 将初始化参数`BACKUP_TAPE_IO_SLAVES`设置为TRUE，以便为异步操作配置磁带备份。
- 设置初始化参数`DBWR_IO_SLAVES`来分配4个从属备份磁盘I/O进程，以便模拟RMAN异步I/O操作。
- 使用动态性能视图`V$BACKUP_ASYNC_IO`来监视异步RMAN操作。


