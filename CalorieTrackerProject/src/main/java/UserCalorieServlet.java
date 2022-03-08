

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserCalorieServlet
 */
@WebServlet("/UserCalorieServlet")
public class UserCalorieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection objConn = null;
		PreparedStatement objStmt = null;
		ResultSet objRes = null;
		PreparedStatement prepInsert = null;
		try
		{
			Date objDate1 = new Date();
			SimpleDateFormat ft1 = new SimpleDateFormat("dd/MM/yyyy");
			String strDate1 = ft1.format(objDate1);
			
			SimpleDateFormat ft2 = new SimpleDateFormat("HH:mm:ss");
			String strTime = ft2.format(objDate1);
			
		   HttpSession session = request.getSession();	
			
		   String uname = (String) session.getAttribute("uname");
	           
	       String Food = request.getParameter("food");
		   Double Quantity = Double.parseDouble(request.getParameter("quantity"));
           Class.forName("org.postgresql.Driver");
           objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
           
	       
		   String strQuery = "SELECT \"Id\", \"Name\", \"category\", quantity, calorie\r\n"
		   		+ "	FROM \"Java\".\"CalorieValues\"\r\n"
		   		+ "	WHERE \"Name\"=?";
		   objStmt = objConn.prepareStatement(strQuery);
		   objStmt.setString(1,Food);
		   objRes =  objStmt.executeQuery();
		   
		   if(objRes.next())
		   {
			   String Category = objRes.getString(3);
			   int vol = objRes.getInt(4);
			   int calorie = objRes.getInt(5);
			   double finalvol = Quantity/vol;
			   double finalcal = finalvol * calorie;
			   
			   String strInsert = "INSERT INTO \"Java\".\"UserCalorie\"(\"UserName\", \"Date\", \"Time\", \"Food\", \"Category\", \"Quantity\", \"Calorie\")\r\n"
			   		+ "	VALUES (?, ?, ?, ?, ?, ?, ?)";
			 
			   prepInsert = objConn.prepareStatement(strInsert);
			   prepInsert.setString(1, uname);
			   prepInsert.setString(2, strDate1);
			   prepInsert.setString(3, strTime);
			   prepInsert.setString(4, Food);
			   prepInsert.setString(5, Category);
			   prepInsert.setDouble(6, Quantity);
			   prepInsert.setDouble(7, finalcal);		
			   prepInsert.executeUpdate();
			   

			  /* request.setAttribute("uname", username);
			   RequestDispatcher objdispatch = request.getRequestDispatcher("/AddMeal.jsp");
			   objdispatch.forward(request, response);*/
			   response.sendRedirect("AddMeal.jsp");
		   }
	   else 
		 {
			 prepInsert.setString(1, null);
			 prepInsert.setString(2, null);
			 prepInsert.setString(3, null);
			 prepInsert.setString(4, null);
			 prepInsert.setString(5, null);
			 prepInsert.setInt(6, 0);
			 prepInsert.setInt(7, 0);	
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
			     prepInsert.close();
			     objRes.close();
			    }
			catch (Exception e) {
			// TODO Auto-generated catch block
			      e.printStackTrace();
			}
			
		}
	}

}
