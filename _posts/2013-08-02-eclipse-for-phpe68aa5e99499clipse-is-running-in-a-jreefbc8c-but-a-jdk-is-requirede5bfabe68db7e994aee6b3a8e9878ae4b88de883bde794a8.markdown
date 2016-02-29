---
author: admin
comments: true
date: 2013-08-02 06:48:57+00:00
layout: post
slug: eclipse-for-php%e6%8a%a5%e9%94%99clipse-is-running-in-a-jre%ef%bc%8c-but-a-jdk-is-required%e5%bf%ab%e6%8d%b7%e9%94%ae%e6%b3%a8%e9%87%8a%e4%b8%8d%e8%83%bd%e7%94%a8
title: eclipse for php报错clipse is running in a JRE， but a JDK is required快捷键注释不能用
wordpress_id: 193
categories:
- 实用软件技巧
tags:
- 实用软件技巧
---

或者由于jdk或jre运行不正确，或者因为安装问题，或者你是64位系统，总之不知道是什么原因导致我的eclipse经常报错即在控制台出现错误提示：

clipse is running in a JRE， but a JDK is required，同时我不能像以前一样使用ctrl+/或者ctrl+shift+/的形式来注释我的代码，甚至直接用鼠标点击菜单中的添加块注释也是不能用的。

解决第一个问题：

找到eclipse安装路径找到eclipse.ini，编辑，找到有-vm 的一行，我是64位系统，安装的32的eclipse和32的jdk，并且把jdk安装在了Program Files (x86)中

所以我改成：其中Progra~1代表了Program Files (x86)

-vm C:\Progra~1\Java\jdk1.7.0_13\bin\javaw.exe

如果你的在Program Files 中，就容易了，直接换成Program Files (x86)就可以或者Progra~2

这个时候我发现不报错了，而且我的注释代码功能也可以用了。


