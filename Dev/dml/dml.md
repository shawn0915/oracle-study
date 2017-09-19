# DML

修改后的数据被写至表与索引段的数据段，而原有的数据则被写至撤销段的数据块。

面向集合。

执行DML语句的步骤：
1. 在数据库**缓冲区缓存**中搜索相关的块
2. 将块从数据文件复制到缓冲区
3. 将变更向量写入日志缓冲区
4. 将变更向量应用于数据库缓冲区缓存

> 操纵数据

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

## INSERT

`INSERT`命令可以插入一行(在命令中指定列值)，或者插入由`SELECT`语句创建的行集合。

所有指定为子查询的`SELECT`语句，都可用作传递到`INSERT`的行的来源，这就允许插入许多行。
另外，使用`VALUES`子句会插入一行，这些值可以是字面值或者作为替换变量的提示。

`INSERT`可以使用一条语句将多行插入多个表。
[SQL-DEMO-InsertAll](../../sql_demo/dev/dml/insertAll.sql)

## UPDATE

一条`UPDATE`语句只能改变一个表中的行，但它可以改变那个表中任意数量的行。

用于`SET`列值的子查询必须是标量子查询，用来选择行的子查询也必须是标量子查询，除非他们使用`IN`谓词。

## DELETE


## TRUNCATE

由`INSERT`、`UPDATE`和`DELETE`(甚至`MERGE`)命令组成的事务可以变成永久(使用`COMMIT`)或者反转(使用`ROLLBACK`)。
`TRUNCATE`命令和其他所有DDL命令一样，立即让变更变成永久：绝对不能反转，无法回滚。

`TRUNCATE`完全清空表。这里没有行选择的概念，而`DELETE`命令却有这个概念。

## MERGE

[SQL-DEMO-MERGE](../../sql_demo/dev/dml/merge.sql)

## DML语句失败

- 语法问题
- 引用不存在的对象或列
- 访问权限
- 约束违背
- 空间问题
