/*
Oracle数据库使用伪列分页语句：
select 列名 from
  (
    select  列名 ,rownum r from
      ( select 列名 from 表名 条件 order by 排序字段 desc,rowid)  A
    where rownum <= 结束量
  ) where r > 偏移量

偏移量的计算方法：偏移值=每页显示数量*（当前页数-1）；
结束量的计算方法：结束量=当前页*每页显示数量

注意：在Oracle查询中不要出现*，除了效率和可读性的考虑之外，这样可能引发隐式错误。

Oracle的分页(通过rownum)分页单位:pageSize,当前页:curPage
select * from (select rownum r,e.* from 表名 e) A
where A.r<=(当前页*分页单位) and A.r>(当前页-1)*分页单位

*/

select id,name from (
  select id,name,rownum r from(
    select id,name from myadmin order by id
  ) where rownum <= 10
)  where r > 5 ;


-- 第一页:前5条:
select * from (select rownum r,e.* from emp e) A where A.r<=5 and A.r>0;
-- 第二页:取5~10条
select * from (select rownum r,e.* from emp e) A where A.r<=10 and A.r>5;
-- 第三页:
select * from (select rownum r,e.* from emp e) A where A.r<=15  and A.r>10;