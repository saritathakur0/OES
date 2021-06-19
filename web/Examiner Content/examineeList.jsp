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
ArrayList<Integer> totalExamList=new ArrayList<Integer>();
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
              %> <% 
        
        MethodClass examinerObj = new MethodClass( );
        list=examinerObj.getExamineesDetail();
        for(int i=0;i<list.size();i++){
           System.out.println(i+"   "+list.get(i));
        }
       totalExamList=examinerObj.totalExam();
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
                    <li><a href="../Home.html">
                           
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
                      <a class="active" href="examineeList.jsp">
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
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
<table class="table table-hover">
    <thead>
      <tr>
        <th><center>Name</center></th>
        <th><center>Email</center></th>
        <th><center>Contact</center></th>
        <th><center>Exams Attempted</center></th>
        <th><center>View Result</center></th>
      </tr>
    </thead>
    <% for(int i=0;i<list.get(0).size();i++){ %>
    <tbody>
      <tr>
        <td><center><%=list.get(1).get(i)%></center></td>
        <td><center><%=list.get(2).get(i)%></center></td>
        <td><center><%=list.get(3).get(i)%></center></td>
        <td><center><%=totalExamList.get(i)%></center></td>
        <td><center><button class="btn btn-info" onclick = "window.location.href='examineeOverAllResult.jsp?id=<%=list.get(0).get(i)%>';">Score <i class=" fa fa-bar-chart-o"></i></button></center></td>
      </tr>
    </tbody>
    <% } %>
  </table>
  <br><br><br><br>
  <hr>
  <hr>
  <hr>
  <a href="singleExamAnalysis.jsp"><div class="centered"><button class="btn btn-warning" >View Single Exam Analysis <i class=" fa fa-bar-chart-o"></i></button></div></a>
					
				</div>
			</div>
			
		</div>
	
                      
<!-- /col-lg-3 --></div>
          </section></section>
      <!--main content end-->
      <!--footer start-->
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <footer class="site-footer" style="background-color: #928e8e">
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
