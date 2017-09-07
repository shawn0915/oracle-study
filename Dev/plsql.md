# PL/SQL DEVELOPER

- [demo-sql](../sql_demo/plsql/plsql.sql)

> 数据类型

- 标量类型
  - 数字类型 NUMBER
  - 字符/字符串类型 VARCHAR2
  - 布尔类型 BOOLEAN
  - 日期/时间类型 DATE/TIMESTAMP
- LOB类型
  - BLOB
  - CLOB
  - NCLOB
  - BFILE
- 复合类型
- 引用类型
  - %TYPE - 引用变量和数据库列的数据类型
  - %ROWTYPE - 提供表示表中一行的记录类型


> 动态SQL

PL/SQL中不允许直接使用DDL语句。
动态SQL语句是指在SQL/SQL块编译时，编译程序对动态语句部分不进行处理，
只在程序运行时动态地创建语句、对语句进行语法分析并执行该语句。

语法：
```oracle
execute immediate '动态sql语句'
```
