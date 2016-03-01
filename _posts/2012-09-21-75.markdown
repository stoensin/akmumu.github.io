---
author: admin
comments: true
date: 2012-09-21 07:36:00+00:00
layout: post
slug: linux%e7%b3%bb%e7%bb%9fshell-if%e8%af%ad%e5%8f%a5%e7%94%a8%e6%b3%95%e5%b0%8f%e7%bb%93
title: Linux系统Shell if语句用法小结
wordpress_id: 75
categories:
- 操作系统
tags:
- 操作系统相关
---




1、字符串判断




str1 = str2　　　　　　当两个串有相同内容、长度时为真  

str1 != str2　　　　　 当串str1和str2不等时为真  

-n str1　　　　　　　 当串的长度大于0时为真(串非空)  

-z str1　　　　　　　 当串的长度为0时为真(空串)  

str1　　　　　　　　 当串str1为非空时为真


<table width="97%" >
<tbody >
<tr >

<td >
</td>
</tr>
</tbody>
</table>


2、数字的判断




int1 -eq int2　　　　两数相等为真  

int1 -ne int2　　　　两数不等为真  

int1 -gt int2　　　　int1大于int2为真  

int1 -ge int2　　　　int1大于等于int2为真  

int1 -lt int2　　　　int1小于int2为真  

int1 -le int2　　　　int1小于等于int2为真




3 文件的判断




-r file　　　　　用户可读为真  

-w file　　　　　用户可写为真  

-x file　　　　　用户可执行为真  

-f file　　　　　文件为正规文件为真  

-d file　　　　　文件为目录为真  

-c file　　　　　文件为字符特殊文件为真  

-b file　　　　　文件为块特殊文件为真  

-s file　　　　　文件大小非0时为真  

-t file　　　　　当文件描述符(默认为1)指定的设备为终端时为真




3、复杂逻辑判断




-a 　 　　　　　 与  

-o　　　　　　　 或  

!　　　　　　　　非







　　下面是一些使用实例：




#!/bin/sh  

myPath="/var/log/httpd/"  

myFile="/var /log/httpd/access.log"




#这里的-x 参数判断$myPath是否存在并且是否具有可执行权限  

if [ ! -x "$myPath"]; then  

mkdir "$myPath"  

fi




#这里的-d 参数判断$myPath是否存在  

if [ ! -d "$myPath"]; then  

mkdir "$myPath"  

fi




#这里的-f参数判断$myFile是否存在  

if [ ! -f "$myFile" ]; then  

touch "$myFile"  

fi




#其他参数还有-n,-n是判断一个变量是否是否有值  

if [ ! -n "$myVar" ]; then  

echo "$myVar is empty"  

exit 0  

fi




#两个变量判断是否相等  

if [ "$var1" == "$var2" ]; then  

echo '$var1 eq $var2'  

else  

echo '$var1 not eq $var2'  

fi







  

if list then  

do something here  

elif list then  

do another thing here  

else  

do something else here  

fi 




EX1:




#!/bin/sh




SYSTEM=`uname -s` #获取操作系统类型，我本地是linux




if [ $SYSTEM = "Linux" ] ; then #如果是linux的话打印linux字符串  

echo "Linux"  

elif [ $SYSTEM = "FreeBSD" ] ; then   

echo "FreeBSD"  

elif [ $SYSTEM = "Solaris" ] ; then  

echo "Solaris"  

else  

echo "What?"  

fi #ifend




基本上和其他脚本语言一样。没有太大区别。不过值得注意的是。[]里面的条件判断。




=========================================================================




#. $HOME/.bash_profile  

cd $HOME  

sh .bash_profile  

cd $HOME/jnjzapp/sos_dx/  

echo -e '开始'  

./jn_card_dx.sh  

wait  

#sqlplus $DBSTR <<START_A  

#@jn_card_dx.sql  

#/  

#commit;  

#exit;  

#START_A  

cd $HOME/jnjzapp/sos_dx/data/  

if [ ! -d BQMSG ]; then   

mkdir BQMSG   

fi   

#mkdir BQMSG  

cd $HOME/jnjzapp/sos_dx/  

sqlplus $DBSTR <<START  

@sos.sql;  

commit;  

exit;  

START  

objdir=`date -d ' days' +%Y%m%d`  

echo $objdir  

#cp jn_card_sos.txt $objdir.txt
















1、if 与[ 之间必须有空格




2、[ ]与判断条件之间也必须有空格




3、]与; 之间不能有空格



