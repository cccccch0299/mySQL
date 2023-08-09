#DDL
alter table employee change empno id varchar(10);
alter table employee add workplace varchar(10);
#修改字段数据类型
alter table employee change id id int;

#DML
#添加数据
insert into employee(id, name, gender, age, idcard, entrydate, workno) values (1,'cccccch','男',21,'123456789012345678','2023-08-07','1');
select * from employee;
insert into employee values (5,'az','男',23,'12345678901234567X','2023-08-07','5')
#批量插入
insert into employee values (3,'eee','女',20,'123456789012345678','2023-08-07','3'),(4,'zzz','女',20,'123456789012345678','2023-08-07','4')

#修改数据
update employee set name = 'cccccch1' where id = 1;
update employee set name = '小昭', age = 19 where id = 2;
update employee set entrydate = '2002-09-09';
update  employee set gender = '男' where id = 4;
update employee set idcard = null where id = 4;
#删除数据
delete from employee where gender = '女';
delete from employee;


#DQL
#基本查询
select name,workno,age from employee;
select * from employee;
#起别名
select gender as '性别' from employee;
#去重
select distinct  gender as '性别' from employee;

#条件查询 类似于if语句

select * from employee where age = 21;
select * from employee where age <= 21;
select * from employee where idcard IS NULL ;
select * from employee where idcard IS NOT NULL ;
select * from employee where age != 21;#也可以age <> 21
select * from employee where age = 21;
select * from employee where age between 20 and 23;#左边最小值右边最大值
select * from employee where age < 23 && gender = '女';
select * from employee where age = 21 || gender = '女';
select * from employee where age in(19,21);#或语句
#查询姓名为两个字的员工 _ % 一个下划线代表一个字符，百分号代表任意字符
select * from employee where name like '__';
#查最后一位是X的
select * from employee where idcard like '%X';
select * from employee where idcard like '_________________X';

#聚合函数
select count(*) from employee;#count统计数量
select count(idcard) from employee;
select avg(age) from employee;
select max(age) as '最大年龄' from employee;
select sum(age) from employee where gender = '男';

#分组查询 goup by
select gender,count(*) from employee group by gender;
select gender,avg(age) from employee group by gender;

#查询年龄小于20，并根据工作地址分组，获取员工数量大于3的工作地址
#where 分组前过滤 having 分组后过滤
select workplace,count(*) from employee where age < 23 group by workplace having count(*) >=2 ;

#排序查询 order by asc 升序 desc降序
select * from employee order by age asc;
select * from employee order by age asc ,entrydate desc;

#分页查询 limit 两个参数 第一个：查询页的起始索引，第二个：每一页展示的个数
select * from employee limit 1 , 2;#查询第一页。每一页2条
select * from employee limit 2 , 2;#查询第二页。每一页2条
#作业
select * from employee where age in(20,21,22,23) && gender = '女';
select * from employee where gender = '男' && age between 20 and 40 && name like '__';
select gender,count(*) from employee where age < 60 group by gender;
select name,age from employee where age <=35 order by age asc,entrydate desc ;
select * from employee where gender = '男' and age between 20 and 40 order by age,entrydate limit 0,5;

#执行顺序
/*
from..
where..
group by having...
select...
order by..
limit
*/
#起别名执行顺序验证
select e.name ename,e.age eage from employee e where  e.age>15 order by eage asc;

#DCL
#创建用户,只能在当前主机
create user 'itcast'@'localhost' identified by '123456';
#在任意主机访问
create user 'hiema'@'%' identified by'123456';
#修改密码 identified with mysql_native_password by
alter user 'hiema'@'%' identified with mysql_native_password by '1234';
#删除用户
drop user 'hiema'@'%';

#DCL权限控制

#查询权限
show grants for 'itcast'@'%';
#授予权限 数据库权限授予给用户
grant all on itcast.* to 'itcast'@'%';
#撤销权限
revoke all on itcast.* from 'itcast' @'%';
