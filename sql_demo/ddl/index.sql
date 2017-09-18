/*
INDEX
 */
-- create
CREATE INDEX IDX_SYS_OFFICE_ID ON SYS_OFFICE (ID);

create index myindex on emp(deptno);

索引已创建。

-- drop
DROP INDEX IDX_SYS_OFFICE_ID;

-- 创建位图索引
CREATE bitmap index idx_sys_office_id on sys_office(id);
