package formsubmit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dat.DatabaseConnection;
import email.EmailOperation;

/**
 * Servlet implementation class NewAskedSubmit
 */
@WebServlet("/newaskedsubmit")
public class NewAskedSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emails[]=request.getParameterValues("myemail");
		String qid=request.getParameter("qid");
		Connection con =DatabaseConnection.getCon();
		try
		{
			PreparedStatement  ps;
			ResultSet rs;
		
			
			
			for(String email:emails)
			{
	
			ps=con.prepareStatement("insert into teac_question values(?,?,?)");
			ps.setString(1, email);
			ps.setString(2,qid);
			ps.setString(3,new Date().toString());
			ps.executeQuery();
			new EmailOperation().sendNewQuestionMail(email, new DatabaseConnection().getStatement(qid));
			}
			
			con.close();
			request.getRequestDispatcher("studenthome.jsp").forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
