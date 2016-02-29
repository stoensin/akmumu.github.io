---
author: admin
comments: true
date: 2013-07-23 13:56:00+00:00
layout: post
slug: ubuntu%e4%b8%8b%e5%ae%89%e8%a3%85lnmp%e7%ac%94%e8%ae%b0
title: ubuntu下安装lnmp笔记
wordpress_id: 185
categories:
- LINUX
- MYSQL
- PHP
tags:
- linux
- Mysql
- php程序设计
---




一、安装PHP  






1、首先下载php，去官网下载最新的http://www.php.net/get/php-5.5.1.tar.gz/from/a/mirror




2、得到后解压缩 tar zxvf php-5.5.1.tar.gz 
之后cd进入php目录，并执行“sudo ./configure --prefix=/usr/local/server/php --with-config-file-path=/usr/local/server/php --enable-mbstring --enable-ftp --with-gd --with-jpeg-dir=/usr --with-png-dir=/usr --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pear --enable-sockets --with-freetype-dir=/usr --enable-gd-native-ttf --with-zlib --with-libxml-dir=/usr --with-xmlrpc --enable-zip --enable-fpm --enable-fpm --enable-xml --enable-sockets --with-gd --with-zlib
 --with-iconv --enable-zip --with-freetype-dir=/usr/lib/ --enable-soap --enable-pcntl --enable-cli”回车




这个时候可能会遇到以下问题，  






error: xml2-config not found. Please check your libxml2 installation




安装libxml2-dev即可  






configure: error: Cannot find libz




安装apt-get install zlib1g-dev即可




configure: error: jpeglib.h not found. 解决办法：   

安装apt-get install libjpeg-dev




configure: error: png.h not found




configure: error: png.h not found. 解决办法：   

# sudo apt-get install libpng++-dev




configure: error: freetype.h not found. 解决办法：   

# sudo apt-get install libfreetype6-dev




可能的错误又很多，上面是我遇到的，http://wenku.baidu.com/view/f84ea6c54028915f804dc27e.html这里挺全的  






![](http://img.blog.csdn.net/20130722232607734?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQUttdW11MjAxMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)




看到这个说明就成了。。




下面make，，make的过程很长。。。耐心等待。。  






Build complete.  

Don't forget to run 'make test'.




我又运行了make test，又是好久。。




然后make install




等待操作完成之后，复制启动脚本。输入“sudo cp ./sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm”回车，接着再执行“sudo chmod +x /etc/init.d/php-fpm”。




修改PHP-FPM配置文件，依次执行“cd /usr/local/server/php/etc”、“mv php-fpm.conf.default php-fpm.conf”、“vi php-fpm.conf”编辑配置文件




去掉25行的分号  






pid = run/php-fpm.pid




修改148，149行的nobody为当前用户名




user = mumu  

149 group = mumu，  

保存并退出。  

PHP-FPM启动及退出分别使用命令“/etc/init.d/php-fpm start”与“/etc/init.d/php-fpm stop”。




二、安装mysql




先下载一个mysql




解压tar zxvf mysql-5.6.12.tar.gz




进入cd mysql-5.6.12/




这个得使用cmake，先安装g++，rm CMakeCache.txt，再install bison，安装libncurses5-dev




记得删除CMakeCache.txt




出现成功的提示后可以make了，make会消耗很长时间并写入很多文件，请确保home下的磁盘够大约1G吧




之后makeinstall




cp suport-files/mysql.server /etc/init.d/mysql




可以通过/etc/init.d/mysql start启动




有时候会有错误，例如The server quit without updating PID file




这时查看etc下的my.cnf




[mysqld]




加上下面这句话  






datadir = /usr/local/server/mysql/data







初始化mysql root用户密码




sudo bin/mysqladmin -u root password '密码文字'







复制mysql.server脚本到/etc/init.d(初始化服务，有些人喜欢改成mysqld，在这里改就可以)




sudo cp support-files/mysql.server /etc/init.d/mysql.server







查看mysql运行状态




sudo service mysql.server status  

如果运行正常，会显示 MySQL running。




如果显示 not running，应该是前面没有启动服务，可直接用service mysql.server start启动




sudo service mysql.server [status|start|stop] 



  

可以通过./scripts/mysql_install_db来安装默认数据库


sudo chmod +x /etc/init.d/mysql这句也有用




让mysql开机启动[defaults]，取消开机启动[remove]




sudo update-rc.d -f mysql.server defaults [remove]




将mysql/bin/mysql命令加入到用户命令中，或将mysql/bin目录加入path




加入用户命令：




sudo ln -s /usr/local/mysql/bin/mysql /usr/local/bin/mysql




加入环境变量：




export PATH=$PATH:/usr/local/mysql/bin




登录的时候还有可能遇到这个问题




ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)




这个时候新建如上提示的目录/var/run/mysqld/，把/tmp/mysql.sock这个软连到哪个地方，即




ln -s /tmp/mysql.sock /var/run/mysqld/mysqld.sock就可以喽  






允许root用户远程登录




<blockquote>

> 
> 1>进入mysql: mysql –u root –p
> 
> 

> 
> 2>改变数据库: use mysql;
> 
> 

> 
> 3>从任意主机登录: grant all privileges on *.* to root@"%" identified by "密码文字" with grant option;
> 
> 

> 
> 4>从指定主机登录: grant all privileges on *.* to root@"192.168.1.101" identified by "passw0rd" with grant option;
> 
> 

> 
> 5>授权生效: flush privileges;
> 
> 

> 
> 6>查看host为%授权是否添加: select * from user;
> 
> 
</blockquote>


mysql安装成功


三、安装nginx




下载一个




ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/




编译安装它  






下载一个nginx




http://nginx.org/en/download.html




创建www用户组和www用户,并创建/home/www目录  

`  

groupadd www  

useradd -g www -s /sbin/nologin -M www  

mkdir /home/www  

chown -R www:www /home/www`  






`./configure --user=www --group=www --prefix=/usr/local/server/nginx-1.4.1 --with-http_stub_status_module --with-http_realip_module --with-http_addition_module --with-http_gzip_static_module --with-http_random_index_module
 --with-http_sub_module --with-http_dav_module  

make  

make install`  






prefix参数是nginx的安装位置，with-http_stub_status_module是打开status模块(查看nginx当前状态)  

http_realip_module 作为代理服务器时，服务端可获取到用户真实的IP  

http_addition_module 可在响应前后添加一个过滤器  

http_gzip_static_module 预压缩文件传前检查，防止文件被重复压缩  

http_random_index_module 随机主页  

如果在指定的location中指定，将为每一个请求扫描指定目录中的文件，并且随机选择一个代替index.html，但是不会选择以“.”开头的文件。  

http_sub_module 反向代理时替换URL  

http_dav_module 开启WebDAV扩展动作模块，可为文件和目录指定权限  

以上模块根据自己需要添加，官方模块列表:[http://wiki.nginx.org/Modules](http://wiki.nginx.org/Modules)




修改nginx.conf配置：  

vi /usr/local/server/nginx-1.4.1/conf/nginx.conf




头部添加  

`  

user www www;`  

使用www组的www用户启动nginx  

找到server location,修改www根目录  

`  

location / {  

root /home/www;  

index index.html index.htm;  

}`




```这个配置中有很多不合理的地方，其中一个明显的问题就是root指令被放到了location / 块。如果root指令被定义在location块中那么该root指令只能对其所在的location生效。其它locaiont中没有root指令，像location /images块不会匹配任何请求，需要在每个请求中重复配置root指令来解决这个问题。因此我们需要把root指令放在server块，这样各个location就会继承父server块定义的$document_root，如果某个location需要定义一个不同的$document_root，则可以在location单独定义一个root指令。`  






`为了强大，我们改成`




` root /home/www;  

index index.html index.htm index.php;`




`  

`




`启动nginx:  

/usr/local/server/nginx-1.4.1/sbin/nginx  

这个时候，一般会报错，提示:  

``  

error while loading shared libraries: libpcre.so.1: cannot open shared object file: No such file or directory  

`  

建立链接:  

32位系统:  

`  

ln -s /usr/local/lib/libpcre.so.1 /lib  

`  

64位系统:  

`  

ln -s /usr/local/lib/libpcre.so.1 /lib64`




```启动成功以后，在浏览器输入127.0.0.1可以看到欢迎语就好了`




````




# Welcome to nginx!




If you see this page, the nginx web server is successfully installed andworking. Further configuration is required.




For online documentation and support please refer to[nginx.org](http://nginx.org/).  

Commercial support is available at[nginx.com](http://nginx.com/).




_Thank you for using nginx._




这个时候服务器还不支持php，改下配置文件/usr/local/server/nginx-1.4.1/conf/nginx.conf




在66行把注释取消，并且留着67行的注释，




另一个问题就是fastCGI参数SCRIPT_FILENAME 是写死的。如果修改了root指令的值或者移动文件到别的目录，php-fpm会返回“No input file specified”错误，因为SCRIPT_FILENAME在配置中是写死的并没有随着$doucument_root变化而变化，我们可以修改SCRIPT_FILENAME配置如下：  






注意修改70行为fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;




location ~ .php$ {  

#67 root html;  

68 fastcgi_pass 127.0.0.1:9000;  

69 fastcgi_index index.php;  

70 fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;  

71 include fastcgi_params;  

72 }  

  

重启/usr/local/server/nginx-1.4.1/sbin/nginx -s reload




开机启动




第一步   

先运行命令关闭nginx   

sudo kill `cat /usr/local/nginx/logs/nginx.pid`   

  

第二步   

vi /etc/init.d/nginx




输入代码，红色部分根据自己目录修改




#! /bin/sh




PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin




DESC="nginx daemon"  

NAME=nginx  

DAEMON=/usr/local/nginx/sbin/$NAME  

CONFIGFILE=/usr/local/nginx/conf/$NAME.conf  

PIDFILE=/usr/local/nginx/logs/$NAME.pid  

SCRIPTNAME=/etc/init.d/$NAME




#我改成了下面的  






DAEMON=/usr/local/server/nginx-1.4.1/sbin/$NAME  

CONFIGFILE=/usr/local/server/nginx-1.4.1/conf/$NAME.conf  

PIDFILE=/usr/local/server/nginx-1.4.1/logs/$NAME.pid  

SCRIPTNAME=/etc/init.d/$NAME  






set -e  

[ -x "$DAEMON" ] || exit 0




do_start() {  

$DAEMON -c $CONFIGFILE || echo -n "nginx already running"  

}




do_stop() {  

kill -INT `cat $PIDFILE` || echo -n "nginx not running"  

}




do_reload() {  

kill -HUP `cat $PIDFILE` || echo -n "nginx can't reload"  

}




case "$1" in  

start)  

echo -n "Starting $DESC: $NAME"  

do_start  

echo "."  

;;  

stop)  

echo -n "Stopping $DESC: $NAME"  

do_stop  

echo "."  

;;  

reload|graceful)  

echo -n "Reloading $DESC configuration..."  

do_reload  

echo "."  

;;  

restart)  

echo -n "Restarting $DESC: $NAME"  

do_stop  

do_start  

echo "."  

;;  

*)  

echo "Usage: $SCRIPTNAME {start|stop|reload|restart}" >&2  

exit 3  

;;  

esac




exit 0


第三步   

chmod 777 /etc/init.d/nginx


完成！   

  

之后，就可以使用以下命令了   

service nginx start   

service nginx stop   

service nginx restart   

service nginx reload   

  

/etc/init.d/nginx start   

/etc/init.d/nginx stop   

/etc/init.d/nginx restart   

/etc/init.d/nginx reload







同样的修改了nginx的配置文件nginx.conf，也可以使用上面的命令重新加载新的配置文件并运行，可以将此命令加入到rc.local文件中，这样开机的时候nginx就默认启动了




vi /etc/rc.local




加入一行 /etc/init.d/nginx start 保存并退出，下次重启会生效。


  



到这里，lnmp环境就配置好了，去写代码吧




_  

_


  


