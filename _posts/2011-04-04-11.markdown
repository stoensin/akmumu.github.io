---
author: admin
comments: true
date: 2011-04-04 12:55:00+00:00
layout: post
slug: apache-virtualhost%e9%85%8d%e7%bd%ae%e6%88%90%e5%8a%9fwamp%e8%99%9a%e6%8b%9f%e4%b8%bb%e6%9c%ba%e9%85%8d%e7%bd%ae-%e7%99%be%e5%ba%a6%e7%a9%ba%e9%97%b4_%e5%ba%94%e7%94%a8%e5%b9%b3%e5%8f%b0
title: Apache VirtualHost配置成功/Wamp虚拟主机配置 百度空间_应用平台
wordpress_id: 11
categories:
- PHP
tags:
- php程序设计
---
















今天在研究虚拟主机的配置，觉得这个很有意思，然后再自己的本地电脑做实验，在网上找了几个，终于配置成功了，说说我的配置方法。  
1 编辑httpd.conf，查找Include conf/extra/httpd-vhosts.conf，把前面注释符号"#"删掉。  
2 编辑httpd-vhosts.conf，我把WAMPServer安装在D:/wamp，所以我这里的路径是D:/wamp/Apache2/conf/extra。   



把里面的内容清空掉，换成下面的内容：




NameVirtualHost *:80  
<VirtualHost *:80>  
ServerName www.host1.com  
ServerAlias www.host1.com  
DocumentRoot "D:/wamp/www/host1"  
</VirtualHost>  
<VirtualHost *:80>  
ServerName www.host2.com  
ServerAlias www.host2.com  
DocumentRoot "D:/wamp/www/host2"  
</VirtualHost>




3 编辑httpd.conf，找到DocumentRoot "d:/wamp/www/"这项，这是默认根目录路径，但是要更改的不是这个，一直往下找，找到<Directory "d:/wamp/www">，然后在该</Directoory>后加上如下内容：




<Directory "d:/wamp/www/host1">




Options Indexes FollowSymLinks


AllowOverride all  
Order Allow,Deny  
Allow from all  
</Directory>  
  
<Directory "d:/wamp/www/host2">  
Options Indexes FollowSymLinks  
AllowOverride all  
Order Allow,Deny  
Allow from all  
</Directory>  
  
4 修改C:/WINDOWS/system3/drivers/etc/host这个文件，用记事本打开，加上如下内容:  
127.0.0.1 www.host1.com  
127.0.0.1 www.host2.com  
  
好了，然后重启apache，在浏览器里面输入www.host1.com，看看访问到的内容是不是host1这个目录呢。  
















