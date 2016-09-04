<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 

<!--=== Copyright ===-->
<div class="copyright">
	<div class="container">
		<div class="row-fluid pagination-centered">
	            <p>2016 &copy; ${web_setting.sitename} 版权所有. <a href="#">杨沙沙</a></p>
		</div><!--/row-fluid-->
	</div><!--/container-->	
</div><!--/copyright-->	
<!--=== End Copyright ===-->

<!-- JS Global Compulsory -->			
<script type="text/javascript" src="<%=basePath%>Public/web/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>Public/web/js/modernizr.custom.js"></script>		
<script type="text/javascript" src="<%=basePath%>Public/web/plugins/bootstrap/js/bootstrap.min.js"></script>	
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="<%=basePath%>Public/web/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="<%=basePath%>Public/web/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="<%=basePath%>Public/web/plugins/parallax-slider/js/jquery.cslider.js"></script> 
<script type="text/javascript" src="<%=basePath%>Public/web/plugins/back-to-top.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="<%=basePath%>Public/web/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>Public/web/js/pages/index.js"></script>
<script src="<%=basePath%>Public/js/layer/layer.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initSliders();
        Index.initParallaxSlider();
    });
    
    function isEmpty(str){
		if(  typeof(str)=="undefined" || str== null || trim(str)==""){
			return true;
		}else{
			return false;
		}
	}
	
	//删除左右两端的空格
	function trim(str){ 
		if(typeof(str) == 'string') {
	        str=str.replace(/(^\s*)|(\s*$)/g, "");
	    }
		return str;
	}
</script>
<!--[if lt IE 9]>
    <script src="<%=basePath%>Public/web/js/respond.js"></script>
<![endif]-->

