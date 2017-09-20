# 表连接

> Oracle 6

- 嵌套循环连接 Nested Loop Join
- 群集连接 Cluster Join
- 排序合并连接 Sort-Merge Join
- 笛卡尔连接 Cartesian Join

> Oracle 7.3

- 哈希连接 Hash Join

> Oracle 8

- 索引连接 Index Join

```oracle
Equijoin 等连接
Non-equijoin 不等连接 BETWEEN
--
NATURAL JOIN 自然连接 , 会以两个表中具有相同名字的列为条件创建等值连接
  JOIN USING clause , 使用 USING 子句指定等值连接中需要用到的列
  JOIN ON
  NATURAL/USING/ON -- 相互排斥，不能同时出现在联接子句中
--
Self JOIN 自连接
--
OUTER JOIN 外连接
  LEFT OUTER JOIN
  RIGHT OUTER JOIN
  FULL OUTER JOIN
--
CROSS JOIN 交叉连接(笛卡尔)
```

