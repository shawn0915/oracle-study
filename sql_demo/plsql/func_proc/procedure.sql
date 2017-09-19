/*
存储过程:用于完成特定任务的子程序
与函数的区别:Oracle存储过程没有返回值(可以利用输出函数实现返回值),而函数有返回值
语法:
CREATE [OR REPLACE] PROCEDURE
   <procedure name> [(<parameter list>)]
IS|AS
   <local variable declaration>
BEGIN
   <executable statements>
[EXCEPTION
   <exception handlers>]
END;
*/

-- 不带参数的存储过程
create or replace procedure pro_hello
is
v_hello varchar2(20);
begin
v_hello:='hello world!';
dbms_output.put_line(v_hello);
end;
-- 调用过程
begin
pro_hello;
end;
exec pro_hello();-- SQL窗口不是调用,需要在Command Window调用
-- 带参数的存储过程
/*
 in:输入参数(向存储过程内部传递参数)
 out:输出参数(用户接受存储过程内部的处理结果)
 in out:输入输出参数
*/

create or replace procedure pro_emp(emp_no in number,emp_name out varchar2)
is
begin
select ename into emp_name from emp where empno=emp_no;
end;
-- 调用
declare
v_empno number:='&请输入';
v_ename varchar2(20);
begin
pro_emp(v_empno,v_ename);
dbms_output.put_line('姓名是:'||v_ename);
end;

-- 计算总页数
create or replace procedure pro_totalPages(tableName varchar2,pageSize number,totalPages out number)
is
totalRows number;
v_sql varchar2(200);
begin
v_sql:='select count(*) from '||tableName;
execute immediate v_sql into totalRows;
totalPages:=ceil(totalRows/pageSize);
end;
-- 调用
declare
tableName varchar2(20):='&请输入表名';
pageSize number:='&请输入分页单位';
totalPages number;
begin
pro_totalPages(tableName,pageSize,totalPages);
dbms_output.put_line('总页数是:'||totalPages);
end;

-- 使用in out 参数交换值
create or replace procedure pro_swap(p1 in out number,p2 in out number)
is
v_temp number;
begin
v_temp:=p1;
p1:=p2;
p2:=v_temp;
end;

-- 调用
declare
p1 number:='&p1';
p2 number:='&p2';
begin
dbms_output.put_line('交换前:'||'p1='||p1||'p2='||p2);
pro_swap(p1,p2);
dbms_output.put_line('交换后:'||'p1='||p1||'p2='||p2);
end;

-- 为存储过程授权
grant execute on pro_swap to xiaoming

-- 删除存储过程
DROP PROCEDURE pro_swap;

/*
程序包:程序包是对相关过程、函数、变量、游标和异常等对象的封装
程序包由规范和主体两部分组成
声明程序包中公共对象。包括类型、变量、常量、异常、游标规范和子程序规范等
声明程序包私有对象和实现在包规范中声明的子程序和游标
程序包规范
CREATE [OR REPLACE]
  PACKAGE
  package_name IS|AS
[Public item declarations]
[Subprogram specification]
END [package_name];
程序包主体
CREATE [OR REPLACE] PACKAGE BODY package_name IS|AS
[Private item declarations]
[Subprogram bodies]
[BEGIN
Initialization]
END [package_name]
*/
-- 程序包规范
create or replace package my_pack
is
procedure pro1;
function fun1 return varchar2;
end ;

-- 程序包主体
create or replace package body my_pack
is
procedure pro1 is
begin
dbms_output.put_line('pro1');
end;
function fun1 return varchar2
is
begin
return 'fun1';
end;
end ;

select my_pack.fun1 from dual

/*
利用存储过程实现分页
*/
create or replace package cur_pack is
type ref_mycur_type is ref cursor;
end ;

create or replace procedure pagination(tableName varchar2,curPage number,pageSize number,totalRows out number,
totalPages out number,mycur out cur_pack.ref_mycur_type)
is
v_sql varchar2(200);
begin
v_sql:='select count(*) from '||tableName;
execute immediate v_sql into totalRows;-- 计算总记录数
totalPages:=ceil(totalRows/pageSize);-- 计算总页数
v_sql:='select * from (select rownum r,e.* from '||tableName||' e) A
where A.r<=('||curPage*pageSize||') and A.r>'||(curPage-1)*pageSize;
open mycur for v_sql;
end;

-- 调用
declare
tableName varchar2(20):='&请输入表名';
curPage number:='&当前页';
pageSize number:='&分页单位';
totalRows number;
totalPages number;
mycur cur_pack.ref_mycur_type;
begin
pagination(tableName,curPage,pageSize,totalRows,totalPages,mycur);
dbms_output.put_line('总记录数:'||totalRows||',总页数:'||totalPages);
end;


/*
如何在java中调用存储过程
public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL2", "scott", "tiger");
			CallableStatement cs = conn.prepareCall("{call pagination(?,?,?,?,?,?)}");
			cs.setString(1, "emp");
			cs.setInt(2, 2);
			cs.setInt(3,3);
			cs.registerOutParameter(4, OracleTypes.NUMBER);
			cs.registerOutParameter(5, OracleTypes.NUMBER);
			cs.registerOutParameter(6, OracleTypes.CURSOR);
			cs.execute();
			int totalRows=  cs.getInt(4);
			int totalPages= cs.getInt(5);
			ResultSet rs = (ResultSet)cs.getObject(6);
			System.out.println("总记录:"+totalRows);
			System.out.println("总页数:"+totalPages);
			while(rs.next()){
				int empno = rs.getInt("empno");
				String empName = rs.getString("ename");
				System.out.println(empno+"\t"+empName);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
*/



