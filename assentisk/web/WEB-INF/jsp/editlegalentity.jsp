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
		<script src="js/organization/division.js"></script>

		<link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
				<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
				
		<script type="text/javascript">
	$(function() {
		$("#responsiblehead").autocomplete( {
			source : function(request, response) {
				$.getJSON("employeeList.ajaxresponse.htm", {
					term : request.term
				}, response);
			}
		});
	});
</script>


	</head>

	<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">

		<section>

		<%@include file="leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.Division_EditDivision}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.Division_EditDivision}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="legalentityapp"
								ng-controller="editLegalEntityController">
								<form ng-submit="saveData()">

									<input type="hidden" name="legalentityid" class="form-control"
										ng-model="legalentityid"
										ng-init='legalentityid = "<c:out value="${LegalEntityID}"/>"'>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Devision_Name}"/><font color="red">*</font>
												</label>
												<input type="text" id="legalentityname" name="legalentityname"
													class="form-control" ng-model="legalentityname"
													ng-init='legalentityname = "<c:out value="${LegalEntityName}"/>"'
													>
													<input type="hidden" name="legalentitynamecheck"
													class="form-control" ng-model="legalentitynamecheck"
													ng-init='legalentitynamecheck = "<c:out value="${LegalEntityName}"/>"'
													>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Devision_Description}"/><font color="red">*</font>
												</label>
													<textarea rows="4" cols="10" name="legalentitydescription" style="display:inline-block;" class="form-control" ng-model="legalentitydescription" maxlength="250" ng-init="legalentitydescription='<c:out value="${LegalEntityDescription}"/>'"></textarea>
											<script>
											          CKEDITOR.replace( 'legalentitydescription',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
												
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													Company<font color="red">*</font>
												</label>
												<select class="form-control" id="companyid"
													ng-model="companyid"
													ng-init='companyid="<c:out value="${CompanyID}"/>"'>

													<option value="">
														-- Select Company --
													</option>
													<c:forEach var="companyList" items="${companyList}">
														<option value="<c:out value="${companyList.CompanyID}"/>">
															<c:out value="${companyList.CompanyName}" />
														</option>
													</c:forEach>
												</select>


											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->



									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Division_Location}"/><font color="red">*</font>
												</label>
												<select class="form-control"
														id="branchid" ng-model="branchid"
														ng-init='branchid = "<c:out value="${BranchID}"/>"'>
														<option value="">
															-- Select Location --
														</option>
														<c:forEach var="branchList" items="${branchList}">
															<option value="<c:out value="${branchList.LocationID}"/>">
																<c:out value="${branchList.Name}" />
															</option>
														</c:forEach>
													</select>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Division_Department}"/><font color="red">*</font>
												</label>
												<select
														class="form-control" id="departmentid"
														ng-model="departmentid"
														ng-init='departmentid="<c:out value="${DepartmentID}"/>"'>
														<option value="">
															-- Select Department --
														</option>
														<c:forEach var="departmentList" items="${departmentList}">
															<option
																value="<c:out value="${departmentList.DepartmentID}"/>">
																<c:out value="${departmentList.DeptName}" />
															</option>
														</c:forEach>
													</select>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													Company Period
												</label>
												<input type="text" name="companyperiodid"
													class="form-control" ng-model="companyperiodid"
													ng-init='companyperiodid = "<c:out value="${CompanyPeriodID}"/>"'
													>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Division_RespHead}"/>
												</label>
												<input type="text" name="responsiblehead"
													class="form-control" ng-model="responsiblehead"
													id="responsiblehead" ng-init='responsiblehead = "<c:out value="${EmpName}"/>"'>
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
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/> ">
											<c:out value="${sessionScope.submit}"/>
										</button>
										<a href="legalentities.org.htm"><button
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}"/>
											</button> </a>
										<button type="button" class="btn btn-default"
											ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>">
											<c:out value="${sessionScope.reset}"/>
										</button>

									</div>
								</form>
								
								
								<input type="hidden" id="resetlegalentity" name="resetlegalentity"
													class="form-control" ng-model="resetlegalentity"
													ng-init='resetlegalentity = "<c:out value="${LegalEntityName}"/>"'
													>
								<input type="hidden" name="resetlegalentitydescription" id="resetlegalentitydescription"
													class="form-control" ng-model="resetlegalentitydescription"
													ng-init='resetlegalentitydescription = "<c:out value="${LegalEntityDescription}"/>"'
													>
																										
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

<div  id="divNameAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_NameAlert}"/></span>
 </div>
 <div  id="divDescAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_DescriptionAlert}"/></span>
 </div>

 <div  id="divBranchAlert" class="error2">
         <span >   <c:out value="${sessionScope.Division_BranchAlert}"/></span>
 </div>
  <div  id="divDeptAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_DepartmentAlert}"/></span>
 </div>
 <div  id="divPeriodAlert" class="error2">
         <span > <c:out value="${sessionScope.Division_EnterCompPertodAlert}"/></span>
 </div>

  <div id="submitSucess" class="success">
         <span > <c:out value="${sessionScope.submitupdatealert}"/></span>
 </div>
<div id="validDiv" class="error2">
			         <span > <c:out value="${sessionScope.Division_validDivisionName}"/></span>
</div>


<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_division_validation}"/> </span>
 </div>
 
  <div  id="checkResponsibleAlert" class="error2">
         <span > <c:out value="${sessionScope.responsible_head_message}"/> </span>
 </div>

 <div id="characterAlert" class="error2">
			         <span > <c:out value="${sessionScope.div_specialCharacteralert}"/></span>
			 </div>
 

	</body>
</html>
