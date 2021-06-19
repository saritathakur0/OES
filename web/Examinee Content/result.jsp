<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
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
assessmentClass assessObj=new assessmentClass();
for(int i=0;i<list.size();i++){
    System.out.println(i+"   "+list.get(i));
}
String[] uans=new String[list.get(10).size()];
for(int i=0;i<list.get(10).size();i++){
    uans[i]=(String)list.get(10).get(i);
}
session.setAttribute("uans", uans);

int[] var=new int[list.get(8).size()];
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
                      <div class="col-lg-9 main-chart">

                                
					<div class="panel-group" id="panel-551660">
                                            <%int k=0;
                                                      int size=list.get(7).size();
                                                      for(int i=0;i<size;i++){
                                                          if((int)list.get(7).get(i)!=0){
                                                    %>
                                            
						<div class="panel panel-default">
                                                    
							<div class="panel-heading">
                                                            <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-551660" href="#panel-element-<%=i%>"><b> Topic :- <%out.println(list.get(8).get(i));%></b></div>
                                                        </div>
								
	                                        <div id="panel-element-<%=i%>" class="panel-collapse collapse">
                                                     <div style="overflow:scroll; height: 500px;">
								
        <%
            int size1=(int)list.get(7).get(i);
            for(int j=0;j<size1;j++){
        %>
        <div class="panel-body">
            <ul class="list-group">    <h4>     <div style="color:black;">            
                        <li class="list-group-item"><%= j+1 %>. <% out.print(list.get(0).get(k));
                        %><br>
                            <% String options=(String)list.get(1).get(k);
                            String[] option= options.split("///"); 
                            if ((String) list.get(4).get(k) != null){
                            %>
                                                        <img src="../images/questionImages/<%=(String)list.get(4).get(k)%>" height="40%" width="80%" /><br><br>
                                                        <% }%>
			<div class="radio" >
				<label>a) <%out.print(option[0]);%></label>
			</div>
			<div class="radio">
				<label>b) <%out.print(option[1]);%></label>
			</div>
			<div class="radio">
				<label>c) <%out.print(option[2]);%></label>
			</div>
			<div class="radio">
				<label>d) <%out.print(option[3]);%></label>
			</div>
                                &nbsp; &nbsp; &nbsp; Correct Answer: <font color="green"><% out.println(list.get(2).get(k)); %></font><br>
                                &nbsp; &nbsp; &nbsp; Your Answer: <font color="red"><% if(list.get(10).get(k) != null) out.println(list.get(10).get(k));%></font><br>
                        &nbsp; &nbsp; &nbsp; <% if(list.get(3).get(k) != null)%>
                        Explanation:
                        
                        <br>
                      
                            <% out.println(list.get(3).get(k));%>
                       
                        <br>
                        </li></div></h4>
        </ul>						
                                </div>
                                                               <% k++;} %>
                                                    	
                                                     </div></div>
                                                </div>
<%
}}
%>

                      </div>
<br><br><br>
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
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
                            
                        for(int i=0;i<list.get(8).size();i++){
                        if((int)list.get(7).get(i)!=0){
                        float per=((float) (list.get(11).get(i)) / (int)list.get(7).get(i));
                         var[i] =(int) (per * 100.0f);
                        %>
                          <div class="bar">
                              <div class="title"><%=(String)list.get(8).get(i)%></div>
                              <div class="value tooltips" data-original-title="<%=list.get(11).get(i)%> answers correct out of <%=list.get(7).get(i)%>" data-toggle="tooltip" data-placement="top"><%=var[i]%>%</div>
                          </div>
                        <% } }%> 
                      </div><br><br><br><br><br>
                      <!--custom chart end-->
                      
<!-- table   ------------------------->
     <br><br><br><br><br><br>
<div style="color:black;">                     
<table class="table table-striped">
    <thead>
      <tr>
        <th><center>Topic</center></th>
        <th><center>Marks obtained</center></th>
        <th><center>Total Marks</center></th>
        <th><center>Percentage</center></th>
        <th><center>Remarks</center></th>
      </tr>
    </thead>
    <% for(int i=0;i<list.get(8).size();i++){ 
        if((int)list.get(7).get(i)!=0){
    %>
    <tbody>
      <tr class="warning">
        <td><center><%=list.get(8).get(i)%></center></td>
        <td><center><%=(float)(float)list.get(11).get(i)*(int)list.get(5).get(0)%></center></td>
        <td><center><%=(int)list.get(7).get(i)*(int)list.get(5).get(0)%></center></td>
        <td><center><%=var[i]%></center></td>

        <td><center><%=assessObj.assess(var[i])%></center></td>
      </tr>
    </tbody>
    <% } }%>
  </table>
</div>
<br><br>                    
                      
<!----table ends here------------------>
                      </div>
                      
<div class="col-lg-3 ds" style="background-color: #dedef8;">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h3>Result</h3></br>
                    <div style="color: black">
                        <table>
                           
                            <tr><td>Total Duration </td> <td>: <% out.println(list.get(6).get(0)); %>min</td></tr>
                            <tr><td>Marks per Question </td> <td>: <% out.println(list.get(5).get(0)); %></td></tr>
                            <tr><td>No. of Questions </td> <td>: <% out.println(list.get(0).size());%></td></tr>
                            <tr><td>Total Marks </td> <td>: <% out.println(list.get(12).get(1));%></td></tr>
                            <tr><td>Total Marks Obtain </td> <td>: <% out.println(list.get(12).get(0));%></td></tr>
                        </table></br></br>
                    </div> 
                        <form action="PDFProcess.jsp" role="form" method="post">
                            
                            <div class="centered"><button type="submit" class="btn btn-info">
                  Send Result to your Email 
                                </button></div><br><br>
                    <%       session.setAttribute("theList", list);
                            //session.setAttribute("totalMarks", totalMarks);
                            //session.setAttribute("obtainMarks", obtainMarks);
                    %>
                        </form>
</div><!-- /col-lg-3 --></div>
          </section></section>
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

  </body>
</html>
