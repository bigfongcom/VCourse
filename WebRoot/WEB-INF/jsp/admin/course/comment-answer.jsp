<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="课程评论" />
</jsp:include>

<!------start content------->
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    
                    <div class="ibox-content ">
 
            <form class="am-form am-form-horizontal"   action="<%=basePath%>admin/course/comment-answer/${comment.id}" method="post">
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    
                    <tbody>
					<tr class="gradeX">
						  <td align="center"  >课程名称</td>
						  <td align="left">
						  <a target="_blank" href="<%=basePath%>course/${comment.courseid}">${comment.course.title}</a>
						 </td>
						  
						</tr>
	                    <tr class="gradeX">
						  <td align="center"  >用户名</td>
						  <td align="left">
						  ${comment.student.username}
						 </td>
						  
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >评论时间</td>
						  <td align="left">
						  <fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
						 </td>
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >评论内容</td>
						  <td align="left">
						  ${comment.qustion}
						 </td>
						  
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >回复时间</td>
						  <td align="left">
						  <fmt:formatDate value="${comment.answerTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
						 </td>
						</tr>


						<tr class="gradeX">
						  <td align="center"  >回复内容</td>
						  <td align="left">
						    <textarea class="form-control" name="answer">${comment.answer}</textarea>
						 </td>
						  
						</tr>
						
	                  
                    </tbody>
          
                    </table>
                    <div class="form-group">
                        <div class="col-sm-2 col-sm-offset-1">
                            <input name="sub" type="hidden" value="sub">
                            <input   type="submit" class="btn btn-primary" value="回复">
                        </div>
                    </div>
                    <div style="clear:both"></div>
			</form>
                    </div>
                </div>
            </div>
            </div>
<!------end content------->
<jsp:include page="../footer.jsp" /> 
<script type="text/javascript" src="<%=basePath%>Public/js/ajaxfileupload.js">  
</script>
<script type="text/javascript">  
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
                $('#a_vpath').attr('href',"<%=basePath %>Uploads/"+data.msg).show();
                $('#vpath').val("Uploads/"+data.msg);
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
}  
</script> 
  
</body>

</html>