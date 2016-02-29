---
author: admin
comments: true
date: 2012-12-10 10:07:00+00:00
layout: post
slug: mysql%e8%b0%83%e4%bc%98%e8%84%9a%e6%9c%actuning-primer-sh%e4%bd%bf%e7%94%a8%e8%af%b4%e6%98%8e
title: MySQL调优脚本tuning-primer.sh使用说明
wordpress_id: 138
categories:
- MYSQL
tags:
- Mysql
---



大名鼎鼎的MySQL调优脚本tuning-primer.sh官方下载地址：http://forge.mysql.com/projects/project.php?id=44 -> , 直接下载地址：
[
http://launchpad.net/mysql-tuning-primer/trunk/1.5-r5/+download/tuning-primer.sh](http://launchpad.net/mysql-tuning-primer/trunk/1.5-r5/+download/tuning-primer.sh)该脚本使用 “SHOW STATUS LIKE…” 和 “SHOW VARIABLES LIKE…” 命令获得MySQL相关变量和运行状态。然后根据推荐的调优参数对当前的MySQL数据库进行测试。最后根据不同颜色的标识来提醒用户需要注意的各个参数设置。该版本兼容 MySQL 3.23 和更高版本（包含 5.1）当前版本会处理如下这些推荐的参数：


Slow Query Log （慢查询日志） 




Max Connections （最大连接数）




Worker Threads （工作线程） 




[Key](http://www.google.com/search?hl=en&q=allinurl%3Akey+java.sun.com&btnI=I%27m%20Feeling%20Lucky) Buffer （[Key](http://www.google.com/search?hl=en&q=allinurl%3Akey+java.sun.com&btnI=I%27m%20Feeling%20Lucky) 缓冲）





Query Cache （查询缓存） 




Sort Buffer （排序缓存） 




Joins （连接） 




Temp Tables （临时表） 




Table (Open &amp; Definition) Cache （表缓存） 




Table Locking （表锁定） 




Table Scans (read_buffer) （表扫描，读缓冲） 




Innodb Status （Innodb 状态）


tuning-primer.sh 有如下运行参数:  

Usage: ./tuning-primer.sh[ mode ]  

all 运行所有检测(默认值)  

prompt 显示提示信息  

mem, memory 运行有关内存使用方面的检测  

disk, file 运行有关I/O性能和文件处理限制方面的检测  

innodb 运行InnoDB检测  

misc  


