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

		<title>assentisk</title>

		<link href="css/custom.css" rel="stylesheet">
		<script src="js/angular.min.js"></script>
		<script src="js/organization/group.js"></script>
		<script>
		
		function cancelFun(){
				window.location.href = 'group.group.htm';
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

		<%@include file="leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.addGroupHeader}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.addGroupHeader}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="groupapp"
								ng-controller="addGroupController">
								<form ng-submit="saveData()">




									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Group_Name}"/><font color="red">*</font>
												</label>
												<input type="text" name="groupname" id="groupname" class="form-control"
													ng-model="groupname" maxlength=250 ng-init="groupname=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Group_Decription}"/><font color="red">*</font>
												</label>
												<input type="text" name="groupper" id="desc" class="form-control"
													ng-model="groupper" ng-init="groupper=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row" style="display:none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.IsActive}"/>
												</label>
												  <input type="checkbox" name="isactive" ng-model="isactive" ng-init="isactive=true">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
									
										<button onclick="cancelFun();"
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}"/>
									    </button> 
										<button type="reset" class="btn btn-default"
											ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>">
											<c:out value="${sessionScope.reset}"/>
										</button>

									</div>
								</form>
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
			 <div id="submitSucess" class="success">
			         <span > <c:out value="${sessionScope.SubmitAlert}"/> </span>
			 </div>
			 <div  id="gpAlert" class="error2">
			         <span > <c:out value="${sessionScope.Group_Name_Alert}"/> </span>
			 </div>
			  <div  id="descAlert" class="error2">
			         <span > <c:out value="${sessionScope.Group_Description_Alert}"/> </span>
			 </div>
			 
			<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_group_validation}"/> </span>
 		</div>



	</body>
</html>
