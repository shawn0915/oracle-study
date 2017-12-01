# Indexes

[SQL-DEMO-Index](../../scripts/dev/data_structures/indexes.sql)

## 功能

- 强制实施主键约束和唯一约束
- 提高性能

## Types

- B-tree indexes
  - B => balance
  - B-Tree索引不包括NULL
- Bitmap and bitmap join indexes
  - rowid
  - 位图索引包括NULL
- Function-based indexes
- Application domain indexes

## Index Characteristics
索引类型选项

- 唯一或非唯一 unique or non-unique index
- 反向键索引 reverse key
- 压缩 compressed
- 复合 composite
  - 可用于位图索引
- 基于函数的索引 function based
  - 可用于位图索引
  - 8i新特性
- 升序或降序 ascending or descending
  - 可用于位图索引
- 不可见索引,invisible index
  - 11g新特性
  - 让优化器在一段时间内忽略索引
- nosegment index 虚拟索引

## Others

索引有自己的名称空间。


## Reference

- [Types of Indexes](https://docs.oracle.com/cd/E11882_01/server.112/e40540/indexiot.htm#CNCPT1170)