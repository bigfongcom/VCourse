<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>系统提示</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>Public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>Public/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=basePath%>Public/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="<%=basePath%>Public/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>Public/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>Public/js/html5shiv.js"></script>
    <script src="<%=basePath%>Public/js/respond.min.js"></script>
    <![endif]-->
</head>




  <body class="body-404">

    <div class="container">

      <section class="error-wrapper" style="margin-top:5%">
          <i class="icon-404" style="width:150px;height:150px; background-size:150px 150px;"></i>
          <h2>${msg}</h2>
          <p class="page-404"><a href="${jumpUrl}">如果你的浏览器没反应，请点击这里...</a></p>
      </section>
<c:if test="${jumpTime>0 }">
				<script>
					setTimeout(function(){
						location = "${jumpUrl}";
					},parseInt("${jumpTime}")*1000);
				</script>
			</c:if>
    </div>


  </body>
</html>
