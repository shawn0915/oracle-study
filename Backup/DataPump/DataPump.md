# Data Pump 数据泵

一个服务器端应用程序。

[SQL-DEMO-DATAPUMP](../../sql_scripts/backup/dataPump.sql)

## 进程

- expdp/impdp
- DMnn(Data Pump Master)
- DWnn(Data Pump Worker)
- Pnnn

主进程控制工作者进程。如果启用并行技术，那么每个DWnn进程都可以使用两个或多个并行执行服务器(Pnnn)。

## 文件类型

- SQL文件
- 日志文件
- 转储文件

## REF

[Oracle expdp/impdp导出导入命令及数据库备份](http://www.toutiao.com/i6393659189897462274/?wxshare_count=2&pbid=23980300841)






- 并行
- direct选项
  - remap  -- LOB字段
