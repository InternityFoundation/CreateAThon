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
 * Servlet implementation class SubmitQuery
 */
@WebServlet("/submitquery")
public class SubmitQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String statement=request.getParameter("question");
		String emails[]=request.getParameterValues("email");
		String qid="";
		Connection con =DatabaseConnection.getCon();
		try
		{
			PreparedStatement  ps=con.prepareStatement("select ques_sequence.nextval from dual");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				qid=rs.getString(1);
			}
			
			ps=con.prepareStatement("insert into question values(?,?,?)");
			ps.setString(1, (String)request.getSession().getAttribute("stud"));
			ps.setString(2,qid);
			ps.setString(3,statement);
			ps.executeQuery();
			
			if(emails!=null){
			for(String email:emails)
			{
			ps=con.prepareStatement("insert into teac_question values(?,?,?)");
			ps.setString(1, email);
			ps.setString(2,qid);
			ps.setString(3,new Date().toString());
			ps.executeQuery();
			new EmailOperation().sendNewQuestionMail(email, new DatabaseConnection().getStatement(qid));
			}
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
