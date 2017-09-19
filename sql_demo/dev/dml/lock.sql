/*
lock
 */

/*
行级锁
 */

INSERT
UPDATE
DELETE
SELECT .. FOR UPDATE


/*
查看和结束锁进程
 */

-- 查看被锁的表和进程
select * from v$session t1,v$locked_object t2 where t1.sid=t2.session_id;

-- 杀掉进程
alter system kill session 'sid,serial#';
