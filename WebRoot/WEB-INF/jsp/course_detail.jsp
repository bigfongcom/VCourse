<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="视频" />
</jsp:include>

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
	<div class="container">
        <h1 class="color-green pull-left">课程介绍</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li class="active">课程介绍</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">		
	<div class="row-fluid blog-page blog-item">
        <!-- Left Sidebar -->
    	<div class="span9">
        	<div class="blog margin-bottom-30">
                <div class="blog-img" style="background:#f4f4f4;position: relative;">
	                <div class="span5">
	                <img src="<%=basePath%>${course.thumb}" width="100%" alt="" />
	                </div>
	                <div class="span7">
	                <h4 class="color-green">${course.title}</h3>
	                <p class="student-num ">
                                <label class="pull-left">学员人数：</label><span class="pull-left" style="color:#46c37b">${recordCount }人</span>
              		</p>
              		<div   style="clear:both;"></div>
              		<p class="student-num ">
                        <label class="pull-left">收藏量：</label><span class="pull-left" style="color:#46c37b"> ${collecCount}</span>
              		</p>
              		 <div   style="clear:both;"></div>
              		<p class="student-num ">
                        <label class="pull-left">访问量：</label><span class="pull-left" style="color:#46c37b"> ${course.click}</span>
              		</p>
              		
	                </div>
	                <c:if test="${sessionScope.student_id!=null }">
	                <p style="clear:both;position:absolute;bottom:0;right:0;padding-right:10px;">
              			<c:if test="${hasCollect==0}">
		                 <a href="<%=basePath%>collect/${course.id}" class="btn btn-warning">我要收藏</a>
	              		</c:if>
              			<c:if test="${hasAdd==0}">
		                 <a href="<%=basePath%>join/${course.id}" class="btn btn-success">加入学习</a>
	              		</c:if>
              			
              		</p>
              		</c:if>
	                <div   style="clear:both;"></div>
                </div>
                
                <h3 class="color-green">课程简介</h3>
                <p>${course.description }</p>
            </div><!--/blog-->

			<hr />
			<div class="row-fluid margin-bottom-20">
            <div class="headline"><h3>课时列表</h3></div>
            <c:choose>
            <c:when test="${sessionScope.student_id==null }">
            <div class="alert alert-error">
                <button data-dismiss="alert" class="close" type="button">×</button>
                <strong>注意!</strong>　您还没登陆，无法观看视频教程
            </div>
            </c:when>
            <c:otherwise>
            </c:otherwise>
            </c:choose>
	            
            <c:forEach items="${videoList}" var="video" varStatus="status">
			<div class="alert alert-info">
				
				
				<c:choose>
	            <c:when test="${sessionScope.student_id!=null }">
	            <a href="<%=basePath%>video/${video.id}">${video.vtitle}</a>
	            </c:when>
	            <c:otherwise>
	            ${video.vtitle}
	            </c:otherwise>
	            </c:choose>
            
            </div>   
            </c:forEach>      
        </div>
			<hr />
            <!-- Media -->
            <h3 class="color-green">评论</h3>
            
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
			

            <!-- Leave a Comment -->
            <div class="post-comment">
            	<h3 class="color-green">发表评论</h3>
                <form action="<%=basePath %>comment/${course.id}" method="post"/>
                    <label>评论内容</label>
                    <textarea rows="8" class="span10" name="qustion"></textarea>
                    <p><button type="submit" class="btn-u">提交</button></p>
                </form>
            </div><!--/post-comment-->
        </div><!--/span9-->

        <!-- Right Sidebar -->
    	<div class="span3">
    	<div class="posts margin-bottom-20">
                <div class="headline"><h3>任课老师</h3></div>
                <dl class="dl-horizontal">
                    <dt><a ><img src="<%=basePath%><c:out value="${teacher.thumb}">Public/web/img/avatar.png</c:out>" ></a></dt>
                    <dd>
                        <p>${teacher.username }</p> 
                    </dd>
                </dl>
            </div>
            
            
        	<!-- Photo Stream -->
        	<div class="headline"><h3>最新学员</h3></div>
        	
            <ul class="unstyled blog-ads">
            <c:forEach items="${newStudents}" var="record" varStatus="status">
           	<li style="display:inline-block;">
           	<img style="margin-bottom:2px"  src="<%=basePath%><c:out value="${record.student.thumb}">Public/web/img/avatar.png</c:out>" class="hover-effect" />
           		<p style="width:60px;  margin-bottom:2px;" class="text-center">${record.student.username}</p>
           	</li>
           	</c:forEach>  
            </ul>

        </div><!--/span3-->
    </div><!--/row-fluid-->        
</div><!--/container-->		
<!--=== End Content Part ===-->
<jsp:include page="footer.jsp" flush="true"></jsp:include>

</body>
</html>	