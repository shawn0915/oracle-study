-- 查询动态性能视图
SELECT *
FROM v$flash_recovery_area_usage;


[oracle@localhost ~]$ rman target /

恢复管理器: Release 11.2.0.2.0 - Production on 星期一 9月 25 16:02:54 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

已连接到目标数据库: XE (DBID=2835183447)

RMAN> list backup;

使用目标数据库控制文件替代恢复目录
说明与资料档案库中的任何备份都不匹配

RMAN> list backup of database;

说明与资料档案库中的任何备份都不匹配

RMAN>


/*
映像备份
 */
RMAN> backup as copy database;


