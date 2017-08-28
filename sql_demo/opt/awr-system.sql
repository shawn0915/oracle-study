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

