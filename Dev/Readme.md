# DEV

- [DDL](#ddl)
- [DML](#dml)
- [PL/SQL](#pl/sql)
- [SQL查询限制排序](#sql查询限制排序)
- [单行函数](#单行函数)
- [多行函数](#多行函数)
- [sql联接](#sql联接)
- [SubQuery子查询](#subquery子查询)
- [集合运算符](#集合运算符)


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


## SQL查询限制排序

- [select](select/Select.md)
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

[SQL-DEMO-Order](../sql_scripts/dev/sql_select/order.sql)


### and符号替换

[SQL-DEMO-and-replace](../sql_scripts/dev/sql_select/and-replace.sql)

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


## SubQuery子查询

[SQL-DEMO-SubQuery](../sql_scripts/dev/sql_select/sub_select.sql)

- 查询条件中的子查询
- 建表语句中的子查询
- 插入语句中的子查询
- 更新语句中的子查询
- ANY/SOME、ALL
- 子查询中NULL值问题(NOT IN(NULL))

> 子查询的位置

- 在用于列投影的`SELECT`列表中
- 在`FROM`子句中
- 在`WHERE`子句中
- 在`HAVING`子句中

在FROM子句中，子查询可以嵌套到无限极，但在WHERE子句中只能嵌套到255级。
可以在SELECT列表中使用子查询，也可以在查询的FROM、WHERE和HAVING子句中使用子查询。

子查询可以用来选择要插入的行，但它们不在INSERT语句的VALUES子句中。

> 子查询的类型

- 单行子查询
- 多行子查询
- 关联子查询

> 高级子查询

- 使用子查询
- 成对对比子查询
- 非成对对比子查询
- EXISTS
- NOT EXISTS


## 集合运算符

[SQL-DEMO-Union](../sql_scripts/dev/union/union.sql)

### Oracle集合运算符

```oracle
-- 合集
UNION
UNION ALL

-- 交集
INTERSECT

-- 差集
MINUS
```

> union/union all

组成复合查询的查询中的列可以有不同的名称，但输出结果集使用第一个查询中列的名称。
组成复合查询的查询中的相关列必须是相同的数据类型组。

复合查询会默认返回按所有列排序(从左到右)的行，唯一例外的是UNION ALL，在这种情况下不会对行进行排序。
唯一允许使用ORDER BY子句的位置是在复合查询的结尾。

UNION ALL会按自然的顺序返回每个查询的分组行。在结尾添加一个ORDER BY子句可以改变这种行为。

> union 和 union all 的区别

- union 去掉重复记录, union all 不去重
- union 排序, union all 不排序




=================================================================================



# cursor

- 静态游标
  - 隐式游标
  - 显式游标
- REF游标

[SQL-DEMO-Cursor](../sql_scripts/dev/cursor.sql)


> 创建和管理表


- `CREATE`创建表
- 日期数据类型
- 用子查询语法创建表
- 修改表
- 字段UNUSED
- `DROP`删除表
- 改变对象的名字
- `TRUNCATE`截断表



> 分级取回数据

```oracle
分级取数据示例
巧用 connect by
```
