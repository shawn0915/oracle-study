

### ServiceNames

ONCA可以配置网络监听和本地网络服务名


### 解析名称

- Easy Connect
- 本地命名
- 目录命名
- 外部命名

> Easy Connect

只能使用TCP协议

[sql-demo](../../scripts/mgmt/login/login.sql)

> 本地命名

- [LISTENER.ORA](../../scripts/mgmt/network/listener.ora)  -- 服务器端文件
- Local Naming Parameters (tnsnames.ora)  -- 客户端文件
  - [tnsnames.ora](../../scripts/mgmt/network/tnsnames.ora)
- SQLNET.ORA  -- 服务器端/客户端文件  -- 可选
- LDAP.ORA


文件路径：
```bash
%ORACLE_HOME%/network/admin/listener.ora
%ORACLE_HOME%/network/admin/tnsnames.ora 
```

SQLNET.ORA 文件路径：
```bash
%ORACLE_HOME%/network/admin
```
或位于`TNS_ADMIN`变量指向的目录


> 目录命名

LDAP, Lightweight Directory Protocol, 轻量级目录访问协议



### 共享服务器体系

两个关键参数

```oracle
alter system set DISPATCHERS = '(dispatchers=2)(protoctl=tcp)' scope = memory;
alter system set SHARED_SERVERS = 20;
```

最适合管理许多完成短期事务的会话。


