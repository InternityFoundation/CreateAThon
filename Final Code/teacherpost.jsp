<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dat.DatabaseConnection"%>
<!DOCTYPE html>
<%String qid=(String)request.getParameter("qid"); %>
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
                <p class="h1" ><a href="index.jsp" style="text-decoration:none;color:white;font-size: 50px;margin-left: 15px;">GetAnswer Post</a></p>
            </div>            
        </div>
        <%DatabaseConnection db = new DatabaseConnection(); %>
        <div class="row" style="height:50px;"></div>     
        <div class="row">             
                <ul style="list-style-type:none;">
                    <li><h3 style="color:#192034;"><%=db.getStatement(qid) %></h3></li>     
                    <li>Question asked by:</li>
                    <li><b><i><%=db.getNameOfStudent(qid)%></i></b></li>
                    <li><%=db.getEmailOfStudent(qid) %></li>
                    <li><p><%=db.getAskedDate(qid,(String)session.getAttribute("teac"))%></p></li>          
                    <%if(db.Answered(qid,(String)session.getAttribute("teac"))) {%>
                    <li><p>Answered on <%=db.getAnsweredDate(qid,(String)session.getAttribute("teac")) %></p></li>                         
                    <li>
                        <p><b>You answered this:</b></p>
                        <div class="card" style="padding:10px;">
                            <p align="justify">
                             <%=db.getAnswer(qid,(String)session.getAttribute("teac")) %>
                            </p>
                        </div>
                    </li>  
                    <%} %>                 
                </ul>   
 <!-- commenting this button  <button class="btn btn-secondary" data-toggle="collapse" data-target="#demo1">Create or Edit</button> -->           
            <div class="row" style="height:30px;"></div>
        </div>
        
        <!-- id class remove kara hain  -->
        <div id="" class="">      
        <div class="row" style="margin-top: 20px;">           
            <form  name="myform" action="submitanswer">
            <input type="hidden" name="qid" value="<%=qid%>">
		<table>
                    <tr>
                        <h5>Compose Post</h5> 
                    </tr>
                    <tr>
                    <div class="card" style="padding:10px;">
                        <p align="justify"  id="view_text" style="width:1000px;">
                            
                        </p>
                    </div>              
                    </tr>
                    <tr style="margin-top:10px;"></tr> 
                    <tr style="margin-top:10px;">
                        <td><button type="submit" class="btn btn-success" value="Send" id="b3" style="width:100px">Send</button></td>
                    </tr>
                    <tr align="center" style="margin-top:10px;">
                        <td>
                            <textarea id="my_text" rows="10" cols="137" name="question" placeholder="Question" style="font-size:16px;text-align: justift; padding:15px;border:2px solid blue;border-radius:5px"></textarea><br/>
                        </td>
                    </tr>                                      
                    <tr>
                        <td>                            
                            <button type="button" class="btn btn-success" value="Send" id="b3" style="width:100px" onclick="view_text()">Review</button>
                        </td>
                        
                    </tr>                      
		</table>
            </form>     
        </div>  
        </div>
        <div align="center" class="row" style="margin-top: 280px;height: 30px;background-color: #343434;color:white;border-radius: 0px 60px 0px 60px;">
            <p align="center" style="width: 100%;">Jayant Sharma</p>          
        </div>
        <script type="text/javascript">
        function view_text ()         {
			// Find html elements.
			var textArea = document.getElementById('my_text');
			var div = document.getElementById('view_text');
			
			// Put the text in a variable so we can manipulate it.
			var text = textArea.value;
			
			// Make sure html and php tags are unusable by disabling < and >.
			text = text.replace(/\</gi, "<");
			text = text.replace(/\>/gi, ">");
			
			// Exchange newlines for <br />
			text = text.replace(/\n/gi, "<br />");
			
			// Basic BBCodes.
			text = text.replace(/\[b\]/gi, "<b>");
			text = text.replace(/\[\/b\]/gi, "</b>");
			
			text = text.replace(/\[i\]/gi, "<i>");
			text = text.replace(/\[\/i\]/gi, "</i>");
			
			text = text.replace(/\[u\]/gi, "<u>");
			text = text.replace(/\[\/u\]/gi, "</u>");
			
			// Print the text in the div made for it.
			div.innerHTML = text;
        }
        </script>
    </body>
</html>

