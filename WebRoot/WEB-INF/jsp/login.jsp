<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="注册" />
</jsp:include>

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-40">
	<div class="container">
        <h1 class="color-green pull-left">用户登陆</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li class="active">用户登陆</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">		
	<div class="row-fluid">
        <form class="log-page" style="padding: 30px 50px;" action="<%=basePath%>dologin" method="post">
            <h3>用户登陆</h3>    
            <div class="input-prepend">
                <span class="add-on"><i class="icon-user"></i></span>
                <input class="input-xlarge" type="text" placeholder="Username" id="username" name="username"/>
            </div>
            <div class="input-prepend">
                <span class="add-on"><i class="icon-lock"></i></span>
                <input class="input-xlarge" type="password" placeholder="密码" id="password" name="password"/>
            </div>
            <div class="controls form-inline">
                <button class="btn-u pull-right" type="submit">登陆</button>
            </div>
            <p style="padding-top: 5px;">还没有帐号？ <a class="color-green" href="<%=basePath%>register">注册</a></p>
        </form>
    </div><!--/row-fluid-->
</div><!--/container-->		
<!--=== End Content Part ===-->
<jsp:include page="footer.jsp" flush="true"></jsp:include>

	<script type="text/javascript">
	$(function(){
		$("form").submit(function(){
			var $form = $(this);
			if(isEmpty($form.find('#username').val())){
				layer.msg("用户名不能为空", {shift: 1});
				return false;
			}else if(isEmpty($form.find('#password').val())){
				layer.msg("密码不能为空", {shift: 1});
				return false;
			}
			$.post($form.attr("action"), $form.serialize(), function(data){
				if (data.status === 1) {
					layer.msg("登录成功", {shift: 1});
					setTimeout(function(){window.location.href = "<%=basePath%>user/";}, 1200);
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