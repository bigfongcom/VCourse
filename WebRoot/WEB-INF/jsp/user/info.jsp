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
        <h1 class="color-green pull-left">基本信息</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li><a href="<%=basePath%>user">个人中心</a> <span class="divider">/</span></li>
            <li class="active">基本信息</li>
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
            <form class="form-horizontal" action="<%=basePath%>user/updateInfo" method="post">
            		<div class="control-group">
                        <label for="inputEmail" class="control-label">用户名</label>
                        <div class="controls">
                        ${student.username }
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="inputEmail" class="control-label">姓名</label>
                        <div class="controls">
                            <input type="text" name="truename" value="${student.truename }" class="border-radius-none" id="truename">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="inputPassword" class="control-label">性别</label>
                        <div class="controls">
                 <label class="checkbox inline">
                 	<c:choose>
                 	 <c:when test="${student.sex==1 }"><input checked type="radio" name="sex" value="1"  >男</c:when>
                 	 <c:otherwise><input  type="radio" name="sex" value="1"  >男</c:otherwise>
                 	</c:choose>
                    
                </label>
                <label class="checkbox inline">
                    <c:choose>
                 	 <c:when test="${student.sex==2 }"><input checked type="radio" name="sex" value="2" >女</c:when>
                 	 <c:otherwise><input  type="radio" name="sex" value="2" >女</c:otherwise>
                 	</c:choose>
                </label>
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label for="inputEmail" class="control-label">手机号码</label>
                        <div class="controls">
                            <input type="text" value="${student.mobile}" name="mobile" class="border-radius-none" id="mobile">
                        </div>
                    </div>
                    
                    
                     <div class="control-group">
                        <label for="inputEmail" class="control-label">自我介绍</label>
                        <div class="controls">
                        <textarea rows="8" name="about"  class="span6 border-radius-none">${student.about}</textarea>
                        </div>
                    </div>
                    
                    <div class="control-group">
                        <div class="controls">
                            <input   class="btn-u" name="submit" type="submit" value="提交">
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