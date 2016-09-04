<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
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

    <title>登陆</title>

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

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="<%=basePath%>sys/dologin" method="post" >
        <h2 class="form-signin-heading">登陆系统</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" placeholder="username" name="username" required>
            <input type="password" class="form-control" placeholder="password" name="password" required>
           
            <button class="btn btn-lg btn-login btn-block" type="submit">登陆</button>
            
            
            <div class="registration" style="text-align:center">
                	还没有帐号?
                <a class="" href="registration.html">
                    注册
                </a>
            </div>

        </div>

      </form>

    </div>



    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>Public/js/jquery.js"></script>
    <script src="<%=basePath%>Public/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>Public/js/layer/layer.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$("form").submit(function(){
			var $form = $(this);
			$.post($form.attr("action"), $form.serialize(), function(data){
				if (data.status === 1) {
					layer.msg("登录成功", {shift: 1});
					setTimeout(function(){window.location.href = "<%=basePath%>admin/index";}, 1200);
					return false;
				} else {
					layer.msg(data.msg, {shift: 6});
					return false;
				}
			}, "json");
			return false;
		});
	});
	</script>
	
  </body>
</html>
