/*
数据库之间的通信

分布式事务
 */
insert into orders@dev select * from orders@prod;
commit;

insert into orders@dev
(select * from orders@prod minus select * from orders@dev);

update orders@prod set order_name = 'anyway' where order_id = 1;
update orders@dev set order_name = 'anyway' where order_id = 1;
commit;

