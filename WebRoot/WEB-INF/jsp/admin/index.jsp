<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp" flush="true">
  <jsp:param name="pageTitle" value="首页" />
</jsp:include>

<!------start content------->


  <!--state overview start-->
  <div class="row state-overview">
    <div class="col-lg-3 col-sm-6">
      <section class="panel">
        <div class="symbol terques"> <i class="fa fa-user"></i> </div>
        <div class="value">
          <h1 class="count"> ${studentCount } </h1>
          <p>注册用户</p>
        </div>
      </section>
    </div>
    <div class="col-lg-3 col-sm-6">
      <section class="panel">
        <div class="symbol red"> <i class="fa fa-user"></i> </div>
        <div class="value">
          <h1 class=" count2"> ${teacherCount } </h1>
          <p>入注教师</p>
        </div>
      </section>
    </div>
    <div class="col-lg-3 col-sm-6">
      <section class="panel">
        <div class="symbol blue"> <i class="fa fa-bar-chart-o"></i> </div>
        <div class="value">
          <h1 class=" count4"> ${courseCount } </h1>
          <p>课程数量</p>
        </div>
      </section>
    </div>
    <div class="col-lg-3 col-sm-6">
      <section class="panel">
        <div class="symbol yellow"> <i class="fa fa-bullhorn"></i> </div>
        <div class="value">
          <h1 class=" count3"> ${commentCount } </h1>
          <p>评论数量</p>
        </div>
      </section>
    </div>
    
  </div>
  <!--state overview end-->
  <div class="row">
    <div class="col-lg-12"> 
      <!--timeline start-->
      <section class="panel">
        <div class="panel-body">
          <div class="text-center mbot30">
            <h3 class="timeline-title">最新评论</h3>
          </div>
          <div class="timeline">
          <c:if test="${commentList!=null &&  commentList.size()>0 }">
          <c:forEach items="${commentList}" var="comment" varStatus="status">
            <!-- 1 -->
            <c:if test="${status.count == 1}">
            <article class="timeline-item">
              <div class="timeline-desk">
                <div class="panel">
                  <div class="panel-body"> <span class="arrow"></span> <span class="timeline-icon red"></span> <span class="timeline-date"><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                    <h1 class="red">${comment.student.username}</h1>
                    <p>${comment.qustion}</p>
                  </div>
                </div>
              </div>
            </article>
            </c:if>
          
            <!-- 2 -->
            <c:if test="${status.count == 2}">
            <article class="timeline-item alt">
              <div class="timeline-desk">
                <div class="panel">
                  <div class="panel-body"> <span class="arrow-alt"></span> <span class="timeline-icon green"></span> <span class="timeline-date"><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                    <h1 class="green">${comment.student.username}</h1>
                    <p>${comment.qustion}</p>
                  </div>
                </div>
              </div>
            </article>
            </c:if>
            <!-- 3 -->
           <c:if test="${status.count == 3}">
            <article class="timeline-item">
              <div class="timeline-desk">
                <div class="panel">
                  <div class="panel-body"> <span class="arrow"></span> <span class="timeline-icon blue"></span> <span class="timeline-date"><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                    <h1 class="blue">${comment.student.username}</h1>
                    <p>${comment.qustion}</p>
                  </div>
                </div>
              </div>
            </article>
            </c:if>
            
            <!-- 4 -->
            <c:if test="${status.count == 4}">
            <article class="timeline-item alt">
              <div class="timeline-desk">
                <div class="panel">
                  <div class="panel-body"> <span class="arrow-alt"></span> <span class="timeline-icon purple"></span> <span class="timeline-date"><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                    <h1 class="purple">${comment.student.username}</h1>
                    <p>${comment.qustion}</p>
                  </div>
                </div>
              </div>
            </article>
            </c:if>
            
            <!-- 5 -->
            <c:if test="${status.count == 5}">
            <article class="timeline-item">
              <div class="timeline-desk">
                <div class="panel">
                  <div class="panel-body"> <span class="arrow"></span> <span class="timeline-icon light-green"></span> <span class="timeline-date"><fmt:formatDate value="${comment.qustionTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                    <h1 class="light-green">${comment.student.username}</h1>
                    <p>${comment.qustion}</p>
                  </div>
                </div>
              </div>
            </article>
            </c:if>
            
            </c:forEach>
            </c:if> 
          </div>
          <div class="clearfix">&nbsp;</div>
        </div>
      </section>
      <!--timeline end--> 
    </div>
  </div>




<!------end content------->
<jsp:include page="footer.jsp" /> 

  <script>
countUp(parseInt("${studentCount }"));
countUp2(parseInt("${teacherCount }"));
countUp3(parseInt("${courseCount }"));
countUp4(parseInt("${commentCount }"));
      //owl carousel

   /*    $(document).ready(function() {
          $("#owl-demo").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true,
			  autoPlay:true

          });
      });


      $(function(){
          $('select.styled').customSelect();
      });

      $(window).on("resize",function(){
          var owl = $("#owl-demo").data("owlCarousel");
          owl.reinit();
      }); */

  </script>
  
</body>

</html>