<%-- 
    Document   : examProcess
    Created on : Feb 17, 2017, 7:13:52 PM
    Author     : Rishabh
--%>

<%@page import="ConnFiles.MethodClass"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
String examTitle;
int totalMarks=0,l=0;
float obtainMarks=0,topicMarks=0;;
ArrayList<ArrayList> list=new ArrayList<ArrayList>();
ArrayList<String> examineeAnswerList=new ArrayList<String>();
ArrayList topicMarkList=new ArrayList();
ArrayList markList=new ArrayList();
%>
    <body>
 <%
              String name=session.getAttribute("username").toString();
              String email=session.getAttribute("email").toString();
              session.setAttribute("username",name);
              session.setAttribute("email",email);
String examTitle=session.getAttribute("examTitle").toString();
list = (ArrayList<ArrayList>)session.getAttribute("theList");
float negative = (float) list.get(9).get(0);
if(examineeAnswerList!=null)
    examineeAnswerList.clear();
if(topicMarkList!=null)
    topicMarkList.clear();
if(markList!=null)
    markList.clear();
for(int i=0;i<list.get(0).size();i++)
    examineeAnswerList.add(request.getParameter("choice["+i+"]"));
list.add(examineeAnswerList);
l=0;
topicMarks=0;
obtainMarks=0;

for(int i=0;i<list.get(8).size();i++){
    for(int j=0;j<(int)list.get(7).get(i);j++){
        if(list.get(10).get(l)!= null && list.get(10).get(l).equals(list.get(2).get(l))){
            obtainMarks++;
            topicMarks++;
        }else if(list.get(10).get(l)!= null && !list.get(10).get(l).equals(list.get(2).get(l))){
            obtainMarks = obtainMarks - negative;
            topicMarks=topicMarks-negative;
        }
        l++;
    }
    topicMarkList.add(topicMarks);
    topicMarks=0;
}
list.add(topicMarkList);
obtainMarks=obtainMarks * (int)list.get(5).get(0);
totalMarks=list.get(2).size() * (int)list.get(5).get(0);
markList.add(obtainMarks);
markList.add(totalMarks);
list.add(markList);
for(int i=0;i<list.size();i++)
    System.out.println(i+"-- "+list.get(i));
session.setAttribute("theList", list);
session.setAttribute("examTitlet",examTitle);
MethodClass resultObj=new MethodClass();
int var=resultObj.storeResult(list,email,examTitle);
response.sendRedirect("result.jsp");

 %>
    </body>
</html>
