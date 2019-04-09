<%@page import="java.sql.*"%>
   <%@page import="java.sql.SQLException"%>
  <%@page import="  java.io.*"%>  

   <%
String id = request.getParameter("id");
String date = (String)session.getAttribute("dateget");
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
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "attachment; filename=excel.xls");
Connection connection = null;
PreparedStatement ps=null;
ResultSet  rs   = null;
%>    
    
       <%
         String date1=""; 
         String nine= "";
         String ten= "";
         String ele= "";
         String twe= "";
         String one= "";
         String two= "";
         String three= "";
         String four= "";
         String five= "";
         String six= "";
         String seven= "";
         String anine= "";
         String aten= "";
         String aele= "";
         String atwe= "";
         String aone= "";
         String atwo= "";
         String athree= "";
         String afour= "";
         String afive= "";
         String asix= "";
         String aseven= "";
         String rnine= "";
         String rten= "";
         String rele= "";
         String rtwe= "";
         String rone= "";
         String rtwo= "";
         String rthree= "";
         String rfour= "";
         String rfive= "";
         String rsix= "";
         String rseven= "";

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String string = String.format("SELECT * FROM dts");
String Query = string;
 ps = connection.prepareStatement(Query);
 rs = ps.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData();
int i=0;
        while(rs.next()){
            if(rs.getString("date").equals(date)){
            date1=rs.getString("date");
            nine=rs.getString("nine");
            ten=rs.getString("ten");
            ele=rs.getString("ele");
            twe=rs.getString("twe");
            one=rs.getString("one");
            two=rs.getString("two");
            three=rs.getString("three");
            four=rs.getString("four");
            five=rs.getString("five");
            six=rs.getString("six");
            seven=rs.getString("seven");
            anine=rs.getString("anine");
            aten=rs.getString("aten");
            aele=rs.getString("aele");
            atwe=rs.getString("atwe");
            aone=rs.getString("aone");
            atwo=rs.getString("atwo");
            athree=rs.getString("athree");
            afour=rs.getString("afour");
            afive=rs.getString("afive");
            asix=rs.getString("asix");
            aseven=rs.getString("aseven");
            rnine=rs.getString("rnine");
            rten=rs.getString("rten");
            rele=rs.getString("rele");
            rtwe=rs.getString("rtwe");
            rone=rs.getString("rone");
            rtwo=rs.getString("rtwo");
            rthree=rs.getString("rthree");
            rfour=rs.getString("rfour");
            rfive=rs.getString("rfive");
            rsix=rs.getString("rsix");
            rseven=rs.getString("rseven");
            %>
          
            <table>
        <tr> <th width="30%;"><%=date1%></th>
            <th width="30%;">Planned Activity</th>
            <th width="30%;">Achieved Activity</th>
            <th width="30%;">Remarks</th>
            
        </tr>
        <tr><th width="30%;">9:30 to 10:30</th>
            <td><%=nine%></td>
            <td><%=anine%></td>
            <td><%=rnine%></td>
        </tr>
        <tr> 
            <th width="30%;">10:30 to 11:30</th>
            <td><%=ten%></td>
            <td><%=aten%></td>
            <td><%=rten%></td>
        </tr>
        <tr>   
            <th width="30%;">11:30 to 12:30</th>
            <td><%=ele%></td>
            <td><%=aele%></td>
            <td><%=rele%></td>
        </tr>
        <tr>   
            <th width="30%;">12:30 to 1:30</th>
            <td><%=twe%></td>
            <td><%=atwe%></td>
            <td><%=rtwe%></td>
        </tr>
        <tr>    
            <th width="30%;">1:30 to 2:30 </th>
            <td><%=one%></td>
            <td><%=aone%></td>
            <td><%=rone%></td>
        </tr>
        <tr>   
            <th width="30%;">2:30 to 3:30</th>
            <td><%=two%></td>
            <td><%=atwo%></td>
            <td><%=rtwo%></td>
        </tr>
        <tr>   
            <th width="30%;">3:30 to 4:30</th>
            <td><%=three%></td>
            <td><%=athree%></td>
            <td><%=rthree%></td>
        </tr>
        <tr>   
            <th width="30%;">4:30 to 5:30</th>
            <td><%=four%></td>
            <td><%=afour%></td>
            <td><%=rfour%></td>
        </tr>
        <tr>   
            <th width="30%;">5:30 to 6:30</th>
            <td><%=five%></td>
            <td><%=afive%></td>
            <td><%=rfive%></td>
        </tr>
        <tr>   
            <th width="30%;">6:30 to 7:30</th>
            <td><%=six%></td>
            <td><%=asix%></td>
            <td><%=rsix%></td>
        </tr>
        <tr>   
            <th width="30%;">7:30 to 8:30</th>
            <td><%=seven%></td>
            <td><%=aseven%></td>
            <td><%=rseven%></td>
        </tr>
            
            <%}%>
         </table>
           <%
            }}catch(Exception e){
                    out.println(e);
               }
                finally {
                    if (rs!= null){ rs.close(); rs=null;}
                    if(ps!=null){ps.close();ps=null;}
                    if (connection != null) {connection.close();connection = null;}
            }
           %>