# Oracle Network

## 本地命名

- [LISTENER.ORA](../sql_demo/config/listener.ora)
- [TNSNAMES.ORA](../sql_demo/config/tnsnames.ora)
- SQLNET.ORA
- LDAP.ORA

## 配置Oralce网络环境

- 网络服务
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