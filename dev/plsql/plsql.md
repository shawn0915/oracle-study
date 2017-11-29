# Procedural Language/SQL (PL/SQL)

[SQL-DEMO-plsql](../../scripts/dev/plsql/plsql.sql)

PL/SQL是Oracle专有的、在数据库内运行的第三代语言。
无论PL/SQL存储在何处，都始终在数据库中执行。Java可以运行在数据库中，也可以运行在客户机上。

## 对象

6种常用的对象类型

- [Subprogram-procedure过程](#subprogram)
- [Subprogram-function函数](#subprogram)
- [Package程序包](#package)
- 程序包主体
- [Trigger触发器](Trigger.md)
- 类型主体


## 数据类型

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


## 动态SQL

PL/SQL中不允许直接使用DDL语句。
动态SQL语句是指在SQL/SQL块编译时，编译程序对动态语句部分不进行处理，
只在程序运行时动态地创建语句、对语句进行语法分析并执行该语句。

语法：
```oracle
execute immediate '动态sql语句'
```


## Exception

- 预定义异常
- 用户定义异常

=> [sql-demo](../../scripts/dev/plsql/exception.sql)


## Subprogram

子程序

> 组成部分

- 声明部分
- 可执行部分
- 异常处理部分(可选)

> 分类

- PROCEDURE 过程 [sql-demo](../../scripts/dev/plsql/subprogram.sql)
- FUNCTION 函数 [sql-demo](../../scripts/dev/plsql/subprogram.sql)


> 区别

过程定义中不包含RETURN子句，可以不返回任何值或多个值；函数在定义中必须包含RETURN子句，并且必须返回单个值。

如果有多个返回值或者不返回值，就使用过程；如果只有一个返回值，就使用函数；过程用户执行特定的任务，函数用于执行任务并返回值。

虽然函数带out参数也是合法的，但是这一般被认为是一个不太好的编程风格。


> 查看

```oracle
-- 查看过程代码
select * from user_source where name = 'SAYHELLO';
-- 查看对象
select * from SYS.USER_OBJECTS where object_type = 'PROCEDURE';
```

> 操作

```oracle
-- 查看
desc sayhello;
-- 删除
drop sayhello;
```

> 赋权

```oracle
GRANT EXECUTE ON sayhello TO SHAWN;
```

## PACKAGE

程序包

程序包也是一种数据库对象，是对相关过程、函数、变量、游标和异常等对象的封装。使用程序包可以分类管理过程和函数。 

程序包由包头（规范）和包主体（说明）两部分组成

优点：模块化、更轻松的程序设计、信息隐藏、新增功能以及性能更佳

```oracle
程序包头规范（类似java的接口）
CREATE [OR REPLACE] PACKAGE 包名  
AS
     声明 常量|变量|游标|异常|函数|过程|子程序
END ;

```

```oracle
程序包体规范
CREATE [OR REPLACE] PACKAGE BODY 包名  
AS
     包头中每个游标和子程序的具体实现
END ;

```

## Reference

- [plsql/overview](http://www.oracle.com/technetwork/database/application-development/plsql/overview/index.html)