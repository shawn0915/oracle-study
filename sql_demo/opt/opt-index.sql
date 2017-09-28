/*
不可用索引
 */
SELECT
  OWNER,
  INDEX_NAME
FROM DBA_INDEXES
WHERE STATUS = 'UNUSABLE';

-- 重建索引
alter index valid_i rebuild online nologging;