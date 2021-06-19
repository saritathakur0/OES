<%-- 
    Document   : editExamineeProcess
    Created on : Mar 2, 2017, 4:01:33 PM
    Author     : Rishabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<%!
String fname,contact,email1,password;
int id,var;
 
%>
<%
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result page</title>
    </head>
    <body><%
        id=Integer.parseInt(request.getParameter("examineeId"));
     fname=request.getParameter("name");
     contact=request.getParameter("contact");
     email1=request.getParameter("email");
     password=request.getParameter("password");
     
     MethodClass rejObj=new MethodClass();
            
        var = rejObj.updateExaminee(id,fname,email1,password,contact);
        if(var>0){
                response.sendRedirect("examineeProfile.jsp");
                
        }else
            response.sendRedirect("home.jsp");
    %>
    </body>
</html>