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
  <script src="js/masters/vendorcategory.js"></script>

  
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
      <h2>Edit Vendor Category</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">Edit Vendor Category</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="vendorCatApp" ng-controller="editVendorCatController">
            <form ng-submit="saveData()">        
             
                        
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.vendor_category_name}"/><font color="red">*</font></label>
                     <input type="hidden" name="catid" class="form-control" ng-model="catid"  ng-init="catid='<c:out value="${VendorCatID}"/>'"  maxlength="250" >
                    <input type="text" name="catname" id="catname"  class="form-control" ng-model="catname" ng-init='catname="<c:out value="${VendorCatName}"/>"' maxlength="250" >
                    <input type="hidden" name="catnamecheck" class="form-control" ng-model="catnamecheck" ng-init='catnamecheck="<c:out value="${VendorCatName}"/>"' maxlength="250" >
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row" style="display:none">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>                    
                    <input type="checkbox" name="isactive" ng-model="isactive" ng-checked="<c:out value="${IsActive}"/>"  ng-init='isactive = "<c:out value="${IsActive}"/>"'>
                   
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>			
            <div class="panel-footer">
                   <button class="btn btn-primary popup-open" type="submit" title="<c:out value="${sessionScope.button_submit}"/>"><c:out value="${sessionScope.button_submit}"/></button>
              <a href="vendorcategory.master.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.button_cancel}"/>"><c:out value="${sessionScope.button_cancel}"/></button></a>
			  <button type="button" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.button_reset}"/>"><c:out value="${sessionScope.button_reset}"/></button>
			  
            </div>            
            </form>
            
            <input type="hidden" name="resetvendor" id="resetvendor"  class="form-control" ng-model="resetvendor" ng-init='resetvendor="<c:out value="${VendorCatName}"/>"' maxlength="250" >
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
 <div  id="cAlert" class="error2">
         <span > <c:out value="${sessionScope.enter_vendor_category_name}"/> </span>
 </div>
<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_vendorcategory_validation}"/> </span>
 </div>
  <div  id="validcatname" class="error2">
         <span > <c:out value="${sessionScope.validcatname_alert}"/> </span>
 </div>
</body>
</html>
