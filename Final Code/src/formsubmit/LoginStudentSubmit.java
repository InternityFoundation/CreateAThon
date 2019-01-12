package formsubmit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dat.DatabaseConnection;

@WebServlet("/loginstudentsubmit")
public class LoginStudentSubmit extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out =response.getWriter();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		Connection con =DatabaseConnection.getCon();
		try
		{
			PreparedStatement ps= con.prepareStatement("select pass from student_info where email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(pass))
				{
					HttpSession ses = request.getSession();
					ses.setAttribute("stud",email);
					request.getRequestDispatcher("studenthome.jsp").forward(request, response);
					
				}
				else
				{
					out.write("wrong password");
				}
			}
			else
			{
				
				out.write("Something went wrong! May be you are not registered or you entered the wrong details.");
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}