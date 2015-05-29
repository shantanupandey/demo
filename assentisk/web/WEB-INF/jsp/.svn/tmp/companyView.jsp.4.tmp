<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.ico">

  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">
  <script src="js/angular.min.js"></script>
  <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>  
 <script src="js/passwordstrength/jquery-1.4.4.min.js" type="text/javascript"></script>
  
  <link href="css/jquery-ui.css" rel="stylesheet">
  <script src="js/jquery-ui.js"></script>
  
  
  <link href="css/jquery-ui.css" rel="stylesheet">
  
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
	height:4px;
	display:block;
	float:left;
	margin-bottom: 7px;
	display: none;
	font-size:10px;
}
#newpasswordDescription{
color: green;
font-size:10px;
}
#newpasswordBlank{
color:black;
font-size:10px;
}
#newpasswordStrength
{
	height:4px;
	display:block;
	float:left;
	margin-bottom: 7px;
	display: none;
	font-size:10px;
}
.strength0
{
	width:25px;
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
.control-label1{
color: #000;
    font-weight: bold;
    margin-right: 20px;
    min-width: 145px;
}


</style>

     
  <script>
  
function resetnewSpan()
{
	document.getElementById("newpasswordStrength").style.display='none';
	document.getElementById("newpasswordDescription").style.display='none';
	document.getElementById("newpasswordBlank").style.display='none';
}

  function passwordCheck(password)
  {
 
    var desc = new Array();
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
	document.getElementById("passwordBlank").style.display='inline-block';
	}
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
	 document.getElementById("passwordStrength").className = "strength" + score;
	 
	 }
 function NewpasswordCheck(password)
  {
 
    var desc = new Array();
	desc[0] = "Very Weak";
	desc[1] = "Weak";
	desc[2] = "Better";
	desc[3] = "Medium";
	desc[4] = "Strong";
	desc[5] = "Strongest";
	document.getElementById("newpasswordStrength").style.display='block';
	document.getElementById("newpasswordDescription").style.display='block';
	document.getElementById("retypePwd").style.display='block';
document.getElementById("newpasswordBlank").style.display='none';
	var score   = 0;
	if (password.length < 1){ document.getElementById("newpasswordStrength").style.display='none';
	document.getElementById("newpasswordDescription").style.display='none';
	document.getElementById("newpasswordBlank").style.display='block';
	}
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

	 document.getElementById("newpasswordDescription").innerHTML = desc[score];
	 document.getElementById("newpasswordStrength").className = "strength" + score;
	 
	 }
	
 
 	var companyapp = angular.module('companyapp', []);
	
	companyapp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
	}]);
	
	function editCompanyController($scope, $http) {
	$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#company").addClass

     ("active");

	  $("#imageloader").css("display", "none");
      $("#complete").css("display", "block");
		
 		   $scope.saveData = function(){ 	
 		   
 		    
            window.location.href = "companyedit.org.htm";
            
               		 	    		 			 		   	
 					
    		};
    		
    				
 		   $scope.savePasswordData = function() {
 		 
			var empPassword = $scope.empPassword;
			var oldPassword = $scope.oldPassword;
			var newPassword = $scope.newPassword;
			var retypePassword =$scope.retypePassword;

		
				var responsePromise = $http
						.post("savePassword.org.htm?newPassword="
								+ $scope.retypePassword);
				responsePromise
						.success(function(data, status, headers, config) 

{
								$('#divSuccessAlert').show();
				                $('#divSuccessAlert').delay(1500).fadeOut

('slow');
				                window.location.href = "companyview.org.htm";
						});

			
		};
    
	}
	

	
	function reset()
	{
	
			document.getElementById("oldPassword").value="";
			document.getElementById("newPassword").value="";
			document.getElementById("retypePassword").value="";
	}
	
	function changepassword()
	{
		document.getElementById("oldPwd").style.display = "block";
		document.getElementById("newPwd").style.display = "block";
		document.getElementById("retypePwd").style.display = "block";
		document.getElementById("changepasswordbtn").style.display = "none";
		document.getElementById("updatepasswordbtn").style.display = "block";
	}
	 function updatepassword()
  {	
	var empPassword = document.getElementById("password").value;
	var newpassword = document.getElementById("newpassword").value;
	var repassword = document.getElementById("repassword").value;
	
	if(empPassword == '')
	{
	
	 $('#divOldAlert').show();
	$('#divOldAlert').delay(1500).fadeOut('slow');  
	}
	else if(newpassword == '')
	{
	 $('#divNewAlert').show();
	 $('#divNewAlert').delay(1500).fadeOut('slow');  
	}
	else if(empPassword == newpassword){
	 	$('#divsamepassAlert').show();
	 	$('#divsamepassAlert').delay(1500).fadeOut('slow');  
	}
	else if(newpassword != '' && newpassword.length < 8){
	 $('#divNewlenAlert').show();
	 $('#divNewlenAlert').delay(1500).fadeOut('slow');  
	 document.getElementById("newpassword").focus();
	}
	else if(repassword == ''){
	   $('#divretypeAlert').show();
	   $('#divretypeAlert').delay(1500).fadeOut('slow');
   
   }

   else if(newpassword != repassword){
   $('#divErrorPwdAlert').show();
   $('#divErrorPwdAlert').delay(1500).fadeOut('slow');
   
   }
	else
	{	
	$.post("checkoldPassword.org.htm?empPassword="+empPassword,
 					 function(data,status){
 					 				
 						if(data == 'notexist')
 						{
 						  $('#checkoldpasswordAlert').show();
					      $('#checkoldpasswordAlert').delay(1500).fadeOut('slow');
 						}
 						else
 						{
 						$.post("savePassword.org.htm?newPassword="+newpassword,
 					 function(data,status){
 									
 					 $('#divSuccessAlert').show();
					 $('#divSuccessAlert').delay(1500).fadeOut('slow');  
					  			  
  				});
 						}				
 					   
					  			  
  				});
		
	
	}
}

window.onload = function()
{
	$('#thumbnail').delay(500).fadeOut('slow');
	document.getElementById("thumbnail").style.display = "none";
	document.getElementById("original").style.display = "block";
	
}

</script>

  
  
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body  class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="leftpanel.jsp" %>

  <div class="mainpanel">
     <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.Company_Header}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/></span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
         
          
        </ol><br>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="companyapp" ng-controller="editCompanyController">
            <form ng-submit="saveData()"> 
               <input type="hidden" name="CompanyID" class="form-control" ng-model="CompanyID" ng-init='CompanyID = "<c:out value="${CompanyID}"/>"'>
              <div class="row">               
                  
           
                <div class="col-sm-6">
           
              
               <p class="form-row">               
                    <label class="control-label"><c:out value="${sessionScope.Company_Header}"/></label>                    
                    <input type="hidden" name="companyname" class="form-control" ng-model="companyname" required="required" ng-init='companyname = "<c:out value="${CompanyName}"/>"'>
                   <c:out value="${CompanyName}"/>
               </p>
               
                   <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_Currency}"/></label>
                   <c:out value="${Currency}"/>&nbsp;(<c:out value="${shortForm}"/>)
                  </p>

                  <h4><c:out value="${sessionScope.Company_Address}"/></h4>                    
               </div>
               
               <div class="col-sm-6">
               
               	
				
				 <div id="original" style="display: none;">
                     <img width="150px;" height="100px;" align="right"  src="companylogo/<c:url value="${CompanyLogo}"/>">
				</div>
				
				<div id="thumbnail">
                   <img width="150px;" height="100px;" align="right" src="images/loading.gif">
				</div>
				
                </div><!-- col-sm-6 -->
                              
                </div>
   
                <div class="gray">
                
                  <p class="form-row">  
                    <label class="control-label" style="float: left;"><c:out value="${sessionScope.Company_Headoffice}"/></label>
                    <span style="float: left;"><c:out value="${HeadOffice_Address}" escapeXml="false"/></span>
                 </p>
                
                 <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_HeadCountry}"/></label>
                    <c:out value="${CountryName}"/>
                 </p>
                
                                
                 <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_HeadCity}"/></label>
                   <c:out value="${HeadOffice_City}"/>
                  </p>
              
               <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_HeadState}"/></label>
                   
                    <c:out value="${StateName}"/>
                  </p>
              
               <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_HeadZip}"/></label> 
                    <c:out value="${HeadOffice_Zip}"/>
                </p>
             </div>
             
              
             	<p class="form-row">  
                   <h4><c:out value="${sessionScope.Company_PrimaryContacts}"/></h4>                  
                 </p>
             <div class="gray">
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryName}"/></label>
                    
                    <c:out value="${Primary_Contact_Name}"/>
               </p>
              
               <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryNumber}"/></label>
                    
                   <c:out value="${Primary_Contact_Number}"/>
                 </p>
              
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryEmail}"/></label>
                    
                   <c:out value="${PrimaryEmail}"/>
                 </p>
              
              
              </div>
              
              
                  <h4><c:out value="${sessionScope.Company_LegalContacts}"/></h4>                   
                 
              
              <div class="gray">
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalName}"/></label>
                    <c:out value="${Legal_Contact_Name}"/>
                  </p>  
              
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalNumber}"/></label>
                    
                    <c:out value="${Legal_Contact_Number}"/>
                 </p>
              
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalEmail}"/></label>
                    
                    <c:out value="${Legal_Contact_Email}"/>
                  </p>
              
              </div>
              
               <p class="form-row">  
                    <label><h4><c:out value="${sessionScope.Company_AccountContacts}"/></h4></label>                    
                 </p>
              
               <div class="gray">
              <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsName}"/></label>
                    
                   <c:out value="${Accounts_Contact_Name}"/>
                 </p>
              
               <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsContactNumber}"/></label>
                    
                   <c:out value="${Accounts_Contact_Number}"/>
                </p>
              
             <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsContactEmail}"/></label>
                    
                   <c:out value="${Accounts_Contact_Email}"/>
                 </p>
              
              </div>
              
                  
                    <h4><c:out value="${sessionScope.company_licenseDetail}"/></h4>                   
                 
              
               <div class="gray">
               <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.company_lastupdated}"/></label>
                    
                    <c:forEach var="license" items="${license}" varStatus="status">
                    	  <c:out value="${license.ModifiedDate}"/>
                    </c:forEach>
                                     
                 </p>
               
                <p class="form-row">  
                    
                    <label class="control-label"><c:out value="${sessionScope.company_expiry}"/></label>
                   
                    <c:forEach var="license" items="${license}" varStatus="status">
                    	  <c:out value="${license.expiryDate}"/>
                    </c:forEach>
                                    
                 </p>
               
                <p class="form-row">  
                   
                    <label class="control-label"><c:out value="${sessionScope.company_availableuser}"/></label>
                   
                    <c:forEach var="license" items="${license}" varStatus="status">
                    	  <c:out value="${license.MaxUser}"/>
                    </c:forEach>
                                   
                  </p>
              
              
                <p class="form-row">  
                   
                    <label class="control-label"><c:out value="${sessionScope.company_licenseto}"/></label>
                    
                    <c:forEach var="license" items="${license}" varStatus="status">
                    	  <c:out value="${license.licenseTo}"/>
                    </c:forEach>
                                  
                </p>
               
              </div>
              
              <h4><c:out value="${sessionScope.company_admindetail_header}"/></h4> 
              
              <div class="gray">
                <p class="form-row">  
                    <label class="control-label"><c:out value="${sessionScope.company_username}"/></label>
                  
                    <c:forEach var="admin" items="${getAdminDetails}" varStatus="status">
                    	  <c:out value="${admin.EmpUsername}"/>
                    </c:forEach>
                                    
                 </p>
                 
               <div class="form-row" id="oldPwd" style="display: none;margin-bottom: 10px;">  
              	 <div class="col-sm-6" style="padding-left: 0;">
                	 <label class="control-label1"><c:out value="${sessionScope.Old_Password}"/></label>
                  	 <input type="password" value="<c:out value="${admin.EmpPassword}"/>" id="password" maxlength="20" />
                    </div>
                   
                  </div>     
                 
                 <div id="newPwd" class="form-row" style="display: none;margin-bottom: 10px;">  
              		 <div class="col-sm-6" style="padding-left: 0;">
                		 <label class="control-label1"><c:out value="${sessionScope.New_Password}"/></label>                  
                 		 <input type="password" value="" id="newpassword" maxlength="20" onkeyup="NewpasswordCheck(this.value);"/>
                	 </div>
               		 <div class="col-sm-6">
                 		<div id="newpasswordDescription"></div>
						<div id="newpasswordBlank" >Use at least 8 characters. Don't use a password from another site, or something too obvious like your pets name.</div>
						<div id="newpasswordStrength" class="strength0"> </div>
					</div>
                  <br>
						
						 
                 </div>
                  <div id="retypePwd" class="form-row" style="display: none;margin-bottom: 10px;">  
                   <div class="col-sm-6" style="padding-left: 0;">
                	 <label class="control-label1"><c:out value="${sessionScope.retypePassword}"/></label>
                	 <input type="password" value="" id="repassword" maxlength="20"  onkeyup="resetnewSpan();"/>
                  </div>
                  
                 </div>
                 
                 
                 
                 <p class="form-row" id="changepasswordbtn">
                   <button type="button" class="btn btn-primary" onclick="changepassword();" title="<c:out value="${sessionScope.company_changepwd}"/>"><c:out value="${sessionScope.company_changepwd}"/></button>
                   </p> 
                   
                   <p class="form-row" id="updatepasswordbtn" style="display: none;">
                   <button type="button" class="btn btn-primary" onclick="updatepassword();" title="<c:out value="Update"/>"><c:out value="Update"/></button>
                   </p>
                   
                 </div>
               
<!--               <div style="background:#E0E0E0;width: 700px;" >-->
<!--                <div class="row">-->
<!--                <div class="col-sm-6">-->
<!--                  <div class="form-group">-->
<!--                   <a href="changepassword.org.htm">Change Password</a>-->
<!--                  </div>-->
<!--                </div>             -->
<!--              </div>  -->
<!--               -->
             
             </br>
            	<div class="panel-footer">
              
			 
			 
			 <c:if test="${sessionScope.edit_mod_4=='1'}">
			  	<button type="reset" class="btn btn-primary" ng-click="saveData()" title="<c:out value="${sessionScope.edit}"/>"><c:out value="${sessionScope.edit}"/></button>
             </c:if>
             
                    </div>
         
               </form> 
              </div>
             
             
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label>&nbsp;</label>                    
                  </div>
                </div><!-- col-sm-6 -->
               </div>
               
						
            
            
             	
            
            
            
            
         
            <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                   &nbsp;
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
              
              
        </div>
        
      </div>

      

      

    </div><!-- contentpanel -->

  </div><!-- mainpanel -->

  </div>
 
<div class="modal fade" id="dialog-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Action</h4>
      </div>
      <div class="modal-body">
      
 	<img width="150px;" height="100px;" align="right" src="viewimage.org.htm?id=1" >
       
      </div>
      <div class="modal-footer">
       <button type="button"  class="btn btn-default"  onclick="reset();">Reset</button>
         <button type="button" class="btn btn-default" style="display:none" data-dismiss="modal" id="cldailog">Close</button>
        <button type="button" class="btn btn-primary" onclick="savecomment();">Save</button>
      </div>
    </div>
  </div>
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

<div  id="divOldAlert" class="error2">
         <span >Enter Old Password</span>
 </div>
 <div  id="divNewAlert" class="error2">
         <span ><c:out value="${sessionScope.newPwd_alert}"/></span>
 </div>
 <div  id="divretypeAlert" class="error2">
         <span > <c:out value="${sessionScope.retypePwd_alert}"/></span>
 </div>
 <div  id="divFalsePwdAlert" class="error2">
         <span ><c:out value="${sessionScope.dontmatch_alrt}"/></span>
 </div>
 <div  id="divErrorPwdAlert" class="error2">
         <span ><c:out value="${sessionScope.oldnoMatch_alrt}"/></span>
 </div>
 <div  id="divSuccessAlert" class="success">
         <span ><c:out value="${sessionScope.passwrd_successfully}"/></span>
 </div>
 <div  id="divLengthAlert" class="error2">
         <span ><c:out value="${sessionScope.divLengthAlert}"/></span>
 </div>

 <div  id="checkoldpasswordAlert" class="error2">
         <span ><c:out value="${sessionScope.checkoldpasswordAlert}"/></span>
 </div>
 
 <div  id="divNewlenAlert" class="error2">
         <span ><c:out value="${sessionScope.divNewlenAlert}"/></span>
 </div>
 <div  id="divsamepassAlert" class="error2">
         <span ><c:out value="${sessionScope.divsamepassAlert}"/></span>
 </div>
</body>
</html>
