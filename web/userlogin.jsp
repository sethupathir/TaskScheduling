<%-- 
    Document   : userlogin
    Created on : 7 Jan, 2019, 11:05:43 AM
    Author     : sethu_joy
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
<form method="post" class="searchform" action="#"> 
<table class="pretty-table"> 
<tr><td>User role</td><td><input type="text" name="uname" class="textbox" /></td></tr> 

<tr><td>Password</td><td><input type="password" name="upass" class="textbox" /></td></tr> 
<tr><td><input name="btnLogin" type="submit" value="Login" class="button"/></td><td><input name="btnCancel" type="reset" value="Cancel" class="button"/></td></tr> 

</table> 
</form> 
    <body/>
    <html/>

<% 
String uname=request.getParameter("uname"); 
String password=request.getParameter("upass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
PreparedStatement pst=con.prepareStatement("Select userrole from user where uname = ? and upass = ? "); 
pst.setString(1,uname); 
pst.setString(2,password); 
ResultSet rst=pst.executeQuery(); 
if(rst.next()) 
{ 
String type=rst.getString("userrole"); 
if("admin".equals(type)) 
{ 
response.sendRedirect("http://localhost:8080/tech/admin/welcome.jsp"); 
} 
else if("user".equals(type)) 
{ 
response.sendRedirect("index.jsp"); 
} 

} 


%> 
