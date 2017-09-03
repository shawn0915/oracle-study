-- 创建角色并赋予权限

-- 创建角色
CREATE ROLE manager;
Role created.


-- 为角色赋予权限
GRANT create table, create view
TO manager;
Grant succeeded.


-- 将角色赋予用户
GRANT manager TO DEHAAN, KOCHHAR;
Grant succeeded.