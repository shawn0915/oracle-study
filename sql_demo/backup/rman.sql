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


/*
DRA
 */
list backup of tablespace sysaux;
backup as backupset tablespace sysaux;

RMAN> list failure;

RMAN> advise failure;


/*
非归档日志模式下还原数据库
 */
shutdown abort;
startup mount;
restore database;
alter database open resetlogs;


/*
确认自动备份未启用
 */
RMAN> show controlfile autobackup;

db_unique_name 为 XE 的数据库的 RMAN 配置参数为:
CONFIGURE CONTROLFILE AUTOBACKUP OFF; # default

-- 启用自动备份并确认
RMAN> configure autobackup on;
RMAN> show all;

/*
角色RECOVERY_CATALOG_OWNER 权限
 */
SELECT PRIVILEGE
FROM dba_sys_privs
WHERE grantee = 'RECOVERY_CATALOG_OWNER';

-- 创建表空间
CREATE TABLESPACE rman DATAFILE '/u01/app/oracle/oradata/XE/rman01.dbf' size 50m;
-- 创建用户
CREATE USER rman
  IDENTIFIED BY rman DEFAULT TABLESPACE rman;
-- 授权
GRANT RECOVERY_CATALOG_OWNER TO rman;
ALTER USER rman quota unlimited ON rman;
-- 连接到目录数据库
[oracle@localhost XE]$ rman catalog rman/rman

恢复管理器: Release 11.2.0.2.0 - Production on 星期二 9月 26 09:27:40 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

连接到恢复目录数据库

RMAN>
-- 创建目录
RMAN> create catalog;

恢复目录已创建

RMAN>
-- 退出RMAN，同时连接到目录和目标数据库
[oracle@localhost XE]$ rman catalog rman/rman target /

恢复管理器: Release 11.2.0.2.0 - Production on 星期二 9月 26 09:29:50 2017

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

已连接到目标数据库: XE (DBID=2835183447)
连接到恢复目录数据库

RMAN>
-- 注册目标数据库并查看是否已创建任何RMAN备份
RMAN> register database;

注册在恢复目录中的数据库
正在启动全部恢复目录的 resync
完成全部 resync

RMAN> list backup of database;

说明与资料档案库中的任何备份都不匹配

RMAN>
-- 执行一个完整的备份 todo

-- 退出RMAN，使用sql*plus查询一些视图以确认注册了目标数据库并且已执行了备份
[oracle@localhost XE]$ sqlplus rman/rman

SQL*Plus: Release 11.2.0.2.0 Production on 星期二 9月 26 09:32:25 2017

Copyright (c) 1982, 2011, Oracle.  All rights reserved.


连接到:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

rman@XE> select dbid,name from rc_database;

DBID NAME
---------- --------
2835183447 XE

已选择 1 行。

rman@XE> select db_id,bs_key,backup_type from rc_backup_set;

DB_ID     BS_KEY B
---------- ---------- -
2835183447	   36 D

已选择 1 行。

rman@XE>


/*
执行脱机-全部-完整备份
 */
RMAN> shutdown immediate;

数据库已关闭
数据库已卸装
Oracle 实例已关闭

RMAN> startup mount;

已连接到目标数据库 (未启动)
Oracle 实例已启动
数据库已装载

系统全局区域总计    1068937216 字节

Fixed Size                     2233344 字节
Variable Size                650120192 字节
Database Buffers             411041792 字节
Redo Buffers                   5541888 字节

RMAN> allocate channel dl type disk;

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00558: 分析输入命令时出错
RMAN-01009: 语法错误: 找到 "identifier": 应为: "for" 中的一个
RMAN-01008: 错误标识符: dl
RMAN-01007: 在第 1 行第 18 列, 文件: standard input

RMAN> allocate channel d1 type disk;

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00558: 分析输入命令时出错
RMAN-01009: 语法错误: 找到 "identifier": 应为: "for" 中的一个
RMAN-01008: 错误标识符: d1
RMAN-01007: 在第 1 行第 18 列, 文件: standard input

RMAN> backup as backupset database
2> format '/tmp/backup/offline_full_bak.bus';

启动 backup 于 26-9月 -17
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: backup 命令 (在 09/26/2017 09:43:55 上) 失败
RMAN-03014: 恢复目录的隐式重新同步失败
RMAN-06004: 恢复目录数据库发生 ORACLE 错误: ORA-03114: 未连接到 ORACLE

RMAN> alter database open;

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: alter db 命令 (在 09/26/2017 09:44:07 上) 失败
RMAN-06004: 恢复目录数据库发生 ORACLE 错误: ORA-03114: 未连接到 ORACLE

RMAN>


/*
DUPLICATE
复制数据库
 */
duplicate target database to newdb;
duplicate target database to newdb from active database;
