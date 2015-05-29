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
  <script src="js/regulations/controls.js"></script>
  
  <link rel="stylesheet" href="css/jquery-ui.css">
  <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>

 <script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  
  <script type="text/javascript">

    
      $(function() {      
        $("#controlCatdata").autocomplete({
            source: function (request, response) {
                $.getJSON("controlCatList.ajaxresponse.htm", {
                   term: request.term
                }, response);
            }
        });
        
    }); 
    
      $(function() {      
        $("#businessProcess").autocomplete({
            source: function (request, response) {
                $.getJSON("businessProcessList.ajaxresponse.htm", {
                   term: request.term
                }, response);
            }
        });
        
    }); 
      
       function checkControl(control){
   
        		if(control!=='')
        			{
       										 $.get("checkcontrolCatname.org.htm?controlname=" + control, function(data, status)
														{	
														
															if(data == 'notexist')
															{
																$('#concategorynotexistAlert').show();
																$('#concategorynotexistAlert').delay(1500).fadeOut('slow');
																document.getElementById("controlCatdata").value="";	
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
        
           function checkbusiness(business){
       	 				if(business!=='')
       	 						{
       										 $.get("checkbusinessprocessname.org.htm?businessProc=" + business, function(data, status)
														{	
																	if(data == 'notexist')
																	{
																		$('#businessnotexistAlert').show();
																		$('#businessnotexistAlert').delay(1500).fadeOut('slow');
																		document.getElementById("businessProcess").value="";		
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
      <h2><c:out value="${sessionScope.addcontrol_page_header_edit}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.addcontrol_page_header_edit}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="controlapp" ng-controller="editcontrolController">
            <form ng-submit="saveData()">        
             
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addcontrol_page_controlid}"/><font color="red">*</font></label>
                    <input type="text" name="controlid"  id="controlid" class="form-control" ng-model="controlid" ng-init='controlid = "<c:out value="${controlid}"/>"' maxlength="25">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addcontrol_page_risk}"/></label>
                   
					<textarea rows="4" cols="10" name="risk" style="display:inline-block;" class="form-control" ng-model="risk" maxlength="250" ng-init="risk='<c:out value="${risk}"/>'"></textarea>
											<script>
											          CKEDITOR.replace( 'risk',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addcontrol_page_controlobjective}"/></label>
                   
					<textarea rows="4" cols="10" name="controlobjective" style="display:inline-block;" class="form-control" ng-model="controlobjective" maxlength="250" ng-init="controlobjective='<c:out value="${controlobjective}"/>'"></textarea>
											<script>
											          CKEDITOR.replace( 'controlobjective',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
             
             
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.addcontrol_page_controldesc}"/></label>
                   
					<textarea rows="4" cols="10" name="controldesc" style="display:inline-block;" class="form-control" ng-model="controldesc" maxlength="250" ng-init="controldesc='<c:out value="${controldesc}"/>'"></textarea>
											<script>
											          CKEDITOR.replace( 'controldesc',
														{
														  removePlugins: 'toolbar',
															height: '100px',
														} );
											            
											        </script>
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
                
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.Control_category}"/><font color="red">*</font></label>
                   
					      <input type="text" name="controlCatdata"  id="controlCatdata" class="form-control" ng-model="controlCatdata" ng-init="controlCatdata = '<c:out value="${controlcategoryID}"/>'"  onblur="return checkControl(this.value);">

                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
                <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.assets_buisness_process}"/><font color="red">*</font></label>
                   
					      <input type="text" name="businessProcess"  id="businessProcess" class="form-control" ng-model="businessProcess" ng-init="businessProcess = '<c:out value="${business}"/>'" onblur="return checkbusiness(this.value);">

                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
			</br>
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="control.reg.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="button" class="btn btn-default" ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
            </div>            
            </form>
           </div><!-- row --> 
            
            <!-- Reset Fields -->
            <input type="hidden" name="id"  id="id" class="form-control" ng-model="id"  value="<c:out value="${id}"/>">
            <input type="hidden" name="resetcontrolid"  id="resetcontrolid" class="form-control" ng-model="resetcontrolid" ng-init='resetcontrolid = "<c:out value="${controlid}"/>"'>
            <input type="hidden" name="resetrisk"  id="resetrisk" class="form-control" ng-model="resetrisk" ng-init='resetrisk = "<c:out value="${risk}"/>"'>
            <input type="hidden" name="resetcontrolobjective"  id="resetcontrolobjective" class="form-control" ng-model="resetcontrolobjective" ng-init='resetcontrolobjective = "<c:out value="${controlobjective}"/>"'>
            <input type="hidden" name="resetcontroldesc"  id="resetcontroldesc" class="form-control" ng-model="resetcontroldesc" ng-init='resetcontroldesc = "<c:out value="${controldesc}"/>"'>
            <!-- Reset Fields -->
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

<div id="controlidAlert" class="error2">
         <span > <c:out value="${sessionScope.controlidalert}"/></span>
</div>

<div id="controlidconfirmAlert" class="error2">
         <span > <c:out value="${sessionScope.controlidconfirmalert}"/></span>
</div>

<div id="validcontrolid_alert" class="error2">
         <span > <c:out value="${sessionScope.validcontrolid}"/></span>
</div>
<div id="concategorynotexistAlert" class="error2">
         <span > <c:out value="${sessionScope.concategorynotexistAlert}"/></span>
</div>
<div id="businessnotexistAlert" class="error2">
			<span><c:out value="${sessionScope.businessnotexistAlert}"/>
		</span>
</div>
<div id="controlCatAlert" class="error2">
         <span > <c:out value="${sessionScope.controlCatAlert}"/></span>
</div>
<div id="businessAlert" class="error2">
         <span > <c:out value="${sessionScope.businessAlert}"/></span>
</div>
</body>
</html>
