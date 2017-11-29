# Oracle Database Architecture

- [x] [Storage Structures](storage/Storage.md)
  - [x] [Physical Storage Structures](storage/Storage.md#physical)
  - [x] [Logical Storage Structures](storage/Storage.md#logical)
- [x] Instance Architecture
  - [x] [Oracle Database Instance](instance/Instance.md)
  - [x] [Memory Architecture](memory/Memory.md)
    - [x] [SGA](memory/Memory_SGA.md)
    - [x] [PGA](memory/Memory_PGA.md)
    - [x] [UGA](memory/Memory_UGA.md)
  - [x] Process Architecture
    - Oracle Processes
      - [x] [Background Processes](process/Process_Background.md)
      - [x] [Server Processes](https://docs.oracle.com/cd/E11882_01/server.112/e40540/process.htm#CNCPT1248)
      - [x] Slave Processes
    - Client Processes
  - [x] [Application and Networking Architecture](https://docs.oracle.com/cd/E11882_01/server.112/e40540/dist_pro.htm#CNCPT006)


> Oracle服务器 = Oracle数据库 + Oracle实例
数据库Storage = physical物理结构 + logical逻辑结构
实例Instance = background后台进程 + memory内存结构

![Process_and_SGA](img/Oracle_Processes_and_the_SGA.gif)

## Oracle 工作区域

用户/模式

在Oracle中，用户和模式同义

## Reference

- [one store](story.txt)