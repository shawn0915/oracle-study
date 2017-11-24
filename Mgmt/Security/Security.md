# Oracle Security

- [Role角色](#role)
- [User用户](#user)
- 权限
- [Profile概要文件](#profile)
- [Quota限额](#quota)
- [Audit审核](#audit)
- 组件

## Role

- DBA
- SYSDBA
  - SYSDBA具有SYSOPER的所有权限
- SYSOPER
- 自定义

> [create-role-demo](../../sql_scripts/mgmt/security/create_role.sql)

## User

- SYS
  - 基表、数据字典视图
  - Roles
    - DBA
    - SYSDBA
      - SQL*Plus
- SYSTEM
  - 存储管理信息或者提供各种Oracle工具和选项

[create-user-demo](../../sql_scripts/mgmt/security/create_user.sql)

> 用户验证方法

- 操作系统身份验证
- 口令文件身份验证
- 口令身份验证
- 外部身份验证
- 全局身份验证

## 安全权限

- 系统权限

[sql-demo-grant](../../sql_scripts/mgmt/security/create_role.sql)

系统权限的撤销不会级联(这与撤销对象权限不同)。

`ANY`权限针对数据库中的所有相关对象给予权限，删除了用户表上的所有保护。
```oracle
GRANT select any TABLE to scott;
```

- 对象权限

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




## PROFILE

概要文件包含一组约束条件和配置项，它们可以限制允许用户使用的资源。
在创建概要文件后，DBA可以手工将其赋予每个用户。
但并不能立刻生效，要将初始化参数文件中的参数`RESOURCE_LIMIT`设置为`TRUE`后，概要文件才会生效。

```oracle
CREATE PROFILE NEWProfile LIMIT
SESSIONS_PER_USER 	2
 CPU_PER_SESSION	10000
 CPU_PER_CALL		DEFAULT
```

将概要文件授予用户，使用如下命令：
```oracle
ALTER USER <用户名> PROFILE <概要文件>
```

## Quota

[SQL-Demo](../../sql_scripts/mgmt/security/security.sql)


## Audit

标准数据库审核

- 审核`SYSDBA`活动
- 数据库审核`SYS.AUD$`
- 使用触发器执行基于值的审核
- 细粒度审核(FGA)


## 组件

> Oracle Database Vault

- 规则
- 领域

REF:

- [使用 Oracle Database Vault 限制命令执行](http://www.oracle.com/technetwork/cn/tutorials/datavault2-094383-zhs.html)


Oracle Label Security

Transparent Data Encyption




> 定义者/调用者



> 实施 Oracle 数据库安全性

- 测试`sys`用户以普通用户身份登录
- 测试远程数据库验证参数
- 审计语法及相关参数
- 标准数据库审计
- 基于值审计
- 细粒度审计
- 审计相关视图


> 数据库安全性

- 透明数据加密(TDE)
- 数据泵加密 (DP)
- 外部表加密
- RMAN 加密
