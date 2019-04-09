<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
        String empid=request.getParameter("empid");
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phno=request.getParameter("phno");
        String bloodgroup=request.getParameter("bloodgroup");
        String address=request.getParameter("address");
        String dob=request.getParameter("dob");
        String doj=request.getParameter("doj");
        String password=request.getParameter("password");
        String eid=request.getParameter("staffrole");
      
        
int s1=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
Statement st=conn.createStatement();

int i = st.executeUpdate("INSERT INTO addnewemp (empid,name,email,phno,bloodgroup,address,dob,doj,password,staffrole)VALUES('"+empid+"','"+name+"','"+email+"','"+phno+"','"+bloodgroup+"','"+address+"','"+dob+"','"+doj+"','"+password+"','"+eid+"')");
              if(i>0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('insertion successful');");
                out.println("location='addemp.jsp';");
                out.println("</script>");
                session.setAttribute("emp1", name);
              }
              else{
                out.println("<script type=\"text/JavaScript\">");
                out.println("alert(\"Insertion faild\")");
                out.println("</script>");
                
              }
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>