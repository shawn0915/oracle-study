# INSERT

`INSERT`命令可以插入一行(在命令中指定列值)，或者插入由`SELECT`语句创建的行集合。

所有指定为子查询的`SELECT`语句，都可用作传递到`INSERT`的行的来源，这就允许插入许多行。
另外，使用`VALUES`子句会插入一行，这些值可以是字面值或者作为替换变量的提示。

`INSERT`可以使用一条语句将多行插入多个表。
[SQL-DEMO-InsertAll](../../scripts/dev/sql_statements/sql_dml_insertAll.sql)