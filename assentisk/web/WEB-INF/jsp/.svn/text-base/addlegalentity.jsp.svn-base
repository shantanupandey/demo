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
		<script src="js/organization/division.js"></script>

		<link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
				<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
		
				
				
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
      <h2><c:out value="${sessionScope.Devision_addDivision}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.Devision_addDivision}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="legalentityapp" ng-controller="addlegalentityController">
            <form ng-submit="saveData()">        
             
              
                 <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Devision_Name}"/><font color="red">*</font></label>
                    <input type="text" name="legalentityname" id="legalentityname" class="form-control" ng-model="legalentityname" maxlength="100" ng-init="legalentityname=''">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Devision_Description}"/><font color="red">*</font></label>
                    
                    
				<textarea rows="4" cols="10" name="legalentitydesc" style="display:inline-block;" class="form-control" ng-model="legalentitydesc" maxlength="250" ng-init="legalentitydesc=''"></textarea>
											<script>
											          CKEDITOR.replace( 'legalentitydesc',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
											        
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                         
               <div class="row" style="display: none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Company<font color="red">*</font></label>
                     <select class="form-control" id="companyid" ng-model="companyid" ng-init="companyid=''">
                     	<option value="">-- Select Company --</option>
                    	<c:forEach var="companyList" items="${companyList}">
                    		<option value="<c:out value="${companyList.CompanyID}"/>"><c:out value="${companyList.CompanyName}"/></option>	
                    	</c:forEach>
                    </select>
                    
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row" style="display: none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Division_Location}"/><font color="red">*</font></label>
                    
                    
                     <select class="form-control" id="branchid" ng-model="branchid" ng-init="branchid=''">
                     <option value="">-- Select Location --</option>
                     <c:forEach var="list" items="${branchList}">
                    		<option value="<c:out value="${list.LocationID}"/>"><c:out value="${list.Name}"/></option>	
                    	</c:forEach>
                      	
                    </select>
                
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
              
              
              <div class="row" style="display: none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Division_Department}"/><font color="red">*</font></label>
                    
                    <span id="departmentselect">
                    <select class="form-control" id="departmentid" ng-model="departmentid"  ng-init="departmentid=''">
                    	<option value="">-- Select Department --</option>
                     <c:forEach var="list" items="${departmentList}">
                    		<option value="<c:out value="${list.DepartmentID}"/>"><c:out value="${list.DeptName}"/></option>	
                    	</c:forEach>
                     
                   </select>
                    </span>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                             
             
              
               <div class="row" style="display:none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">CompanyPeriod</label>
                    <input type="text" name="companyperiodid" class="form-control" ng-model="companyperiodid"  ng-init='companyperiodid = 1'>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
             <div class="row" style="display: none;">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Division_RespHead}"/></label>
                    <input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row" style="display:none;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>
                            <input type="checkbox" name="isactive" ng-model="isactive"  ng-init='isactive = 1' ng-checked="1"> 
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="legalentities.org.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
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
<div  id="divNameAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_NameAlert}"/></span>
 </div>
 <div  id="divDescAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_DescriptionAlert}"/></span>
 </div>
 <div  id="divCompanyAlert" class="error2">
         <span >   <c:out value="${sessionScope.Division_CompanyAlert}"/></span>
 </div>
 <div  id="divBranchAlert" class="error2">
         <span >   <c:out value="${sessionScope.Division_BranchAlert}"/></span>
 </div>
  <div  id="divDeptAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_DepartmentAlert}"/></span>
 </div>
 <div  id="divRespAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_RespHeadAlert}"/></span>
         
         
         
         
         
 </div>
 
 <div  id="divBracnhAlert" class="error2">
         <span >  <c:out value="${sessionScope.Division_BranchAlert}"/></span>
 </div>
 <div id="characterAlert" class="error2">
			         <span > <c:out value="${sessionScope.div_specialCharacteralert}"/></span>
			 </div>

<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_division_validation}"/> </span>
 </div>
 
 <div  id="checkResponsibleAlert" class="error2">
         <span > <c:out value="${sessionScope.responsible_head_message}"/> </span>
 </div>
 
</body>
</html>
