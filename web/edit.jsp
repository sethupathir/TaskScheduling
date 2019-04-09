<jsp:include page="nontechempheader.jsp"/>
<%@page language="java"%>
<%@page import="java.sql.*"%>
    
     <div id="content-wrapper">

        <div class="container-fluid">
           <div class="card mb-3">
              <div class="card-body">
                 <form method="post" action="update.jsp">
                   <div class="table-responsive">
                       <table class="table table-borderless" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                              <%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
String query = "select * from dts where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);%>
                             
                          <style>
                      th {
  background-color: #00e5ff;
  color: white;
                      }
                      tr {
  background-color: #84c7c1;
  color: white;
}

  

                  </style>
                          
                  
                    
<%
while(rs.next()){
%>
                           <tr><td><%=rs.getString("date") %></th></td></tr>
                            <tr>
                                
                              <th><center><label> Time</label></center></th>
                              <th>Planned Activity</th>
                              <th>Achieved Activity</th>
                              <th>Remarks </th>
                           </tr>          
                                         
                          </thead>
                       <tr>
                           <th><center>9:30 to 10:30</center></th>
                           
                           <td class="font-weight-bold"><%=rs.getString("nine") %></td>
                      <td><input type="text" name="anine" class="form-control" value="<%=rs.getString("anine")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rnine" class="form-control" value="<%=rs.getString("rnine")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>10:30 to 11:30</center></th>      
                       <td class="font-weight-bold"><%=rs.getString("ten")%></td>
                       <td><input type="text" name="aten" class="form-control" value="<%=rs.getString("aten")%>" autocomplete="off"  required="true"></td>
                        <td><input type="text" name="rten" class="form-control" value="<%=rs.getString("rten")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>11:30 to 12:30</center></th>
                            <td class="font-weight-bold"><%=rs.getString("ele")%>
		      </td>
                      <td><input type="text" name="aele" class="form-control" value="<%=rs.getString("aele")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rele" class="form-control" value="<%=rs.getString("rele")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>12:30 to 1:30</center></th>
                           <td class="font-weight-bold"><%=rs.getString("twe")%>
		      </td>
                      <td><input type="text" name="atwe" class="form-control" value="<%=rs.getString("atwe")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rtwe" class="form-control" value="<%=rs.getString("rtwe")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>1:30 to 2:30</center></th>
                           <td class="font-weight-bold"><%=rs.getString("one")%>
		      </td>
                      <td><input type="text" name="aone"  class="form-control" value="<%=rs.getString("aone")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rone"  class="form-control" value="<%=rs.getString("rone")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>2:30 to 3:30</center></th>
                          <td class="font-weight-bold"><%=rs.getString("two")%>
		      </td>
                      <td><input type="text" name="atwo" class="form-control" value="<%=rs.getString("atwo")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rtwo" class="form-control" value="<%=rs.getString("rtwo")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>3:30 to 4:30</center></th>
                            <td class="font-weight-bold"><%=rs.getString("three")%>
		      </td>
                      <td><input type="text" name="athree"  class="form-control" value="<%=rs.getString("athree")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rthree"  class="form-control" value="<%=rs.getString("rthree")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>4:30 to 5:30</center></th>
                           <td class="font-weight-bold"><%=rs.getString("four")%>
		      </td>
                      <td><input type="text" name="afour"  class="form-control" value="<%=rs.getString("afour")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rfour"  class="form-control" value="<%=rs.getString("rfour")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>5:30 to 6:30</center></th>
                           <td class="font-weight-bold"><%=rs.getString("five")%>
		      </td>
                      <td><input type="text" name="afive"  class="form-control" value="<%=rs.getString("afive")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rfive"  class="form-control" value="<%=rs.getString("rfive")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center>6:30 to 7:30</center></th>
                            <td class="font-weight-bold"><%=rs.getString("six")%>
		      </td>
                      <td><input type="text" name="asix"  class="form-control" value="<%=rs.getString("asix")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rsix"  class="form-control" value="<%=rs.getString("rsix")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       <tr>
                           <th><center> 7:30 to 8:30</center></th>
                           <td class="font-weight-bold"><%=rs.getString("seven")%>
		      </td>
                      <td><input type="text" name="aseven"  class="form-control" value="<%=rs.getString("aseven")%>" autocomplete="off"  required="true"></td>
                      <td><input type="text" name="rseven"  class="form-control" value="<%=rs.getString("rseven")%>" autocomplete="off"  required="true"></td>
                       </tr>
                       
                           <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                     
                           

<%
}
}
catch(Exception e){}
%>

</table>
<input type="submit" name="Submit" value="Update" class="btn btn-primary">
                    </form>
             
          
          
        
       <div/>
          <div/>
            </div>
               </div>
    