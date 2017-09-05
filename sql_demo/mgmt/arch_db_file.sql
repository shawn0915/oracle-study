
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

