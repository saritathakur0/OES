<%-- 
    Document   : singleExamResult
    Created on : Feb 24, 2017, 8:39:19 PM
    Author     : Rishabh
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%!
    ArrayList<ArrayList> list=new ArrayList<ArrayList>();
    ArrayList<String> topicList=new ArrayList<String>();
    String[] arr=null,x2,y2;
    String date1,x1,y1;
    int c=10;
    float avg=0.0f;
%>
<%
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
              String examTitle = request.getParameter("examTitle");
              MethodClass resultObj=new MethodClass();
              list=resultObj.getSingleExamResult(examTitle,name,email);
              for(int i=0;i<list.size();i++){
                    System.out.println(i+"   "+list.get(i));
              }
             
         String topics = (String) list.get(1).get(0);
         String[] topic = topics.split(",");
         
      %>
<!DOCTYPE html>
<html lang="en">
  <head>
 
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      var s=[];
      <% for (int i=0; i<topic.length; i++){ %>
        s[<%= i %>] = "<%= topic[i] %>"; 
        <% } %>
            var r=[];
    <% for (int i=0; i<list.get(0).size(); i++){
        date1=(String)list.get(0).get(i);
    %>
        r[<%= i %>] = "<%= date1 %>"; 
        <% } %>
           
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['topic'
        <% for(int i=0;i<topic.length;i++){%>
          ,s[<%= i %>]
       <% }
        
        %>
            ,'Overall in that Exam' ],
            
            
            
       <% for(int i=0;i<list.get(0).size();i++){ 
           avg=0;
        x1=(String)list.get(3).get(i);
           x2 =x1.split(",");
            y1=(String)list.get(2).get(i);
           y2 =y1.split(",");
       %>
           [  r[<%= i %>] 
           <% for(int j=0;j<topic.length;j++){
              c=j+1;
              int x= Integer.parseInt(x2[j]);
               int y= Integer.parseInt(y2[j]);
               float per=((float) x / y);
               int var =(int) (per * 100.0f);
               avg=avg+per;
           %>
                , <%= var%>
             <% } 
                avg=(float)avg/(int)c;    %>    
             , <%= avg*100.0f%>], 
             
                 <% } %> 

      ]);
      
    var options = {
      title : 'Numbers are given in percentage',
      vAxis: {title: 'Percentage'},
      hAxis: {title: 'Test'},
      seriesType: 'bars',
      series: { <%= c%>: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
    </script>
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
                  <div class="col-lg-9 main-chart">
                    <div class="row">
			<div class="row">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h3 align="center">Analytical View</h3>
                      </div>
                
                      <ul><div id="chart_div" style="width: 900px; height: 500px;"></div>
                      <!--custom chart end-->
					</div><!-- /row -->						
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
              <a href="singleExamResult.jsp#" class="go-top">
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