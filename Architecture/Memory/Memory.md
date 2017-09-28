# 内存结构

- [SGA(System Global Area) 系统全局区](#sga)
- [PGA(Program Global Areas) 程序全局区](#pga)

> 监控和管理内存

- 非默认标准块
- 使用多池
- 手动更改large_pool_size
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

## SGA

[SQL-DEMO-SGA](../../sql_demo/mgmt/memory/mem_sga.sql)

实例共享内存

### 数据结构

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
```html
日志缓冲区的大小在启动时就已经确定，不能动态修改，也不能自动重设。
```
- Large Pool, 大内存池
- Java Pool, Java内存池
- Streams Pool, 流内存池

### 自动内存管理, Automatic Memory Management, AMM

`MEMORY_TARGET`

## PGA

[SQL-DEMO-PGA](../../sql_demo/mgmt/memory/mem_pga.sql)

会话的专用区域。

> 会话特有的数据

- 临时表
- 排序行
- 合并位图
- 变量
- 调用堆栈


> 实例参数

```oracle
WORKAREA_SIZE_POLICY
PGA_AGGREGATE_TARGET
```

### 内存顾问

=> [ADDM=>内存顾问](../../Optimize/ADDM/ADDM.md#顾问)
