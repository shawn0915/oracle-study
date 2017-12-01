# Oracle Storage Structures
存储结构


- Physical Storage Structure
  - [Schema](Schema.md)
  - [Database Files](DatabaseFiles.md)
    - Control Files
    - Data Files
    - Online Redo Log
    - Other Files
  - [Oracle ASM](asm/ASM.md)
  - 可插拔数据库(PDB)(new in 12c)
  - 块变化跟踪文件
  - Flashback日志
  - RMAN backups
- [Logical Storage Structure](LogicalStorageStructure.md)
  - Tablespace
  - Segment
    - [undo segment](segment/segment_undo.md)
  - Extent
  - Data Blocks
- [Others](#others)


## Others

- 管理方案对象
  - 分区表
  - 索引组织表
  - 簇
  - 联机重组
- 管理存储
  - 表空间监视
  - 段收缩
  - 恢复挂起语句
  - 传输表空间
  - 平台传输数据库
