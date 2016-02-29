---
author: admin
comments: true
date: 2012-09-29 02:49:00+00:00
layout: post
slug: linux%e4%b8%8b%e5%ae%89%e8%a3%85memcacheq%ef%bc%88mcq%ef%bc%89%e5%85%a8%e8%bf%87%e7%a8%8b%e7%ac%94%e8%ae%b0
title: linux下安装memcacheq（mcq）全过程笔记
wordpress_id: 82
categories:
- LINUX
- PHP
- 操作系统
tags:
- linux
- php程序设计
- 操作系统相关
---







memcacheQ是一个单纯的分布式消息队列服务。




一，MEMCACHEQ的应用背景




Web应用中为什  

么会需要消息队列？主要原因是由于在高并发环境下，由于来不及同步处理，请求往往会发生堵塞，比如说，大量的insert，update之类的请求同时到  

达mysql，直接导致无数的行锁表锁，甚至最后请求会堆积过多，从而触发too   

manyconnections错误。通过使用消息队列，我们可以异步处理请求，从而缓解系统的压力。在Web2.0的时代，高并发的情况越来越常见，从  

而使消息队列有成为居家必备的趋势，相应的也涌现出了很多实现方案，像Twitter以前就使用RabbitMQ实现消息队列服务，现在又转而使用  

Kestrel来实现消息队列服务，此外还有很多其他的选择，比如说：ActiveMQ，ZeroMQ等。  

  

上述消息队列的软件中，大多为了实现AMQP，STOMP，XMPP之类的协议，变得极其重量级，但在很多Web应用中的实际情况是：我们只是想找到一个缓解高并发请求的解决方案，不需要杂七杂八的功能，一个轻量级的消息队列实现方式才是我们真正需要的。  






二，MEMCACHEQ的特性




1 简单易用  

2 处理速度快  

3 多条队列  

4 并发性能好  

5 与memcache的协议兼容。这就意味着只要装了memcache的extension就可以了，不需要额外的插件。




三，安装




MEMCACHEQ依赖于libevent和BerkleyDB。  

BerkleyDB用于持久化存储队列的数据。 这样在MEMCACHEQ崩溃或者服务器挂掉的时候，  

不至于造成数据的丢失。这一点很重要，很重要。




它的安装依赖于BerkeleyDB 和 libevent，所以要先安装这BerkeleyDB和libevent：







其中libevent如果你安装过memcached就已经安装了，如果不确定，就检查一下吧




1. 先检查libevent, libevent-devel是否已经安装： rpm -qa|grep libevent 输出中必须包含libevent, libevent-deve, 如果缺失，使用以下命令安装：




yum install libevent yum




install libevent-devel




注意事项：libevent, libevent-devel优先使用yum安装源，光盘镜像中的rpm包安装，这样稳定性和兼容性可得到保证，网上流传的使用源码安装libevent的方法会有问题，因为很可能系统已经安装libevent, 再使用源码安装， 必然导致冲突，造成意外问题，所以一定要使用上述命令检查系统是否已经安装相应的库




2. 安装BerkleyDB




1.tar zxvf bdb-5.3.3.tar.gz




2.cd db-5.3.3/




#需要进入特定操作系统编译环境，更常规软件的编译有些区别




3.cd build_unix/




4. ../dist/configure --prefix=/usr/local/berkeleydb




#如果没有指定特殊安装路径，编译完成，需要将Berkeley Db运行库的路径添加到系统配置里面  

echo "/usr/local/BerkeleyDB.5.3/lib/" >> /etc/ld.so.conf  

#重载系统Ld运行库  

ldconfig




5. make & make install




记得改/etc/ld.so.conf文件，添加/usr/local/BerkeleyDB.5.3/lib啊，不然后面的mcq会安装错误。







而BerkeleyDB就要去下载了




下面是Berkeley DB 5.3.21.tar的下载地址




[http://download.csdn.net/detail/akmumu2010/4606021](http://download.csdn.net/detail/akmumu2010/4606021)







下面安装memcacheq，




先下载一个memcacheq-0.2.0.tar.gz




[http://download.csdn.net/download/akmumu2010/4606050](http://download.csdn.net/download/akmumu2010/4606050)







解压，进目录




./configure –with-bdb=/usr/local/BerkeleyDB.5.1 –with-libevent=/usr/local/lib –enable-threads




make  

make install




关键是红色字体那一步，一定输入正确，不然make不通过，无法安装







下面是启动




memcacheq -d -r -u root -p21201 -H /data/memcacheq -N -v -L 1024 -B 1024 > /data/mq_error.log 2>&1




这里不推荐使用root用户，有些帖子里说不可以，我这里测试是可以的，不过可能会不安全。




1 下面是启动时候的参数







使用memcacheq -h 的命令来查看命令行选项




2 这个是正确的启动memcacheq：memcacheq -d -uroot -r -p11212 -H /home/wwwroot/mcq -N -R -v -L 1024 -B 1024 > /home/wwwlogs/mq_error.log 2 > &1




3 这个不知道为什么就不行/usr/local/memcacheq/bin/memcacheq -d -l 127.0.0.1 -A 8192 -H /data/memcacheq -B 65535 -N -R -u root




-p <num> TCP监听端口(default: 22201)  

-U <num> UDP监听端口(default: 0, off)  

-s <file> unix socket路径(不支持网络)  

-a <mask> unix socket访问掩码(default 0700)  

-l <ip_addr> 监听网卡  

-d 守护进程  

-r 最大化核心文件限制  

-u <username> 以用户身份运行(only when run as root)  

-c <num> 最大并发连接数(default is 1024)  

-v 详细输出 (print errors/warnings while in event loop)  

-vv 更详细的输出 (also print client commands/reponses)  

-i 打印许可证信息  

-P <file> PID文件  

-t <num> 线程数(default 4)  

--------------------BerkeleyDB Options-------------------------------  

-m <num> BerkeleyDB内存缓存大小, default is 64MB  

-A <num> 底层页面大小, default is 4096, (512B ~ 64KB, power-of-two)  

-H <dir> 数据库家目录, default is '/data1/memcacheq'  

-L <num> 日志缓冲区大小, default is 32KB  

-C <num> 多少秒checkpoint一次, 0 for disable, default is 5 minutes  

-T <num> 多少秒memp_trickle一次, 0 for disable, default is 30 seconds  

-S <num> 多少秒queue stats dump一次, 0 for disable, default is 30 seconds  

-e <num> 达到缓存百分之多少需要刷新, default is 60%  

-E <num> 一个单一的DB文件有多少页, default is 16*1024, 0 for disable  

-B <num> 指定消息体的长度,单位字节, default is 1024  

-D <num> 多少毫秒做一次死锁检测(deadlock detecting), 0 for disable, default is 100ms  

-N 开启DB_TXN_NOSYNC获得巨大的性能改善, default is off  

-R 自动删除不再需要的日志文件, default is off




测试




三、测试




1.telnet 10.218.31.121 22201




2.stats




2.stats queue




3.set q4 0 0 5




4 hello




5 get q4




6 stats queue




7 delete q4




如果set的时候补成功not_STORED的话，检查一下你的启动命令吧，参数没设置好，如果你是新手，干翠多看几个帖子，多尝试启动命令，换换参数，就行了




五，使用




使用以上命令启动mq后，（注意上面的-B参数表示messag的body长度不能超过1024 bytes），使用mq时只需要用到两个命令：set和get：




set <queue name> <flags> 0 <message_len>rn




<put your message body here>rn




STOREDrn




get <queue name>rn




VALUE <queue name> <flags> <message_len>rn




<your message body will come here>rn




ENDrn




可以看到，和[memcache协议](http://web2.0coder.com/?p=199)基本一致，只是把key name换成queue name，而且在set的命令中，忽略了expire_time的参数。毕竟mq的数据存储是存在berkeleyDB中，做了持久化存储，没有内存的过期时间。




当使用set命令时，就向指定的消息队列中写入了一条新消息，也就是向BerkeleyDB中新insert了一条数据，当使用get命令时，就从 指定队列中取出一条新消息，也就是向BerkeleyDB中delete了一条数据。当使用stats查看一个指定队列时，可以看到这个队列一共接收了多 少消息，其中被取出了多少条。




示例：




fengbo@onlinegame-10-121:~$ telnet 127.0.0.1 22202




Trying 127.0.0.1…




Connected to 127.0.0.1.




Escape character is ‘^]’.




set q4 0 0 5




hello




STORED




set q4 0 0 5




world




STORED




stats queue




STAT q4 2/0




END




get q4




VALUE q4 0 5




hello




END




stats queue




STAT q4 2/1




END




上面执行了两次set的命令，使用stats queue查看时，可以看到q4的队列中共有消息2条，已取出0条；当使用get取出第一条后，再此使用stats queue查看，q4中消息有2条，其中已取出1条。




  






  






PHP测试：  

session_start();  

$memcache_obj = new Memcache;  

$memcache_obj->connect(‘127.0.0.1′, 11212) or die (“error”);




memcache_set($memcache_obj, ‘k’,10, 0, 0);




echo “queue”.memcache_get($memcache_obj, ‘k’);




memcache_close($memcache_obj);




  






注释：  

这个时候会出现这样的问题  

memcacheq: error while loading shared libraries: libdb-5.0.so: cannot open shared object file: No such file or directory




解决办法：在/usr/lib 下建个 libdb-5.0.so 软链就OK啦  

ln -s /usr/local/BerkeleyDB.5.0/lib/libdb-5.0.so /usr/lib/




六，关闭memcacheQ




使用ps命令查查memcacheQ的进程:ps -ef|grep wuf,然后直接将进程kill掉.






