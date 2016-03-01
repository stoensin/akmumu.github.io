---
author: admin
comments: true
date: 2014-01-08 07:45:42+00:00
layout: post
slug: htmlspecialchars%e5%92%8chtmlentities%e5%8c%ba%e5%88%ab%e6%98%af%e4%bd%bf%e7%94%a8%e5%9c%ba%e6%99%af
title: htmlspecialchars和htmlentities区别是使用场景
wordpress_id: 245
categories:
- PHP
---

一直都知道 PHP 中的 htmlentities 和 htmlspecialchars 函数都能把 html 中的特殊字符转换成对应的 character entity （不知道怎么翻译），也一直都知道 htmlentities 和 htmlspecialchars 函数有区别，但是一直都用不到这两个函数，也就没去研究过到底有什么区别。


今天用到了，懒得看 PHP 手册里的鸟语，觉得这种问题应该会有人用中文写过，于是 Google 关键词“htmlentities htmlspecialchars”，答案千篇一律。我已经司空见惯了，复制粘贴连小学生都会。经过对比发现，每篇文章大概都包含两部分：

第一部分是引用 PHP 手册的说明：

PHP 手册中对 htmlspecialchars 写道：

The translations performed are:


复制代码代码如下:





‘&' (ampersand) becomes ‘&'
‘"' (double quote) becomes ‘"' when ENT_NOQUOTES is not set.
”' (single quote) becomes ‘'' only when ENT_QUOTES is set.
‘<' (less than) becomes ‘<'
‘>' (greater than) becomes ‘>'


这部分无可厚非，但是第二部分的解释却并不怎么正确：

htmlspecialchars 只转化上面这几个html代码，而 htmlentities 却会转化所有的html代码，连同里面的它无法识别的中文字符也给转化了。

我们可以拿一个简单的例子来做比较：


复制代码代码如下:





<?php
$str='<a href="test.html">测试页面</a>';
echo htmlentities($str);

// <a href="test.html">²âÊÔÒ³Ãæ</a>

$str='<a href="test.html">测试页面</a>';
echo htmlspecialchars($str);
// <a href="test.html">测试页面</a>

?>


结论是，有中文的时候，最好用 htmlspecialchars ，否则可能乱码。

难道 htmlentities 函数只有一个参数吗？当然不是！htmlentities 还有三个可选参数，分别是 $quote_style、 $charset、 $double_encode，手册对 $charset 参数是这样描述的：

Defines character set used in conversion. The default character set is ISO-8859-1.

从上面程序输出的结果判断，$str 是 GB2312 编码的，“测试页面”几个字对应的十六进制值是：

B2 E2 CA D4 D2 B3 C3 E6

然而却被当成 ISO-8859-1 编码来解析：

²âÊÔÒ³Ãæ

正好对应 HTML character entity 里的：

²âÊÔÒ³Ãæ

当然会被 htmlentities 转义掉，但是只要加上正确的编码作为参数，根本就不会出现所谓的中文乱码问题：

$str='<a href="test.html">测试页面</a>';

echo htmlentities($str, ENT_COMPAT, 'gb2312');
// <a href="test.html">测试页面</a>三人成虎，以讹传讹。

结论：htmlentities 和 htmlspecialchars 的区别在于 htmlentities 会转化所有的 html character entity，而htmlspecialchars 只会转化手册上列出的几个 html character entity （也就是会影响 html 解析的那几个基本字符）。一般来说，使用 htmlspecialchars 转化掉基本字符就已经足够了，没有必要使用 htmlentities。实在要使用 htmlentities 时，要注意为第三个参数传递正确的编码。
