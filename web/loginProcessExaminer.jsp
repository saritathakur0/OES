<%-- 
    Document   : loginProcess
    Created on : Nov 6, 2016, 6:34:19 PM
    Author     : Rishabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<!DOCTYPE html>
<%!
String username,password;
int var;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result page</title>
    </head>
    <body><%
     username=request.getParameter("email");
     password=request.getParameter("password");
     System.out.println("*****************************");
      MethodClass loginObj=new MethodClass();
            
        var = loginObj.loginRequestExaminer(username,password);
        String name1=loginObj.getExaminerName(var);
        session.setAttribute("userName",name1);
        if(var>0){
                response.sendRedirect("Examiner Content/ExaminerEffects/examinerProfile.jsp");
        }else
            response.sendRedirect("Home.jsp");
    %>    
    </body>