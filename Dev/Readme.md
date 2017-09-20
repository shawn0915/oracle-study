# DEV

- [DDL](#ddl)
- [DML](#dml)
- [PL/SQL](#pl/sql)
- [单行函数](#单行函数)
- [多行函数](#多行函数)

## DDL

DDL, Data Definition Language, 数据定义语言

CREATE/ALTER/DROP/TRUNCATE

- [Object](ddl/Object.md)
- [Data Type](ddl/DataType.md)
- [Table](ddl/Table.md)
- [Index](ddl/Index.md)
- [Constraints](ddl/Constraints.md)
- [View](ddl/View.md)
- [Sequence](ddl/Sequence.md)
- [Synonym](ddl/Synonym.md)


## DML

DML, Data Manipulation Language, 数据操作语言

SELECT/INSERT/UPDATE/DELETE/MERGE

- [dml](dml/dml.md)
- [Transaction](dml/Transaction.md)
- [Lock](dml/Lock.md)
- [undo](dml/undo.md)


## PL/SQL

PL/SQL是Oracle专有的、在数据库内运行的第三代语言。

- [plsql](plsql/plsql.md)


## SQL Select, Where, Sort

- [select](sql_select/select.md)
- [where](#where)
- [order](#order)
- [&符号替换](#and符号替换)

### where

条件子句使用比较运算符比较两个选项。重要的是理解这两项的数据类型，如果有必要，可以将它们包含在单引号内。

```oracle
where
=
!=
between
in
like
```

### order

[SQL-DEMO-Order](../sql_demo/dev/sql_select/order.sql)


### and符号替换

[SQL-DEMO-and-replace](../sql_demo/dev/sql_select/and-replace.sql)

```oracle
&
&&
```

## 单行函数

=> [单行函数](function/Function.md)

## 多行函数

=> [多行函数](function/Function_multi.md)

- 聚合函数
- 分组函数


## sql联接

=> [sql联接](join/join.md)





=================================================================================



- [cursor](cursor.md)




> 多表查询

- [join](join/join.md)
- [sql-demo](../sql_demo/dev/sql_select/multi_table_select.sql)





> 子查询


- 查询条件中的子查询
- 建表语句中的子查询
- 插入语句中的子查询
- 更新语句中的子查询
- ANY/SOME、ALL
- 子查询中空值问题

[SQL-DEMO-SubSelect](../sql_demo/dev/sql_select/sub_select.sql)

> 高级子查询

```oracle
使用子查询
成对对比子查询
非成对对比子查询
EXISTS
NOT EXISTS
```

> 创建和管理表


- `CREATE`创建表
- 日期数据类型
- 用子查询语法创建表
- 修改表
- 字段UNUSED
- `DROP`删除表
- 改变对象的名字
- `TRUNCATE`截断表


> 使用集合运算

```oracle
-- 合集
UNION
UNION ALL
/*
union 和 union all 的区别
- union 去掉重复记录, union all 不去重
- union 排序, union all 不排序
 */
 
-- 交集
INTERSECT

-- 差集
MINUS
```

[SQL-DEMO-Union](../sql_demo/dev/base/06_union.sql)





> 分级取回数据

```oracle
分级取数据示例
巧用 connect by
```
