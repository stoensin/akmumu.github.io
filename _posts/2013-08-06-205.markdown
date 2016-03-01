---
author: admin
comments: true
date: 2013-08-06 05:15:07+00:00
layout: post
slug: zend-studio10-1-0%e5%ae%89%e8%a3%85%e7%a0%b4%e8%a7%a3%e6%b1%89%e5%8c%96%e8%ae%be%e7%bd%ae%e9%85%8d%e7%bd%ae
title: zend studio10.1.0安装破解汉化设置配置
wordpress_id: 205
categories:
- 实用软件技巧
tags:
- zend
---

上个星期使用了下eclipse，不知道是不是我人品不好，总之经常遇到问题，总结就是不是我不太适合，所以又要换回zendstudio了，下载一看，已经跟新到了10.1.0了，开始下载吧，网上很多地方能下载到这个版本了，下载到一个msi的文件安装。

1整个过程都和9.0.3的安装破解类似，所以详细的步骤请参照之前的文[http://www.akmumu.com/2012/07/13/37/.html](http://www.akmumu.com/2012/07/13/37/.html)

其中只有破解文件不同而已，下面给出两个破解文件，因为你下载到的10.1.0有可能是两种，请对应版本号下载破解文件

其中有三个版本的破解文件，请对应用，因为你下载的可能是10.0.1，肯呢过是10.1.0，而后者有可能有两个不同的更新日期版本，文件中都有相应的文件名，请注意查看

链接为http://download.csdn.net/detail/akmumu2010/5878233

下载之后(该文件千万不要解压，也不要修改文件名)复制并替换你Zend Studio安装目录的plugins文件夹下的同名文件。

启动Zend Studio,复制文件中文本文档中对应的注册码License key,粘贴(粘贴快捷键是ctrl+v)到注册框中

注意：如果你使用的com.zend.php.core_10.1.0.201307161205.jar这个版本，那么请输入下面的注册码：

15BD3D9635621E3AD4AE0F243B9E76CCFF6383B0E254EF646FD47B1424832332148D73E944AC95FC2A22EAF9965FE00D0BBACAD80E4B73BCFD40AADBEBD606EA4C33A74AEBB140CFB189E545E351774B7A020CDBE4FD159CDFF00F3C6A08C6AAC1A4F811EDDCF59CAFD09D46C849CB780BF6EF5983D3AFC372FC2021714E6B0B

查看是否注册成功，在菜单中“help>About Zend Studio ”。 过期时间是never或者31/12/9999说明成功了。

[![QQ截图20130806185441](http://akmumu-wordpress.stor.sinaapp.com/uploads/2013/08/QQ截图20130806185441.png)](http://akmumu-wordpress.stor.sinaapp.com/uploads/2013/08/QQ截图20130806185441.png)

2关于汉化，这个很简单，

不过注意：能不汉化最好不要，因为你破解之后汉化了再打开是未破解状态，还一直让你输注册码，而你输入以前提示正确的注册码，它也会提示错误的！

选择Help菜单->Install New Software...在Work with框中复制此地址：http://download.eclipse.org/technology/babel/update-site/R0.10.1/juno/，(提示:最后一个/线不能少)复制完地址后按回车键确认，这时会提示pending...(等待...)，等侍完成后会出来很多语言列表让你选择，请选择“Babel Language Packs in Chinese(Simplified)”简体中文包选择项，下一步选同意，再漫长的等待之后就汉化好了，提示重启zend studio。

在线安装步骤[http://blog.csdn.net/sn_keys/article/details/9090787](http://blog.csdn.net/sn_keys/article/details/9090787)

如果你输入这个网址不能提示成功而提示失败，那么就下载离线的吧

http://eclipse.org/downloads/download.php?file=/technology/babel/update-site/R0.10.1/babel-R0.10.1-juno.zip

步骤有一篇博文说的很详细[http://blog.csdn.net/sn_keys/article/details/9090995](http://blog.csdn.net/sn_keys/article/details/9090995)，请按照步骤安装即可

附：

zend studio常见问题解答  [http://www.geekso.com/zendstudioquestion/](http://www.geekso.com/zendstudioquestion/)

此次正式版比上一版的测试版的性能要好很多，主要是因为测试版用的是最新的Eclipse 4.2.1(新版本Eclipse性能确实不怎么样)，而正式版放弃了最新的Eclipse，而使用了Eclipse 3.8.1 juno版，性能大大提升，推荐升级此版本。

【如何升级？安装完后进入软件help>Check for Updates】

另外[http://www.justwinit.cn/post/6058/](http://www.justwinit.cn/post/6058/)这篇文章中有很多关于zend的配置，有需要的也可以看看

{Zend Studio 10.1正式版发布和破解方法，zend studio 10汉化，相式设置为Dreamweaver，空格缩进为4个, 代码默认不折叠的设置,Outline中使用的图形标志。 }
