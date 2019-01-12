package dat;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class DatabaseConnection {
	public static Connection getCon()
	{
		Connection con=null;
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","createathon","createathon");//1234
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
    public ArrayList<String> getQuestionStudent(String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps;
		try {
			ArrayList<String> q = new ArrayList<String>();
			ps = con.prepareStatement("select qid,	STATEMENT from question where email=?");
			ps.setString(1, email);
	    	ResultSet rs=ps.executeQuery();
	    	while(rs.next())
	    	{
	    		q.add(rs.getString(1)+"#"+rs.getString(2));
	    	}
	    	return q;
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    public ArrayList<String> getQuestionTeacher(String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps,pd;
		try {
			ArrayList<String> q = new ArrayList<String>();
			ps = con.prepareStatement("select qid,STATEMENT from question where qid in (select qid from teac_question where email=?)");
			ps.setString(1, email);
	    	ResultSet rs=ps.executeQuery();
	    	while(rs.next())
	    	{
	    		String a="Unanswered";
	    		pd=con.prepareStatement("select * from ques_answer where qid=? and temail=?");
	    		pd.setString(1,rs.getString(1));
	    		pd.setString(2, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			a="Answered";
	    		}
	    		q.add(rs.getString(1)+"#"+rs.getString(2)+"#"+a);
	    	}
	    	return q;
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public String getStatement(String qid)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps,pd;
		try {
			ps = con.prepareStatement("select STATEMENT from question where qid =?");
			ps.setString(1, qid);
	    	ResultSet rs=ps.executeQuery();
	    	if(rs.next())
	    	{
	    	
	    		 return rs.getString(1);
	    	}
	    	
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }

    public String getNameOfStudent(String qid)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps,pd;
		try {
			ps = con.prepareStatement("select fname,lname from student_info where email =(select email from question where qid =?)");
			ps.setString(1, qid);
	    	ResultSet rs=ps.executeQuery();
	    	if(rs.next())
	    	{
	    	
	    		 return rs.getString(1)+rs.getString(2);
	    	}
	    	
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    public String getEmailOfStudent(String qid)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps,pd;
		try {
			ps = con.prepareStatement("(select email from question where qid =?)");
			ps.setString(1, qid);
	    	ResultSet rs=ps.executeQuery();
	    	if(rs.next())
	    	{
	    	
	    		 return rs.getString(1);
	    	}
	    	
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    public String getAskedDate(String qid,String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement ps,pd;
		try {
			ps = con.prepareStatement("(select QDATE from teac_question where qid =? and email=?)");
			ps.setString(1, qid);
			ps.setString(2, email);
	    	ResultSet rs=ps.executeQuery();
	    	if(rs.next())
	    	{
	    	
	    		 return rs.getString(1);
	    	}
	    	
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    
    public boolean Answered(String qid,String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select * from ques_answer where qid=? and temail=?");
	    		pd.setString(1,qid);
	    		pd.setString(2, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			return true;
	    		}
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return false;
    }
    public String getAnsweredDate(String qid,String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select adate from ques_answer where qid=? and temail=?");
	    		pd.setString(1,qid);
	    		pd.setString(2, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			return rd.getString(1);
	    		}
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    public String getAnswer(String qid,String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select answer from ques_answer where qid=? and temail=?");
	    		pd.setString(1,qid);
	    		pd.setString(2, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			return rd.getString(1);
	    		}
	    		else
	    		{
	    			return "";
	    		}
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
  
    public ArrayList<String> getEmails(String qid)
    { 
    	ArrayList<String> ed =new ArrayList<String>();
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select email from teac_question where qid=?");
	    		pd.setString(1,qid);
	    		
	    		ResultSet rd =pd.executeQuery();
	    		while(rd.next())
	    		{
	    			ed.add(rd.getString(1));
	    		}
	    		return ed;
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public String getTeacName(String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select fname,lname from teacher_info where email=?");
	    	
	    		pd.setString(1, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			return rd.getString(1)+rd.getString(2);
	    		}
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public String getTeacSubject(String email)
    {
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select sub1,sub2,sub3,sub4,sub5,sub6 from teacher_info where email=?");
	    	 String a="";
	    		pd.setString(1, email);
	    		ResultSet rd =pd.executeQuery();
	    		if(rd.next())
	    		{
	    			for(int i=1;i<=6;i++)
	    			{
	    				String b= rd.getString(i);
	    				if(b!=null)
	    				{
	    					if(a.equals(""))
	    					{
	    						a+=b;
	    				
	    					}
	    					else
	    					{
	    						a+=","+b;
	    					}
	    				}
	    			}
	    			return a;
	    		}
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public ArrayList<String> getUnasked(String qid)
    { 
    	ArrayList<String> ed =new ArrayList<String>();
    	Connection con = DatabaseConnection.getCon();
    	PreparedStatement pd;
		try {
			
	    
	    		pd=con.prepareStatement("select email from teacher_info where email not in (select email from teac_question where qid=?)");
	    		pd.setString(1,qid);
	    		
	    		ResultSet rd =pd.executeQuery();
	    		while(rd.next())
	    		{
	    			ed.add(rd.getString(1));
	    		}
	    		return ed;
	    
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    
    
    
    
    
}
    
    
    
    



