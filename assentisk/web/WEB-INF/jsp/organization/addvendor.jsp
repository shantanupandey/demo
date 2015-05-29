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
		<script src="js/organization/vendor.js"></script>
		
		
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>	
 		
 		<link rel="stylesheet" href="css/jquery-ui.css">
 		<link rel="stylesheet" type="text/css"
			href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" />
 		<script src="js/jquery.min.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
		
 <style>

 .vendorContactClass td, th {
    padding: 1px;
}
.vendorContactClass{
width:100%;
}
#company td{

padding:0px !important;
}
.description_text_contact {
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
	
}

.append_data_contact {
	
	word-wrap: break-word; /* IE */
}

.add_more {
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

.append_data_table{width:100%;margin-top: 4px;}

.form-group span.addform {
    background: none repeat scroll 0 0 #8dc63f;
    border-radius: 0 4px 4px 0;
    bottom: 1px;
    color: #fff;
    font-size: 24px;
    padding: 10px 13px;
    position: absolute;
    right: 10px;
}


 span.removeform {
 	background: none repeat scroll 0 0 #cc3333;
    border-radius: 0 4px 4px 0;
    color: #fff;
    float: right;
    font-size: 15px;
    padding: 10px 15px;
    position: static;
    right: -10px;
    top: -10px;
    
   
}
span.spaceform{
padding-left:7px;
}
 </style>

  <script type="text/javascript">
  var count=0;
  var contactName=new Array();
  var getName="";
	$(document).ready(function() {
	

						$('.add_more_contact').click(function() {
											
							var nameContact= document.getElementById("nameContact").value;
							var designationContact=document.getElementById("designationContact").value;
							var phoneContact=document.getElementById("phoneContact").value;
							var emailContact=document.getElementById("emailContact").value;
							var emailfilter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;		
						
							 //  var phonefilter=/^[(]{0,1,9}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
							    var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
							
							  for(var i=0;i<contactName.length;i++) {
							    if(contactName[i] == nameContact){
							   getName=contactName[i];
							  break;
						   	
						}else{
						getName="";
						}}
							 if(nameContact==''){
								$('#validnameContact').show();
						   		$('#validnameContact').delay(1500).fadeOut('slow');
						   		document.getElementById("nameContact").focus();	
							}	 else if( getName == nameContact){
							//alert("contactname="+contactName);
							  $('#nameExist').show();
						   		$('#nameExist').delay(1500).fadeOut('slow');
						   		document.getElementById("nameContact").focus();	
							}		
							 else if(filter.test(designationContact) == true){	
									$('#validdesignationContact').show();
	   								 $('#validdesignationContact').delay(1500).fadeOut('slow');
	   								 document.getElementById("designationContact").focus();	
          					  }
						    else if(!emailfilter.test(emailContact) && emailContact!=''){	
        							$('#validemail11').show();
						   			 $('#validemail11').delay(1500).fadeOut('slow');
						   			  document.getElementById("emailContact").focus();	
						   			 
								}
							else
							{
							
								count=count +1;
								
								$.get("savevendorContact.org.htm?nameContact="
													+ nameContact + "&designationContact="
													+ designationContact + "&phoneContact="
													+ phoneContact+"&id="+count+"&emailContact="+emailContact,
													function(data,status){
													$("#company > tbody").append("<tr class='description_text_contact'  id='contact"+count+"'><td><span class='spaceform'>"+nameContact+"</span></td>"
																	+"<td><span class='spaceform'>"+designationContact+"</span></td>"+"<td><span class='spaceform'>"+phoneContact+"</span></td>"+"<td><span class='spaceform'>"+emailContact+"<span class='removeform' id='contact"+count+"' style='cursor:pointer;'>X</span></span></td></tr>");						
														$("#contactDialog").css("display","block");	
														contactName.push(document.getElementById("nameContact").value);	
																									
														document.getElementById("nameContact").value="";
														document.getElementById("designationContact").value="";
														document.getElementById("phoneContact").value="";	
														document.getElementById("emailContact").value="";
											
												});
									}
							});
									
									$('#company > tbody').on('click','.description_text_contact span',function(){
										$(this).closest('.description_text_contact').remove();
										var contactid=this.id;
										contactid=contactid.replace("contact", ""); 
										var rowCount = $('#company tr').length;
										if(rowCount==1){
											$("#contactDialog").css("display","none");	
										}
										//alert("contactid--"+contactid-1);
								//alert("contactName="+contactName[contactid-1]);
									if ((contactid-1) !== -1) {
    									contactName[contactid-1] = "";
										}
										$.get("deleteContactvendor.org.htm?id="
													+ contactid,
													function(data,status){
													
												});
												});
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
   				 $('body').on('keydown', '#phoneContact', function (e) {
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
					//added by neha
				
</script>
  
  
	</head>


<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.addVendor_header}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						 <li class="active"><c:out value="${sessionScope.addVendor_header}"/></li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="vendorapp"
								ng-controller="addVendorController">
								<form ng-submit="saveData()">

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.vendor_name}"/><font color="red">*</font>
												</label>
												<input type="text" name="vendorname" id="vendorname" class="form-control" 
													ng-model="vendorname" ng-init="vendorname=''" maxlength="250">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendor_Address}"/>
												</label>
												 											
 											<textarea rows="4" cols="10" name="address" style="display:inline-block;" class="form-control" ng-model="address" maxlength="250" ng-init="address=''"></textarea>
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
										<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendor_Country}"/><font color="red">*</font>
												</label>
												<select class="form-control" ng-model="countryid" id="countryid"
													 ng-change="callState(countryid)"  ng-init="countryid=''">
													<option value="">
														-- Select Country --
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
													<c:out value="${sessionScope.Vendor_State}"/><font color="red">*</font>
												</label>
												<span id="statelist"> <select class="form-control" id="stateid"
														ng-model="stateid" ng-init="stateid=''">
														<option value="">
															-- Select State --
														</option>

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
													<c:out value="${sessionScope.Vendor_City}"/><font color="red">*</font>
												</label>
												<input type="text" name="cityid"  class="form-control" ng-model="cityid" id="cityid" ng-init="cityid=''">
												
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									
									
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendore_phone1}"/><font color="red">*</font>
												</label>
												
 											<input type="text" name="phone1" class="form-control" ng-model="phone1" id="phone1"  ng-init="phone1=''" maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendore_phone2}"/>
												</label>
												
 											<input type="text" name="phone2" class="form-control" ng-model="phone2" id="phone2"  ng-init='phone2 = ""' maxlength="15">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendore_email1}"/><font color="red">*</font>
												</label>
												
 											<input type="text" name="email1" class="form-control" ng-model="email1" id="email1"  ng-init="email1=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
								  <div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Vendore_email2}"/>
												</label>
												
 											<input type="text" name="email2" class="form-control" ng-model="email2" ng-init='email2 = ""' id="email2">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									

									<div class="row" style="display:none">
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
									
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												
																<label class="control-label">
																		<c:out value="${sessionScope.Vendor_Contact}"/>
																</label>
																<table class="vendorContactClass">
																	<tr>
																			<td>
																				<input type="text" id="nameContact"  name="nameContact"
																				class="form-control" ng-model="nameContact" ng-init="nameContact=''" Placeholder="<c:out value="${sessionScope.vendorContact_Name}"/>">
																				<input type="hidden" id="checknameContact"  name="checknameContact"
																				class="form-control" ng-model="checknameContact">
																	
																			</td>
																			<td>
																				<input type="text" id="designationContact"  name="designationContact"
																				class="form-control" ng-model="designationContact" ng-init="designationContact=''" Placeholder="<c:out value="${sessionScope.vendorContact_Designation}"/>">
																	
																			</td>
																			<td>
																				<input type="text" id="phoneContact"  name="phoneContact"
																				class="form-control" ng-model="phoneContact" ng-init="phoneContact=''" Placeholder="<c:out value="${sessionScope.vendorContact_Phone}"/>">
																	
																			</td>
																			<td>
																				<input type="text" id="emailContact"  name="emailContact"
																				class="form-control" ng-model="emailContact" ng-init="emailContact=''" Placeholder="<c:out value="${sessionScope.vendorContact_Email}"/>">
																	
																			</td>
																			<td>
																				<a href="javascript:void(0);" class="add_more_contact"><span class="addform">+</span>
																				</a>
																			</td>
																	</tr>
																
																</table>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>									
									</br>
									<div id="contactDialog" style="display: none">
										<table class="table table-striped table-condensed table-hover"
											id="company">
											<thead>
												<tr>
													<th class="email1" style="width: 200px;">
															<c:out value="${sessionScope.vendorContact_Name}"/>
													</th>
													<th class="email2" style="width: 200px;">
													 <c:out value="${sessionScope.vendorContact_Designation}"/>
													</th>
													<th class="phone1" style="width: 200px;">
														<c:out value="${sessionScope.vendorContact_Phone}"/>
													</th>
													<th class="phone1" style="width: 200px;">
														<c:out value="${sessionScope.vendorContact_Email}"/>
													</th>
													</tr>
											</thead>
											<tbody>
											
											</tbody>

										</table>
									</div>
									<!-- row -->
									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
										<a href="vendor.org.htm"><button
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}"/>
											</button> </a>
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



  <div id="vname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Name_Alert}"/></span>
 </div>
 <div id="oname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Organization_Alert}"/></span>
 </div>
 <div  id="cname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Country_Alert}"/></span>
 </div>
  <div  id="sname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_State_Alert}"/></span>
 </div>
 <div  id="cityname" class="error2">
         <span ><c:out value="${sessionScope.Vendore_City_Alert}"/></span>
 </div>
  <div  id="phone11" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Phone_Alert}"/></span>
 </div>
 <div  id="email11" class="error2">
         <span > <c:out value="${sessionScope.vendore_emailFill_alert}"/></span>
 </div>
  <div  id="validemail11" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Email_Alert}"/></span>
 </div>
 <div  id="desig" class="error2">
         <span > <c:out value="${sessionScope.Vendore_Designation_Alert}"/></span>
 </div>
 <div  id="alertSuc" class="success">
         <span > <c:out value="${sessionScope.Vendore_Successfully_Alert}"/></span>
 </div>
<div  id="validvendorname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validvendorname}"/></span>
 </div>
 <div  id="validorgname" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validorgname}"/></span>
 </div>
 <div  id="validcityid" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validcityid}"/></span>
 </div>
 <div  id="validphone1" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validphone1}"/></span>
 </div>
  <div  id="validphone2" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validphone2}"/></span>
 </div>
 <div  id="validdesignation" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validdesignation}"/></span>
 </div>
 
 <div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_vendor_validation}"/> </span>
 </div>
  <div  id="validnameContact" class="error2">
         <span > <c:out value="${sessionScope.Vendore_validnameContact}"/></span>
 </div>
  
 <div  id="validdesignationContact" class="error2">
         <span > <c:out value="${sessionScope.validdesignationContact}"/> </span>
 </div>
  <div  id="validphoneContact" class="error2">
         <span > <c:out value="${sessionScope.validphoneContact}"/> </span>
 </div>
  <div  id="nameExist" class="error2">
         <span > <c:out value="${sessionScope.contactnamealert}"/> </span>
 </div>
 
	</body>
</html>
