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

		<link href="css/custom.css" rel="stylesheet">
		<script src="js/angular.min.js"></script>
		<script src="js/masters/state.js"></script>


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
					<c:out value="${sessionScope.state_edit_label}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.state_edit_label}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="stateapp"
								ng-controller="editStateController">
								<form ng-submit="saveData()">


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Country_Header}"/><font color="red">*</font>
												</label>
												<select class="form-control" ng-model="country"
													ng-init='country="<c:out value="${CountryID}"/>"'>
										
										<option value="">---Select Country---</option>
													<c:forEach var="list" items="${countryList}">

														
																<option value="<c:out value="${list.CountryID}"/>">
																	<c:out value="${list.CountryName}" />
																</option>
														

													</c:forEach>
												</select>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.State_Name}"/><font color="red">*</font>
												</label>
												<input type="hidden" name="stateid" class="form-control"
													ng-model="stateid"
													ng-init='stateid = "<c:out value="${StateID}"/>"'>
												<input type="text" name="statename" id="statename" class="form-control"
													ng-model="statename"  maxlength="250"
													ng-init='statename = "<c:out value="${StateName}"/>"'>
												<input type="hidden" name="statenamecheck" class="form-control"
													ng-model="statenamecheck" 
													ng-init='statenamecheck = "<c:out value="${StateName}"/>"'>	
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row" style="display:none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													IsActive
												</label>
												<input type="checkbox" name="isactive" ng-model="isactive"
													ng-checked="<c:out value="${IsActive}"/>"
													ng-init='isactive = "<c:out value="${IsActive}"/>"'>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.button_submit}"/>">
											<c:out value="${sessionScope.button_submit}"/>
										</button>
										<a href="state.master.htm"><button class="btn btn-primary"
												type="button" title="<c:out value="${sessionScope.button_cancel}"/>">
												<c:out value="${sessionScope.button_cancel}"/>
											</button>
										</a>
										<button type="button" class="btn btn-default"
											ng-click="reset()" title="<c:out value="${sessionScope.button_reset}"/>">
											<c:out value="${sessionScope.button_reset}"/>
										</button>

									</div>
								</form>
								
								<input type="hidden" name="resetstate" id="resetstate" class="form-control" ng-model="resetstate"  maxlength="250" ng-init='resetstate = "<c:out value="${StateName}"/>"'>
								<input type="hidden" name="resetcountry" id="resetcountry" class="form-control" ng-model="resetcountry"  maxlength="250" ng-init='resetcountry = "<c:out value="${CountryID}"/>"'>
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
         <span > <c:out value="${sessionScope.success_message}"/> </span>
 </div>
 <div  id="cAlert" class="error2">
         <span > <c:out value="${sessionScope.select_country_name}"/> </span>
 </div>
  <div  id="sAlert" class="error2">
         <span > <c:out value="${sessionScope.enter_state_name}"/> </span>
 </div>
<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_state_validation}"/> </span>
 </div>
<div  id="validstatename" class="error2">
         <span > <c:out value="${sessionScope.enter_valid_statename}"/> </span>
 </div>

	</body>
</html>
