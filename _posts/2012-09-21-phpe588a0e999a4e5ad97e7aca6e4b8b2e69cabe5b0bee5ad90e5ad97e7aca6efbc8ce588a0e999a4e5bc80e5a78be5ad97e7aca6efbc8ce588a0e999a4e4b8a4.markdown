---
author: admin
comments: true
date: 2012-09-21 10:33:00+00:00
layout: post
slug: php%e5%88%a0%e9%99%a4%e5%ad%97%e7%ac%a6%e4%b8%b2%e6%9c%ab%e5%b0%be%e5%ad%90%e5%ad%97%e7%ac%a6%ef%bc%8c%e5%88%a0%e9%99%a4%e5%bc%80%e5%a7%8b%e5%ad%97%e7%ac%a6%ef%bc%8c%e5%88%a0%e9%99%a4%e4%b8%a4
title: php删除字符串末尾子字符，删除开始字符，删除两端字符
wordpress_id: 77
categories:
- PHP
tags:
- php程序设计
---




今天在处理删除字符串两端的特定字符时遇到了下面的问题，先看例子



    
    <span style="font-size:18px;"></span> 
    
    $str = 'akmumu/writedb.json';
    




我要做的是删除开始的akmumu，再删除末尾的.json，这样只保留有用的字符/writedb




开始我使用的ltrim删除akmumu，再使用rtrim删除.json




结果发现我理解trim错误了，trim的参数如下




rtrim(string,charlist)




他的参数时charlist，也就是不一定按照顺序查找，比如我给一个




$str = 'akmumu/writedbsojn.json';




结果还是/write,我想要的/writedbsojn没有出现，也就是说只要charlist中的任意字符匹配就一直这么下去了。。。




所以就用别的了




str_replace,substr_replace即可




安全起见，增加了代码，防止再截取错误






    
    if(strpos($str,'akmumu/') !== FALSE
    	$str = substr($str,7);
    	if(strpos($str,'.json') !== FALSE)
    	{
    		if(substr($str,-5,5) == '.json')
    		{
    			$str = substr_replace($str,'',-5);
    		}
    	}	
    }




  






这样就可以了






