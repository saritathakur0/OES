<%-- 
    Document   : imageQueProcess
    Created on : 28 Jan, 2017, 5:54:49 PM
    Author     : Kavita
--%>

<!DOCTYPE html>
<%!
    String val;
    int var1;
%>
<HTML>
    <HEAD>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Image Process</title>

        <meta name="description" content="Source code generated using layoutit.com">
        <meta name="author" content="LayoutIt!">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </HEAD>
    <BODY>
        <%
          val = request.getParameter("id");
          
          var1= Integer.parseInt(val);
          System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+ val+"  "+var1);
          session.setAttribute("id",var1);
         %>
        <div class="row">
            <div class="col-md-6">
		<h1>
                    <B>Upload Image</B>
		</h1>
            </div>
            <div class="col-md-6">
            </div>
	</div>
        <FORM  ENCTYPE="multipart/form-data" action = "ImageProcess.jsp" METHOD=POST>
            <div class="form-group">
		<label for="inputEmail3" class="col-sm-2 control-label">
                    <b>Choose the file To Upload:</b>
		</label>
		<div class="col-sm-10">
                    <INPUT NAME="file" TYPE="file" class="btn btn-info">
		</div>
            </div><br><br><br>
            <div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" value = "Send file" class="btn btn-info">
                        
		</div>
            </div>
        </FORM>
    </BODY>
</HTML>

