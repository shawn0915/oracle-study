/*
temporary table
 */
create global temporary table tmp_emps on commit preserve rows
as select * from employees where 1=2;
