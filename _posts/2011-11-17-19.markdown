---
author: admin
comments: true
date: 2011-11-17 02:39:00+00:00
layout: post
slug: '%e5%9b%bd%e5%a4%96%e4%bc%98%e7%a7%80windows7%e6%a1%8c%e9%9d%a2%e6%8f%92%e4%bb%b6rainmeter'
title: 国外优秀Windows7桌面插件RAINMETER
wordpress_id: 19
categories:
- 实用软件技巧
- 操作系统
tags:
- 实用软件技巧
- 操作系统相关
---






这个工具效果很漂亮，自定义功能丰富，推荐有一定动手能力的同学使用。  

性能方面，在开启和windows侧边栏同样功能的工具时，内存占用比windows侧边栏少十倍左右，但使用含图片较多的工具时，易导致CPU占用过高，可以在任务管理器里将进程优先级调至最低，不影响使用。  

  

首先你需要下一个主程序  

[http://rainmeter.googlecode.com/files/Rainmeter-Latest-20090409-32bit.exe](http://rainmeter.googlecode.com/files/Rainmeter-Latest-20090409-32bit.exe)  

然后下载皮肤，放入安装目录的skin文件夹，点击refresh all，在configs里即可选择皮肤即可。  

RSS和天气一类的插件需要打开工具文件夹里的ini文件进行设置.




菜单的介绍：







"Skin menu" 下







Position：设定工具的显示层级







Transparency：调整工具的透明度







Hide on Mouse Over：鼠标放上面时隐藏







Draggable：打勾就可以移动，反之锁定







Save Position：记住位置。







Snap to Edges：贴齐边缘







Click Through：点击穿透 (按住 Ctrl 可取消)。




  

  

下面是优秀皮肤推荐：  

  

**1.Vision**  

这个系列的工具没有背景，淡淡的文字加上若隐若现的性能曲线，配合磨砂暗色调的壁纸，在桌面上相当有感觉，严重推荐！有黑白2种字体可选，包含10多种工具，可以全面监控电脑，天气，新闻。  

  

推荐度：★★★★★  

  

  

![](http://home.pcbeta.com/attachment/200904/28/161978_124090057563I3.jpg)
  

  

**2.Dark_Rainmeter（BGlass）**  

同样全面的监控工具，有黑色淡淡的背景，在比较亮的壁纸上一样有很好的效果。如果在小尺寸屏幕上字体过小可以修改ini文件里字体的大小或搜索使用BGlass（修改版）。  

  

推荐度：★★★★★  

  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240900533PT0Y.jpg)
  

  

**3.CIRCLE**  

也是一套监控工具，特点是圆形的状态仪。没有性能曲线，同样很有特色。  

  

推荐度：★★★★  

  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240900524ceM5.png)  

  

**4.Arcs**  

非常有创意的一款工具，仅用一个超科幻的时钟，监控了电脑各个方面。还有小尺寸版，功能一样不缺。  

  

推荐度：★★★★  

  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240900546V22O.jpg)  

  

**5.Tranquil**   

风格比较可爱的一套，功能不多，只有天气和RSS，还有个钉图片的，需要其他软件支持，需要的朋友请自行钻研(比较麻烦的说-_-)  

  

推荐度：★★★  

  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240900552fWaj.jpg)
  

  

  

**以上5个工具下载地址：**  

[http://www.brsbox.com/filebox/down/fc/16b509d61f4ce077b3a017460fa2a93a](http://www.brsbox.com/filebox/down/fc/16b509d61f4ce077b3a017460fa2a93a)  

  

  

另附两个较丰富的 Rainmeter 皮肤 下载网站  

[http://customize.org/rainmeter](http://customize.org/rainmeter)  

[http://browse.deviantart.com/customization/skins/#order=9&q=rainmeter](http://browse.deviantart.com/customization/skins/#order=9&q=rainmeter)  

  

我临时摆的几个小工具，那个笑脸符号会根据CPU的占用摆出不同的表情哦^-^  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240900875xDXm.png)
  

  

  

  

  

  

**附：天气工具的使用方法**




关于天气修改后,那个温度的" °C "符号显示不正常的问题







解决方法为：打开ini文件.找到Postfix="? 把问好改成 Postfix=°c 就ok了







感谢144楼的朋友【cococol】，我开始都没仔细研究过这个问题。









  *   * 定位到天气工具所在的文件夹，打开INI文件，找到如下字段 
  * 如果希望显示华氏度的话请自行把“&unit=m”去掉。 
  * URL=http://xoap.weather.com/weather/local/CHXX0116?cc=*&unit=m&dayf=6 
  * Font=Calibri（字体名称） 
  *   * 城市代码（weather.com） 
  * name="北京" country="中国" id="CHXX0008"
  * name="上海" country="中国" id="CHXX0116"
  * name="广州" country="中国" id="CHXX0037"
  * name="安顺" country="中国" id="CHXX0005"
  * name="保定" country="中国" id="CHXX0308"
  * name="保山" country="中国" id="CHXX0370"
  * name="长沙" country="中国" id="CHXX0013"
  * name="长春" country="中国" id="CHXX0010"
  * name="常州" country="中国" id="CHXX0015"
  * name="重庆" country="中国" id="CHXX0017"
  * name="成都" country="中国" id="CHXX0016"
  * name="赤峰" country="中国" id="CHXX0286"
  * name="大连" country="中国" id="CHXX0019"
  * name="大里" country="中国" id="CHXX0371"
  * name="大同" country="中国" id="CHXX0251"
  * name="佛山" country="中国" id="CHXX0028"
  * name="抚顺" country="中国" id="CHXX0029"
  * name="福州" country="中国" id="CHXX0031"
  * name="高雄" country="中国" id="TWXX0013"
  * name="桂林" country="中国" id="CHXX0434"
  * name="贵阳" country="中国" id="CHXX0039"
  * name="哈尔滨" country="中国" id="CHXX0046"
  * name="海口" country="中国" id="CHXX0502"
  * name="杭州" country="中国" id="CHXX0044"
  * name="合肥" country="中国" id="CHXX0448"
  * name="惠州" country="中国" id="CHXX0053"
  * name="吉林" country="中国" id="CHXX0063"
  * name="济南" country="中国" id="CHXX0064"
  * name="九江" country="中国" id="CHXX0068"
  * name="开封" country="中国" id="CHXX0072"
  * name="昆明" country="中国" id="CHXX0076"
  * name="拉萨" country="中国" id="CHXX0080"
  * name="兰州" country="中国" id="CHXX0079"
  * name="洛阳" country="中国" id="CHXX0086"
  * name="柳州" country="中国" id="CHXX0479"
  * name="南昌" country="中国" id="CHXX0097"
  * name="南京" country="中国" id="CHXX0099"
  * name="南宁" country="中国" id="CHXX0100"
  * name="南通" country="中国" id="CHXX0101"
  * name="绵阳" country="中国" id="CHXX0351"
  * name="牡丹江" country="中国" id="CHXX0278"
  * name="青岛" country="中国" id="CHXX0110"
  * name="泉州" country="中国" id="CHXX0114"
  * name="绍兴" country="中国" id="CHXX0117"
  * name="汕头" country="中国" id="CHXX0493"
  * name="沈阳" country="中国" id="CHXX0119"
  * name="深圳" country="中国" id="CHXX0120"
  * name="石家庄" country="中国" id="CHXX0122"
  * name="太原" country="中国" id="CHXX0129"
  * name="台北" country="中国" id="TWXX0021"
  * name="台中" country="中国" id="TWXX0019"
  * name="天津" country="中国" id="CHXX0133"
  * name="温州" country="中国" id="CHXX0462"
  * name="乌鲁木齐" country="中国" id="CHXX0135"
  * name="西安" country="中国" id="CHXX0141"
  * name="西宁" country="中国" id="CHXX0236"
  * name="厦门" country="中国" id="CHXX0140"
  * name="香港" country="中国" id="CHXX0049"
  * name="咸阳" country="中国" id="CHXX0143"
  * name="新乡" country="中国" id="CHXX0148"
  * name="新竹" country="中国" id="TWXX0009"
  * name="徐州" country="中国" id="CHXX0437"
  * name="武汉" country="中国" id="CHXX0138"
  * name="武夷山" country="中国" id="CHXX0467"
  * name="延吉" country="中国" id="CHXX0291"
  * name="宜昌" country="中国" id="CHXX0407"
  * name="宜宾" country="中国" id="CHXX0362"
  * name="伊宁" country="中国" id="CHXX0203"
  * name="银川" country="中国" id="CHXX0259"
  * name="岳阳" country="中国" id="CHXX0411"
  * name="张家口" country="中国" id="CHXX0300"
  * name="郑州" country="中国" id="CHXX0165"
  * name="喀布尔" country="阿富汗" id="AFXX0003"
  * name="勘塔哈" country="阿富汗" id="AFXX0004"
  * name="赫拉特" country="阿富汗" id="AFXX0002"
  * name="伊斯兰堡" country="巴基斯坦" id="PKXX0006"
  * name="卡拉奇" country="巴基斯坦" id="PKXX0008"
  * name="平壤" country="朝鲜" id="KNXX0006"
  * name="莫斯科" country="俄罗斯" id="RSXX0063"
  * name="圣彼得堡" country="俄罗斯" id="RSXX0091"
  * name="马尼拉" country="菲律宾" id="RPXX0017"
  * name="汉城" country="韩国" id="KSXX0037"
  * name="釜山" country="韩国" id="KSXX0050"
  * name="安养" country="韩国" id="KSXX0002"
  * name="仁川" country="韩国" id="KSXX0009"
  * name="水原" country="韩国" id="KSXX0025"
  * name="金边" country="柬埔寨" id="CBXX0001"
  * name="永珍" country="老挝" id="LAXX0001"
  * name="贝鲁特" country="黎巴嫩" id="LEXX0003"
  * name="吉隆坡" country="马来西亚" id="MYXX0008"
  * name="马六甲" country="马来西亚" id="MYXX0013"
  * name="乌兰巴托" country="蒙古" id="MGXX0003"
  * name="仰光" country="缅甸" id="BMXX0004"
  * name="加德满都" country="尼泊尔" id="NPXX0002"
  * name="科伦坡" country="斯里兰卡" id="CEXX0001"
  * name="曼谷" country="泰国" id="THXX0002"
  * name="安卡拉" country="土耳其" id="TUXX0002"
  * name="伊斯坦布尔" country="土耳其" id="TUXX0015"
  * name="塔什干" country="乌兹别克斯坦" id="UZXX0004"
  * name="新加坡" country="新加坡" id="SNXX0006"
  * name="巴格达" country="伊拉克" id="IZXX0008"
  * name="德黑兰" country="伊朗" id="IRXX0018"
  * name="耶路撒冷" country="以色列" id="ISXX0010"
  * name="新德里" country="印度" id="INXX0096"
  * name="孟买" country="印度" id="INXX0026"
  * name="雅加达" country="印度尼西亚" id="IDXX0022"
  * name="河内" country="越南" id="VMXX0006"
  * name="胡志明市" country="越南" id="VMXX0007"
  * name="渥太华" country="加拿大" id="CAXX0343"
  * name="多伦多" country="加拿大" id="CAXX0504"
  * name="蒙特利尔" country="加拿大" id="CAXX0301"
  * name="班夫" country="加拿大" id="CAXX0023"
  * name="卡尔加里" country="加拿大" id="CAXX0054"
  * name="温哥华" country="加拿大" id="CAXX0518"
  * name="维多利亚" country="加拿大" id="CAXX0523"
  * name="波特兰" country="美国" id="USOR0275"
  * name="费城" country="美国" id="USPA1276"
  * name="匹兹堡" country="美国" id="USPA0857"
  * name="休斯敦" country="美国" id="USTX0617"
  * name="迈阿密" country="美国" id="USFL0316"
  * name="华盛顿" country="美国" id="USDC0001"
  * name="西雅图" country="美国" id="USWA0395"
  * name="洛杉矶" country="美国" id="USCA0683"
  * name="旧金山" country="美国" id="USCA0987"
  * name="丹佛" country="美国" id="USCO0105"
  * name="波士顿" country="美国" id="USMA0046"
  * name="亚特兰大" country="美国" id="USGA0028"
  * name="底特律" country="美国" id="USMI0229"
  * name="拉斯韦加斯" country="美国" id="USNV0049"
  * name="纽约" country="美国" id="USNY0996"
  * name="曼彻斯特" country="美国" id="USNH0136"
  * name="大西洋城" country="美国" id="USNJ0015"
  * name="芝加哥" country="美国" id="USIL0225"
  * name="布宜诺斯艾利斯" country="阿根廷" id="ARBA0009"
  * name="亚松森" country="巴拉圭" id="PAXX0001"
  * name="巴西利亚" country="巴西" id="BRXX0043"
  * name="卡萨布兰卡" country="巴西" id="BRXX0537"
  * name="圣保罗" country="巴西" id="BRXX0232"
  * name="塔利亚" country="玻利维亚" id="BL000015"
  * name="基多" country="厄瓜多尔" id="ECXX0008"
  * name="亚美尼亚" country="哥伦比亚" id="COXX0001"
  * name="佩雷拉" country="哥伦比亚" id="COXX0024"
  * name="波哥达" country="哥伦比亚" id="COXX0004"
  * name="圣地亚哥" country="古巴" id="CUXX0010"
  * name="哈瓦那" country="古巴" id="CUXX0003"
  * name="利马" country="秘鲁" id="PEXX0011"
  * name="墨西哥城" country="墨西哥" id="M***0079"
  * name="巴伦西亚" country="委内瑞拉" id="VEXX0031"
  * name="蒙特维德亚" country="乌拉圭" id="UYXX0006"
  * name="圣地亚哥" country="智利" id="CIXX0020"
  * name="悉尼" country="澳大利亚" id="ASXX0112"
  * name="墨尔本" country="澳大利亚" id="ASXX0075"
  * name="堪培拉" country="澳大利亚" id="ASXX0023"
  * name="奥克兰" country="新西兰" id="NZXX0003"
  * name="惠灵顿" country="新西兰" id="NZXX0049"
  * name="地拉那" country="阿尔巴尼亚" id="ALXX0002"



_复制代码_**==================================================  

  

  

PART3:最新的HandelGotD+雅黑6.02组合字体推荐  

直接安装可完美替换win7雅黑（含粗体！），注销后即可看到。中文版未做测试，请用了朋友PM我反馈效果。回帖中有朋友提到安装中文语言包后无法安装字体，建议将系统语言设置为英语，注销后再试试。  

  

字体下载地址：**  

[**http://www.brsbox.com/filebox/down/fc/73ea68a706d677b4b9fa211c27e19a27**](http://www.brsbox.com/filebox/down/fc/73ea68a706d677b4b9fa211c27e19a27)  

  

开始的侧边栏工具里截图中显示的字体是我已经用最新的HandelGotD+雅黑6.02组合（含有粗体，就是我使用的）替换了系统自带雅黑的效果。  

附效果图  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240905520nza1.png)  

粗体效果  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240908704H7v0.png)  

  

  

**下载包内含工具**  

![](http://home.pcbeta.com/attachment/200904/28/161978_1240914018d7zD.png)
  

  

  

要更彻底修改的话可以在桌面上右键-个性化-颜色-高级设置，把每项都调成粗斜体，再加上GDI++渲染，就可以达到我的效果了。


  


