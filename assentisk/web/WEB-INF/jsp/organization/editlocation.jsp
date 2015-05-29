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
		<script src="js/organization/location.js"></script>
		  <script src="js/jquery-1.11.1.min.js"></script>
		<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
		<script>
	function callCity(stateid) {
		var countryid = document.getElementById("countryid").value;
		$.get("cityList.ajaxresponse.htm?countryid=" + countryid + "&stateid="
				+ stateid, function(data, status) {
			document.getElementById("cityList").innerHTML = data;
		});
	}
	
</script>
  <script type="text/javascript">
  	$(document).ready(function() {
     	
     	$('body').on('keydown', '#phone1', function (e) {
      									 if(e.shiftKey && e.keyCode == 189) 
										       {
										             e.preventDefault();
										             return;          
										       }
										       if((e.shiftKey && e.keyCode == 57) || (e.shiftKey && e.keyCode == 48)) 
										       {
										             return;
										       }
										       // Allow: backspace, delete, tab, escape, enter and .
										        
										        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13,107,109, 189,32,187,189]) !== -1 ||
										             // Allow: Ctrl+A
										            (e.keyCode == 65 && e.ctrlKey === true) || 
										             // Allow: home, end, left, right, down, up
										            (e.keyCode >= 35 && e.keyCode <= 40)) {
										                 // let it happen, don't do anything
										                // e.preventDefault();
										               //  return;
										        }
										        // Ensure that it is a number and stop the keypress
										       else if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ) {
										            e.preventDefault();
										        }
   				 });
   				 
   				 	$('body').on('keydown', '#phone2', function (e) {
      								 if(e.shiftKey && e.keyCode == 189) 
										       {
										             e.preventDefault();
										             return;          
										       }
										       if((e.shiftKey && e.keyCode == 57) || (e.shiftKey && e.keyCode == 48)) 
										       {
										             return;
										       }
										       // Allow: backspace, delete, tab, escape, enter and .
										        
										        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13,107,109, 189,32,187,189]) !== -1 ||
										             // Allow: Ctrl+A
										            (e.keyCode == 65 && e.ctrlKey === true) || 
										             // Allow: home, end, left, right, down, up
										            (e.keyCode >= 35 && e.keyCode <= 40)) {
										                 // let it happen, don't do anything
										                // e.preventDefault();
										               //  return;
										        }
										        // Ensure that it is a number and stop the keypress
										       else if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ) {
										            e.preventDefault();
										        }
   				 });
   				 
   				 
   				 });
   				 
   				function cancelFun(){
				window.location.href = 'locations.org.htm';
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

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.edit_Location}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.edit_Location}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="locationapp"
								ng-controller="editLocationController">
								<form ng-submit="saveData()">

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Location_Name}"/><font color="red">*</font>
												</label>
												<input type="hidden" name="locationid" class="form-control"
													ng-model="locationid"
													ng-init='locationid = "<c:out value="${LocationID}"/>"'>
												<input type="text" name="locationname" id="locationname" class="form-control"
													ng-model="locationname"
													ng-init='locationname = "<c:out value="${Name}"/>"'>
												<input type="hidden" name="locationnamecheck" class="form-control"
													ng-model="locationnamecheck"
													ng-init='locationnamecheck = "<c:out value="${Name}"/>"'>	
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Location_Company}"/>Company
													<font color="red">*</font>
												</label>
												<select class="form-control" ng-model="companyid"
													ng-init='companyid = "<c:out value="${CompanyID}"/>"'>

													<option value="">
														<c:out value="${sessionScope.selectCompany}"/>
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

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
														<c:out value="${sessionScope.Location_Country}"/><font color="red">*</font>
												</label>
												<select class="form-control" ng-model="countryid"
													id="countryid" ng-change="callState(countryid)"
													ng-init='countryid = "<c:out value="${CountryID}"/>"'>
													<option value="">
														<c:out value="${sessionScope.selectCountry}"/>
													</option>
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
													<c:out value="${sessionScope.Location_State}"/><font color="red">*</font>
												</label>
												<span id="statelist"> <select class="form-control"
														id="stateid" ng-model="stateid"
														ng-init='stateid = "<c:out value="${StateID}"/>"'>
														<option value="">
														<c:out value="${sessionScope.selectState}"/>
													</option>
														<c:forEach var="list" items="${stateList}">
															<option value="<c:out value="${list.StateID}"/>">
																<c:out value="${list.StateName}" />
															</option>
														</c:forEach>

													</select> </span>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Location_City}"/><font color="red">*</font>
												</label>
												<input type="text" name="cityid"  id="cityid" class="form-control"
													ng-model="cityid" ng-init='cityid = "<c:out value="${CityID}"/>"' maxlength="100">
											
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row"  style="display:none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
														<c:out value="${sessionScope.addEditLocation_Street}"/>
												</label>
												<input type="text" name="street" class="form-control"
													ng-model="street"
													ng-init='street = "<c:out value="${Street}"/>"'>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
										

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Address}"/>
												</label>
												
													<textarea rows="4" cols="10" class="form-control" ng-model="address" maxlength="250" ng-init="address='<c:out value="${Address}"/>'" name="address"><c:out value="${Address}"/></textarea>

											

												<script>
											          CKEDITOR.replace( 'address',
														{
														  removePlugins: 'toolbar',
															height: '100px',
															enterMode : CKEDITOR.ENTER_BR,
       														shiftEnterMode: CKEDITOR.ENTER_P
														} );
											    </script>
											

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

								

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Zip}"/>
												</label>
												<input type="text" name="zipcode" id="zipcode" class="form-control"
													ng-model="zipcode"
													ng-init='zipcode = "<c:out value="${ZipCode}"/>"' maxlength="10">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_ContactNo}"/><font color="red">*</font>
												</label>
												<input type="text" name="contactno" id="contactno" class="form-control"
													ng-model="contactno"
													ng-init='contactno = "<c:out value="${Contactno}"/>"' maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Phone1}"/>
												</label>
												<input type="text" name="phone1" id="phone1" class="form-control"
													ng-model="phone1"
													ng-init='phone1 = "<c:out value="${phone1}"/>"'  maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Phone2}"/>
												</label>
												<input type="text" name="phone2" id="phone2" class="form-control"
													ng-model="phone2"
													ng-init='phone2 = "<c:out value="${Phone2}"/>"'  maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Email1}"/><font color="red">*</font>
												</label>
												<input type="text" name="email1" class="form-control"
													ng-model="email1"
													ng-init='email1 = "<c:out value="${Email1}"/>"'>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Email2}"/>
												</label>
												<input type="text" name="email2" class="form-control"
													ng-model="email2"
													ng-init='email2 = "<c:out value="${Email2}"/>"'>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Fax1}"/>
												</label>
												<input type="text" name="fax1" id="fax1" class="form-control"
													ng-model="fax1" ng-init='fax1 = "<c:out value="${Fax1}"/>"'  maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row" style="display:none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_Fax2}"/>
												</label>
												<input type="text" name="fax2"  id="fax2" class="form-control"
													ng-model="fax2" ng-init='fax2 = "<c:out value="${Fax2}"/>"'  maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_URL}"/>
												</label>
												<input type="text" name="url" class="form-control"
													ng-model="url" ng-init='url = "<c:out value="${Url}"/>"'>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row" style="display:none">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditLocation_IsActive}"/>
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
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
										<button onclick="cancelFun();"
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}"/>
									    </button> 
										<button type="button" class="btn btn-default"
											ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>">
										<c:out value="${sessionScope.reset}"/>
										</button>


									</div>
								</form>
								
								<!-- Reset fields -->
									<input type="hidden" name="resetlocation" id="resetlocation" class="form-control" ng-model="resetlocation" ng-init='resetlocation = "<c:out value="${Name}"/>"'>
									<input type="hidden" name="resetcountry" id="resetcountry" class="form-control" ng-model="resetcountry" ng-init='resetcountry = "<c:out value="${CountryID}"/>"'>
									<input type="hidden" name="resetstate" id="resetstate" class="form-control" ng-model="resetstate" ng-init='resetstate = "<c:out value="${StateID}"/>"'>
									<input type="hidden" name="resetcity"  id="resetcity" class="form-control" ng-model="resetcity" ng-init='resetcity = "<c:out value="${CityID}"/>"' maxlength="100">
									<input type="hidden" name="resetzipcode" id="zipcode" class="form-control" ng-model="resetzipcode" ng-init='resetzipcode = "<c:out value="${ZipCode}"/>"' maxlength="10">
									<input type="hidden" name="resetcontactno" id="resetcontactno" class="form-control" ng-model="resetcontactno" ng-init='resetcontactno = "<c:out value="${Contactno}"/>"' maxlength="15">
									<input type="hidden" name="resetphone1" id="resetphone1" class="form-control" ng-model="resetphone1" ng-init='resetphone1 = "<c:out value="${phone1}"/>"'  maxlength="15">									
									<input type="hidden" name="resetphone2" id="resetphone2" class="form-control" ng-model="resetphone2"	ng-init='resetphone2 = "<c:out value="${Phone2}"/>"'  maxlength="15">
									<input type="hidden" name="resetemail1" class="form-control" ng-model="resetemail1"	ng-init='resetemail1 = "<c:out value="${Email1}"/>"'>
									<input type="hidden" name="resetemail2" class="form-control" ng-model="resetemail2"	ng-init='resetemail2 = "<c:out value="${Email2}"/>"'>									
									<input type="hidden" name="resetfax1" id="resetfax1" class="form-control" ng-model="resetfax1" ng-init='resetfax1 = "<c:out value="${Fax1}"/>"'  maxlength="15">
									<input type="hidden" name="resetfax2" id="resetfax2" class="form-control" ng-model="resetfax2" ng-init='resetfax2 = "<c:out value="${Fax2}"/>"'  maxlength="15">									
									<input type="hidden" name="reseturl" class="form-control" ng-model="reseturl" ng-init='reseturl = "<c:out value="${Url}"/>"'>
								
								<input type="hidden" name="resetaddress" class="form-control" ng-model="resetaddress" ng-init='resetaddress = "<c:out value="${Address}"/>"'>
								
								
								<!-- Reset fields -->
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


		<div id="divLocNameAlert" class="error2">
			<span >  <c:out value="${sessionScope.LocationNameAlert}"/></span>
		</div>
		<div id="divCompnayAlert" class="error2">
			<span>  <c:out value="${sessionScope.LocationSelectCompanyAlert}"/></span>
		</div>
		<div id="divCountryAlert" class="error2">
			 <span >  <c:out value="${sessionScope.CountryAlert}"/></span>
		</div>
		<div id="divStateAlert" class="error2">
			 <span >  <c:out value="${sessionScope.StateAlert}"/></span>
		</div>
		<div id="divCityAlert" class="error2">
			  <span >  <c:out value="${sessionScope.CityAlert}"/></span>
		</div>


		<div id="divContactAlert" class="error2">
			 <span >  <c:out value="${sessionScope.ContactNoAlert}"/></span>
		</div>


		<div id="divemail1Alert" class="error2">
			<span > <c:out value="${sessionScope.Email1Alert}"/></span>
		</div>
		<div id="submitSucess" class="success">
		 <span > <c:out value="${sessionScope.submitupdatealert}"/></span>
		</div>
		
		<div  id="divEmailErrorAlert" class="error2">
        <span > <c:out value="${sessionScope.CorrectEmail1Alert}"/></span>
		 </div>
		 
		 <div  id="divEmail2ErrorAlert" class="error2">
		         <span > <c:out value="${sessionScope.CorrectEmail2Alert}"/></span>
		 </div>
		 <div id="validLocation" class="error2">
			         <span > <c:out value="${sessionScope.addEditValidLoc_Name}"/></span>

		 </div>

<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_location_validation}"/> </span>
 </div>
 <div  id="validlocationName_alert" class="error2">
         <span > <c:out value="${sessionScope.Location_validLocationname}"/></span>
 </div>
 <div  id="divCityidValidAlert" class="error2">
         <span > <c:out value="${sessionScope.Location_city_valid}"/> </span>
 </div>
  <div  id="Location_validcontactno" class="error2">
         <span > <c:out value="${sessionScope.Location_validcontactno}"/></span>
 </div>
  <div  id="Location_validphone1" class="error2">
         <span > <c:out value="${session.
         
         
         
         
         Scope.Location_validphone1}"/> </span>
 </div>
 <div  id="Location_validphone2" class="error2">
         <span > <c:out value="${sessionScope.Location_validphone2}"/> </span>
 </div>
   <div  id="Location_validfax1" class="error2">
         <span > <c:out value="${sessionScope.Location_validfax1}"/> </span>
 </div>
   <div  id="Location_validfax2" class="error2">
         <span > <c:out value="${sessionScope.Location_validfax2}"/> </span>
 </div>
   <div  id="Location_validzip" class="error2">
         <span > <c:out value="${sessionScope.Location_validzip}"/> </span>
 </div>

	</body>
</html>
