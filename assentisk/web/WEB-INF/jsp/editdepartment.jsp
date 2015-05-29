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
  <script src="js/organization/department.js"></script>
  <link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
				<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
  
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
      <h2><c:out value="${sessionScope.EditDepartmentHeader}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.EditDepartmentHeader}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="departmentapp" ng-controller="editDepartmentController">
            <form ng-submit="saveData()">        
             
              <input type="hidden" name="departmentid" class="form-control" ng-model="departmentid" ng-init='departmentid = "<c:out value="${DepartmentID}"/>"'>
              <div class="row" style="display: none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Company</label>
                      <select class="form-control" ng-model="companyid"  ng-init='companyid="<c:out value="${CompanyID}"/>"'>
                    	<c:forEach var="companyList" items="${companyList}">
                    		<option value="<c:out value="${companyList.CompanyID}"/>"><c:out value="${companyList.CompanyName}"/></option>	
                    	</c:forEach>
                     </select>
                    
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
              <div class="row" style="display:none">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Department_Location}"/><font color="red">*</font></label>  
                     <select class="form-control" ng-model="branchid" ng-init='branchid = "<c:out value="${BranchID}"/>"'> 
                     	<option value="">-- Select Location --</option>                    
                    	<c:forEach var="branchList" items="${branchList}">
                    		<option value="<c:out value="${branchList.LocationID}"/>"><c:out value="${branchList.Name}"/></option>	
                    	</c:forEach>
                    </select>                  
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Department_Name}"/><font color="red">*</font></label>                    
                    <input type="text" name="departmentname" id="departmentname" class="form-control" ng-model="departmentname"  ng-init='departmentname = "<c:out value="${DeptName}"/>"' maxlength="100">
                    <input type="hidden" name="departmentnamecheck" class="form-control" ng-model="departmentnamecheck"  ng-init='departmentnamecheck = "<c:out value="${DeptName}"/>"'>
                    <input type="hidden" name="departmentnamecheck" class="form-control" ng-model="departmentnamecheck"  ng-init='departmentnamecheck = "<c:out value="${DeptName}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Department_Description}"/></label>                                         
                     <textarea rows="4" cols="10" name="departmentdesc" id="departmentdesc" style="display:inline-block;" class="form-control" maxlength="250"><c:out value="${DeptDesc}"/></textarea>
											<script>
											          CKEDITOR.replace( 'departmentdesc',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
											        
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              <input type="hidden" name="resetDescription" id="resetDescription"  value="<c:out value="${DeptDesc}"/>">
            
              
              <div class="row" style="display: none;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.IsActive}"/></label>
                    <input type="checkbox" name="isactive" ng-model="isactive" ng-checked="<c:out value="${IsActive}"/>"  ng-init='isactive = "<c:out value="${IsActive}"/>"'>
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			<br/>			
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="department.org.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="button" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
            </div>            
            </form>
            
            <input type="hidden" name="resetdepartment" id="resetdepartment" class="form-control" ng-model="resetdepartment"  ng-init='resetdepartment = "<c:out value="${DeptName}"/>"' maxlength="100">
            <input type="hidden" name="resetdepartmentdesc" id="resetdepartmentdesc" class="form-control" ng-model="resetdepartmentdesc"  ng-init='resetdepartmentdesc = "<c:out value="${DeptDesc}"/>"'>
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
         <span ><c:out value="${sessionScope.submitupdatealert}"/></span>
</div>

<div  id="branchAlert" class="error2">
         <span >   <c:out value="${sessionScope.LocationAlert}"/></span>
</div>
<div  id="deptNameAlert" class="error2">
         <span >  <c:out value="${sessionScope.Department_alert}"/></span>
</div>

<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_department_validation}"/> </span>
 </div>
<div  id="validdepartmentname_alert" class="error2">
         <span >  <c:out value="${sessionScope.validdepartmentname_alert}"/></span>
</div>

</body>
</html>
