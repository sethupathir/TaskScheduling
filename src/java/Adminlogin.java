
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Adminlogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    
  }
  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
    
    PrintWriter out = response.getWriter();
    String uname = request.getParameter("uname");
    String upass = request.getParameter("upass");
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("select uname,upass from user where uname='"+uname+"' and upass='"+upass+"'");
      
      if(rs.next()) {
        response.sendRedirect("http://localhost:8080/tech/welcome.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("uname", uname);
        
        
      }else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("location='index.jsp';");
                out.println("</script>");
      }
      
      
      
    } catch (ClassNotFoundException | SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
        // TODO Auto-generated catch block
        
    
    
    
  }
}