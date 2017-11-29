# TRUNCATE

由`INSERT`、`UPDATE`和`DELETE`(甚至`MERGE`)命令组成的事务可以变成永久(使用`COMMIT`)或者反转(使用`ROLLBACK`)。
`TRUNCATE`命令和其他所有DDL命令一样，立即让变更变成永久：绝对不能反转，无法回滚。

`TRUNCATE`完全清空表。这里没有行选择的概念，而`DELETE`命令却有这个概念。
