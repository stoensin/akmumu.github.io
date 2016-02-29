---
author: admin
comments: true
date: 2012-09-17 02:42:00+00:00
layout: post
slug: '%e5%88%a0%e9%99%a4%e6%96%87%e4%bb%b6%e6%8f%90%e7%a4%ba%e6%9b%b4%e6%94%b9%e6%96%87%e4%bb%b6%e6%9d%83%e9%99%90%e6%8f%90%e7%a4%ba%ef%bc%9aoperation-not-permitted'
title: 删除文件提示更改文件权限提示：Operation not permitted
wordpress_id: 64
categories:
- 操作系统
tags:
- 操作系统相关
---



一些文件看上去可能一切正常，但当您尝试删除的时候，居然也会报错，就象下边一样：  

　  

　　[root@[linux](http://linux.chinaitlab.com/)236 root]# ls -l 1.txt  

　  

　　-rw-r——r—— 1 root root 0 Aug 5 23：00 1.txt  

　  

　　[root@[linux](http://linux.chinaitlab.com/)236 root]# rm -rf 1.txt  

　  

　　rm： cannot unlink `1.txt'： Operation not permitted  

　  

　　您是全能root用户，居然系统告诉您操作不允许，是Linux疯了么？当然不是，如果您会用lsattr命令，问题就有了答案。  

　  

　　[root@linux236 root]# lsattr  

　  

　　——i—— ./1.txt  

　  

　-------------- ./weiqi.ldif  

　-------------- ./qi.schema  

　  

　　秘密终于暴露了，在lsattr命令下，这个1.txt文件带有一个"i"的属性，所以才不可以删除。您现在可以用下边的一系列命令：  

　  

　　[root@linux236 root]# lsattr 1.txt  

　  

　　——i—— 1.txt  

　  

　　[root@linux236 root]# chattr -i 1.txt  

　  

　　[root@linux236 root]# rm -rf 1.txt  

　  

　　[root@linux236 root]#  

　  

　　成功了，这个属性专门用来保护重要的文件不被删除，通常的情况下，懂得用这几个命令的通常系统管理员有能力判断这个文件是否可以被删除。如果您想给一个文件多加点保护，可以使用下边的命令：  

　  

　　chattr +i filename  

　  

　　命令，这样一来，想要删除这个文件就要多一个步骤。同时，这样的文件也是不可以编辑和修改的。只有root用户才能使用chattr命令。此命令可以在Linux ext2或ext3系统上使用。  

　  

　　类似于和[Windows](http://windows.chinaitlab.com/)文件系统，不能随意删除的文件多半都有其道理，即使您知道如何删除，都应该三思而后行。  

　  

　　freebsd chflags  

　  

　　用法：chflags [参数] 关键词 档案  

　  

　　常用关键词：  

　  

　　schg 档案完全无法被修改（super-user only）。noschg（Anti）  

　  

　　sappend 档案內容只能用附加（append）的方式修改（super-user only）。nosappend（Anti）  

　  

　　sunlink 档案无法被刪除或者重命名（super-user only）。nosunlink（Anti）  

　  

　　uchg 档案完全无法被修改（super-user only 或者一般使用者）。nouchg（Anti）  

　  

　　uappend 档案內容只能用附加（append）的方式修改（super-user only 或者一般使用者）。uappend（Anti）  

　  

　　uunlink 档案无法被刪除或者重命名（super-user only 或者一般使用者）。nouunlink（Anti）  

　  

　　uchg 用于文件时，owner 不能修改文件，也不能删除文件或者对文件重命名；nouchg（Anti）  

　  

　　uappend 用于文件时，owner 只能以 append 的方式修改文件，不能删除文件或者对文件重命名；uunlink 用于文件时，owner 可以对文件进行修改，但不能删除文件或者对文件重命名。nouappend（Anti）  

　  

　　uchg 用于目录时，owner 不能删除目录或者重命名目录，可以修改目录中已有的文件，但不能在目录中添加文件，也不能删除目录中的文件或者对其重命名；uappend 用于目录时，owner 不能删除目录或者重命名目录，可以修改目录中已有的文件和在目录中添加文件，不能删除目录中的文件或者对其重命名；uunlink 用于目录时，owner 不能删除目录或者重命名目录，可以修改目录中已有的文件和在目录中添加文件，也可以删除目录中的文件或者对其重命名。  

　  

　　结论：uchg>uappend>uunlink.  


