---
author: admin
comments: true
date: 2012-10-08 05:49:00+00:00
layout: post
slug: '%e8%af%a6%e7%bb%86%e8%ae%b2%e8%a7%a3phpcb%e6%89%b9%e9%87%8f%e8%bd%ac%e6%8d%a2%e7%9a%84%e4%bb%a3%e7%a0%81%e7%a4%ba%e4%be%8b'
title: 详细讲解phpCB批量转换的代码示例
wordpress_id: 84
categories:
- PHP
- 实用软件技巧
tags:
- php程序设计
- 实用软件技巧
---




我们在使用[PHP语言](http://developer.51cto.com/art/200810/94162.htm)的时候会遇到转换图片文件的需求。如果实现批量转换的话，就能节约大量的时间。下面我们就为大家具体讲解有关phpCB批量转换的方法。










最近需要整理一个整站的php代码规范视图，前几天发现phpCB整理视图非常好，但有个缺点是不能批量处理，使用过程中发现phpCB是一个CMD程序，马上就想到php的system函数调用cmd，想到就做，下面是phpCB批量转换的php程序：






  1. 
**<** ?
 
  2. 
header("Content-type: text/html; charset=gb2312");
 
  3. 
define('ROOT_PATH', dirname(__FILE__)); 
  4. 
$topath="ww"; //要格式化视图的目录名，前后都不要“/”
 
  5. 
$path=ROOT_PATH."/".$topath;
 
  6. 
$arr=get_all_files($path);
 
  7. 
for($i=0;$i**<count**($arr);$i++)
 
  8. 
{ 
  9. 
$phpext=fileext($arr[$i]);
 
  10. 
if($phpext=="php")
 
  11. 
{ 
  12. 
$cmd="phpCB.exe ".$arr[$i]." **>** ".$arr[$i].".phpCB";
 
  13. 
system($cmd); 
  14. 
unlink($arr[$i]); 
  15. 
@rename($arr[$i].".phpCB",$arr[$i]); 
  16. 
} 
  17. 
} 
  18. 
function get_all_files($path){ 
  19. 
$list = array();
 
  20. 
foreach(glob($path . '/*') as $item){ 
  21. 
if(is_dir($item)){ 
  22. 
$list = array_merge($list , get_all_files( $item ));
 
  23. 
} else { 
  24. 
$list[] = $item; 
  25. 
} 
  26. 
} 
  27. 
return $list; 
  28. 
} 
  29. 
function fileext($filename) { 
  30. 
return trim(substr(strrchr($filename, '.'), 1, 10)); 
  31. 
} 
  32. 
**?>**






phpCB批量转换的使用方法：把phpCB.exe放在windows/system32/目录下，php执行程序和要转换的文件夹放同一级路径，先配置$topath，然后在浏览器里访问本程序，没有结果输出。



