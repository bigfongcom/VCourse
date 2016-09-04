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
<style>
.help-block {
    color: #a1a1a1;
    display: block;
    margin-bottom: 10px;
    margin-top: 5px;
}
.form-horizontal .form-group {
    margin-bottom: 30px;
}
.form-horizontal .form-group {
    margin-left: -10px;
    margin-right: -10px;
}
</style>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
	<div class="container">
        <h1 class="color-green pull-left">头像设置</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="<%=basePath%>">首页</a> <span class="divider">/</span></li>
            <li><a href="<%=basePath%>user">个人中心</a> <span class="divider">/</span></li>
            <li class="active">头像设置</li>
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
            <div class="panel-body">
      
      <form method="post" class="form-horizontal" id="settings-avatar-form">

          

        <div class="form-group">
          <div class="col-md-2 control-label"><b>当前头像</b></div>
          <div class="controls col-md-8 controls">
          	<img width="200" id="thumb_img" src="<%=basePath%><c:out value="${sessionScope.student_thumb}">Public/web/img/avatar.png</c:out>">
          	<input type="hidden" id="thumb">
          </div>
        </div>

        <div class="form-group">
          <div class="col-md-2 control-label">
          </div>
          <div class="controls col-md-8 controls">
            <p class="help-block">你可以上传JPG、GIF或PNG格式的文件<br>文件大小不能超过<strong>2M</strong>。</p>
          </div>
        </div>

        <div class="form-group">
          <div class="col-md-2 control-label"></div>
          <div class="controls col-md-8 controls">
          <input style="display:none" type="file" id="file" name="file" onchange="ajaxFileUpload()"/>  
          
            <a   class="btn btn-primary webuploader-container" id="upload-picture-btn"><div class="webuploader-pick">上传新头像</div></a>
          </div>
        </div>

        
      </form>

    </div>
            </div><!--/row-->
            <!-- //End Recent Works -->
			
            
        </div><!--/span9-->
    </div><!--/row-fluid-->        

</div><!--/container-->		
<!--=== End Content Part ===-->

<jsp:include page="../footer.jsp" flush="true"></jsp:include>
<script type="text/javascript" src="<%=basePath%>Public/js/ajaxfileupload.js">  
</script>
<script type="text/javascript">  
$('#upload-picture-btn').click(function(){
	$('#file').trigger('click');
});
function ajaxFileUpload() {  
  
   /*  $("#loading").ajaxStart(function() {  
        $(this).show();  
    })//开始上传文件时显示一个图片  
    .ajaxComplete(function() {  
        $(this).hide();  
    });//文件上传完成将图片隐藏起来   */
  
    $.ajaxFileUpload( {  
        url : "<%=basePath%>ajaxUpload",//用于文件上传的服务器端请求地址  
        secureuri : false,//一般设置为false  
        fileElementId : 'file',//文件上传控件的id属性  
        dataType : 'json',//返回值类型 一般设置为json  
        success : function(data, status) //服务器成功响应处理函数  
        {  
            if (data.status==1) {  
                $('#thumb_img').attr('src',"<%=basePath %>Uploads/"+data.msg).show();
            	changeThumb("/Uploads/"+data.msg);
            }else{
                layer.msg(data.msg);
            	
            }  
        },  
        error : function(data, status, e)//服务器响应失败处理函数  
        {  
        	 alert(2);
            //layer.msg(e);  
        }  
    })  
    return false;  
}  ;

function changeThumb(thumb){
	$.post("<%=basePath%>user/updateThumb", {thumb:thumb}, function(data){
		layer.msg(data.msg, {shift: 1});
	}, "json");
}
</script> 
</body>
</html> 