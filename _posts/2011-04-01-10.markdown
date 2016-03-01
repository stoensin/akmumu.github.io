---
author: admin
comments: true
date: 2011-04-01 04:38:00+00:00
layout: post
slug: php%e7%a8%8b%e5%ba%8f%e8%ae%be%e8%ae%a1zend-framework%ef%bc%88zf%ef%bc%89invalid-controller-specified%e7%9c%9f%e6%ad%a3%e8%a7%a3%e5%86%b3%e5%8a%9e%e6%b3%95
title: PHP程序设计Zend Framework（ZF）Invalid controller specified真正解决办法
wordpress_id: 10
categories:
- PHP
tags:
- php程序设计
---




近来在研究ZF，其中新手总会把下载来的代码运行看下效果，或者是复制一下运行，我也是一样，无脑出现了一个错误叫做：










'Invalid controller specified 







  
**Fatal error**: Uncaught exception 'Zend_Controller_Dispatcher_Exception' with message 'Invalid controller specified (My_All)' in D:/wamp/www/My_All/2011/tiesuo/zend/library/Zend/Controller/Dispatcher/Standard.php:248 Stack trace: #0 D:/wamp/www/My_All/2011/tiesuo/zend/library/Zend/Controller/Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http)) #1 D:/wamp/www/My_All/2011/tiesuo/zend/index.php(27): Zend_Controller_Front->dispatch() #2 {main} thrown in **D:/wamp/www/My_All/2011/tiesuo/zend/library/Zend/Controller/Dispatcher/Standard.php** on line **248**




这么很多的错误，网上搜了没看到比较理想的结果，都是特别专业的，看不太懂，最后才发现原来错误在项目路径




$frontController->setBaseUrl('/zends')//设置基本路径




这句话，把zends改成你自己项目文件夹的名字就好了，呵呵



