# 内存结构

- [SGA(System Global Area) 系统全局区](#sga)
- [PGA(Program Global Areas) 程序全局区](#pga)

> 监控和管理内存

- ⾮默认标准块
- 使⽤多池
- ⼿动更改large_pool_size
- 将对象保存到内存中

> 内存管理

- 9i 自动化PGA管理
  - 内存颗粒
- 10g 自动化**SGA**管理
  - 数据库高速缓存 Flush Buffer Area
  - 共享内存池 Shared Pool
  - redo日志缓存区 Redo Log Buffer
  - 大内存池 Large Pool
  - Java内存池 Java Pool
  - 流内存池 Streams Pool
- 11g 自动化内存管理

SGA
------

> 数据结构

- Database Buffer Cache, 数据库高速缓存
- Shared Pool, 共享内存池 **!最复杂**
  - Library Cache, 库缓存
  - Data Dictionary Cache, 数据字典缓存
  - PL/SQL区
  - Result Cache, SQL查询和PL/SQL函数结果缓存
```html
共享池的大小是动态的，可以对其进行自动管理。
内存配置算法：LRU最近最少使用
Java代码在共享池中缓存
```
- Redo Log Buffer, Redo日志缓存区
- Large Pool, 大内存池
- Java Pool, Java内存池
- Streams Pool, 流内存池

> [SQL-Demo-SGA](../sql_demo/mgmt/mem_sga.sql)

PGA
------



> [SQL-Demo-PGA](../sql_demo/mgmt/mem_pga.sql)


