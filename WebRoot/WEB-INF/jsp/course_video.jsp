<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="视频" />
</jsp:include>


<link href="<%=basePath%>Public/js/videojs/video-js.css" rel="stylesheet">
<script src="<%=basePath%>Public/js/videojs/videojs-ie8.min.js"></script>
<script src="<%=basePath%>Public/js/videojs/video.js"></script>
<style>
#video-box .vjs-big-play-button {
  /* Center it horizontally */
  left: 50%;
  margin-left: -2.1em;
  /* Center it vertically */
  top: 50%;
  margin-top: -1.4000000000000001em;
}
</style>  
     
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
	<div class="container">
        <h1 class="color-green pull-left">${video.vtitle }</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li class="active">课程视频</li>
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
                <div class="blog-img">
                <div id="video-box" style="width:100%;height:350px;">
	                <video id="my-video" class="video-js" controls preload="auto" style="width:100%;height:100%;"
  poster="<%=basePath%>${course.thumb}" data-setup="{}">
    <source src="<%=basePath %>${video.vpath}" type='video/mp4'>
    <p class="vjs-no-js">
      To view this video please enable JavaScript, and consider upgrading to a web browser that
      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
    </p>
  </video>
  </div>
	               
                </div>
                
            </div><!--/blog-->

	 
        </div><!--/span9-->

        <!-- Right Sidebar -->
    	<div class="span3">
    	
    	<div class="posts margin-bottom-20">
                <div class="headline"><h3>课程视频</h3></div>
                <ol>
                <c:forEach items="${videoList}" var="video_item" varStatus="status">
                 <c:choose>
	            <c:when test="${video_item.id==video.id }">
	            <li class="color-green"><a class="color-green"  href="<%=basePath%>video/${video_item.id}">${video_item.vtitle}</a></li>
	            </c:when>
	            <c:otherwise>
	            <li><a href="<%=basePath%>video/${video_item.id}">${video_item.vtitle}</a></li>
	            </c:otherwise>
	            </c:choose>
            
                    
                </c:forEach>      
	            
            </ol>
            </div>

        </div><!--/span3-->
    </div><!--/row-fluid-->        
</div><!--/container-->		
<!--=== End Content Part ===-->
<jsp:include page="footer.jsp" flush="true"></jsp:include>
<script type="text/javascript">
	var w = $('#video-box').width();
	var h = 0;
	if(w>640){
		h = (w*264)/640;
	}else if(w>400){
		h = (w*264)/400;
	}else{
		h = (w*264)/350;
	}
	
	 $('#video-box').height(h);
	 //alert(w+"-"+h);
</script>
</body>
</html>	