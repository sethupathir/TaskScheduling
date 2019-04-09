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
<jsp:include page="techempheader.jsp"/>

<div id="content-wrapper">
    <div class="container-fluid">
        <div class="card mb-3">
            <div class="card-body">
                <div class="card-title">
                    <form action="DatePicker" >
                        
                        <input type="date" name="date" id="datepicker">

                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Name</th>                      
                                        <th>Attendance</th> 

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int totque = 0;
                                        try {
                                            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                            statement = connection.createStatement();
                                           
                                            String sql = "select * from addemp";

                                            resultSet = statement.executeQuery(sql);
                                            String uname = (String) session.getAttribute("eid");

                                            while (resultSet.next()) {
                                                String compareTo = resultSet.getString("eid");
                                                if (uname.equals(compareTo)) {

                                                    ++totque;
                                                    int qno = resultSet.getInt(1);
                                                    String qnos = Integer.toString(qno);
                                                    
                                                    %>

                                    <tr>
                                        <td><input type="text" name="<%=resultSet.getString("name")%>" value="<%=resultSet.getString("name")%>" class="form-control" readonly`/>
</td>

                                <div class="col-sm-7">
                                    <td><select name="attend" class="form-control">
                                            
                                            <option value="<%=qnos%>">Absent</option>
                                            <option value="<%=qnos%>">Present</option>
                                            
                                        </select></td>


                                </div>                  


                                </tr>
                                <%}
                                        }
                                        connection.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                                </tbody>
                            </table>
                            <td><input type="hidden" id="thisField" name="inputName" value="<%=totque%>"></td>
                            <td><input type="submit" value="Submit" class="btn btn-primary" ></td>
                    </form>
                </div>
            </div>
        </div>

    </div>
