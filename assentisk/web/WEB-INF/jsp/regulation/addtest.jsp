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
  <script src="js/regulations/tests.js"></script>
  
  <link rel="stylesheet" href="css/jquery-ui.css">
  <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>

<script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
 <script src="js/ckfinder.js"></script>
 <script src="js/ckeditor.js"></script>
 
 <script src="js/config.js"></script>
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
      <h2><c:out value="${sessionScope.addtest_page_header}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.addtest_page_header}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="testapp" ng-controller="addtestController">
            <form ng-submit="saveData()">        
             
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addcontrol_page_controlid}"/><font color="red">*</font></label>
                    <select class="form-control" ng-model="controlid" ng-init="controlid=''">
													<option value="">
														-- Select Control --
													</option>
													<c:forEach var="list" items="${controlList}">
														<option value="<c:out value="${list.Control_ID}"/>">
															<c:out value="${list.Control_ID}" />
														</option>
													</c:forEach>
					</select>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addtest_page_teststep}"/></label>
                   
					<textarea rows="4" cols="10" name="editor" style="display:inline-block;" class="ckeditor" id="editor" ng-model="editor" maxlength="250" ng-init="editor''"></textarea>
						<script type="text/javascript">
						   CKEDITOR.replace( 'editor',
								{
									filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
									filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
									filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
									filebrowserUploadUrl : 'src/com/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
									filebrowserImageUploadUrl : 'src/com/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
									filebrowserFlashUploadUrl : 'src/com/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
									filebrowserWindowWidth : '1000',
								 	filebrowserWindowHeight : '700'
								});
						</script>	
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->                        
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <button onClick="location.href = 'test.reg.htm'" class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button>
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

<div id="controlidboxAlert" class="error2">
         <span > <c:out value="${sessionScope.controlidboxAlert}"/></span>
</div>


</body>
</html>
