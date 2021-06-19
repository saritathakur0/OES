<%-- 
    Document   : PDFProcess
    Created on : Feb 15, 2017, 2:49:04 PM
    Author     : Rishabh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%@ page import = " java.util.*" %>
<%!
ArrayList<ArrayList> list=new ArrayList<ArrayList>();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
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
              <script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            }

        </script>
  </head>

  <body style="background-color: white;">
         <%
String name=session.getAttribute("username").toString();
String email=session.getAttribute("email").toString();
session.setAttribute("username",name);
              session.setAttribute("email",email);
              
list = (ArrayList<ArrayList>)session.getAttribute("theList");
session.setAttribute("list",list);
String examTitle=(String)session.getAttribute("examTitle");

int var=PDFReport.main(list,email,examTitle,name);
if(var>0)
    response.sendRedirect("result.jsp");
else
    %>
    <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg" style="background-color: #f64747;">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" style="color:white;"data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="" class="logo"><b>PAS</b></a>
            <!--logo end-->
          
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
              
              	  <p class="centered"><img src="assets/img/examinee.png" class="img-circle" width="100" height="100"></p>
              	  <h5 class="centered"><div class="dot">
                                        &#9679; Online</div><%=name%></h5>
              	  	
                  <li class="mt">
                      <a href="examineeProfile.jsp">
                          <i class="glyphicon glyphicon-user"></i>
                          <span>Profile</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="updateProfile.jsp" >
                          <i class="glyphicon glyphicon-pencil"></i>
                          <span>Update Profile</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="chooseExam.jsp" >
                          <i class="fa">&#xf108;</i>
                          <span>Exams</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a class="active" href="selectresult.jsp" >
                          <i class="glyphicon glyphicon-list-alt"></i>
                          <span>Results</span>
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
      <br><br><br><br><br>
        <div class="container-fluid">
            <ul><ul><ul><ul><ul><ul><ul><ul><ul><ul><div class="row">
		<div class="col-md-8">
			<div class="alert alert-warning alert-dismissable">
                            
				<h2>
					Alert!
                                </h2><h4><ul><ul> Your provided Email id is incorrect. Please update with your correct Email id.</h4>
			</div>
		</div>
	</div>
</div>
      
      <form action="result.jsp" method="post"> 
				 <br><div class="centered"><button type="submit" class="btn btn-danger">  OK  </button></div>
      </form>
      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer navbar-fixed-bottom" style="background-color: #928e8e">
          <div class="text-center">
              Copyright
              <a href="examList.jsp#" class="go-top">
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

    
    
         <%
        %>
    </body>
</html>
