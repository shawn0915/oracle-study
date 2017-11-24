# Oracle Trigger 触发器

数据库触发器是一种特殊的PL/SQL对象，因为我们无法手动调用这种对象。我们只能通过触发事件来运行触发器。

[SQL-DEMO-trigger](../../sql_scripts/dev/plsql/trigger/trigger.sql)

> 触发器是当特定事件出现时自动执行的存储过程

- DDL触发器
- DML触发器
- 复合触发器
 - 11g新特性
- 代替触发器
- 系统或数据库事件触发器
 - 跟踪用户行为

> 组成部分

- 触发器语句
- 触发器限制
- 触发器操作

> 类型

- 数据库级触发器
- DDL触发器(模式触发器)
- DML触发器
  - 行级触发器 for each row
  - 语句触发器
  - INSTEAD OF触发器 instead of delete
    - 使那些本来不能修改的视图变为可以更改的视图
    - 在视图中更改关联表的列值


在行级触发器中有两个虚拟的临时记录： Old和New 。
Old与New分别表示触发事件的表“旧的一条记录”和“新的一条记录”。可以使用Old和New来查看修改之前和修改之后的数据，并根据When条件进行触发器操作的数据行进行限制。
在执行过程中，可使用:Old和:NEW来引用

> 作用

- 数据确认，实施复杂的约束
- 实施复杂的安全性检查
- 做审计，跟踪表上所做的数据操作等
- 数据的备份和同步


## 权限

```oracle
CREATE TRIGGER
ALTER ANY TABLE
CREATE ANY TRIGGER
EXECUTE
```


