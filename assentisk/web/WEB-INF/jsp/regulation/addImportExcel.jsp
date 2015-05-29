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
  <script src="js/regulations/addImportExcel.js"></script>
  
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <script src="js/jquery-1.11.1.min.js"></script>
  <script>
  $(document).ready(function() {
   var temp1Val = document.getElementById("errorValuemsg").value;
   var temp1Va2 = document.getElementById("message").value;
   var temp1Va3 = document.getElementById("invalidmessage").value;
   var temp1Va4 = document.getElementById("controlErrorMessage").value;
   
    if(temp1Val!="null")
  		{
  		
  		$('#message12').show();
  		$('#message12').delay(1500).fadeOut('slow');
  		
  		}
  		
  	if(temp1Va2!="null")
  		{
  		$('#dialog-12').modal('show');  
        $('#SuccessMessage').html("Submitted Successfully");
  		}
	
	  if(temp1Va4!="null")
  		{
  	    $('#dialog-12').modal('show');
  	    temp1Va4=temp1Va4.replace("[", ""); 
  	      temp1Va4=temp1Va4.replace("]", ""); 
	    $('#ErrorMessage').html(temp1Va4);
  		}
	  
	  if(temp1Va3!="null")
  		{
        $('#dialog-12').modal('show');  
        $('#SuccessMessage').html("Submitted Successfully");		
        
  		}
	
	  });
	  
	 
	
	 
  </script>
  
 

</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

  <div class="mainpanel">
    <%@include file="/WEB-INF/jsp/header.jsp"%>
    
    <div class="modal fade" id="dialog-12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">Upload Risk Status</h4>
			     	<table id="uploaddataAlert" style="color:black;margin-top:20px;">
			 			
			 				<tr><td id="ErrorMessage"></td></tr>
			 				<tr><td id="SuccessMessage"></td></tr>
			 		</table>
			        
			      </div>
			      <div class="modal-body scheduler">
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.addImportExcel}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.addImportExcel}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="countryapp" ng-controller="addCountryController">
            <form name="homeForm" id="homeForm" action='importExcel.reg.htm' method="post" enctype="multipart/form-data" onsubmit="return fileExtVali()">
						&nbsp;
						  <div class="row">               
			                <div class="col-sm-6">
			                  <div class="form-group">
			                    <label class="control-label"><c:out value="${sessionScope.addImportFileName}"/><font color="red">*</font></label>
			                    <input type="text" name="fileName" id="fileName" class="form-control">
			                  </div>
			                </div><!-- col-sm-6 -->
			              </div><!-- row -->
			              
			               <div class="row">               
			                <div class="col-sm-6">
			                  <div class="form-group">
			                  &nbsp;
			                  </div>
			                </div><!-- col-sm-6 -->
			              </div><!-- row -->
			              
			                <div class="row">               
			                <div class="col-sm-6">
			                  <div class="form-group">
			                    <input type="file" name="myexcel" id="myexcel" />
								
			                  </div>
			                </div><!-- col-sm-6 -->
			              </div><!-- row -->
			              
			              <div class="row">               
			                <div class="col-sm-6">
			                  <div class="form-group">
			                  &nbsp;
			                  </div>
			                </div><!-- col-sm-6 -->
			              </div><!-- row -->
			              
			              <input type="button" value="<c:out value="${sessionScope.addImportUpload}"/>" class="btn btn-primary" onclick="checkValidation();" title="<c:out value="${sessionScope.addImportUpload}"/>"/>
						<input type="hidden" id="errorValuemsg" value="<%=request.getAttribute("errormessage")%>"/>
						<input type="hidden" id="message" value="<%=request.getAttribute("message")%>"/>
						<input type="hidden" id="invalidmessage" value="<%=request.getAttribute("invalidmsg")%>"/>
						<input type="hidden" id="controlErrorMessage" value="<%=request.getAttribute("controlErrorMessage")%>"/>
						
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
 <div  id="nameAlert" class="error2">
         <span > <c:out value="${sessionScope.addImportNameValid}"/></span>
 </div>
 
 <div  id="excelAlert" class="error2">
         <span >  <c:out value="${sessionScope.addImportUploadValid}"/> </span>
 </div>
 
 <div  id="formatAlert" class="error2">
         <span ><c:out value="${sessionScope.addImportFormatValid}"/></span>
 </div>
 
 <div  id="fileNameAlert" class="error2">
         <span ><c:out value="${sessionScope.existFileName}"/></span>
 </div>
 
 <div  id="message12" class="error2">
         <span ><c:out value="${sessionScope.Blankfile_message}"/></span>
 </div>
 
 <div  id="invalidData" class="error2">
         <span ><c:out value="${sessionScope.invalidData}"/></span>
 </div>

</body>
</html>
