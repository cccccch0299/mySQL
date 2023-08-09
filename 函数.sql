#字符串函数
#concat
select  concat('hellp','mysql');
#lower
select lower('Hello');
#lapd
select  lpad('01',5,'*');
#rpad
select rpad('02',10,'!');
#trim 去除空格类似strip
select trim(' Hello world ');
#索引值从1开始截取
select substring('hello my_sql',1,3);
#将员工表中员工编号补齐至5位数
update employee set workno = lpad(workno,5,'0');

#数值函数
#ceil
select ceil(1.1);
#floor
select floor(1.9);
#rand
select rand();
#mod
select mod(7,4);
#round(a,b)对a四舍五入保留b位小数
select round(3.51145,3);

#生成一个6位数的随机验证码
select round(rand(),6)*1000000;


#日期函数
#curdate
select curdate();
#curtime
select curtime();
#now
select now();

#year/month/day
select year(now());
select month(now());
select day(now());

#date_add
select date_add(now(),interval 70 month);
#datediff两个时间相隔的时间
select datediff('2021-12-1',now());

#查询所有员工的入职天数
select name,datediff(curdate(),entrydate) adate from employee order by adate desc ;

#流程控制函数如果第一个值为true则返回第一个值，否则返回第二个
select if(true,'ok','error');
#ifnull 如果第一个值为null返回第二个值，如果第一个值不为null则直接返回第一个值
select ifnull(null,'error');
#case when..then..else end 如果when后面是true则返回
#case a when b then...end 如果b的值等于a则...
#需求：查询employee表的员工姓名和工作地址v如果是上海/北京返回一线城市，其余返回二线城市
select name,case when(workplace in ('上海','北京')) then '一线城市' else '二线城市'end  from employee;
select name,case workplace when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end from employee;