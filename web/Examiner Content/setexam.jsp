<%@include file="../globalAccess.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
    <title>Set Exam</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
  </head>
  <body>
      <%String userName=session.getAttribute("userName").toString();
      session.setAttribute("userName",userName);
              %>
              
     
      <div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header">
           
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
             <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
          </button> <a class="navbar-brand" href="ExaminerEffects/examinerProfile.jsp">Home</a>
        </div>
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li>
              <a href="setexam.jsp">Set Exam</a>
            </li>
            <li>
              <a href="setques.jsp">Set Questions</a>
            </li>
            <li>
              <a href="editExam.jsp">Edit Exam</a>
            </li>
            <li>
              <a href="deleteExam.jsp">Delete Exam</a>
            </li>
            <li>
                <a href="viewQuestion.jsp">View Questions</a>
            </li>
            <li>
              <a href="../Home.jsp">Logout</a>
            </li>
          </ul>
        </div>
        
      </nav><br><br><br>
      <div class="row">
        <div class="col-md-8"><h1>
            Set Exam
          </h1>
            <form class="form-horizontal" action="setExamProcess.jsp" role="form" method="post">
                  <br><br><br>
            <div class="form-group">
               
              <label for="inputEmail3" class="col-sm-2 control-label">
                Exam Title
              </label>
              <div class="col-sm-8">
                  <input type="text" name="examTitle" autocomplete="off" required class="form-control" id="inputEmail3">
              </div>
            </div>
                   <div class="form-group"> <!-- Date input -->
       <label for="inputEmail3" class="col-sm-2 control-label">
                Select Date
              </label><ul>
        <div class="container">
    <div class="row">
        <div class='col-sm-2'>
            
                <div class='input-group date' id='datetimepicker1'>
                    <input type="date" name="date" class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
           
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
    </div>
</div>
</div>
 <div class="form-group">
               
              <label for="inputEmail3" class="col-sm-2 control-label">
                Enter Duration
              </label>
              <div class="col-sm-2">
                 <div class='input-group date' id='timepicker1'>
                    <input type='text' name="duration" placeholder="Minutes" required class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-time"></span>
                    </span>
                </div>
              </div>
            </div>
         <div class="form-group">
               
              <label for="inputEmail3" class="col-sm-2 control-label">
                Selects Topics
              </label>
              <div class="col-sm-3">
              
                  <div class="center">
                           <div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse1"><h4>Quantitative</h4></a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
       <ul class="list-group">
       <%
           int size1=list.get(0).size();
           for(int i=0;i<size1;i++){
       %>
        <li class="list-group-item"><%out.print(i+1);%>.<% out.println(list.get(0).get(i));%><input type="text" name="q[<%= i %>]" value="0" placeholder="Enter number of questions" style="width:200px" class="form-control" id="inputPassword3"></li>
        <%
            }
        %>
      </ul>
  </div>
</div>
                        </div>
                    </div>

              </div>
<div class="col-sm-3">
 <div class="center">
                           <div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse2"><h4>Logical Reasoning</h4></a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <ul class="list-group">
          <%
       int    size2=list.get(1).size();
           for(int i=0;i<size2;i++){
       %>
       <li class="list-group-item"><%out.print(i+1);%>.<% out.println(list.get(1).get(i));%><input type="text" name="r[<%= i %>]" value="0" placeholder="Enter number of questions" style="width:200px" class="form-control" id="inputPassword3"></li>
        <%
            }
        %>
        
      </ul>
     
  </div>
</div>
                        </div>
                        </div>
</div>
        
<div class="col-sm-3">
<div class="center">
                              <div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse3"><h4>Verbal Ability</h4></a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <ul class="list-group">
        <%
         int  size3=list.get(2).size();
           for(int i=0;i<size3;i++){
       %>
        <li class="list-group-item"><%out.print(i+1);%>.<% out.println(list.get(2).get(i));%><input type="text" name="v[<%= i %>]" value="0" placeholder="Enter number of questions" style="width:200px" class="form-control" id="inputPassword3"></li>
        <%  
            }
        %>
      </ul>
     
  </div>
</div>



</div>
</div></div></div>
         
                  

 <div class="form-group">
               
              <label for="inputEmail3" class="col-sm-2 control-label">
Marks per Question
              </label>
              <div class="col-sm-2">
                <select class="form-control" required id="sel1" name="marks">
    <option selected>-SELECT-</option>
    <option>1</option>
    <option>2</option>
    <option>3</option>
    <option>4</option>
    <option>5</option>
    <option>6</option>
    <option>7</option>
    <option>8</option>
    <option>9</option>
    <option>10</option>
  </select>
              </div>
            </div>
      
      <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">
                Negative Mark
              </label>
              <div class="col-sm-2">
                    <input type='text' name="negative" value ="0.00"   class="form-control" />
              </div>
            </div>


 <div class="form-group">
               
              <label for="inputEmail3" class="col-sm-2 control-label">
Exam Level
              </label>
              <div class="col-sm-2">
                <select class="form-control" required id="sel1" name="examLevel">
    <option selected>-SELECT-</option>
    <option>Easy</option>
    <option>Medium</option>
    <option>Hard</option>
  </select>
              </div>
            </div>

     

<div class="form-group">
               
             
              
            </div><div class="form-group">
              <div class="col-sm-offset-2 col-sm-10" >
                 
               <!--   <a href="#modal-container-setexam" data-toggle="modal" > --> <button type="submit" class="btn btn-info" >
                  Set Exam
                      </button>
                  
              </div>
            </div>
          </form>
        </div><br><br><br> 
        <div class="col-md-4">
          <div class="panel-group" id="panel-909088">
            <div class="panel panel-default">
              <div class="panel-heading">
                 <a class="panel-title" data-toggle="collapse" data-parent="#panel-909088" href="#panel-element-315745">Instructions</a>
              </div>
              <div id="panel-element-315745" class="panel-collapse collapse in">
                <div class="panel-body">
                 <ul class="list-group">
        <li class="list-group-item">1. Make sure the questions are in proper format as specified by PAS guidelines.</li>
        <li class="list-group-item">2. Specify the number of questions properly for topics.</li>
        <li class="list-group-item">3. If you don't want any questions for a particular topic then leave the field blank.</li>
        <li class="list-group-item">4. The total number of questions and total marks will be displayed automatically when you decide the number of question.</li>
        </ul>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%! String title;
int totalque,marks,quantque,resoningque,verbalque,totmarks;
%>
<%--
  title=  request.getParameter("examTitle");
  marks= Integer.parseInt(request.getParameter("marks"));
           for(int i=0;i<size1;i++){
        quantque=Integer.parseInt(request.getParameter("q["+i+"]"));
            }
           
            for(int i=0;i<size2;i++){
        resoningque=Integer.parseInt(request.getParameter("r["+i+"]"));
            }
            for(int i=0;i<size3;i++){
        verbalque=Integer.parseInt(request.getParameter("v["+i+"]"));
            }
        totalque=quantque+resoningque+verbalque;
        totmarks=totalque*marks;




--%>
      <div class="modal fade" id="modal-container-setexam" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						
						<div class="modal-body">
							<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
                    <form class="form-horizontal" role="form" action="">
			<br><h1>Confirm Exam</h1>
				<div class="form-group">
					 
					<label for="inputEmail3" class="col-sm-3 control-label">
						Exam Title:
					</label>
					<div class="col-sm-09">
                                            <%=title%> 
					</div>
				</div>
				<div class="form-group">
					 
					<label for="inputPassword3" class="col-sm-3 control-label">
						Total Questions:
					</label>
					<div class="col-sm-09">
                                            <%=totalque%>
					</div>
				</div>
                                        <div class="form-group">
					 
					<label for="inputPassword3" class="col-sm-3 control-label">
						Total Marks:
					</label>
					<div class="col-sm-09">
                                            <%=totmarks%>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-12">
						 
						<button type="submit" class="btn btn-success">
							Set Exam
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
						</div>
					</div>
					
				</div>
				
			</div>

  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>
