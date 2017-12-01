# undo segment
撤销

撤销段使用与**回滚段**的使用相矛盾：根据`UNDO_MANAGEMENT`参数的不同设置，Oracle数据库要么使用撤销段，要么使用回滚段。

任何事物都无法跨多个撤销段，但一个撤销段可以支持多个事务。

如果DML语句用尽了撤销空间，则将回滚其已成功的部分。事务的其余部分保持完好，且不提交。

控制撤销的三个初始化参数：`UNDO_MANAGEMENT/UNDO_TABLESPACE/UNDO_RETENTION`

使用撤销段的自动撤销管理是11g版本的默认方式。

## Active/Expired/Unexpired

绝对不能重写`Active`撤销；可以重写`Expired`撤销。只有在缺少撤销空间的情况下，才能重写`Unexpired`撤销。

- **Active** 活动

撤销数据将始终保持到生成它的事务以`COMMIT`或`ROLLBACK`结束为止。

- **Unexpired** 未过期

撤销数据在进入不活动状态后，会保留一段时间，以便满足长期运行的查询的任何读一致性要求。

- **Expired** 过期

`Expired`撤销是读一致性不再需要的数据，在重用撤销段的空间时，将随时重写`Expired`撤销。


- [Undo Segments and Transactions](https://docs.oracle.com/cd/E11882_01/server.112/e40540/logical.htm#CNCPT305)