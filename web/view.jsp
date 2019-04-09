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
<!DOCTYPE html>
<html lang="en">
    

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
   <link type="text/css" rel="stylesheet" href="css/button.css"  media="screen,projection"/>

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="css/font-awesome.min.css"  media="screen,projection"/>

 <link rel="stylesheet" href="css/pop.css" >
    

  </head>
  

  <body>

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="admin/welcome.jsp">Employee</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
      </button>

     <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <% if(session.getAttribute("eid") != null) { %>
    <a class="navbar-brand mr-1" href="profile"> Welcome, <%= session.getAttribute("eid")%></a><br />
<%} else {%>
    Guest<br/> 
<% } %>
     
<% if(session.getAttribute("eid") != null) { %>
            </a>
                </div>
            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">


                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                     
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
<% } else { %>
    <a href="index.jsp"></a> 
    
<% } %>
                    </li>
      </ul>

    </nav>

     <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="welcome.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="view.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Add Student</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="attendance.jsp">
                        <i class="fas fa-fw fa-clipboard"></i>
                        <span>Attendance</span></a>
                

            </ul>
         
      <div id="content-wrapper">

        <div class="container-fluid">

         

           <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Student Table</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Name</th>                      
                      <th>Email</th>                      
                      <th>Date Of Birth</th>
                      <th>Date Of Joining</th>
                      <th>college</th>
                      <th>course</th>
                      <th>Duration</th>
                      
                    </tr>
                  </thead>
                  
                  <tbody>
                    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from addemp";
resultSet = statement.executeQuery(sql);
int i=0;
String uname = (String)session.getAttribute("eid");
        
while(resultSet.next()){
String compareTo = resultSet.getString("eid");
        if(uname.equals(compareTo )){
           
        
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("doj") %></td>
<td><%=resultSet.getString("college") %></td>
<td><%=resultSet.getString("course") %></td>
<td><%=resultSet.getString("duration") %></td>

</tr>
<%
}
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
    
 <button id="myBtn" class="btm" onclick="openForm()">
            <a>
              <i class="fa fa-plus"></i>
            </a></button>
 <div id="myModal" class="modall">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close text-right">&times;</span>
  
  <form  action="Add" method="post">
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
                        <label class="col-sm-2 col-form-label"> College
                            <span style="color:red">*</span>
                        </label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" autocomplete="off"  
                                name="college"  required="true">
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
                        <label class="col-sm-2 col-form-label"> Course
                            <span style="color:red">*</span>
                        </label>
                        <div>
                    <table>
                        <tbody>
                            <tr>
                               <td><div class="col-sm-7">
                                       <td><select name="course">
                                    <option value="">Choose</option>
                                    <option value="JAVA">JAVA</option>
                                    <option value="PHP">PHP</option>
                                    <option value="PYTHON">PYTHON</option>
                                    <option value="JAVA SCRIPT">JAVA SCRIPT</option>
                                           </select></td>
                                           <td><label class="col-sm-4 form-control-label"> Duration
                                                   <td><span style="color:red">*</span></td>
                                       </label></td>
                                <td><input type="text" class="form-control" autocomplete="off"  
                                            name="duration"  placeholder="days" required="true"></td>
                                   </div></td> 
                                   <input type="hidden" name="datee">
                                   <input type="hidden" name="attend">
                            </tr>
                    </tbody>
                    </table>
                            <table>
                            <div class="col-sm-2 col-form-label">
                                
                                <td><input type="submit" class="btn btn-outline-primary" value="Add" name="adduser"></td>
                                
                        </div>
                            </table>
                        
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

</div>
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>


     
        </div>
<a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="index.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
     
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

  </body>

</html>
