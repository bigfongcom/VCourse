<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="span1"></div>
<div class="span2">

	<!--个人设置 -->
	<div class="who margin-bottom-30">
		<div class="headline">
			<h3>学习中心</h3>
		</div>
		<ul class="unstyled">
			<li>
			<c:choose>
             <c:when test="${user_action=='user' }"><a class="color-green" href="<%=basePath%>user"></c:when>
             <c:otherwise><a href="<%=basePath%>user"></c:otherwise>
             </c:choose>
			<i class="icon-book"></i>我的课程</a>
			</li>
			<li>
			<c:choose>
             <c:when test="${user_action=='collect' }"><a class="color-green" href="<%=basePath%>user/collect"></c:when>
             <c:otherwise><a href="<%=basePath%>user/collect"></c:otherwise>
             </c:choose>
			<i class="icon-tags"></i>我的收藏</a>
			</li>
			<li><a href="<%=basePath%>user/comments">
			<c:choose>
             <c:when test="${user_action=='comments' }"><a class="color-green" href="<%=basePath%>user/comments"></c:when>
             <c:otherwise><a href="<%=basePath%>user/comments"></c:otherwise>
             </c:choose>
			<i class="icon-bullhorn"></i>我的评论</a>
			</li>
		</ul>
	</div>

	<!--个人设置 -->
	<div class="who margin-bottom-30">
		<div class="headline">
			<h3>个人设置</h3>
		</div>
		<ul class="unstyled">
			<li>
			<c:choose>
             <c:when test="${user_action=='info' }"><a class="color-green" href="<%=basePath%>user/info"></c:when>
             <c:otherwise><a href="<%=basePath%>user/info"></c:otherwise>
             </c:choose>
			<i class="icon-user"></i>基础信息</a>
			</li>
			<li>
			<c:choose>
             <c:when test="${user_action=='thumb' }"><a class="color-green" href="<%=basePath%>user/thumb"></c:when>
             <c:otherwise><a href="<%=basePath%>user/thumb"></c:otherwise>
             </c:choose>
             <i class="icon-camera"></i> 头像设置</a>
			</li>
			<li>
			<c:choose>
             <c:when test="${user_action=='pwd' }"><a class="color-green" href="<%=basePath%>user/pwd"></c:when>
             <c:otherwise><a href="<%=basePath%>user/pwd"></c:otherwise>
             </c:choose>
             <i class="icon-lock"></i> 安全设置</a>
			</li>
		</ul>
	</div>

</div>