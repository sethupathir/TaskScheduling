

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutPage
 */
@WebServlet("/LogoutPage")
public class LogoutPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PreparedStatement ps2,ps,ps3;
	ResultSet rs,rs2,rs3;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		    	
		
		String empname = (String)session.getAttribute("empname1");
		System.out.println(empname);
		
		
		String time= request.getParameter("btn1");
		System.out.println("Welcome  =======>"+time);
	
		
		 HttpSession session1 = request.getSession(); 
		 String todaydate =(String)session1.getAttribute("date");
		 
		
		
		
		try
		{
				Class.forName("com.mysql.jdbc.Driver");
				
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/erp","root","");
				 ps = con.prepareStatement("update punchtime set outtime=? where emp_name=? AND date=?");
				ps.setString(1, time);
				ps.setString(2, empname);
				ps.setString(3, todaydate);
				ps.executeUpdate();
				
			
				
			
			
				ps2 = con.prepareStatement("select hour(outtime)-hour(intime) as hrs,minute(outtime)-minute(intime) as mins from punchtime where emp_name='"+empname+"' "); 
				rs2 = ps2.executeQuery();
				while(rs2.next())
				{
			  
			  int hrs = rs2.getInt("hrs"); int mins = rs2.getInt("mins");
			  System.out.println(hrs+"."+mins);
			  
			  String tot_hr = hrs+"."+mins;
			  
			  ps3 = con.prepareStatement("update punchtime set duration='"+tot_hr+"' where emp_name='"+empname+"' AND date='"+todaydate+"' "); 
			  ps3.executeUpdate();
			  
			  }
			 
			  
			 
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		response.sendRedirect("index.jsp");
	}

}
