<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c" %>
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
		<script src="js/assets/assets.js"></script>
		
		<link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
 		<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"/>
 		
 		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<script type="text/javascript">


    $(function() {      
        $("#vendorname").autocomplete({
            source: function (request, response) {
                $.getJSON("vendorList.ajaxresponse.htm", {
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
                $.getJSON("employeeList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
  
        
</script>
 
 <script type="text/javascript">

function deleteVendor() {
 	$("#addVendors").find('option:selected').remove();
   
}


</script>
 
  
 </head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.Asset_addAsset}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.Asset_addAsset}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="assetapp" ng-controller="addAssetsController">
            <form ng-submit="saveData()">        
             
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_name}"/><font color="red">*</font></label>
                    <input type="text" name="assetname" class="form-control" id="assetname" ng-model="assetname" maxlength="250" ng-init="assetname=''">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">
  <div class="col-sm-6">	
    <div class="form-group">&nbsp;</div>
  </div>
</div>

               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">                    
                    <input type="radio" ng-model="type" value="Returnable" ng-init="type=''"> <label class="control-label"> <c:out value="${sessionScope.assets_returnable}"/></label>
                    <input type="radio" ng-model="type" value="Not Returnable" ng-init="type=''"> <label class="control-label"> <c:out value="${sessionScope.assets_notreturnable}"/> </label>                  
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">
  <div class="col-sm-6">	
    <div class="form-group">&nbsp;</div>
  </div>
</div>
            		<!-- row -->
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label">
									<c:out value="${sessionScope.assets_vendor_name}"/>
						</label>
												
 						<input type="text" name="vendorname" class="form-control" ng-model="vendorname" id="vendorname" ng-init="vendorname=''">					
												
					</div>
			   </div>
										<!-- col-sm-6 -->
		 </div>
									<!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_category}"/><font color="red">*</font></label>
                    <select class="form-control" ng-model="category" ng-init="category=''">
                    <option value=""><c:out value="${sessionScope.selectCategory}"/></option>
                    	<c:forEach var="list" items="${categoryList}">
                    		<option value="<c:out value="${list.ID}"/>"><c:out value="${list.cname}"/></option>	
                    	</c:forEach>
                    </select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
             <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_location}"/></label>
                    <select class="form-control" ng-model="location" ng-init="location=''">
                    <option value=""><c:out value="${sessionScope.selectLocation}"/></option>
                    	<c:forEach var="list" items="${locationList}">
                    		<option value="<c:out value="${list.LocationID}"/>"><c:out value="${list.Name}"/></option>	
                    	</c:forEach>
                    </select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_application}"/></label>
                    <select class="form-control" ng-model="application" ng-init="application=''">
                    <option value=""><c:out value="${sessionScope.selectApplication}"/></option>
                    	<c:forEach var="list" items="${applicationList}">
                    		<option value="<c:out value="${list.ApplicationID}"/>"><c:out value="${list.ApplicationName}"/></option>	
                    	</c:forEach>
                    </select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_buisness_process}"/></label>
                    <select class="form-control" ng-model="businessprocess" ng-init="businessprocess=''">
                    <option value=""><c:out value="${sessionScope.selectBusiness}"/></option>
                    	<c:forEach var="list" items="${businessProcessList}">
                    		<option value="<c:out value="${list.BusinessProcessID}"/>"><c:out value="${list.BusinessProcessName}"/></option>	
                    	</c:forEach>
                    </select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_employe}"/></label>                    
                   <input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead" ng-init="responsiblehead=''">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets__initialvalues}"/></label>
                    <input type="text" name="initvalue" class="form-control" ng-model="initvalue" id="initvalue" ng-init="initvalue=''" maxlength="10">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_quantity}"/></label>
                    <input type="text" name="quantity" class="form-control" ng-model="quantity" id="quantity" ng-init="quantity=''" maxlength="10"> 
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
			</br>			
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="assets.assets.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="reset" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
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
			         <span > <c:out value="${sessionScope.SubmitAlert}"/></span>
			 </div>
			 
			  <div  id="assetAlert" class="error2">
			         <span > <c:out value="${sessionScope.assetNameAlert}"/></span>
			 </div>
			 
			 <div  id="categoryAlert" class="error2">
			         <span > <c:out value="${sessionScope.assetCategoryNameAlert}"/></span>
			 </div>
			 
<!--			  <div  id="locationAlert" class="error2">-->
<!--			         <span > <c:out value="${sessionScope.assetLocationNameAlert}"/> </span>-->
<!--			 </div>-->
<!---->
<!--  			<div  id="applicationAlert" class="error2">-->
<!--			         <span > <c:out value="${sessionScope.assetApplicationNameAlert}"/></span>-->
<!--			 </div>-->
<!--			 <div  id="businessProcessAlert" class="error2">-->
<!--			         <span > <c:out value="${sessionScope.assetBusinessProcessNameAlert}"/></span>-->
<!--			 </div>-->
			 		
			 <div id="alreadyAdd" class="error2">
			         <span > <c:out value="${sessionScope.assetAlreadyAlert}"/></span>
			 </div>
			 <div id="characterAlert" class="error2">
			         <span> <c:out value="${sessionScope.special_charater_valid}"/></span>
			 </div>
			 
			<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_asset_validation}"/> </span>
 </div>
 	 <div id="validvendorAlert" class="error2">
			         <span> <c:out value="${sessionScope.validvendorAlert}"/> </span>
			 </div>
<div  id="validassetAlert" class="error2">
         <span > <c:out value="${sessionScope.validassetAlert}"/> </span>
 </div>  
  <div id="validinitvalueAlert" class="error2">
			         <span> <c:out value="${sessionScope.validinitvalueAlert}"/> </span>
			 </div>
			   <div id="validquantityAlert" class="error2">
			         <span> <c:out value="${sessionScope.validquantityAlert}"/> </span>
			 </div>

</body>
</html>
