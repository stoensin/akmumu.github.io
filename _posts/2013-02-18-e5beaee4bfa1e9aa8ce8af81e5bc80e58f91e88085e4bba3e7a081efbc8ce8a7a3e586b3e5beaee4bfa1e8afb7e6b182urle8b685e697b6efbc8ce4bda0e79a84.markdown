---
author: admin
comments: true
date: 2013-02-18 05:50:00+00:00
layout: post
slug: '%e5%be%ae%e4%bf%a1%e9%aa%8c%e8%af%81%e5%bc%80%e5%8f%91%e8%80%85%e4%bb%a3%e7%a0%81%ef%bc%8c%e8%a7%a3%e5%86%b3%e5%be%ae%e4%bf%a1%e8%af%b7%e6%b1%82url%e8%b6%85%e6%97%b6%ef%bc%8c%e4%bd%a0%e7%9a%84'
title: 微信验证开发者代码，解决微信请求URL超时，你的服务器没有正确响应Token验证，请阅读消息接口使用指南
wordpress_id: 163
categories:
- PHP
- 开放平台
tags:
- php程序设计
- 开放平台
---




注册微信公众平台后要成为开发者，token可以随意定义，url输入的不行就通过不了，会提示url超时，或者你的服务器没有正确响应Token验证，请阅读消息接口使用指南，下面你要有你的主机，写一个php文件，内容如下，将此php文件的url地址写上就ok了




  








    
    <?php
    define ( "TOKEN", "dismath" );
    $wechatObj = new wechatCallbackapiTest();
    $wechatObj->valid();
    
    class wechatCallbackapiTest
    {
        public function valid()
        {
            $echoStr = $_GET["echostr"];        //随机字符串
            if($this->checkSignature()){
                echo $echoStr;
                exit;
            }
        }
    	private function checkSignature() {
          $signature = $_GET ["signature"];
          $timestamp = $_GET ["timestamp"];
          $nonce = $_GET ["nonce"];
          $token = TOKEN;
          $tmpArr = array (
                $token,
                $timestamp,
                $nonce
          );
          sort ( $tmpArr );
          $tmpStr = implode ( $tmpArr );
          $tmpStr = sha1 ( $tmpStr );
          
          if ($tmpStr == $signature) {
            return true;
          } else {
            return false;
          }
        }   
    }  

  

  






  





