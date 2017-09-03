-- 解锁改密码

/*
管理员登录
1. sqlplus sys/你的密码 as sysdba
2. sqlplus / as sysdba
SQL>

解锁
SQL>alter user scott account unlock;

改密码>
SQL>alter user scott identified by 新密码;

*/