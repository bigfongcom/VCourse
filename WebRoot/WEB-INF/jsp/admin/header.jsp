<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Mosaddek">
    <meta http-equiv="keywords" content="${requestScope.web_setting.keywords}">
	<meta http-equiv="description" content="${requestScope.web_setting.description}">
    <link rel="shortcut icon" href="img/favicon.png">

    <title><%=request.getParameter("pageTitle")%></title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>Public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>Public/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=basePath%>Public/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>Public/css/owl.carousel.css" type="text/css">

    <!--right slidebar-->
    <link href="<%=basePath%>Public/css/slidebars.css" rel="stylesheet">

    <!-- Custom styles for this template -->

    <link href="<%=basePath%>Public/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>Public/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="<%=basePath%>Public/js/html5shiv.js"></script>
      <script src="<%=basePath%>Public/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!--header start-->
      <header class="header white-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="<%=basePath%>" target="_blank" class="logo"><span>${requestScope.web_setting.sitename}</span></a>
            <!--logo end-->
            <div class="top-nav ">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="<%=basePath%>${sessionScope.manager_thumb}" style="width:30px; height:30px;">
                            <span class="username">${sessionScope.manager_username}</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout" style="width:30px !important;">
                            <div class="log-arrow-up"></div>
                            <li style="width:100%"><a href="<%=basePath%>admin/manager/profile">个人信息</a></li>
                            <li><a href="<%=basePath%>sys/logout">退出</a></li>
                        </ul>
                    </li>
                     
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
      <!--header end-->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li>
                      <a  <c:if test="${requestScope.cur_url=='/admin/index'}">class="active"</c:if> href="<%=basePath%>admin/index">
                          <i class="fa fa-dashboard"></i>
                          <span>后台首页</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" <c:if test="${requestScope.cur_url=='/admin/course/add'
                       || requestScope.cur_url=='/admin/course/list'
                       || requestScope.cur_url=='/admin/course/edit'
                       || requestScope.cur_url=='/admin/course/video-add'
                       || requestScope.cur_url=='/admin/course/video-edit'
                       || requestScope.cur_url=='/admin/course/video-list'
                      }">class="active"</c:if>>
                          <i class="fa fa-book"></i>
                          <span>课程管理</span>
                      </a>
                      <ul class="sub">
	                      <c:if test="${sessionScope.manager_role==2}">
	                      	  <li><a   href="<%=basePath%>admin/course/video-add">添加视频</a></li>
	                          <li><a   href="<%=basePath%>admin/course/add">添加课程</a></li>
	                      </c:if>
                          <li><a  href="<%=basePath%>admin/course/list">课程列表</a></li>
                      </ul>
                  </li>
				<c:if test="${sessionScope.manager_role==1}">
                  <li class="sub-menu">
                      <a  <c:if test="${requestScope.cur_url=='/admin/student'}">class="active"</c:if> href="<%=basePath%>admin/student/index">
                          <i class="fa fa-comments-o"></i>
                          <span>学员管理</span>
                      </a>
                  </li>
                 
                  <li class="sub-menu">
                      <a href="javascript:;" <c:if test="${requestScope.cur_url=='/admin/manager/add' || requestScope.cur_url=='/admin/manager/list'}">class="active"</c:if>>
                          <i class="fa fa-user"></i>
                          <span>讲师/管理员</span>
                      </a>
                      <ul class="sub">
                          <li><a   href="<%=basePath%>admin/manager/add">添加管理员</a></li>
                          <li><a  href="<%=basePath%>admin/manager/list">管理员列表</a></li>
                      </ul>
                  </li>
                  </c:if>
                  <!--multi level menu end-->

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
      <section class="wrapper"> 