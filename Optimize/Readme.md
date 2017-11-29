# Optimize

## 数据库实例调优

- [AWR](AWR/AWR.md)
- [ADDM](ADDM/ADDM.md)
- [ASH](ASH/ASH.md)
- [SQL Profile](SQL_Profile/Readme.md)
- [SQL Monitor](../monitor/Monitor.md)
- sqltrpt
- [报警和阈值](#报警和阈值)
- [Database Replay](#database_replay)

### 报警和阈值

- 必须使用阈值配置有状态报警。
- 如果引发了有状态报警，那么在消除此情形前，它将一直保留，删除后进入临时视图。无状态报警会予以报告，并直接进入历史视图，但不需要清理。
- 阈值存储在AWR中。
- MMON后台进程通常引发警报，而EM通常会报告警报。

```oracle
-- 报警视图
DBA_OUTSTANDING_ALTERS
-- 报警历史视图
DBA_ALTER_HISTORY
```

### Database_Replay

主要步骤：

1. 捕获工作负荷
2. 预处理工作负荷
3. 重放工作负荷
4. 分析和报告

`DBMS_WORKLOAD_REPLAY`

记录的每个客户端请求包含SQL文本、绑定值和事务信息(包括时间戳)。

无论目标环境有多少，也无论在目标系统上重放多少次，都只需要对捕获的重放信息执行一次处理。

捕获的数据库客户端操作：
- 分布式事务
- CREATE TABLE 语句
- 在捕获开始前启动的事务

## 系统调优



## SQL优化

- [表连接](../dev/join/join.md)
- 思路
  - 简化
  - 统计信息
  - 索引
  - 并行
- Hint
```oracle
/*+ Hints */
```


