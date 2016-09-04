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

<!--=== Content Part ===-->
<div class="body">
	<div class="breadcrumbs margin-bottom-50">
    	<div class="container">
            <h1 class="color-green pull-left">注册</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
                <li class="active">注册</li>
            </ul>
        </div><!--/container-->
    </div><!--/breadcrumbs-->

	<div class="container">		
		<div class="row-fluid margin-bottom-10">
        	<form class="reg-page" action="<%=basePath%>doRegister" method="post">
            	<h3>用户注册</h3>
                <div class="controls">    
                    <label>用户名</label>
                    <input type="text" class="span12" id="username" name="username"/>
                </div>
                <div class="controls">
                    <div class="span6">
                        <label>密码 <span class="color-red">*</span></label>
                        <input type="password" class="span12" id="password" name="password"/>
                    </div>
                    <div class="span6">
                        <label>确认密码 <span class="color-red">*</span></label>
                        <input type="password" class="span12" id="password2" name="password2"/>
                    </div>
                </div>
                <div class="controls form-inline">
                    <button class="btn-u pull-right" type="submit">注册</button>
                </div>
                <hr />
				<p>已有帐号? <a href="<%=basePath%>login" class="color-green">登陆</a></p>
            </form>
        </div><!--/row-fluid-->
	</div><!--/container-->		
</div><!--/body-->
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
			}else if(isEmpty($form.find('#password2').val())){
				layer.msg("确认密码不能为空", {shift: 1});
				return false;
			}else if($form.find('#password').val()!=$form.find('#password2').val()){
				layer.msg("两次密码不一致", {shift: 1});
				return false;
			}
			$.post($form.attr("action"), $form.serialize(), function(data){
				if (data.status === 1) {
					layer.msg("注册成功", {shift: 1});
					setTimeout(function(){window.location.href = "<%=basePath%>login";}, 1200);
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