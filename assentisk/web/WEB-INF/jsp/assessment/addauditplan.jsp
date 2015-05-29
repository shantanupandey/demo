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
  <script src="js/assessment/auditplan.js"></script>
  
  	<link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
 		
 		
 		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
 <style type="text/css">
 .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus {
    background: url("images/ui-bg_glass_75_dadada_1x400.png") repeat-x scroll 50% 50% #dadada !important;
    border: 1px solid #999999 !important;
    color: #212121 !important;
    font-weight: normal !important;
}
 </style>
<script type="text/javascript">

    
      $(function() {      
        $("#locationdata").autocomplete({
            source: function (request, response) {
                $.getJSON("locationList.ajaxresponse.htm", {
                   term: request.term
                }, response);
            }
        });
        
    }); 
    
    
       function checklocation(location){
        		if(location!=='')
        			{
       										 $.get("checklocationname.org.htm?locationname=" + location, function(data, status)
														{	
															if(data == 'notexist')
															{
																$('#locationnotexistAlert').show();
																$('#locationnotexistAlert').delay(1500).fadeOut('slow');
																document.getElementById("locationdata").value="";	
																return false;
															}
															else
															{
																return true;
															}
       													 });
       				 }
       				 else
       				 {
        					return true;
        			 }
        
        }
              
</script>


</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			
			
    <div class="pageheader">
      <h2><c:out value="${sessionScope.addauditplanHeader}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.addauditplanHeader}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="auditapp" ng-controller="addAuditController">
            <form ng-submit="saveData()">        
             
                        
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.auditname}"/><font color="red">*</font></label>
                    <input type="text" name="auditname"  id="auditname" class="form-control" ng-model="auditname" ng-init="auditname=''" maxlength="250">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              		<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												
																<label class="control-label">
																	<c:out value="${sessionScope.auditlocation}"/><font color="red">*</font>
																	
																</label>
																<input type="text" id="locationdata"  name="locationdata" class="form-control" ng-model="locationdata" ng-init="locationdata=''" >
														
																
													
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
								
              <div class="row" style="display:none;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>                    
                    <input type="checkbox" name="isactive" ng-model="isactive" ng-init="isactive=true">
                   
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>			
            <div class="panel-footer">
              <button class="btn btn-primary popup-open" type="submit" title="<c:out value="${sessionScope.button_submit}"/>"><c:out value="${sessionScope.button_submit}"/></button>
              <button onClick="location.href = 'auditplan.assess.htm'" class="btn btn-primary" type="button" title="<c:out value="${sessionScope.button_cancel}"/>"><c:out value="${sessionScope.button_cancel}"/></button>
           
			  <button type="reset" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.button_reset}"/>"><c:out value="${sessionScope.button_reset}"/></button>
			  
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
         <span > <c:out value="${sessionScope.success_message}"/> </span>
 </div>
 <div  id="auditAlert" class="error2">
         <span > <c:out value="${sessionScope.auditname_alert}"/> </span>
 </div>
  <div  id="validauditname" class="error2">
         <span > <c:out value="${sessionScope.auditname_valid_alert}"/> </span>
 </div>
  <div  id="validcountryname" class="error2">
         <span > <c:out value="${sessionScope.validcountryname}"/> </span>
 </div>
   <div  id="divlocationAlert" class="error2">
         <span ><c:out value="${sessionScope.Application_LocationAlert}"/></span>
 </div>
  <div id="wrongLocs" class="error2">
         <span > <c:out value="${sessionScope.Application_selectLoc_Alert}"/></span>
 </div>
  <div id="wrongAddLoc" class="error2">
         <span ><c:out value="${sessionScope.Application_addValidLoc_Alert}"/> </span>
 </div>
 <div id="alreadyAdd" class="error2">
         <span ><c:out value="${sessionScope.Application_AlreadyAddedAlert}"/></span>
 </div>
 <div id="locationnotexistAlert" class="error2">
			<span><c:out value="${sessionScope.auditLocationNotExistAlert}"/>
			</span>
		</div>
<div id="auditlocationAlert" class="error2">
			<span><c:out value="${sessionScope.auditlocationAlert}"/>
			</span>
</div>
</body>
</html>
