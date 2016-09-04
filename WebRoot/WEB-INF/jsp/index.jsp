<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="首页" />
</jsp:include>

<!--=== Slider ===-->
<div class="slider-inner">
    <div id="da-slider" class="da-slider">
        <div class="da-slide">
            <h2><i>CLEAN &amp; FRESH</i> <br /> <i>FULLY RESPONSIVE</i> <br /> <i>DESIGN</i></h2>
            <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
            <div class="da-img"><img src="<%=basePath%>Public/web/plugins/parallax-slider/img/1.png" alt="" /></div>
        </div>
        <div class="da-slide">
            <h2><i>RESPONSIVE VIDEO</i> <br /> <i>SUPPORT AND</i> <br /> <i>MANY MORE</i></h2>
            <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i></p>
            <div class="da-img span6">
            	<div class="span6">
					<!--  <iframe src="http://player.vimeo.com/video/47911018" width="100%" height="320" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>--> 
 				</div>
            </div>
        </div>
        <div class="da-slide">
            <h2><i>USING BEST WEB</i> <br /> <i>SOLUTIONS WITH</i> <br /> <i>HTML5/CSS3</i></h2>
            <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
            <div class="da-img"><img src="<%=basePath%>Public/web/plugins/parallax-slider/img/html5andcss3.png" alt="image01" /></div>
        </div>
        <nav class="da-arrows">
            <span class="da-arrows-prev"></span>
            <span class="da-arrows-next"></span>		
        </nav>
    </div><!--/da-slider-->
</div><!--/slider-->
<!--=== End Slider ===-->
 

<!--=== Content Part ===-->
<div class="container">	
	<!-- Service Blocks -->
	<div class="row-fluid">
    	<div class="span4">
    		<div class="service clearfix">
                <i class="icon-resize-small"></i>
    			<div class="desc">
    				<h4>随时随地学习</h4>
                    <p>网校结合移动端，能够让你随时随地掏出手机就进行学习，方便快捷，没有任何负担。</p>
    			</div>
    		</div>	
    	</div>
    	<div class="span4">
    		<div class="service clearfix">
                <i class="icon-cogs"></i>
    			<div class="desc">
    				<h4>社区型网校</h4>
                    <p>与同学和老师实时讨论课程细节，让你全面掌握所有知识点，巩固知识，学习不再孤单！</p>
    			</div>
    		</div>	
    	</div>
    	<div class="span4">
    		<div class="service clearfix">
                <i class="icon-plane"></i>
    			<div class="desc">
    				<h4>权威电子证书</h4>
                    <p>重点课程提供权威电子证书认证，让你的学习获得认可，为你的就业添砖加瓦。</p>
    			</div>
    		</div>	
    	</div>			    
	</div><!--/row-fluid-->
	<!-- //End Service Blokcs -->

	<!-- Recent Works -->
	<div class="headline"><h3>学校课程</h3></div>
    <ul class="thumbnails">
    <c:forEach items="${newCourseList}" var="course" varStatus="status">
        <li class="span3">
            <div class="thumbnail-style thumbnail-kenburn">
            	<div class="thumbnail-img">
                    <div class="overflow-hidden"><img width="100%" src="<%=basePath%>${course.thumb}" alt="" /></div>
                    <a class="btn-more hover-effect" href="<%=basePath%>course/${course.id}">查看详情 +</a>					
                </div>
                <h3><a class="hover-effect" href="<%=basePath%>course/${course.id}">${fn:substring(course.title, 0, 15)}</a></h3>
                <p>${fn:substring(course.description, 0, 60)}</p>
            </div>
        </li>
    </c:forEach>
    </ul><!--/thumbnails-->
	<!-- //End Recent Works -->
    
	<!-- Information Blokcs -->
	<div class="row-fluid margin-bottom-20">
    	<!-- Who We Are -->
		<div class="span8">
			<div class="headline"><h3>名师风采</h3></div>
			<c:if test="${teacherStart!=null}">
			<p><img class="pull-left lft-img-margin img-width-200" src="<%=basePath%><c:out value="${teacherStart.thumb}">Public/web/img/avatar.png</c:out>" alt="" /></p>	
            <c:if test='${startCourseList!=null and startCourseList.size()>0 }' >
            <ul class="unstyled">
            	<c:forEach items="${startCourseList}" var="course" varStatus="status">
            	<li>[${status.count }] <a href="<%=basePath%>course/${course.id}">${course.title}</a></li>
            	</c:forEach>
            </ul>
            </c:if>
            <div style="clear:both"></div>

            <blockquote class="hero-unify">
                <p>${teacherStart.about }</p>
                <small>${teacherStart.username }</small>
            </blockquote>
            </c:if>
        </div><!--/span8-->        

        <!-- Latest Shots -->
        <div class="span4">
			<div class="headline"><h3>热门课程</h3></div>
			<div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                 <c:forEach items="${hotCourseList}" var="course" varStatus="status">
                 <c:choose>
                 <c:when test="${status.index==0 }"><div class="item active"></c:when>
                 <c:otherwise><div class="item"></c:otherwise>
                 </c:choose>
                  
                    <img width="100%" src="<%=basePath%>${course.thumb}" alt="" />
                    <div class="carousel-caption">
                      <p><a  href="<%=basePath%>course/${course.id}">${fn:substring(course.title, 0, 15)}</a></p>
                    </div>
                  </div>
                 </c:forEach>
                </div>
                
                <div class="carousel-arrow">
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="icon-angle-left"></i></a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="icon-angle-right"></i></a>
                </div>
			</div>
        </div><!--/span4-->
	</div><!--/row-fluid-->	
	<!-- //End Information Blokcs -->

	 
</div><!--/container-->		
<!-- End Content Part -->

<jsp:include page="footer.jsp" flush="true"></jsp:include>


</body>
</html>	