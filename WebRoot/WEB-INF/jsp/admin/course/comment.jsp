<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="课程收藏" />
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
                    <c:if test='${commentList!=null and commentList.size()>0 }' >
                    <thead>
                    	<th  width="5%" style="text-align:center">ID</th>
                    	<th  width="10%"  style="text-align:center">用户名</th>
                    	<th   style="text-align:center">课程名称</th>
                    	<th   style="text-align:center">评论内容/回复</th>
                    	<th  width="12%" style="text-align:center">操作</th>
                    </thead>
                    <tbody>
                    
	    				<c:forEach items="${commentList}" var="comment" varStatus="status">
		                    <tr class="gradeX">
							  <td align="center" >${comment.id}</td>
							  <td align="center" >${comment.student.username}</td>
							  <td  align="center" ><a target="_blank" href="<%=basePath%>course/${comment.courseid}">${comment.course.title}</a></td>
							  <td  align="center" >
							  
							  <div class="panel panel-danger">
                          <div class="panel-heading">
                              <h4 class="panel-title text-left">
                                  <a class="accordion-toggle text-left" data-toggle="collapse" data-parent="#accordion${status.index }" href="#accordion${status.index }_1">
                                      <fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>:  ${comment.qustion}
                                  </a>
                              </h4>
                          </div>
                          <c:if test="${comment.answer!=null && ent.answer!=''}">
                          <div id="accordion${status.index }_1" class="panel-collapse collapse">
                              <div class="panel-body text-left">
                                 <p><fmt:formatDate value="${comment.answerTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></p>
                                 ${comment.answer}
                              </div>
                          </div>
                          </c:if>
                      </div>
                      
							  </td>

							  <td class="left">
							  <c:if test="${sessionScope.manager_role==2}">
							  <a href="<%=basePath%>admin/course/comment-answer/${comment.id}"  style="margin-left:20px">回复</a>
							  </c:if>
							  <a href="javascript:;" onClick="del(${comment.id})" style="margin-left:20px">删除</a>
							  
							  </td>							  
							</tr>
	                    </c:forEach>
	                  
	                 
					</c:if>
    				
                    </tbody>
          			<c:if test='${commentList==null || commentList.size()==0}' >
						<tr>
							<td>没有任何记录</td>
						</tr>
					</c:if>
                    </table>
                   
                    <div style="clear:both"></div>
			</form>
			
			<div class="text-center">
			<c:if test='${commentList!=null && commentList.size()>0}' >
                                  <ul class="pagination pagination-sm pro-page-list">
                                  <li><a>共 ${page.totalPageCount} 页 第 ${page.pageNow} 页</a></li>
                                  <li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=1">首页</a></li>
                                  <c:choose>
									<c:when test="${page.pageNow - 1 > 0}">
										<li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=${page.pageNow - 1}">上一页</a></li>
									</c:when>
									<c:when test="${page.pageNow - 1 <= 0}">
										<li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=1">上一页</a></li>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page.pageNow + 1 < page.totalPageCount}">
										<li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=${page.pageNow + 1}">下一页</a></li>
									</c:when>
									<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
										<li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=${page.totalPageCount}">下一页</a></li>
									</c:when>
								</c:choose>
								<li><a href="<%=basePath%>admin/course/comment/${cid}?pageNow=${page.totalPageCount}">尾页</a></li>
                                  </ul>
                 </c:if>
                              </div>
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
	  location.href="<%=basePath %>admin/course/comment-del/"+did;
	}, function(){
	  
	});
}
</script>
  
</body>

</html>