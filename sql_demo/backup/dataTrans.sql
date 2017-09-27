/*
数据迁移
 */

/*
目录
 */
-- 查看目录
SELECT *
FROM all_directories;

SYS	XMLDIR	/u01/app/oracle/product/11.2.0/xe/rdbms/xml
SYS	DATA_PUMP_DIR	/u01/app/oracle/admin/XE/dpdump/

-- 创建目录
CREATE DIRECTORY hr_dir AS '/u01/app/oracle/hr_dir';

-- 授权
GRANT READ ON DIRECTORY hr_dir TO PUBLIC;
GRANT WRITE ON DIRECTORY hr_dir TO HR;

-- 删除
DROP DIRECTORY hr_dir;


/*
行迁移
 */
ALTER TABLE test move;

/*
段收缩
 */
alter table_name shrink space [cascade][compact];

alter index index_name shrink space [cascade][compact];