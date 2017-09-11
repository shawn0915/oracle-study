/*
确定已为（以及当前为）程序全局区分配了多少内存
 */
select name,value from v$pgastat
where name in ('maximum PGA allocated', 'total PGA allocated');

total PGA allocated	86553600
maximum PGA allocated	159060992
