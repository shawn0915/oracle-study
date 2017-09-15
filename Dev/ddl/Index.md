# Index

[SQL-DEMO-Index](../../sql_demo/ddl/index.sql)

> 功能

- 强制实施主键约束和唯一约束
- 提高性能

> 索引类型

- B*Tree
  - B => balance
- 位图索引
  - rowid

> 索引类型选项

- 唯一或非唯一 unique or non-unique index
- 反向键索引 reverse key
- 压缩 compressed
- 复合 composite
  - 可用于位图索引
- 基于函数的索引 function based
  - 可用于位图索引
  - 8i
- 升序或降序 ascending or descending
  - 可用于位图索引
- 不可见索引,invisible index
  - 11g新特性
  - 让优化器在一段时间内忽略索引
- nosegment index 虚拟索引
