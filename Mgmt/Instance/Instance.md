# Instance 实例管理

## 数据库初始化参数

pfile/spfile

[SQL-Demo-pfile](../../sql_demo/mgmt/inst_pfile.sql)


## [启动数据库](Startup.md)


## 警报日志

[SQL-Demo-alter](../../sql_demo/mgmt/inst_alter.sql)

## [关闭数据库](Shutdown.md)


## 数据字典

元数据

```oracle
DBA_
ALL_
USER_
```

常用的数据字典视图
```oracle
DBA_OBJECTS  -- 数据库中每个对象的行
DBA_DATA_FILES  -- 描述每个数据文件的行
DBA_USERS  -- 描述每个用户的行
DBA_TABLES  -- 描述每个表的行
DBA_ALTER_HISTORY  -- 描述过去的警报条件的行
```

数据字典视图只能在`OPEN`模式下查看

[SQL-Demo](../../sql_demo/mgmt/inst_datadic.sql)

## 动态性能视图 Vee dollar

来自实例或控制文件的信息

```oracle
V$INSTANCE
V$SESSION
```

