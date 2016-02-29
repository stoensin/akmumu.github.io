---
author: admin
comments: true
date: 2012-07-25 05:10:00+00:00
layout: post
slug: zend-studio%e4%b8%ad%e5%bc%80%e5%8f%91%e5%b8%b8%e7%94%a8%e5%bf%ab%e6%8d%b7%e9%94%ae%ef%bc%8c%e5%ad%97%e7%ac%a6%ef%bc%8c%e6%a8%a1%e6%9d%bf%e8%ae%be%e7%bd%ae
title: Zend studio中开发常用快捷键，字符，模板设置
wordpress_id: 40
categories:
- 实用软件技巧
tags:
- 实用软件技巧
---



    
    <span style="color:#800080">1</span>、快捷键设置



    
    　　在zendstudio中开发的过程中，我们应专注与代码的逻辑中，而不是把一大半的时间都浪费在编辑器的操作以及鼠标的点击中，经常使用快捷键进行操作会达到事半功倍的效果，下面就列　　出一些在项目中经常使用的一些快捷键，希望能提高你的开发效率。



    
    　　Ctrl+<span style="color:#000000">'鼠标左键点击函数名或者方法名'</span> 此快捷键可说是很典型的了，可以查找跳转到该方法定义的文件行。



    
    　　Ctrl+/ 单行注释。当前为php代码时，则在光标所在行添加双斜杠行注释，选择多行则每一行都添加双斜杠；
    　　　　　　而当代码为html时则在行前后添加<!-- -->注释，选中多行将在选区前后添加<!-- -->注释，而非每行添加；
    　　　　　　取消的话，则继续按下一次就可以了。



    
    　　Ctrl+Shift+/   块注释，为选择的PHP代码添加<span style="color:#008000">/*</span> <span style="color:#008000">*/</span>块注释，如果没有选择任何代码，则将光标所在行添加块注释。



    
    　　Ctrl+Shift+f  对代码进行快速的格式化，将代码的格式进行调整，就是为了代码的美观，在函数和括号之间加一些空格，以及头部空格变为tab缩进。



    
    　　Ctrl+H(Ctrl+Shift+h) 在整个项目中来查找某一个方法名，或者是其它相关的文件名。



    
    　　Shift+Enter 在光标所在行的下面新增一行，同时光标跳转到新增行的头部。之前为了在某一行的下面插入一行，需要用鼠标将光标定位到行的末尾，然后在按Enter键进行换行插入，此　　　　快捷键避免了多步的操作，个人感觉用着很爽的说。



    
    　　Ctrl+Shift+Enter 跟上面相反，在上面插入一行。



    
    <span style="color:#800080">2</span>、设置字符编码与换行符
    　　步骤：Window -> Preferences -> General -> Workspace，在“Text file encoding”和“New text file line delimiter”中设置。
    　　项目单独设置，步骤：右击项目名 -> Properties -> Resource，在“Text file encoding”和“New text file line delimiter”中设置。
    
    <span style="color:#800080">3</span>、设置编辑器的Tab键
    　　步骤：Window -> Preferences -> General -> Text Editors，勾选“Insert spaces <span style="color:#0000ff">for</span> tabs”选项，并且在“Displayed tab width”后的输入框中输入空格数，这些空格将　　代表一个Tab键。
    
    <span style="color:#800080">4</span>、自动去除结尾空格
    　　步骤：Window -> Preferences -> PHP -> Save Actions，勾选“Remove trailing whitespace”,另外，还可以再选择“All lines”或“Ignors empty lines”。
    　　项目单独设置,步骤：右击项目名 -> Properties -> Save Actions，勾选“Remove trailing whitespace”。
    
    <span style="color:#800080">5</span>、代码格式整理
    　　当使用快捷键(Ctrl+Shift+F)整理代码格式时，会自动将缩进的空格转换成Tab。
    　　注：显示空白字符，步骤：Window -> Preferences -> General -> Text Editors,勾选Show Whitespace characters选项。
    
    <span style="color:#800080">6</span>、模板设置(文件注释、函数注释、代码块等)
    
    　　步骤：Window -> PHP -> Editor -> Templates，这里可以设置（增、删、改、导入等）管理你的模板。
    　　新建文件注释、函数注释、代码块等模板的实力 
    　　新建模板，分别输入Name、Description、Pattern
    　　a)文件注释
    　　Name: 3cfile
    　　Description: df3c文件注释模板
    　　Pattern:
    <span style="color:#008000">　　/*</span><span style="color:#008000">*
    　　 * DF3C xx文件
    　　 * ==============================================
    　　 * 版权所有 2010-2011 </span><span style="color:#008000"><u>http://www.df3c.com</u></span><span style="color:#008000">
    　　 * ----------------------------------------------
    　　 * 这不是一个自由软件，未经授权不许任何使用和传播。
    　　 * ==============================================
    　　 * @date: ${date}
    　　 * @author: ${user}
    　　 * @version: 
    </span><span style="color:#008000">　　*/</span>
    
    　　b)方法注释
    　　Name: 3cmethod
    　　Description: df3c方法注释模板
    　　Pattern:
    <span style="color:#008000">　　/*</span><span style="color:#008000">*
    　　 * 函数用途描述
    　　 * @date: ${date}
    　　 * @author: ${user}
    　　 * @return: 
    </span><span style="color:#008000">　　*/</span>
    
    　　c)if格式
    　　Name: 3cif
    　　Description: df3c if格式模板
    　　Pattern:
    <span style="color:#0000ff">　　if</span> (${condition}) {
    　　    ${cursor};
    　　}
    
    　　进入PHP文件中，输入3cfile、3cmethod或3cif等，回车就可以调出模板内容，以便开发中编码的规范。
    
    　　注: 有时你可能会觉得提示响应不够迅速，你可以设置下缩短自动提示的延迟时间。
    　　步骤：在window -> Preferences -> PHP -> Editor -> Content Assist中，勾选“Enable auto activation”，并设置“Auto activation delay(<span style="color:#0000ff">in</span> msecs)”的值。单位　　为毫秒，默认设置一般为500，建议设置为200。



