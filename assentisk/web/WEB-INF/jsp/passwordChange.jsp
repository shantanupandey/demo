<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">
  <script src="js/angular.min.js"></script>
  
 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
 <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

  <script>
 
	var passwordChangeApp = angular.module('passwordChangeApp', []);
	
	passwordChangeApp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form; charset=UTF-8';
	
	}]);
	
	function addPasswordController($scope, $http) {
			
			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#company").addClass("active");
	
	 	$("#imageloader").css("display", "none");
         $("#complete").css("display", "block");

		$scope.reset = function() {
		};
				
 		   $scope.saveData = function() {
 		 
			var empPassword = $scope.empPassword;
			var oldPassword = $scope.oldPassword;
			var newPassword = $scope.newPassword;
			var retypePassword =$scope.retypePassword;

			if (oldPassword == '' || oldPassword == undefined) {
				$('#divOldAlert').show();
				$('#divOldAlert').delay(1500).fadeOut('slow');

			}  else if (newPassword == '' || newPassword == undefined) {
				$('#divNewAlert').show();
				$('#divNewAlert').delay(1500).fadeOut('slow');

			}else if (retypePassword == '' || retypePassword == undefined) {
				$('#divretypeAlert').show();
				$('#divretypeAlert').delay(1500).fadeOut('slow');

			}else if (newPassword!=retypePassword) {
				$('#divFalsePwdAlert').show();
				$('#divFalsePwdAlert').delay(1500).fadeOut('slow');

			}else if (oldPassword!=empPassword) {
				$('#divErrorPwdAlert').show();
				$('#divErrorPwdAlert').delay(1500).fadeOut('slow');

			}

			else {
				var responsePromise = $http
						.post("savePassword.org.htm?newPassword="
								+ $scope.retypePassword);
				responsePromise
						.success(function(data, status, headers, config) {
						
								$('#divSuccessAlert').show();
				                $('#divSuccessAlert').delay(1500).fadeOut('slow');
				                window.location.href = "companyview.org.htm";
						});

			}
		};
	

	}
</script>


  
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="leftpanel.jsp" %>

  <div class="mainpanel">
     <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2>Change Password</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">Change Password</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="passwordChangeApp" ng-controller="addPasswordController">
            <form ng-submit="saveData()">        
             
              
                 <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Old Password</label> <font color="red">*</font>
                    <input type="password" name="oldPassword" class="form-control" ng-model="oldPassword">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">New Password</label> <font color="red">*</font>
                    <input type="password" name="newPassword" class="form-control" ng-model="newPassword" >
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Retype New Password</label> <font color="red">*</font>
                    <input type="password" name="retypePassword" class="form-control" ng-model="retypePassword" >
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                 
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    
                    <input type="hidden" name="empPassword" class="form-control"
													ng-model="empPassword"  ng-init='empPassword = "<c:out value="${EmpPassword}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->
              </div>
              
           
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit">Submit</button> 
              <a href="companyview.org.htm"><button class="btn btn-primary" type="button">Cancel</button></a>
			  <button type="reset" class="btn btn-default" ng-click="reset()">Reset</button>
			  
            </div>            
            </form>
          </div>
        </div>
        
      </div>

      

      

    </div><!-- contentpanel -->

  </div><!-- mainpanel -->

  </div>

</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.custom.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/left-menu.js"></script>

<div  id="divOldAlert" class="error2">
         <span >Enter Old Password</span>
 </div>
 <div  id="divNewAlert" class="error2">
         <span >Enter New Password</span>
 </div>
 <div  id="divretypeAlert" class="error2">
         <span >Enter Retype Password Password</span>
 </div>
 <div  id="divFalsePwdAlert" class="error2">
         <span >New Password And Retype Password Doesn't Match</span>
 </div>
 <div  id="divErrorPwdAlert" class="error2">
         <span >Old Password is Incorrect</span>
 </div>
 <div  id="divSuccessAlert" class="success">
         <span >Your Password Has Been Saved Succesfully</span>
 </div>
 

</body>
</html>
