<%-- 
    Document   : setqueProcess
    Created on : Jan 16, 2017, 9:35:57 PM
    Author     : Rishabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="ConnFiles.*"%>
<!DOCTYPE html>
<%!
String examTitle,question,optA,optB,optC,optD,correctAns,exp,topicType,topicName,diffLevel;
String opt,img;
int var;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>set question process</title>
    </head>
    <body>
    <%
     img = request.getParameter("imgVal");
     System.out.println(img);     
     if(img.equals("yes")){
        examTitle=request.getParameter("examTitle");
        question=request.getParameter("Question");
        optA= request.getParameter("OptA");
        optB= request.getParameter("OptB");
        optC= request.getParameter("OptC");
        optD= request.getParameter("OptD");
        correctAns= request.getParameter("optradio");
        exp= request.getParameter("Explanation");
        topicType= request.getParameter("TopicType");
        topicName= request.getParameter("TopicName");
        diffLevel= request.getParameter("DifficultyLevel");
        opt= optA+"///"+optB+"///"+optC+"///"+optD;

        MethodClass setqueObj = new MethodClass();
        var = setqueObj.setQue(examTitle,question,opt,correctAns,exp,topicType,topicName,diffLevel,img);
        System.out.println(var);
        
        response.sendRedirect("imageQueProcess.jsp?id="+var);  
     }else{
        examTitle=request.getParameter("examTitle");
        question=request.getParameter("Question");
        optA= request.getParameter("OptA");
        optB= request.getParameter("OptB");
        optC= request.getParameter("OptC");
        optD= request.getParameter("OptD");
        correctAns= request.getParameter("optradio");
        exp= request.getParameter("Explanation");
        topicType= request.getParameter("TopicType");
        topicName= request.getParameter("TopicName");
        diffLevel= request.getParameter("DifficultyLevel");
        opt= optA+"///"+optB+"///"+optC+"///"+optD;
        img="(NULL)";
        MethodClass setqueObj = new MethodClass();
        var = setqueObj.setQue(examTitle,question,opt,correctAns,exp,topicType,topicName,diffLevel,img);
        if(var>0)
    	 response.sendRedirect("setques.jsp");
        else
         response.sendRedirect("setques.jsp");
    }
     %>
    </body>
</html>
