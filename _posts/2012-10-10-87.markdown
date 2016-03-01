---
author: admin
comments: true
date: 2012-10-10 05:46:00+00:00
layout: post
slug: php-%e6%89%a7%e8%a1%8c%e7%b3%bb%e7%bb%9f%e5%a4%96%e9%83%a8%e5%91%bd%e4%bb%a4-system-exec-passthru
title: PHP 执行系统外部命令 system() exec() passthru()
wordpress_id: 87
categories:
- PHP
tags:
- php程序设计
---




PHP作为一种服务器端的脚本语言，象编写简单，或者是复杂的动态网页这样的任务，它完全能够胜任。但事情不总是如此，有时为了实现某个功能，必须借助于操作系统的外部程序（或者称之为命令），这样可以做到事半功倍。








区别:   

system() 输出并返回最后一行shell结果。   

exec() 不输出结果，返回最后一行shell结果，所有结果可以保存到一个返回的数组里面。   

passthru() 只调用命令，把命令的运行结果原样地直接输出到标准输出设备上。   

相同点：都可以获得命令执行的状态码   

demo:   







复制代码代码如下:





  

//system('dir');   

// exec ('dir');   

// passthru ('dir');   

// echo `dir`;   




  

  


