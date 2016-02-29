---
author: admin
comments: true
date: 2012-05-08 01:01:00+00:00
layout: post
slug: '%e5%9c%a8sqlserver%e4%b8%ad%e5%af%bc%e5%85%a5mysql%e5%af%bc%e5%87%ba%e7%9a%84sql%e6%96%87%e4%bb%b6%e7%9a%84%e5%8a%9e%e6%b3%95'
title: 在sqlserver中导入mysql导出的sql文件的办法
wordpress_id: 26
categories:
- MYSQL
tags:
- Mysql
---




    
    <span style="font-size:24px">1.安装<a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=Smysql%E6%95%B0%E6%8D%AE%E5%BA%93&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">mysql数据库</a>的ODBC驱动，mysql-connector-odbc-3.51.19-win32.msi，下载地址</span>



    
    <span style="font-size:24px">http://www.mysql.com/downloads/connector/odbc/
    </span>



    
    <span style="font-size:24px">找到对应的windows底下的mysql-connector-odbc下载压缩包。
    2.打开<a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E6%8E%A7%E5%88%B6%E9%9D%A2%E6%9D%BF&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">控制面板</a><a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E7%AE%A1%E7%90%86%E5%B7%A5%E5%85%B7&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">管理工具</a><a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E6%95%B0%E6%8D%AE%E6%BA%90&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">数据源</a>ODBC，在用户DSN中添加一个MySQL ODBC 3.51数据源。
    3.在登录login选项卡中输入数据源名称Data Source Name，此处输入MysqlDNS（也可以自己随便命名，只要在后面导入数据的时候选择正确的数据源名字就行）；然后输入服务器Server，用户 User，密码Password，输入正确后选择要导入的<a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E6%95%B0%E6%8D%AE%E5%BA%93&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">数据库</a>。在连接选项connect options中根据需要设置MySql使用的端口port和<a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E5%AD%97%E7%AC%A6%E9%9B%86&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">字符集</a>Character Set。
    注：字符集一定要和Mysql服务器相对应，如果Mysql使用了gbk字符集，则一定要设置字符集为gbk，否则导入到Sql Server可能会出现问号乱码。
    4.打开sql server<a style="color:rgb(0,85,153); text-decoration:none; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:rgb(0,85,153)" href="http://wenwen.soso.com/z/Search.e?sp=S%E4%BC%81%E4%B8%9A%E7%AE%A1%E7%90%86%E5%99%A8&ch=w.search.yjjlink&cid=w.search.yjjlink" target="_blank">企业管理器</a>，新建一数据库自己命名，我取名为MySql。选择该数据库，单击右键选择所有任务导入数据。
    5.选择数据源为刚刚安装的mySQL数据源</span>



