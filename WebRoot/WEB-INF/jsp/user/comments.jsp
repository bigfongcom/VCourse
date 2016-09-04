<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1 class="color-green pull-left">我的评论</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li><a href="<%=basePath%>user">个人中心</a> <span class="divider">/</span></li>
            <li class="active">我的评论</li>
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
            <c:forEach items="${commentList}" var="comment" varStatus="status">
            <div class="media">
            	
                <a class="pull-left" href="#">
                    <img class="media-object" src="<%=basePath%><c:out value="${comment.student.thumb}">Public/web/img/avatar.png</c:out>" alt="" />
                </a>
                <div class="media-body">
                <h4 class="media-heading">${comment.student.username} <span><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span></h4>
                <p>${comment.qustion} </p>
                    <hr />
					
					<c:if test="${comment.answer!=null && ent.answer!=''}">
					
					<blockquote class="hero">
						<p>${comment.answer}</p>
	                    <small>--于 <fmt:formatDate value="${comment.answerTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/> 回复</small>
	                </blockquote>
                
	                    <!-- Nested media object
	                    <div class="media">
	                        <a class="pull-left" href="#">
	                            <img class="media-object" src="<%=basePath%><c:out value="${comment.manager.thumb}">Public/web/img/avatar.png</c:out>" alt="" />
	                        </a>
	                        <div class="media-body">
	                            <h4 class="media-heading">${comment.manager.username} <span><fmt:formatDate value="${comment.answerTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span></h4>
	                            <p>${comment.answer}</p>
	                        </div>
	                    </div> --><!--/media-->
	
	                    <hr />
                    </c:if>
					<!--/media-->
                </div>
                
                
            </div><!--/media-->
			</c:forEach>  
            </div><!--/row-->
            <!-- //End Recent Works -->
			<div class="pagination pagination-centered">
			<c:if test='${commentList!=null  && commentList.size()>0}' >
               <ul>
                   <li><a>共 ${page.totalPageCount} 页 第 ${page.pageNow} 页</a></li>
                               <li><a href="<%=basePath%>user/${user_action }?pageNow=1">首页</a></li>
                          <c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<li><a href="<%=basePath%>user/${user_action }?pageNow=${page.pageNow - 1}">上一页</a></li>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<li><a href="<%=basePath%>user/${user_action }?pageNow=1">上一页</a></li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<li><a href="<%=basePath%>user/${user_action }?pageNow=${page.pageNow + 1}">下一页</a></li>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<li><a href="<%=basePath%>user/${user_action }?pageNow=${page.totalPageCount}">下一页</a></li>
						</c:when>
					</c:choose>
					<li><a href="<%=basePath%>user/${user_action }?pageNow=${page.totalPageCount}">尾页</a></li>
                               </ul>
              </c:if>
              <c:if test='${commentList==null  || commentList.size()==0}' >
					没有任何记录
					</c:if>
            </div>
            
        </div><!--/span9-->
    </div><!--/row-fluid-->        

</div><!--/container-->		
<!--=== End Content Part ===-->

<jsp:include page="../footer.jsp" flush="true"></jsp:include>

</body>
</html> 