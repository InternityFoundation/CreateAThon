<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dat.DatabaseConnection,java.util.*"%>
    <%String qid=(String)request.getParameter("qid"); %>
    <%DatabaseConnection db = new DatabaseConnection(); %>
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
            body{
                background-color: #F4F4F4;
            }
        </style>
    </head>
    <body class="container" style="height: 700px;align-content: center">
        <div class="row" style="width: 100%; height: 60px;background-color: rgb(1,31,71); border-radius: 10px 50px 10px 50px;">
            <div class="col">
                <p class="h1" ><a href="index.html" style="text-decoration:none;color:white;font-size: 50px;margin-left: 15px;">GetAnswer Post</a></p>
            </div>            
        </div>
        <div class="row" style="height:50px;"></div>
        <div class="row">             
                <ul style="list-style-type:none;">
                    <li><h3 style="color:#192034;"><%=db.getStatement(qid) %></h3></li>     
                    <%ArrayList<String> e = db.getEmails(qid); %>
                    <%for(String email:e){ %>
                    <li><p>Asked on <%=db.getAskedDate(qid, email)%></p></li>     
                    <li><p>Asked from-<i><b><br><%=db.getTeacName(email) %> ( <%=email %> )</b></i></p></li> 
                    <li>
                        <p><b>Answer:</b></p>
                        <div class="card" style="padding:10px;">
                            <p align="justify">
                           <%=db.getAnswer(qid, email) %>
                            </p>
                        </div>
                    </li>
                    <%} %>
                   
                </ul>   
       <!--   collapse    <button class="btn btn-secondary" data-toggle="collapse" data-target="#demo1">Request More Answers</button>  -->
            <div class="row" style="height:30px;"></div>
        </div>
        <form action="newaskedsubmit">
        <input type="hidden" name="qid" value="<%=qid%>">        
        <div id="" class="">    <!--   Collapse -->         
        <div class="row">
        <%ArrayList<String> ema =db.getUnasked(qid); %>
            <h4>Available Professors:</h4>     
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
            <%for(String em:ema){ %>
                <tr>
                <td><%=db.getTeacName(em) %></td>
                <td><%=db.getTeacSubject(em) %></td>
                <td><%=em %></td>
                <td><input type="checkbox" name="myemail" value="<%=em %>" id="check"><br></td>
                </tr>
                <%} %>
            </tbody>
            </table>           
        </div>
        <button class="btn btn-primary" id="b3" onClick="submit()">Request</button>
        </div>
        </form>
        <div align="center" class="row" style="margin-top: 50px;height: 30px;background-color: #343434;color:white;border-radius: 0px 60px 0px 60px;">
            <p align="center" style="width: 100%;">Jayant Sharma</p>          
        </div>
    </body>
</html>