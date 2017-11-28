# Automatic Workload Repository (AWR) 自动化工作负荷仓库

- [SQL-DEMO-AWR](../../scripts/opt/awr-system.sql)

## 简介

- 10g新特性
- 企业版工具

AWR作为SYSAUX表空间中的一组表和其他对象而存在。

MMON进程将AWR统计信息作为快照保存到AWR中，默认方式是每60分钟保存一次。默认情况下，在重写前，快照会存储8天。

`dbms_workload_repository`

## 常用功能

- Snapshot的管理
- 基线的设置
- 所需空间开销和设置
- AWR数据的迁移
- 生成AWR报告
- AWR相关的视图和基表


> 实例AWR报告

- [AWR报告-sid5008](awr-sid5008.html)



====


- 异步COMMIT
