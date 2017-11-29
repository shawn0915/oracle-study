# LGWR
Redo Log Writer, 日志写入进程

日志写入进程是将重做日志缓冲区中的内容写入到磁盘文件上。
- 负责将日志缓冲区中的日志数据写入日志文件（每隔3秒 ，缓存区的占用率达到1MB或1/3满时，用户提交commit时，缓冲区的数据写入磁盘前(DBWn要执行写入前)）
- 系统有多个日志文件，该进程以循环的方式将数据写入文件

磁盘IO瓶颈

## Ref

- [wiki/LGWR](http://www.orafaq.com/wiki/LGWR)