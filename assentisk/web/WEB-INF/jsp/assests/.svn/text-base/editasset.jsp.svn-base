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
      <h2><c:out value="${sessionScope.assetEdit}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.assetEdit}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="assetapp" ng-controller="editAssetsController">
            <form ng-submit="saveData()">        
             
                          
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_name}"/><font color="red">*</font></label>
                    <input type="hidden" name="assetID" class="form-control" ng-model="assetID" maxlength="250" ng-init='assetID="<c:out value="${ID}"/>"'>
                    <input type="text" name="assetname" class="form-control" id="assetname" ng-model="assetname" maxlength="250" ng-init='assetname="<c:out value="${aname}"/>"'>
                    <input type="hidden" name="assetnamecheck" class="form-control" ng-model="assetnamecheck" maxlength="250" ng-init='assetnamecheck="<c:out value="${aname}"/>"'>
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
                  	<c:choose>
                  		<c:when test="${type=='Returnable'}">
                  		<input type="radio" ng-model="type" value="Returnable" ng-checked="true"> <label class="control-label"> Returnable</label>
                    <input type="radio" ng-model="type" value="Not Returnable"> <label class="control-label"> Not Returnable </label>
                  		</c:when>
                  		<c:when test="${type=='Not Returnable'}">
                  		<input type="radio" ng-model="type" value="Returnable"> <label class="control-label"> Returnable</label>
                    <input type="radio" ng-model="type" value="Not Returnable"  ng-checked="true"> <label class="control-label"> Not Returnable </label>
                  		</c:when>
                  		<c:otherwise>
                  		<input type="radio" ng-model="type" value="Returnable"> <label class="control-label"> Returnable</label>
                    <input type="radio" ng-model="type" value="Not Returnable"> <label class="control-label"> Not Returnable </label>
                  		</c:otherwise>
                  	</c:choose>                   
                                      
                 
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
						<label class="control-label">
									<c:out value="${sessionScope.assets_vendor_name}"/>
						</label>
												
 						<input type="text" name="vendorname" class="form-control" ng-model="vendorname" id="vendorname" ng-init="vendorname='<c:out value="${vendorId}"/>'">
						
												
					</div>
			   </div>
										<!-- col-sm-6 -->
		 </div>
					
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_category}"/><font color="red">*</font></label>
                    <select class="form-control" ng-model="category" ng-init='category="<c:out value="${category}"/>"'>
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
                    <select class="form-control" ng-model="location" ng-init='location="<c:out value="${location}"/>"'>
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
                    <select class="form-control" ng-model="application" ng-init='application="<c:out value="${application}"/>"'>
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
                    <select class="form-control" ng-model="businessprocess" ng-init='businessprocess="<c:out value="${BP}"/>"'>
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
                    <input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead" ng-init="responsiblehead='<c:out value="${employee}"/>'">
                    
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets__initialvalues}"/></label>
                    <input type="text" name="initvalue" class="form-control" ng-model="initvalue" id="initvalue" ng-init="initvalue='<c:out value="${Initial_Values}"/>'">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_quantity}"/></label>
                    <input type="text" name="quantity" class="form-control" ng-model="quantity" id="quantity" ng-init="quantity='<c:out value="${quantity}"/>'"> 
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
			</br>			
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="assets.assets.htm"><button class="btn btn-primary" type="button" title="><c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="button" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
            </div>            
            </form>
            
            <!-- Reset fields -->
            
            <input type="hidden" name="resetasset" class="form-control" id="resetasset" ng-model="resetasset" maxlength="250" ng-init='resetasset="<c:out value="${aname}"/>"'>
            <input type="hidden" name="resettype" class="form-control" id="resettype" ng-model="resettype" maxlength="250" ng-init='resettype="<c:out value="${type}"/>"'>
            <input type="hidden" name="resetvendor" class="form-control" ng-model="resetvendor" id="resetvendor" ng-init="resetvendor='<c:out value="${vendorId}"/>'">
            <input type="hidden" name="resetcategory" class="form-control" ng-model="resetcategory" id="resetcategory" ng-init="resetcategory='<c:out value="${category}"/>'">
            <input type="hidden" name="resetlocation" class="form-control" ng-model="resetlocation" id="resetlocation" ng-init="resetlocation='<c:out value="${location}"/>'">
            <input type="hidden" name="resetapplication" class="form-control" ng-model="resetapplication" id="resetapplication" ng-init="resetapplication='<c:out value="${application}"/>'">
            <input type="hidden" name="resetbusinessprocess" class="form-control" ng-model="resetbusinessprocess" id="resetbusinessprocess" ng-init="resetbusinessprocess='<c:out value="${BP}"/>'">
            <input type="hidden" name="resetemployee" class="form-control" ng-model="resetemployee" id="resetemployee" ng-init="resetemployee='<c:out value="${employee}"/>'">
            <input type="hidden" name="resetinitvalue" class="form-control" ng-model="resetinitvalue" id="resetinitvalue" ng-init="resetinitvalue='<c:out value="${Initial_Values}"/>'">
            <input type="hidden" name="resetquantity" class="form-control" ng-model="resetquantity" id="resetquantity" ng-init="resetquantity='<c:out value="${quantity}"/>'">
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
			         <span > <c:out value="${sessionScope.submitupdatealert}"/></span>
			 </div>
			 
			  <div  id="assetAlert" class="error2">
			           <span > <c:out value="${sessionScope.assetNameAlert}"/></span>
			 </div>
			 
			 <div  id="categoryAlert" class="error2">
			        <span > <c:out value="${sessionScope.assetCategoryNameAlert}"/></span>
			 </div>
			 
<!--			  <div  id="locationAlert" class="error2">-->
<!--			          <span > <c:out value="${sessionScope.assetLocationNameAlert}"/> </span>-->
<!--			 </div>-->
<!---->
<!--  			<div  id="applicationAlert" class="error2">-->
<!--			        <span > <c:out value="${sessionScope.assetApplicationNameAlert}"/></span>-->
<!--			 </div>-->
<!--			 <div  id="businessProcessAlert" class="error2">-->
<!--			         <span > <c:out value="${sessionScope.assetBusinessProcessNameAlert}"/></span>-->
<!--			 </div>-->
			
		
			 <div id="alreadyAdd" class="error2">
			        <span > <c:out value="${sessionScope.assetAlreadyAlert}"/></span>
			 </div>
			<div id="characterAlert" class="error2">
        		<span > Special Characters are not allowed</span>
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
