# Startup

## 数据库的启动过程分为三个阶段

- 启动实例：读取参数文件，分配SGA，启动后台进程
- 装载数据库：装载数据库是将数据库与已启动的实例相联系，打开控制文件。数据库装载后，数据库保持关闭状态。
- 打开数据库：此步骤使用数据库可以进行正常的操作的处理。主要是打开数据库文件和日志文件。 

## 数据库的启动顺序

- 启动Database Control
- 启动数据库侦听器 listener
```html
使用lsnctl
使用Database Control
作为一项Windows服务启动(Windowns)
```
- 启动数据库

[command-demo](../../scripts/mgmt/instance/inst_startup.sql)


SHUTDOWN => NOMOUNT **参数文件** => MOUNT **控制文件** => OPEN **日志文件和数据文件**


## 归档模式

[sql-demo-数据库名称](../../scripts/mgmt/arch/arch_db_name.sql)
