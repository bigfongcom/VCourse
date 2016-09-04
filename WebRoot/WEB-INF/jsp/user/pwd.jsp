<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="用户中心" />
</jsp:include>

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
	<div class="container">
        <h1 class="color-green pull-left">安全设置</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li><a href="<%=basePath%>user">个人中心</a> <span class="divider">/</span></li>
            <li class="active">安全设置</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">		
	<div class="row-fluid">
    	<jsp:include page="left-menu.jsp" />
    	<div class="span9">

            <!-- Recent Works -->
            <div class="row-fluid margin-bottom-40 blog-item" id="w">
            <form class="form-horizontal" method="post">
            		 <div class="control-group">
                    </div>
                    <div class="control-group">
                        <label for="inputEmail" class="control-label">旧密码</label>
                        <div class="controls">
                            <input type="text" name="oldPwd" class="border-radius-none" id="truename">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="inputEmail" class="control-label">新密码</label>
                        <div class="controls">
                            <input type="text" name="pwd1" class="border-radius-none" id="mobile">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="inputEmail" class="control-label">确认密码</label>
                        <div class="controls">
                            <input type="text" name="pwd2" class="border-radius-none" id="mobile">
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <div class="controls">
                            <button class="btn-u" name="submit" type="submit">提交</button>
                        </div>
                    </div>
                </form>
            </div><!--/row-->
            <!-- //End Recent Works -->
			
            
        </div><!--/span9-->
    </div><!--/row-fluid-->        

</div><!--/container-->		
<!--=== End Content Part ===-->

<jsp:include page="../footer.jsp" flush="true"></jsp:include>

</body>
</html> 