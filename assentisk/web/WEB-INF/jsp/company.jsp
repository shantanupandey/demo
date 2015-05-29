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
  <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/organization/company.js"></script>
  <script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
  <script type="text/javascript">
  
  		$(function(){
  			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#company").addClass("active");
  		
  
                            $("#imageloader").css("display", "none");
    						$("#complete").css("display", "block");
		
            });
  
     	$(document).ready(function() {
     	
     	
     	
     	
     	$(".cke_top").css("display","none");
     	$('body').on('keydown', '#Legal_Contact_Number', function (e) {
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
   				 $('body').on('keydown', '#Primary_Contact_Number', function (e) {
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
   				 $('body').on('keydown', '#Accounts_Contact_Number', function (e) {
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

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="leftpanel.jsp" %>

  <div class="mainpanel">
     <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.Company_Header}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          
        </ol><br><br>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body">
            <form method="post" action="updateCompanyDetail.org.htm"  enctype="multipart/form-data" onsubmit="return validate();" id="form">       
             
             
             <div class="row">               
                <!-- col-sm-6 -->
                <div class="col-sm-6">
                  <div class="form-group">
                  <c:set var="salary" value="y hai salary"/>
				  
                    <label class="control-label"><c:out value="${sessionScope.Company_CompanyName}"/></label>                  
                    <input type="text" name="companyname" id="companyname" class="form-control" value="<c:out value="${CompanyName}"/>" readonly>
                  </div>
                </div><!-- col-sm-6 -->
                  <div class="col-sm-3">      
                  </div>
                <div class="col-sm-3">                 
                  
                   	<div id="original" style="display: none;">
                     <img width="150px;" height="100px;" align="right"  src="<c:url value="${CompanyLogo}"/>">
				</div>
				
				<div id="thumbnail">
                   <img width="150px;" height="100px;" align="right" src="images/loading.gif">
				</div>
				
                </div><!-- col-sm-6 -->
                
            </div>
              
            <div class="row">
             <div class="col-sm-6">
                  <div class="form-group">

                    <label class="control-label"><c:out value="${sessionScope.Company_Currency}"/></label>&nbsp;<font color="red">*</font>
					
                    <select class="form-control" name="currency" id="currency">
                    <option value=""><c:out value="${sessionScope.selectCurrency}"/></option>
                    	<c:forEach var="list" items="${currencyList}">
                    		<c:choose>
                    			<c:when test="${Currency == list.Currency}">
                    			<option value="<c:out value="${list.Currency}"/>" selected="selected"><c:out value="${list.Currency}"/>&nbsp;(<c:out value="${list.shortForm}"/>)</option>
                    			</c:when>
                    			<c:otherwise><option value="<c:out value="${list.Currency}"/>"><c:out value="${list.Currency}"/>&nbsp;(<c:out value="${list.shortForm}"/>)</option></c:otherwise>
                    		</c:choose>
                    	     
                    	</c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-sm-3">      
                  </div>
            	<div class="col-sm-3">
                  <div class="form-group">                                
                    <input type="file" name="logo" class="form-control" id="logo" align="right" style="margin-top:10px;">
                  </div>
                </div>
            </div>

               <input type="hidden" name="CompanyID" class="form-control" value="<c:out value="${CompanyID}"/>">
              
              
               <div class="row">
               <!-- col-sm-6 -->   
                </div>
               <br/>
               <div style="border: 1px solid #a1a1a1; padding: 10px 6px; width: 700px; border-square: 10px;"> 
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label><h4><c:out value="${sessionScope.Company_Address}"/></h4></label>                    
                  </div>
                </div><!-- col-sm-6 -->
               </div>
               <div>
                <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">

                  <label class="control-label"><c:out value="${sessionScope.Company_Headoffice}"/></label>&nbsp;<font color="red">*</font>                  
                    <textarea rows="4" cols="10" class="form-control"  maxlength="250" name="headOffice" id="headOffice"><c:out value="${HeadOffice_Address}"/></textarea>
							<script>
											           CKEDITOR.replace( 'headOffice',
														{
														  removePlugins: 'toolbar',
															height: '100px',
															enterMode : CKEDITOR.ENTER_BR,
       														shiftEnterMode: CKEDITOR.ENTER_P
														} );
											          
											          
											        </script>
                    
              

                  </div>
                </div><!-- col-sm-6 -->   
                </div>
                
                
               
               <div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Company_HeadCountry}"/>&nbsp;<font color="red">*</font>
												</label>
												<select class="form-control" id="countryid" onchange="callState(this.value)" name="country">
													<option value="">
														<c:out value="${sessionScope.selectCountry}"/>
													</option>
													<c:forEach var="list" items="${countryList}">
														
														<c:choose>
															<c:when test="${HeadOffice_Country == list.CountryID}">
															<option value="<c:out value="${list.CountryID}"/>" selected="selected">
															<c:out value="${list.CountryName}" />
														</option>
															</c:when>
															<c:otherwise><option value="<c:out value="${list.CountryID}"/>">
															<c:out value="${list.CountryName}" />
														</option></c:otherwise>
														</c:choose>
														
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
													<c:out value="${sessionScope.Company_HeadState}"/>&nbsp;<font color="red">*</font>
												</label>
												<span id="statelist"> <select class="form-control" id="stateid" name="stateid">
														
														<c:forEach var="list" items="${stateList}">
														
														<c:choose>
															<c:when test="${HeadOffice_State== list.StateID}">
															<option value="<c:out value="${list.StateID}"/>" selected="selected">
															<c:out value="${list.StateName}" />
														</option>
															</c:when>
															<c:otherwise><option value="<c:out value="${list.StateID}"/>">
															<c:out value="${list.StateName}" />
														</option></c:otherwise>
														</c:choose>
														
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
													<c:out value="${sessionScope.Company_HeadCity}"/>&nbsp;<font color="red">*</font>
												</label>
												
												 <input type="text" name="cityid" id="cityid" class="form-control" value="<c:out value="${HeadOffice_City}"/>" maxlength="100">
												
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
              
              <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">	<c:out value="${sessionScope.Company_HeadZip}"/></label>
                    <input type="text" name="zip" id="zip" class="form-control" value="<c:out value="${HeadOffice_Zip}"/>" maxlength="10">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
               <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">&nbsp;</label>
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
              </div>
               </div>
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">

                    <label><h4><c:out value="${sessionScope.Company_PrimaryContacts}"/></h4></label>                    

                  </div>
                </div><!-- col-sm-6 -->
               </div>
             
              <div style="border: 1px solid #a1a1a1; padding: 10px 6px; width: 700px; border-square: 10px;">
              <div class="row"> 
             <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryName}"/></label>&nbsp;<font color="red">*</font>
                    <input type="text" name="Primary_Contact_Name" id="Primary_Contact_Name" class="form-control" value="<c:out value="${Primary_Contact_Name}"/>"  maxlength="100">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
              <div class="row"> 
             <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryNumber}"/></label>&nbsp;<font color="red">*</font>
                    <input type="text" name="Primary_Contact_Number" id="Primary_Contact_Number" class="form-control" value="<c:out value="${Primary_Contact_Number}"/>"  maxlength="15">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
             <div class="row"> 
             <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_PrimaryEmail}"/></label><font color="red">*</font>
                    <input type="text" name="primaryEmail" id="primaryEmail" class="form-control" value="<c:out value="${PrimaryEmail}"/>">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
               <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">&nbsp;</label>
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
              </div>
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">

                    <label><h4><c:out value="${sessionScope.Company_LegalContacts}"/> &nbsp;&nbsp;&nbsp;<span style="margin-left: 86px;"><SMALL><c:out value="${sessionScope.company_sameAsPrimary}"/></SMALL></span>&nbsp;<span style="vertical-align: -2px;"><input type="checkbox" onclick="copyprimarytolegal()" id="copylegalfield"/></span></h4></label>                    

                  </div>
                </div><!-- col-sm-6 -->
               </div>
              
              <div style="border: 1px solid #a1a1a1; padding: 10px 6px; width: 700px; border-square: 10px;" >
              <div class="row">
              <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalName}"/></label><font color="red">*</font>
                    <input type="text" name="Legal_Contact_Name" id="Legal_Contact_Name" class="form-control" value="<c:out value="${Legal_Contact_Name}"/>"  maxlength="100">
                  </div>
                </div><!-- col-sm-6 --> 
              </div>
                
                <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalNumber}"/></label><font color="red">*</font>
                    <input type="text" name="Legal_Contact_Number" id="Legal_Contact_Number" class="form-control" value="<c:out value="${Legal_Contact_Number}"/>"  maxlength="15">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
                
                <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_LegalEmail}"/></label><font color="red">*</font>
                    <input type="text" name="Legal_Contact_Email" id="Legal_Contact_Email" class="form-control" value="<c:out value="${Legal_Contact_Email}"/>">
                  </div>
                </div><!-- col-sm-6 --> 
                </div>
                
                 <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">&nbsp;</label>
                  </div>
                </div><!-- col-sm-6 -->             
                </div><!-- row -->
                </div>
                
                
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">

                    <label><h4><c:out value="${sessionScope.Company_AccountContacts}"/> &nbsp; &nbsp;<span style="margin-left: 61px;"><SMALL><c:out value="${sessionScope.company_sameAsPrimary}"/></SMALL></span>&nbsp;<span style="vertical-align: -2px;"><input type="checkbox" onclick="copyprimarytoaccount()" id="copyaccountfield"/></span></h4></label>                    

                  </div>
                </div><!-- col-sm-6 -->
               </div>
               
                <div style="border: 1px solid #a1a1a1; padding: 10px 6px; width: 700px; border-square: 10px;">
                
                <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsName}"/></label><font color="red">*</font>
                    <input type="text" name="Accounts_Contact_Name" id="Accounts_Contact_Name" class="form-control" value="<c:out value="${Accounts_Contact_Name}"/>"  maxlength="100">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
               <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsContactNumber}"/></label><font color="red">*</font>
                    <input type="text" name="Accounts_Contact_Number" id="Accounts_Contact_Number" class="form-control"  value="<c:out value="${Accounts_Contact_Number}"/>"  maxlength="15">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
              
              
              
              <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Company_AccountsContactEmail}"/></label><font color="red">*</font>
                    <input type="text" name="Accounts_Contact_Email" id="Accounts_Contact_Email" class="form-control" value="<c:out value="${Accounts_Contact_Email}"/>">
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
              
               <div class="row">
                 <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">&nbsp;</label>
                  </div>
                </div><!-- col-sm-6 -->             
              </div><!-- row -->
             </div>
              
              <div class="row" style="display: none;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.IsActive}"/></label>
                    <input type="checkbox" name="isactive" id="isactive">
                    <input type="hidden" name="resetHeadOffice_Address" id="resetHeadOffice_Address"  value="<c:out value="${HeadOffice_Address}"/>">
                    
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			<br/>			
            <div class="panel-footer">
              <button class="btn btn-primary popup-open" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="companyview.org.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="reset" class="btn btn-default" onclick="resetValue();" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
               </div>     
            </form>
          </div>
        </div>
        
      </div>

      
        
      

    </div><!-- contentpanel -->
    

  </div><!-- mainpanel -->

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
         <span >  <c:out value="${sessionScope.success_message}"/> </span>
 </div>
 <div  id="cAlert" class="error2">
         <span > <c:out value="${sessionScope.company_name_alert}"/> </span>
 </div>
 <div  id="headAlert" class="error2">
         <span >  <c:out value="${sessionScope.company_head_office}"/> </span>
 </div>
 <div  id="countryAlert" class="error2">
         <span >  <c:out value="${sessionScope.company_country_alert}"/> </span>
 </div>
 <div  id="cityAlert" class="error2">
         <span > <c:out value="${sessionScope.company_city_alert}"/> </span>
 </div>
 <div  id="stateAlert" class="error2">
         <span ><c:out value="${sessionScope.company_state_alert}"/> </span>
 </div>
  <div  id="zipAlert" class="error2">
         <span ><c:out value="${sessionScope.company_zip_alert}"/></span>
 </div>
 <div  id="pNameAlert" class="error2">
         <span > <c:out value="${sessionScope.comapany_pc_name_alert}"/></span>
 </div>
 <div  id="pNumberAlert" class="error2">
         <span ><c:out value="${sessionScope.company_pcnumber_alert}"/></span>
 </div>
 <div  id="pEmailAlert" class="error2">
         <span ><c:out value="${sessionScope.company_pcemail_alert}"/></span>
 </div>
 <div  id="lNameAlert" class="error2">
         <span ><c:out value="${sessionScope.company_legalName_alert}"/></span>
 </div>
 <div  id="lNumberAlert" class="error2">
         <span > <c:out value="${sessionScope.company_legalNumber_alert}"/></span>
 </div>
 <div  id="lEmailAlert" class="error2">
         <span ><c:out value="${sessionScope.company_legalEmail_alert}"/> </span>
 </div>
 <div  id="aNameAlert" class="error2">
         <span ><c:out value="${sessionScope.company_acname_alert}"/></span>
 </div>
 <div  id="aNumberAlert" class="error2">
         <span ><c:out value="${sessionScope.company_acnumber_alert}"/></span>
 </div>
 <div  id="aEmailAlert" class="error2">
         <span ><c:out value="${sessionScope.company_acemail_alert}"/></span>
 </div>
 <div  id="currencyAlert" class="error2">
         <span ><c:out value="${sessionScope.company_currency_alert}"/></span>
 </div>
 <div  id="validzip" class="error2">
         <span ><c:out value="${sessionScope.company_validzip_alert}"/></span>
 </div>
 
 <div  id="validcity" class="error2">
         <span ><c:out value="${sessionScope.company_validcity_alert}"/></span>
 </div>
<div  id="validprimarycont" class="error2">
         <span ><c:out value="${sessionScope.company_validprimarycont_alert}"/></span>
 </div>
  <div  id="validphnvalid" class="error2">
         <span ><c:out value="${sessionScope.company_validphnvalid_alert}"/></span>
 </div>
 <div  id="validprimaryemail" class="error2">
         <span ><c:out value="${sessionScope.company_validprimaryemail_alert}"/></span>
 </div>
  <div  id="validlegalcont" class="error2">
         <span ><c:out value="${sessionScope.company_validlegalcont_alert}"/></span>
 </div>
 <div  id="validlegalPhvalid" class="error2">
         <span ><c:out value="${sessionScope.company_validlegalPhvalid_alert}"/></span>
 </div>
 <div  id="validlegalemail" class="error2">
         <span ><c:out value="${sessionScope.company_validlegalemail_alert}"/></span>
 </div>
 <div  id="validaccountcont" class="error2">
         <span ><c:out value="${sessionScope.company_validaccountcont_alert}"/></span>
 </div>
 <div  id="validaccountPhvalid" class="error2">
         <span ><c:out value="${sessionScope.company_validaccountPhvalid_alert}"/></span>
 </div>
  <div  id="validaccountemail" class="error2">
         <span ><c:out value="${sessionScope.company_validaccountemail_alert}"/></span>
 </div>
 
 <div  id="imageExtensionAlert" class="error2">
         <span ><c:out value="${sessionScope.imageExtensionAlert}"/></span>
 </div>
 
</body>
</html>
