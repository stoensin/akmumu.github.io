---
author: admin
comments: true
date: 2012-12-04 03:45:00+00:00
layout: post
slug: '%e5%8f%aa%e4%bd%bf%e7%94%a8%e8%bf%90%e7%ae%97%e5%ae%9e%e7%8e%b0%e5%8a%a0%e6%b3%95%ef%bc%8c%e5%87%8f%e6%b3%95%ef%bc%8c%e4%b9%98%e6%b3%95%ef%bc%8c%e9%99%a4%e6%b3%95php%e5%ae%9e%e7%8e%b0'
title: 只使用++运算实现加法，减法，乘法，除法PHP实现
wordpress_id: 128
categories:
- PHP
tags:
- php程序设计
---




加法






    
    function jiafa($a,$b)
    {
    	for($i=0;$i<$b;$i++)
    	{
    		$a++;
    	}
    	return $a;
    }
    //echo jiafa(4,2);

  

减法







    
    function jianfa($a,$b)
    {
    	$c=0;
        while($b!=$a)
    	{
    		$b++;
    		$c++;
    	}
    	echo $c;
    } // end func
    //jianfa(10,3);

  

乘法







    
    function chengfa($a,$b)
    {
    	$c=0;
        for($j=0;$j<$b;$j++)
    	{
    		$c=jiafa($c,$a);
    	}
    	return $c;
    } // end func
    //chengfa(9,3);

  

除法







    
    function chufa($d,$e)
    {
    	$k=0;
    	$f=0;
        while($f<$d)
    	{
    		$k++;
    		$f=chengfa($e,$k);
    		
    	}
    	return $k;
    } // end func
    echo chufa(16,2);

  

  





