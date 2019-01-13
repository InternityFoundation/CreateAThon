<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
	<%
    if(session.getAttribute("stud")==null)
	{
		request.getRequestDispatcher("login_home.jsp").forward(request,response);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Get Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body {
	background-color: #F4F4F4;
}
</style>
</head>
<body class="container" style="height: 700px; align-content: center">
	<div class="row"
		style="width: 100%; height: 60px; background-color: rgb(1, 31, 71); border-radius: 10px 50px 10px 50px;">
		<div class="col">
			<p class="h1">
				<a href="index.jsp"
					style="text-decoration: none; color: white; font-size: 50px; margin-left: 15px;">GetAnswer
					Post</a>
			</p>
		</div>
	</div>
	<div class="row" style="height: 50px;"></div>
	<div class="row">
            <%ArrayList<String>t=(ArrayList<String>)request.getAttribute("teac");%>
            <h4>Available Professors:</h4>
        </div>
        <div>
            <form action="submitquery">
                <table class="table table-bordered table-striped" style="border-radius:10px;">
                <thead style="background-color:#222B4F;color:white;">
                <tr>
                    <th>Name</th>
                    <th>Subject</th>
                    <th>Email</th>
                    <th>Select to Ask</th>
                </tr>
                </thead>
                <tbody>                
                    <%for(String s :t)
                    { 
                        String f[]=s.split("#");%>
                        <tr>
                        <td><%=f[0]%></td>
                        <td><%=request.getAttribute("sub")%></td>
                        <td><%=f[1] %></td>
                        <td><input type="checkbox" name="email" value="<%=f[1] %>" id="check"><br></td>
                        </tr>
                  <%} %>
                </tbody>
                </table>
                <table>    
                    <tr>
			<h5>Compose New Post</h5>
                    </tr>
                    <br>
                    <tr>
			<td>Query:<br /></td>
                    </tr>
                    <tr>
                        <td><textarea rows="6" cols="100" name="question"
                            placeholder="Question"
                            style="font-size: 18px; text-align: justift; padding: 15px; border: 2px solid blue; border-radius: 0px 60px 0px 60px;"></textarea><br />
			</td>
                    </tr>
                    <tr>
			<td>
                            <button id="b3" class="btn btn-success" value="Send">Send</button>
			</td>
                    </tr>
                </table>
            </form>
	</div>
	<div align="center" class="row"
		style="margin-top: 50px; height: 30px; background-color: #343434; color: white; border-radius: 0px 60px 0px 60px;">
		<p align="center" style="width: 100%;">Jayant Sharma</p>
	</div>
</body>
</html>