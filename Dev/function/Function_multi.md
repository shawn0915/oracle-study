# 多行函数

- [聚合函数](#聚合函数)
- [分组函数](#分组函数)

## 聚合函数



## 分组函数

```oracle
AVG
SUM
MIN
MAX
COUNT
GROUP BY
HAVING
```

基本规则：
1. 它们每次总是作用于一组行。该组可能是数据集划分的许多组的其中之一，或者可能是整个表。分组函数对每个组都执行一次。
2. 除了`COUNT`函数的`COUNT(*)`形式外，所有的分组函数都忽略分组列或者表达式中包含空值的行。

在`SELECT`列表中不是分组函数的所有项必定是`GROUP BY`子句的分组特性(grouping attribute)。

单行函数可以嵌套任意层，但分组函数最多可以嵌套两层。嵌套的函数调用`COUNT(SUM(AVG(X)))`返回错误“ORA-00935: group function is nested too deeply”。
在分组函数内可以嵌套单行函数。
```oracle
-- 计算各部门LAST_NAME值的平均长度之和
SELECT SUM(AVG(LENGTH(LAST_NAME)))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
```

=========================================





> 增强 GROUP BY ⼦句

```oracle
GROUP BY
ROLLUP
CUBE
```
