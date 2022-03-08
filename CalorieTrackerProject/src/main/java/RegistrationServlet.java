
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement st = null;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();		
		
		try{ 
			String pword = request.getParameter("pass");
			int key = 3;
			String en_pword = "";
			
			char[] chars1 = pword.toCharArray();
			for(char c: chars1)
			{
				c+= key;
				en_pword += c;
			}
	
			
		    String strGen = request.getParameter("sex");
		    int iAge = Integer.parseInt(request.getParameter("age"));
		    double dHeight = Double.parseDouble(request.getParameter("height"));
		    double dWeight = Double.parseDouble(request.getParameter("weight"));
		    String strActive = request.getParameter("activeness");
		    Double dCalNeed = 0.0;
		    
		    Class.forName("org.postgresql.Driver");
		    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
		    String sql = "INSERT INTO \"Java\".\"UserDetails\"(\"UserName\", \"Password\", \"Gender\", \"Age\", \"Height\", \"Weight\", \"Activeness\", \"TargetCalorie\")\r\n"
		    		+ "	VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		    st = con.prepareStatement(sql);
		    
		    st.setString(1, request.getParameter("uname"));
		    st.setString(2, en_pword);
		    st.setString(3, strGen);
		    st.setInt(4, iAge);
		    st.setDouble(5, dHeight);
		    st.setDouble(6, dWeight);
		    st.setString(7, strActive);
			
		    if("Male".equals(strGen))
			{
		    	
				dCalNeed = (10*dWeight) + (6.25*dHeight) - (5*iAge) + 5;
				
				if("Sedentary".equals(strActive))
					dCalNeed *= 1.2;

				else if("Less Active".equals(strActive))
					dCalNeed *= 1.375;
				
				else if("Less Active".equals(strActive))
					dCalNeed *= 1.725;
				
				else if("Less Active".equals(strActive))
					dCalNeed *= 1.9;
				
				st.setDouble(8, dCalNeed);
				st.executeUpdate();

			}
		    else if("Female".equals(strGen))
		    {

				dCalNeed = (10*dWeight) + (6.25*dHeight) - (5*iAge) - 161;
				
				if("Sedentary".equals(strActive))
					dCalNeed *= 1.2;

				else if("Less Active".equals(strActive))
					dCalNeed *= 1.375;
				
				else if("Less Active".equals(strActive))
					dCalNeed *= 1.725;
				
				else if("Less Active".equals(strActive))
					dCalNeed *= 1.9;
				st.executeUpdate();
		    }
		    
		    out.println("<script type = \"text/javascript\">");
	        out.println("alert('REGISTERED SUCCESSFULLY')"); 
	        out.println("</script>");

			response.sendRedirect("index.jsp");
		    
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			out.println("<script type = \"text/javascript\">");
	        out.println("alert('User Name already exists. Try another User Name')"); 
	        out.println("</script>");
			response.sendRedirect("reg.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			out.println("<script type = \"text/javascript\">");
	        out.println("alert('Error in Details Entered')"); 
	        out.println("</script>");
			response.sendRedirect("reg.jsp");
		}
		finally
		{
			try {
			     st.close();
			     con.close();
			     out.close();
			    // prepInsert.close();
			}
			catch (Exception e) {
			// TODO Auto-generated catch block
			      e.printStackTrace();
			}
			
		}
}
}