package formsubmit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FetchTeacher
 */
@WebServlet("/fetchteacher")
public class FetchTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sub = request.getParameter("sub");
		Connection con = dat.DatabaseConnection.getCon();
		ArrayList<String> t= new ArrayList<String>();
		try {
			PreparedStatement ps = con.prepareStatement("select fname,lname,email from teacher_info where sub1=? or sub2=? or sub3=? or sub4=? or sub5=? or sub6=?");
			ps.setString(1, sub);
			ps.setString(2, sub);
			ps.setString(3, sub);
			ps.setString(4, sub);
			ps.setString(5, sub);
			ps.setString(6, sub);
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				t.add(rs.getString(1)+rs.getString(2)+"#"+rs.getString(3));
			}
			request.setAttribute("teac", t);
			request.setAttribute("sub", sub);
			request.getRequestDispatcher("studentpost.jsp").forward(request, response);;
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
