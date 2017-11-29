# SQL Select

投影projection、选择、联接这三个概念是SELECT语句功能的基础。

## 编写基本的 SQL SELECT 语句

- `SELECT`基本语法
- 查询当前用户所有用的表和视图
- 查看表的结构定义
- 查看表中所有数据
- 查看表中指定列的数据
- 显示某列唯一值
- SQL 语句中的加、减、乘、除
- NULL 的检索
- NULL 的计算
- SQL 连接符与单引号的使用
- Aslias 字段别名
- ||(连接符)应用
- `distinct` 删除重复值

## 演示模式 human_resources

HR实体-关系图

![HR_E-R](../img/HR_E-R.png)

# where

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

[SQL-DEMO-Order](../scripts/dev/sql_select/order.sql)


### and符号替换

[SQL-DEMO-and-replace](../scripts/dev/sql_select/and-replace.sql)

```oracle
&
&&
```