---
author: admin
comments: true
date: 2012-10-22 07:05:00+00:00
layout: post
slug: php-serialize%e4%b8%8eunserialize%e4%b8%8d%e5%ae%8c%e5%85%a8%e7%a0%94%e7%a9%b6
title: php serialize()与unserialize()不完全研究
wordpress_id: 100
categories:
- PHP
tags:
- php程序设计
---










**serialize**()和**unserialize**()在php手册上的解释是:




**serialize** — Generates a storable representation of a value




**serialize** — 产生一个可存储的值的表示




**unserialize** — Creates a PHP value from a stored representation




**unserialize** — 从已存储的表示中创建 PHP 的值




很显然,"**_a stored representation_**"的解释翻译成了**_一个可存储的值_**后依然很让人非常费解它的意思。




如果语言已经无法表述清楚，那么我们可以以一个具体的PHP的例子来学习这两个函数的用途




<?php  

//声明一个类  

class dog {  

  

var $name;  

var $age;  

var $owner;  

  

function dog($in_name="unnamed",$in_age="0",$in_owner="unknown") {  

$this->name = $in_name;  

$this->age = $in_age;  

$this->owner = $in_owner;  

}  

  

function getage() {  

return ($this->age * 365);  

}  

  

function getowner() {  

return ($this->owner);  

}  

  

function getname() {  

return ($this->name);  

}  

}  

//实例化这个类  

$ourfirstdog = 
new dog("Rover",12,"Lisa and Graham");  

//用serialize函数将这个实例转化为一个序列化的字符串  

$dogdisc = 
serialize($ourfirstdog);  

print $dogdisc;
//$ourfirstdog 已经序列化为字符串 O:3:"dog":3:{s:4:"name";s:5:"Rover";s:3:"age";i:12;s:5:"owner";s:15:"Lisa and Graham";}  

  

print '<BR>';  

  

/*   

-----------------------------------------------------------------------  

在这里你可以将字符串 $dogdisc 存储到任何地方如 session,cookie,数据库,php文件   

-----------------------------------------------------------------------  

*/  

  

//我们在此注销这个类  

unset($ourfirstdog);  

  

/* 还原操作 */  

  

/*   

-----------------------------------------------------------------------  

在这里将字符串 $dogdisc 从你存储的地方读出来如 session,cookie,数据库,php文件   

-----------------------------------------------------------------------  

*/  

  

  

//我们在这里用 unserialize() 还原已经序列化的对象  

$pet = unserialize($dogdisc);
//此时的 $pet 已经是前面的 $ourfirstdog 对象了  

//获得年龄和名字属性  

$old = $pet->getage();  

$name = $pet->getname();  

//这个类此时无需实例化可以继续使用,而且属性和值都是保持在序列化之前的状态  

print "Our first dog is called 
$name and is $old days old<br>";  

print '<BR>';  

?>







例子中的对象我们还可以换为数组等其他类型，效果都是一样的！




　　**其实serialize()就是将PHP中的变量如对象(object),数组(array)等等的值序列化为字符串后存储起来.序列化的字符串我们可以存储在其他地方如数据库、Session、Cookie等,序列化的操作并不会丢失这些值的类型和结构。这样这些变量的数据就可以在PHP页面、甚至是不同PHP程序间传递了。**




**　　而unserialize()就是把序列化的字符串转换回PHP的值。**




　　这里再引用一段PHP手册上的说明，看了上面的例子，应该很容易明白下面这些话的意思了




　　想要将已序列化的字符串变回 PHP 的值，可使用 unserialize()。**serialize()** 可处理除了
resource 之外的任何类型。甚至可以 **serialize()** 那些包含了指向其自身引用的数组。你正
**serialize()** 的数组／对象中的引用也将被存储。




　　当序列化对象时，PHP 将试图在序列动作之前调用该对象的成员函数 
__sleep()。这样就允许对象在被序列化之前做任何清除操作。类似的，当使用 unserialize() 恢复对象时， 将调用
**__wakeup()** 成员函数




**　　unserialize()** 对单一的已序列化的变量进行操作，将其转换回 PHP 的值。返回的是转换之后的值，可为
integer、float、string、array 或
object。如果传递的字符串不可解序列化，则返回 **FALSE**。




  





























