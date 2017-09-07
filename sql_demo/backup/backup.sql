/*
导出语法：
EXP  用户名/密码@oracle服务名  file=导出文件名 参数列表
导出语法：
IMP  用户名/密码@oracle服务名  file=导出文件名 参数列表
 */

exp user/pwd file=user.dmp buffer=1024000 log=user.log statistics=none indexes=y constraints=y grants=n rows=n;

/*
数据泵导出导入
 */

-- DATA_PUMP_DIR => /u01/app/oracle/admin/XE/dpdump

expdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;
impdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;


-- 最新的文件列表
SELECT name
FROM v$datafile
UNION
SELECT name
FROM v$controlfile
UNION
SELECT member
FROM v$logfile;


/*
恢复到指定时间点
 */

startup  mount;  -- mount方式启动数据库

alter session set nls_date_format='yyyy-MM-dd  HH24:MI:SS';    -- 修改会话的日期格式

recover  database until time '2011-12-08 19:35:00'  -- 恢复到指明的时间点

alter  database  open resetlogs;  -- 使用resetlogs打开数据库