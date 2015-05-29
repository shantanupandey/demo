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
								 
									var cityapp = angular.module('cityapp', []);
								
									cityapp
											.config( [
													'$httpProvider',
													function($httpProvider) {
														$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
													} ]);
								
									function addCityController($scope, $http) {
								
										$("div.leftpanelinner>ul>li#group").css("background", "#003366");
										$("div.leftpanelinner>ul>li#group>a").css("color", "white");
										$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
										$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
										$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
										$("div.leftpanelinner>ul>li#master>ul>li#city").addClass("active");
								
										$("#imageloader").css("display", "none");
										$("#complete").css("display", "block");
								var status=document.getElementById("status").value;
								if(status== 'Approved')
								{
								 	$("#approveStatus").css("display", "none");
								 }
										$scope.reset = function() {
										};
								
										$scope.saveData = function() {
											var countryname = $scope.country;
											var statename = document.getElementById("stateid").value;
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
														.post("savecity.master.htm?countryid=" + $scope.country
																+ "&stateid=" + statename + "&cityname="
																+ $scope.cityname + "&isactive="
																+ $scope.isactive);
												responsePromise
														.success(function(data, status, headers, config) {
															window.location.href = "city.master.htm";
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
														});
											}
										};
								
									}
									
									
function callState(id)
{
	$.get("statelist.ajaxresponse.htm?countryid=" + id, function(data, status) {
									document.getElementById("statelist").innerHTML = data;
								});
}			

					
function successFun(getData)
{
alert("hi"+getData);
var id=document.getElementById("approvalID").value;
var str=id.split("_");
var policyID=str[0];
var empID=str[1];


	if (getData == 'Approved') {
			if ($("#terms").is(':checked')) {

				$.get("approvedPolicy.htm?policyID=" + policyID + "&empID="
						+ empID + "&data=" + getData, function(data, status) {
					if (getData == 'Approved') {
						$('#successApprove').show();
						$('#successApprove').delay(1500).fadeOut('slow');
					}

					$('#successApprove').show();
					$('#successApprove').delay(1500).fadeOut('slow');
					$("#approveStatus").css("display", "none");

					$("#rejectStatus").css("display", "none");
				});

			} else {
				$('#acceptCondition').show();
				$('#acceptCondition').delay(1500).fadeOut('slow');
			}
		}
		if (getData == 'Rejected') {
			$.get("approvedPolicy.htm?policyID=" + policyID + "&empID=" + empID
					+ "&data=" + getData, function(data, status) {

				if (getData == 'Rejected') {
					$('#successReject').show();
					$('#successReject').delay(1500).fadeOut('slow');
				}
				$('#successApprove').show();
				$('#successApprove').delay(1500).fadeOut('slow');
				$("#approveStatus").css("display", "none");

				$("#rejectStatus").css("display", "none");
			});
		}

	}
</script>
  
  
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" style="color:black;">


<section>


		<div class="">
		

    <div class="pageheader">
      <h2>Policy Approval</h2>
      
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="" style="width:100%">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="cityapp" ng-controller="addCityController">
            <form ng-submit="saveData()">        
                           
            
              
              <div class="row">               
                <div class="col-sm-12">
                  <div class="form-group">
                    <h2> <c:out value="${title}"/></h2></br></br>
                    <span id="textdata">
                   		 <c:out value="${textdata}"/>
                    </span>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              </br></br>
             <div style="margin-bottom:-10px;width:700px ; height:150px;overflow:scroll;border:1px solid grey;padding:2px;">
	
				<%@include file="/WEB-INF/jsp/agreement.jsp"%>
	
			</div></br>
			 <input type="checkbox" name="terms" id="terms" >  I Agree Terms & 
			 Conditions
              		<input type="hidden" id="approvalID" name="approvalID" value="<c:out value="${param.ID}"/>"/>
              <input type="hidden" id="status" name="status" value="<c:out value="${status}"/>"/>
              
           
			</br>		</br>	
            <div class="panel-footer">
            <c:choose>
            		<c:when test="${status == 'Approved' || status == 'Rejected'}"></c:when>
            		<c:otherwise>
            		              <button class="btn btn-primary" type="submit" id="approveStatus" onclick="successFun('Approved');">Accept</button>
<!--            		              <button class="btn btn-primary" type="submit" id="rejectStatus" onclick="successFun('Rejected');">Reject</button>			  -->
            		</c:otherwise>
            </c:choose>
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
			         <span > Submit Successfully </span>
			 </div>
			
 <div  id="successApprove" class="success">
			         <span>Approved Successfully</span>
			 </div>
 <div  id="successReject" class="error2">
			         <span>Rejected Succussfully</span>
			 </div>

 <div  id="acceptCondition" class="error2">
			         <span>Please Agree with terms & Conditions</span>
			 </div>
</body>
</html>
