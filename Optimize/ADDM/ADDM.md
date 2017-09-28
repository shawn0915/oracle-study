# ADDM, Automatic Database Diagnostic Monitor, 自动化数据库诊断监视器


在收集快照时生成ADDM报告，也可以根据需要生成ADDM。默认方式下，报告的保存时间是30天。

## 顾问

- 内存顾问

如果将参数`STATISTICS_LEVEL`设置为BASIC，将禁用收集快照和运行顾问。
只有将参数`STATISTICS_LEVEL`设置为TYPICAL或ALL，才能启用顾问。

- SQL调整顾问, SQL Tuning Advisor

功能：分析统计信息/分析SQL/访问路径/分析结构

```oracle
DBMS_SQLTUNE
-- 针对SQL Tuning Set运行作业
DBMS_SQLTUNE.EXECUTE_TUNING_TASK
-- 针对单条SQL语句运行作业
DBMS_ADVISOR.QUICK_TUNE
```

- 自动撤销顾问
- 平均恢复时间顾问
- 数据恢复顾问
- 段顾问



## 自动维护作业

- 收集优化器统计信息
- 段顾问
- SQL调整顾问
