<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String name = request.getParameter("uname");
    String password = request.getParameter("upass");
    session.setAttribute("eid", name);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
    PreparedStatement pst = con.prepareStatement("Select staffrole from addnewemp where empid = ? and password = ?  ");
    pst.setString(1, name);
    pst.setString(2, password);
    ResultSet rst = pst.executeQuery();
    if (rst.next()) {
        String type = rst.getString("staffrole");
        if ("Technical".equals(type)) {
            response.sendRedirect("view.jsp");
        } else if ("Non Technical".equals(type)) {
            response.sendRedirect("dts.jsp");
        } 

    }
    else {
            out.println("<script>");
            out.println("alert('Your User Name or Password Wrong')");
            out.println("location='index.jsp';");
            out.println("</script>");

        }


%> 
