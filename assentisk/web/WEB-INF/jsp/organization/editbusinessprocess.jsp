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
		<script src="js/organization/businessprocess.js"></script>
		
        <link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
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
	width:  448px;;
}
		.append_data {
			
			word-wrap: break-word; /* IE */
		}
		.append_data_loc {
			
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
     $(function() {      
        $("#testdata").autocomplete({
            source: function (request, response) {
                $.getJSON("divisionList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
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
var getdivision="";
$(document).ready(function(){ 

var edittestdiv=    $('#edittestdiv').val();
var edittestloc =    $('#edittestloc').val();
var edittestdep =    $('#edittestdep').val();
				if(edittestdiv!='')
				{
						 var editdiv=edittestdiv.split(',');
						 
								 for(var i=0;i < editdiv.length; i++)
								 {
								 		 $(".append_data").append('<div class="description_text">'+editdiv[i]+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
								 
								 }
				}
				if(edittestloc!='')
				{
						 var editloc=edittestloc.split(',');
								 for(var i=0;i < editloc.length; i++)
								 {
								 		 $(".append_data_loc").append('<div class="description_text_loc">'+editloc[i]+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
								 
								 }
				}
					if(edittestdep!='')
				{
						 var editDept=edittestdep.split(',');
								 for(var i=0;i < editDept.length; i++)
								 {
								 		 $(".append_data_dep").append('<div class="description_text_dep">'+editDept[i]+' <a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a></div>');
								 
								 }
				}
   
				$('.add_more').click(function()
                     {
                      	 var division = $('#testdata').val();
                      	 var testdivisiondata=$('#testdata').val() +",";
                      	 	 var testdivisiondata1=$('#testdata').val() +" ,";
                      	 var oldtestdiv= $('#oldtestdiv').val();
                         var divisiondata="";
                         var divDat="";
                         var myDivisions = document.getElementsByClassName("description_text");
                         document.getElementById("testdata").value='';		
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
                      	 var testlocationdata=$('#location').val() +",";
                      	 var testlocationdata1=$('#location').val() +" ,";
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
					$('.add_more_dep').click(function()
                     {
                      	 var department = $('#departments').val();
                      	 var testdepartmentdata=$('#departments').val() +",";
                      	  var testdepartmentdata1=$('#departments').val() +" ,";
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
});


                function cancelFun(){
				window.location.href = 'businessprocesses.org.htm';
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
					<c:out value="${sessionScope.editBuisnessHeader}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.editBuisnessHeader}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="businessprocessapp"
								ng-controller="editBusinessProcessController">
								<form ng-submit="saveData()">

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.BuisnessProcessName}"/><font color="red">*</font>
												</label>
												<input type="hidden" name="businessprocessid" class="form-control"
													ng-model="businessprocessid"  ng-init='businessprocessid = "<c:out value="${BusinessProcessID}"/>"'>
												<input type="text" name="businessprocessname" class="form-control"
													ng-model="businessprocessname" id="businessprocessname" ng-init='businessprocessname = "<c:out value="${BusinessProcessName}"/>"'  maxlength="100">
													
												<input type="hidden" name="businessprocessnamecheck" class="form-control"
													ng-model="businessprocessnamecheck"  ng-init='businessprocessnamecheck = "<c:out value="${BusinessProcessName}"/>"'>	
													
													
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.BuisnessProcessLocation}"/>
																
																</label>
																<input type="text" id="location" name="location"
																	class="form-control" ng-model="location">
															  <input type="hidden" id="edittestloc" name="edittestloc" value="<c:out value="${editLocationList}"/>" >
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
												<table border="0"  cellspacing="0"  class="append_data_table">
													<tbody class="append_data_loc"></tbody>
												</table>
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>





									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.BuisnessProcessDivision}"/>
																	
																</label>

																<input type="text" id="testdata" name="testdata"
																	class="form-control" ng-model="testdata">
																<input type="hidden" id="testdiv" name="testdiv">
																<input type="hidden" id="oldtestdiv" name="oldtestdiv"
																	value="<c:out value="${getDivisions}"/>">
																<input type="hidden" id="edittestdiv" name="edittestdiv"
																	value="<c:out value="${editDivisionList}"/>">
															
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
												<table border="0"  cellspacing="0"  class="append_data_table">
													<tbody class="append_data">
													</tbody>
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
																	<c:out value="${sessionScope.Employe_Department}"/>
																	
																</label>
																<input type="text" id="departments"  name="departments"
																	class="form-control" ng-model="departments">
																	
																<input type="hidden" id="testdep" name="testdep">
																<input type="hidden" id="oldtestdep" name="oldtestdep"
																	value="<c:out value="${getDepartments}"/>">
																 <input type="hidden" id="edittestdep" name="edittestdep" value="<c:out value="${editDeptList}"/>" >	
																	
															
														
																	<a href="javascript:void(0);" class="add_more_dep"><span class="add">+</span>
																	</a>
																
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<table border="0" cellspacing="0" class="append_data_table">
													<tbody class="append_data_dep"></tbody>
												</table>
											</div>
										</div>
									</div>

									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">

													<c:out value="${sessionScope.BuisnessProcessResponsibleHead}"/>

												</label>
												<input type="text" name="responsiblehead"
													class="form-control" ng-model="responsiblehead"
													id="responsiblehead" ng-init='responsiblehead = "<c:if test="${EmpName!='0'}"><c:out value="${EmpName}"/></c:if>"'>
													
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
												<input type="checkbox" name="isactive" ng-model="isactive"
													ng-init='isactive = 0' ng-checked="<c:out value="${IsActive}"/>">
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
								<input type="hidden" name="resetbusinessprocessname" class="form-control"
													ng-model="resetbusinessprocessname" id="resetbusinessprocessname" ng-init='resetbusinessprocessname = "<c:out value="${BusinessProcessName}"/>"'  maxlength="100">
								
								<input type="hidden" id="resetlocation" name="resetlocation"
																	class="form-control" ng-model="resetlocation">

								<input type="hidden" id="resettest" name="resettest"
																	class="form-control" ng-model="resettest">																	
								
								<input type="hidden" id="resetdepartments"  name="resetdepartments"
																	class="form-control" ng-model="resetdepartments">
								
								<input type="hidden" name="resetresponsiblehead"
													class="form-control" ng-model="resetresponsiblehead"
													id="resetresponsiblehead" ng-init='resetresponsiblehead = "<c:if test="${EmpName!='0'}"><c:out value="${EmpName}"/></c:if>"'>
																																				
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
		
				<div id="submitSucess" class="success">
						<span> <c:out value="${sessionScope.submitupdatealert}"/> </span>
					</div>
					<div id="busiAlert" class="error2">
						<span> <c:out value="${sessionScope.Buisness_Name_Alert}"/> </span>
					</div>
					<div id="lAlert" class="error2">
						<span> <c:out value="${sessionScope.Buisness_Location_Alert}"/> </span>
					</div>
					<div id="divAlert" class="error2">
						<span> <c:out value="${sessionScope.Buisness_Devisions_Alert}"/>  </span>
					</div>
					 <div id="alreadyAdd" class="error2">
        				 <span > <c:out value="${sessionScope.Buisness_added_Alert}"/></span>
					 </div>
					 <div id="wrongDivs" class="error2">
					         <span >  <c:out value="${sessionScope.Buisness_Devisions_Alert}"/></span>
					 </div>
					  <div id="wrongLocs" class="error2">
					         <span >  <c:out value="${sessionScope.Buisness_Location_Alert}"/> </span>
					 </div>
					 <div id="wrongAddDiv" class="error2">
					         <span ><c:out value="${sessionScope.Buisness_validDiv_Alert}"/></span>
					 </div>
					  <div id="wrongAddLoc" class="error2">
					         <span > <c:out value="${sessionScope.Buisness_validLoc_Alert}"/>  </span>
					 </div>
					 <div  id="divlocationAlert" class="error2">
					         <span > <c:out value="${sessionScope.Buisness_addLoc_Alert}"/></span>
					 </div>
					
					  
					 <div  id="divtestAlert" class="error2">
					         <span > <c:out value="${sessionScope.Buisness_AddDiv_Alert}"/></span>
					 </div>
					
					<div id="responsibleheadAlert" class="error2">
						<span> <c:out value="${sessionScope.Buisness_Resp_Head}"/> </span>
					</div>


<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_businessprocess_validation}"/> </span>
 </div>
 
 <div  id="validbusinessProc_alert" class="error2">
					         <span > <c:out value="${sessionScope.validbusinessProc_alert}"/></span>
					 </div>

 <div  id="checkResponsibleAlert" class="error2">
         <span > <c:out value="${sessionScope.responsible_head_message}"/> </span>
 </div>
 <div id="wrongdepts" class="error2">
			<span> <c:out value="${sessionScope.Buisness_Deps_Alert}" />
			</span>
		</div>
		<div id="wrongAddDept" class="error2">
			<span><c:out value="${sessionScope.Application_wrongAddDept}" />
			</span>
		</div>
 
	</body>
</html>