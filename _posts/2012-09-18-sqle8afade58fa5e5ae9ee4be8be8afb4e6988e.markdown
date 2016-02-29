---
author: admin
comments: true
date: 2012-09-18 10:05:00+00:00
layout: post
slug: sql%e8%af%ad%e5%8f%a5%e5%ae%9e%e4%be%8b%e8%af%b4%e6%98%8e
title: SQL语句实例说明
wordpress_id: 66
categories:
- MYSQL
tags:
- Mysql
---





我是在MySQL数据库中做的测试,不同的数据库有一定的差别。







先来一些[MySQL 显示表字段及注释等信息](http://www.cnblogs.com/zhwl/archive/2012/08/28/2660532.html)命令




SHOW DATABASES //列出 MySQL Server 数据库。  

SHOW TABLES [FROM db_name] //列出数据库数据表。  

SHOW TABLE STATUS [FROM db_name] //列出数据表及表状态信息。  

SHOW COLUMNS FROM tbl_name [FROM db_name] //列出资料表字段  

SHOW FIELDS FROM tbl_name [FROM db_name]，DESCRIBE tbl_name [col_name]。  

SHOW FULL COLUMNS FROM tbl_name [FROM db_name]//列出字段及详情  

SHOW FULL FIELDS FROM tbl_name [FROM db_name] //列出字段完整属性  

SHOW INDEX FROM tbl_name [FROM db_name] //列出表索引。  

SHOW STATUS //列出 DB Server 状态。  

SHOW VARIABLES //列出 MySQL 系统环境变量。  

SHOW PROCESSLIST //列出执行命令。  

SHOW GRANTS FOR user //列出某用户权限













MySQL中模式就是数据库







SHOW DATABASES;




show databases;  

罗列所有数据库名称







CREATE DATABASE <数据库名>




create database TEST;  

创建名为TEST的数据库







DROP DATABASE <数据库名>




drop database TEST;  

删除名为TEST的数据库







USE <数据库名>




use TEST;  

使用名为TEST的数据库







SHOW TABLES




show tables;  

显示当前数据库所有表格







SHOW [FULL] COLUMNS FROM <表名>  






show [full] columns from <表名>  

在MySQL数据库中显示表的结构,如果加上full则更加详细







DESC <表名>




desc TEST;  

查看表TEST的结构，同show columns from TEST







SHOW CREATE TABLE <表名>




show create table TEST;




查看表TEST的所有信息，包括建表语句










**创建基本表:**  

CREATE TABLE <表名>   

(<列名> <数据类型>[列级完整性约束条件],  

<列名> <数据类型>[列级完整性约束条件],  

………………  

);




create table STUDENT  

(  

studentId int(30) primary key,  

name varchar(255),  

address varchar(255)  

);  

创建名为STUDENT的表格，有属性studentId,name,address,其中studentId为主键




create table TEACHER  

(  

teacherId int(30),  

name varchar(255),  

age int(20),  

studentId int(30),  

primary key (teacherId),  

foreign key (studentId) references STUDENT(studentId)  

);  

创建名为TEACHER的表格，其中teacherId为主键，studentId为外键，引用STUDENT表的主键studentId







**修改基本表:**




ALTER TABLE <表名> RENAME <修改后表名>




alter table TEACHER rename S;  

将TEACHER表的表名改为S




ALTER TABLE <表名> ADD COLUMN <列名> <属性类型>




alter table TEACHER add column ADDRESS varchar(255);  

在表名为TEACHER的表中加入名为ADDRESS的列




ALTER TABLE <表名> CHANGE COLUMN <列名> <修改后列名> <属性类型>




alter table TEACHER change column ADDRESS address varchar(230);  

修改TEACHER表中的列，将ADDRESS的列名改为address




ALTER TABLE <表名> DROP [COLUMN] <列名>




alter table TEACHER drop [column] address;  

删除列名为address的列,column可有可无




** **




**删除基本表：**




DROP TABLE <表名> [RESTRICT|CASCADE]  

删除表格




  

drop table STUDENT restrict;  

删除STUDENT表。受限制的删除，欲删除的基本表不能被其他表的约束所引用(如check,foreign key等约束)，  

不能有视图，不能有触发器，不能有存储过程或函数等。




  

drop table STUDENT cascade;




若选择cascade，则该表删除没有限制。在删除基本表的同时，相关的依赖对象，例如视图，都将被一起删除。




但是我在MySQL测试的时候给错误提示Cannot delete or update a parent row: a foreign key constraint fails，不予以删除，不知道是什么原因。







**关于完整约束性：**




** 参考文章：**[完整性约束的SQL定义](http://www.cnblogs.com/2007/archive/2007/08/24/868428.html)




ALTER TABLE <表名> ADD CONSTRAINT <约束名> <约束条件>




alter table teacher add constraint pk_teacher_id primary key teacher(id);




在teacher表中增加名为pk_teacher_id的主键约束。




ALTER TABLE <表名> DROP <约束条件>




alter table teacher drop primary key;




删除teacher表的主键约束。







alter table student add constraint fk_student_teacher foreign key student(teacherId) references teacher(id);




在student表中增加名为fk_student_teacher的约束条件，约束条件为外键约束。







**索引的建立与删除:**




**索引的建立：**




CREATE [UNIQUE]|[CLUSTER] INDEX <索引名> ON <表名>(<列名> [次序][,<列名> [次序]]……);




UNIQUE 表明此索引的每一个索引值只对应唯一的数据记录。




CLUSTER 表示要建立的索引是聚簇索引。




create unique index id_index on teacher(id asc);  

对teacher表的id列建立unique索引，索引名为id_index







**索引的删除：**




DROP INDEX <索引名> ON <表名>




drop index id_index on teacher;  

在teacher表中删除索引，索引名为id_index







**另外的方法：**




新建索引：




ALTER TABLE <表名> ADD [UNIQUE]|[CLUSTER] INDEX [<索引名>](<列名> [<次序>],[<列名> [<次序>]]……)




alter table teacher add unique index id_index(id asc);  

在teacher表中对id列升序建立unique索引，索引的名字为id_index







删除索引：




ALTER TABLE <表名> DROP INDEX <索引名>




alter table teacher drop index id_index;  

删除teacher表名为id_index的索引







数据库索引的建立有利也有弊，参考文章：




**[数据库索引的作用和优点缺点（一）](http://learning.iteye.com/blog/334009)**




**[数据库索引的作用和优点缺点（二）](http://learning.iteye.com/blog/334012)**




**[数据库建立索引的原则](http://lin23871.iteye.com/blog/378385)**







**数据查询：**




SELECT [ALL|DISTINCT] <目标列表达式> [,<目标列表达式>]……




FROM <表名或视图名> [<表名或视图名>]……




[WHERE <条件表达式>]




[GROUP BY <列名1> [HAVING <条件表达式>]]




[ORDER BY <列名2> [ASC|DESC] [,<列名3> [ASC|DESC]]……]；




** **




**查询经过计算的值：**




select teacherId as id,salary - 100 as S from teacher;




查询经过计算的值，从teacher表中查询出teacherId字段，别名为id,并且查询出salary字段减去100后的字段，别名为S







**使用函数和字符串：**




select teacherid as id,'birth',salary - 20 as SA, lower(name) from teacher;




<目标表达式>可以是字符串常量和函数等,'birth' 为字符串常量，lower(name)为函数，将name字段以小写字母形式输出







**消除取值重复的行：**




select distinct name from teacher;




如果没有指定DISTINCT关键词，则缺省为ALL.







**查询满足条件的元组：**




WHERE子句常用的查询条件:


<table cellpadding="0" cellspacing="0" align="left" border="1" >
<tbody >
<tr >

<td width="177" valign="top" >


**查询条件**



</td>

<td width="391" valign="top" >


**谓词**



</td>
</tr>
<tr >

<td width="177" valign="top" >


比较



</td>

<td width="391" valign="top" >


=, >, <, >=, <=, !=, <>, !>, !<



</td>
</tr>
<tr >

<td width="177" valign="top" >


确定范围



</td>

<td width="391" valign="top" >


BETWEEN AND, NOT BETWEEN AND



</td>
</tr>
<tr >

<td width="177" valign="top" >


确定集合



</td>

<td width="391" valign="top" >


IN, NOT IN



</td>
</tr>
<tr >

<td width="177" valign="top" >


字符匹配



</td>

<td width="391" valign="top" >


LIKE, NOT LIKE



</td>
</tr>
<tr >

<td width="177" valign="top" >


空值



</td>

<td width="391" valign="top" >


IS NULL, IS NOT NULL



</td>
</tr>
<tr >

<td width="177" valign="top" >


多重条件(逻辑运算)



</td>

<td width="391" valign="top" >


AND, OR, NOT



</td>
</tr>
</tbody>
</table>





** **




** **




** **




** **




** **




** **




** **




** **




** **




**  

**(1)比较大小：




select * from teacher where name = 'test';




select * from teacher where salary > 500;




select * from teacher where salary <> 500;




(2)确定范围：




select * from teacher where salary between 300 and 1000；




select * from teacher where salary not between 500 and 1000




(3)确定集合




select * from teacher where name in('test','test2');




select * from teacher where name not in('test','test2');




(4)字符匹配:




[NOT] LIKE '<匹配串>' [ESCAPE '<换码字符>']  

<匹配串>可以是一个完整的字符串，也可以含有通配符%和_  

%代表任意长度(长度可以是0)的字符。例如a%b表示以a开头，以b结尾的任意长度的字符串。如acb,addgb,ab




_代表任意单个字符。例如a_b表示以a开头，以b结尾的长度为3的任意字符串。如acb,afb等都满足该匹配串。




select * from teacher where name like '%2%‘；




select * from teacher where name like '_e%d’；




注意一个汉字要占两个字符的位置。




(5)涉及空值查询：




select * from teacher where name is null;




select * from teacher where name is not null;  






注意这里的"is"不能用符号(=)代替。




(6)多重条件查询：




select * from teacher where name = 'test' and salary between 400 and 800;




select * from teacher where name like '%s%' or salary = 500;







**ORDER BY子句：**




ORDER BY 子句对查询结果按照一个或多个属性列的升序(ASC)或降序(DESC)排列，缺省值为(ASC)




select salary from teacher order by salary asc;




select * from teacher order by name desc,salary asc;




  

**聚集函数(aggregate functions):**




COUNT([DISTINCT|ALL]*)  统计元组个数  

COUNT([DISTINCT|ALL]<列名>)  统计一列值的个数  

SUM([DISTINCT|ALL]<列名>)  计算一列值的总和  

AVG([DISTINCT|ALL]<列名>)  计算一列值的平均值  

MAX([DISTINCT|ALL]<列名>)  求一列值中的最大值  

MIN([DISTINCT|ALL]<列名>)　　  求一列值中的最小值**  

**




缺省值为ALL




select count(distinct name) from teacher;  

查询没有重复的名字的个数




select count(*) from teacher;  

查询teacher表格总记录数




select sum(salary) from teacher;  

查询teacher表的salary字段的总和  






select avg(salary) from teacher;  

查询teacher表的salary字段的平均值




select max(salary) from teacher;  

查询teacher表的salary字段的最大值




select min(salary) from teacher;  

查询teacher表的salary字段的最小值







**GROUP BY子句：**




GROUP BY子句将查询结果按某一列或多列的值分组，值相等的为一组。  

对查询结果分组的目的是为了细化聚集函数的作用对象。分组后聚集函数将作用于每一个组，即每一组都有一个函数值。




select cno,count(*) from teacher group by cno;  

对teacher表格按照cno分组，并算出每组里面有多少个元素




如果分组后还要按照一定的条件对这些组进行筛选，最终只输出满足指定条件的组，则可以使用HAVING语句指定筛选条件。




select cno,count(*) from teacher group by cno having count(*) >= 4;  

对teacher表格按照cno分组，并算出每组里面有多少个元素，得到元素个数大于等于4的值  









**连接查询：**




连接查询是关系数据库中最主要的的查询，包括等值连接查询，自然连接查询，非等值连接查询，自身连接查询，外连接查询和复合条件连接查询等。




**等值与非等值连接查询：**




连接查询的WHERE子句中用来连接两个表的条件称为连接条件或连接谓词，格式为：




[<表名1>.]<列名> <比较运算符> [<表名2>.]<列名2>




其中比较运算符主要有：=，>, <, >=, <=, !=(或<>)等







select s.*,t.* from student as s,teacher as t where s.teacherid = t.teacherid;  

等值连接查询，将student表和teacher的信息连接查询出来，连接条件是s.teacherid = t.teacherid




  

**自身连接：  

**




一个表与自身进行连接，称为自身连接




select teacher.name,student.name from people as teacher,people as student where teacher.name = student.teacher;  

自身连接查询，在people表里有两种角色，一种是教师，一种是学生，利用自身连接查询，得到name字段和teacher字段相等的元组







**外连接：**




左外连接列出左边关系中所有元组，右外连接列出右边关系中所有元组。




左外连接：SELECT <目标列表达式>[,<目标列表达式>]…… FROM <表名1> LEFT [OUTER] JOIN <表名2> ON <连接条件>  

右外连接：SELECT <目标列表达式>[,<目标列表达式>]…… FROM <表名1> RIGHT [OUTER] JOIN <表名2> ON <连接条件>  






select s.sno,s.name,c.cno,c.name from student as s left outer join class as c on (s.cno = c.cno);  

student表和class表进行左外连接，连接条件是s.cno=c.cno




select c.cno,c.name,s.sno,s.name from student as s right outer join class as c on (s.cno = c.cno);   

student表和class表进行右外连接，连接条件为s.cno=c.cno




  

student表数据：




+-----+-----+------+  

| sno | cno | name |  

+-----+-----+------+  

| 1 | 1 | 地心 |  

| 2 | 2 | 华雄 |  

| 3 | 1 | 孝慈 |  

| 4 | 3 | 必须 |  

+-----+-----+------+




class表数据：




+-----+-----+------+  

| cid | cno | name |  

+-----+-----+------+  

| 1 | 1 | 化学 |  

| 2 | 2 | 物理 |  

| 3 | 3 | 政治 |  

+-----+-----+------+







左外连接效果：




+-----+------+-----+------+  

| sno | name | cno | name |  

+-----+------+-----+------+  

| 1 | 地心 | 1 | 化学 |  

| 2 | 华雄 | 2 | 物理 |  

| 3 | 孝慈 | 1 | 化学 |  

| 4 | 必须 | 3 | 政治 |  

+-----+------+-----+------+




右外连接效果：




+-----+------+-----+------+  

| cno | name | sno | name |  

+-----+------+-----+------+  

| 1 | 化学 | 1 | 地心 |  

| 1 | 化学 | 3 | 孝慈 |  

| 2 | 物理 | 2 | 华雄 |  

| 3 | 政治 | 4 | 必须 |  

+-----+------+-----+------+




MySQL不支持全外连接！







**复合条件连接：**




WHERE子句中可以有多个连接条件，称为复合条件连接




select s.sno,s.name,c.name,s.score from student s,class c where s.cno = c.cno and s.score < 60;  

复合条件连接查询，查询学生信息和课程信息，并且成绩小于60的记录







**嵌套查询：**




一个SELECT-FROM-WHERE语句称为一个查询块。将一个查询块嵌套在另一个查询块的WHERE子句或HAVING短语的条件中的查询称为嵌套查询。  






子查询的SELECT语句中不能使用ORDER BY子句，ORDER BY 子句只能对最终查询结果排序




  

带有IN谓词的子查询:




select sno,name from student  

where cno in  

(  

select cno from student  

where name = '华雄'  

);




查询和"华雄"选同一课程的所有学生的学号和姓名。







子查询的查询条件不依赖于父查询，称为**不相关子查询**。




如果子查询条件依赖于父查询，这类子查询称为**相关子查询，**整个查询语句称为相关嵌套查询语句。




  

带有比较运算符的子查询：




select name,cno from student s1  

where score >  

(  

select avg(score) from student s2  

where s2.name = s1.name  

);




查询学生的大于各科平均成绩的科目




**以上是相关子查询。**




** **




带有ANY(SOME)或ALL谓词的子查询




子查询返回单值时可以用比较运算符，但返回多值时要用ANY(有的系统用SOME)或ALL谓词修饰。使用ALL或ALL谓词时必须使用比较运算符。




>ANY  大于子查询结果的某个值  

>ALL  大于子查询结果的所有值   

<ANY  小于子查询结果的某个值  

<ALL  小于子查询结果的所有值  

>=ANY  大于等于子查询结果的某个值   

>=ALL  大于等于子查询结果的所有值  

<=ANY  小于等于子查询结果的某个值  

<=ALL  小于等于子查询结果的所有值  

=ANY  等于子查询结果的某个值  

=ALL  等于子查询结果的所有值(通常没有实际意义)  

!=(或<>)ANY  不等于子查询结果的某个值  

!=(或<>)ALL  不等于子查询结果的任何一个值  

  






select name,score from student where score <= all (select score from student);  

查询成绩最小的学生姓名和成绩







**集合查询：**




SELECT语句的查询结果是元组的集合，所以多个SELECT语句的结果可进行集合操作。集合操作主要包括并操作(UNION),交操作(INTERSECT),差操作(EXCEPT)。  

参加集合操作的各查询结果的列数必须相同；对应项的数据类型也必须相同。  

MySQL数据库不支持INTERSECT和EXCEPT操作！  

  






select * from student where cno=1   

union   

select * from student where cno=2;  

查询班级1和班级2所有学生信息










**数据更新：**




**插入数据：**




插入元组：




INSERT   

INTO <表名> [(<属性列1>)[,<属性列2>]……]  

VALUES (<常量1>[,<常量2>]……)；




  

例子：




insert into student (cno,name,score) values (2,'横切',85);  









插入子查询结果：




INSERT   

INTO <表名> [(<属性1>[,<属性2>]……)]  

子查询;




  

例子：




insert into studentcopy select * from student;  

将student表的信息全部复制到studentcopy表中




**   

修改数据：  

**




UPDATE <表名>  

SET <列名>=<表达式>[,<列名>=<表达式>]……  

[WHERE <条件>]




**  

**修改某一元组的值：  






update studentcopy set score=80 where sno=1;  






修改多个元组的值:




update studentcopy set score=score-20;







**删除数据：**




DELETE   

FROM <表名>  

[WHERE <条件>];







删除某一元组：




delete from studentcopy where sno=1;  






删除多个元组：  






delete from studentcopy;  






带子查询的删除语句：




delete from studentcopy where cno in (select cno from student as s where s.cno = 2);







**视图：**




关于视图，它的作用和优缺点可以参考文章：[数据库视图介绍](http://www.cnblogs.com/pony/archive/2008/07/15/1243210.html)










**建立视图：**




CREATE VIEW <视图名> [(<列名>[,<列名>]……)]  

AS <子查询>  

[WITH CHECK OPTION]**  

  

**子查询可以是任意复杂的SELECT语句，但通常不允许含有ORDER BY子句和DISTINCT语句。




WITH CHECK OPTION 表示对视图进行UPDATA,INSERT和DELETE操作时要保证更新，插入或删除的行满足视图定义中的谓词条件




组成视图的属性列名或者全部省略或者全部指定，没有第三种选择。如果省略了视图的各个属性列名，则隐含该视图由子查询中SELECT子句目标列中的诸字段组成。  

但在下面三种情况下必须明确指定组成视图的所有列名：  

(1) 某个目标列不是单纯的属性名，而是聚集函数或列表达式。  

(2) 多表连接时选出了几个同名列作为视图的字段。**  

**(3) 需要在视图中为某个列启用新的更合适的名字。**  

  

**




create view part_student  

as  

select * from student  

where cno = 2;  

建立物理班学生的视图  

  






create view student_class (sno,student_name,class_name,score)  

as  

select s.sno,s.name,c.name,s.score  

from student as s,class as c  

where s.cno = c.cno;  

结合学生表和选课表建立视图




  

如果以后修改了基本表的结构，则基本表与视图的映射关系就被破坏了，该视图就不能正确工作了。为避免出现这类问题，最好在修改基本表之后删除由该基本表导出的视图，然后重建这个视图。




  

**删除视图：**




DROP VIEW <视图名> [CASCADE];




如果视图上还导出了其他视图，则使用CASCADE级联删除语句，把该视图和由它导出的所有视图一起删除。







**查询视图：  

**




查询视图和查询基本表类似。







**更新视图：  

**




更新视图和更新基本表类似，不过有些限制。



