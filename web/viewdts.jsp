<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("emp_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mydb";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<jsp:include page="nontechempheader.jsp"/>
      <script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
</script>
      
     <div id="content-wrapper">

        <div class="container-fluid">
           <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Dts View</div>
            <div class="card-body">
                <form name="form" method="post">
              <div class="table-responsive">
                <table id="dtHorizontalExample" class="table table-striped table-bordered table-sm"  cellspacing="0" width="100%">
                  <thead>
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
                      <th><center>Action</center></th>
                      
                      
                    </tr>
                    
                  </thead>
                  
                  <tbody>
                      
                       
                    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dts";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
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
<tr>
    <th id="orange"><%=resultSet.getString("date") %></th>
</tr>
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
<td><input type="submit" class="btn btn-primary" value="Update" onclick="editRecord(<%=resultSet.getString("id")%>);" ></td>


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
                      
                  <td></td>
<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>

<div >
       