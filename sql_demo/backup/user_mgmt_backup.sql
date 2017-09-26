/*
sql*plus
生成备份命令
 */
select 'cp ' || name || ' /u01/app/oracle' from v$controlfile;
select 'cp ' || name || ' /u01/app/oracle' from v$datafile;
select 'cp ' || name || ' /u01/app/oracle' from v$tempfile;
select 'cp ' || member || ' /u01/app/oracle' from v$logfile;


system@XE> select 'cp ' || name || ' /u01/app/oracle' from v$controlfile;

'CP'||NAME||'/U01/APP/ORACLE'
--------------------------------------------------------------------------------
cp /u01/app/oracle/oradata/XE/control.dbf /u01/app/oracle

已选择 1 行。

system@XE> select 'cp ' || name || ' /u01/app/oracle' from v$datafile;

'CP'||NAME||'/U01/APP/ORACLE'
--------------------------------------------------------------------------------
cp /u01/app/oracle/oradata/XE/system.dbf /u01/app/oracle
cp /u01/app/oracle/oradata/XE/sysaux.dbf /u01/app/oracle
cp /u01/app/oracle/oradata/XE/undotbs1.dbf /u01/app/oracle
cp /u01/app/oracle/oradata/XE/users.dbf /u01/app/oracle
cp /u01/app/oracle/oradata/XE/T_SHAWN.dbf /u01/app/oracle
cp /u01/app/oracle/oradata/XE/rman01.dbf /u01/app/oracle

已选择6行。

system@XE> select 'cp ' || name || ' /u01/app/oracle' from v$tempfile;

'CP'||NAME||'/U01/APP/ORACLE'
--------------------------------------------------------------------------------
cp /u01/app/oracle/oradata/XE/temp.dbf /u01/app/oracle

已选择 1 行。

system@XE> select 'cp ' || member || ' /u01/app/oracle' from v$logfile;

'CP'||MEMBER||'/U01/APP/ORACLE'
--------------------------------------------------------------------------------
cp /u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_2_dv180t3r_.log /u01/ap
p/oracle

cp /u01/app/oracle/fast_recovery_area/XE/onlinelog/o1_mf_1_dv180s9d_.log /u01/ap
p/oracle


已选择2行。


/*
日志文件组
 */
SELECT GROUP#,SEQUENCE#,MEMBERS,archived,status FROM V$LOG;

GROUP#  SEQUENCE#	 MEMBERS ARC STATUS
---------- ---------- ---------- --- ----------------
1	    7	       1 NO  INACTIVE
2	    8	       1 NO  CURRENT

已选择2行。
