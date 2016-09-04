<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="系统设置" />
</jsp:include>

<!------start content------->
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    
                    <div class="ibox-content">
 
            <form class="am-form am-form-horizontal" method="post" action="<%=basePath%>admin/setting-save">
        
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    
                    <tbody>
                    <c:choose>
                    <c:when test="${requestScope.settingList.size()>0 }">
	    				<c:forEach items="${requestScope.settingList}" var="setting" varStatus="status">
		                    <tr class="gradeX">
							  <td align="center"  >${setting.title}</td>
							  <td align="left">
							  <input type="hidden" value="${setting.id}" name="settingList[${status.index }].id">
							    <c:if test="${setting.type=='input' }">
							    <input type="text" style="width:98%"   id="${setting.name}" value="${setting.value}" name="settingList[${status.index }].value">
							    </c:if>
							    <c:if test="${setting.type=='file' }"></c:if>
							    <c:if test="${setting.type=='textarea' }">
							    <textarea class="" style="width:98%"  rows="5" id="${setting.name}" name="settingList[${status.index }].value">${setting.value}</textarea>
							    </c:if>
							 </td>
							  <td class="left"> ${setting.description} </td>
							  
							</tr>
	                    </c:forEach>
					</c:when>
   					<c:otherwise> 
						<tr>
							<td>没有任何记录</td>
						</tr>
					</c:otherwise>
					</c:choose>
                    </tbody>
          
                    </table>
                    <div class="form-group">
                        <div class="col-sm-2 col-sm-offset-1">
                            <button type="submit" class="btn btn-primary">修改</button>
                        </div>
                    </div>
                    <div style="clear:both"></div>
			</form>
                    </div>
                </div>
            </div>
            </div>
<!------end content------->
<jsp:include page="footer.jsp" /> 

  <script>

  </script>
  
</body>

</html>