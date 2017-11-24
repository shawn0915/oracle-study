/*
AWR
 */

-- => Optimize => AWR

-- 检查数据库实例的启动时间

SELECT to_char(startup_time, 'yyyy-mm-dd hh24:mi:ss') STARTUP_TIME
FROM gv$instance;


-- 生成AWR报告

-- 最常见的生成AWR报告的方式
@?/rdbms/admin/awrrpt.sql
-- 生成AWR报告中指定SQL_ID的执行计划
@?/rdbms/admin/awrsqrpt.sql
-- 比较两个AWR报告
@?/rdbms/admin/awrddrpt.sql
-- 适用于RAC环境等
@?/rdbms/admin/awrrpti.sql


/*
dbms_workload_repository
 */
-- 生成即席AWR快照
system@XE> execute dbms_workload_repository.create_snapshot;

PL/SQL 过程已成功完成。

-- 生成报告
SELECT
  snap_id,
  begin_interval_time
FROM dba_hist_snapshot
ORDER BY begin_interval_time DESC

120	2017-09-27 16:00:53.372
119	2017-09-27 15:00:34.678
118	2017-09-27 14:00:55.130
117	2017-09-27 13:00:09.628
116	2017-09-27 12:00:39.083
115	2017-09-27 11:00:02.576
