---
author: admin
comments: true
date: 2013-08-26 07:39:05+00:00
layout: post
slug: '%e4%bd%bf%e7%94%a8jquery%e6%8f%92%e4%bb%b6autocomplete%e6%97%b6%e5%80%99%e5%87%ba%e7%8e%b0typeerrorthis-source-is-not-a-function%e5%8d%b3%e4%b8%8ejquery%e7%9a%84autocomplete%e5%86%b2%e7%aa%81'
title: 使用jquery插件autocomplete时候出现typeerror:this.source is not a function即与jquery的autocomplete冲突
wordpress_id: 226
categories:
- JS
tags:
- jquery
---

之前使用jquery的插件做的自动提示邮箱后缀，后来因需要在此页面增加弹出框，因而使用了jquery的dialog，在这里有之前功能引入的js文件：jquery.autocomplete.js，还有刚刚引入的jquery.ui文件，经查看这两个里面有冲突的内容，我的解决办法是把jquery里关于autocomplete的删去即可，可以搜索相关的，只有一段代码，删了就可以，如下图所示



[![0B7F56F9-68D6-48FF-9E9C-286A28A48886](http://akmumu-wordpress.stor.sinaapp.com/uploads/2013/08/0B7F56F9-68D6-48FF-9E9C-286A28A48886.jpg)](http://akmumu-wordpress.stor.sinaapp.com/uploads/2013/08/0B7F56F9-68D6-48FF-9E9C-286A28A48886.jpg)
