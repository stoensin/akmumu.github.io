---
author: admin
comments: true
date: 2015-06-18 11:52:33+00:00
layout: post
slug: mac%e4%b8%8bphpstrom%e9%85%8d%e7%bd%aexdebug
title: Mac下PhpStrom配置Xdebug
wordpress_id: 362
categories:
- mac
- PHP
- 实用软件技巧
tags:
- phpstrom
- xdebug
---

# Mac的PhpStrom配置Xdebug




## Xdebug简介


**Xdebug**(远程)调试器允许测试数据结构，步进并且调试你的代码。Xdebug提供了两种协议用于与其进行交互：在Xdebug1.3和2中旧的_GDB_协议和Xdebug2中实现的_DBGp_协议。


## 配置步骤




### 1、说明


使用Xdebug的调试，Xdebug作为一个嵌入到PHP的程序，扮演着客户端的角色，而IDE则作为服务器。当我们在浏览器上或者在IDE上通过参数告诉Xdebug进行调试，Xdebug将会不断的将数据冲击到接受的服务器也就是IDE，例如Phpstrom、zendstudio等。


### 2、使php支持Xdebug


为了启用Xdebug的调试器，你需要在**php.ini**文件中做一些配置。当然大部分参数用默认即可，不用再做修改，但有几个参数还是需要注意，下面是一份很简单的ini配置

    
    <code>zend_extension=/usr/local/php5/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so
    [xdebug]
    xdebug.remote_enable=on
    xdebug.default_enable=on
    xdebug.remote_autostart=off
    xdebug.remote_port=9001
    xdebug.remote_host=localhost
    </code>


这里的host和port是IDE上监听的。像上面说的，一旦Xdebug收到调试的要求，他将冲击这里配置的ip和端口


### 3、Phpstrom的配置





	
  * 首先修改Preferences->PHP->Debug 中设置的Xdebug端口，这里是和php.ini中的remote_port一样的9001 [![php-xdebug-port](http://akmumu-wordpress.stor.sinaapp.com/uploads/2015/06/php-xdebug-port.jpg)](http://akmumu-wordpress.stor.sinaapp.com/uploads/2015/06/php-xdebug-port.jpg)

	
  * 修改run->edit configurations 增加一个php web application， 增加一个server，写好你的host，port，这里是你server php的服务，例如nginx，debugger选择Xdebug，下面如果是remote或mount的代码，自己配置一下即可。

	
  * 这个时候环境就搭好了，设置你需要的断点，点爬虫的标志就可以进行调试了。

	
  * 另外还可以使用浏览器插件Xdebug Helper for Chrome来增强。




## 附录（相关配置）





	
  * **xdebug.extended_info**
Type: integer, Default value: 1
控制Xdebug是否应该强制PHP解释器使用'extended_info'模式；这使得Xdebug可以使用远程调试器对文件或者行设置断点。当对脚本进行堆栈跟踪或者是性能调试的时候通常希望关闭这个选项，因为为PHP增加的一些调试属性将会减慢脚本的执行，影响最终结果。这个属性只能在php.ini文件中设置，不能够在脚本中通过ini_set()函数进行设置。

	
  * **xdebug.idekey**
Type: string, Default value: complex
控制Xdebug应该传递给DBGp调试处理器那一个IDE key。默认情况下是基于环境配置的。首先，环境变量中的DBGP_IDEKEY会被使用，然后是USER和USERNAME。默认会使用在环境变量中第一次发现的配置值，如果找不到配置，则使用默认的''。如果设置了这个选项，它将会覆盖环境变量的配置。

	
  * **xdebug.remote_autostart**
Type: boolean, Default value: 0
通常情况下，你需要使用指定的HTTP GET/POST变量去激活Xdebug的远程调试功能。当这个设置为1的情况下，Xdebug将在脚本执行时总是尝试去连接调试客户端，即使没有设置GET/POST/COOKIE变量。＝

	
  * **xdebug.remote_connect_back**
Type: boolean, Default value: 0, Introduced in Xdebug > 2.1
如果允许的话，xdebug.remote_host设置将会被失效，Xdebug将会尝试连接发送HTTP请求的计算机的调试客户端。他将会检查$_SERVER['REMOTE_ADDR']变量，查找所使用的IP地址。请注意，这里没有可用的过滤器，任何连接到webserver的人都可以开始一个调试会话，即使他们的IP地址与xdebug.remote_host并不相同。

	
  * **xdebug.remote_cookie_expire_time**
Type: integer, Default value: 3600, Introduced in Xdebug > 2.1
这个选项用于控制调试会话可用的时间。

	
  * **xdebug.remote_enable**
Type: boolean, Default value: 0
这个选项控制是否允许远程调试，如果无法建立连接的话脚本将会继续执行，就像这个配置的值为0一样。

	
  * **xdebug.remote_handler**
Type: string, Default value: dbgp
这个值可以是php3，用于使用旧式的PHP 3样式的调试输出，gdb用于允许使用GDB的调试器接口或者dbgp协议。DBGp协议是唯一支持的协议。 注意: Xdebug 2.1 和之后的版本只支持dbgp协议。

	
  * **xdebug.remote_host**
Type: string, Default value: localhost
选择调试客户端运行在那个主机上，这个选项可以使用主机名或者是IP地址。如果xdebug.remote_connect_back选项指定了的花该选项将会被忽略。

	
  * **xdebug.remote_log**
Type: string, Default value:
如果设置了这个值，将会使用它作为文件名，所有的远程调试连接都会被记录到该日志文件中。这个文件总是以追加模式打开，因此，默认情况下不要覆写它。这里没有进行并发保护。日志文件的格式类似于下面：



    
    <code>Log opened at 2007-05-27 14:28:15  
    -> <init xmlns="urn:debugger_protocol_v1" xmlns:xdebug="http://xdebug.org/dbgp/x ... ight></init>
    
    <- step_into -i 1
    -> <response xmlns="urn:debugger_protocol_v1" xmlns:xdebug="http://xdebug.org/db ... ></response>
    </code>





	
  * **xdebug.remote_mode**
Type: string, Default value: req
选择调试连接什么时候建立。这个选项有两个不同的值: req Xdebug将会当脚本执行开始的时候立即连接到调试客户端。 jit Xdebug 只会在脚本发生错误的情况下尝试去连接调试客户端。

	
  * **xdebug.remote_port**
Type: integer, Default value: 9000
Xdebug用于连接客户端的端口号。默认端口为9000. 相关函数 bool xdebug_break() 给调试客户端发送一个断点，这个函数让调试器在指定的行上设置一个断点。


