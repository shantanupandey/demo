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
  
  <script>
 
	var companyapp = angular.module('companyapp', []);
	
	companyapp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
	}]);
	
	function addCompanyController($scope, $http) {
$("div.leftpanelinner>ul>li#group").css("background","#003366");
    			$("div.leftpanelinner>ul>li#group>a").css("color","white");
    		    $("div.leftpanelinner>ul>li#group>a>span").css("color","white");
			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#company").addClass("active");

 	  $("#imageloader").css("display", "none");
      $("#complete").css("display", "block");
		$scope.reset = function() {
		};
				
 		   $scope.saveData = function() { 		    		 	    		 			 		   	
 					var responsePromise = $http.post("savecompany.org.htm?cname="+$scope.companyname+"&no="+$scope.num+"&isactive="+$scope.isactive);
                	responsePromise.success(function(data, status, headers, config) {
                    window.location.href = "company.org.htm";
                });
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
      <h2>Add Company</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">Add Company</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="companyapp" ng-controller="addCompanyController">
            <form ng-submit="saveData()">        
             
              
                            
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Company Name</label>
                    <input type="text" name="companyname" class="form-control" ng-model="companyname" required="required">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                             
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">No Of Employees</label>
                    <input type="text" name="num" class="form-control" ng-model="num" required="required">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
              
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>
                            <input type="checkbox" name="isactive" ng-model="isactive"  ng-init='isactive = 0' ng-checked="0"> 
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
              <a href="company.org.htm"><button class="btn btn-primary" type="button">Cancel</button></a>
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




</body>
</html>
