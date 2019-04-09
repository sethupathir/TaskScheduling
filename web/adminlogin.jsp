<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>
    <link href="vendor/bootstrap/css/log.css" rel="stylesheet" type="text/css">
<link href="vendor/bootstrap/js/bootstrap.js" rel="stylesheet" type="text/css">
<link href="vendor/bootstrap/css/bootstrap_1.css" rel="stylesheet" type="text/css">


    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

   

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
       <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <a class="navbar-brand mr-1" href="/tech/index.jsp">Employee</a>
                </div>
            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    
                     </li>
      </ul>

    </nav>
      <div class="container">
	<div class="login-container">
            <div class="box"></div>
            <div id="output"></div>
            
            <img class="rounded-circle profile-img-card" src="nit.jpg" />
           
            <div class="form-box">
                <form action="Adminlogin" method="post">
                    <input type="text" name="uname" placeholder="username"><br></br>
                    <input type="password" name="upass" placeholder="password"><br></br>
                    <button class="btn btn-info btn-block login" type="submit" name="login" value="login">Login</button>
                   

                </form>
            </div>
        </div>
        
</div>

 
  </body>

</html>
