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

/**
 * Servlet implementation class LoginStudentSubmit
 */
@WebServlet("/loginteachersubmit")
public class LoginTeacherSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginTeacherSubmit() 
    {
        super();
       
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out =response.getWriter();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		Connection con =DatabaseConnection.getCon();
		try
		{
			PreparedStatement ps= con.prepareStatement("select pass from teacher_info where email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(pass))
				{
					HttpSession ses = request.getSession();
					ses.setAttribute("teac",email);
					request.getRequestDispatcher("teacherhome.jsp").forward(request, response);
				}
				else
				{
					out.write("wrong password");
				}
			}
			else
			{
				
				out.write("you are not registered");
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
