<%-- 
    Document   : examineeOverAllResult
    Created on : Mar 3, 2017, 11:41:56 AM
    Author     : Rishabh
--%>
<%@page import="ConnFiles.MethodClass"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import = " java.util.*" %>
<%!
String examTitle;
ArrayList<ArrayList> list=new ArrayList<ArrayList>();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>PAS</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
      .dot {
        font-size: 20px;
        color:#00E500;
      }
      body{
         margin-bottom:50px;
      }
    </style>
             
  </head>

  <body style="background-color: white;">
      
       <%--
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
--%>
      <%String userName=session.getAttribute("userName").toString();
      session.setAttribute("userName",userName);
              %>   <%
           MethodClass analysisObj=new MethodClass();
           list=analysisObj.examineeFullResult(Integer.parseInt(request.getParameter("id")));
       for(int i=0;i<list.size();i++){
           System.out.println(list.get(i));
       }
       %>
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg" style="background-color: #f64747;">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" style="color:white;" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="" class="logo"> <b>PAS</b></a>
            
      <ul class="pull-right">
                    <li><a href="../Home.jsp">
                           
                            <button class="btn btn-danger" style="background-color: #db4747; border:1px solid black;"><span class="btn glyphicon glyphicon-off" style="color: white;"></span>
                            </button></a>
                    </li>
            	</ul>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><img src="assets/img/ui-sherman.jpg" class="img-circle" width="100" height="100"></p>
              	  <h5 class="centered"><div class="dot">
                          &#9679; Online</div><%=userName%>
                  <li class="mt">
                      <a href="ExaminerEffects/examinerProfile.jsp">
                          <i class="glyphicon glyphicon-user"></i>
                          <span>Profile</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="setexam.jsp">
                          <i class="glyphicon glyphicon-pencil"></i>
                          <span>Set Exam</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="setques.jsp">
                          <i class="glyphicon glyphicon-pencil"></i>
                          <span>Set Questions</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="editExam.jsp">
                          <i class="glyphicon glyphicon-edit"></i>
                          <span>Edit Exam</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="deleteExam.jsp">
                          <i class="glyphicon glyphicon-trash"></i>
                          <span>Delete Exam</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="examineeList.jsp">
                         <i class="glyphicon glyphicon-list-alt"></i>
                          <span>Examinee List</span>
                      </a>
                  </li>
                  <li class="mt">
                      <a href="viewQuestion.jsp">
                          <i class="glyphicon glyphicon-list-alt"></i>
                          
                          <span>View Questions</span>
                      </a>
                  </li>

                 
                 
                  
                     </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
        <section id="main-content">
          <section class="wrapper">
                  <div class="row">
                      <div class="col-md-1"></div>
                      <div class="col-lg-10 main-chart">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <br><br><br><br><br><br>
                          <h3 align="center">Analytical View</h3>
                      </div>
                      <div class="custom-bar-chart">
                          <ul class="y-axis">
                              <li><span>100%</span></li>
                              <li><span>80%</span></li>
                              <li><span>60%</span></li>
                              <li><span>40%</span></li>
                              <li><span>20%</span></li>
                              <li><span>0</span></li>
                          </ul>
                        <%
                        for(int i=0;i<list.get(0).size();i++){
                        float per=((float) (int)list.get(1).get(i) / (int)list.get(2).get(i));
                        int var =(int) (per * 100.0f);
                        System.out.println("-----------------"+var);
                        %>
                          <div class="bar">
                              <div class="title"><%=(String)list.get(0).get(i)%></div>
                              <div class="value tooltips" data-original-title="<%=list.get(1).get(i)%> answers correct out of <%=list.get(2).get(i)%> " data-toggle="tooltip" data-placement="top"><%=var%>%</div>
                          </div>
                        <% }%> 
                      </div></br></br></br></br>
                      <!--custom chart end-->
                      
                      </div>
            </div>
          </section></section>
      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer navbar-fixed-bottom" style="background-color: #928e8e">
          <div class="text-center">
              Copyright
              <a href="examineeOverAllResult.jsp.jsp#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

  </body>
</html>
