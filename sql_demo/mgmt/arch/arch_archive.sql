
-- 归档模式

[oracle@localhost ~]$ sqlplus system as sysdba

SQL*Plus: Release 11.2.0.2.0 Production on 星期二 9月 5 14:45:51 2017

Copyright (c) 1982, 2011, Oracle.  All rights reserved.


连接到:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

sys@XE> archive log list
数据库日志模式             非存档模式
自动存档             禁用
存档终点            USE_DB_RECOVERY_FILE_DEST
最早的联机日志序列     674
当前日志序列           675
sys@XE>

-- 修改为归档模式 archive
alter database archivelog;