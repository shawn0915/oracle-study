/*
Flashback
 */

-- 确保数据库处于归档日志模式
SELECT log_mode
FROM V$DATABASE;

LOG_MODE
------------
ARCHIVELOG

已选择 1 行。


/*
创建闪回恢复区
指定目的路径
限制占用的最大空间量(单位字节)
 */
system@XE> alter system set db_recovery_file_dest = '/u01/app/oracle/flashback';

系统已更改。

system@XE> alter system set db_recovery_file_dest_size = 8G;

系统已更改。