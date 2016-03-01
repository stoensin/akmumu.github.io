---
author: admin
comments: true
date: 2014-02-20 06:29:47+00:00
layout: post
slug: phpmysql%e4%b9%8b-%e5%ad%97%e7%ac%a6%e7%bc%96%e7%a0%81%ef%bc%8c%e4%b9%b1%e7%a0%81%ef%bc%8cset-names%e7%9a%84%e6%84%8f%e6%80%9d
title: PHP&MYSQL之——字符编码，乱码，set names的意思
wordpress_id: 256
categories:
- MYSQL
- PHP
---

#### 一、字符编码简介


**      **计算机里，只能用二进制码记录文字、图片、图像、声音等媒体，要想将各式各样的媒体映射为简单的二进制编码（媒体 –> 01），就要将很多01根据多种变化的排列组合来表示这些媒体，这些排列组合的方法就成为了编码，文字、图片、声音都存在各式各样的编码。今天学习一下燕十八PHP公益培训课之——字符编码篇。


#####        1、ASCII


最早的编码——ASCII编码，ASCII编码只能表示键盘上（A-Z、a-z、0-9、+-*/&^%）等不超过127个字符。

1个字节有8位，可以表示256个字符，要表示ASCII码只需要7位就够了，所有最高位始终是0。
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="606" valign="top" >0000 0000
1111 1111    -->   共256种值
</td>
</tr>
</tbody>
</table>
常用汉字3000多，1个字节不能表示，只能用2个字节表示，可以表示65535个字符，表示汉字够用了。
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="600" valign="top" >0000 0000 0000 0000
1111 1111 1111 1111  -->  共65535种值
</td>
</tr>
</tbody>
</table>


#####       2、GB2312


最早的中文字符集GB2312，GB2312不占用ASCII的0-127，两个字节组合来用，但是这样的组合就少了很多，例如：
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="600" valign="top" >1xxx xxxx 1xxx xxxx  -->  [129 - 255] [129 - 255]
例如：
130  140     97       95      144 233   （分组前）
↓          ↓         ↓           ↓
[130 140]  [97]     [95]    [144 233]   (分组后)
↓          ↓         ↓           ↓
[汉字]    [字母]   [字母]    [汉字]
</td>
</tr>
</tbody>
</table>
GB2312只收录了6763个汉字,基本满足了常用汉字的需求，但有些汉字没有收录。


#####      3、GBK


GBK编码完全兼容GB2312，GBK还是双字节，理论上第2字节不再局限于129-255，如果第1字节大于128,则带下一个字节组成一个汉字，如果第1个小于128，就直接转ASCII。例如：
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="600" valign="top" >1xxx xxxx xxxx xxxx  -->   [129 - 255][0 - 255]
例如：
133  22    63      199  22     (分组前)
↓         ↓           ↓
[133 22]  [63]    [199 22]    (分组后)
↓         ↓           ↓
[汉字]   [字母]     [汉字]
</td>
</tr>
</tbody>
</table>
实际上，GBK的编码方式，有单字节和双字节编码组成，00-7F范围内只占一位，和ASCII保持一致，此范围内阉割上说有96个字符和32个控制符号。之后的双字节中，前一字节是双字节的第一位。总体上说第一字节的范围是81-FE（也就是不含80和FF），第二字节的一部分领域在40-7E，其他领域在80-FE。收录汉字21003个、符号883个、并提供1894个造字码位。


#####       4、Unicode和UTF-8


Unicode是一个世界通用的码表，它占4个字节,包含232，共40多亿字符，但常用的集中在前65535个标号里，2个字节就够用了。Unicode只负责分配编号,而且都用4个字节来分配编号,而真正的实现方式成为Unicode转换格式（Unicode Transformation Format，简称为UTF）

例如，如果一个仅包含基本7位ASCII字符的Unicode文件，如果每个字符都使用2字节的原Unicode编码传输，其第一字节的8位始终为0，这造成了较大的浪费。对于这种情况，可以使用UTF-8编码，这是一种变长编码。它根据一定的算法减小浪费，具体实现如下：
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="600" valign="top" >Unicode根据一定算法转为UTF-8
例如：
0000 0000 0000 0000 0000 0000 0000 0041 –> A    （Unicode）
↓
0000 0041 –> A                                                 （UTF-8）
</td>
</tr>
</tbody>
</table>
Unicode与UTF-8的关系就像原文件与压缩文件的关系，具体如下：
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="196" valign="top" >


**UCS-4编码**



</td>

<td width="404" valign="top" >


**UTF-8字节流**



</td>
</tr>
<tr >

<td width="196" valign="top" >U+00000000 - U+0000007F
</td>

<td width="404" valign="top" >0xxxxxxx
</td>
</tr>
<tr >

<td width="196" valign="top" >U+00000080 - U+000007FF
</td>

<td width="404" valign="top" >110xxxxx 10xxxxxx
</td>
</tr>
<tr >

<td width="196" valign="top" >U+00000800 - U+0000FFFF
</td>

<td width="404" valign="top" >1110xxxx 10xxxxxx 10xxxxxx
</td>
</tr>
<tr >

<td width="196" valign="top" >U+00010000 - U+001FFFFF
</td>

<td width="404" valign="top" >11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
</td>
</tr>
<tr >

<td width="196" valign="top" >U+00200000 - U+03FFFFFF
</td>

<td width="404" valign="top" >111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
</td>
</tr>
<tr >

<td width="196" valign="top" >U+00040000 - U+7FFFFFFF
</td>

<td width="404" valign="top" >1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
</td>
</tr>
</tbody>
</table>
UTF-8编码是根据第一字节的高位来决定一个字符占几个字节的，基本规律是：
<table cellpadding="2" cellspacing="0" border="1" >
<tbody >
<tr >

<td width="300" valign="top" >


**第一字节高位**



</td>

<td width="300" valign="top" >


**占用字节数**



</td>
</tr>
<tr >

<td width="300" valign="top" >0
</td>

<td width="300" valign="top" >1个字节
</td>
</tr>
<tr >

<td width="300" valign="top" >11
</td>

<td width="300" valign="top" >2个字节
</td>
</tr>
<tr >

<td width="300" valign="top" >111
</td>

<td width="300" valign="top" >3个字节
</td>
</tr>
<tr >

<td width="300" valign="top" >1111
</td>

<td width="300" valign="top" >4个字节
</td>
</tr>
<tr >

<td width="300" valign="top" >11111
</td>

<td width="300" valign="top" >5个字节
</td>
</tr>
<tr >

<td width="300" valign="top" >111111
</td>

<td width="300" valign="top" >6个字节
</td>
</tr>
</tbody>
</table>


#### 二、乱码的形成


乱码产生的原因：



	
  * 解码时与实际编码不一致（可修复）。

	
  * 传输过程中，编码不一致，导致字节丢失（不可修复）。


1、解码时与实际编码不一致情况





![复制代码](http://common.cnblogs.com/images/copycode.gif)



    
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />



    
      <!--  当charset为utf-8时，文档又另存为ansi(GBK)格式,网页就会产生乱码  -->！-- --》



    
      <title>乱码测试</title>
     </head>
     <body>
      测试
     </body>
    </html>




![复制代码](http://common.cnblogs.com/images/copycode.gif)





2、传输过程中，编码不一致，导致字节丢失

大二

MySQL乱码形成和字符集设置。

MySQL的字符集转换过程如下图：

[![image](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755237338.png)](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755202651.png)

这个过程至少存在3个字符集的设置，客户端字符集、连接器字符集、服务器端字符集。其中连接器起到至关重要的作用，具体流程为，客户端向服务器端存数据时，客户端将自身字符集编码的数据发送到连接器，连接器选择一种字符集进行转换，然后再将转换好的字符集转换为服务端字符集，再发送给服务器端存储。当客户端向服务器端取数据时，以上过程相逆。

下图为一种场景：

[![image](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755275480.png)](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755241383.png)

客户端为GBK编码，连接器为UTF8编码，服务器端也为UTF8编码。当客户端将GBK编码的数据发送到连接器时，连接器将GBK编码的数据转换为UTF8编码，暂存在连接器，之后连接器再将暂存的数据不进行任何转换发送到服务端存入数据库。客户端取数据时，将上述过程相逆。

这样场景可能存在一定的问题，如果数据库中本来就存储了只有UTF8编码下才有而GBK编码下没有的字符，在客户端取数据时，由连接器UTF8编码的字符再转换为GBK时就可能丢失字节。（如果场景只针对中国，可能不会存在什么问题。）



下图是另一种场景

[![image](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755329412.png)](http://images.cnblogs.com/cnblogs_com/giantpanda/201211/201211031755308247.png)

客户端还是GBK编码，连接器也是GBK编码，服务端还是UTF8编码。当客户端将GBK编码的数据发送到连接器是，连接器不进行转换，暂存在连接器，连接器再将暂存的GBK编码的数据转为UTF8编码发送到服务器。取数据时与上述过程相逆。这个场景也会出现丢失字节的现象。



根据以上场景分析，若想在MySQL不出现乱码，需要指定客户端的编码，让连接器不理解错误，这样就不会存入错误的数据，取数据的时候，要告诉连接器，返回结果的字符集，所以要设置3个字符集分别是：客户端字符集、返回结果字符集、连接器字符集。

看以下场景





![复制代码](http://common.cnblogs.com/images/copycode.gif)



    
    #设置客户端字符集为GBK
    set character_set_client=gbk;
    
    #设置连接器字符集为GBK
    set character_set_connection=latin1;
    
    #设置返回结果字符集为GBK
    set character_set_results=gbk;




![复制代码](http://common.cnblogs.com/images/copycode.gif)





当客户端为GBK，连接器为latin1时，客户端字符集的容量比连接器的字符集的容量大，比如客户端包含中文汉字编码，但连接器却没有，当客户端有汉字数据发送到连接器时，连接器转为latin1时将丢失字节，就会产生乱码，而且这种乱码是不可修复的字节码丢失（[上一篇](http://www.cnblogs.com/giantpanda/archive/2012/11/03/2752683.html) 乱码的第2种情况）。

总结上面，Server字符集 >= Connection字符集 >= Client字符集。




    
    set character_set_client=gbk;
    set character_set_connection=gbk;
    set character_set_results=gbk;
    
    #以上三条都设置为gbk，可以简写为以下形式
    set namesgbk; ;





总结[上一篇](http://www.cnblogs.com/giantpanda/archive/2012/11/03/2752683.html)和本文，要想php+mysql开发中不出现乱码需注意以下几点：



	
  1. html、php的meta中的charset信息的编码

	
  2. html、php等文件保存的编码格式

	
  3. mysql数据库中client、connection、results

	
  4. mysql数据库表字段编码


以上四点编码都统一



转自http://www.cnblogs.com/giantpanda/archive/2012/11/03/2752835.html
