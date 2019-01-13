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

/**
 * Servlet implementation class SubmitAnswer
 */
@WebServlet("/submitanswer")
public class SubmitAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String statement=request.getParameter("question");
		String qid=request.getParameter("qid");
		String email=(String)request.getSession().getAttribute("teac");
		Connection con =DatabaseConnection.getCon();
		try
		{
			PreparedStatement  ps=con.prepareStatement("select * from ques_answer where temail=? and qid=?");
			ps.setString(1, email);
			ps.setString(2, qid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement  pd=con.prepareStatement("update ques_answer set answer=?,adate=? where temail=? and qid=?");
				pd.setString(1, statement);
				pd.setString(2, new Date().toString());
				pd.setString(3, email);
				pd.setString(4, qid);
				pd.executeQuery();
			}
			else
			{
				PreparedStatement  pd=con.prepareStatement("insert into ques_answer values (?,?,?,?)");
				pd.setString(1, qid);
				pd.setString(2, statement);
				pd.setString(3, email);
				pd.setString(4, new Date().toString());
				
				
				pd.executeQuery();
			}
		
			
			con.close();
			request.getRequestDispatcher("teacherhome.jsp").forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
		
		
	

}
