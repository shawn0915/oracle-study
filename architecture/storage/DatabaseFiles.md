# Database Files
数据库文件

[SQL-Demo-db-files](../../scripts/arch/storage_db_files.sql)

## Control Files
控制文件 control.ctl

多路复用控制文件(multiplexing the controlfile)
如，所有生产数据库将把三个控制文件副本放在三个独立设备上。

最多可有8个控制文件的多路复用副本。

## Data Files
数据文件 tablespacename.dbf

服务器进程对数据文件执行读操作，而 **DBWn** 对数据文件执行写操作。

## Online Redo Log
联机Redo日志文件 redo.log

就每个数据库而言，要保证其正常运行，至少必须有两个联机重做日志文件组；
要保证安全，每组至少要有两个成员。

- log writer (LGWR)

## Other Files

- Instance Parameter Files, 实例参数文件
  - [pfile/spfile](../../mgmt/Instance/Instance.md)
- Instance Diagnostic Files
- Password File, 口令文件
- Archive Redo Log Files, 归档重做日志文件
- Alert Log and Trace Files, 警报日志和跟踪文件