/*
ALTER USER  用户名
IDENTIFIED BY  密码
[DEFAULT  TABLESPACE 默认表空间]
[TEMPORARY  TABLESPACE 临时表空间]
[QUOTA  数字M  ON  表空间名]

*/

-- 修改密码
ALTER USER SHAWN IDENTIFIED BY abc123
/

-- 密码过期
ALTER USER SHAWN PASSWORD EXPIRE
/

-- 修改默认表空间
ALTER USER SHAWN DEFAULT TABLESPACE T_SHAWN_NEW
/

-- 修改表空间配额
ALTER USER SHAWN QUOTA unlimited ON USERS
/

-- 锁定用户
ALTER USER SHAWN ACCOUNT LOCK
/
-- 解锁用户
ALTER USER SHAWN ACCOUNT UNLOCK
/

-- 解锁改密码

/*
管理员登录
1. sqlplus sys/你的密码 as sysdba
2. sqlplus / as sysdba
SQL>

解锁
SQL>alter user scott account unlock;

*/

-- 修改密码
-- alter user scott identified by 新密码;
ALTER USER scott
IDENTIFIED BY lion;



