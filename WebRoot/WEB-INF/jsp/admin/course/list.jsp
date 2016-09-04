<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="课程管理" />
</jsp:include>

<!------start content------->
<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <div class="panel-body">
                              <form role="form" class="form-inline" method="get" action="<%=basePath%>admin/course/list">
                                  <div class="form-group">
                                      <input type="text" placeholder="课程名称" name="keywords" value="${keywords }" class="form-control">
                                  </div>
                                  <button class="btn btn-success" type="submit">搜索</button>
                              </form>

                          </div>
                      </section>

                  </div>
              </div>
              
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
                    <c:if test='${courseList!=null and courseList.size()>0 }' >
                    <thead>
                    	<th  width="8%" style="text-align:center">ID</th>
                    	<th   style="text-align:center">课程名称</th>
                    	<th   style="text-align:center">发布时间</th>
                    	<th   style="text-align:center">讲师</th>
                    	<th   style="text-align:center">点击</th>
                    	<th  width="28%"  style="text-align:center">操作</th>
                    </thead>
                    <tbody>
                    
	    				<c:forEach items="${courseList}" var="course" varStatus="status">
		                    <tr class="gradeX">
							  <td align="center" >${course.id}</td>
							  <td  align="left" >${course.title}</td>
							  <td  align="center" >
							  <fmt:formatDate value="${course.createTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
							  </td>
							  <td  align="center" >${course.manager.username}</td>
							  <td  align="center" >${course.click}</td>
							  <td class="left">
							  <a href="<%=basePath%>admin/course/video-list?cid=${course.id}"  style="margin-left:20px">视频列表</a>
							  <a href="<%=basePath%>admin/course/comment/${course.id}"  style="margin-left:20px">评论</a>
							  <a href="<%=basePath%>admin/course/collect/${course.id}"  style="margin-left:20px">收藏</a>
							  <a href="<%=basePath%>admin/course/edit?id=${course.id}"  style="margin-left:20px">编辑</a>
							  <a href="javascript:;" onClick="del(${course.id})" style="margin-left:20px">删除</a>
							  </td>
							  
							</tr>
	                    </c:forEach>
	                  
	                 
					</c:if>
    				
                    </tbody>
          			<c:if test='${courseList==null || courseList.size()==0}' >
						<tr>
							<td>没有任何记录</td>
						</tr>
					</c:if>
                    </table>
                   
                    <div style="clear:both"></div>
			</form>
			
			<div class="text-center">
			<c:if test='${courseList!=null && courseList.size()>0}' >
                                  <ul class="pagination pagination-sm pro-page-list">
                                  <li><a>共 ${page.totalPageCount} 页 第 ${page.pageNow} 页</a></li>
                                  <li><a href="<%=basePath%>admin/course/list?pageNow=1${pageAddparam}">首页</a></li>
                                  <c:choose>
									<c:when test="${page.pageNow - 1 > 0}">
										<li><a href="<%=basePath%>admin/course/list?pageNow=${page.pageNow - 1}${pageAddparam}">上一页</a></li>
									</c:when>
									<c:when test="${page.pageNow - 1 <= 0}">
										<li><a href="<%=basePath%>admin/course/list?pageNow=1${pageAddparam}">上一页</a></li>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page.pageNow + 1 < page.totalPageCount}">
										<li><a href="<%=basePath%>admin/course/list?pageNow=${page.pageNow + 1}${pageAddparam}">下一页</a></li>
									</c:when>
									<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
										<li><a href="<%=basePath%>admin/course/list?pageNow=${page.totalPageCount}${pageAddparam}">下一页</a></li>
									</c:when>
								</c:choose>
								<li><a href="<%=basePath%>admin/course/list?pageNow=${page.totalPageCount}${pageAddparam}">尾页</a></li>
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
	  location.href="<%=basePath %>admin/course/del/?id="+did;
	}, function(){
	  
	});
}
</script>
  
</body>

</html>