---
author: admin
comments: true
date: 2013-07-07 05:44:00+00:00
layout: post
slug: ubuntu%e5%ad%a6%e4%b9%a0%e7%ac%94%e8%ae%b0
title: ubuntu学习笔记
wordpress_id: 182
categories:
- LINUX
tags:
- linux
---




有一些和fedora不同的地方




**熟练 vim 操作是在 Linux 下生存的先决条件！**  

  

  

_**1. 切换 root 身份**_  









方法一：


$ sudo passwd root # 修改 root 密码  

$ su # 切换到 root 身份  



# exit # 回到用户身份




方法二：




$ sudo su # 输入用户自己的密码就可成为 root










_**2. 挂载分区**_  

  

Linux 将硬盘各分区看作 /dev 下的设备文件，形如 sda1, sda7, sdb1 等。  

$ sudo mount /dev/sda1 /mnt # 将硬盘第一个分区挂载到 /mnt 目录下  

$ sudo mount -t smbfs -o user=edelweiss //x.x.x.x/backup /mnt # 将另一台ip为 x.x.x.x 的电脑中的共享文件夹 backup 挂载到 /mnt 目录下  

  

  

_**3. 命令行配置网络**_  

  

$ sudo vi /etc/network/interfaces # 编辑网络接口配置文件  

添加如下内容：  

auto eth0  

iface eth0 inet static  

address x.x.x.x # ip地址  

netmask x.x.x.x # 子网掩码  

gateway x.x.x.x # 网关  

  

$ sudo vi /etc/resolv.conf # 如果该文件不存在就创建一个  

添加如下内容：  

nameserver x.x.x.x # DNS  

  

$ sudo /etc/init.d/networking restart # 重启网络  

  

这样做的好处是摆脱了 NetworkManager 的控制，登录后系统自动连网。  

  

  

_**4. apt 包管理器**_  

  

$ sudo vi /etc/apt/sources.list # 编辑源  

$ sudo apt-get update # 更新包信息  

$ sudo apt-get upgrade # 升级包  

$ sudo apt-get install PACKAGE # 安装PACKAGE包  

$ sudo apt-get remove PACKAGE # 卸载PACKAGE包  

  

常用的包有：build-essential, stardict, kchmviewer, vim, vim-gnome & vim-gtk (gvim), pidgin, ...  

  

  

_**5. 磁盘备份（本地、远程）**_  

  

$ dd if=/dev/sdb of=backup_usb # 在本地将整个U盘备份成backup_usb文件




$ dd if=/dev/sdb | ssh username@X.X.X.X "dd of=output_file" # 将本地的sdb设备拷贝到IP为X.X.X.X的主机，以用户名username登录，保存为output_file  

  

  

_**6. 查看磁盘空间**_  

  

$ df -ah  

  

  

_**7. 设置输入法**_  

  

$ im-switch -s ibus # 将ibus设置为默认输入法  

  

  

_**8. 在U盘中安装Ubuntu（以8.10为例）**_  

  

首先从 Ubuntu 官网下载镜像文件 ubuntu-8.10-desktop-i386.iso，刻录到光盘上并用它将 Ubuntu 装到U盘中（可用 Windows 下的 Nero 或者 Ubuntu 下自带的刻录工具）。接下来就要解决面临的两个问题：  

(1) 拔下U盘后本地系统无法启动  

插上U盘启动本地系统，下载“一键GHOST v2010.01.02”，安装后重启进入GHOST的DOS命令行界面，输入“fdisk /mbr”，本地 Windows 即可正常启动。  

(2) 本地 Ubuntu 无法启动  

重装GRUB：进入 Windows，下载“grub4dos 0.4.4”，解压后将这三个文件“grldr、grub.exe、menu.lst”拷贝到 C 盘根目录下。右键单击“我的电脑”，选择“属性”->“高级”->“设置（启动和故障恢复）”->“编辑”，在最后添加“C:GRLDR=grub4dos”，保存后重启电脑，进入grub4dos，输入“find /boot/grub/stage1”，记住返回的结果（形如(hdx,y)），这时会出现死机，重启再进入grub4dos，输入“root (hdx,y)”，x、y为刚才记住的结果，最后“setup
 (hd0)”，重启后GRUB恢复正常。  

  

至于 wubi 方式的安装，它只是把整个 Ubuntu 当成一个 root.disk 文件，是 Windows 的一个附属品，仍然不算彻底摆脱 Windows，只推荐新手试用 Ubuntu 时使用。  

  

  

_**9. 安装 Adobe Reader 8.1.7**_  

  

从adobe官网上下载AdobeReader_enu-8.1.7-1.i386.deb  

$ sudo dpkg -i AdobeReader_enu-8.1.7-1.i386.deb # 安装 Adobe Reader 8，默认装到 /opt 目录下  

  

下载中文语言包支持：http://www.adobe.com/go/acroasianfontpack  

得到FontPack81_chs_i486-linux.tar.gz  

$ tar xzf FontPack81_chs_i486-linux.tar.gz # 解压  

$ cd CHSKIT # 进入解压后的目录  

# ./INSTALL # 开始安装，默认装到 /opt 目录下  

  

  

_**10. 安装星际译王词典**_  

  

$ sudo apt-get install stardict # 安装 stardict 包  

从 http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/ 下载所需词典文件(.deb)，我常用的三个词典是：  

1. 朗道英汉字典 (stardict-langdao-ec-gb_2.4.2-2_all.deb)  

2. 朗道汉英字典 (stardict-langdao-ce-gb_2.4.2-2_all.deb)  

3. 牛津现代英汉双解词典 (stardict-oxford-gb_2.4.2-2_all.deb)  

$ sudo dpkg -i stardict-langdao-ec-gb_2.4.2-2_all.deb # 安装朗道英汉字典  

$ sudo dpkg -i stardict-langdao-ce-gb_2.4.2-2_all.deb # 安装朗道汉英字典  

$ sudo dpkg -i stardict-oxford-gb_2.4.2-2_all.deb # 安装牛津现代英汉双解词典  

  

  

_**11. 格式化成 ntfs 格式**_  

  

$ sudo apt-get install ntfsprogs # 安装ntfs程序包  

# mkfs.ntfs DEVICE # 格式化DEVICE设备，要快速格式化就加 -f  

  

  

_**12. 修改 initrd 文件**_  

  

$ mv initrd.img initrd.img.gz # 将 initrd.img 更名为 initrd.img.gz  

$ gunzip initrd.img.gz # 将其解压为 cpio 文档  

$ cpio -i < initrd.img # 解包，将产生许多文件，可根据需要进行修改  

$ rm initrd.img # 删掉旧的 initrd.img 文件  

$ find . | cpio -o -H newc | gzip -9 > /boot/initrd.img # 重新打包  

  

  

_**13. 用 wubi 安装的系统更新后没有原来的GRUB启动栏了，出现的是：  

  

**_


_**GNU GRUB version 1.97~beta4[ Minimal Bash-like line editing is suppored. For the first word, TAB lists possible command completions. Anywhere else TAB lists the possible completions of a device/filename. ]  

  

sh:grub>_**_  

  

依次输入下列命令：  

> ls # 列出若干形如 (hd0,x) 的信息  

> ls (hd0,x) # 依次尝试每个列出的 x 值，找到自己 ubuntu 的所在分区，假设为 (hd0,7)  

> insmod ntfs # 加载 ntfs 模块，因为 wubi 将 ubuntu 装到了 ntfs 盘上  

> set root=(hd0,7) # 这里 (hd0,7) 就是刚才找到的 ubuntu 所在的分区  

> ls $Boot # 找到 boot 分区的 uuid，下一步要用到  

> search --no-floppy --fs-uuid --set UUID # 这里 UUID 就是上一步找到的值  

> loopback loop0 /ubuntu/disks/root.disk # 设 loop0，wubi 将 ubuntu 安装成一个 root.disk 文件  

> set root=(loop0) # 重设 root  

> linux /boot/vmlinuz-2.6.xxxxxx (tab补全) root=/dev/sda7 loop=/ubuntu/disks/root.disk ro quiet splash # 加载内核  

> initrd /boot/initrd.img-2.6.xxxxxx (tab补全)  

> boot  

  

这样就可以成功进入系统了，打开终端输入：  

$ sudo update-grub2  

  

这样下次启动就恢复正常的GRUB启动栏了  

  

  

_**14. 开启SSH服务并远程登录或拷贝文件**_  

  

服务器端：  

$ sudo apt-get install ssh # 安装ssh及openssh-server  

$ sudo /etc/init.d/ssh restart # 启动SSH服务  

  

客户端：  

$ ssh edelweiss@x.x.x.x # 远程登录到 ip 为x.x.x.x的edelweiss用户  

$ exit # 退出登录  

$ scp /home/edelweiss/a.cpp edelweiss@x.x.x.x:/home/edelweiss # 将本地的a.cpp拷贝到远端服务器  

$ scp edelweiss@x.x.x.x:/etc/ssh/sshd_config /home/edelweiss/tmp # 将远端服务器中的sshd_config文件拷贝到本地  

# 有时会出现登不进去的情况，只需删掉下面这个文件就可以了：  

$ rm ~/.ssh/known_hosts  

  

  

_**15. NBD(Network Block Device) 使用方法**_  

  

服务器端：  

$ sudo apt-get install nbd-server # 安装nbd服务器端  

$ nbd-server 2000 /home/edelweiss/img.dom  

  

客户端：  

$ sudo apt-get install nbd-client # 安装nbd客户端  

# modprobe nbd # 加载nbd模块  

# nbd-client x.x.x.x 2000 /dev/nbd0 # x.x.x.x 为服务器端ip，2000为相应的端口，挂载到 /dev/nbd0 设备上  

# mkfs.ext3 /dev/nbd0 # 用之前要先格式化  

# mkdir /mnt/nbd0 # 创建一个用于挂载nbd设备的目录  

# mount /dev/nbd0 /mnt/nbd0 # 挂载这个设备  

# 现在就可以对这个设备进行操作了  

# umount /mnt/nbd0 # 卸载这个设备  

# nbd-client -d /dev/nbd0 # 断开连接  

  

  

_**16. 修改主机名**_  

  

$ hostname # 显示当前主机名  

$ sudo hostname HOSTNAME # 临时修改主机名为 HOSTNAME 而不写入配置文件，下次启动仍然是修改前的主机名  

$ sudo vi /etc/hostname # 永久修改主机名，将文件中原来的主机名更改为自己想要的，保存退出  

$ sudo vi /etc/hosts # 还要将这个文件中 127.0.1.1 后的名字也改为自己想要的主机名，否则 sudo 操作会一直提示：unable to resolve host xxx  

  

  

_**17. 在终端中听音乐**_  

  

$ sudo apt-get install moc # 安装 MOC 播放器，默认只能播放 mp3 格式  

$ sudo apt-get install moc-ffmpeg-plugin # 添加 wma 格式支持  

$ mocp # 打开播放器  

  

解决中文歌名乱码：  

$ vi ~/.moc/config  

添加：  

ReadTags=no  

保存退出  

  

  

_**18. 安装 NVIDIA 显卡驱动后开关机花屏且分辨率过低**_  

  

$ sudo apt-get install v86d hwinfo # 安装所需包  

$ sudo hwinfo --framebuffer # 查看 framebuffer  

$ sudo vi /etc/default/grub # 修改 grub 文件中的如下两行：  

  

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset video=uvesafb:mode_option=1280x800-24,mtrr=3,scroll=ywrap"  

GRUB_GFXMODE=1280x800  

  

$ sudo vi /etc/initramfs-tools/modules # 修改 initramfs，在最后添加如下内容：  

  

uvesafb mode_option=1280x800-24 mtrr=3 scroll=ywrap  

  

$ echo FRAMBUFFER=y | sudo tee /etc/initramfs-tools/conf.d/splash # 强制使用 framebuffer  

$ sudo update-grub2 # 更新 grub  

$ sudo update-initramfs -u # 更新 initramfs  

$ sudo reboot # 重启后生效  

  

  

_**19. 解压缩文件**_  

  

$ tar zxf xxx.tar.gz # 解压缩 gzip 文件  

$ tar jxf xxx.tar.bz2 # 解压缩 bzip2 文件  

  

_**  

20. 下载 glib 库**_  

  

ftp://ftp.gtk.org/pub/glib/  

http://download.chinaunix.net/download/0004000/3822.shtml  

源码编译安装 nbd-2.9.15 时需要 glib 库  

glib-2.24.1 版本是目前最佳选择，但安装它还需要装 zlib 库：  

$ sudo apt-get install zlib1g-dev  

  

  

_**21. 修改 ext2/ext3/ext4/FAT32/NTFS 磁盘分区卷标**_  

  

1. FAT32  

  

$ sudo apt-get install mtools # 安装 mtools 软件包  

$ cp /etc/mtools.conf ~/.mtoolsrc  

$ vi ~/.mtoolsrc  

添加如下一行：  

drive i: file="/dev/sdb1" # sdb1 可以是任何想要修改的分区对应的设备名  

$ mcd i: # 更改命令提示符路径到 i: 盘  

$ sudo mlabel -s i: # 查看 i: 当前的卷标  

$ sudo mlabel i:NEW_LABEL # NEW_LABEL 即为新的卷标名  

$ sudo mlabel -s i: # 检查是否修改成功  

  

2. NTFS  

  

$ sudo apt-get install ntfsprogs # 安装 ntfsprogs 软件包  

$ sudo ntfslabel /dev/sda1 NEW_LABEL # NEW_LABEL 即为新的卷标名  

重新挂载这个分区或设备以检查是否修改成功  

  

3. ext2/ext3/ext4  

  

$ sudo e2label /dev/sda7 NEW_LABEL # NEW_LABEL 即为新的卷标名  

重新挂载这个分区或设备以检查是否修改成功  

  

  

_**22. 系统完整备份与恢复**_  

  

将 / 目录下除 /proc、/mnt、/media 和 /tmp 以外的其他内容备份到 Data 盘中，命名为 linux.tgz：  

# tar --exclude /proc --exclude /mnt --exclude /media --exclude /tmp -zcvpf /media/Data/linux.tgz /  

用 linux.tgz 备份文件恢复系统，将它拷贝到 / 目录下，并在 / 目录下执行：  

# tar -zxvf linux.tgz  

# mkdir proc  

# mkdir mnt  

# mkdir media  

# mkdir tmp  

  

  

_**23. 源码安装/卸载软件**_  

  

如果安装包中有 configure 文件，则进入到安装目录，然后输入：  

# ./configure # 检查安装环境，生成 Makefile  

# make # 编译  

# make install # 安装  

# make uninstall # 卸载  

  

如果安装包中有 INSTALL 文件，则进入到安装目录，然后输入：  

# ./INSTALL # 安装  

进入软件安装的总目录下含有 UNINSTALL 文件的目录，然后输入：  

# ./UNINSTALL # 卸载  

  

  

_**24. 编译内核模块之 Makefile 简单写法**_  

  

obj-m := nbd.o  

KERNELBUILD := /lib/modules/`uname -r`/build  

default:  

make -C $(KERNELBUILD) M=$(shell pwd) modules  

clean:  

rm -rf *.o *.ko *.mod.c .*.cmd .tmp_versions  

（注意 Makefile 里面要求的 tab）  

  

  

_**25. 磁盘分区**_  

  

cfdisk 是个不错的磁盘分区工具，用法很简单，只需要输入：  

$ cfdisk /dev/sdb  

就可以给 sdb 这个设备进行分区了  

确定要保存就输入大写的W将当前分区表写入到硬盘  

  

  

_**26. 关闭蜂鸣器**_  

  

$ sudo rmmod pcspkr # 立即生效，但重启后恢复蜂鸣器  



$ sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist # 资料上说该方法永久有效，但尚未成功




学习过 Linux 的启动流程后，可以在 /etc/rc.d/rc.local 中加入“rmmod pcspkr”，永久有效。




后续学习过程中发现加入黑名单后还需要重建 initrd-版本号.img（或叫 initramfs）文件，重启后便永久有效了。


  

  

_**27. root 权限下 tab 补全不好用**_  

  

总觉得在 root 权限下，tab 补全不如普通帐户的好用，比如输入下列这个命令时：  

# apt-get install xxx  

输入“apt-g“后，按 tab 可以补全“apt-get“；但之后输入”i“，按 tab 无法补全“install“，而普通帐户下就可以。  

在网上搜到解决方案，通过对比 /root/.bashrc 和 /home/edelweiss/.bashrc 这两个文件，发现以下几行二者是不同的：  

  

# enable programmable completion features (you don't need to enable  

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile  

# sources /etc/bash.bashrc).  

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then  

. /etc/bash_completion  

fi  

  



在 /root/.bashrc 文件中，后三行被注释掉了，难怪 tab 补全会出问题…… -_-#







_**28. grub rescue 解决办法**_




由于误操作导致开机无法启动，出现：




error: unknown filesystem




grub rescue>







修复步骤：




1. 用 ls 命令查看全部分区情况




2. 用 ls+分区号 找到原来的 linux 所在的分区，假设为 (hd0,5)




3. 设置 prefix 和 root：




prefix=(hd0,5)/boot/grub




root=hd0,5




4. 加载正常启动模块：insmod normal




5. 启动：normal




至此已成功进入原来的 grub，但还需要进入 linux 重新安装 grub：




$ sudo update-grub2




$ sudo grub-install /dev/sda




OK，grub 恢复正常。







_**29. WinXP 硬盘安装 Linux**_




1. 准备一个 FAT32 分区，根目录下存放 ISO 文件；新建文件夹 linux，将 ISO 文件中 isolinux 文件夹下的 vmlinuz 和 initrd.img 两个文件解压到 linux 文件夹中；如有必要把 ISO 中整个 images 文件夹也解压出来放到根目录下。




2. 下载并安装 WinGrub，在 C 盘创建一个启动项命令为 mygrub，在 menu.lst 文件中添加：




title install linux




root (hd0,5) # (hd0,5) 为刚才的 FAT32 分区




kernel /linux/vmlinuz ro root=/dev/hda6




initrd /linux/initrd.img




3. 重启后选择 mygrub --> install linux 启动项，即可进入跟光盘一样的安装界面


  


