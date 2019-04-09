<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mydb";
String userid = "root";
String password = "";
String a="1";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String string = String.format("SELECT * FROM staffrole ");
String Query = string;
PreparedStatement ps = connection.prepareStatement(Query);
ResultSet rs = ps.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData();

resultSet=rs;



%>
<jsp:include page="adminheader.jsp"/>    
     <div id="content-wrapper">

        <div class="container-fluid">
<section class="dashboard-counts no-padding-bottom">
        <div class="container-fluid">
            <div class="bg-white has-shadow">
                
                    
         
<form class="form-horizontal" action="drop.jsp" method="post" >
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Employee Id
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="empid"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Name
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="name"  required="true">
                        </div>
                    </div>
                    
                         <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Email
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="email"  required="true">
                        </div>
                    </div>
                         <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Phno
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="phno"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Blood Group
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="bloodgroup"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Address
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="address"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label" > Date Of Birth
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="date" id="datepicker1" class="form-control" placeholder="YYYY-MM-DD" autocomplete="off"  
                                name="dob"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Date Of Joining
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="date" id="datepicker1" class="form-control" placeholder="YYYY-MM-DD" autocomplete="off"  
                                name="doj"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Password
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="password"  required="true">
                        </div>
                    </div>
                    <div class="form-group row">                    
                        <label class="col-sm-2 col-form-label"> Staff Role
                            <span style="color:red">*</span>
                        </label>
                        <div>
                            
                    <table>
                        <tbody>
                            <tr>
                               <td><div class="col-sm-7">
                                       <td><select name="staffrole" class="form-control">
                                    <%  while(resultSet.next()){ %>
                <option><%= resultSet.getString(2)%></option>
          <% } %>
                                           </select></td>
                                           
                                
                                   </div></td>                   
                            </tr>
                           </tbody>
                    </table>
                                           <%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                            
                            <div class="col-sm-2 col-form-label">
                            <input type="submit" class="btn btn-primary" value="Add Employee" name="adduser">
                        </div>
                        
                        <style>
                           .button {
  background-color: #008CBA; /* Green */
  border: none;
  color: white;
  padding: 10px 27px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
                        </style>
                 </form>
            </div>
        </div>
    </section>

      </div>
      <!-- /.content-wrapper -->

    </div>
          
   