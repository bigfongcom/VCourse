<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <h1 class="color-green pull-left">我的课程</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li><a href="<%=basePath%>user">个人中心</a> <span class="divider">/</span></li>
            <li class="active">我的课程</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">		
	<div class="row-fluid">
    	
    	<jsp:include page="left-menu.jsp"/>
        
    	<div class="span9">

            <!-- Recent Works -->
            <div class="row-fluid margin-bottom-40" id="w">
            
              <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>课程名称</th>
                            <th>加入时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${recordList}" var="record" varStatus="status">
                        <tr>
                            <td>${record.id}</td>
                            <td><a target="_blank" href="<%=basePath%>course/${record.course.id}">${fn:substring(record.course.title, 0, 20)}</a></td>
                            <td><fmt:formatDate value="${record.createTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                            <td><a href="<%=basePath%>user/unrecord/${record.id}">取消课程</a></td>
                        </tr>
                        </c:forEach> 
                    </tbody>
                    
                    <c:if test='${recordList==null  || recordList.size()==0}' >
						<tr>
							<td colspan="4">没有任何记录</td>
						</tr>
					</c:if>
					
                </table>
                
                
            </div><!--/row-->
            <!-- //End Recent Works -->
			<div class="pagination pagination-centered">
			<c:if test='${recordList!=null  && recordList.size()>0}' >
                <ul>
                   <li><a>共 ${page.totalPageCount} 页 第 ${page.pageNow} 页</a></li>
                               <li><a href="<%=basePath%>${user_action }?pageNow=1">首页</a></li>
                          <c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<li><a href="<%=basePath%>${user_action }?pageNow=${page.pageNow - 1}">上一页</a></li>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<li><a href="<%=basePath%>${user_action }?pageNow=1">上一页</a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<li><a href="<%=basePath%>${user_action }?pageNow=${page.pageNow + 1}">下一页</a></li>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<li><a href="<%=basePath%>${user_action }?pageNow=${page.totalPageCount}">下一页</a></li>
						</c:when>
					</c:choose>
					<li><a href="<%=basePath%>${user_action }?pageNow=${page.totalPageCount}">尾页</a></li>
                  </c:if>
                  </ul>
            </div>
            
        </div><!--/span9-->
    </div><!--/row-fluid-->        

</div><!--/container-->		
<!--=== End Content Part ===-->

<jsp:include page="../footer.jsp" flush="true"></jsp:include>

</body>
</html> 