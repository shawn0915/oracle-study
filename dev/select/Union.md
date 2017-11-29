# 集合运算符

[SQL-DEMO-Union](../scripts/dev/union/union.sql)

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