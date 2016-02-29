---
author: admin
comments: true
date: 2012-10-31 10:25:00+00:00
layout: post
slug: centoslinux%e5%ae%89%e8%a3%85mysql-groonga-mroonga%e5%ad%98%e5%82%a8%e5%bc%95%e6%93%8e
title: centoslinux安装mysql groonga mroonga存储引擎
wordpress_id: 115
categories:
- LINUX
- MYSQL
- 实用软件技巧
tags:
- linux
- Mysql
- 实用软件技巧
---





groonga是一款可嵌入式的全文搜寻引擎,具有储存功能和全文搜寻的检索功能.





mroonga是基于groonga的引擎





系统:centos 5.5 (32位)





需要的软件包:groonga-2.0.3.tar.gz mroonga-2.03.tar.gz





1.安装前准备

















<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`yum
 -y ``install` `gcc
 gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`2`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`freetype
 freetype-devel libxml2 libxml2-devel zlib zlib-devel `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`3`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`glibc
 glibc-devel glib2 glib2-devel ``bzip2` `bzip2``-devel
 ncurses ncurses-devel `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`4`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`curl
 curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devellibidn libidn-devel `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`5`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`openssl
 openssl-devel openldap openldap-devel nss_ldap `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`6`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`openldap-clients
 openldap-servers libtool libtool-devel`
</td>
</tr>
</tbody>
</table>


















我这里是基于多个mysql环境下,只对一个mysql进行安装groonga,多mysql安装请看[centos单机编译安装多个mysql共存](http://blog.slogra.com/post-199.html)这篇文章.

















<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`wget [http://packages.groonga.org/](http://packages.groonga.org/)``source``/groonga/groonga-2.0.3.``tar``.gz`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`2`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`wget [http://cloud.github.com/downloads/mroonga/mroonga/mroonga-2.03.](http://cloud.github.com/downloads/mroonga/mroonga/mroonga-2.03.)``tar``.gz`
</td>
</tr>
</tbody>
</table>


















2.安装mecab





大家可以看我这篇[linux安装日文分词(mecab)](http://blog.slogra.com/post-203.html)文章.





  







3.安装groonga





tar zxf groonga-2.0.3.tar.gz && cd groonga-2.0.3














<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`./configure
 --prefix=/usr/``local``/groonga`
</td>
</tr>
</tbody>
</table>















[![点击查看原图](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_b4b1959477263cb35fbdfc723cc504b1201206092038541162837073.jpg)](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_b4b1959477263cb35fbdfc723cc504b1201206092038541162837073.jpg)  







看到这个图就表示没有问题可以继续make














<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`make` `&& ``make` `install`
</td>
</tr>
</tbody>
</table>















4.安装mroonga

















<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`./configure
 PKG_CONFIG_PATH=/usr/``local``/groonga/lib/pkgconfig/
 `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`2`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`--with-mysql-``source``=/root/mysql-5.5.18
 `
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`3`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`--with-mysql-config=/usr/``local``/mysql07/bin/mysql_config`
</td>
</tr>
</tbody>
</table>


















没有问题就执行make














<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`make` `&& ``make` `install`
</td>
</tr>
</tbody>
</table>















5.mysql中加入引擎





/usr/local/mysql07/bin/mysql -u root -p





这里我是加的3307这个端口的mysql





进入mysql后执行














<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`show
 engines;`
</td>
</tr>
</tbody>
</table>















[![点击查看原图](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_46a7cb3c08ce5267e1490ae92b80245320120609203853339424669.jpg)](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_46a7cb3c08ce5267e1490ae92b80245320120609203853339424669.jpg)  







可以看到里面没有groonga引擎,然后执行

















<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`INSTALL
 PLUGIN groonga SONAME ``'ha_groonga.so'``;`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`2`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`CREATE
 FUNCTION last_insert_grn_id RETURNS INTEGER soname ``'ha_groonga.so'``;`
</td>
</tr>
</tbody>
</table>


















然后再执行show engines来查看引擎





[![点击查看原图](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_0a688c83f24c71f7ef73a8ec00885e0f20120609203854297606221.jpg)](http://akmumu-wordpress.stor.sinaapp.com/wp-content/uploads/pic/other_site/blog_slogra_0a688c83f24c71f7ef73a8ec00885e0f20120609203854297606221.jpg)  







可以看到已经有groonga引擎了.





6.验证





在mysql中执行

















<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`1`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`mysql>
 create database tt;`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`2`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`mysql>
 use tt`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`3`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`mysql>
 create table ```test```
 ( ```id```
 int(11) NOT NULL, `name` varchar(45) NOT NULL, `notes` text,FULLTEXT INDEX (`notes`) ) ENGINE=groonga DEFAULT CHARSET=utf8;`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`4`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`mysql>
 SELECT * FROM ``test` `where
 MATCH(notes) AGAINST(``"CSS"``);`
</td>
</tr>
</tbody>
</table>






<table style="border-bottom:rgb(204,204,204) 1px solid; position:static!important; text-align:left!important; border-left:rgb(204,204,204) 1px solid; padding-bottom:0px!important; line-height:1.1em!important; margin:5px 0px 10px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; border-collapse:collapse!important; float:none!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; border-right:rgb(204,204,204) 1px solid; padding-top:0px!important; top:auto!important; left:auto!important" >
<tbody style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >
<tr style="position:static!important; padding-bottom:0px!important; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:0px!important; outline-width:0px!important; width:auto!important; bottom:auto!important; padding-right:0px!important; float:none!important; border-top-width:0px!important; border-bottom-width:0px!important; height:auto!important; font-size:1em!important; vertical-align:baseline!important; border-left-width:0px!important; right:auto!important; padding-top:0px!important; top:auto!important; left:auto!important" >

<td style="position:static!important; padding-bottom:2px; line-height:1.1em!important; border-right-width:0px!important; margin:0px; outline-color:!important; padding-left:10px; outline-width:0px!important; width:3em!important; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; color:rgb(175,175,175)!important; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; border-left-width:0px!important; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="number" >
`5`
</td>

<td style="position:static!important; border-left:rgb(108,226,108) 3px solid; padding-bottom:2px; border-right-width:0px!important; overflow-x:hidden; overflow-y:hidden; margin:0px; outline-color:!important; padding-left:0.5em!important; outline-width:0px!important; width:580px; bottom:auto!important; padding-right:10px; font-family:Consolas,'Bitstream Vera Sans Mono','Courier New',Courier,monospace!important; float:none!important; border-bottom-width:0px!important; height:auto!important; clear:both; font-size:1em!important; vertical-align:top!important; border-top:rgb(204,204,204) 1px solid; right:auto!important; padding-top:2px; top:auto!important; left:auto!important" class="content" >
`Empty ``set` `(0.01
 sec)`
</td>
</tr>
</tbody>
</table>


















对其进行查询可以发现groonga引擎已经可以使用了,好了,就到这里吧.





本文发布于夜空[http://blog.slogra.com/](http://blog.slogra.com/),转载请保留此版权信息！



