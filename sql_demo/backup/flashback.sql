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

-- 查看设置后的参数
sys@XE> show parameter db_recovery;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_recovery_file_dest		     string	 /u01/app/oracle/flashback
db_recovery_file_dest_size	     big integer 8G



/*
设置闪回保留目标时间
参数 db_flashback_retention_target
默认值1天，单位分钟
 */
system@XE> alter system set db_flashback_retention_target=240;

系统已更改。

sys@XE> show parameter flashback;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_flashback_retention_target	     integer	 240


-- 干净地关闭并加载数据库
sys@XE> shutdown immediate;
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。

sys@XE> startup mount;
ORACLE 例程已经启动。

Total System Global Area 1068937216 bytes
Fixed Size		    2233344 bytes
Variable Size		  650120192 bytes
Database Buffers	  411041792 bytes
Redo Buffers		    5541888 bytes
数据库装载完毕。

-- 启用闪回日志记录
sys@XE> alter database flashback on;
alter database flashback on
*
第 1 行出现错误:
ORA-00439: 未启用功能: Flashback Database

将启动RVWR进程并在SGA中分配闪回缓冲区。从现在起该进程启动将是自动的。


-- 打开数据库
alter database open;

/*
闪回监视
 */
sys@XE> select flashback_on from v$database;

FLASHBACK_ON
------------------
NO

已选择 1 行。

SELECT *
FROM V$FLASHBACK_DATABASE_LOG;
SELECT *
FROM V$FLASHBACK_DATABASE_STAT;
select * from V$SGASTAT WHERE NAME = 'flashback generation buff';


/*
flashback drop
 */
hr@XE> create table t926(id int);

表已创建。

hr@XE> select * from tab;

TNAME			       TABTYPE	CLUSTERID
------------------------------ ------- ----------
COUNTRIES		       TABLE
DEPARTMENTS		       TABLE
EMPLOYEES		       TABLE
EMP_DETAILS_VIEW	       VIEW
JOBS			       TABLE
JOB_HISTORY		       TABLE
LOCATIONS		       TABLE
REGIONS 		       TABLE
T926			       TABLE

已选择9行。

hr@XE> insert into t926 values(926);

已创建 1 行。

hr@XE> commit;

提交完成。

hr@XE> select * from t926;

ID
----------
926

已选择 1 行。

hr@XE> drop table t926;

表已删除。

hr@XE> select * from t926;
select * from t926
              *
第 1 行出现错误:
ORA-00942: 表或视图不存在


hr@XE> flashback table t926 to before drop;

闪回完成。

hr@XE> select * from t926;

ID
----------
926

已选择 1 行。

hr@XE>

/*
回收站 recyclebin
 */
select * from dba_recyclebin;

show recyclebin;

/*
Flashback Query
 */
EXECUTE dbms_flashback.enable_at_time();

-- 冻结版本
EXECUTE dbms_flashback.disable;

-- 闪回表
flashback table emp to timestamp to_timestamp('26-09-17 13:50:10','dd-mm-yy hh24:mi:ss');

-- 闪回版本
hr@XE>
SELECT
  id,
  versions_xid,
  versions_startscn,
  versions_endscn,
  versions_operation,
  versions_starttime,
  versions_endtime
FROM t926 versions BETWEEN scn minvalue AND MAXVALUE;


ID VERSIONS_XID     VERSIONS_STARTSCN VERSIONS_ENDSCN V
---------- ---------------- ----------------- --------------- -
VERSIONS_STARTTIME
---------------------------------------------------------------------------
VERSIONS_ENDTIME
---------------------------------------------------------------------------
926


已选择 1 行。


/*
闪回数据归档
 */
-- 创建表空间
CREATE TABLESPACE fda DATAFILE 'fda1.dbf' size 10m;

-- 创建一个保留时间为7年的FDA
CREATE flashback archive fla1 TABLESPACE fda retention 7 YEAR;

-- 创建模式，并授予DBA角色
GRANT dba TO fbdauser IDENTIFIED BY fbdauser;

-- 授予用户操作归档的必要权限
GRANT flashback archive ON flal TO fbdauser;

-- 连接。创建一个表并为此表启用FDA
[oracle@localhost XE]$ sqlplus fbdauser/fbdauser

SQL*Plus: Release 11.2.0.2.0 Production on 星期二 9月 26 16:21:38 2017

Copyright (c) 1982, 2011, Oracle.  All rights reserved.


连接到:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

fbdauser@XE> create table t1 as select * from all_users;

表已创建。

fbdauser@XE> alter table t1 flashback archive fla1;
alter table t1 flashback archive fla1
*
第 1 行出现错误:
ORA-00439: 未启用功能: Flashback Data Archive


fbdauser@XE>

-- 删除表的除归档保护
alter table fbdauser.t1 no flashback archive;

-- 删除闪回数据归档
drop flashback archive fla1;
