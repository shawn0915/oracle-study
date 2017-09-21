# Oracle Recovery Manager 恢复管理器(RMAN)

RMAN可以管理整个周期：将数据库从一级存储备份到二级存储，并将备份从二级存储迁移到三级存储。
可以将这样的系统实现为在故障之后能接近瞬间恢复，同时能在必要时及时恢复数据库。

[SQL-DEMO-RMAN](../../sql_demo/backup/rman.sql)

> 配置 Oracle Recovery Manager

```html
RMAN 常用命令
管理flash_recovery_area
创建RMANcatalog
控制文件自动备份
```

> 使用 Oracle Recovery Manager

```html
RMAN 交互方式
“干净”备份
备份
管理备份数据
启、停块跟踪
```

