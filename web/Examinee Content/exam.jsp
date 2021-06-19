<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%@ page import = " java.util.*" %>
<!DOCTYPE html>
<%!
    String examTitle;
    int k;
    ArrayList<ArrayList> list = new ArrayList<ArrayList>();
    ArrayList<String> examineeAnswerList = new ArrayList<String>();
%>
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
    <script src="js/jquery.min.js"></script>
  
       <script type="text/javascript">
   function disableRightClick(e){
	var message = "Right click disabled";
	if(!document.rightClickDisabled) {// initialize
		if(document.layers) {
			document.captureEvents(Event.MOUSEDOWN);
			document.onmousedown = disableRightClick;
		}else 
			document.oncontextmenu = disableRightClick;
		return document.rightClickDisabled = true;
	}
	if(document.layers || (document.getElementById && !document.all)){
		if (e.which==2||e.which==3){
			alert(message);
			return false;
		}
	}else{
		alert(message);
		return false;
	}
   }
   disableRightClick();
</script>
<script type='text/javascript'>
  document.onkeydown = function (e) {
    e.preventDefault();
    alert("Not use keyboard")
  }
</script>

<script>
            $(window).blur(function() {
                alert('You are not allowed to leave this page');
            });
</script>
<script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            };
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

  <body style="background-color: white;">

         <%
              String examTitle=session.getAttribute("examTitle").toString();
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
              list=(ArrayList<ArrayList>)session.getAttribute("list");
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
            <div class="nav notify-row" id="top_menu">
            </div>
  
        <ul class="pull-right">
            <h3><div id="divCounter" style="color: white;"></div></h3>
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
                            <form class="form-horizontal" role="form" action="examProcess.jsp" method="post">
                               <!-- <div class="panel panel-heading panel-primary"><h5> <font color="black">All Questions Are Compulsary...!!!</font></h5></div>-->
                              <!--  <div style="overflow:scroll; height: auto;">-->
                                <div class="panel-group" id="panel-551660">
                                    <% k = 0;
                                        int size = list.get(7).size();
                                        for (int i = 0; i < size; i++) {
                                            if ((int) list.get(7).get(i) != 0) {
                                    %>
                                
                                    <div class="panel panel-default">
                                        
                                        <div class="panel-heading">
                                            <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-551660" href="#panel-element-<%=i%>"><b>Attempt Questions Based On Topic :- <%out.println(list.get(8).get(i));%></b></div>
                                        </div>
                                        
                                        <div id="panel-element-<%=i%>" class="panel-collapse collapse">
                                      <div style="overflow:scroll; height: 500px;">

                                            <%
                                                int size1 = (int) list.get(7).get(i);
                                                for (int j = 0; j < size1; j++) {
                                            %>
                                            <div class="panel-body">
                                                <ul class="list-group"> <h4> <div style="color:black">                 
                                                    <li class="list-group-item"><%= j + 1%>. <% out.print(list.get(0).get(k));
                                                        %><br><br>
                                                        <% String options = (String) list.get(1).get(k);
                                                            String[] option = options.split("///");
                                                            if ((String) list.get(4).get(k) != null) {
                                                        %>
                                                        <img src="..\images\questionImages\<%=(String)list.get(4).get(k)%>"  height="40%" width="50%"  /><br><br>
                                                        <% }
                                                        %>
                                                        <div class="radio" >
                                                            <label>a) &nbsp; &nbsp; &nbsp; <input type="radio" name="choice[<%= k%>]" value="a"><%out.print(option[0]);%></label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>b) &nbsp; &nbsp; &nbsp; <input type="radio" name="choice[<%= k%>]" value="b"><%out.print(option[1]);%></label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>c) &nbsp; &nbsp; &nbsp; <input type="radio" name="choice[<%= k%>]" value="c"><%out.print(option[2]);%></label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>d) &nbsp; &nbsp; &nbsp; <input type="radio" name="choice[<%= k%>]" value="d"><%out.print(option[3]);%></label>
                                                        </div>
                                                    </li></div></h4>
                                                        </div>
                                                </ul>		
                                                   
                                                <%
                                                        k++;
                                                    } %>

                                       </div>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                    <br><div class="centered"><button type="submit" class="btn btn-danger">  Submit Exam  </button></div></br>
                                </div>
                            <!--    </div>-->
                            </form>
                      </div>
                                        <%
                                    session.setAttribute("theList", list);
                                %>
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                
              </div><! --/row -->
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
 
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
         <script>
        var countDownTime = <%=(int) list.get(6).get(0) * 60 %>;
        function countDownTimer() {
            var hours = parseInt(countDownTime / 3600) % 24;
            var minutes = parseInt(countDownTime / 60) % 60;
            var seconds = countDownTime % 60;
            var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
            document.getElementById("divCounter").innerHTML = result;
            if (countDownTime == 0) {
                window.location.href = "examover.jsp";
            }
            countDownTime = countDownTime - 1;
            setTimeout(function () {
                countDownTimer()
            }, 1000);
            // setTimeout(function(){ alert('muni') }, 1000*2);
            // document.getElementById('divCounter').innerHTML = countDownTime;
        }
        countDownTimer();

                    </script>
                    <script type="text/javascript">
function disableF5(e) { if ((e.which || e.keyCode) == 116) e.preventDefault(); };
$(document).on("keydown", disableF5);
</script>
  </body>
</html>
