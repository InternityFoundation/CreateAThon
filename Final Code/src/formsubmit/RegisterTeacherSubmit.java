package formsubmit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dat.DatabaseConnection;
import email.EmailOperation;

@WebServlet("/registerteachersubmit")
public class RegisterTeacherSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterTeacherSubmit() {
        super();
       
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fName,lName,dob,email,pass,mob,gen,state,qual,ins,exp,sub1,sub2,sub3,sub4,sub5,sub6;
		fName=request.getParameter("First_Name");
		lName=request.getParameter("Last_Name");
		dob=request.getParameter("bday");
		email=request.getParameter("Email_Id");
		pass=request.getParameter("Pass");
		mob=request.getParameter("Mobile_Number");
		gen=request.getParameter("Gender");
		state=request.getParameter("State");
		qual=request.getParameter("qualification");
		ins=request.getParameter("institute");
		exp=request.getParameter("experience");
		sub1=request.getParameter("subj1");
		sub2=request.getParameter("subj2");
		sub3=request.getParameter("subj3");
		sub4=request.getParameter("subj4");
		sub5=request.getParameter("subj5");
		sub6=request.getParameter("subj6");
		 
		
		Connection con =DatabaseConnection.getCon();
		try
		{
			
			PreparedStatement ps = con.prepareStatement("insert into teacher_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fName);
			ps.setString(2, lName);
			ps.setString(3, dob);
			ps.setString(4, email);
			ps.setString(5, pass);
			
			ps.setString(6, gen);
			ps.setString(7, state);
			ps.setString(8, qual);
			ps.setString(9, ins);
			ps.setString(10, exp);
			ps.setString(11, sub1);
			ps.setString(12, sub2);
			ps.setString(13, sub3);
			ps.setString(14, sub4);
			ps.setString(15, sub5);
			ps.setString(16, sub6);
			ps.setString(17, mob);
			ps.executeQuery();
			
			
			 try {
				    new EmailOperation().sendRegistrationMail(email);
				    }
				    catch (MessagingException e) {
						
						e.printStackTrace();
					}
			request.getRequestDispatcher("login_teacher.jsp").forward(request, response);
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
