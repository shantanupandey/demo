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
  <link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
  <script>
 
															
										var cityapp = angular.module('cityapp', []);
									
										cityapp
												.config( [
														'$httpProvider',
														function($httpProvider) {
															$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
														} ]);
									
										function editCityController($scope, $http) {
											$("div.leftpanelinner>ul>li#group").css("background", "#003366");
											$("div.leftpanelinner>ul>li#group>a").css("color", "white");
											$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
											$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
											$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
											$("div.leftpanelinner>ul>li#master>ul>li#city").addClass("active");
									
											$("#imageloader").css("display", "none");
											$("#complete").css("display", "block");
											$scope.reset = function() {
											$scope.cityname="";											
											$scope.country = '';
											$scope.stateid = '';
											
											};
									
											$scope.saveData = function() {
									
												var countryname = $scope.country;
												var statename = $scope.stateid;												
												var city = $scope.cityname;
												
									
												if (countryname == '' || countryname == undefined) {
													$('#cAlert').show();
													$('#cAlert').delay(1500).fadeOut('slow');
									
												} else if (statename == '' || statename == undefined) {
									
													$('#sAlert').show();
													$('#sAlert').delay(1500).fadeOut('slow');
												} else if (city == '' || city == undefined) {
													$('#ciAlert').show();
													$('#ciAlert').delay(1500).fadeOut('slow');
												}
									
												else {
									
													var responsePromise = $http
															.post("updatecity.master.htm?countryid="
																	+ $scope.country + "&stateid=" + statename
																	+ "&cityid=" + $scope.cityid + "&cityname="
																	+ $scope.cityname + "&isactive="
																	+ $scope.isactive);
									
													responsePromise
															.success(function(data, status, headers, config) {
																$('#submitSucess').show();
																$('#submitSucess').delay(1500).fadeOut('slow');
																window.location.href = "city.master.htm";
															});
												}
											}
									
										}
										
																			function callState(id)
{

	$.get("statelist.ajaxresponse.htm?countryid=" + id, function(data, status) {
									document.getElementById("statelist").innerHTML = data;
								});
}
</script>
  
  
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


&lt;<section>

<%@include file="leftpanel.jsp" %>

  <div class="mainpanel">
     <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2>Edit City</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">Edit City</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="cityapp" ng-controller="editCityController">
            <form ng-submit="saveData()">        
             
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Country<font color="red">*</font></label>
                    <select class="form-control" ng-model="country" ng-init='country="<c:out value="${CountryID}"/>"' onchange="callState(this.value)" id="country">
                    <option value="">-- Select Country --</option>
                    	<c:forEach var="list" items="${countryList}">
                    	

                    			<option value="<c:out value="${list.CountryID}"/>"><c:out value="${list.CountryName}"/>
                    			</option>

                    		
                    	</c:forEach>
                    </select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">State<font color="red">*</font></label>
                    
                    <span id="statelist">
                    <select class="form-control" ng-model="stateid" ng-init='stateid="<c:out value="${StateID}"/>"'>
                    <option value="">-- Select State --</option>
                    	<c:forEach var="list" items="${stateList}">
                    	
                    			<option value="<c:out value="${list.StateID}"/>"><c:out value="${list.StateName}"/></option>
                    	                    		
                    	</c:forEach>
                    </select>
                    </span>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
            
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">City Name<font color="red">*</font></label>
                    <input type="hidden" name="cityid" class="form-control" ng-model="cityid" ng-init='cityid = "<c:out value="${CityID}"/>"'>
                    <input type="text" name="cityname" class="form-control" ng-model="cityname"  ng-init='cityname = "<c:out value="${CityName}"/>"' maxlength="250">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row" style="display:none">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>
                    <input type="checkbox" name="isactive" ng-model="isactive" ng-checked="<c:out value="${IsActive}"/>"  ng-init='isactive = "<c:out value="${IsActive}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
				</br>		
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit">Submit</button>
              <a href="city.master.htm"><button class="btn btn-primary" type="button">Cancel</button></a>
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

	<div id="submitSucess" class="success">
			         <span > Successfully Updated </span>
			 </div>
			 <div  id="cAlert" class="error2">
			         <span > Select Country</span>
			 </div>
			  <div  id="sAlert" class="error2">
			         <span > Select State</span>
			 </div>
			 
			  <div  id="ciAlert" class="error2">
			         <span > Select City</span>
			 </div>


</body>
</html>
