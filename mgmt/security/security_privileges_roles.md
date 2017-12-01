# Privileges and roles

- DBA
- SYSDBA
  - SYSDBA具有SYSOPER的所有权限
- SYSOPER
- 自定义


[SQL-Demo-roles](../../scripts/mgmt/security/security_roles.sql)


## 系统权限

系统权限的撤销不会级联(这与撤销对象权限不同)。

`ANY`权限针对数据库中的所有相关对象给予权限，删除了用户表上的所有保护。
```oracle
GRANT select any TABLE to scott;
```

## 对象权限

```oracle
SELECT 
INSERT 
UPDATE 
delete
ALTER 
execute
```

`ANY`权限针对数据库中的每个用户账户中的每个对象授权，是系统权限，而不是对象权限。

对象权限的撤销会级联。

