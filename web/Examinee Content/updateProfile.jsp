<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%!
    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">

    <title>Examinee Profile</title>

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
    <script type="text/javascript" src="js/validation1.js"></script>
    
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

  <body><% 
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
               List<ArrayList> mainList= new ArrayList<ArrayList>( );
             MethodClass examinerObj = new MethodClass( );
             mainList=examinerObj.getExamineeDetails(name,email);
             System.out.println(mainList);
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
                      <a class="active" href="updateProfile.jsp" >
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
                      <a href="selectresult.jsp" >
                           <i class=" fa fa-bar-chart-o"></i>
                          <span>Overall Analysis</span>
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
                  <div class="col-lg-12 main-chart">
        
								      <div class="row">
                         
                              <div class="centered"> <ul><h2> <li><font color="#134558">Edit Details</font></li></h2></ul></div><hr>
                                 
                                  <div class="col-md-8 col-sm-8">
                                    <form class="form-horizontal" onsubmit="return ValidationEvent()" action="editExamineeProcess.jsp">
                                        <div class="form-group">
    
    <div class="col-sm-10"> 
      <input type="hidden" name="examineeId" class="form-control" id="email" value="<%=mainList.get(0).get(0)%>" >
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="name">Name :</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" id="name" value="<%=mainList.get(1).get(0)%>">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Email :</label>
    <div class="col-sm-10"> 
      <input type="text" name="email" class="form-control" id="email" value="<%=mainList.get(2).get(0)%>">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="password">Password :</label>
    <div class="col-sm-10"> 
        <input type="password" name="password" id="password" class="form-control">
    </div>
  </div>
     <div class="form-group">
    <label class="control-label col-sm-2" for="cpassword">Confirm Password :</label>
    <div class="col-sm-10"> 
        <input type="password" name="cpassword" id="cpassword" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="contact" > Mob. No. :</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" name="contact" id="contact" value="<%=mainList.get(4).get(0)%>">
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-info">Update</button>
    </div>
  </div>
</form>                                
                                  </div>
                        </h2>
									
	                     </div>
	                 </div>
              </div><!-- /col-md-4-->
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer id="footer" class="site-footer navbar-fixed-bottom" style="background-color: #928e8e">
          <div class="text-center">
              Copyright
              <a href="updateProfile.jsp#" class="go-top">
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
