---
author: admin
comments: true
date: 2012-09-28 05:56:00+00:00
layout: post
slug: windows%e4%b8%8bwamp%e5%ae%89%e8%a3%85php5-3%e6%89%a9%e5%b1%95memcache
title: windows下wamp安装php5.3扩展memcache
wordpress_id: 81
categories:
- PHP
- 操作系统
tags:
- php程序设计
- 操作系统相关
---

网上虽然有很多安装方法，但是看了无数个也没安装成个php的扩展，一直不能加载，还是自己慢慢弄吧

安装扩展最重要的一步就是下载正确的dll文件

我使用的是wamp，他的php版本为5.3.3，网上那些教程中给的全是5.2的memcache扩展文件，你下载下来也加载不了，或者有的给的5.3的却是vc9的，要知道我使用的wamp是使用apache做服务器的，相信大家也都是用apache做服务器的，所以适应我的是vc6的版本，最给力的就是直接搜索你php版本的文件，我提供你哥关键词php_memcache-5.3-VC6-x86.zip，就像这样搜索，你要5.2就换成5.2,64位就换成x64，谷歌一下[http://lmgtfy.com/?q=php_memcache-5.3-VC6-x86.zip](http://lmgtfy.com/?q=php_memcache-5.3-VC6-x86.zip)，这样各种论坛啊，csdn啊什么的资源就出现了，下载即可。下面给出我5.3使用成功的dll文件，你可以下载。[php_memcache-5.3-VC6-x86.zip](http://download.csdn.net/detail/akmumu2010/6300779)

dll文件下载成功以后，将php_memcache.dll放在 php的ext目录下。我这里是D:wampbinphpphp5.3.3ext  

2、为php配memcached扩展  

打开php.ini添加一行  

extension=php_memcache.dll  

如果你php.ini已经有这个扩展那就不需要咱添加了。如果extension=php_memcache.dll签名有个“；”则需要把这个“；”去掉  

所有上面三步都做完之后， 重启apache。  

重启好apache 以后看看phpinfo的输出结果。  

如果有memcached 这项输出，说明memcached扩展已经添加成功。

![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/img_my_1348802957_7758.jpg)

这里我们看到了扩展已经加载成功了




Windows下的Memcache安装：
1. 下载[memcache](http://code.jellycan.com/memcached/)[ ](http://code.jellycan.com/memcached/)的 windows稳定版，解压放某个盘下面，比如在c:memcached
2. 在终端（也即cmd命令界面）下输入 ‘c:memcachedmemcached.exe -d install’ 安装




3. 安装后请在服务中将memcached启动





![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/img_my_1348812279_7560.jpg)





或者从终端. 再输入： ‘c:memcachedmemcached.exe -d start’ 启动。NOTE: 以后memcached将作为windows的一个服务每次开机时自动启动。这样服务器端已经安装完毕了。





测试一下吧，用php写个脚本







    
    <?php
    $mem = new Memcache;  
    $mem->connect("localhost", 11211); 
    $mem->set('key', 'hello akmumu!', 0, 60);  
    $val = $mem->get('key');  
    echo $val;  
    ?>


成功显示


hello akmumu!





这就说明安装一切成功了




下面这是转载别人的，我没遇到这错误




以管理员身份进入命令行，运行安装命令：memcached
-d install -l 127.0.0.1 -m 1024 -c 2048  

参数说明：  

-d install 安装为Windows服务  

-l 绑定的IP  

-m 使用的最大内存（MB）,默认64M  

-c 最大并发连接数，默认1024  

3. 出现错误：This application has failed to start because MSVCR71.dll was not found. Re-installing the application may fix this problem.  

解决方法：继续到[http://code.jellycan.com/memcached/](http://code.jellycan.com/memcached/) 下载memcached
1.2.5，解压后将其中的msvcr71.dll文件复制到刚才的Memcached Win32 1.2.6目录中。  

4. 继续运行安装命令，安装成功，但发现后面的参数（-l 127.0.0.1 -m 1024 -c 2048）并没有加到服务的运行命令中。解决方法：打开注册表，找到  

HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesmemcached Server， 在其中有一个ImagePath项，值为"d:memcachedmemcached.exe" -d runservice，在后面加上-l
127.0.0.1 -m 1024 -c 2048。  

5. 启动服务，安装完成。








memcached的基本设置：




-p 监听的端口




-l 连接的IP地址, 默认是本机




-d start 启动memcached服务




-d restart 重起memcached服务




-d stop|shutdown 关闭正在运行的memcached服务




-d install 安装memcached服务




-d uninstall 卸载memcached服务




-u 以的身份运行 (仅在以root运行的时候有效)




-m 最大内存使用，单位MB。默认64MB




-M 内存耗尽时返回错误，而不是删除项




-c 最大同时连接数，默认是1024




-f 块大小增长因子，默认是1.25




-n 最小分配空间，key+value+flags默认是48




-h 显示帮助<-->


比如我试了试，你可以看，这算英文帮助了，呵呵



![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/img_my_1348812205_8774.jpg)




下面给个网址，有最新的memcached和需要的东西

[http://code.jellycan.com/memcached/](http://code.jellycan.com/memcached/)
