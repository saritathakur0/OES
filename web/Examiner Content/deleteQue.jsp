<%-- 
    Document   : deleteQue
    Created on : 21 Feb, 2017, 12:06:07 PM
    Author     : Kavita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import = " ConnFiles.* " %>
<!DOCTYPE html>
<%!
    String que,temp;
    int id;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Question</title>
    
    
    </head>
    <body>
        <%
            //que = request.getParameter("que");
            temp = request.getParameter("id");
            id = Integer.parseInt(temp);
            System.out.println(id);
            MethodClass obj = new MethodClass();
            
            obj.deleteQue(id);
            
            response.sendRedirect("viewQuestion.jsp");
            
        %>
    </body>
</html>
