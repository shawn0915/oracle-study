# System Global Area (SGA)
系统全局区

[SQL-DEMO-SGA](../../scripts/arch/memory_sga.sql)


## Structure

- Database Buffer Cache, 数据库高速缓存
- [Shared Pool](Memory_SGA_Shared_Pool.md)
  - Library Cache, 库缓存
  - Data Dictionary Cache, 数据字典缓存
  - PL/SQL区
  - Result Cache, SQL查询和PL/SQL函数结果缓存
- [Redo Log Buffer](Memory_SGA_RedoLogBuffer.md)
- Large Pool, 大内存池
- Java Pool, Java内存池
- Streams Pool, 流内存池
- Fixed SGA


## Ref

- [overview/sga](https://docs.oracle.com/cd/E11882_01/server.112/e40540/memory.htm#CNCPT802)