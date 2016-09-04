<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
</section>
</section>
      <!--main content end-->

      <!--footer start-->
      <%-- <footer class="site-footer">
          <div class="text-center">
              2016 &copy; ${web_setting.sitename }.
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer> --%>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>Public/js/jquery.js"></script>
    <script src="<%=basePath%>Public/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="<%=basePath%>Public/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=basePath%>Public/js/jquery.scrollTo.min.js"></script>
    <script src="<%=basePath%>Public/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="<%=basePath%>Public/js/jquery.sparkline.js" type="text/javascript"></script>
    <!-- <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="js/owl.carousel.js" ></script> -->
    <script src="<%=basePath%>Public/js/jquery.customSelect.min.js" ></script>
    <script src="<%=basePath%>Public/js/respond.min.js" ></script>

    <!--right slidebar-->
    <script src="<%=basePath%>Public/js/slidebars.min.js"></script>

    <!--common script for all pages-->
    <script src="<%=basePath%>Public/js/common-scripts.js"></script>

    <!--script for this page-->
    <!-- <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script> -->
    <script src="<%=basePath%>Public/js/count.js"></script>
    
    <script src="<%=basePath%>Public/js/layer/layer.js"></script>


