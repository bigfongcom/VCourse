<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->  
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title><%=request.getParameter("pageTitle")%>-${web_setting.sitename}</title>

    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- CSS Global Compulsory-->
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/css/style.css" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/css/headers/header1.css" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/bootstrap/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/css/style_responsive.css" />
    <link rel="shortcut icon" href="favicon.ico" />        
    <!-- CSS Implementing Plugins -->    
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/flexslider/flexslider.css" type="text/css" media="screen" />    	
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/parallax-slider/css/parallax-slider.css" type="text/css" />
    
    <link rel="stylesheet" href="<%=basePath%>Public/web/plugins/portfolioSorting/css/sorting.css" />
    
    <!-- CSS Theme -->    
    <link rel="stylesheet" href="<%=basePath%>Public/web/css/themes/default.css" id="style_color" />
    <link rel="stylesheet" href="<%=basePath%>Public/web/css/headers/header1.css" id="style_color-header-1" />    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>	
	<script type="text/javascript">
	var basePath="<%=basePath%>";
	</script>
<body>

<!--=== Top ===-->    
<div class="top">
    <div class="container">         
        <ul class="loginbar pull-right">
            <c:choose>
            <c:when test="${sessionScope.student_id!=null }">
            <li><a href="<%=basePath%>user" class="login-btn">个人中心</a></li> 
            <li class="devider">&nbsp;</li>
            <li><a href="<%=basePath%>logout" class="login-btn">安全退出</a></li> 
            </c:when>
            <c:otherwise>
            <li><a href="<%=basePath%>register" class="login-btn">注册</a></li>  
            <li class="devider">&nbsp;</li>
            <li><a href="<%=basePath%>login" class="login-btn">登陆</a></li> 
            </c:otherwise>
            </c:choose>
              
        </ul>
    </div>      
</div><!--/top-->
<!--=== End Top ===-->    

<!--=== Header ===-->
<div class="header">               
    <div class="container"> 
        <!-- Logo -->       
        <div class="logo">                                             
            <a href="index.html"><img id="logo-header" width="150"   src="<%=basePath%>Public/web/img/logo-1.png" alt="Logo" /></a>
        </div><!-- /logo -->        
                                    
        <!-- Menu -->       
        <div class="navbar">                                
            <div class="navbar-inner">                                  
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a><!-- /nav-collapse -->                                  
                <div class="nav-collapse collapse">                                     
                    <ul class="nav top-2">
                        <c:choose>
		                 <c:when test="${course_action=='atHome' }"><li class="active"></c:when>
		                 <c:otherwise><li></c:otherwise>
		                 </c:choose>
                            <a href="<%=basePath%>"  >首页
                            </a>
                        </li>
                        <c:choose>
		                 <c:when test="${course_action=='all' }"><li class="active"></c:when>
		                 <c:otherwise><li></c:otherwise>
		                 </c:choose>
                            <a href="<%=basePath%>all"  >全部视频
                            </a>
                        </li>
                        <c:choose>
		                 <c:when test="${course_action=='hot' }"><li class="active"></c:when>
		                 <c:otherwise><li></c:otherwise>
		                 </c:choose>
                            <a href="<%=basePath%>hot" >热点视频
                            </a>
                        </li>
                       <c:choose>
		                 <c:when test="${course_action=='new' }"><li class="active"></c:when>
		                 <c:otherwise><li></c:otherwise>
		                 </c:choose>
                            <a href="<%=basePath%>new" >最新视频展示
                            </a>
                        </li>
                        
                        <li><a class="search"><i class="search-btn icon-search"></i></a></li>
                    </ul>
                    <div class="search-open">
                        <div class="input-append">
                            <form method="get" action="<%=basePath%>all"/>
                                <input name="keywords" type="text" class="span3" placeholder="搜索课程" />
                                <button type="submit" class="btn-u">搜索</button>
                            </form>
                        </div>
                    </div>
                </div><!-- /nav-collapse -->                                
            </div><!-- /navbar-inner -->
        </div><!-- /navbar -->                          
    </div><!-- /container -->               
</div><!--/header -->      
<!--=== End Header ===-->