
-- 检查数据库组件是否为 VALID
SELECT
  substr(comp_name, 1, 40) comp_name,
  status,
  substr(version, 1, 10),
  version
FROM dba_registry
ORDER BY comp_name;


select * from v$option;

