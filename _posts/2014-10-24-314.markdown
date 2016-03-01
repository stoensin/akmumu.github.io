---
author: admin
comments: true
date: 2014-10-24 07:26:51+00:00
layout: post
slug: ios8%e9%80%9a%e7%9f%a5%e6%a0%8f%e6%98%be%e7%a4%ba%e5%bf%ab%e6%8d%b7%e5%bc%80%e5%85%b3%e8%9c%82%e7%aa%9d%e6%95%b0%e6%8d%ae%ef%bc%8c%e5%bf%ab%e6%8d%b7%e5%bc%80%e5%85%b3vpn%ef%bc%8c%e5%bf%ab%e6%8d%b7
title: IOS8通知栏显示快捷开关蜂窝数据，快捷开关VPN，快捷开关定位位置
wordpress_id: 314
categories:
- 实用软件技巧
---

## **先看效果图**


[![2014-10-24 150446](http://akmumu-wordpress.stor.sinaapp.com/uploads/2014/10/2014-10-24-150446.png)](http://akmumu-wordpress.stor.sinaapp.com/uploads/2014/10/2014-10-24-150446.png)



很清澈，你值得拥有！

我是先安装的


# Launcher


现在的appstore里面已经没有了，我用同步推安装的，完事以vpn为例



	
  1. 主界面右上角点击「铅笔图标」

	
  2. 点击绿色加号addnew

	
  3. 选择 CustomLauncher

	
  4. 选一个图标，起一个名字，在URL填写prefs:root=General&path=VPN

	
  5. 点击右上角「对勾图标」，完成新建

	
  6. 然后在通知中心就可以使用这枚快速启动按钮了


另外同理可得，URL如下

	
  * 蜂窝网络：prefs:root=MOBILE_DATA_SETTINGS_ID

	
  * VPN — prefs:root=General&path=VPN

	
  * 定位服务：prefs:root=LOCATION_SERVICES


下面是我用的素材

[launcher素材](http://akmumu-wordpress.stor.sinaapp.com/uploads/2014/10/launcher素材.zip)
