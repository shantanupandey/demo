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
		
		<script>
		$(document).ready(function(){ 
	$("div.leftpanelinner>ul>li#policy").css("background","#012345");
	});
function $id(id) {
  return document.getElementById(id);
}

function convert() {

  var fileSize=document.getElementById("file").files.length;
  
  if(fileSize > 0){
  var selected_file = $id('file').files[0];
  var reader = new FileReader();
  var filedata=document.getElementById("filedata").value;
  reader.onload = function(aEvent) {
 	 if(filedata=='1')
 	 {
    var binaryString = aEvent.target.result;
    
    document.getElementById("containerdata").innerHTML = binaryString;
    convertToPDF(btoa(aEvent.target.result));
    }
    else
    {
    
    $('#fileUploadAlert').show();
    $('#fileUploadAlert').delay(1500).fadeOut('slow');
    }

  };

  // reader.readAsArrayBuffer(selected_file);
  reader.readAsBinaryString(selected_file);
  }else{
    $('#fileEmptyAlert').show();
    $('#fileEmptyAlert').delay(1500).fadeOut('slow');
  }
  
  
}

function convertToPDF(aDocxContent) {
  var content = docx(aDocxContent);
    //Display the contents of the doc file in an alert (This includes metadata stuff too):
  $id('containerdata').textContent = '';
  console.log('content length: ' + content.DOM.length);
  while (content.DOM.length > 0) {
    var node = content.DOM[0];
    $id('containerdata').appendChild(node);
  }
}

window.addEventListener('load', function() {
  document.getElementById('convert').onclick = convert;
});
</script>
		
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

     $(function() {      
        $("#responsiblehead").autocomplete({
            source: function (request, response) {
                $.getJSON("employeeBracketListunique.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
  
        
</script>
<script type="text/javascript">
var getdivision="";
$(document).ready(function(){ 

			$("div.leftpanelinner>ul>li#policy").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#policy>ul").css("display","block");
			$("div.leftpanelinner>ul>li#policy>ul>li#policies").addClass("active");
			$("#imageloader").css("display", "none");
      		$("#complete").css("display", "block");
				
			var edittestloc =    $('#edittestloc').val();
			var edittestdep =    $('#edittestdep').val();

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
				
	
   				 
   				
				
				
});
function verify()
{
	var title= document.getElementById("title").value;
	 	var containerdata= document.getElementById("containerdata").innerHTML;

		var deptdata = "";
		var deptDat = "";
		var myDepts = document.getElementsByClassName("description_text_dep");
		var responsibleHead=document.getElementById("responsiblehead").value;
		
		for ( var i = 0; i < myDepts.length; i++) {

			deptDat = myDepts[i].innerHTML.replace(
					'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");

			if (i == myDepts.length - 1) {
				deptdata = deptdata + deptDat;
			} else {
				deptdata = deptdata + deptDat + "','";
			}
		}
	
		var locationdata = "";
		var locDat = "";
		var myLocations = document
				.getElementsByClassName("description_text_loc");
		for ( var i = 0; i < myLocations.length; i++) {

			locDat = myLocations[i].innerHTML.replace(
					'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");

			if (i == myLocations.length - 1) {
				locationdata = locationdata + locDat;
			} else {
				locationdata = locationdata + locDat + "','";
			}
		}
		
		
		document.getElementById("departmentdataval").value=deptdata;
		
		document.getElementById("locationdataval").value=locationdata;
		
		document.getElementById("textvalue").innerHTML=containerdata;
		var flag='0';		
		
	if(title == ''){
			$('#titleAlert').show();
			$('#titleAlert').delay(1500).fadeOut('slow');
			document.getElementById("title").focus();
			return false;
	
	}
	else if (locationdata == '' || locationdata == undefined) {
			$('#lAlert').show();
			$('#lAlert').delay(1500).fadeOut('slow');

			document.getElementById("location").focus();
	}
	else if (deptdata == '' || deptdata == undefined) {
			$('#depAlert').show();
			$('#depAlert').delay(1500).fadeOut('slow');
			document.getElementById("departments").focus();

	}
		else if(responsiblehead==''){
			$('#checkResponsibleAlert').show();
			$('#checkResponsibleAlert').delay(1500).fadeOut('slow');
			document.getElementById("responsiblehead").focus();
			return false;
	}
	else if(responsiblehead!=''){
			$.get("checkreportingname.org.htm?reporting=" + responsibleHead, function(data, status) {
													
													if(data == "exist")
													{ 
														flag = 1;
														return true;
													}
													else
													{
														$('#checkResponsibleAlert').show();
														$('#checkResponsibleAlert').delay(1500).fadeOut('slow');
														document.getElementById("responsiblehead").value="";
														return false;
														
													}
					});	
			
	}
	else
	{
	
									
	    return true;
    }
}

function validate_fileupload(fileName)
{
    
    var fileSize=$("#file")[0].files[0].size;
    
    if(fileSize<5000000){
    var allowed_extensions = new Array("docx","txt");
    var file_extension = fileName.split('.').pop(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

    for(var i = 0; i <= allowed_extensions.length; i++)
    {
        if(allowed_extensions[i]==file_extension)
        {
           document.getElementById("filedata").value="1";
            return true; // valid file extension
        }
    }
    $('#fileUploadAlert').show();
    $('#fileUploadAlert').delay(1500).fadeOut('slow');
     document.getElementById("filedata").value="0";
    return false;
    }else{
    $('#bigFileAlert').show();
    $('#bigFileAlert').delay(1500).fadeOut('slow');
    document.getElementById('file').value= null;
    }
    
}

function reset(){

document.getElementById("title").value=document.getElementById("resettitle").value;
document.getElementById("responsiblehead").value=document.getElementById("resetresponsiblehead").value;
}
</script>
</head>


<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.editpolicy}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.editpolicy}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" >
								<form action="updatepolicy.assess.htm" method="POST" onsubmit="return verify();" >
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.policy_title}"/><font color="red">*</font>
												</label>
												<input type="text" name="title" id="title" class="form-control"
													ng-model="title" maxlength="250" value="<c:out value="${title}"/>">
													
																				<textarea style="display:none;" id="textvalue" name="textvalue"></textarea>
											<input type="hidden" name="resettitle" id="resettitle" class="form-control"
													ng-model="resettitle" maxlength="250" value="<c:out value="${title}"/>">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									
									<input type="hidden" id="policyno" name="policyno"
																	value="<c:out value="${policyno}"/>">
								
									
									
															
									
										<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.Employe_Department}"/>
																	<font color="red">*</font>
																</label>
																<input type="text" id="departments"  name="departments"
																	class="form-control" ng-model="departments">
																																	<input type="hidden" id="departmentdataval" name="departmentdataval">
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

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.employeLocations}"/>
																	<font color="red">*</font>
																</label>
																<input type="text" id="location"  name="location"
																	class="form-control" ng-model="location">
																																		<input type="hidden" id="locationdataval" name="locationdataval">
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
												<table border="0"  cellspacing="0" class="append_data_table">
										   <tbody class="append_data_loc"></tbody>									    
										</table>
										</div></div>
										</div>
									

													
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Application_ResponsibleHead}"/><font color="red">*</font>
												</label>
 												<input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead" value="<c:out value="${responsibleHead}"/>">
												<input type="hidden" name="resetresponsiblehead" id="resetresponsiblehead" class="form-control"
													ng-model="resetresponsiblehead" maxlength="250" value="<c:out value="${responsibleHead}"/>">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
								
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
											
															<label class="control-label">
																<c:out value="${sessionScope.policy_test}" />
															</label>
															
															<table>
													<tr>
														
														<td>
														   <input type="hidden" id="filedata" name="filedata">
															<input type="file" id="file" onchange="validate_fileupload(this.value);"/>
														</td>
														<td>
															<input type="button" id="convert" value="upload" />
														</td>
													</tr>
												</table>




											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-8">
										  <div id="containerdata" style="width: 400pt; height: 503pt; overflow:scroll;color:black;border: 1px #000 solid; margin-top: 10px;" contenteditable="true" >
												<c:out value="${textdata}"/>
										</div>
										</div>
										</div>
										
									</br></br>
									<!-- row -->
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
										
										<button onClick="location.href = 'policy.assess.htm'"
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
			<span> <c:out value="${sessionScope.submitupdatealert}"/> </span>
		</div>
		<div id="titleAlert" class="error2">
			<span> <c:out value="${sessionScope.titleAlert}" /> </span>
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
		<div id="fileUploadAlert" class="error2">
			<span> <c:out value="${sessionScope.fileUploadAlert}" />
			</span>
		</div>
		<div id="fileEmptyAlert" class="error2">
			<span> Empty File Can't Be Uploaded.
			</span>
		</div>
		<div id="bigFileAlert" class="error2">
			<span>File Size Exceed from 5 MB.
			</span>
		</div>
	 <div  id="checkResponsibleAlert" class="error2">
         <span > <c:out value="${sessionScope.responsible_head_message}"/> </span>
 	</div>
 	<div id="lAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_location_Alert}" />
			</span>
		</div>
		
		<div id="depAlert" class="error2">
			<span> <c:out value="${sessionScope.Employe_department_Alert}" />
			</span>
		</div>
	</body>
	
</html>
