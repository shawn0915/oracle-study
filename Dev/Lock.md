# Lock 锁

> 作用

锁是数据库用来控制共享资源并发访问的机制。
锁用保护正在被修改的数据，在多用户环境下保持数据的完整性和一致性。
直到提交或回滚了事务之后，其他用户才可以更新数据


> 类型

- 行级锁
```oracle
INSERT 
UPDATE 
DELETE
SELECT .. FOR UPDATE 
```
- 表级锁
  - 行共享 ROW SHARE, RS
  - 行排他 ROW EXCLUSIVE, RX
  - 共享 SHARE, S
  - 共享行排他 SHARE ROW EXCLUSIVE, SRX
  - 排他 EXCLUSIVE, X

> Dead Lock 死锁


> 查看和结束锁进程

```oracle
-- 查看被锁的表和进程
select * from v$session t1,v$locked_object t2 where t1.sid=t2.session_id;

-- 杀掉进程
alter system kill session 'sid,serial#';
```