# Oracle Security

- 角色
- 用户
- 权限
- 概要文件
- 限额

## 角色

- DBA
- SYSDBA
  - SYSDBA具有SYSOPER的所有权限
- SYSOPER
- 自定义

> [create-role-demo](../sql_demo/mgmt/create_role.sql)

## 用户

- SYS
  - 基表、数据字典视图
  - Roles
    - DBA
    - SYSDBA
      - SQL*Plus
- SYSTEM
  - 存储管理信息或者提供各种Oracle工具和选项

> [create-user-demo](../sql_demo/mgmt/create_user.sql)

## 安全权限

- 系统权限
- 对象权限

## 概要文件 PROFILE

概要文件包含一组约束条件和配置项，它们可以限制允许用户使用的资源。
在创建概要文件后，DBA可以手工将其赋予每个用户。
但并不能立刻生效，要将初始化参数文件中的参数```RESOURCE_LIMIT```设置为TRUE后，概要文件才会生效

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

## 限额



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

- 测试sys用户以普通用户身份登录
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
