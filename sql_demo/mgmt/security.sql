
# quota

SELECT
  tablespace_name,
  bytes,
  max_bytes
FROM dba_ts_quotas;

USERS	1638400	-1
SYSAUX	458752	-1

# 外部身份验证
SELECT value
FROM v$parameter
WHERE name = 'os_authent_prefix';

ops$

-- 使用外部身份验证创建用户账户
CREATE USER ops$shawn
  IDENTIFIED externally;
GRANT CREATE SESSION TO ops$shawn;

-- windows必须大写
CREATE USER "OPS$SHAWN"
  IDENTIFIED externally;




