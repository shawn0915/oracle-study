/*
Data Dictionary
 */
SELECT
  object_name,
  owner,
  object_type
FROM dba_objects
WHERE object_name = 'DBA_OBJECTS';

DBA_OBJECTS	SYS	VIEW
DBA_OBJECTS	PUBLIC	SYNONYM


/*
动态性能视图

使用动态性能视图来确定哪些数据文件和表空间构成了数据库
 */
SELECT
  t.name,
  d.name,
  d.bytes / 1024 / 1024
FROM v$tablespace t
  JOIN v$datafile d ON t.ts# = d.ts#
ORDER BY t.name;

SYSAUX	/u01/app/oracle/oradata/XE/sysaux.dbf	650
SYSTEM	/u01/app/oracle/oradata/XE/system.dbf	360
T_SHAWN	/u01/app/oracle/oradata/XE/T_SHAWN.dbf	200
UNDOTBS1	/u01/app/oracle/oradata/XE/undotbs1.dbf	25
USERS	/u01/app/oracle/oradata/XE/users.dbf	100


SELECT *
FROM V$INSTANCE;

SELECT *
FROM V$SESSION;