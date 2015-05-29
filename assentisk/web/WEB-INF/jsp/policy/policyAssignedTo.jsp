<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="images/favicon.ico">

		<title>Assentisk</title>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
 			<script src="js/docx.js"></script>
		<script src="js/jszip.min.js"></script>

		
		<link href="css/custom.css" rel="stylesheet">
		<script src="js/angular.min.js"></script>
	
	    <link rel="stylesheet" href="css/jquery-ui.css">
 		
		
 		<style>
#description {
	width: 400px;
}

.description_text {
border: 1px solid lightgrey;
	color: black;
	margin-bottom: 10px;
	margin-top: 8px;
	padding-bottom: 2px;
	padding-right: 2px;
	padding-top: 2px;
	
	border-radius: 3px;
	box-shadow: none;
	font-size: 13px;
	height: auto;
	padding: 10px;
	width:  505px;;
}
.description_text_loc{
border: 1px solid lightgrey;
	color: black;
	margin-bottom: 10px;
	margin-top: 8px;
	padding-bottom: 2px;
	padding-right: 2px;
	padding-top: 2px;
	
	border-radius: 3px;
	box-shadow: none;
	font-size: 13px;
	height: auto;
	padding: 10px;
	width:  505px;;
}
.description_text_group{
border: 1px solid lightgrey;
	color: black;
	margin-bottom: 10px;
	margin-top: 8px;
	padding-bottom: 2px;
	padding-right: 2px;
	padding-top: 2px;
	
	border-radius: 3px;
	box-shadow: none;
	font-size: 13px;
	height: auto;
	padding: 10px;
	width:  505px;;
}
.description_text_dep{
border: 1px solid lightgrey;
	color: black;
	margin-bottom: 10px;
	margin-top: 8px;
	padding-bottom: 2px;
	padding-right: 2px;
	padding-top: 2px;
	
	border-radius: 3px;
	box-shadow: none;
	font-size: 13px;
	height: auto;
	padding: 10px;
	width:  505px;;
}
.append_data {
	white-space: pre-wrap; /* CSS3 */
	white-space: -moz-pre-wrap; /* Firefox */
	white-space: -pre-wrap; /* Opera <7 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-word; /* IE */
}
.append_data_loc {
	white-space: pre-wrap; /* CSS3 */
	white-space: -moz-pre-wrap; /* Firefox */
	white-space: -pre-wrap; /* Opera <7 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-word; /* IE */
}
.aclass {
	
}

.add_more {
	font-size: 25px;
}
.add_more_loc {
	font-size: 25px;
}
.imgplus {
	-moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: lightgrey lightgrey lightgrey -moz-use-text-color;
    border-image: none;
    border-radius: 2px;
    border-style: solid solid solid none;
    border-width: 1px 1px 1px medium;
    height: 40px;
    margin-top: 28px;
    padding: 4px;
    width: 27px;
}
.append_data_table{width:100%;}
    #containerdata img {
      max-width: 100%;
    
</style>


<script type="text/javascript">
 
</script>

<script type="text/javascript">
$(document).ready(function(){ 
							$("div.leftpanelinner>ul>li#policy").css("background","#012345");

					$("#imageloader").css("display", "none");
    					  $("#complete").css("display", "block");
    					  
    					  
  });  					  
function approvedPolicy(data){

var policyID =document.getElementById("policyID").value;
var status=data;
$.get("approvedPolicyAssigned.assess.htm?policyID=" + policyID +"&status="+status, function(data, status) {
  					
							 
							 
							
							 
							 
					});	
						if(status == "Approved"){
							 $('#successofapprover').show();
							 $('#successofapprover').delay(1500).fadeOut('slow');
							 
						}
						else if(status == "Rejected")	 
						{
							 $('#rejectofapprover').show();
							 $('#rejectofapprover').delay(1500).fadeOut('slow');
						}
						 $("#approveStatus").css("display", "none");
							 $("#rejectStatus").css("display", "none");
}
</script>
</head>


<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" style="color:black;">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.PolicyShow}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.PolicyShow}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" >
							
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${title}"/>
												</label>
												</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									
									
								
									
									
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												
												<c:out value="${textdata}"/>		
												<input type="hidden" name="policyID" id="policyID" class="form-control" value="<c:out value="${policyno}"/>"/>
														
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
								
								
										<!-- col-sm-6 -->
								
									</br></br>
									<!-- row -->
									<div class="panel-footer">
									
									<c:choose>
											<c:when test="${status== 'Approved' }">
											
											</c:when>
											<c:when test="${status== 'Rejected' }">
											
											</c:when>
											<c:otherwise>
												<button class="btn btn-primary" type="button" id="approveStatus" onclick="approvedPolicy('Approved');" title="<c:out value="${sessionScope.approve}"/>">
														<c:out value="${sessionScope.approve}"/>
												</button>
												<button class="btn btn-primary" type="button" id="rejectStatus" onclick="approvedPolicy('Rejected');" title="<c:out value="${sessionScope.reject}"/>">
														<c:out value="${sessionScope.reject}"/>
												</button>
											</c:otherwise>
									</c:choose>
										
										<a href="policy.assess.htm"><button
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.back}"/>">
												<c:out value="${sessionScope.back}"/>
											</button> </a>
										

										
									</div>
									
									
									
							
							</div>
						</div>

					</div>





				</div>
				<!-- contentpanel -->

			</div>
			<!-- mainpanel -->

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



		  <div id="successofapprover" class="success">
			<span> <c:out value="${sessionScope.successofapprover}" />
			</span>
		</div>
		 <div id="rejectofapprover" class="error2">
			<span> <c:out value="${sessionScope.rejectofapprover}" />
			</span>
		</div>
		

	

	

	</body>
	
</html>
