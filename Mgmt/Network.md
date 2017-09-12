# Oracle Network

## 本地命名

- [LISTENER.ORA](../sql_demo/config/listener.ora)
- [TNSNAMES.ORA](../sql_demo/config/tnsnames.ora)
- SQLNET.ORA
- LDAP.ORA

```bash
%oracle_base%\product\11.2.0\dbhome_1\NETWORK\ADMIN\listener.ora
%oracle_base%\product\11.2.0\dbhome_1\NETWORK\ADMIN\tnsnames.ora 

```

## 配置Oralce网络环境

- 网络服务
```oracle
-- 实例
OracleServiceSID
-- 监听
OracleOraHOME_NAMETNSListener
```
- 监听
- 修改service_names
- 专用模式、共享模式

> 使用LSNRCTL命令启动和停止监听器

语法如下：
```oracle
lsnrctl START|STOP <监听器名称>
```

在listener.ora中查看到已经定义的监听器名称。默认监听器的名称为LISTENER.
关闭监听器LISTENER命令：
```oracle
lsnrctl STOP LISTENER
```

> ONCA可以配置网络监听和本地网络服务名


## 网络管理

- Oracle Net Manager
- Oracle Net Configuration Assistant
