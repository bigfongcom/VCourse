<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="视频管理" />
</jsp:include>

<!------start content------->
             <div class="row">
                <div class="col-lg-12">
                <%-- <div>
            <a class="btn btn-primary " href="<%=basePath%>admin/course/video-add?cid=${cid}"  >添加配置项</a>
            </div> --%>
                <div class="ibox float-e-margins">
<style>
#searchFile .col-md-12  .row div{ padding:0}
#searchFile .col-md-12  .row .col-md-2{padding-left: 15px; padding-right: 15px;}
</style>
                    <div class="ibox-content">
			
    
            <form class="am-form am-form-horizontal" method="post">
        
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <c:if test='${videoList!=null and videoList.size()>0 }' >
                    <thead>
                    	<th  width="8%" style="text-align:center">ID</th>
                    	<th   style="text-align:center">视频名称</th>
                    	<th   style="text-align:center">发布时间</th>
                    	<th   style="text-align:center">播放次数</th>
                    	<th  width="20%"  style="text-align:center">操作</th>
                    </thead>
                    <tbody>
                    
	    				<c:forEach items="${videoList}" var="video" varStatus="status">
		                    <tr class="gradeX">
							  <td align="center" >${video.id}</td>
							  <td  align="center" >${video.vtitle}</td>
							  <td  align="center" >
							  <fmt:formatDate value="${video.vctime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
							  </td>
							  <td  align="center" >${video.viewCount}</td>
							  <td class="left">
							  <a href="<%=basePath%>admin/course/video-edit?id=${video.id}"  style="margin-left:20px">编辑</a>
							  <a href="javascript:;" onClick="del(${video.id})" style="margin-left:20px">删除</a>
							  </td>
							  
							</tr>
	                    </c:forEach>
	                  
	                 
					</c:if>
    				
                    </tbody>
          			<c:if test='${videoList==null || videoList=="" || videoList.size()==0 }' >
						<tr>
							<td>没有任何记录</td>
						</tr>
					</c:if>
                    </table>
                   
                    <div style="clear:both"></div>
			</form>
                    </div>
                </div>
            </div>
            </div>
<!------end content------->
<jsp:include page="../footer.jsp" /> 
<script>
function del(did){
	layer.confirm('您是否确定要删除该记录', {
	  btn: ['是','否'] //按钮
	}, function(){
	  location.href="<%=basePath %>admin/course/videoDel/?id="+did;
	}, function(){
	  
	});
}
</script>
  
</body>

</html>