# Oracle Management

- [Install](Install/Install.md)
- [Instance实例管理](Instance/Instance.md)
- [Upgrade](Upgrade.md)
- [Network](Network/Network.md)
- [Security安全性](Security/Security.md)
- [Memory内存管理](../Architecture/Memory/Memory.md)
- [Progress后台进程](../Architecture/Progress/Progress.md)


> 管理方案对象

- schema 模式
- [data type 数据类型](../Dev/ddl/DataType.md)
- [constraints 约束条件状态](../Dev/ddl/Constraints.md)
- [table 表](../Dev/ddl/Table.md)

> 管理数据和并发处理

- [trigger 触发器](../Dev/plsql/Trigger.md)
- [lock 锁](../Dev/Lock.md)
- Nowait

> 管理还原数据

- 查看undo相关参数
- 切换表空间
- 设置undo数据保留期限及强制保留
- 读一致性

> 主动维护

- 收集统计信息
- AWR
- ⽣成ADDM
- Memory Advisor
- Segment Advisor
- SQL Access Advisor
- SQL Tuning Advisor

> 性能管理

- 硬解析测试
- ⽆效索引对性能的影响

> 管理资源

- 创建资源消耗组(简称资源组)
- 设置用户scott和hr的初始化资源组为TEST_GROUP
- 资源组映射,调整优先级
- 资源计划

> 使用调度程序自动执行任务

- 基于时间的job
- 创建Program
- 创建Schedule
- 使用program和schedule创建job
- 基于事件的job
- 作业链
