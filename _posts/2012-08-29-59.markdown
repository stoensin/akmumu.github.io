---
author: admin
comments: true
date: 2012-08-29 06:04:00+00:00
layout: post
slug: '%e4%b8%aa%e4%ba%ba%e6%82%9f%e5%87%baphp%e6%8e%a5%e5%8f%a3%e4%b8%adinterface%e5%ad%98%e5%9c%a8%e7%9a%84%e6%84%8f%e4%b9%89'
title: 个人悟出php接口中interface存在的意义
wordpress_id: 59
categories:
- PHP
tags:
- php程序设计
---




可能大家都懂这些，作为不懂的我猜测了一下这个interface的意义，他就是为了后面调用的时候再调用的方法中调用实现类中interface中存在的内容，，好绕口啊，写个例子留作以后看吧




pay.php



    
    interface Ipay
    {
    	function withmoney();
    	
    	//function withinternet();
    }
    
    class Dmeng implements Ipay
    {
    	
    	function withmoney()
    	{
    		echo "花人民币买东西";
    	}
    	function withinternet()
    	{
    		return "用网银支付";
    	}
    }

  

usei.php



    
    include_once 'pay.php';
    class main
    {
    	function run($vc)
    	{
    		$this->vc = $vc;
    		$this->vc->withinternet();
    		echo "yunxing";
    	}
    	
    }
    $com= new main();
    $com->run(new Dmeng);

  

就是上面那样，我们将interface中的某个方法注释掉，发现再调用的时候，就没用了



