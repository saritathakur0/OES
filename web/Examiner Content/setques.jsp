<%-- 
    Document   : setques
    Created on : Jan 16, 2017, 9:37:10 PM
    Author     : Rishabh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Set Question</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

  </head>
  <body><%!
    String[] arr=null;
%><%
    MethodClass examObj=new MethodClass();
            
    arr=examObj.selectExamRequest();
    //for(String str : arr)
    //    System.out.println(str);
%>
<%String userName=session.getAttribute("userName").toString();
      session.setAttribute("userName",userName);
              %>
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row"><br>
				<br><br><br>
				<div class="col-md-6">
					<h1>
						Set Question
					</h1>
				</div>
				<div class="col-md-6">
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="tabbable" id="tabs-20696">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panel-714436" data-toggle="tab">Input Question Manually</a>
							</li>
							<li>
								<a href="#panel-341528" data-toggle="tab">Upload File</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-714436">
				<form class="form-horizontal" role="form" action="setquesProcess.jsp">
									<br><br><br>
						<div class="form-group">
                                     <label class="col-sm-2 control-label" for="examTitle"><font color="#134558">Exam Title(Optional) : </font></label>
                                     <div class="col-sm-6">
                                         <input type="hidden" value=1 name="check">
                                <select  name="ExamTitle" class="form-control">
                                    <option id="field" style="color:black;">      </option>
                                    <%
                                                              
                                        for(String str : arr){
                                            %>
                                               <option  id="field" style="color:black;"><%= str%></option>
                                            <%
                                        }
                                    %>
                                </select> 
                                     </div>
                                 </div>
						<div class="form-group">
							 
							<label for="inputPassword3" class="col-sm-2 control-label">
								Question
							</label>
							<div class="col-sm-10">
                                                            <input type="text" style="height:200px;" class="form-control" required name="Question">
							</div>
						</div>
						<div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label">
								Upload Image
                                                    </label>
                                                    <div>
                                                        <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="yes">
                                                        <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="no">
                                                    </div>
                                                </div>

                                                <div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option A
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required id="inputEmail3" name="OptA">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option B
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required id="inputEmail3" name="OptB">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option C
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required id="inputEmail3" name="OptC">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option D
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required id="inputEmail3" name="OptD">
							</div>
						</div><div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">
								Correct Option
							</label>
					<div class="col-sm-offset-2 ">
						<label class="radio-inline"><input type="radio" name="optradio" value="a"><b>Option A</b></label><br>
						<label class="radio-inline"><input type="radio" name="optradio" value="b"><b>Option B</b></label><br>
						<label class="radio-inline"><input type="radio" name="optradio" value="c"><b>Option C</b></label><br>
						<label class="radio-inline"><input type="radio" name="optradio" value="d"><b>Option D</b></label><br>
				</div><br><div class="form-group">
							 
							<label for="inputPassword3" class="col-sm-2 control-label">
								Explanation
							</label>
							<div class="col-sm-10">
								<input type="text" style="height:200px" class="form-control" id="inputPassword3" name="Explanation">
							</div>
						</div><div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">
								Topic Name
							</label>
							<div class="col-sm-10">
								<input type="text" style="width:250px" required class="form-control" id="inputPassword3" name="TopicName">
							</div>
						</div>
						<div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">
								Difficulty Level
							</label>
							<div class="col-sm-10">
								<input type="text" style="width:50px" required class="form-control" id="inputPassword3" name="DifficultyLevel">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 
								<button type="submit" class="btn btn-info">
									Create
								</button>
							</div>
						</div>
					</form>
							</div></div>
							<div class="tab-pane" id="panel-341528">
								<h1>Upload Question via File</h1>
								<br>
								<form class="form-horizontal" role="form">
						
					<ul class="list-group">
        <li class="list-group-item">1. To upload Questions via a file the examiner needs to use SqlYog Workbench which is available at the server.</li>
        <li class="list-group-item">2. Make sure that the file to be uploaded must be in .csv(comma delimited) format.</li>
        <li class="list-group-item">3. To upload a file select a table goto Table->import a csv file to database->import.</li>
        
        </ul>
							</div></form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<h1>Instructions</h1>
					<div class="panel-group" id="panel-551660">
						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-551660" href="#panel-element-500564">Important Instructions for Uploading Questions Manually</a>
							</div>
							<div id="panel-element-500564" class="panel-collapse collapse">
								<div class="panel-body">
									<ul class="list-group">
        <li class="list-group-item">1. Make sure the questions are in proper format as specified by PAS guidelines.</li>
        <li class="list-group-item">2. Once question uploaded it can be edited in Edit Exam tab.</li>
        <li class="list-group-item">3. Make sure that the images resides in a proper folder and path of the image should be specified.</li>
        <li class="list-group-item">4. Select the topics and number of number of questions per topic and carefully select or enter the Exam tiltle after setting an Exam in Set Exam Tab.</li>
        </ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-551660" href="#panel-element-842970">Important Instructions for Uploading Questions via File</a>
							</div>
							<div id="panel-element-842970" class="panel-collapse collapse">
								<div class="panel-body">
													<ul class="list-group">
		<li class="list-group-item">1. Enter the questions properly as per the rules in the file directory.</li>
        <li class="list-group-item">2. Make sure the questions are in proper format as specified by PAS guidelines.</li>
        <li class="list-group-item">3. Once question uploaded it can be edited in Edit Exam tab.</li>
        <li class="list-group-item">4. Make sure that the images resides in a proper folder and path of the image should be specified.</li>
        <li class="list-group-item">5. Enter the topics and number of number of questions per topic and carefully enter the Exam tiltle after setting an Exam in Set Exam Tab.</li>
        <li class="list-group-item">6. Make sure that you know the correct location of the file.</li>
        </ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
				
			</nav>
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>