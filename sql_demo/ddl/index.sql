/*
INDEX
 */
CREATE INDEX IDX_SYS_OFFICE_ID ON SYS_OFFICE (ID);

DROP INDEX IDX_SYS_OFFICE_ID;

-- 创建位图索引
CREATE bitmap index idx_sys_office_id on sys_office(id);
