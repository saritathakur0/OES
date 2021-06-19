
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<!DOCTYPE html>
<%!
String fname,gender,cname,contact,email,password;
int var;

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result page</title>
    </head>
    <body><%
     fname=request.getParameter("fname");
     gender=request.getParameter("gender");
     cname= request.getParameter("cname");
     contact=request.getParameter("contact");
     email=request.getParameter("email");
     password=request.getParameter("password");
     
     MethodClass rejObj=new MethodClass();
     System.out.println("okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
            
        var = rejObj.regRequest(fname,gender,cname,contact,email,password);
           System.out.println("RC "+fname+" "+gender+" "+var);
        if(var>0){
                response.sendRedirect("Home.jsp");
                
        }else
            response.sendRedirect("home.jsp");
    %>
    </body>
</html>