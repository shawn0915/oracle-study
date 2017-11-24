/*
静态参数和动态参数及初始化参数文件
 */
-- 显示当前运行的实例中生效的参数值
SELECT
  name,
  VALUE
FROM v$parameter
ORDER BY name;

compatible	11.2.0.0.0
control_file_record_keep_time	7
control_files	/u01/app/oracle/oradata/XE/control.dbf
control_management_pack_access	NONE
core_dump_dest	/u01/app/oracle/diag/rdbms/xe/XE/cdump

-- 显示磁盘上spfile中存储的值
SELECT
  name,
  VALUE
FROM v$spparameter
ORDER BY name;

compatible	11.2.0.0.0
control_file_record_keep_time
control_files	/u01/app/oracle/oradata/XE/control.dbf
control_management_pack_access
core_dump_dest

/*
基本参数

差异：某些参数更改已经应用于实例，但尚未应用于spfile(反之亦然)
 */
SELECT
  name,
  VALUE,
  isdefault
FROM v$parameter
WHERE isbasic = 'TRUE'
ORDER BY name;

cluster_database	FALSE	TRUE
compatible	11.2.0.0.0	FALSE
control_files	/u01/app/oracle/oradata/XE/control.dbf	FALSE
db_block_size	8192	TRUE
db_create_file_dest		TRUE
db_create_online_log_dest_1		TRUE
db_create_online_log_dest_2		TRUE
db_domain		TRUE
db_name	XE	FALSE
db_recovery_file_dest	/u01/app/oracle/fast_recovery_area	FALSE
db_recovery_file_dest_size	10737418240	FALSE
db_unique_name	XE	TRUE
instance_number	0	TRUE
ldap_directory_sysauth	no	TRUE
log_archive_dest_1		TRUE
log_archive_dest_2		TRUE
log_archive_dest_state_1	enable	TRUE
log_archive_dest_state_2	enable	TRUE
nls_language	AMERICAN	TRUE
nls_territory	AMERICA	TRUE
open_cursors	300	FALSE
pga_aggregate_target	0	TRUE
processes	100	TRUE
remote_listener		TRUE
remote_login_passwordfile	EXCLUSIVE	FALSE
sessions	172	FALSE
sga_target	0	TRUE
shared_servers	4	FALSE
star_transformation_enabled	FALSE	TRUE
undo_tablespace	UNDOTBS1	FALSE




SELECT
  s.name,
  s.value
FROM v$spparameter s
  JOIN v$parameter p ON s.name = p.name
WHERE p.isbasic = 'TRUE'
ORDER BY name;

cluster_database
compatible	11.2.0.0.0
control_files	/u01/app/oracle/oradata/XE/control.dbf
db_block_size
db_create_file_dest
db_create_online_log_dest_1
db_create_online_log_dest_2
db_domain
db_name	XE
db_recovery_file_dest	/u01/app/oracle/fast_recovery_area
db_recovery_file_dest_size	10737418240
db_unique_name
instance_number
ldap_directory_sysauth
log_archive_dest_1
log_archive_dest_2
log_archive_dest_state_1
log_archive_dest_state_2
nls_language
nls_territory
open_cursors	300
pga_aggregate_target
processes
remote_listener
remote_login_passwordfile	EXCLUSIVE
sessions	20
sga_target
shared_servers	4
star_transformation_enabled
undo_tablespace	UNDOTBS1


/*
修改静态参数

scope=spfile
新值只有在重启实例后才生效
 */
ALTER system SET processes=200 scope=spfile;

# alter system set processes=200;
# alter session set processes=200;




