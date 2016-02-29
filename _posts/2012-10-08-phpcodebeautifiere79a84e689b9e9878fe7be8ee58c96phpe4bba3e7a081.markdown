---
author: admin
comments: true
date: 2012-10-08 05:47:00+00:00
layout: post
slug: phpcodebeautifier%e7%9a%84%e6%89%b9%e9%87%8f%e7%be%8e%e5%8c%96php%e4%bb%a3%e7%a0%81
title: phpCodeBeautifier的批量美化php代码
wordpress_id: 83
categories:
- PHP
- 实用软件技巧
tags:
- php程序设计
- 实用软件技巧
---

phpCodeBeautifier是一个非常不错的php代码美化工具，但是美中不足的是要使用它必须在命令行下使用非常长的命令参数来美化程序，更有一点不能忍受的是它一次只能美化一个程序文件的代码。

针对这些问题，我写了一个php的shell 脚本来解决这些问题。

下面有两个

主要功能：

使用phpCodeBeautifier批量美化php代码，一个命令就能自动把文件夹下所有的php文件（包括子文件夹）的代码美化完毕。

[![77a44578dc254e0f2abeda3f160b422220090424134326](http://akmumu-wordpress.stor.sinaapp.com/uploads/2012/10/77a44578dc254e0f2abeda3f160b422220090424134326.png)](http://akmumu-wordpress.stor.sinaapp.com/uploads/2012/10/77a44578dc254e0f2abeda3f160b422220090424134326.png)

程序代码批量美化步骤

请注意在美化操作前请务必备份自己原程序....

1.将phpCB.exe和phpcb.php拷贝到你要美化的php程序的文件夹里
例如 d:emlog
2.然后 开始 - 运行 输入 cmd
3.在命令行窗口输入 d:phpphp.exe d:emlogphpcb.php 后回车
注意 d:phpphp.exe 是本机php.exe的安装路径，请根据自己机器的PHP安装路径修改...
4.耐心等到输出 job done！提示后，代码就美化完成了。

下载地址如下[http://download.csdn.net/download/akmumu2010/4624929](http://download.csdn.net/download/akmumu2010/4624929)
