<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="管理员" />
</jsp:include>

<!------start content------->
             <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
<style>
#searchFile .col-md-12  .row div{ padding:0}
#searchFile .col-md-12  .row .col-md-2{padding-left: 15px; padding-right: 15px;}
</style>
                    <div class="ibox-content">
			
    
            <form class="am-form am-form-horizontal" method="post">
        
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    <c:if test='${manangerList!=null and manangerList.size()>0 }' >
                    <thead>
                    	<th  width="8%" style="text-align:center">ID</th>
                    	<th   style="text-align:center">用户名</th>
                    	<th   style="text-align:center">昵称</th>
                    	<th   style="text-align:center">角色</th>
                    	<th  width="20%"  style="text-align:center">操作</th>
                    </thead>
                    <tbody>
                    
	    				<c:forEach items="${manangerList}" var="mananger" varStatus="status">
		                    <tr class="gradeX">
							  <td align="center" >${mananger.id}</td>
							  <td  align="center" >${mananger.username}</td>
							  <td  align="center" >${mananger.nickname}</td>
							  <td  align="center" >
							  <c:if test='${mananger.role==1}'>管理员</c:if>
							  <c:if test='${mananger.role==2}'>讲师</c:if>
							  </td>
							  <td class="left">
							  
							  <a href="<%=basePath%>admin/manager/edit?id=${mananger.id}"  style="margin-left:20px">编辑</a>
							  <c:if test='${mananger.id>1 }'>
							  <a href="javascript:;" onClick="del(${mananger.id})" style="margin-left:20px">删除</a>
							  </c:if>
							  
							  <c:if test='${mananger.role==2 && mananger.isStart==0}'>
							  <a class="color-green" href="<%=basePath%>admin/manager/setstart/${mananger.id}"  style="margin-left:20px;color:green">推荐名师</a>
							  </c:if>
							   <c:if test='${mananger.role==2 && mananger.isStart==1}'>
							  <a  class="color-red"  href="<%=basePath%>admin/manager/unstart/${mananger.id}"  style="margin-left:20px;color:red">取消推荐</a>
							  </c:if>
							  </td>
							  
							</tr>
	                    </c:forEach>
	                  
	                 
					</c:if>
    				
                    </tbody>
          			<c:if test='${manangerList==null}' >
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
	  location.href="<%=basePath %>admin/manager/del/?id="+did;
	}, function(){
	  
	});
}
</script>
  
</body>

</html>