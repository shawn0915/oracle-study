# Optimize

## 数据库实例调优

- [AWR](AWR/AWR.md)
- [ADDM](ADDM/ADDM.md)
- [ASH](ASH/ASH.md)
- [SQL Profile](SQL_Profile/Readme.md)
- [SQL Monitor](SQL_Monitor/Readme.md)
- DBMS_SQLTUNE
- sqltrpt
- [报警和阈值](#报警和阈值)

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


## 系统调优

## SQL优化

- [表连接](../Dev/join/join.md)
- 思路
  - 简化
  - 统计信息
  - 索引
  - 并行
- Hint
```oracle
/*+ Hints */
```


