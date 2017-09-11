# 进程结构

- 用户进程
- 服务器进程
- [后台进程](#后台进程)

[SQL-Demo-Progresses](../sql_demo/mgmt/mem_progress.sql)

查看系统进程数量。在Linux上，Oracle进程是独立的操作系统进程
```bash
ps -ef | grep oracle | wc -l
```

## 后台进程

> General Processes(Important)

- [CKPT](#ckpt)
- [DBWn](#dbwn)
- [LGWR](#lgwr)
- [PMON](#pmon)
- [SMON](#smon)

> General Processes(Other)

- [ARCH](#arch)
- [MMON](#mmon)
- [MMAN](#mman)
- [MMNL](#mmnl)
- [RECO](#reco)

> Other

- [GEN0](#gen0)
- [VKRM](#vkrm)


### CKPT

CKPT, 检查点进程, CheckPoint

在特定的时间点，所有DBWn进程将把SGA中所有改变的数据库缓冲区写入到数据文件中。这个事件叫检查点。
CKPT进程唤醒DBWn进程，更新数据库所有的数据文件和控制文件，并标记这次检查点的时间
- 保证所有修改过的数据库缓冲区都被写入数据库文件
- 检查完成后，保存检查点信息到数据库文件头和控制文，通过检查点记录当前数据结构和状态保证数据库的同步和完整

何时出现完全检查点？只会应请求这么做，或在有序关闭数据库时出现。

### DBWn

DBWn, Database Writer, 数据库写入进程

默认数量是每8个CPU对应一个数据库写入器(向上舍入)。

在提交事务时，DBWn什么都不做。

数据库写入进程是将数据库缓存中修改的数据块写到磁盘文件中。Oracle数据库最大允许20个数据库写入进程
- 管理数据缓冲区，将最近使用过的块保留在内存中
- 将修改后的缓冲区数据写入数据文件中（脏缓存达到阀值，系统中没有多余的空缓冲区来存放数据 ，CKPT 进程触发DBWR ，超时 ）
- 一个实例可有多个DBWR。在这样的实例中，一些块可写入一磁盘，另一些块可写入其它磁盘

[sql-demo-查看数据写入进程使用情况](../sql_demo/mgmt/mem_progress.sql)

### LGWR

LGWR, 日志写入进程, Redo Log Writer

日志写入进程是将重做日志缓冲区中的内容写入到磁盘文件上。
- 负责将日志缓冲区中的日志数据写入日志文件（每隔3秒 ，缓存区的占用率达到1MB或1/3满时，用户提交commit时，缓冲区的数据写入磁盘前(DBWn要执行写入前)）
- 系统有多个日志文件，该进程以循环的方式将数据写入文件

磁盘IO瓶颈


### SMON

SMON, System Monitor, 系统监控进程

当失败的数据库例程重启时，系统监控进程完成实例的恢复工作
- 在实例失败之后，重新打开数据库时，自动读取重做日志文件，自动恢复实例，提交回退事务，同步数据，控制，日志文件
- 整理数据文件的自由空间，将相邻区域结合起来
- 释放不再使用的临时段

### PMON

PMON, Process Monitor, 进程监控进程

当用户进程失败时，用于完成进程恢复，它将清理失败进程使用的缓冲区，释放失败进程使用的资源
- 清理出现故障的进程，在用户进程出现故障时执行进程恢复 
- 释放所有当前挂起的锁定，使其可以被其他用户使用 
- 清除失败的用户进程，释放故障进程使用的资源

如果会话异常终止，那么活动的事务会发生什么事情呢？PMON后台进程将回滚活动事务。

### ARCH

ARCH, Redo Log Archiver, 归档进程

- 日志存满时将日志信息写到磁盘或磁带，以便磁盘故障的数据库恢复
- 日志写满后开始将数据写入下一个日志文件（日志切换）

Oracle数据库有两种运行方式：归档（**ARCHIVELOG**）和非归档（NO ARCHIVELOG）

- 在非归档方式下(数据库默认方式)，日志切换直接覆盖以前的文档，不产生归档日志。
- 在归档方式下运行，在日志切换前，ARCH进程都对已写满的日志存档，以便保存数据库的所有更改，这样有利故障恢复。

LGWR对联机日志文件中执行写操作，ARCn读取联机日志文件，其他任何进程根本不接触此类文件。

![后台进程和内存的关系](img/progress_memory.png)

### MMON

MMON, Memory Monitor Process

默认情况，MMON每小时收集一次快照并启动ADDM。

### MMAN

MMAN, Memory Manager Process

### MMNL

MMNL, Manageability Monitor Light, MMON辅助进程

### RECO

RECO, Recoverer

### GEN0

GEN0(通用任务执行进程):主要是分担另外某个进程的阻塞处理。


### VKRM

VKRM, Virtual scheduler for resource manager background process

VKRM manages the CPU scheduling for all managed Oracle processes. The process schedules managed processes in accordance with an active resource plan.
