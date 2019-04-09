<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String date = request.getParameter("date");

if (date != null && date.length() > 0) {
  session.setAttribute("dateget", date);
}
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
<jsp:include page="adminheader.jsp"/>    
     <div id="content-wrapper">

        <div class="container-fluid ">
            <div class="card mb-3">
                <div class="card-header">
                    <table>
                <body>
                   
                    
                   
                <form>
                    <td></input> <input type="date" name="date" id="datepicker1" class="form-control"></td><td></td>
                <td><input type="submit" class="btn btn-success form-control" value="View"></td><td></td><td></td>
                    
                     </body>
                    </table>  </div>  </div>
                    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String string = String.format("SELECT * FROM dts");
String Query = string;
PreparedStatement ps = connection.prepareStatement(Query);
ResultSet rs = ps.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData();
int i=0;
resultSet=rs;

while(resultSet.next()){
    i+=1;
if(resultSet.getString("date").equals(date)){
%>

 <table id="dtHorizontalExample" class="table table-striped table-bordered table-sm"  cellspacing="0" width="100%">
<thead>
                   <th id="orange"><%=rs.getString("date") %></th>
                    <tr>
                      <th>Time</th>                      
                      <th>9:30 to 10:30</th>
                      <th>10:30 to 11:30</th>
                      <th>11:30 to 12:30</th>
                      <th><center>12:30 to 1:30</center></th>
                      <th><center>1:30 to 2:30</center></th>
                      <th><center>2:30 to 3:30</center></th>
                      <th><center>3:30 to 4:30</center></th>
                      <th><center>4:30 to 5:30</center></th>
                      <th><center>5:30 to 6:30</center></th>
                      <th><center>6:30 to 7:30</center></th>
                      <th><center>7:30 to 8:30</center></th>
                     </tr>
                    </thead>
 <tbody>

                  <style>
                      
                      th {
  background-color: #4CAF50;
  color: white;
                      }
  #orange
	{
		background-color: orange;
	}

                  </style>
                  <script>
                    
                      </script>
                      
    
<tr>
  
    
    <th>Planned Activity</th>
<td><%=resultSet.getString("nine") %></td>
<td><%=resultSet.getString("ten") %></td>
<td><%=resultSet.getString("ele") %></td>
<td><%=resultSet.getString("twe") %></td>
<td><%=resultSet.getString("one") %></td>
<td><%=resultSet.getString("two") %></td>
<td><%=resultSet.getString("three") %></td>
<td><%=resultSet.getString("four") %></td>
<td><%=resultSet.getString("five") %></td>
<td><%=resultSet.getString("six") %></td>
<td><%=resultSet.getString("seven") %></td>


</tr>
<tr>
    <th>Achieved Activity</th>
<td><%=resultSet.getString("anine") %></td>
<td><%=resultSet.getString("aten") %></td>
<td><%=resultSet.getString("aele") %></td>
<td><%=resultSet.getString("atwe") %></td>
<td><%=resultSet.getString("aone") %></td>
<td><%=resultSet.getString("atwo") %></td>
<td><%=resultSet.getString("athree") %></td>
<td><%=resultSet.getString("afour") %></td>
<td><%=resultSet.getString("afive") %></td>
<td><%=resultSet.getString("asix") %></td>
<td><%=resultSet.getString("aseven") %></td>

</tr>
<tr>
    <th>Remarks</th>
    <td><%=resultSet.getString("rnine") %></td>
    <td><%=resultSet.getString("rten") %></td>
<td><%=resultSet.getString("rele") %></td>
<td><%=resultSet.getString("rtwe") %></td>
<td><%=resultSet.getString("rone") %></td>
<td><%=resultSet.getString("rtwo") %></td>
<td><%=resultSet.getString("rthree") %></td>
<td><%=resultSet.getString("rfour") %></td>
<td><%=resultSet.getString("rfive") %></td>
<td><%=resultSet.getString("rsix") %></td>
<td><%=resultSet.getString("rseven") %></td>
                </tr>
                </tbody>
                  
                </table>
                      
                  
                                        </form>
                   <form action="excel.jsp">
                       
                      <td><input type="submit" class="btn btn-primary"  value="Export" ></td>
                   </form>
                 
<%
   
}
}
if(i==0){
%>
<!--<p>There is no data in db </p>-->

<%}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 
    </div>
          
    
    