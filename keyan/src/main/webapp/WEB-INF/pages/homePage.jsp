<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="static/new/images/dynamic/img_logo_01.ico" type="image/x-icon"/>
    <link rel="shortcut" href="static/new/images/dynamic/img_logo_01.ico" type="image/x-icon"/>
    <link href="static/new/css/dynamic/home.css" rel="stylesheet" type="text/css"/>
    <link href="static/new/css/dynamic/news.css" rel="stylesheet" type="text/css"/>
    <link href="static/new/css/dynamic/comm.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="static/new/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="static/new/js/js.cookie-2.1.0.min.js"></script>
    <script type="text/javascript" src="static/new/js/bootstrap-carousel.js"></script>
    <script type="text/javascript" src="static/new/js/pages/finalparameter.js"></script>
    <script type="text/javascript" src="static/new/js/jquerySession.js"></script>
    <script src="static/new/js/pages/homePage.js" type="text/javascript"></script>

    <title>全国学前教育信息化管理平台</title>
</head>

<body>
<input type="text" value="${requestScope.userId}">
<div class="frame">
    <div class="container-news">
        <ul>
            <li><a href="index-tunyaya.jsp" target="_self">首页</a></li>
            <li><a href="infantedunews.jsp?sign=YJZX" target="_self">最新资讯</a></li>
            <li><a href="kindergarten-list.jsp" target="_self">园所门户</a></li>
            <li><a href="http://kidchina.net/template/index.thtml" target="_self">资源中心</a></li>
            <li><a href="dynamic.jsp" target="_self">家园互动</a></li>
            <li><a href="app-list.jsp" target="_self">应用中心</a></li>
            <li><a href="" target="_self">研修中心</a></li>
            <li><a href="forum-list.jsp" target="_self">社区中心</a></li>
            <li><a href="http://kidchina.net/template/index.thtml" target="_self">调研中心</a></li>
        </ul>

    </div>
</div>
<!--headTop end-->
<div class="head clear">
    <div class="container">
        <div class="headLeft">
            <a href=""><img src="static/new/images/dynamic/img_logo_01.jpg" height="63" width="95" alt=""/></a>
            <img src="static/new/images/dynamic/img_logo_02.jpg" height="63" width="19" alt=""/>
            <a href=""><img src="static/new/images/dynamic/img_logo_03.png" height="63" width="328" alt=""/></a>
        </div>
        <div class="headRight">
            <div class="loginEntry" style="font-size:12px;"><span id="infoShow"></span> <span
                    id="loginPrelogin"><a>登录</a></span>
                <a id="setStatus" href=""></a> <a id="registerShow">注册</a></div>
            <div class="search" style="background:url(static/new/images/dynamic/bg_searchTop-orange.jpg)"><input
                    type="text" id="searchTop"/><a href="javascript:queryKeyValue();" class="searchBtn"></a></div>
        </div>
    </div>
</div>
<!--head end-->
<div class="navigation-news" style="background:#f6a006;">
    <div class="container">
        <ul>
            <li><a href="dynamic.jsp" target="_self">互动首页</a></li>
            <li><a href="dynamic-list.jsp" target="_self">班级动态</a></li>
            <li><a href="dynamic-photo.jsp" target="_self">班级相册</a></li>
            <li><a href="dynamic-fusion.jsp" target="_self">时光轴</a></li>
            <li><a href="message-list.jsp" target="_self">留言板</a></li>
        </ul>
    </div>
</div>
<!--navigation end-->
<div class="list-news" style="margin-top:20px;">
    <div class="container">
        <div class="commLeft">
            <!-- <div class="commScroll"><img src="static/new/images/dynamic/focus-pic_03.png" style="display:inline;"></div> -->
            <div id="myCarousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item"><a href=""><img src="static/new/images/dynamic/app-pic.jpg"
                                                             id="photoWall0" style="width:689px;height:405px"></a></div>
                    <div class="item"><a href=""><img src="static/new/images/dynamic/app-pic.jpg" id="photoWall1"
                                                      style="width:689px;height:405px"></a></div>
                    <div class="item"><a href=""><img src="static/new/images/dynamic/app-pic.jpg" id="photoWall2"
                                                      style="width:689px;height:405px"></a></div>
                </div>
                <!-- Carousel nav -->
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
            </div>
            <div class="commTitle">最新动态</div>
        </div>
        <div class="commRight">
            <div class="commLogin" style=" background:#f6a006;">
                <ul style="margin-top:5px;padding-top:30px;padding-left:35px; background:#fff; ">
                    <li style="height:40px;float:left; display:inline-block; text-align:left;">
                        <img id="photoUrl" src="static/new/images/dynamic/littlepic-blue.png"
                             style="width:63px;height:57px;" data-bd-imgshare-binded="1">
                    </li>
                    <p style=" height:40px; line-height:30px; font-size:14px; color:#60605f; ">欢迎您<br>加入豚丫丫家园互动</p>

                    <li id="userNameInput"
                        style=" height:20px; width:200px;text-align:left;margin-top:30px; line-height:20px; font-size:13px;">
                        <img src="static/new/images/dynamic/username_06.jpg" data-bd-imgshare-binded="1"></li>
                    <li id="classNameInput"
                        style=" height:20px; text-align:left;margin-top:10px;line-height:20px; font-size:13px;"><img
                            src="static/new/images/dynamic/class_06.jpg" align="absbottom"
                            data-bd-imgshare-binded="1"></li>
                    <li id="schoolNameInput"
                        style=" height:20px; text-align:left;margin-top:10px; padding-bottom:10px;line-height:20px;  font-size:13px;">
                        <img src="static/new/images/dynamic/school_01.jpg" align="absbottom"
                             data-bd-imgshare-binded="1"></li>

                </ul>

                <ul>
                    <li><img src="static/new/images/dynamic/login-flower_11.jpg" data-bd-imgshare-binded="1"></li>
                </ul>
                <ul style="height:125px; line-height:125px;text-align:center; font-size:24px; font-family:'幼圆'; color:#fff;">
                    <li>因为爱，所以爱</li>
                </ul>
            </div>
            <div class="side">
                <div class="itemTitle" style="color:#f6a006;">热门动态</div>
                <div class="sortsItem">
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--content end-->
<div class="frame" style="padding-top: 30px;">
    <div class="footer">
        <div class="container clear">
            <div class="row_1" style="padding-right: 0px;">
                <p class="title"><a target="_blank" href="http://www.eiia.cn" style="color:#515151;">关于联盟</a></p>
                <p class="title"><a target="_blank" style="color:#515151;">关于研究院</a></p>
                <p class="title"><a target="_blank" href="http://www.createview.com.cn" style="color:#515151;">关于创显</a>
                </p>
                <p class="title"><a target="_blank" href="http://www.njxunyun.com" style="color:#515151;">关于迅云</a></p>
            </div>
            <div class="row_2">
                <p class="title">主办单位</p>
                <p>中国教育技术协会中小学专业委员会</p>
                <p>幼儿教育协作研究会</p>
            </div>
            <div class="row_3">
                <p class="title">帮助中心</p>
                <p>疑难问答</p>
                <p>使用手册</p>
            </div>
            <div class="row_4">
                <p class="title2">400 881 0902</p>
                <p style="padding-bottom:15px;">
            <span style="float:left;">
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3304128829&site=qq&menu=yes">
                    <img border="0" src="http://wpa.qq.com/pa?p=2:3304128829:41" alt="点击这里给我发消息" title="点击这里给我发消息"/>
                </a>
            </span>
                    <span>（7*24小时）</span>
                </p>
                <p class="codeImg"><span><img src="static/new/images/tunyaya/img_code_1.jpg"/></span><span><img
                        src="static/new/images/tunyaya/img_code_2.jpg"/></span></p>
                <p class="codeImg"><span>服务号</span><span>订阅号</span></p>
            </div>
        </div>
        <div class="container footerCopy">
            <p>©2016 南京迅云网络科技有限公司 版权所有 备案/许可证编号：<a href="http://www.miibeian.gov.cn/" target="_blank">苏ICP备140 187 28</a> 技术支持: 南京迅云网络科技有限公司</p>
            <p>地址：江苏省南京市雨花台区雨花经济开发区三鸿路6号6幢 江苏国家数字出版基地11楼</p>
        </div>
    </div>
</div>
</body>
</html>
