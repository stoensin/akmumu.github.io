---
author: admin
comments: true
date: 2012-10-12 09:10:00+00:00
layout: post
slug: vmware%e8%99%9a%e6%8b%9f%e6%9c%ba%e4%b8%8b%e4%b8%baubuntu-12-04-1%e9%85%8d%e7%bd%ae%e9%9d%99%e6%80%81ip%ef%bc%88nat%e6%96%b9%e5%bc%8f%ef%bc%89
title: VMWare虚拟机下为Ubuntu 12.04.1配置静态IP（NAT方式）
wordpress_id: 92
categories:
- LINUX
- 操作系统
tags:
- linux
- 操作系统相关
---




背景




在虚拟机下运行操作系统，尤其是Linux系统已经是非常常见的做法。有时你想在虚拟机下搭建一个(模拟)服务器来供主机访问，比如搭建一个telnet/ssh。此时你会发现，每次启动虚拟机，VMWare为虚拟机系统分配一个动态IP，这样每次去连接虚拟机的telnet时很不方便。如果设成静态IP就好了。




VMnet8和NAT




如果你的虚拟机是以NAT方式连入互联网的话，那么虚拟机的IP地址非配，网关以及互联网访问权限均由VMWare提供的叫做VMnet8虚拟网卡所提供。所以一切和设置静态IP有关的设置都可以从这里找到。通VMnet8虚拟网卡，主机可以访问虚拟机的IP，虚拟机可以连入主机的互联网连接连入外网。




确认VMnet8虚拟网卡已启用




在默认情况下，VMWare Workstation已经启用VMnet8虚拟网卡，Windows 7下，通过进入 控制面板>网络和Internet>网络和共享中心>更改适配器设置 可以查看该虚拟网卡的状态。如图1-1所示。




![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/pic002_cnblogs_2012092723183878.png)




图1-1




得到可用IP范围、网关和子网掩码




在VMWare主界面，点击Edit>Virtual Network Editor菜单进入虚拟网卡参数设置界面（图1-2）。选择VMnet8条目，点击NAT Settings按钮后可以看到我们的VMWare Workstation为NAT连接的虚拟机设定的默认网关，此处为192.168.91.2，以及子网掩码，此处为255.255.255.0, 如图1-3所示。




![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/pic002_cnblogs_2012092723263982.png)




图1-2




![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/pic002_cnblogs_2012092723281589.png)




图1-3




点击DHCP Settings按钮，可以看到VMnet8为虚拟机分配的可用的子网IP范围，如图1-4所示。




![](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/pic002_cnblogs_2012092723315018.png)




图1-4




此处，我们的子网IP可用范围为192.168.91.128~192.168.91.254




OK，至此，所有我们需要的信息都已经获取到，这里汇总一下，




- 子网IP可用范围：192.168.91.128~192.168.91.254




- 子网掩码：255.255.255.0




- 网关: 192.168.91.2




下面开始进入Ubuntu虚拟机设置静态IP。







在Ubuntu 12.04.1中设置静态IP




1. 启动虚拟机Ubuntu系统，打开终端，利用如下命令打开并编辑网络接口配置文件：




sudo vi /etc/network/interfaces




2. 编辑文件如下：




auto lo  

iface lo inet loopback  

  

# Assgin static IP by eric on 26-SEP-2012  

iface eth0 inet static  

address 192.168.91.200 #change to your static IP  

netmask 255.255.255.0 #change to your netmask  

gateway 192.168.91.2 #change to your getway  

#We must specify dns-nameserver here  

#in order to get internet access from host  

dns-nameservers 192.168.91.2  

auto eth0




说明




address是你要分配给你虚拟机的静态IP地址，可以从刚才我们找到的可用的子网IP范围中随便选择一个放在此处。




netmask是子网掩码




gateway是网关




注意：在相对较早的版本中，你需要设置/etc下的resolv.conf文件，并加入nameserver，这样才可以连接互联网。但在Ubuntu 12.04之后，已经不推荐这种方式了，因为无论你想该配置文件中设置什么值，重新启动之后都会被还原为初始状态。推荐的做法是直接在interfaces配置文件中加入dns-nameserver <网关IP>这一行。




3. 重启ubuntu的网卡




sudo /etc/init.d/networking restart




4. ping测试互联网连通性




ping www.baidu.com




如果ping有响应，那么恭喜你，你已经成功将虚拟机设置为静态IP，并且也已连入互联网。



