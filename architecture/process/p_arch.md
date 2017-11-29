# ARCH
Redo Log Archiver, 归档进程

- 日志存满时将日志信息写到磁盘或磁带，以便磁盘故障的数据库恢复
- 日志写满后开始将数据写入下一个日志文件（日志切换）

Oracle数据库有两种运行方式(ARCHIVE LOG MODE)：归档（**ARCHIVELOG**）和非归档（NO ARCHIVELOG）

- 在非归档方式下(数据库默认方式)，日志切换直接覆盖以前的文档，不产生归档日志。
- 在归档方式下运行，在日志切换前，ARCH进程都对已写满的日志存档，以便保存数据库的所有更改，这样有利故障恢复。

LGWR对online redo log联机日志文件中执行写操作，ARCn读取联机日志文件，其他任何进程根本不接触此类文件。

## Ref

- [wiki/ARCH](http://www.orafaq.com/wiki/ARCH)