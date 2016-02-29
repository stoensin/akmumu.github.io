---
author: admin
comments: true
date: 2012-09-25 09:00:00+00:00
layout: post
slug: '%e7%94%a8vmare%e5%ae%89%e8%a3%85linux-fedora%e8%bf%98%e6%9c%89vmware-tools%e5%ae%89%e8%a3%85%e9%94%99%e8%af%af%e7%ac%94%e8%ae%b0'
title: 用vmare安装linux-fedora还有vmware tools安装错误笔记
wordpress_id: 78
categories:
- 操作系统
tags:
- 操作系统相关
---




首先安装了vmware，准备好fedora的iso镜像，需要注意的是一定要在新建虚拟机的时候选择自定义-》我以后再安装操作系统，创建一个虚拟空白硬盘，按照步骤选择完之后再选择镜像进行安装，后面的步骤就和机器安装一样了，成了以后vmware提示安装vmware tools，我选择安装，点击安装后他就把vmware tools的镜像加载到了虚拟cd中，把其中的tar包复制出来，放到你能记住的文件夹下，然后解压tar
 -xzvf 文件名即可解压到当前，进入目录，运行./vmware-install.pl 即可，



下面的选项就按照默认值。一直回车，若出现下面的错误，照办就好  

Restoring the kernel initrd image.:  

File /etc/pulse/default.pa is backed up to /etc/pulse/default.pa.old.0.  

hal: 未被识别的服务 （不用管）





  

bash:./vmware-install.pl :/usr/bin/perl:bad interpreter:No such file or directory.  

如果出现这个提示，则表明系统没有安装Perl环境，可以使用如下命令来提供Perl支持：  

#yum install perl





  

Searching for GCC...  

The path "" is not valid path to the gcc binary.  

Would you like to change it? [yes]  

如果出现这个就表明gcc没有安装  

yum install gcc make   

将gcc和make一起装好





  







Searching for a valid kernel header path...  

The path "" is not valid.  

Would you like to change it? [yes]  

如果出现这个就表示kernel、kernel-devel、kernel-headers  

yum install kernel* 我将所有相关的都装上了  

，





重启一下，很重要





此时如果在VM中设置的文件夹共享，就能在/mnt/hgfs看到共享文件了。














VMware 安装了Ubuntu之后，在正常安装了VMware tools后，仍然不能正常的在Ubuntu与物理机之间自由的切换，每次都要按下ctrl+Alt，而且鼠标指针会经常性的离奇的失灵解决方法为：安装xserver-xorg-input-vmmouse命令：sudo apt-get install xserver-xorg-input-vmmouse然后重新启动即可






复制粘贴功能：windows和ubuntu之间不能实现拖拽文件，以及相互间不能copy文件和文本解决办法：将/usr/bin/vmware-user 加载到 System > Preferences > Sessions（系统 > 首选项 > 启动程序）,即启动项，然后在终端输入vmware-user start 马上生效  








