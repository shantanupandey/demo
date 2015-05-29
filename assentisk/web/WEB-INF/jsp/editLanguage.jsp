<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
 
	var languageChangeApp = angular.module('languageChangeApp', []);
	
	languageChangeApp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form; charset=UTF-8';
	
	}]);
	
	function changeValueController($scope, $http) {
					
	
	 	$("#imageloader").css("display", "none");
         $("#complete").css("display", "block");

		$scope.reset = function() {
		};
				
 		   $scope.saveData = function() {
 		 
			var launguageValue = $scope.launguageValue;
			var languagekey = $scope.languagekey;
		

			if (launguageValue == '' || launguageValue == undefined) {
				$('#divBlankAlert').show();
				$('#divBlankAlert').delay(1500).fadeOut('slow');

			}  

			else {
				var responsePromise = $http
						.post("savelanguagekey.org.htm?languagekey="
								+ $scope.languagekey+"&launguageValue="+launguageValue);
				responsePromise
						.success(function(data, status, headers, config) {
								$('#divSuccessAlert').show();
				                $('#divSuccessAlert').delay(1500).fadeOut('slow');
				                
				                window.location.href = "resource.org.htm";
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
      <h2>Resource</h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">Resource</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="languageChangeApp" ng-controller="changeValueController">
            <form ng-submit="saveData()">        
             
              
                 <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Value</label> <font color="red">*</font>
                    <input type="text" name="launguageValue" class="form-control" ng-model="launguageValue" 
                    ng-init='launguageValue = "<c:out value="${launguageValue}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
           
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    
                    <input type="hidden" name="languagekey" class="form-control"
													ng-model="languagekey"  ng-init='languagekey = "<c:out value="${languagekey}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->
              </div>
              
           
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit">Submit</button> 
              <a href="resource.org.htm"><button class="btn btn-primary" type="button">Cancel</button></a>
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

<div  id="divBlankAlert" class="error2">
         <span >Enter Value</span>
 </div>
 
 <div  id="divSuccessAlert" class="success">
         <span >Submit Succesfully</span>
 </div>
 
 


</body>
</html>
