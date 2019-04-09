<jsp:include page="nontechempheader.jsp"/>
<button type="button" class="btn btn-success form-control" data-toggle="collapse" data-target="#g1">Change password</button>
<div class="collapse" id="g1"> 
    <br />											                      
    <form  action="Changepwd" method="post" id="loginform" class="form-horizontal" role="form">


        <div class="form-group" style="text-align=center;">                           
            <div style="margin-bottom: 25px" class="input-group">
                <div class="col-sm-2">	                                       
                    <span class="input-group-addon" ><i class="glyphicon glyphicon-lock"></i></span>
                </div>
                <div class="col-sm-10">	                                       
                    <input id="old-password" type="password" class="form-control" name="oldpwd" placeholder="Old password" required>
                </div>   
            </div>
        </div>  
        <div class="form-group" style="text-align=center;">                           
            <div style="margin-bottom: 25px" class="input-group">
                <div class="col-sm-2">	                                       
                    <span class="input-group-addon" ><i class="glyphicon glyphicon-lock"></i></span>
                </div>
                <div class="col-sm-10">	                                       
                    <input id="new-password" type="password" class="form-control" name="newpwd" placeholder="New password" required>
                </div>   
            </div>
        </div>                                                                  
        <button type="submit" id="btn-login"  class="btn btn-success">Submit </button>

    </form>			
</div>    
