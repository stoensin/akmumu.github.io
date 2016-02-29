---
author: admin
comments: true
date: 2012-12-03 09:54:00+00:00
layout: post
slug: php%e8%84%9a%e6%9c%ac%e5%8e%8b%e5%8a%9b%e6%b5%8b%e8%af%95%ef%bc%8clinux%ef%bc%8capache%e7%9a%84ab%e5%91%bd%e4%bb%a4%e8%af%a6%e8%a7%a3
title: php脚本压力测试，linux，apache的ab命令详解
wordpress_id: 126
categories:
- Apache
- LINUX
tags:
- Apache
- linux
---







1. 最基本的关心两个选项 -c -n  

例： ./ab -c 100 -n 10000 [
http://127.0.0.1/index.php ](http://127.0.0.1/index.php)




-c 100 即：每次并发100个  

-n 10000 即： 共发送10000个请求




2. 测试结果分析




[junjie2@login htdocs]$ /data1/apache/bin/ab -c 1000 -n 50000 "[http://10.10.10.10/a.php](http://10.10.10.10/a.php) "  

This is ApacheBench, Version 1.3d <$Revision: 1.73 $> apache-1.3  

Copyright (c) 1996 Adam Twiss, Zeus Technology Ltd, [
http://www.zeustech.net/](http://www.zeustech.net/)   

Copyright (c) 1998-2002 The Apache Software Foundation, [
http://www.apache.org/](http://www.apache.org/)




Benchmarking 10.65.129.21 (be patient)  

Completed 5000 requests  

Completed 10000 requests  

Completed 15000 requests  

Completed 20000 requests  

Completed 25000 requests  

Completed 30000 requests  

Completed 35000 requests  

Completed 40000 requests  

Completed 45000 requests  

Finished 50000 requests  

Server Software: Apache/1.3.33   

Server Hostname: 10.65.129.21  

Server Port: 80




Document Path: /a.php //请求的资源  

Document Length: 0 bytes // 文档返回的长度，不包括相应头




Concurrency Level: 1000 // 并发个数  

Time taken for tests: 48.650 seconds //总请求时间
  

Complete requests: 50000 // 总请求数  

Failed requests: 0 //失败的请求数  

Broken pipe errors: 0  

Total transferred: 9750000 bytes  

HTML transferred: 0 bytes  

Requests per second: 1027.75 [#/sec] (mean) // 平均每秒的请求数  

Time per request: 973.00 [ms] (mean) // 平均每个请求消耗的时间  

Time per request: 0.97 [ms] (mean, across all concurrent requests) // 就是上面的时间 除以并发数  

Transfer rate: 200.41 [Kbytes/sec] received // 时间传输速率




Connnection Times (ms)  

min mean[+/-sd] median max  

Connect: 0 183 2063.3 0 45003  

Processing: 28 167 770.6 85 25579  

Waiting: 21 167 770.6 85 25578  

Total: 28 350 2488.8 85 48639




Percentage of the requests served within a certain time (ms)  

50% 85 // 就是有50%的请求都是在85ms内完成的  

66% 89  

75% 92  

80% 96  

90% 168  

95% 640  

98% 984  

99% 3203  

100% 48639 (last request)




3. 用127.0.0.1来访问可以排除网络的因素，不过在Linux上用本机的对外ip访问也是不走网卡，没有网络消耗的







ab 帮助：




1. 我们知道用ab测试时，最大并发不能超过1024，其实ab本身没有做这个限制，而是系统限制每个进程打开的最大的文件数为1024，ulimit查看如 下：




[root@localhost ~]# ulimit -a  

core file size (blocks, -c) 0  

data seg size (kbytes, -d) unlimited  

file size (blocks, -f) unlimited  

pending signals (-i) 1024  

max locked memory (kbytes, -l) 32  

max memory size (kbytes, -m) unlimited  

open files (-n) 1024   

pipe size (512 bytes, -p) 8  

POSIX message queues (bytes, -q) 819200  

stack size (kbytes, -s) 10240  

cpu time (seconds, -t) unlimited  

max user processes (-u) 32765  

virtual memory (kbytes, -v) unlimited  

file locks (-x) unlimited




而且open files这个选项在一般的系统里是不允许修改成无限制的，如下：  

[root@localhost ~]# ulimit -n unlimited  

bash: ulimit: open files: cannot modify limit: Operation not permitted




但是稍微修改大一些或者是小一些，还是允许的，我们修改的小一 些试试：  

[root@localhost ~]# ulimit -n 1020  

[root@localhost ~]# ulimit -n  

1020  

[root@localhost ~]#




在用ab测试，错误如下：




socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 1019
  

ioctl(1019, FIONBIO, [1]) = 0  

gettimeofday({1243919682, 867688}, NULL) = 0  

connect(1019, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("10.55.38.18")}, 16) = -1 EINPROGRESS (Operation now in progress)  

socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = -1 EMFILE (Too many open files )  

close(-1) = -1 EBADF (Bad file descriptor)  

第1019个还能正常打开，下一个就报Too many open files的 错误了





确实有效，那么我们修改大一些吧：




[root@localhost ~]# ulimit -n 10240  

[root@localhost ~]# ulimit -n  

10240  

[root@localhost ~]#




但是我们发现改大却不行，这里却冒出了一个AF_AX25 的名词：  

socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 1024  

ioctl(1024, FIONBIO, [1]) = 0  

gettimeofday({1243919592, 254950}, NULL) = 0  

connect(1024, {sa_family=AF_INET , sin_port=htons(80), sin_addr=inet_addr("10.55.38.18")}, 16) = -1 EINPROGRESS (Operation now in progress)  

socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 1025  

ioctl(1025, FIONBIO, [1]) = 0  

gettimeofday({1243919592, 255242}, NULL) = 0  

connect(1025, {sa_family=AF_AX25 , sa_data="Pn7&22"}, 16) = -1 EAFNOSUPPORT (Address family not supported by protocol)  






这个AF_AX25可能是buffer溢出造成的，但不确定 哦：）。





另：   

-n 可以指定最大请求数，但是也不能超过50000哦：）  

-v n 当n>=2 时，可以显示发送的http请求头，和响应的http头及内容； 压力测试时不要这么做哦：）




转自：[http://johnnyhg.javaeye.com/blog/523818](http://johnnyhg.javaeye.com/blog/523818)






