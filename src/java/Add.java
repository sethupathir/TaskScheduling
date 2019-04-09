import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sethu_joy
 */
public class Add extends HttpServlet {
public void processRequest(HttpServletRequest req,HttpServletResponse res)throws 
IOException,ServletException
    {
        
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String dob=req.getParameter("dob");
        String doj=req.getParameter("doj");
         String college=req.getParameter("college");
          String course=req.getParameter("course");
        String duration=req.getParameter("duration");
        String date=req.getParameter("datee");
        String attend=req.getParameter("attend");
    
        HttpSession session = req.getSession();
        String uname = (String)session.getAttribute("eid");
        
		
	session.setAttribute("student",name);
        
        Connection con=null;
        Statement stmt=null;
        PrintWriter out=res.getWriter();
        try
        {
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
              stmt=con.createStatement();
              int i = stmt.executeUpdate("INSERT INTO addemp (name,email,dob,doj,college,course,duration,eid)VALUES('"+name+"','"+email+"','"+dob+"','"+doj+"','"+college+"','"+course+"','"+duration+"','"+uname+"')");
               
              if(i>0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('insertion successful');");
                out.println("location='view.jsp';");
                out.println("</script>");
                
                
                
              }
              else{
                out.println("<script type=\"text/JavaScript\">");
                out.println("alert(\"Insertion faild\")");
                out.println("</script>");
                
              }
              
        }
        catch(NumberFormatException | ClassNotFoundException | SQLException e)
        {
          out.println(e);       
        }
        
    }
    
    
   
       

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
        
     String name=req.getParameter("name");
        
        
        Connection con=null;
        Statement stmt=null;
        PrintWriter out=res.getWriter();
        try
        {
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/run","root","");
              stmt=con.createStatement();
              int i = stmt.executeUpdate("INSERT INTO new (name)VALUES('"+name+"')");
              if(i>0){
                 out.println("<script type=\"text/JavaScript\">");
                out.println("alert(\"Insertion successful\")");
                out.println("</script>");
                
                RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
                rd.include(req, res);
                
              }
              else{
                out.println("<script type=\"text/JavaScript\">");
                out.println("alert(\"Insertion faild\")");
                out.println("</script>");
                
              }
              
        }
        catch(Exception e)
        {
          out.println(e);       
        }
        
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
