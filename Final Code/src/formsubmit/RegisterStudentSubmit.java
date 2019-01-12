package formsubmit;

import java.io.IOException;
import dat.DatabaseConnection;
import email.EmailOperation;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
@WebServlet("/registerstudentsubmit")
public class RegisterStudentSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RegisterStudentSubmit() {
        super();
       
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String fname=request.getParameter("First_Name");
		String lname=request.getParameter("Last_Name");
		String dob=request.getParameter("bday");
		String email=request.getParameter("Email_Id");
		String pass=request.getParameter("Pass");
		long mobile=Long.parseLong(request.getParameter("Mobile_Number"));
		String gender=request.getParameter("Gender");
		String state=request.getParameter("State");
		String country=request.getParameter("Country");
		String a1=request.getParameter("ClassX_Board");
		int a2=Integer.parseInt(request.getParameter("ClassX_Percentage"));
		int a3=Integer.parseInt(request.getParameter("ClassX_YrOfPassing"));
		String b1=request.getParameter("ClassXII_Board");
		int b2=Integer.parseInt(request.getParameter("ClassXII_Percentage"));
		int b3=Integer.parseInt(request.getParameter("ClassXII_YrOfPassing"));
		String c1=request.getParameter("Graduation_Board");
		int c2=Integer.parseInt(request.getParameter("Graduation_Percentage"));
		int c3=Integer.parseInt(request.getParameter("Graduation_YrOfPassing"));
		String d1=request.getParameter("Masters_Board");
		int d2=Integer.parseInt(request.getParameter("Masters_Percentage"));
		int d3=Integer.parseInt(request.getParameter("Masters_YrOfPassing"));
		Connection con =DatabaseConnection.getCon();
		try
		{
		    PreparedStatement ps=con.prepareStatement("insert into student_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    ps.setString(1,fname);
		    ps.setString(2,lname);
		    ps.setString(3,dob);
		    ps.setString(4,email);
		    ps.setString(5,pass);
		    ps.setLong(6,mobile);
		    ps.setString(7,gender);
		    ps.setString(8,state);
		    ps.setString(9,country);
		    ps.setString(10,a1);
		    ps.setInt(11, a2);
		    ps.setInt(12, a3);
		    ps.setString(13,b1);
		    ps.setInt(14, b2);
		    ps.setInt(15, b3);
		    ps.setString(16,c1);
		    ps.setInt(17, c2);
		    ps.setInt(18, c3);
		    ps.setString(19,d1);
		    ps.setInt(20, d2);
		    ps.setInt(21, d3);
		    ps.executeQuery();
                    
		    con.close();
		    try {
		    new EmailOperation().sendRegistrationMail(email);
		    }
		    catch (MessagingException e) {
				
				e.printStackTrace();
			}
		
		    
		    request.getRequestDispatcher("login_student.jsp").forward(request, response);
		}
		catch(SQLIntegrityConstraintViolationException e)
		{
			System.out.print("already regisetered");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.print("ERror");
			
		} 
	}
}
