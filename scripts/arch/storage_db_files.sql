/*
Control Files
控制文件
 */
sys@XE> select name from v$controlfile;

/u01/app/oracle/oradata/XE/control.dbf

sys@XE> show parameter control_files;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
control_files			     string	 /u01/app/oracle/oradata/XE/con
trol.dbf
sys@XE>


/*
Data Files 数据文件
 */
sys@XE> select name from v$datafile;

NAME
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/XE/system.dbf
/u01/app/oracle/oradata/XE/sysaux.dbf
/u01/app/oracle/oradata/XE/undotbs1.dbf
/u01/app/oracle/oradata/XE/users.dbf
/u01/app/oracle/oradata/XE/T_SHAWN.dbf


sys@XE>
sys@XE> select file_name,bytes from dba_data_files;

/u01/app/oracle/oradata/XE/users.dbf	104857600
/u01/app/oracle/oradata/XE/sysaux.dbf	681574400
/u01/app/oracle/oradata/XE/undotbs1.dbf	26214400
/u01/app/oracle/oradata/XE/system.dbf	377487360
/u01/app/oracle/oradata/XE/T_SHAWN.dbf	209715200


/*
Online Redo Log
 */

sys@XE> select group#,member from v$logfile;

2	/u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_2_dv180t3r_.log
1	/u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_1_dv180s9d_.log


sys@XE> select group#,bytes from v$log;

1	52428800
2	52428800



