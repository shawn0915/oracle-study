# Oracle SQL 基础

> 编写基本的 SQL SELECT 语句

```oracle
SELECT 基本语法
查询当前用户所有用的表和视图
查看表的结构定义
查看表中所有数据
查看表中指定列的数据
显示某列唯一值
SQL 语句中的加、减、乘、除
NULL 的检索
NULL 的计算
SQL 连接符与单引号的使用
Aslias 字段别名
||(连接符)应用
distinct 删除重复值
```


> 过滤和排序数据

```oracle
使用判断条件
使用IN条件
使用NOT操作符
使用like条件
排序
```


> 单行函数

```oracle
字符型函数
数值型函数
日期型函数
隐式转换
显式转换(补)
单值通用函数
条件表达式
```


> 多表查询

```oracle
等连接
自然连接
using 语句
不等连接
自连接
外连接
交叉连接(笛卡尔)
```


> 分组函数

```oracle
创建测试表
   聚集
   分组
```


> 子查询

```oracle
查询条件中的子查询
建表语句中的子查询
插入语句中的子查询
更新语句中的子查询
ANY/SOME、ALL
子查询中空值问题
```


> 操纵数据

```oracle
向表中插入一条记录
从另一个表复制行
更新表中的行
使用子查询更新两列
从表中删除行
删除基于另一个表的行
INSERT ALL
MERGE
DEFAULT 应用
保存点
```

> 创建和管理表

```oracle
创建表
日期数据类型
用子查询语法创建表
修改表
字段UNUSED
删除表
改变对象的名字
截断表
```


> 内置约束

```oracle
NOT NULL
UNIQUE
PRIMARY KEY
FOREIGN KEY
CHECK
约束的管理
Not null 与性能相关的测试
外键的测试
延迟约束
```


> 创建视图

```oracle
WITH CHECK OPTION
WITH READ ONLY
子查询不允许视图中的orderby
内建视图
TOP-N 几种方法的测试
```

> 其他数据库对象

```oracle
序列
索引
同义词
```



> 控制用户访问

```oracle
角色
REFERENCES(引用)
```

> 使用集合运算

```oracle
-- 合集
UNION
UNION ALL
/*
union 和 union all 的区别
- union 去掉重复记录, union all 不去重
- union 排序, union all 不排序
 */
 
-- 交集
INTERSECT

-- 差集
MINUS
```

- [sql-demo](../sql_demo/base/06_union.sql)


> Oracle 9i/10g 日期时间函数

```oracle
四种时间数据类型对比
SYSDATE
SYSTIMESTAMP
ADD_MONTHS
LAST_DAY
DBTIMEZONE
SESSIONTIMEZONE
CURRENT_DATE
CURRENT_TIMESTAMP
LOCALTIMESTAMP
EXTRACT
MONTHS_BETWEEN
NEXT_DAY
```


> 增强 GROUP BY ⼦句

```oracle
GROUP BY
ROLLUP
CUBE
```

> 高级子查询

```oracle
使用子查询
成对对比子查询
非成对对比子查询
EXISTS
NOT EXISTS
```

> 分级取回数据

```oracle
分级取数据示例
巧用 connect by
```

