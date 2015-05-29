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
		<script src="js/organization/employee.js"></script>
	    <link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
 			<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
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
</style>
<style type="text/css">
 
#submit
{
	border:1px solid #cccccc;
	width:100px !important;
	margin:10px;
}
#passwordDescription{
color: green;
font-size:10px;
}
#passwordBlank{
color:black;
font-size:10px;
}
#passwordStrength
{
	height:10px;
	display:block;
	float:left;
	margin-bottom: 7px;
	display: none;
	font-size:10px;
}

.strength0
{
	width:250px;
	background:#cccccc;
}

.strength1
{
	width:50px;
	background:#ff0000;
}

.strength2
{
	width:100px;	
	background:#ff5f5f;
}

.strength3
{
	width:150px;
	background:#56e500;
}

.strength4
{
	background:#4dcd00;
	width:200px;
}

.strength5
{
	background:#399800;
	width:250px;
}


</style>
	    <script>
							
						
						
							function callCity(stateid) {
								var countryid = document.getElementById("countryid").value;
								$.get("cityList.ajaxresponse.htm?countryid=" + countryid + "&stateid="
										+ stateid, function(data, status) {
									document.getElementById("cityList").innerHTML = data;
								});
							}
							
							function validatePhone(phone) {
                            var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
							if (filter.test(phone)) {
							return true;
							}
							else {
							return false;
							}
							}
</script>

<script type="text/javascript">
    $(function() {      
        $("#location").autocomplete({
            source: function (request, response) {
                $.getJSON("locationList.ajaxresponse.htm", {
                   term: request.term
                }, response);
            }
        });
        
    }); 


    $(function() {      
        $("#divtest").autocomplete({
            source: function (request, response) {
                $.getJSON("divisionList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
    
   
   $(function() {      
        $("#groupval").autocomplete({
            source: function (request, response) {
                $.getJSON("groupList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
    $(function() {      
        $("#departments").autocomplete({
            source: function (request, response) {
                $.getJSON("departmentList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
     
        
</script>
<script type="text/javascript">
 $(function() {      
 
        $("#responsiblehead").autocomplete({
            source: function (request, response) {
                $.getJSON("employeeselfnotBracketList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
  
    
  
        
</script>
<script type="text/javascript">
var getdivision="";
$(document).ready(function(){ 

				$('.add_more').click(function()
                     {
                      	 var division = $('#divtest').val();
                      	 var testdivisiondata = $('#divtest').val()+",";
                      	 var testdivisiondata1 = $('#divtest').val()+" ,";
                      	 var oldtestdiv= $('#oldtestdiv').val();
                         var divisiondata="";
                         var divDat="";
                         var myDivisions = document.getElementsByClassName("description_text");
                         document.getElementById("divtest").value='';		
                         if(division!='')
								{
								
									if(oldtestdiv.indexOf(testdivisiondata) >= 0)
									{
											for(var i = 0; i < myDivisions.length; i++)
											{
												divDat=myDivisions[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
												divisiondata = divisiondata + divDat + ",";	
											}											
											if (divisiondata.indexOf(testdivisiondata1) >= 0)
											{
												$('#alreadyAdd').show();
												$('#alreadyAdd').delay(1500).fadeOut('slow');
											}
											else
											{
											     $(".append_data").append('<div class="description_text">'+division+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
											}
									
									}
									else
									{
									
											$('#wrongAddDiv').show();
											$('#wrongAddDiv').delay(1500).fadeOut('slow');		
									}
		
			                        		
								}
								else
								{
									$('#wrongDivs').show();
									$('#wrongDivs').delay(1500).fadeOut('slow');		
								}
                     });

				$('.append_data').on('click','.description_text a',function(){
					$(this).closest('.description_text').remove();

				});
				
				
				
				
				$('.add_more_loc').click(function()
                     {
                      	 var location = $('#location').val();
                      	 var testlocationdata=$('#location').val()+",";
                      	  var testlocationdata1=$('#location').val()+" ,";
                      	 var oldtestloc= $('#oldtestloc').val();
                         var locationdata="";
                         var locDat="";
                         var myLocations = document.getElementsByClassName("description_text_loc");
                         document.getElementById("location").value='';		
                         if(location!='')
								{
									if(oldtestloc.indexOf(testlocationdata) >= 0)
									{
											for(var i = 0; i < myLocations.length; i++)
											{
												locDat=myLocations[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
												locationdata = locationdata + locDat + ",";	
											}											
											if (locationdata.indexOf(testlocationdata1) >= 0)
											{
												$('#alreadyAdd').show();
												$('#alreadyAdd').delay(1500).fadeOut('slow');
											}
											else
											{
											     $(".append_data_loc").append('<div class="description_text_loc">'+location+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
											}
									
									}
									else
									{
									
											$('#wrongAddLoc').show();
											$('#wrongAddLoc').delay(1500).fadeOut('slow');		
									}
		
			                        		
								}
								else
								{
									$('#wrongLocs').show();
									$('#wrongLocs').delay(1500).fadeOut('slow');		
								}
                     });

				$('.append_data_loc').on('click','.description_text_loc a',function(){
					$(this).closest('.description_text_loc').remove();

				});
				
				
				$('.add_more_group').click(function()
                     {
                      	 var groupval = $('#groupval').val();
                      	 	 var testgroupvaldata=$('#groupval').val()+",";
                      	 	  var testgroupvaldata1=$('#groupval').val()+" ,";
                      	 var oldtestgroup= $('#oldtestgroup').val();
                         var groupdata="";
                         var gpDat="";
                         var myGroups = document.getElementsByClassName("description_text_group");
                         document.getElementById("groupval").value='';		
                         if(groupval!='')
								{
									if(oldtestgroup.indexOf(testgroupvaldata) >= 0)
									{
											for(var i = 0; i < myGroups.length; i++)
											{
												gpDat=myGroups[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
												groupdata = groupdata + gpDat + ",";	
											}											
											if (groupdata.indexOf(testgroupvaldata1) >= 0)
											{
												$('#alreadyAdd').show();
												$('#alreadyAdd').delay(1500).fadeOut('slow');
											}
											else
											{
											     $(".append_data_group").append('<div class="description_text_group">'+groupval+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
											}
									
									}
									else
									{
									
											$('#wrongAddGroup').show();
											$('#wrongAddGroup').delay(1500).fadeOut('slow');		
									}
		
			                        		
								}
								else
								{
									$('#wrongGroups').show();
									$('#wrongGroups').delay(1500).fadeOut('slow');		
								}
                     });

				$('.append_data_group').on('click','.description_text_group a',function(){
					$(this).closest('.description_text_group').remove();

				});
				
				$('.add_more_dep').click(function()
                     {
                      	 var department = $('#departments').val();
                      	 var testdepartmentdata=$('#departments').val()+",";
                      	 	 var testdepartmentdata1=$('#departments').val()+" ,";
                      	 var oldtestdep= $('#oldtestdep').val();
                         var deptdata="";
                         var deptDat="";
                         var myDept = document.getElementsByClassName("description_text_dep");
                         document.getElementById("departments").value='';		
                         if(department!='')
								{
									if(oldtestdep.indexOf(testdepartmentdata) >= 0)
									{
											for(var i = 0; i < myDept.length; i++)
											{
												deptDat=myDept[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
												deptdata = deptdata + deptDat + ",";	
											}											
											if (deptdata.indexOf(testdepartmentdata1) >= 0)
											{
												$('#alreadyAdd').show();
												$('#alreadyAdd').delay(1500).fadeOut('slow');
											}
											else
											{
											     $(".append_data_dep").append('<div class="description_text_dep">'+department+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
											}
									
									}
									else
									{
									
											$('#wrongAddDept').show();
											$('#wrongAddDept').delay(1500).fadeOut('slow');		
									}
		
			                        		
								}
								else
								{
									$('#wrongdepts').show();
									$('#wrongdepts').delay(1500).fadeOut('slow');		
								}
                     });

				$('.append_data_dep').on('click','.description_text_dep a',function(){
					$(this).closest('.description_text_dep').remove();

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
   				 
				
				
				
});

</script>

<script type="text/javascript">



function userSection(){
	if(jQuery('#licenseuser').is(':checked'))
		{	
				jQuery('#userNameSection').css("display","block")
			 
		}
		else
		{		
				jQuery('#userNameSection').css("display","none");
				
				
		}
	
	
	
}

  function passwordCheck(password)
{var desc = new Array();
	desc[0] = "Very Weak";
	desc[1] = "Weak";
	desc[2] = "Better";
	desc[3] = "Medium";
	desc[4] = "Strong";
	desc[5] = "Strongest";
document.getElementById("passwordStrength").style.display='block';
document.getElementById("passwordDescription").style.display='block';
document.getElementById("passwordBlank").style.display='none';
	var score   = 0;
	if (password.length < 1){ document.getElementById("passwordStrength").style.display='none';
	document.getElementById("passwordDescription").style.display='none';
	document.getElementById("passwordBlank").style.display='block';}
	//if password bigger than 6 give 1 point
	if (password.length > 6) score++;

	//if password has both lower and uppercase characters give 1 point	
	if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;

	//if password has at least one number give 1 point
	if (password.match(/\d+/)) score++;

	//if password has at least one special caracther give 1 point
	if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) )	score++;

	//if password bigger than 12 give another 1 point
	if (password.length > 12) score++;

	 document.getElementById("passwordDescription").innerHTML = desc[score];
	 document.getElementById("passwordStrength").className = "strength" + score;}
</script>
	</head>


<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.addEmploye}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.addEmploye}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="employeeapp"
								ng-controller="addEmployeeController">
								<form ng-submit="saveData()">
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.employeName}"/><font color="red">*</font>
												</label>
												<input type="text" name="ename" id="ename" class="form-control"
													ng-model="ename" maxlength="250" >
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									
									
									<div class="row" style="display: none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Employe_Company}"/><font color="red">*</font>
												</label>
												<select class="form-control" ng-model="companyid">
													<option value="">
														-- Select Company --
													</option>
													<c:forEach var="list" items="${companyList}">
														<option value="<c:out value="${list.CompanyID}"/>">
															<c:out value="${list.CompanyName}" />
														</option>
													</c:forEach>
												</select>
											</div>
										</div>									
									</div>
									
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.Employe_Department}"/><font color="red">*</font>
																	
																</label>
																<input type="text" id="departments"  name="departments"
																	class="form-control" ng-model="departments">
																	
																<input type="hidden" id="testdep" name="testdep">
																<input type="hidden" id="oldtestdep" name="oldtestdep"
																	value="<c:out value="${getDepartments}"/>">
															
																	<a href="javascript:void(0);" class="add_more_dep"><span class="add">+</span>
																	</a>
																
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<table border="0"  cellspacing="0" class="append_data_table">
													<tbody class="append_data_dep"></tbody>
												</table>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.employeLocations}"/><font color="red">*</font>
																	
																</label>
																<input type="text" id="location"  name="location"
																	class="form-control" ng-model="location">
																	
																<input type="hidden" id="testloc" name="testloc">
																<input type="hidden" id="oldtestloc" name="oldtestloc"
																	value="<c:out value="${getLocations}"/>">
															
																	<a href="javascript:void(0);" class="add_more_loc"><span class="add">+</span>
																	</a>
																
															
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<table border="0" cellspacing="0" class="append_data_table">
													<tbody class="append_data_loc"></tbody>
												</table>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>

									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.Employe_divisions}"/><font color="red">*</font>
																	
																</label>

																<input type="hidden" id="testdiv" name="testdiv">
																<input type="hidden" id="oldtestdiv" name="oldtestdiv"
																	value="<c:out value="${getDivisions}"/>">

																<input type="text" id="divtest" name="divtest" class="form-control" ng-model="test">
															
																	<a href="javascript:void(0);" class="add_more"><span class="add">+</span>
																	</a>
																

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<table border="0" cellspacing="0" class="append_data_table">
													<tbody class="append_data"></tbody>
												</table>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>


									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeAddress}"/>
												</label>
												<textarea rows="4" cols="10" class="form-control" ng-model="address" maxlength="250" ng-init="address=''" name="address" id="address"></textarea>
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
													<c:out value="${sessionScope.addEditEmployeCountry}"/>
												</label>
												<select class="form-control" ng-model="countryid" id="countryid"
													 ng-change="callState(countryid)">
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
													<c:out value="${sessionScope.addEditEmployeState}"/>
												</label>
												<span id="statelist"> <select class="form-control" id="stateid"
														ng-model="stateid" >
														<option value="">
															<c:out value="${sessionScope.selectState}"/>
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
													<c:out value="${sessionScope.addEditEmployeCity}"/>
												</label>
												<input type="text" name="cityid" id="cityid" class="form-control"
													ng-model="cityid" maxlength="100" ng-init="cityid=''" >
												
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									
										<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeZip}"/>
												</label>
												<input type="text" name="zip"  id="zip" class="form-control"
													ng-model="zip" maxlength="15" ng-init="zip=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									
									
									
											<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployePhone1}"/>
												</label>
												<input type="text" name="phone1" id="phone1" class="form-control"
													ng-model="phone1" maxlength="15" ng-init="phone1=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
											
											<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployePhone2}"/>
												</label>
												<input type="text" name="phone2" id="phone2" class="form-control"
													ng-model="phone2" maxlength="15" ng-init="phone2=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
										
											<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeEmail1}"/>
												</label>
												<input type="text" name="email1" id="email1" class="form-control"
													ng-model="email1" maxlength="100" ng-init="email1=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
										<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeEmail2}"/>
												</label>
												<input type="text" name="email2" id="email2" class="form-control"
													ng-model="email2" maxlength="100" ng-init="email2=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									
									
									
									


									<div class="row" style="padding-top: 10px;display:none;">
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
									<div class="row" >
										<div class="col-sm-6">
											<div class="form-group">
												<label>
														<c:out value="${sessionScope.employeeLicenseUser}"/>
												</label>
												<input id="licenseuser" name="licenseuser" type="checkbox" onclick="userSection()" />
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
						<div id="userNameSection" style="display:none;">
								<hr> 
										<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeIsUsername}"/><font color="red">*</font>
												</label>
												<input type="text" name="username" id="username" class="form-control"	ng-model="username"  ng-init='username =" "' maxlength="250">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
										<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
												<c:out value="${sessionScope.addEditEmployeIsPassword}"/><font color="red">*</font>
												</label>
												<input type="password" id="password" name="password" class="form-control"	ng-model="password" maxlength="250" onkeyup="passwordCheck(this.value);">
												<div id="passwordDescription"></div>
												<div id="passwordBlank" >Password can't be Empty</div>
												<div id="passwordStrength" class="strength0"> </div>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.addEditEmployeIsGroup}"/><font color="red">*</font>
																
																</label>

																<input type="hidden" id="testgroup" name="testgroup">
																<input type="hidden" id="oldtestgroup" name="oldtestgroup"
																	value="<c:out value="${getGroups}"/>">

																<input type="text"  id="groupval" name="groupval"
																	class="form-control" ng-model="groupval">
															
																
																	<a href="javascript:void(0);" class="add_more_group"><span class="add">+</span>
																	</a>
																

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									
									
									
									
									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<table border="0" cellspacing="0" class="append_data_table">
													<tbody class="append_data_group"></tbody>
												</table>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.addEditEmployeReportingTo}"/><font color="red">*</font>
												</label>
												<input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
							</div></br>
									<!-- row -->
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
										<a href="employees.org.htm"><button
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


		<div id="submitSucess" class="success">
			<span> <c:out value="${sessionScope.SubmitAlert}" /> </span>
		</div>
		<div id="empAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_Name_Alert}" /> </span>
		</div>

		<div id="depAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_department_Alert}" />
			</span>
		</div>
		<div id="lAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_location_Alert}" />
			</span>
		</div>
		<div id="divAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_Divisions_Alert}" />
			</span>
		</div>
		<div id="counAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_Country_Alert}" />
			</span>
		</div>
		<div id="stAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_State_alert}" /> </span>
		</div>
		<div id="cityAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_City_Alert}" /> </span>
		</div>
		<div id="phoneAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_Phone_Alert}" /> </span>
		</div>
		<div id="emailAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_email_Alert}" /> </span>
		</div>
		<div id="unameAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_username_Alert}" />
			</span>
		</div>
		<div id="passAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_password_Alert}" />
			</span>
		</div>
		<div id="grpAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_group_Alert}" />
			</span>
		</div>
		<div id="repAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_reporting_Alert}" />
			</span>
		</div>
		<div id="validEmailAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_validEmail_alert}" />
			</span>
		</div>
		<div id="checkNameAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_User_Alert}" /> </span>
		</div>
		<div id="divPhoneErrorAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_PhoneValid_Alert}" />
			</span>
		</div>

		<div id="emp_ename_valid_alert" class="error2">
			<span> <c:out value="${sessionScope.emp_ename_valid_alert}" />
			</span>
		</div>
		<div id="emp_cityid_valid_alert" class="error2">
			<span> <c:out value="${sessionScope.emp_cityid_valid_alert}" />
			</span>
		</div>
		<div id="emp_zip_valid_alert" class="error2">
			<span> <c:out value="${sessionScope.emp_zip_valid_alert}" />
			</span>
		</div>
		<div id="emp_phone1_valid_alert" class="error2">
			<span> <c:out value="${sessionScope.emp_phone1_valid_alert}" />
			</span>
		</div>
		<div id="emp_phone2_valid_alert" class="error2">
			<span> <c:out value="${sessionScope.emp_phone2_valid_alert}" />
			</span>
		</div>

		<div id="wrongAddDiv" class="error2">
			<span> <c:out
					value="${sessionScope.Application_ValidDiv_Alert}" />
			</span>
		</div>
		<div id="wrongAddLoc" class="error2">
			<span><c:out
					value="${sessionScope.Application_addValidLoc_Alert}" /> </span>
		</div>
		<div id="wrongAddGroup" class="error2">
			<span> <c:out
					value="${sessionScope.Application_wrongAddGroup}" />
			</span>
		</div>
		<div id="wrongAddDept" class="error2">
			<span><c:out value="${sessionScope.Application_wrongAddDept}" />
			</span>
		</div>
		<div id="alreadyAdd" class="error2">
			<span> <c:out value="${sessionScope.Buisness_added_Alert}" />
			</span>
		</div>
		<div id="wrongDivs" class="error2">
			<span> <c:out
					value="${sessionScope.Buisness_Devisions_Alert}" /> </span>
		</div>
		<div id="wrongLocs" class="error2">
			<span> <c:out value="${sessionScope.Buisness_Location_Alert}" />
			</span>
		</div>
		<div id="wrongGroups" class="error2">
			<span> <c:out value="${sessionScope.Buisness_Groups_Alert}" />
			</span>
		</div>
		<div id="wrongdepts" class="error2">
			<span> <c:out value="${sessionScope.Buisness_Deps_Alert}" />
			</span>
		</div>
		<div id="reportnotexistAlert" class="error2">
			<span> <c:out value="Reporting Name doesn't exist" />
			</span>
		</div>
		
	</body>
</html>
