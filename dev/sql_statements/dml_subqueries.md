# Subqueries
子查询

[SQL-DEMO-Subqueries](../../scripts/dev/sql_statements/sql_dml_subqueries.sql)

- 查询条件中的子查询
- 建表语句中的子查询
- 插入语句中的子查询
- 更新语句中的子查询
- ANY/SOME、ALL
- 子查询中NULL值问题(NOT IN(NULL))

## 子查询的位置

- 在用于列投影的`SELECT`列表中
- 在`FROM`子句中
- 在`WHERE`子句中
- 在`HAVING`子句中

在FROM子句中，子查询可以嵌套到无限极，但在WHERE子句中只能嵌套到255级。
可以在SELECT列表中使用子查询，也可以在查询的FROM、WHERE和HAVING子句中使用子查询。

子查询可以用来选择要插入的行，但它们不在INSERT语句的VALUES子句中。

## 子查询的类型

- 单行子查询
- 多行子查询
- 关联子查询

## 高级子查询

- 使用子查询
- 成对对比子查询
- 非成对对比子查询
- EXISTS
- NOT EXISTS