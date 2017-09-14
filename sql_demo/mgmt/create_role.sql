-- 创建角色并赋予权限

-- 创建角色
CREATE ROLE ROLE_SHAWN;
Role created.


-- 为角色赋予权限
GRANT CREATE TABLE, CREATE VIEW
TO ROLE_SHAWN;
Grant succeeded.


-- 将角色赋予用户
GRANT ROLE_SHAWN TO DEHAAN, KOCHHAR;
Grant succeeded.


-- 查看系统所有角色
SELECT * from dba_roles;

CONNECT	NO	NONE
RESOURCE	NO	NONE
DBA	NO	NONE


-- 查看角色包含的权限
SELECT * FROM role_sys_privs WHERE role='DBA';
SELECT * FROM role_sys_privs WHERE role='ROLE_SHAWN';