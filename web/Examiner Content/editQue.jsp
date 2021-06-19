
<%@page contentType="text/html" pageEncoding="UTF-8" import = " ConnFiles.* "%>
<%@ page import = " java.util.*" %>
<!DOCTYPE html>
<%!
    String temp,que,opt,img,topic,corr,title,exp,lev;
    int id,level;
    char corAns;
    ArrayList<ArrayList> list = new ArrayList<ArrayList>();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Edit Question</title>
        
        <meta name="description" content="Source code generated using layoutit.com">
        <meta name="author" content="LayoutIt!">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        
        <%
           temp = request.getParameter("id");
           id = Integer.parseInt(temp);
           System.out.println(id); 
           session.setAttribute("id",id);
           
           MethodClass obj = new MethodClass();
           list = obj.editQue(id);
           
           que = (String) list.get(0).get(0);
           
           opt = (String) list.get(1).get(0);
           String[] option = opt.split("///");
           
           corr = (String) list.get(2).get(0);
           corAns = corr.charAt(0);
           
           topic = (String) list.get(3).get(0);
           
           level = (int) list.get(4).get(0);
           //level = Integer.parseInt(lev);
           
           exp = (String) list.get(5).get(0);
           
           img = (String) list.get(6).get(0);
           
           title = (String) list.get(7).get(0);
  
        %>
    </head>
    <body>
        
            <div class="container-fluid">
            <div class="row">
		<div class="col-md-12">
			<div class="row"><br>
				<br><br><br>
				<div class="col-md-6">
					<h1>
						Edit Question
					</h1>
				</div>
				<div class="col-md-6">
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="tabbable" id="tabs-20696">
						<div class="tab-content">
							<div class="tab-pane active" id="panel-714436">
				<form class="form-horizontal" role="form" action="editQueProcess.jsp">
									<br><br><br>
						<div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Exam Title (optional)
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="ExamTitle" value="<%=title%>">
							</div>
						</div>
						<div class="form-group">
							 
							<label for="inputPassword3" class="col-sm-2 control-label">
								Question
							</label>
							<div class="col-sm-10">
								<input type="text" style="height:200px;" class="form-control"  name="Question" value="<%=que%>">
							</div>
						</div>
						<div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label">
								Upload Image
                                                    </label>
                                                    <%
                                                        if(img != null){
                                                    %>
                                                    <div>
                                                        <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="yes" checked = "checked">
                                                        <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="no">
                                                        <%
                                                            } else{
                                                         %>
                                                         <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="yes">
                                                        <label for="inputEmail3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No&nbsp;&nbsp;</label>
                                                        <input type="radio" name="imgVal" value="no" checked = "checked">
                                                        <% } %>
                                                    </div>
                                                </div>

                                                <div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option A
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="OptA" value="<%=option[0]%>">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option B
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="OptB" value="<%=option[1]%>">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option C
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="OptC" value="<%=option[2]%>">
							</div>
						</div><div class="form-group">
							 
							<label for="inputEmail3" class="col-sm-2 control-label">
								Option D
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" name="OptD" value="<%=option[3]%>">
							</div>
						</div><div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">
								Correct Option
							</label>
                                            <div class="col-sm-offset-2 ">
                                                <%
                                                    if(corAns == 'a'){
                                                %>
						<label class="radio-inline"><input type="radio" name="optradio" value="a" checked="checked"><b>Option A</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option B</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option C</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option D</b></label><br>
                                                <%
                                                    }else if(corAns == 'b'){
                                                %>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option A</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" checked="checked"><b>Option B</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option C</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option D</b></label><br>
						<%
                                                    }else if(corAns == 'c'){
                                                %>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option A</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option B</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="c" checked="checked"><b>Option C</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option D</b></label><br>
						<%
                                                    }else{
                                                %>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option A</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option B</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="b" ><b>Option C</b></label><br>
                                                <label class="radio-inline"><input type="radio" name="optradio" value="d"><b>Option D</b></label><br>
                                                <% } %>
                                            </div><br><div class="form-group">
							 
							<label for="inputPassword3" class="col-sm-2 control-label">
								Explanation
							</label>
							<div class="col-sm-10">
								<input type="text" style="height:200px" class="form-control" id="inputPassword3" name="Explanation" value = "<%=exp%>">
							</div>
						</div><div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">
								Topic Name
							</label>
							<div class="col-sm-10">
								<input type="text" style="width:250px" class="form-control" id="inputPassword3" name="TopicName" value = "<%=topic%>">
							</div>
						</div>
						<div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">
								Difficulty Level
							</label>
							<div class="col-sm-10">
								<input type="text" style="width:50px" class="form-control" id="inputPassword3" name="DifficultyLevel" value = "<%=level%>">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 
								<button type="submit" class="btn btn-success">
									Update Question
								</button>
							</div>
						</div>
					</form>
							</div></div>
						</div>
					</div>
				</div>
                        </form>
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
					</button> <a class="navbar-brand" href="examinerprofile.html">Home</a>
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
              <a href="editexam.html">Edit Exam</a>
            </li>
            <li>
              <a href="#">Results</a>
            </li>
            <li>
              <a href="#">View Analysis</a>
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
        
    </body>
</html>
