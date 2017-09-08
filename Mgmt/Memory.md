# 内存结构

- SGA(System Global Area)
- PGA(Program Global Areas)

> 监控和管理内存

- ⾮默认标准块
- 使⽤多池
- ⼿动更改large_pool_size
- 将对象保存到内存中


## 内存管理

- 9i 自动化PGA管理
  - 内存颗粒
- 10g 自动化**SGA**管理
  - 数据库高速缓存 Flush Buffer Area
  - 共享内存池 Shared Pool
  - redo日志缓存区 redo log Buffer
  - 大内存池 Large Pool
  - Java内存池 Java Pool
  - 流内存池 Streams Pool
- 11g 自动化内存管理