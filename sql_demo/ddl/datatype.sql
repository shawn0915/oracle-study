SELECT
  table_name,
  COLUMN_NAME,
  data_type,
  nullable,
  data_length,
  data_precision,
  data_scale
FROM user_tab_columns
WHERE table_name = 'books';