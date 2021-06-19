<%@page contentType="text/html" pageEncoding="UTF-8" import = " ConnFiles.* " %>
<%@ page import = " java.util.*" %>
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
      <%!
    String que,img;
    String q[];
    int k,i,j,size,size1;
    ArrayList<String> quant = new ArrayList<String>();
    ArrayList<String> reasoning = new ArrayList<String>();
    ArrayList<String> verbal = new ArrayList<String>();
    ArrayList<ArrayList> list = new ArrayList<ArrayList>();
%>
      <%
            MethodClass listObj = new MethodClass();
            MethodClass topicQ = new MethodClass();
            quant = topicQ.topicList("Quantitative");
            
            MethodClass topicR = new MethodClass();
            reasoning = topicR.topicList("Reasoning");
            
            MethodClass topicV = new MethodClass();
            verbal = topicV.topicList("Verbal");

        %>
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
          <h1>View Questions</h1> 
        <section id="main-content">
          <section class="wrapper">
            
            <div class="row">
            <div class="col-lg-12 main-chart">
            <div class="panel-group" id="panel-<%=i%>">
            <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i+100%>" href="#panel-element-<%=i+100%>"><div style="color:blue"><b>Questions based on<font color="red"> &nbsp;&nbsp; Quantitative</font> </b></div></div>
            </div>  
            <div id="panel-element-<%=i+100%>" class="panel-collapse collapse">
            <div style="overflow:scroll; height: auto;">
            <div class="panel-body">
            <%  String type;
                k = 0;
                size = quant.size();
                for(i = 0; i < size; i++){
                    type = quant.get(i);
                    if (type != null){
                        list = listObj.viewQue(type);%>
                            <div class="row">
                            <div class="col-lg-12 main-chart">
                            <div class="panel-group" id="panel-<%=i%>">
                            <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i%>" href="#panel-element-<%=i%>"><b>Questions based on  <%out.println(type);%></b></div>
                            </div>  
                            <div id = "panel-element-<%=i%>" class="panel-collapse collapse">
                            <div style="overflow:scroll; height: auto;">
                            <div class="panel-body">
                                <ul class="list-group"> <h4> <div style="color:black">                 
                                
                                    <%  
                                        size1 = list.get(0).size();
                                        for(j=0;j<size1;j++){
                                            img = (String) list.get(2).get(j);
                                            %><li class="list-group-item">
                                        <%   out.print(list.get(1).get(j));
                                             if(img != null){
                                        %>
                                        <div class="centered"><br><img src="../images/questionImages/<%=img%>"  height="30%" width="50%"  /><br></div>
                                        <% } %>
                                        <br><br>
                                        <div class="centered">
                                            <button type="submit" class="btn btn-success" onclick = "window.location.href='editQue.jsp?id=<%=list.get(0).get(j)%>';"> Edit Question</button>
                                            <button type="submit" class="btn btn-danger" onclick = "window.location.href='deleteQue.jsp?id=<%=list.get(0).get(j)%>';">Delete Question</button>
                                        </div></li>
                                    <% } %>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>   
                    <% k++;
                        }
                    }
                    %>
                            </div></div></div></div></div></div></div>

<% i=0; %>                            
<div class="row">
    <div class="col-lg-12 main-chart">
        <div class="panel-group" id="panel-<%=i+200%>">
            <div class="panel panel-default">
                 <div class="panel-heading">
                    <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i + 200%>" href="#panel-element-<%=i + 200%>"><div style="color:blue"><b>Questions based on<font color="red"> &nbsp;&nbsp;   Logical Reasoning</font> </b></div></div>
                </div>  
                <div id = "panel-element-<%=i + 200%>" class="panel-collapse collapse">
                <div style="overflow:scroll; height: auto;">
                <div class="panel-body">
                    <%  
                        k = 0;
                        size = reasoning.size();
                        for (i = 0; i < size; i++) {
                            type = reasoning.get(i);
                            if (type != null) {
                                list = listObj.viewQue(type);%>
                                <div class="row">
                                    <div class="col-lg-12 main-chart">
                                        <div class="panel-group" id="panel-<%=i+20%>">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i+20%>" href="#panel-element-<%=i+20%>"><b>Questions based on  <%out.println(type);%></b></div>
                                                </div>  
                                            <div id = "panel-element-<%=i+20%>" class="panel-collapse collapse">
                                            <div style="overflow:scroll; height: auto;">
                                            <div class="panel-body">
                                                <ul class="list-group"> <h4> <div style="color:black">               
                                                    <%
                                                        size1 = list.get(0).size();
                                                        for (j = 0; j < size1; j++) {
                                                            img = (String) list.get(2).get(j);
                                                            %><li class="list-group-item">
                                                            <%   out.print(list.get(1).get(j));
                                                                if(img != null){
                                                             %>
                                                                <div class="centered"><br><img src="../images/questionImages/<%=img%>"  height="30%" width="50%"  /><br></div>
                                                            <% } %>
                                                            <br><br>
                                                            <div class="centered">
                                                                <button type="submit" class="btn btn-success" onclick = "window.location.href='editQue.jsp?id=<%=list.get(0).get(j)%>';"> Edit Question</button>
                                                                <button type="submit" class="btn btn-danger" onclick = "window.location.href='deleteQue.jsp?id=<%=list.get(0).get(j)%>';">Delete Question</button>
                                                            </div></li>
                                                        <% } %>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>   
                                    <% k++;
                                    }
                                 }
                            %>
    </div></div></div></div></div></div></div>

            <%i=0;%>
            <div class="row">
            <div class="col-lg-12 main-chart">
            <div class="panel-group" id="panel-<%=i+300%>">
            <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i+300%>" href="#panel-element-<%=i+300%>"><div style="color:blue"><b>Questions based on<font color="red"> &nbsp; &nbsp;    Verbal Ability</font> </b></div></div>
            </div>  
            <div id = "panel-element-<%=i+300%>" class="panel-collapse collapse">
            <div style="overflow:scroll; height: auto;">
            <div class="panel-body">
            <%  
                k = 0;
                size = reasoning.size();
                for(i = 0; i < size; i++){
                    type = verbal.get(i);
                    if (type != null){
                        list = listObj.viewQue(type);%>
                            <div class="row">
                            <div class="col-lg-12 main-chart">
                            <div class="panel-group" id="panel-<%=i+50%>">
                            <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-<%=i+50%>" href="#panel-element-<%=i+50%>"><b>Questions based on  <%out.println(type);%></b></div>
                            </div>  
                            <div id = "panel-element-<%=i+50%>" class="panel-collapse collapse">
                            <div style="overflow:scroll; height: auto;">
                            <div class="panel-body">
                                <ul class="list-group"> <h4> <div style="color:black">                 
                                
                                    <%
                                        size1 = list.get(0).size();
                                        for(j=0;j<size1;j++){
                                            img = (String) list.get(2).get(j);
                                            %><li class="list-group-item">
                                        <%   out.print(list.get(1).get(j));
                                                if(img != null){
                                            %>
                                        <div class="centered"><br><img src="../images/questionImages/<%=img%>"  height="30%" width="50%"  /><br></div>
                                        <% } %>
                                              
                                        <br><br>
                                        <div class="centered">
                                            <button type="submit" class="btn btn-success" onclick = "window.location.href='editQue.jsp?id=<%=list.get(0).get(j)%>';"> Edit Question</button>
                                            <button type="submit" class="btn btn-danger" onclick = "window.location.href='deleteQue.jsp?id=<%=list.get(0).get(j)%>';">Delete Question</button>
                                        </div></li>
                                    <% } %>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>   
                    <% k++;
                        }
                    }
                    %>
                            </div></div></div></div></div></div></div>

      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                
              <! --/row -->
          </section>
      </section>
      </div>
    </div>
  </div>
</div>


  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>