# Oracle Backup

> 方式

- 数据库整体备份
- 表空间备份
- 数据文件备份
- 控制文件备份
- 文档日志备份

> 备份/恢复工具

- exp/imp
- expdp/impdp
- exp+pipe

> 灾备

- [恢复管理器(RMAN)](RMAN/RMAN.md)
- [Data Guard](Data Guard/Readme.md)
- [Flashback Database](Flashback/Flashback.md)
- [Datapump](DataPump/DataPump.md)

> 数据迁移

- [DataTrans](DataTrans/Readme.md)

> 备份和恢复的概念

```oracle
增加控制文件
重做日志
设置归档模式
```

> 执行数据库备份

```oracle
RMAN 简单配置
RMAN 全库备份
备份控制文件
```


> 执行数据库恢复

```oracle
控制文件版本不一致的错误
丢失一个控制文件的错误
恢复redo成员
rman 恢复 system 表空间
归档模式恢复非关键数据文件
```

> 恢复非关键性丢失

```oracle
丢失临时表空间数据文件
丢失非当前日志组
丢失所有日志组
丢失当前日志组成员
索引表空间丢失
重建口令文件
丢失密码文件
```

> 数据库恢复

```oracle
完全恢复
不完全恢复
全部文件丢失利用rman全备的恢复
利用trace文件恢复控制文件
只读表空间恢复
```
