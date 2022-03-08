import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dbo.Logindbo;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection objConn = null;
		PreparedStatement objStmt = null;
		ResultSet objRes = null;
		Logindbo objDbo = new Logindbo();
		try
		{
			Class.forName("org.postgresql.Driver");
			objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
			String username = request.getParameter("uname");    
			String pwd = request.getParameter("pass");
			String de_pword = "";
			int key = 3;
			char[] chars = pwd.toCharArray();
			for(char c: chars)
			{
				c += key;
				de_pword += c;
			}			
			
			int iTarget=0;
			String strQuery = "SELECT \"UserName\", \"Password\", \"Gender\", \"Age\", \"Height\", \"Weight\", \"Activeness\", \"TargetCalorie\"\r\n"
					+ "	FROM \"Java\".\"UserDetails\" WHERE \"UserName\"=? and \"Password\" =?";
			objStmt = objConn.prepareStatement(strQuery);
			objStmt.setString(1, username);
			objStmt.setString(2, de_pword);
			objRes =  objStmt.executeQuery();
			
			HttpSession session = request.getSession();			
			PrintWriter out = response.getWriter();
			
			if(objRes.next())
			{
				username = (objRes.getString(1));
				iTarget = (objRes.getInt(8));
				
				session.setAttribute("uname", username);
				session.setAttribute("target", iTarget);
				objDbo.setName(username);
				objDbo.setTarget(iTarget);
				
				out.println("<script type = \"text/javascript\">");
		        out.println("alert('LOGEED IN SUCCESSFULLY')"); 
		        out.println("</script>");
				response.sendRedirect("AddMeal.jsp");
			}
			else {
				
		        out.println("<script type = \"text/javascript\">");
		        out.println("alert('INVALID USERNAME OR PASSWORD')"); 
		        out.println("</script>");

				response.sendRedirect("index.jsp");
		    }			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			try {
			     objStmt.close();
			     objConn.close();
			     objRes.close();
			     
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			      e.printStackTrace();
			}
			
		}
	}

}
