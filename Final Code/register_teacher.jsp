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
 <form action="registerteachersubmit" method="post">
<!----- First Name ---------------------------------------------------------->
                <tr>
                <td>FIRST NAME</td>
                <td><input type="text" name="First_Name" maxlength="30" required/>
                (max 30 characters a-z and A-Z)
                </td>
                </tr>
 
<!----- Last Name ---------------------------------------------------------->
                <tr>
                <td>LAST NAME</td>
                <td><input type="text" name="Last_Name" maxlength="30" required />
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
                <td><input type="email" name="Email_Id" maxlength="100" required /></td>
                </tr>
<!----- Password ---------------------------------------------------------->
                <tr>
                <td>PASSWORD</td>
                <td><input type="password" name="Pass" maxlength="100" required /></td>
                </tr>
 
<!----- Mobile Number ---------------------------------------------------------->
                <tr>
                <td>MOBILE NUMBER</td>
                <td>
                <input type="text" name="Mobile_Number" maxlength="10" required />
                (10 digit number)
                </td>
                </tr>
 
<!----- Gender ----------------------------------------------------------->
                <tr>
                <td>GENDER</td>
                <td>
                    Male <input id="type1" type="radio" name="Gender" value="Male" required />
                    Female <input id="type1" type="radio" name="Gender" value="Female" required />
                </td>
                </tr>
 
<!----- State ---------------------------------------------------------->
                <tr>
                <td>STATE</td>
                <td><input type="text" name="State" maxlength="30" required />
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
                <td>EDUCATION DETAILS <br /><br /><br /><br /><br /><br /><br /></td> 
                <td>
                <table>
 
                <tr>
                <input type="text" placeholder="Qualification" name="qualification" maxlength="10" required />   <br>               
                </tr>
 
                <tr>
                <input type="text" placeholder="Institute" name="institute" maxlength="30" required />    <br>         
                </tr>
                 <tr>
                <input type="text" placeholder="Experience" name="experience" maxlength="10" required/>             
                </tr>
                
                </table> 
                </td>
                </tr>
                
                <tr>
                <td>SUBJECT(S)<br /><br /><br /><br /><br /><br /><br /></td> 
                <td>
                <table>
                <tr>
                  <br>           
                </tr>
               
                <br><br>              
                
                <tr>
                    <select style="height:35px;" name="subj1">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
            <!--    <input type="text" placeholder="Subject 1" name="subj1" maxlength="35" VALUE=""/>    <br>      -->        
                </tr>
                <tr>
                    <select style="height:35px;" name="subj2">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
              <!--    <input type="text" placeholder="Subject 2" name="subj2" maxlength="35" VALUE=""/>  <br>     -->               
                </tr>
                <tr>
                    <select style="height:35px;" name="subj3">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
           <!--       <input type="text" placeholder="Subject 3" name="subj3" maxlength="35" VALUE=""/>   <br>    -->               
                </tr>
                <tr>
                    <select style="height:35px;" name="subj4">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
            <!--      <input type="text" placeholder="Subject 4" name="subj4" maxlength="35" VALUE=""/>   <br>     -->              
                </tr> 
                <tr>
                    <select style="height:35px;" name="subj5">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
            <!--      <input type="text" placeholder="Subject 5" name="subj5" maxlength="35" VALUE=""/>    <br>     -->             
                </tr>
                <tr>
                    <select style="height:35px;" name="subj6">
                        <option value="">Select</option>
                        <option value="os">Operating System</option>
                        <option value="se">Software Engineering</option>
                        <option value="mp">Microprocessor</option>
                        <option value="tafl">Theory of Automata</option>
                        <option value="wt">Web Technology</option>
                        <option value="dbms">Database Management System</option>
                        <option value="daa">Design and Analysis of Algorithm</option>
                        <option value="ppl">Principle of Programming Language</option>
                    </select>
            <!--      <input type="text" placeholder="Subject 6" name="subj6" maxlength="35" VALUE=""/>   <br>      -->             
                </tr>
                </table> 
                </td>
                </tr>
 
<!----- Submit and Reset ------------------------------------------------->
                <tr>
                <td colspan="2" align="center">
                	 <input type="submit"  class="btn btn-primary" id="b2" />   
                    <input type="reset"  class="btn btn-primary" id="b2" />   
                  
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