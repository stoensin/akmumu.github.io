---
author: admin
comments: true
date: 2014-02-12 03:47:26+00:00
layout: post
slug: javascript%e4%b8%ad%e4%b8%a4%e4%b8%aa%e6%84%9f%e5%8f%b9%e5%8f%b7%ef%bc%88%ef%bc%89%e7%9a%84%e4%bd%9c%e7%94%a8
title: JavaScript中两个感叹号（!!）的作用
wordpress_id: 254
categories:
- JS
---

看这么个例子：



var a；

var b=!!a;

a默认是undefined。!a是true，!!a则是false，所以b的值是false，而不再是undefined，也非其它值，主要是为后续判断提供便利。

!!一般用来将后面的表达式强制转换为布尔类型的数据（boolean），也就是只能是true或者false;
因为javascript是弱类型的语言（变量没有固定的数据类型）所以有时需要强制转换为相应的类型，类似的如:



	
  * a=parseInt(“1234″)

	
  * a=”1234″-0 //转换为数字

	
  * b=1234+”" //转换为字符串

	
  * c=someObject.toString() //将对象转换为字符串


其中第1种、第4种为显式转换，2、3为隐式转换

布尔型的转换，javascript约定规则为

	
  1. false、undefinded、null、0、”" 为 false

	
  2. true、1、”somestring”、[Object] 为 true


对null与undefined等其他用隐式转换的值，用!操作符时都会产生true的结果，所以用两个感叹号的作用就在于将这些值转换为“等价”的布尔值；



声明: 本文采用 [BY-NC-SA](http://creativecommons.org/licenses/by-nc-sa/3.0/) 协议进行授权 | [WEB前端开发](http://www.css88.com/)
转载请注明转自《[JavaScript中两个感叹号（!!）的作用](http://www.css88.com/archives/4887)》
