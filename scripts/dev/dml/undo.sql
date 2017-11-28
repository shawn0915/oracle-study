/*
撤销表空间

计算撤销生成的峰值速率，乘以最长查询的时间长度。

 */
SELECT
  begin_time,
  end_time,
  undoblks,
  maxquerylen
FROM v$undostat;