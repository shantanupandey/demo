<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">

  <style>
      
         div.topdiv{
         	border:1px solid grey;
         	padding:6px;
         	margin-bottom: 8px;
         }
         div.centerdiv {
         	border:1px solid grey;
         	padding:6px;
         	height: 130px;
         	margin-bottom: 8px;
         }
         div.leftdiv{
         	float:left;
         	padding:6px;
            height: 118px;
         }
         div.rightdiv {
  			
  				border-left: 1px solid lightgray;
 			   float: left;
  			  height: 118px;
   			 padding: 8px;
		}
		div.bottomRight
		{
				
 			  
  			  height: 100px;
   			 padding: 0px;
		}
		div.bottomLeft
		{
			border-right: 1px solid lightgray;
				float:left;
         	    padding:6px;
               height: 100px;
		}
		div.bottomdiv{
			border:1px solid grey;
         	padding:6px;
         	height: 112px;
         	margin-bottom: 8px;
		}
		#dialog-1{
		
			color:Black !important;
		}
	
		table.ptd td,th
		{
			padding: 2px 2px 2px 18px;
		}
		table.monthpdt td,th
		{
			padding: 2px;
		}
		

      </style>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<link rel="stylesheet" href="css/datepicker.css">
<style type="text/css">
.ui-datepicker th {
    color: black !important;
}
.datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom
{
line-height:12px;
}

</style>

  <style>.datepicker { z-index: 1151 !important; line-height: 12px; }</style>
      
  <script type="text/javascript">

  
   
   function validate()
   {  
    	var id= document.getElementById("id").value;    	
   		var taskname = document.getElementById("taskname").value;    		
   		var fromdate = document.getElementById("fromdate").value;
   		var todate = document.getElementById("todate").value;
   		var dateSchedule = document.getElementById("dateSchedule").value;
   		var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
		var employeedata = document.getElementById("responsiblehead").value;
					var taskid= document.getElementById("taskid").value;
   		taskname=jQuery.trim(taskname);
		document.getElementById("taskname").value=taskname;	
		
		 if(fromdate=='' || fromdate == undefined){
			$('#fromdateAlert').show();
			$('#fromdateAlert').delay(1500).fadeOut('slow');	
			return false;
		}
		else if(todate=='' || todate == undefined){
			$('#todateAlert').show();
			$('#todateAlert').delay(1500).fadeOut('slow');	
			return false;
		}
		else if(taskname=='' || taskname == undefined){
			$('#tasknameAlert').show();
			$('#tasknameAlert').delay(1500).fadeOut('slow');	
			return false;
		}
		else if(filter.test(taskname) == true){	
        		$('#validtaskname').show();
				$('#validtaskname').delay(1500).fadeOut('slow');
				document.getElementById("taskname").focus();	
				return false;
	    }
		 else if(employeedata==''){
	   		 $('#task_responsible_alert').show();
			$('#task_responsible_alert').delay(1500).fadeOut('slow');	
			return false;
	    }
		
		else{
       		  $.ajax("checksingleedittask.assets.htm?taskname="+taskname+"&fromdate="+fromdate+"&todate="+todate+"&employeedata="+employeedata+"&taskid="+id+"&dateSchedule="+dateSchedule, {
       			 async: false,
       			 success: function(result){
       		
       			 if(result=='exist')
       			      {
       						  $('#assetAlreadyAlert').show();
							  $('#assetAlreadyAlert').delay(1500).fadeOut('slow');	
       			  			document.getElementById("taskadd").value="true";
       				  }
       				  else if(result=='wrong'){
       				  		  $('#responsible_head_message').show();
							  $('#responsible_head_message').delay(1500).fadeOut('slow');
							  document.getElementById("taskadd").value="true";	
       				 }
       			     else{
       				 document.getElementById("taskadd").value="false";
       			     }
     	   }
   		 });
		
		}
		
   		return true;
   }
  
  </script>

  
  <script>
 
  
  	
  		
  		function reset(){
  			document.getElementById("fromdate").value = document.getElementById("resetfromdate").value;
  			document.getElementById("todate").value = document.getElementById("resettodate").value;
  			document.getElementById("taskname").value =	document.getElementById("resettaskname").value;
  			document.getElementById("responsiblehead").value =	document.getElementById("resetresponsiblehead").value;
  		
  		}
  	
  
  </script>

</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" style="color:black;"> 


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.task_schedule_header}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.task_schedule_header}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body">
            <form method="post" action="updatesingleTaskschedule.assets.htm"  enctype="multipart/form-data" onsubmit="return validate();">       
          
                          
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_fromDate}"/><font color="red">*</font></label>
                    <input type="text" name="fromdate" class="form-control" id="fromdate" autocomplete="off" value="<c:out value="${FromDate}"/>">
                    <input type="hidden" name="resetfromdate" class="form-control" id="resetfromdate" maxlength="250" value="<c:out value="${FromDate}"/>">
                     <input type="hidden" name="scheduletask" class="form-control" id="scheduletask" >
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_toDate}"/><font color="red">*</font></label>
                    <input type="text" name="todate" class="form-control" id="todate" autocomplete="off" value="<c:out value="${ToDate}"/>">
                      <input type="hidden" name="resettodate" class="form-control" id="resettodate" maxlength="250" value="<c:out value="${ToDate}"/>">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_taskName}"/><font color="red">*</font></label>                    
                    <input type="hidden" name="id" class="form-control" id="id" maxlength="250" value="<c:out value="${ID}"/>">
                    <input type="hidden" name="taskid" class="form-control" id="taskid" maxlength="250" value="<c:out value="${taskid}"/>">
                    <input type="text" name="taskname" class="form-control" id="taskname" maxlength="250" value="<c:out value="${taskName}"/>">
                    <input type="hidden" name="resettaskname" class="form-control" id="resettaskname" maxlength="250" value="<c:out value="${taskName}"/>">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
  				<div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.scheduleDate}"/><font color="red">*</font></label>
                    <input type="text" name="dateSchedule" class="form-control" id="dateSchedule" autocomplete="off" value="<c:out value="${dateSchedule}"/>">
                      <input type="hidden" name="resetdateSchedule" class="form-control" id="resetdateSchedule" maxlength="250" value="<c:out value="${ToDate}"/>">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_res_person}"/><font color="red">*</font></label>
                    
					<input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead" value="<c:out value="${responsibleHead}"/>">
                    <input type="hidden" name="resetresponsiblehead" class="form-control" id="resetresponsiblehead" maxlength="250" value="<c:out value="${responsibleHead}"/>">
                   
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->

              </br>						
					<input type="hidden" name="taskadd"  id="taskadd"/>
			
						
            <div class="panel-footer">
              <button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>"><c:out value="${sessionScope.submit}"/></button>
              <a href="task.assets.htm"><button class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>"><c:out value="${sessionScope.cancel}"/></button></a>
			  <button type="reset" class="btn btn-default" onclick="reset()" title="<c:out value="${sessionScope.reset}"/>"><c:out value="${sessionScope.reset}"/></button>
			  
            </div>            
            </form>
          </div>
        </div>
        
      </div>

<!--      <div id="dialog-1" title="<c:out value="${sessionScope.scheduler}"/>" style="display:none;">-->
<!--				  </div>-->
	  
<!--	dialog  <-->
    

      

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
			         <span > <c:out value="${sessionScope.Vendore_Successfully_Alert}"/> </span>
			 </div>
			 
			  <div  id="assetAlert" class="error2">
			         <span > <c:out value="${sessionScope.Scheduler_Amc_alert}"/></span>
			 </div>
			 
			 <div  id="vendorAlert" class="error2">
			         <span ><c:out value="${sessionScope.Scheduler_vendorName_alert}"/></span>
			 </div>
			 
			  <div  id="fromdateAlert" class="error2">
			         <span ><c:out value="${sessionScope.Scheduler_fromDate_alert}"/></span>
			 </div>

  			<div  id="todateAlert" class="error2">
			         <span > <c:out value="${sessionScope.Scheduler_toDate_alert}"/></span>
			 </div>
			 <div  id="businessProcessAlert" class="error2">
			         <span ><c:out value="${sessionScope.Scheduler_buisProc_alert}"/></span>
			 </div>
			 
			 <div  id="employeeAlert" class="error2">
			         <span > <c:out value="${sessionScope.Scheduler_empName_alert}"/> </span>
			 </div>
			 
			 <div id="wrongAdd" class="error2">
	         <span > <c:out value="${sessionScope.Scheduler_loc_alert}"/>  </span>
			 </div>
			  <div id="startTimealert " class="error2">
			         <span ><c:out value="${sessionScope.Scheduler_strttime_alert}"/> </span>
			 </div>
			
		<div id="dateStartalert " class="error2">
            <span > <c:out value="${sessionScope.Select_Start_DateAlert}"/> </span>
    </div>
    <div id="endDateAlert " class="error2">
            <span >  <c:out value="${sessionScope.Select_End_DateAlert}"/> </span>
    </div>
    <div  id="duration " class="error2">
    
            <span > <c:out value="${sessionScope.Enter_DurationAlert}"/> </span>
    </div>
     <div  id="divlocationAlert" class="error2">
            <span > <c:out value="${sessionScope.Add_Location_NameAlert}"/></span>
    </div>
   
     
    <div  id="divtestAlert" class="error2">
            <span > <c:out value="${sessionScope.Add_DivisionAlert}"/></span>
    </div>
    
    
     <div  id="divRespAlert" class="error2">
            <span ><c:out value="${sessionScope.Enter_Responsible_HeadAlert}"/></span>
    </div>
    <div  id="alertSuc" class="success">
            <span > <c:out value="${sessionScope.submitupdatealert}"/></span>
    </div>
       
   <div  id="startAlert" class="error2">
            <span ><c:out value="${sessionScope.Enter_Start_DateAlert}"/></span>
    </div>
    <div  id="timestartdiff" class="error2">
            <span >  <c:out value="${sessionScope.Select_Start_timeAlert}"/> </span>
    </div>
    <div  id="startdateval" class="error2">
            <span > <c:out value="${sessionScope.Select_Start_DateAlert}"/> </span>
    </div>
     <div  id="enddateval" class="error2">
            <span >   <c:out value="${sessionScope.Select_End_DateAlert}"/>  </span>
    </div>
    <div  id="taskscheduledataAlert" class="error2">
            <span >   <c:out value="${sessionScope.taskscheduledataAlert}"/>  </span>
    </div>
    <div  id="validtaskname" class="error2">
            <span >   <c:out value="${sessionScope.validtaskname}"/>  </span>
    </div>
     <div  id="tasknameAlert" class="error2">
            <span >   <c:out value="${sessionScope.tasknameAlert}"/>  </span>
    </div>
    <div  id="zeroalert" class="error2">
            <span >   <c:out value="${sessionScope.alert_zero}"/>  </span>
    </div>
      <div  id="task_responsible_alert" class="error2">
            <span >   <c:out value="${sessionScope.task_responsible_alert}"/>  </span>
    </div>
    <div  id="responsible_head_message" class="error2">
            <span >   <c:out value="${sessionScope.responsible_head_message}"/>  </span>
    </div>
        
    <div  id="assetAlreadyAlert" class="error2">
            <span >   <c:out value="${sessionScope.assetAlreadyAlert}"/>  </span>
    </div>
    
        <script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            $("#imageloader").css("display", "none");
   			$("#complete").css("display", "block");
			$("div.leftpanelinner>ul>li#task").css("background","#012345");
             $("form").submit(function(){
             if(validate() == true){
                		var taskadd = document.getElementById("taskadd").value;  
                		
                		if(taskadd == 'true')
                		{
                			 return false;
                		}
                		else if(taskadd == 'false')
                		{
                		 	$('#alertSuc').show();
							$('#alertSuc').delay(1500).fadeOut('slow');
                		 	return true;
                		}  		
             }
             else
             {
            	 return false;
            	
			}
       					
   			 });
               
            
            
            var month = ("01 02 03 04 05 06 07 08 09 10 11 12").split(" ");
    var now = new Date();
   

var nowformatted=now.getFullYear() + "-"+ month[now.getMonth()] + "-"+now.getDate() ;
    var dpOptions = {
        format: 'yyyy-mm-dd',
        startDate: now,
        setDate: now,
        autoclose: true,
    };

	var i = 0;

		var datePicker1 = $("#fromdate").
			datepicker(dpOptions).
			on('changeDate', function (e) {
                console.log(i++);
					datePicker2.datepicker('setStartDate', e.date);
					datePicker2.datepicker('update');
			});
		
    var datePicker2 = $("#todate").
			datepicker(dpOptions).
			on('changeDate', function (e) {
					datePicker1.datepicker('setEndDate', e.date);
					datePicker1.datepicker('update');
			});
   
   	var j = 0;

			
		var datePicker11 = $('#dateSchedule').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
       
        });
  	 
            
            });
            
         
            
            
            
            
            
        </script>

      <script type="text/javascript">

    $(function() {      
        $("#responsiblehead").autocomplete({
            source: function (request, response) {
                $.getJSON("employeeBracketList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
  
        
</script>
    

</body>
</html>
