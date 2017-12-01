# Data Manipulation Language (DML)
数据操作语言

- [SELECT](dml_select.md)
- [INSERT](dml_insert.md)
- [UPDATE](dml_update.md)
- DELETE
- [MERGE](../../scripts/dev/sql_statements/sql_dml_merge.sql)
- EXPLAIN PLAN
- [LOCK TABLE](dml_lock.md)
- [Subqueries](dml_subqueries.md)


修改后的数据被写至表与索引段的数据段，而原有的数据则被写至撤销段的数据块。

面向集合。

执行DML语句的步骤：
1. 在数据库**缓冲区缓存**中搜索相关的块
2. 将块从数据文件复制到缓冲区
3. 将变更向量写入日志缓冲区
4. 将变更向量应用于数据库缓冲区缓存

## 操纵数据

- 向表中插入一条记录 insert
- 从另一个表复制行 insert select
- 更新表中的行 update
- 使用子查询更新两列
- 从表中删除行 delete
- 删除基于另一个表的行
- INSERT ALL
- MERGE
- DEFAULT 应用
- 保存点 savepoint

## DML语句失败

- 语法问题
- 引用不存在的对象或列
- 访问权限
- 约束违背
- 空间问题
