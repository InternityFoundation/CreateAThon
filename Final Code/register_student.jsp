<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Get Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script>
            function move_to_home()
            {
                window.open("login_home.jsp","_self");
            }
        </script>
    </head>
    <body class="container-fluid" style="height: 700px;align-content: center">
        <div class="row" style="width: 100%;height: 100px;background-color: rgb(1,31,71); border-radius: 10px 50px 10px 50px;">
            <div class="col">
                <p class="h1" ><a href="index.jsp" style="text-decoration:none;color:white;font-size: 80px;margin-left: 15px;">GetAnswer</a></p>
            </div>  
            <div class="col"></div>
            <div class="col"></div>
            <div class="col">
                <div class="row" style="height: 25px;"></div>
                <div class="row">
                    <div class="col"></div>                    
                    <div class="col">
                        <button type="button" id="b1" onclick="move_to_home()"> 
                            Home
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <h2 style="color:rgb(1,31,71);margin-top: 10px;margin-left: 30px;">Register Here</h2>
        <div class="row" style="margin-top: 60px; height:310px; ">
            <div class="col-lg-1"></div>               
            <div class="col-lg-10" style="width: 600px;height:480px;border: 1px solid #2F3A75; color:white; padding: 15px; font-size: 18px;overflow:auto;">
                <table align="center" cellpadding = "10">
 <form action="registerstudentsubmit" method="get">
<!----- First Name ---------------------------------------------------------->
                <tr>
                <td>FIRST NAME</td>
                <td><input type="text" name="First_Name" maxlength="30"/>
                (max 30 characters a-z and A-Z)
                </td>
                </tr>
 
<!----- Last Name ---------------------------------------------------------->
                <tr>
                <td>LAST NAME</td>
                <td><input type="text" name="Last_Name" maxlength="30"/>
                (max 30 characters a-z and A-Z)
                </td>
                </tr>
 
<!----- Date Of Birth -------------------------------------------------------->
                <tr>
                <td>DATE OF BIRTH</td> 
                <td>
                <input type="date" name="bday">
                </td>
                </tr>
 
<!----- Email Id ---------------------------------------------------------->
                <tr>
                <td>EMAIL ID</td>
                <td><input type="email" name="Email_Id" maxlength="100" /></td>
                </tr>
<!----- Password ---------------------------------------------------------->
                <tr>
                <td>PASSWORD</td>
                <td><input type="password" name="Pass" maxlength="100" /></td>
                </tr>
 
<!----- Mobile Number ---------------------------------------------------------->
                <tr>
                <td>MOBILE NUMBER</td>
                <td>
                <input type="text" name="Mobile_Number" maxlength="10" />
                (10 digit number)
                </td>
                </tr>
 
<!----- Gender ----------------------------------------------------------->
                <tr>
                <td>GENDER</td>
                <td>
                    Male <input type="radio" name="Gender" value="Male" />
                    Female <input type="radio" name="Gender" value="Female" />
                </td>
                </tr>
 
<!----- State ---------------------------------------------------------->
                <tr>
                <td>STATE</td>
                <td><input type="text" name="State" maxlength="30" />
                (max 30 characters a-z and A-Z)
                </td>
                </tr>
 
<!----- Country ---------------------------------------------------------->
                <tr>
                <td>COUNTRY</td>
                <td><input type="text" name="Country" value="India" readonly="readonly" /></td>
                </tr>

 
<!----- Qualification---------------------------------------------------------->
                <tr>
                <td>QUALIFICATION <br /><br /><br /><br /><br /><br /><br /></td>
 
               <td>
                <table>
 
                <tr>
                <td align="center"><b>Sl.No.</b></td>
                <td align="center"><b>Examination</b></td>
                <td align="center"><b>Board</b></td>
                <td align="center"><b>Percentage</b></td>
                <td align="center"><b>Year of Passing</b></td>
                </tr>
 
                <tr>
                <td>1</td>
                <td>Class X</td>
                <td><input type="text" name="ClassX_Board" maxlength="30" /></td>
                <td><input type="text" name="ClassX_Percentage" maxlength="30" /></td>
                <td><input type="text" name="ClassX_YrOfPassing" maxlength="30" /></td>
                </tr>
 
                <tr>
                <td>2</td>
                <td>Class XII</td>
                <td><input type="text" name="ClassXII_Board" maxlength="30" /></td>
                <td><input type="text" name="ClassXII_Percentage" maxlength="30" /></td>
                <td><input type="text" name="ClassXII_YrOfPassing" maxlength="30" /></td>
                </tr>
 
                    <tr>
                <td>3</td>
                <td>Graduation</td>
                <td><input type="text" name="Graduation_Board" maxlength="30" /></td>
                <td><input type="text" name="Graduation_Percentage" maxlength="30" /></td>
                <td><input type="text" name="Graduation_YrOfPassing" maxlength="30" /></td>
                </tr>
 
                <tr>
                <td>4</td>
                <td>Masters</td>
                <td><input type="text" name="Masters_Board" maxlength="30" /></td>
                <td><input type="text" name="Masters_Percentage" maxlength="30" /></td>
                <td><input type="text" name="Masters_YrOfPassing" maxlength="30" /></td>
                </tr>
 
                <tr>
                <td></td>
                <td></td>
                <td align="center">(10 char max)</td>
                <td align="center">(upto 2 decimal)</td>
                </tr>
                </table>
 
                </td> 
              </tr>

 
<!----- Submit and Reset ------------------------------------------------->
                <tr>
                <td colspan="2" align="center">
                    <input id="b2" type="submit" class="btn btn-primary"> Submit
                    <button id="b3" type="button" class="btn btn-primary"> Reset</button>
                </td>
                </tr>
                </form>
            </table>
            </div>                      
            <div class="col-lg-1"></div> 
        </div>  
        <div class="row" style="height:220px;">
        </div>
        <div class="row" style="height: 50px;color:white; background-color: #011F47;">
            <div class="col"></div>
            <p style="font-size:20px;">Jayant Sharma</p>
            <div class="col"></div>
        </div>
    </body>
</html>