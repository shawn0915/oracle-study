# CONSTRAINTS 约束

如果违反约束，将自动回滚出现问题的语句，而不是语句中的单个操作，也不是整个事务。

[SQL-DEMO-Constrains](../../scripts/dev/ddl/constraints.sql)

## 约束类型

- `NOT NULL`, 非空
- `UNIQUE`, 唯一性
  - 需要索引。若不存在，则自动予以创建。
- `PRIMARY KEY`, 主键
  - 需要索引。若不存在，则自动予以创建。
- `FOREIGN KEY`, 外键
  - 在子表上定义，但父表必须存在`UNIQUE`或`PRIMARY KEY`约束。
- `CHECK`, 校验
  - `NOT NULL`约束实际上作为预配置`CHECK`约束实现。


## 约束状态

```oracle
ENABLE VALIDATE
DISABLE VALIDATE
ENABLE NOVALIDATE
DISABLE NOVALIDATE
```

默认方式下，将启用和验证约束，而且约束不可延迟。


## 约束的管理

- Not null 与性能相关的测试
- 外键的测试
- 延迟约束
