<%-- 
    Document   : deleteExamProcess
    Created on : 27 Feb, 2017, 1:12:37 PM
    Author     : ASUS
--%>
<%@include file="../globalAccess.jsp" %>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Exam</title>
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
       
        MethodClass examinerObj = new MethodClass( );
        
        String title=request.getParameter("examTitle");
        System.out.println(title);
       int var = examinerObj.examDeletion(title);
           
        if(var>0){
                response.sendRedirect("ExaminerEffects/examinerProfile.jsp");
                
        }
       
        %>
    </body>
</html>
