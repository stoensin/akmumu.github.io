---
author: admin
comments: true
date: 2012-09-05 09:20:00+00:00
layout: post
slug: argc-argv%e5%9c%a8php%e4%b8%ad%e7%9a%84%e5%ba%94%e7%94%a8
title: argc argv在php中的应用
wordpress_id: 61
categories:
- PHP
- 操作系统
tags:
- php程序设计
- 操作系统相关
---




argc,argv 用命令行编译程序时有用







我们会在定时任务脚本中发现这样的参数，$obj->run($argv[1]);




*/30 * * * * /usr/local/bin/php /htdocs/test.com/uaqm/commands/test.php
1 >/dev/null 2>&1




就像上面那个定时任务，如果我们调用他的时候加上了参数$argv[1]，那就代表了，在脚本中在DOS命令行中执行程序名后的第一个字符串




即上面脚本中对应的红色的那个1，如果我们部署了下面所列的定时任务




*/30 * * * * /usr/local/bin/php /htdocs/test.com/uaqm/commands/test.php
1 >/dev/null 2>&1




*/30 * * * * /usr/local/bin/php /htdocs/test.com/uaqm/commands/test.php 2 >/dev/null 2>&1




*/30 * * * * /usr/local/bin/php /htdocs/test.com/uaqm/commands/test.php 3 >/dev/null 2>&1




那么我们认为这个任务分了三个进程在运行，也就是说压力变为原始的三分之一，这样就很容易理解了




下面放出这两个关键字的官方解释。




argc: 整数,用来统计你运行程序时送给[main函数](http://baike.baidu.com/view/379148.htm)的命令行参数的个数








　　* argv: 字符串[数组](http://baike.baidu.com/view/209670.htm)，用来存放指向你的字符串参数的[指针数组](http://baike.baidu.com/view/2072881.htm)，每一个元素指向一个参数








　　argv[0] 指向程序运行的全路径名 







　　argv[1] 指向在DOS命令行中执行程序名后的第一个字符串 







　　argv[2] 指向执行程序名后的第二个字符串


argv[argc]为NULL


