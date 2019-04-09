
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Changepwd
 */
@WebServlet("/Changepwd")
public class Changepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String uname = (String)session.getAttribute("eid");
		System.out.println(uname+"gdfgdg");
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		
		PrintWriter out = response.getWriter();
		int flag=0;
		try
		{
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
				PreparedStatement ps = con.prepareStatement("select password from addnewemp where empid='"+uname+"' " );
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					
					
					String pswd = rs.getString(2);
					
					if(pswd.equals(oldpwd))
					flag=1;
					
				}
			
				
				
				
				if(flag==1)
				{
					PreparedStatement ps2 = con.prepareStatement("update addnewemp set password=? where empid=?");
					ps2.setString(10, newpwd);
					ps2.setString(2, uname);
					int r= ps2.executeUpdate();
					if(r > 0)
					{
						  out.println("<script>");
						  out.println("alert('New Password Updated successfully')");
						  out.println("location='dts.jsp';"); 
						  out.println("</script>");
					}
				}
				else
				{
				
				  out.println("<script>");
				  out.println("alert('Oops! Your Old Password is Wrong')");
				  out.println("location='dts.jsp';"); out.println("</script>");
				 
					
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
