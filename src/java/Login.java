

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidationExe
 */
@WebServlet("/Login")
public class Login extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("empid");		
		String pwd = request.getParameter("password");
		
		String intime = request.getParameter("date1"); 
		String todaydate = request.getParameter("todaydate"); 
		System.out.println(intime);
		System.out.println(todaydate);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("eid",name);
		session.setAttribute("empname1", name);
		HttpSession session1 = request.getSession();
		session1.setAttribute("date", todaydate);
		String type2 = request.getParameter("type2");
		System.out.println();
		PrintWriter out = response.getWriter();
		int flag=0;
		try
		{
			
			//Date createTime = new Date(session1.getCreationTime());
	     	//System.out.println("LoginTime"+createTime);
	     	
	     	
	     	
	     	
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
				PreparedStatement ps = con.prepareStatement("select * from addnewemp");
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					
					String uname = rs.getString(2);
					String pswd = rs.getString(10);
                                        String type = rs.getString(11);

					
					
					
					
					if((name.equals(uname)) && (pwd.equals(pswd)) )
					flag=1;
					
				}
			
				if(flag==1)
				{
						
					if(type2.equals("technical"))
					response.sendRedirect("view.jsp"); 
					
					if(type2.equals("nontechnical"))
						response.sendRedirect("dts.jsp");
					
					
							  PreparedStatement ps2 = con.prepareStatement("insert into punchtime (emp_name,date,intime) values(?,?,?)");
							  
							  
							  ps2.setString(1, name);
							  ps2.setString(2, todaydate);
							  ps2.setString(3, intime);
							  
							   ps2.executeUpdate(); 
							 
							
					
					 
				}
				else
				{
					out.println("<script>");
					out.println("alert('Oops! Your User Name or Password Wrong')");
					out.println("location='index.jsp';");
					out.println("</script>");
					
				}
				
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
