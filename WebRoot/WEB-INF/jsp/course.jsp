<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="视频" />
</jsp:include>

<!--=== Breadcrumbs ===-->
<div class="row-fluid breadcrumbs margin-bottom-30">
	<div class="container">
        <h1 class="pull-left">全部视频</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li class="active">
			<c:choose>
            <c:when test="${course_action=='all' }">全部视频</c:when>
            <c:when test="${course_action=='hot' }">热点视频</c:when>
            <c:when test="${course_action=='new' }">最新视频展示</c:when>
            <c:otherwise><li></c:otherwise>
            </c:choose>
			</li>
            
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">		
	<div class="row-fluid">
    	<!-- Unify Thumbnail -->
        <ul class="thumbnails">
        <c:forEach items="${courseList}" var="course" varStatus="status">
                 <c:choose>
                 <c:when test="${status.index%4==0 }">
                 
                 <li class="span3" style="margin-left:0; clear:both;float:left"></c:when>
                 <c:otherwise><li class="span3"></c:otherwise>
                 </c:choose>
                 
            
                <div class="thumbnail-style thumbnail-kenburn">
                    <div class="thumbnail-img">
                        <div class="overflow-hidden"><a href="<%=basePath%>course/${course.id}"><img width="100%" src="<%=basePath%>${course.thumb}" /></a></div>
                        <a class="btn-more hover-effect" href="<%=basePath%>course/${course.id}">查看详情 +</a>					
                    </div>
                    <h3><a href="<%=basePath%>course/${course.id}">${fn:substring(course.title, 0, 15)}</a></h3>
                    <p>${fn:substring(course.description, 0, 40)}</p>
                </div>
            </li>
         </c:forEach>
        </ul><!--/thumbnails-->
    
    	

    	 <div class="pagination pagination-centered">
                <ul>
                   <li><a>共 ${page.totalPageCount} 页 第 ${page.pageNow} 页</a></li>
                                <li><a href="<%=basePath%>${course_action }?pageNow=1${pageAddparam}">首页</a></li>
                           <c:choose>
							<c:when test="${page.pageNow - 1 > 0}">
								<li><a href="<%=basePath%>${course_action }?pageNow=${page.pageNow - 1}${pageAddparam}">上一页</a></li>
							</c:when>
							<c:when test="${page.pageNow - 1 <= 0}">
								<li><a href="<%=basePath%>${course_action }?pageNow=1${pageAddparam}">上一页</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">
								<li><a href="<%=basePath%>${course_action }?pageNow=${page.pageNow + 1}${pageAddparam}">下一页</a></li>
							</c:when>
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
								<li><a href="<%=basePath%>${course_action }?pageNow=${page.totalPageCount}${pageAddparam}">下一页</a></li>
							</c:when>
						</c:choose>
						<li><a href="<%=basePath%>${course_action }?pageNow=${page.totalPageCount}${pageAddparam}">尾页</a></li>
                                </ul>
            </div>

    	                        

	</div><!--/row-fluid-->        
</div><!--/container-->		
<!--=== End Content Part ===-->

<jsp:include page="footer.jsp" flush="true"></jsp:include>

</body>
</html> 