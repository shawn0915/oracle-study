/*
分区

类型：
范围分区 RANGE
散列分区 HASH
列表分区 LIST
复合分区 RANGE-RANGE/LIST-RANGE/LIST-LIST/LIST-HASH

要分区的表不能具有LONG和LONG RAW数据类型的列！

维护：
添加分区 ADD
删除分区 DROP
截断分区 TRUNCATE
合并分区 MERGE
拆分分区 SPLIT
重命名 RENAME

 */

-- RANGE
CREATE TABLE SALES2 (
  PRODUCT_ID VARCHAR2(5),
  SALES_DATE DATE NOT NULL,
  SALES_COST NUMBER(10)
)
  PARTITION BY RANGE (SALES_DATE)
  (
  PARTITION P1 VALUES LESS THAN (to_DATE('2008-01-01','yyyy-mm-dd')),
  PARTITION P2 VALUES LESS THAN (to_DATE('2009-01-01','yyyy-mm-dd')),
  PARTITION P3 VALUES LESS THAN (MAXVALUE)
  );

-- HASH
SQL> CREATE TABLE Employee
(
  Employee_ID varchar2 (5),
  Employee_Name varchar2(20),
  Department varchar2 (10)
)
  PARTITION BY HASH (Department)
  (
  Partition D1,
  Partition D2,
  Partition D3,
  Partition D4
  );

-- LIST
SQL> CREATE TABLE Employee
(
  Emp_ID number (4),
  Emp_Name varchar2 (14),
  Emp_Address varchar2 (15)
)
  PARTITION BY LIST (Emp_Address)
  (
  Partition north values ('芝加哥'),
    Partition west values ('旧金山', '洛杉矶'),
  Partition south values ('亚特兰大', '达拉斯', '休斯顿'),
    Partition east values ('纽约', '波斯顿')
  );


-- RANGE-RANGE分区示例

drop table sales;
CREATE TABLE SALES
(
  PRODUCT_ID VARCHAR2 (5),
  SALES_DATE DATE NOT NULL,
  SALES_COST NUMBER (10)
)
  PARTITION BY RANGE (SALES_DATE)
SUBPARTITION BY RANGE (SALES_COST)
(
PARTITION S1 VALUES LESS THAN (TO_DATE('31/1月/2012','DD/MON/YYYY'))
(
SUBPARTITION S1_P1 VALUES LESS THAN(2000),
SUBPARTITION S1_P2 VALUES LESS THAN(8000),
SUBPARTITION S1_P3 VALUES LESS THAN(maxvalue)
),
PARTITION S2 VALUES LESS THAN (TO_DATE('29/2月/2012', 'DD/MON/YYYY'))
(
SUBPARTITION S2_P1 VALUES LESS THAN(2000),
SUBPARTITION S2_P2 VALUES LESS THAN(8000),
SUBPARTITION S2_P3 VALUES LESS THAN(maxvalue)
),
PARTITION S3 VALUES LESS THAN (TO_DATE('31/3月/2012','DD/MON/YYYY'))
(
SUBPARTITION S3_P1 VALUES LESS THAN(2000),
SUBPARTITION S3_P2 VALUES LESS THAN(8000),
SUBPARTITION S3_P3 VALUES LESS THAN(maxvalue)
),
PARTITION S4 VALUES LESS THAN (MAXVALUE)
(
SUBPARTITION S4_P1 VALUES LESS THAN(2000),
SUBPARTITION S4_P2 VALUES LESS THAN(8000),
SUBPARTITION S4_P3 VALUES LESS THAN(maxvalue)
)
);

insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p001','02-1月-2012',1500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p002','02-1月-2012',2500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p003','02-1月-2012',8500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p004','02-2月-2012',1500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p005','02-2月-2012',6500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p006','02-2月-2012',7500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p007','02-3月-2012',5500);
insert into SALES(PRODUCT_ID,SALES_DATE,SALES_COST) values('p008','02-3月-2012',9500);


select table_name,partition_name,SUBPARTITION_NAME from user_tab_subpartitions;

select * from sales partition(s1);

select * from sales subpartition(s1_p1);




-- LIST-RANGE分区示例

drop table sales2;
CREATE TABLE SALES2
(
  PRODUCT_ID VARCHAR2 (5),
  SALES_area varchar(100) NOT NULL,
  SALES_COST NUMBER (10)
)
  PARTITION BY LIST (SALES_area)
SUBPARTITION BY RANGE (SALES_COST)
(
PARTITION S1 VALUES  ('日本','美国','韩国')
(
SUBPARTITION S1_P1 VALUES LESS THAN(2000),
SUBPARTITION S1_P2 VALUES LESS THAN(8000),
SUBPARTITION S1_P3 VALUES LESS THAN(maxvalue)
),
PARTITION S2 VALUES ('中国','朝鲜','伊朗')
(
SUBPARTITION S2_P1 VALUES LESS THAN(2000),
SUBPARTITION S2_P2 VALUES LESS THAN(8000),
SUBPARTITION S2_P3 VALUES LESS THAN(maxvalue)
)，
PARTITION S4 VALUES (DEFAULT)
(
SUBPARTITION S4_P1 VALUES LESS THAN(2000),
SUBPARTITION S4_P2 VALUES LESS THAN(8000),
SUBPARTITION S4_P3 VALUES LESS THAN(maxvalue)
)
);

insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p001','日本',1500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p002','美国',2500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p003','韩国',8500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p004','朝鲜',1500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p005','日本',6500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p006','中国',7500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p007','中国',5500);
insert into SALES2(PRODUCT_ID,SALES_area,SALES_COST) values('p008','中国',9500);


select table_name,partition_name,SUBPARTITION_NAME from user_tab_subpartitions;

select * from sales2 partition(s2);

select * from sales2 subpartition(s2_p2);





-- LIST-LIST分区示例

drop table sales3;
CREATE TABLE SALES3
(
  PRODUCT_ID VARCHAR2 (5),
  SALES_area varchar(100) NOT NULL,
  sales_address varchar(100) not null,
  SALES_COST NUMBER (10)
)
  PARTITION BY LIST (SALES_area)
SUBPARTITION BY list (sales_address)
(
PARTITION S1 VALUES  ('日本','美国','韩国')
(
SUBPARTITION S1_P1 VALUES ('东京','大阪'),
SUBPARTITION S1_P2 VALUES ('芝加哥','华盛顿'),
SUBPARTITION S1_P3 VALUES ('首尔','釜山'),
SUBPARTITION S1_P4 VALUES (default)
),
PARTITION S2 VALUES ('中国','朝鲜','伊朗')
(
SUBPARTITION S2_P1 VALUES ('陕西','四川'),
SUBPARTITION S2_P2 VALUES ('平壤'),
SUBPARTITION S2_P3 VALUES (default)
)，
PARTITION S3 VALUES (DEFAULT)
(
SUBPARTITION S3_P1 VALUES ('伦敦','巴黎'),
SUBPARTITION S3_P2 VALUES (default)
)
);

insert into SALES3(PRODUCT_ID,SALES_area,SALES_Address,SALES_COST) values('p001','中国','陕西',1500);
insert into SALES3(PRODUCT_ID,SALES_area,SALES_Address,SALES_COST) values('p002','中国','四川'，2500);
insert into SALES3(PRODUCT_ID,SALES_area,SALES_Address,SALES_COST) values('p003','朝鲜','平壤',8500);
insert into SALES3(PRODUCT_ID,SALES_area,SALES_Address,SALES_COST) values('p004','韩国','济州',1500);



select table_name,partition_name,SUBPARTITION_NAME from user_tab_subpartitions;

select * from sales3 partition(s2);

select * from sales3 subpartition(S2_P1);




-- LIST-HASH分区示例

drop table sales4;
CREATE TABLE SALES4
(
  PRODUCT_ID VARCHAR2 (5),
  SALES_area varchar(100) NOT NULL,
  SALES_COST NUMBER (10)
)
  PARTITION BY LIST (SALES_area)
  SUBPARTITION BY HASH  (PRODUCT_ID)
  SUBPARTITIONS 4
  (
  PARTITION S1 VALUES  ('日本','美国','韩国'),
  PARTITION S2 VALUES ('中国','朝鲜','伊朗')，
  PARTITION S3 VALUES (DEFAULT)
  );

insert into SALES4(PRODUCT_ID,SALES_area,SALES_COST) values('p001','中国',1500);
insert into SALES4(PRODUCT_ID,SALES_area,SALES_COST) values('p002','中国',2500);
insert into SALES4(PRODUCT_ID,SALES_area,SALES_COST) values('p003','朝鲜',8500);
insert into SALES4(PRODUCT_ID,SALES_area,SALES_COST) values('p004','韩国',1500);



select table_name,partition_name,SUBPARTITION_NAME from user_tab_subpartitions;

select * from sales4 partition(s2);





-- 显示当前用户所有分区表
select * from user_part_tables;

-- 显示当前用户所有分区表的详细分区信息
select * from user_tab_partitions;

-- 显示当前用户所有分区表的子分区信息
select * from USER_TAB_SUBPARTITIONS;

-- 显示当前用户所有分区表的列信息
select * from USER_PART_KEY_COLUMNS;

