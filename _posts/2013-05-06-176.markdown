---
author: admin
comments: true
date: 2013-05-06 10:24:00+00:00
layout: post
slug: '%e7%b1%bb%e4%bc%bc%e7%be%8e%e4%b8%bd%e8%af%b4%ef%bc%8c%e7%b1%bb%e4%bc%bc%e7%99%be%e5%ba%a6%e6%97%85%e6%b8%b8%ef%bc%8c%e7%b1%bb%e4%bc%bcsae%e5%af%bc%e8%88%aa%e8%8f%9c%e5%8d%95%e9%9a%8f%e5%8a%a8'
title: 类似美丽说，类似百度旅游，类似sae导航菜单随动效果
wordpress_id: 176
categories:
- JS
- 前端美工设计
tags:
- JS
- 前端美工设计
---




先看类似的效果效果：




http://www.36ria.com/demo/css3-menu/#  






http://www.emeite.net/index.php?m=search  






原理：当scrollTop>菜单上面代码高度的时候 给导航加个新的class 控制它的位置 反之，删除刚才加的class 让导航回到默认的class




首先，这是你的菜单代码






    
    <p>aa</p><p>aa</p><p>aa</p>
    <div id="menu" class="default">
    <ul>
    <li>
    <a href="#">首页</a>
    </li>
    <li>
    <a href="#">jquery</a>
    </li>
    <li>
    <a href="#">设计</a>
    </li>
    <li>
    <a href="#">flex</a>
    </li>
    <li>
    <a href="#">air</a>
    </li>
    <li>
    <a href="#">ajax</a>
    </li>
    <li>
    <a href="#">html5</a>
    </li>
    <li>
    <a href="#">css3</a>
    </li>
    <li>
    <a href="#">WordPress</a>
    </li>
    </ul>
    </div>
    <p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p>
    <p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p><p>aa</p>

  

定义他的样式







    
    <style>
    body{
    	margin:0;
    }
    #menu {
        background: url("http://sae.sina.com.cn/static/image/menu_bg.png") repeat-x scroll 0 0 transparent;
        height: 45px;
    	width: 100%;
    	text-align: center;
    	margin: 0;
    }
    .default {
        box-shadow: 0 5px 20px #888888;
        height: 50px;
        width: 850px;
    }
    .fixed {
        box-shadow: 0 0 40px #222222;
        left: 0;
        position: fixed;
        top: -5px;
        width: 100%;
    }
    ul li {
        display: inline;
        list-style-type: none;
        margin-right: 15px;
    }
    </style>

  

写个js，实现滚动后出现的功能







    
    <script type="text/javascript">
    $(function(){
    var menu = $('#menu');
    pos = menu.offset();alert(menu.height());
    $(window).scroll(function(){
    if($(this).scrollTop() > pos.top+menu.height() && menu.hasClass('default')){
    menu.fadeOut('fast', function(){
    $(this).removeClass('default').addClass('fixed').fadeIn('fast');
    });
    } else if($(this).scrollTop() <= pos.top && menu.hasClass('fixed')){
    menu.fadeOut('fast', function(){
    $(this).removeClass('fixed').addClass('default').fadeIn('fast');
    });
    }
    });
    })
    </script>

  

  





