<%--
    Document   : editExamProcess
    Created on : Nov 14, 2016, 2:43:48 PM
    Author     : Rishabh
--%>

<%@page import="java.util.ArrayList"%>
<%@include file="../globalAccess.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
String examTitle,date,duration,topic,qua,examLevel;
int var,val=0,totval=0,marks,totmarks,size=0;

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result page</title>
    </head>
    <body><%
     int id=Integer.parseInt(request.getParameter("examid"));
     topic=null;
     qua=null;
     examTitle=request.getParameter("examTitle");
     date=request.getParameter("date");
     duration= request.getParameter("duration");
     size=list.get(0).size();
     for(int i=0;i<size;i++){
        val=Integer.parseInt(request.getParameter("q["+i+"]"));
        if(val!=0){
            qua=qua+","+val;
            totval=totval+val;
            topic=topic+","+list.get(0).get(i);
        }
     }
     size=list.get(1).size();
     for(int i=0;i<size;i++){
        val=Integer.parseInt(request.getParameter("r["+i+"]"));
        if(val!=0){
            qua=qua+","+val;
            totval=totval+val;
            topic=topic+","+list.get(1).get(i);
        }
     }
     size=list.get(2).size();
     for(int i=0;i<size;i++){
        val=Integer.parseInt(request.getParameter("v["+i+"]"));
        if(val!=0){
            qua=qua+","+val;
            totval=totval+val;
            topic=topic+","+list.get(2).get(i);
        }
     }
     marks=Integer.parseInt(request.getParameter("marks"));
     totmarks=marks*totval;
     
     examLevel=request.getParameter("examLevel");
     if(examLevel.equalsIgnoreCase("Easy"))
         examLevel="1";
     else if(examLevel.equalsIgnoreCase("Medium"))
         examLevel="2";
     else
         examLevel="3";
    
     qua=qua.substring(5);
     topic=topic.substring(5);
     MethodClass examObj=new MethodClass();
     System.out.println(qua +"\n"+topic);
            
        var = examObj.editExamRequest(examTitle,date,duration,marks,examLevel,qua,topic,id);
           System.out.println("RC "+examTitle+" "+date+" "+var);
        if(var>0){
                response.sendRedirect("ExaminerEffects/examinerProfile.jsp");
                
        }else
                response.sendRedirect("setexam1.jsp");
    %>
    </body>
</html>