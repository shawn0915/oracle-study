# dml

修改后的数据被写至表与索引段的数据段，而原有的数据则被写至撤销段的数据块。

面向集合。

## INSERT

`INSERT`命令可以插入一行(在命令中指定列值)，或者插入由`SELECT`语句创建的行集合。

所有指定为子查询的`SELECT`语句，都可用作传递到`INSERT`的行的来源，这就允许插入许多行。
另外，使用`VALUES`子句会插入一行，这些值可以是字面值或者作为替换变量的提示。

`INSERT`可以使用一条语句将多行插入多个表。
[SQL-DEMO-InsertAll](../../sql_demo/dml/insertAll.sql)

## UPDATE

一条`UPDATE`语句只能改变一个表中的行，但它可以改变那个表中任意数量的行。

用于`SET`列值的子查询必须是标量子查询，用来选择行的子查询也必须是标量子查询，除非他们使用`IN`谓词。

## DELETE


## TRUNCATE

由`INSERT`、`UPDATE`和`DELETE`(甚至`MERGE`)命令组成的事务可以变成永久(使用`COMMIT`)或者反转(使用`ROLLBACK`)。
`TRUNCATE`命令和其他所有DDL命令一样，立即让变更变成永久：绝对不能反转，无法回滚。

`TRUNCATE`完全清空表。这里没有行选择的概念，而`DELETE`命令却有这个概念。

## MERGE

[SQL-DEMO-MERGE](../../sql_demo/dml/insertAll.sql)

## DML语句失败

- 语法问题
- 引用不存在的对象或列
- 访问权限
- 约束违背
- 空间问题
