<%-- 
    Document   : editExam
    Created on : 21 Feb, 2017, 2:23:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="ConnFiles.*" %>
<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
        <title>Edit Exam</title>
    </head>
    <body><%!
    String[] arr=null;
%>
        <%
    MethodClass examObj=new MethodClass();
            
    arr=examObj.selectExamRequest();
    //for(String str : arr)
    //    System.out.println(str);
%><%String userName=session.getAttribute("userName").toString();
      session.setAttribute("userName",userName);
              %><div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button><a class="navbar-brand" href="ExaminerEffects/examinerProfile.jsp">Home</a>
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
				
			</nav><br><br><br><br><br><h1>
						Edit Exam
					</h1>
				<form class="form-horizontal" role="form" action="editExamContent.jsp" method="post">
									<br><br><br>
						<div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Select Exam
							</label>
							<div class="col-sm-4">
								<select class="form-control"  id="field" name="examTitle">
								
                                                            <%
                                                              
                                                                for(String str : arr){
                                                            %>
                                                            <option  id="field" style="color:black;"><%= str%></option>
                                                            <%
                                                                }
                                                            %>
							</select>
							</div>
						</div>	<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
							 
						 <button type="submit" class="btn btn-info">
									Edit
                                                     </button>
							</div>
						</div>
                                </form>
					
			</div>
	</div>
</div>
 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
    
</html>
