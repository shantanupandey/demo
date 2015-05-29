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
  <script src="js/assets/category.js"></script> 
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
      <h2><c:out value="${sessionScope.edit_category}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.edit_category}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="categoryapp" ng-controller="editCategoryController">
            <form ng-submit="saveData()">        
             
                          
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.category_name}"/><font color="red">*</font></label>
                    <input type="hidden" name="categoryid" class="form-control" ng-model="categoryid" maxlength="250" ng-init='categoryid = "<c:out value="${ID}"/>"'>
                    <input type="text" name="categoryname" id="categoryname" class="form-control" ng-model="categoryname" maxlength="250" ng-init='categoryname = "<c:out value="${cname}"/>"'>
                    <input type="hidden" name="categorynamecheck" class="form-control" ng-model="categorynamecheck" maxlength="250" ng-init='categorynamecheck = "<c:out value="${cname}"/>"'>                    
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row" style="display:none">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.IsActive}"/></label>
                     <input type="checkbox" name="isactive" ng-model="isactive" ng-checked="<c:out value="${IsActive}"/>">
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>			
            <div class="panel-footer">
                 <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="categories.assets.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="button" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
            </div>            
            </form>
            
            <input type="hidden" name="resetcategory" id="resetcategory" class="form-control" ng-model="resetcategory" maxlength="250" ng-init='resetcategory = "<c:out value="${cname}"/>"'>
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
			         <span > <c:out value="${sessionScope.success_message}"/>  </span>
			 </div>
			 
			  <div  id="categoryAlert" class="error2">
			         <span > <c:out value="${sessionScope.enter_category_name}"/> </span>
			 </div>


<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_category_validation}"/> </span>
 </div>
   <div  id="validcategoryname" class="error2">
			         <span > <c:out value="${sessionScope.validcategoryname}"/> </span>
			 </div>


</body>
</html>
