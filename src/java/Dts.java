
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sethu_joy
 */
public class Dts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
         String dob = request.getParameter("date");
         String nine= request.getParameter("nine");
         String ten= request.getParameter("ten");
         String ele= request.getParameter("ele");
         String twe= request.getParameter("twe");
         String one= request.getParameter("one");
         String two= request.getParameter("two");
         String three= request.getParameter("three");
         String four= request.getParameter("four");
         String five= request.getParameter("five");
         String six= request.getParameter("six");
         String seven= request.getParameter("seven");
         String anine= request.getParameter("anine");
         String aten=request.getParameter("aten");
         String aele=request.getParameter("aele");
         String atwe=request.getParameter("atwe");
         String aone=request.getParameter("aone");
         String atwo=request.getParameter("atwo");
         String athree=request.getParameter("athree");
         String afour=request.getParameter("afour");
         String afive=request.getParameter("afive");
         String asix=request.getParameter("asix");
         String aseven=request.getParameter("aseven");
         String rnine=request.getParameter("rnine");
         String rten=request.getParameter("rten");
         String rele=request.getParameter("rele");
         String rtwe=request.getParameter("rtwe");
         String rone=request.getParameter("rone");
         String rtwo=request.getParameter("rtwo");
         String rthree=request.getParameter("rthree");
         String rfour=request.getParameter("rfour");
         String rfive=request.getParameter("rfive");
         String rsix=request.getParameter("rsix");
         String rseven=request.getParameter("rseven");
         
         PrintWriter out = response.getWriter();
       
            /* TODO output your page here. You may use following sample code. */
          
            try {
              
                Class.forName("com.mysql.jdbc.Driver");               
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");                 
                Statement stmt = con.createStatement();               
                int i=stmt.executeUpdate("insert into dts(date,nine,ten,ele,twe,one,two,three,four,five,six,seven,anine,aten,aele,atwe,aone,atwo,athree,afour,afive,asix,aseven,rnine,rten,rele,rtwe,rone,rtwo,rthree,rfour,rfive,rsix,rseven) values('"+dob+"','"+nine+"','"+ten+"','"+ele+"','"+twe+"','"+one+"','"+two+"','"+three+"','"+four+"','"+five+"','"+six+"','"+seven+"'"
                        + ",'"+anine+"','"+aten+"','"+aele+"','"+atwe+"','"+aone+"','"+atwo+"','"+athree+"','"+afour+"','"+afive+"','"+asix+"','"+aseven+"','"+rnine+"','"+rten+"','"+rele+"','"+rtwe+"','"+rone+"','"+rtwo+"','"+rthree+"','"+rfour+"','"+rfive+"','"+rsix+"','"+rseven+"')");
                if(i>0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('insertion successful');");
                out.println("location='dts.jsp';");
                out.println("</script>");
                
              }
              else{
                out.println("<script type=\"text/JavaScript\">");
                out.println("alert(\"Insertion faild\")");
                out.println("</script>");
                
              }
            }
            catch(ClassNotFoundException | SQLException e)
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DatePicker.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DatePicker.class.getName()).log(Level.SEVERE, null, ex);
        }
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
