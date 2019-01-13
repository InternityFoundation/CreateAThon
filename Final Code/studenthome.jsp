<%@page import="dat.DatabaseConnection,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    if(session.getAttribute("stud")==null)
	{
		request.getRequestDispatcher("login_home.jsp").forward(request,response);
		return;
	}
%>
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
	body {font-family: Arial, Helvetica, sans-serif;}	
	.container {padding: 16px; }	
	span.psw {
	  float: right;
	  padding-top: 16px;
	}	
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
	  padding-top: 60px;
	}	
	/* Modal Content/Box */
	.modal-content {
	  background-color:rgba(0,0,0,0.5);
	  margin: 5% auto 25% auto; /* 5% from the top, 15% from the bottom and centered */
	  border: 1px solid #2F3A75;
	  width: 50%; /* Could be more or less, depending on screen size */
	}	
	/* Add Zoom Animation */
	.animate {
	  -webkit-animation: animatezoom 0.6s;
	  animation: animatezoom 0.6s
	}	
	@-webkit-keyframes animatezoom {
	  from {-webkit-transform: scale(0)} 
	  to {-webkit-transform: scale(1)}
	}	  
	@keyframes animatezoom {
	  from {transform: scale(0)} 
	  to {transform: scale(1)}
	}	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	  span.psw {
	     display: block;
	     float: none;
	  }
	  .cancelbtn {
	     width: 100%;
	  }
	}
        
        .filterDiv {    
            font-size: 20px;
            padding-left: 30px;
            padding-right: 20px;
            background-color: #DCDDE5;
            color: black;
            width: 100%;
            line-height: 100px;
            text-align: justify;
            margin: 2px;
            display: none;
            border-radius: 10px 50px 10px 60px;
        }
        .filterDiv:hover {       
            
            background-color: #BBBFFF;
            
        }

        .show {
            display: block;
            }

        .container
        {
            margin-top: 20px;
            overflow: hidden;
        }
        .btn1 {
            width: 100%;
            border: none;
            outline: none;
            padding: 12px 16px;
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .btn1:hover {
            background-color: #ddd;
        }

        .btn1.active {
            background-color: #666;
            color: white;
	</style>   
        <script>
            function move_control1()
            {
                window.open("logout","_self");
            }
            function move_tonewpostpage()
            {
                window.open("composepost.html","_blank");
            }
            function move_control2()
            {
                modal2.style.display = "none";
            }
            function move_control3()
            {
                modal.style.display = "none";
            }
        </script>
    </head>
    <body class="container-fluid" style="height: 700px;align-content: center">
        <div class="row" style="width: 100%;height: 100px;background-color: rgb(1,31,71); border-radius: 10px 50px 10px 50px;">
            <div class="col-md-4">
                <p class="h1" ><a href="index.jsp" style="text-decoration:none;color:white;font-size: 80px;margin-left: 15px;">GetAnswer</a></p>
            </div>  
            <div class="col-md-2"></div>            
            <div class="col-md-6">
                <div class="row" style="height: 25px;"></div>
                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <input type="text" placeholder="Search question.." name="sear" id="myInput" onkeyup="myFunction()" style="width:400px; margin-top: 8px; margin-left: 60px; border-radius: 5px;">
                            <div class="input-group-btn">
                                <button class="btn btn-info" type="submit" name="sear_btn" style="margin-top: 8px;"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
			</div>
                    </div>
                    <div class="col"style="margin-left:50px;">
                        <button id="b1" onclick="document.getElementById('id01').style.display='block'"> 
                            Logout
                        </button>
                    </div>                    
                </div>
            </div>
        </div>
        <div class="row" style="height:20px;">  
            <div class="col-lg-2"></div>
            <div class="col-lg-10">
                
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <div class="card" style="border-radius: 100px 100px 0px 0px;">
                <img src="img/pic1.jpg" alt="Avatar" style="width:100%; height: 200px; border-radius: 100px 100px 100px 100px;">
                <div class="container">
                <h4><b><%= new DatabaseConnection().getStuName((String)session.getAttribute("stud"))%> </b></h4> 
                <p>Computer Engineer</p> 
                </div>
                </div>
                <div class="card">
                <div id="myBtnContainer">
                    <button type="button" class="btn1" data-toggle="collapse" data-target="#demo1">Posts</button><br>
                    <div id="demo1" class="collapse">
                        <button class="btn1" onclick="filterSelection('all')">All Posts (6)</button><br>
                        <button class="btn1" onclick="filterSelection('unanswered')">UnAnswered (4)</button>                            
                    </div>                    
                </div>
                    <button type="button" class="btn btn-primary" onclick="document.getElementById('id02').style.display='block'">New Post</button>
                    <button class="btn btn-secondary" onclick="move_tonewpostpage()">Setting</button>
                </div>                  
            </div>     
            <%
            ArrayList<String> q=new DatabaseConnection().getQuestionStudent((String)session.getAttribute("stud")); %>
            <div class="container" id="myUL">
                <ul style="list-style-type:none;">
                <%for(String ques:q){ String qw[]=ques.split("#"); %>
                <li class="li1"><a href="viewpost.jsp?qid=<%=qw[0]%>"><div class="filterDiv"><%=qw[1] %></div></a></li>
               
                <%} %>
                </ul>
            </div>
        </div>
        <div id="id01" class="modal">		  
            <form class="modal-content animate">
                <div style="color: white;" align="center"><h5>Are you sure you want to logout?</h5></div>
		<div class="container" align="center">
                    <button type="button" class="btn btn-primary" onclick="move_control1()">Yes</button>
                    <button type="button" class="btn btn-primary" onclick="move_control3()">No</button>
                </div>
            </form>
	</div>
        
        <div id="id02" class="modal">		  
            <form class="modal-content animate" action="fetchteacher">
                <div style="color: white;" align="center"><h5>Choose the Subject whose question you want to ask:</h5></div>
		<div class="container" align="center">
                    <select style="height:35px;" name="sub">
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>  
                    <button type="button" class="btn btn-primary" onclick="submit()">Go</button>
                    <button type="button" class="btn btn-primary" onclick="move_control2()">Cancel</button>
                </div>
            </form>
	</div>
        
        <!--script for filtering content  -->        
        <script>
        filterSelection("all")
        function filterSelection(c) 
        {
            var x, i;
           x = document.getElementsByClassName("filterDiv");
            if (c == "all")
                c = "";
            for (i = 0; i < x.length; i++) {
                removeClass(x[i], "show");
                if (x[i].className.indexOf(c) > -1) 
                addClass(x[i], "show");
            }
        }
        function addClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
            if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
            }
        }
        function removeClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
            while (arr1.indexOf(arr2[i]) > -1) {
            arr1.splice(arr1.indexOf(arr2[i]), 1);     
            }
            }   
            element.className = arr1.join(" ");
        }

// Add active class to the current button (highlight it)
        var btnContainer = document.getElementById("myBtnContainer");
        var btns = btnContainer.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function(){
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
        }
        </script>
        <script>            
        // Get the modal
        var modal = document.getElementById('id01');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) 
        {
            if (event.target == modal) 
            {
                modal.style.display = "none";
            }
        }
        
        var modal2 = document.getElementById('id02');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) 
        {
            if (event.target == modal2) 
            {
                modal2.style.display = "none";
            }
        }
       </script>
       <script>
        function myFunction()
        {
            var input, filter, ul, li, a, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            ul = document.getElementById("myUL");
            li = ul.getElementsByClassName("li1");
            for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            txtValue = a.textContent || a.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } 
            else {
                li[i].style.display = "none";
            }   
            }
        }
        </script>
    </body>
</html>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>