---
author: admin
comments: true
date: 2014-05-07 14:07:27+00:00
layout: post
slug: securecrt%e8%bf%9e%e6%8e%a5linux%e6%98%be%e7%a4%bamysql%e8%ae%b0%e5%bd%95%e4%b8%ad%e6%96%87%e4%b9%b1%e7%a0%81
title: 'SecureCRT连接Linux显示Mysql记录中文乱码 '
wordpress_id: 271
categories:
- LINUX
- MYSQL
- 实用软件技巧
---

一 查看Linux主机系统字符集 echo $LANG

en_US.UTF-8
二  ssh客户端character encoding默认设置为default，只要改成指定UTF-8即可在终端上显示中文。

SecureCRT设置：(在打开会话以后可以直接设置会话选顶)选项(Options)->会话选项(Session Options)->外观(Appearance)->字符(character encoding)，选择UTF-8    默认字体Normal font可选一个中文字体 新宋体 10PT。

三 备注1 查看mysql的字符集设置

查看mysql server字符集系统变量：
mysql>show variables like 'character_%';
mysql>show variables like 'collation%';
最终客户端连接的字符集是由:

备注2 客户端连接时可以指定字符集

**mysql --default-character-set=utf8**

备注3 在配置文件指定字符集  更改配置文件后需重启服务才会生效

[client]

set character_set_results=utf8

[mysql]

set character_set_results=utf8
