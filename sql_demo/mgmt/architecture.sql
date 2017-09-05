-- 查看 sga 大小信息
system@XE> show parameter sga;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
lock_sga			     boolean	 FALSE
pre_page_sga			     boolean	 FALSE
sga_max_size			     big integer 1G
sga_target			     big integer 0

-- 查看表空间 tablespace
system@XE> select * from v$tablespace;

TS# NAME 			  INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
0 SYSTEM			  YES NO  YES
2 UNDOTBS1			  YES NO  YES
1 SYSAUX			  YES NO  YES
4 USERS			  YES NO  YES
3 TEMP 			  NO  NO  YES
6 T_PASDB			  YES NO  YES
7 CONTRACT			  YES NO  YES
8 EF_APP			  YES NO  YES
9 FORM2011			  YES NO  YES
10 GX_APP			  YES NO  YES
11 HXDB 			  YES NO  YES

TS# NAME 			  INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
12 HZAPP			  YES NO  YES
13 T_ZZDAPP			  YES NO  YES
14 T_SHAWN			  YES NO  YES

已选择14行。

-- 数据库全局名称
/*
全局数据库名（ GLOBAL_DB_NAME ）
DB_NAME.Domain_NAME：由"数据库名称"与"网域名称"所组成，其中「数据库名称」设定于 DB_NAME 参数，
而「网域名称」则是设定于 DB_DOMAIN 参数。主要用在分布式环境下将相同域的数据库组织在一起。
*/
-- 数据库名 DB_NAME
system@XE> select name from v$database;

NAME
---------
XE

已选择 1 行。

system@XE> show parameter db_name;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_name 			     string	 XE
system@XE>

-- 数据库域名 db_domain
system@XE> select value from v$parameter where name = 'db_domain';

VALUE
--------------------------------------------------------------------------------


已选择 1 行。

system@XE> show parameter domain;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_domain			     string
system@XE>

-- 数据库实例名 instance_name
system@XE> select value from v$parameter where name = 'instance_name';

VALUE
--------------------------------------------------------------------------------
XE

已选择 1 行。
system@XE> show parameter instance_name;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
instance_name			     string	 XE
system@XE>

-- 数据库服务名 service_names
system@XE> select value from v$parameter where name = 'service_names';

VALUE
--------------------------------------------------------------------------------
XE

已选择 1 行。

system@XE> show parameter service_names;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
service_names			     string	 XE
system@XE>

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

-- 数据文件

sys@XE> select name from v$datafile;

NAME
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/XE/system.dbf
/u01/app/oracle/oradata/XE/sysaux.dbf
/u01/app/oracle/oradata/XE/undotbs1.dbf
/u01/app/oracle/oradata/XE/users.dbf

sys@XE>
sys@XE> select file_name,bytes from dba_data_files;

FILE_NAME
--------------------------------------------------------------------------------
BYTES
----------
/u01/app/oracle/oradata/XE/users.dbf
3586129920

/u01/app/oracle/oradata/XE/sysaux.dbf
796917760

/u01/app/oracle/oradata/XE/undotbs1.dbf
235929600

sys@XE>


-- 控制文件
sys@XE> select name from v$controlfile;

NAME
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/XE/control.dbf

已选择 1 行。

sys@XE> show parameter control_files;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
control_files			     string	 /u01/app/oracle/oradata/XE/con
trol.dbf
sys@XE>


-- redo log 文件
sys@XE> select group#,member from v$logfile;

GROUP#
----------
MEMBER
--------------------------------------------------------------------------------
2
/u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_2_d82twc17_.log

1
/u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_1_d82twb55_.log


已选择2行。

sys@XE> select group#,bytes from v$log;

GROUP#	BYTES
---------- ----------
1   52428800
2   52428800

已选择2行。

sys@XE>
