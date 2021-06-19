<%-- 
    Document   : editExamContent
    Created on : 21 Feb, 2017, 6:03:19 PM
    Author     : ASUS
--%>
<%@include file="../globalAccess.jsp" %>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Exam</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
         <% 
        List<ArrayList> mainList= new ArrayList<ArrayList>( );
        MethodClass examinerObj = new MethodClass( );
        mainList=examinerObj.examInfoFetch(request.getParameter("examTitle"));
        System.out.println(mainList);
       
        %>
        <div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header">
           
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
             <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
          </button> <a class="navbar-brand" href="examinerProfile.jsp">Home</a>
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
              <a href="editexam.jsp">Edit Exam</a>
            </li>
            <li>
              <a href="#">Results</a>
            </li>
            <li>
              <a href="#">View Analysis</a>
            </li>
            <li>
              <a href="xeon/Home.jsp">Logout</a>
            </li>
          </ul>
        </div>
        
      </nav><br><br><br>
       <%--
        String id = mainList.get(0).toString().replaceAll("[\\[\\]]", "").replaceAll(",", "");
        String title = mainList.get(1).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String marks = mainList.get(2).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String duration = mainList.get(3).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String date = mainList.get(4).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String topic = mainList.get(5).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String level = mainList.get(6).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");
        String topicquantity = mainList.get(7).toString().replaceAll("[\\[\\]]", "").replaceAll(",", " ");

        int id1=Integer.parseInt(id);
        //session.setAttribute("userId", id1);
        //session.setAttribute("name", name);
        //session.setAttribute("email", email);
        //session.setAttribute("pass", password);
       --%>
      <div class="row">
        <div class="col-md-8"><h1>
            Edit Exam
          </h1>
            <form class="form-horizontal" action="editExamProcess.jsp" role="form" method="post">
                  <br><br><br>
                  <div class="form-group">
               
             
              <div class="col-sm-8">
                <input type="hidden" name="examid" value="<%= mainList.get(0).get(0)%>" class="form-control" id="inputEmail3">
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">
                Exam Title
              </label>
              <div class="col-sm-8">
                <input type="text" required name="examTitle" value="<%=mainList.get(1).get(0)%> " class="form-control" id="inputEmail3">
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
                    <input type="date" name="date" required value="<%=mainList.get(4).get(0)%> " class="form-control" />
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
                    <input type='text' value="<%=mainList.get(3).get(0)%> " required name="duration" class="form-control" />
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
              <div class="col-sm-4">
              
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
           int size=list.get(0).size();
           for(int i=0;i<size;i++){
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
           size=list.get(1).size();
           for(int i=0;i<size;i++){
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
           size=list.get(2).size();
           for(int i=0;i<size;i++){
       %>
        <li class="list-group-item"><%out.print(i+1);%>.<% out.println(list.get(2).get(i));%><input type="text" name="v[<%= i %>]" value="0" placeholder="Enter number of questions" style="width:200px" class="form-control" id="inputPassword3"></li>
        <%  
            }
        %>
      </ul>
     
  </div>
</div>



</div>
</div></div>
            </div>
                  

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
Exam Level
              </label>
              <div class="col-sm-2">
                <select class="form-control" required  id="sel1" name="examLevel">
    <option selected>-SELECT-</option>
    <option>Easy</option>
    <option>Medium</option>
    <option>Hard</option>
  </select>
              </div>
            </div>

            

<div class="form-group">
               
             
              
            </div><div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                 
                   <button type="submit" class="btn btn-info">
                  Edit Exam
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
     <script src="js/bootstrap.min.js"></script>
    </body>
       

</html>
