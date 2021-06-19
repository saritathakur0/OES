<%-- 
    Document   : loginProcessExaminee
    Created on : Nov 6, 2016, 8:08:53 PM
    Author     : Rishabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<!DOCTYPE html>
<%!
String email,password;
int var;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result page</title>
    </head>
    <body><%
     email=request.getParameter("email");
     password=request.getParameter("password");
     System.out.println("*****************************");
      MethodClass loginObj=new MethodClass();
            
        var = loginObj.loginRequestExaminee(email,password);
        if(var>0){
                MethodClass getNameObj=new MethodClass();
                String name=getNameObj.getName(var);
                session.setAttribute("username",name);
                session.setAttribute("email",email);
                //System.out.println(name);
                response.sendRedirect("Examinee Content/examineeProfile.jsp");
        }else
            response.sendRedirect("Home.jsp");
    %>    
    </body>