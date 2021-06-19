<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%!
    
%><!DOCTYPE html>
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

  <body>
 <%
                            String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
              //MethodClass examObj=new MethodClass();   
            //   examObj.selectExamRequest();
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
              
              	  <p class="centered"><img src="assets/img/ujju.jpg" class="img-circle" width="100" height="100"></p>
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
                      <a class="active" href="chooseExam.jsp" >
                          <i class="fa">&#xf108;</i>
                          <span>Exams</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="result.jsp" >
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
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-12 main-chart centered">
        
								      <div class="row">
				
                          <h2><ul>
                             <li><font color="#134558">Instructions</font></li>
                             <hr>
                             <li><u><font color="#134558">Before beginning the exam :</font></u></li>
                             <ol>
                                <li>1. Make sure you have a good internet connection.</li>
                                <li>2. Do not use any other internet browser.</li>
                                <li>3. Maximize your browser window before starting the test.</li>
                                <li>4. When you begin the exam click the link only ONCE to launch the test. Double clicking can lock the test.</li>
                             </ol>
                             <li> <hr> </li>
                             <li><u><font color="#134558">During the exam :</font></u></li>
                             <ol>
                                <li>1. Do not resize (minimize) the browser during the test.</li>
                                <li>2. Students must complete the 50-question multiple-choice exam within the 75 minute time frame allotted for the exam.</li>
                                <li>3. Students must not stop the session and then return to it. This is especially important in the online environment where the system will "time-out" and not allow the student or you to re-enter the exam site.</li>
                                <li>4. Never click the “BACK” button on browser. This will take you out of the test and prevent Blackboard from tracking your selected answers.</li>
                                <li>5. Click the “SUBMIT” button to submit your exam. Do not press “ENTER” on the keyboard to submit the exam.</li>

                             </ol>
                             <li> <hr> </li>
                             <li><b>If you encounter problems accessing or submitting your exam,  you must contact your instructor immediately.</b></li>
                             <hr>
                             <li>
                                 <a href="exam.jsp"><input type="button" value="Start Exam"></a>
                              </li>
                          </ul>

                        </h2>
									
	                     </div>
	                 </div>
              </div><!-- /col-md-4-->
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer navbar-fixed-bottom" style="background-color: #928e8e">
          <div class="text-center">
              Copyright
              <a href="instructions.jsp#" class="go-top">
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
