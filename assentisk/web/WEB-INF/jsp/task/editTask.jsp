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

        <script>

        
   $(function() {
    
  		$("#imageloader").css("display", "none");
   		$("#complete").css("display", "block");
		$("div.leftpanelinner>ul>li#task").css("background","#012345");
            var getScheduler=document.getElementById("getScheduler").value;
            if(getScheduler=='false')
            {
            			$( "#dailyID" ).css( "display","block");  
       					$('input:radio[id=patterndefault]').prop('checked', true);
       					$('input:radio[id=dailyRadiodefault]').prop('checked', true);
       					$('input:radio[id=monthlyRadiodefault]').prop('checked', true);
       					$('input:radio[id=yearmonthlyRadiodefault]').prop('checked', true);       	
       					$('input:radio[id=endRadiodefault]').prop('checked', true);				
            }
            
            var recurpatternvalue = document.getElementById("recurpatternvalue").value;  
             	 if(recurpatternvalue == '1'){
       					  $( "#dailyID" ).css( "display","block");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","none");        
    			  }
    			  else  if(recurpatternvalue == '2'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","block");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","none");    
    			  }
    			   else  if(recurpatternvalue == '3'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","block");  
       					  $( "#yearlyID" ).css( "display","none");   
    			  }
    			   else  if(recurpatternvalue == '4'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","block");      
    			  }
            
            
            
            $('input:radio[name="pattern"]').change(function(){
   				 if($(this).val() == '1'){
       					  $( "#dailyID" ).css( "display","block");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","none");        
    			  }
    			  else  if($(this).val() == '2'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","block");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","none");    
    			  }
    			   else  if($(this).val() == '3'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","block");  
       					  $( "#yearlyID" ).css( "display","none");   
    			  }
    			   else  if($(this).val() == '4'){
       					  $( "#dailyID" ).css( "display","none");  
       					  $( "#weekendID" ).css( "display","none");  
       					  $( "#monthlyID" ).css( "display","none");  
       					  $( "#yearlyID" ).css( "display","block");      
    			  }
			});
            
            
            
         });
  </script>
      
  <script type="text/javascript">

  
   
   function validate()
   {  
    	
   		var taskname = document.getElementById("taskname").value;    		
   		var fromdate = document.getElementById("fromdate").value;
   		var todate = document.getElementById("todate").value;
   		var vendorname= document.getElementById("vendor").value;
   		var scheduledata=document.getElementById("scheduledataval").value;
   		var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
		var employeedata = document.getElementById("responsiblehead").value;
					var taskid= document.getElementById("taskid").value;
   		taskname=jQuery.trim(taskname);
		document.getElementById("taskname").value=taskname;	
		 if(scheduledata=='' || scheduledata == undefined ){
			document.getElementById("scheduletask").value="true";
		}
		else if(scheduledata!=''){
			document.getElementById("scheduletask").value="false";
		}
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
		
				
		
       		 
       		  $.ajax("checkedittask.assets.htm?taskname="+taskname+"&fromdate="+fromdate+"&todate="+todate+"&employeedata="+employeedata+"&taskid="+taskid, {
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
 
  	function saveScheduler(){
  			var startTime = document.getElementById("startTime").value; 
  			
  			var endTime = document.getElementById("endreflectTime").value;   
  			var duration = document.getElementById("getduration").value;  
  			var oRadio = $("input:radio[name=pattern]:checked").val();
  			
  			
  			var weekid = [];
			var recur='1';
			var dateStart = document.getElementById("dateStart").value;  
			var endDate = document.getElementById("endDate").value; 
			var endoccurence = document.getElementById("endoccurence").value;
			
			var endRadio = $("input:radio[name=endRadio]:checked").val();
			var taskid= document.getElementById("taskid").value;
			var schedulerID=document.getElementById("schedulerID").value;
			var dailyRadio = '1';
			var dailyrecur = '1';
			var monthlyRadio='1'
			var daymonthlyrecur='1';
			var monthlyrecur='1';
			var monthsection='1';
			var monthWeeksection='1';
			var monthlyrecurofevery='1';
			var daymonthlyyearrecur='1';
			var yearmonthlyRadio='1';
			var ONyearrecur='1';

			var yearmonthsection='1';
			var yearmonthWeeksection='1';
			var yearsectiononthe='1'
			var yearsectionon='1';
			var yearsection='1';
			var monthlyrecurmon='1'
			if(oRadio == '1'){
				dailyRadio = $("input:radio[name=dailyRadio]:checked").val();
				dailyrecur=document.getElementById("dailyrecur").value;
			}
			else if(oRadio == '2'){
				recur = document.getElementById("recur").value; 
				$.each($("input[name='weekid']:checked"), function() {
										weekid.push($(this).val());
				}); 
			}
			else if(oRadio == '3'){
				monthlyRadio = $("input:radio[name=monthlyRadio]:checked").val();
				daymonthlyrecur=document.getElementById("daymonthlyrecur").value; 
				
				if(monthlyRadio=='1'){
					monthlyrecurmon=document.getElementById("monthlyrecur").value;
				}
				else if(monthlyRadio=='2')
				{
					monthlyrecurmon=document.getElementById("monthlyrecurofevery").value;
				}
				monthsection=document.getElementById("monthsection").value;
				monthWeeksection=document.getElementById("monthWeeksection").value;
			}
			else if(oRadio == '4'){
				daymonthlyyearrecur =document.getElementById("daymonthlyyearrecur").value;
				yearmonthlyRadio=$("input:radio[name=yearmonthlyRadio]:checked").val();
				if(yearmonthlyRadio=='1'){
					yearsection=document.getElementById("yearsectionon").value;
				}
				else if(yearmonthlyRadio=='2')
				{
					yearsection=document.getElementById("yearsectiononthe").value;
				}
				ONyearrecur=document.getElementById("ONyearrecur").value;
				yearmonthsection=document.getElementById("yearmonthsection").value;
				yearmonthWeeksection=document.getElementById("yearmonthWeeksection").value;
			}
			
			if(dateStart=='' || dateStart== undefined){
	
					$('#startdateval').show();
					$('#startdateval').delay(1500).fadeOut('slow');
			}
			else if((endDate=='' || endDate== undefined) && endRadio=='3'){
					$('#enddateval').show();
					$('#enddateval').delay(1500).fadeOut('slow');
			}
			else{
			
			document.getElementById("startTime12").value=startTime;
			document.getElementById("endTime12").value=endTime;
			document.getElementById("duration12").value=duration;
			document.getElementById("oRadio12").value=oRadio;
			
			document.getElementById("recur12").value=recur;
			document.getElementById("weekid12").value=weekid;
			document.getElementById("dateStart12").value=dateStart;
			document.getElementById("endDate12").value=endDate;
			
			document.getElementById("endoccurence12").value=endoccurence;
			document.getElementById("endRadio12").value=endRadio;
			
			
			document.getElementById("schedulerID12").value=schedulerID;
			document.getElementById("dailyRadio12").value=dailyRadio;
			document.getElementById("dailyrecur12").value=dailyrecur;
			document.getElementById("monthlyRadio12").value=monthlyRadio;
			
			document.getElementById("daymonthlyrecur12").value=daymonthlyrecur;
			document.getElementById("monthlyrecurmon12").value=monthlyrecurmon;
			document.getElementById("monthsection12").value=monthsection;
			document.getElementById("monthWeeksection12").value=monthWeeksection;
			
			document.getElementById("daymonthlyyearrecur12").value=daymonthlyyearrecur;
			document.getElementById("yearmonthlyRadio12").value=yearmonthlyRadio;
			document.getElementById("yearsection12").value=yearsection;
			document.getElementById("ONyearrecur12").value=ONyearrecur;
			document.getElementById("yearmonthsection12").value=yearmonthsection;
			document.getElementById("yearmonthWeeksection12").value=yearmonthWeeksection;
			
			
								$.get("addScheduler.assets.htm?&startTime="
										+startTime+"&endTime="+endTime+"&duration="
										+duration+"&oRadio="+oRadio+"&recur="+recur+"&weekid="
										+weekid+"&dateStart="+dateStart+"&endDate="+endDate+"&endoccurence="
										+endoccurence+"&endRadio="+endRadio+
										"&dailyRadio="+dailyRadio+"&dailyrecur="+dailyrecur+
										"&monthlyRadio="+monthlyRadio+"&daymonthlyrecur="+daymonthlyrecur+
										"&monthlyrecurmon="+monthlyrecurmon+"&monthsection="+monthsection+"&monthWeeksection="
										+monthWeeksection+"&daymonthlyyearrecur="+daymonthlyyearrecur+
										"&yearmonthlyRadio="+yearmonthlyRadio+"&yearsection="+yearsection+
										"&ONyearrecur="+ONyearrecur+"&yearmonthsection="+yearmonthsection+"&yearmonthWeeksection="
										+yearmonthWeeksection, function(data, status) {
										
										document.getElementById("schedulerContent").innerHTML=data;
										document.getElementById("scheduledataval").value=data;
										// $("#dialog-1").dialog('close');	
										$("#cldailog").trigger( "click" );
										// $('#dialog-1').modal({show: false});	
								});
								
			}					
								
								
			 			
			
  			
  	}
  	 
  	function callEndDate(value){
    	
  		$.get("callEndTime.assets.htm?startId=" + value ,
										 function(data, status) {
											document.getElementById("endDatatime").innerHTML=data;
											var value=document.getElementById("endreflectTime").value;
											
								callDifference(value);					
		});
  	
  	
  	}
  	function callDifference(endReflectdata){
  	var startTime=document.getElementById("startTime").value;
  	var endTime=endReflectdata;
	  if(startTime!=''){
  				$.get("callDiffernce.assets.htm?startID=" + startTime +"&endID="+endTime,
										 function(data, status) {
										 document.getElementById("getduration").value=data;
										
				});
		}
		
  	}
  	function openScheduler(){
  	  	var dateStart=document.getElementById("dateStart").value;
  	  	var fromdate=document.getElementById("fromdate").value;
  	  	var endDate=document.getElementById("endDate").value;
  	  	var todate=document.getElementById("todate").value;
  
  	if(dateStart=='' && endDate =='')
  	{
  			document.getElementById("dateStart").value=fromdate;
  			document.getElementById("endDate").value=todate;
  			
  	}
  		$('#dialog-1').modal('show');
  		
  	}
  	
  	function endOccurence(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("endoccurence").value = 1;	
  			}
  	}
  	function dailyRecur(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("dailyrecur").value = 1;	
  			}
  	
  	}
  	function weeklyRecur(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("recur").value = 1;	
  			}
  	
  	}
  	
  		function daymonthlyrecurfun(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("daymonthlyrecur").value = 1;	
  			}
  	
  		}
  		function monthlyrecurfun(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("monthlyrecur").value = 1;	
  			}
  	
  		}
  	
  	
  	function monthlyrecurofeveryfun(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("monthlyrecurofevery").value = 1;	
  			}
  	
  		}
  		function daymonthlyyearrecurfun(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("daymonthlyyearrecur").value = 1;	
  			}
  	
  		}
  		
  		function ONyearrecurfun(value){
  			if(value== 0 || value < 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("ONyearrecur").value = 1;	
  			}
  	
  		}
  		function reset(){
  			document.getElementById("fromdate").value = document.getElementById("resetfromdate").value;
  			document.getElementById("todate").value = document.getElementById("resettodate").value;
  			document.getElementById("taskname").value =	document.getElementById("resettaskname").value;
  			document.getElementById("responsiblehead").value =	document.getElementById("resetresponsiblehead").value;
  		
  		}
  	
    function isNumber(evt) {     evt = (evt) ? evt : window.event;     var charCode = (evt.which) ? evt.which : evt.keyCode;     if (charCode > 31 && (charCode < 48 || charCode > 57)) {         return false;     }     return true; }
  
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
            <form method="post" action="updateTaskschedule.assets.htm"  enctype="multipart/form-data" onsubmit="return validate();">       
          
                          
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_fromDate}"/><font color="red">*</font></label>
                    <input type="text" name="fromdate" class="form-control" id="fromdate" value="<c:out value="${FromDate}"/>" autocomplete="off">
                    <input type="hidden" name="resetfromdate" class="form-control" id="resetfromdate" maxlength="250" value="<c:out value="${taskid}"/>">
                     <input type="hidden" name="scheduletask" class="form-control" id="scheduletask" >
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_toDate}"/><font color="red">*</font></label>
                    <input type="text" name="todate" class="form-control" id="todate" value="<c:out value="${ToDate}"/>" autocomplete="off">
                      <input type="hidden" name="resettodate" class="form-control" id="resettodate" maxlength="250" value="<c:out value="${ToDate}"/>">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
               <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_taskName}"/><font color="red">*</font></label>                    
                    <input type="hidden" name="id" class="form-control" id="id" maxlength="250" value="<c:out value="${ID}"/>">
                    <input type="hidden" name="schedulerID" class="form-control" id="schedulerID" maxlength="250" value="<c:out value="${schedulerID}"/>">
                    <input type="hidden" name="taskid" class="form-control" id="taskid" maxlength="250" value="<c:out value="${taskid}"/>">
                    <input type="text" name="taskname" class="form-control" id="taskname" maxlength="250" value="<c:out value="${taskName}"/>">
                    <input type="hidden" name="resettaskname" class="form-control" id="resettaskname" maxlength="250" value="<c:out value="${taskName}"/>">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              

              
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label"><c:out value="${sessionScope.schedule_upload}"/></label>
                     <input type="file" name="doc" class="form-control" id="doc">
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
              <input type="hidden" name="scheduledataval" class="form-control" id="scheduledataval" maxlength="250" value="<c:out value="${schdulerderdata}"/>">

              </br>
               <div class="row" style="padding-left:4px;">               
               
                    <label class="control-label"><div id="schedulerContent" style="color:black;font-size: 12px;padding-left:5px;"><c:out value="${schdulerderdata}"/></div></label>
                  
                  
                  
                    <a id="opener" href="#"  cursor="pointer" data-toggle="modal"  onclick="openScheduler();" title="<c:out value="${sessionScope.scheduler}"/>"><b><c:out value="${sessionScope.task_scheduler}"/></b></a>
                  
              </div><!-- row -->
			</br></br>
			
						<input type="hidden" name="startTime12"  id="startTime12" value="<c:out value="${startTimeID}"/>"/>
			 			<input type="hidden" name="endTime12"  id="endTime12"   value="<c:out value="${endTimeID}"/>"/>
						<input type="hidden" name="duration12"  id="duration12" value="<c:out value="${duration}"/>"/>
						
						
						<input type="hidden" name="oRadio12"  id="oRadio12" value="<c:out value="${recurPattern}"/>"/>
						
						
						<input type="hidden" name="recur12"  id="recur12" value="<c:out value="${recurOccurence}"/>"/>
						<input type="hidden" name="weekid12"  id="weekid12" value="<c:out value="${weekid}"/>"/>
						<input type="hidden" name="dateStart12"  id="dateStart12" value="<c:out value="${dateStart}"/>"/>
						<input type="hidden" name="endDate12"  id="endDate12" value="<c:out value="${endDate}"/>"/>
						<input type="hidden" name="endoccurence12"  id="endoccurence12" value="<c:out value="${endoccurence}"/>"/>
						<input type="hidden" name="endRadio12"  id="endRadio12" value="<c:out value="${endRangePat}"/>"/>
						<input type="hidden" name="schedulerID12"  id="schedulerID12" value="<c:out value="${schedulerID}"/>"/>
						<input type="hidden" name="dailyRadio12"  id="dailyRadio12" value="<c:out value="${dailyRadio}"/>"/>
						<input type="hidden" name="dailyrecur12"  id="dailyrecur12" value="<c:out value="${dailyRecur}"/>"/>
						
						<input type="hidden" name="monthlyRadio12"  id="monthlyRadio12" value="<c:out value="${monthRadio}"/>"/>
						<input type="hidden" name="daymonthlyrecur12"  id="daymonthlyrecur12" value="<c:out value="${monthdayRecur}"/>"/>
						<input type="hidden" name="monthlyrecurmon12"  id="monthlyrecurmon12" value="<c:out value="${monthRecur}"/>"/>
						<input type="hidden" name="monthsection12"  id="monthsection12" value="<c:out value="${monthSection}"/>"/>
						
						
						<input type="hidden" name="monthWeeksection12"  id="monthWeeksection12" value="<c:out value="${monthWeekend}"/>"/>
						<input type="hidden" name="daymonthlyyearrecur12"  id="daymonthlyyearrecur12" value="<c:out value="${yearlyRecur}"/>"/>
						<input type="hidden" name="yearmonthlyRadio12"  id="yearmonthlyRadio12" value="<c:out value="${yearlyRadio}"/>"/>
						<input type="hidden" name="yearsection12"  id="yearsection12" value="<c:out value="${yearlySection}"/>"/>
						
						<input type="hidden" name="ONyearrecur12"  id="ONyearrecur12" value="<c:out value="${yearlyMonthRecur}"/>"/>
						<input type="hidden" name="yearmonthsection12"  id="yearmonthsection12" value="<c:out value="${yearlyMonthSection}"/>"/>
						<input type="hidden" name="yearmonthWeeksection12"  id="yearmonthWeeksection12" value="<c:out value="${yearlyMonthWeek}"/>"/>
						
						
						
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


<div class="modal fade" id="dialog-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Scheduler</h4>
      </div>
      <div class="modal-body scheduler">
        
     <div class="bottomdiv">
							<div class="bottomLeft">
									<c:out value="${sessionScope.Scheduler_start}"/>&nbsp;&nbsp;&nbsp;:<font color="red"> *</font>&nbsp;<input type="text" name="dateStart" id="dateStart"  style="width:130px;"  value="<c:out value="${dateStart}"/>">
									</br>
									
							</div>
							<div class="bottomRight">
									<table class="ptd">
											<tr>
												
												<td colspan=3>
														<input type="radio" name="endRadio" id="endRadiodefault" value="1" <c:if test="${endRangePat==1}">checked</c:if>><c:out value="${sessionScope.Scheduler_NoEndDate}"/><br>
												</td>
											</tr>
											<tr>
												<td>
														<input type="radio" name="endRadio" id="endRadiodefault" value="2" <c:if test="${endRangePat==2}">checked</c:if>><c:out value="${sessionScope.Scheduler_Endafter}"/>:<br>
												</td>
												<td>
												<c:choose>
													<c:when test="${ endoccurence!=''}">
																<input type="text" name="endoccurence" id="endoccurence" style="width: 35px;margin-left:4px;" value="<c:out value="${endoccurence}"/>" onkeypress="return isNumber(event)" onblur="endOccurence(this.value);">
												</c:when>
													<c:otherwise>
																<input type="text" name="endoccurence" id="endoccurence" style="width: 35px;margin-left:4px;" value="1" onkeypress="return isNumber(event)" onblur="endOccurence(this.value);">
													</c:otherwise>
											</c:choose>
												
												</td>
												<td>
														<c:out value="${sessionScope.Scheduler_occurence}"/>
												</td>
											</tr>
											<tr>
												<td>
														<input type="radio" name="endRadio" value="3" <c:if test="${endRangePat==3}">checked</c:if> ><c:out value="${sessionScope.Scheduler_EndBy}"/>&nbsp;&nbsp;&nbsp;:<font color="red"> *</font><br>
												</td>
												<td colspan=2>
														&nbsp;<input type="text" name="endDate" id="endDate" style="width:130px;" value="<c:out value="${endDate}"/>">
												</td>
												
											</tr>
									
									
									</table>
							</div>
					
					</div>	
						
					<div  class="centerdiv">
							<div  class="leftdiv">
							<input type="hidden" name="recurpatternvalue" id="recurpatternvalue" value="<c:out value="${recurPattern}"/>">
							<input type="hidden" name="getScheduler" id="getScheduler" value="<c:out value="${getScheduler}"/>">
							<input type="radio" name="pattern" style="margin-bottom:3px;"  value="1" id="patterndefault" <c:if test="${recurPattern==1}">checked</c:if> ><c:out value="${sessionScope.SchedulerDiv_daily}"/><br>
							<input type="radio" name="pattern" style="margin-bottom:3px;"  value="2" <c:if test="${recurPattern==2}">checked</c:if> ><c:out value="${sessionScope.SchedulerDiv_weekly}"/><br>
							<input type="radio" name="pattern" style="margin-bottom:3px;"  value="3" <c:if test="${recurPattern==3}">checked</c:if> ><c:out value="${sessionScope.SchedulerDiv_monthly}"/><br>
							<input type="radio" name="pattern" style="margin-bottom:3px;"  value="4" <c:if test="${recurPattern==4}">checked</c:if> ><c:out value="${sessionScope.SchedulerDiv_Yearly}"/><br>
							</div>
							<div  class="rightdiv" id="dailyID" style="display:none">

								<table class="ptd">

									<tr>
										<td>
											<input type="radio" name="dailyRadio" id="dailyRadiodefault" value="1" <c:if test="${(dailyRadio==1) || (dailyRadio== 0) || (dailyRadio== '')}">checked</c:if>><c:out value="${sessionScope.SchedulerDiv_Every}"/><br>
										</td>
										<td>
									
											<c:choose>
													<c:when test="${dailyRecur!='' }">
													
													<input type="text" name="dailyrecur" id="dailyrecur"
												style="width: 35px;" value="<c:out value="${dailyRecur}"/>"  onkeypress="return isNumber(event)" onblur="dailyRecur(this.value);">
												
												</c:when>
													<c:otherwise>
													
													<input type="text" name="dailyrecur" id="dailyrecur"
														style="width: 35px;" value="1" onkeypress="return isNumber(event)" onblur="dailyRecur(this.value);">
													</c:otherwise>
											</c:choose>
											
										</td>
										<td>
											<c:out value="${sessionScope.SchedulerDiv_day}"/>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="dailyRadio" value="2" <c:if test="${(dailyRadio==2) }">checked</c:if>><c:out value="${sessionScope.SchedulerDiv_EveryWeekDay}"/><br>

										</td>
										
									</tr>
									
								</table>


							</div>
							<div  class="rightdiv" id="weekendID" style="display:none">

								<table class="ptd">

									<tr>
										<td>
												<c:out value="${sessionScope.Scheduler_RecurEvery}"/>
										</td>
										<td>
										<c:choose>
													<c:when test="${recurOccurence!=''}">
													
												<input type="text" name="recur" id="recur"
												style="width: 35px;"  value="<c:out value="${recurOccurence}"/>" onkeypress="return isNumber(event)" onblur="weeklyRecur(this.value);">
												
												</c:when>
													<c:otherwise>
													
													<input type="text" name="recur" id="recur"
												style="width: 35px;"  value="1" onkeypress="return isNumber(event)" onblur="weeklyRecur(this.value);">
													</c:otherwise>
											</c:choose>
											
											
										</td>
										<td>
												<c:out value="${sessionScope.Scheduler_weeks}"/>:
										</td>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="weekid" value="1" <c:if test="${sun=='1'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_sunday}"/>

										</td>
										<td>
											<input type="checkbox" name="weekid" value="2"  <c:if test="${mon=='2'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_monday}"/>
										</td>
										<td>
											<input type="checkbox" name="weekid" value="3" <c:if test="${tues=='3'}">checked</c:if>>
												<c:out value="${sessionScope.Scheduler_tuesday}"/>
										</td>
										<td>
											<input type="checkbox" name="weekid" value="4" <c:if test="${wed=='4'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_wednesday}"/>
										</td>
									</tr>
									<tr>
										<td>
										 <input type="checkbox" name="weekid" value="5" <c:if test="${thrus=='5'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_Thrusday}"/>

										</td>
										<td>
											<input type="checkbox" name="weekid" value="6" <c:if test="${fri=='6'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_friday}"/>
										</td>
										<td>
											<input type="checkbox" name="weekid" value="7" <c:if test="${sat=='7'}">checked</c:if>>
											<c:out value="${sessionScope.Scheduler_saturday}"/>
										</td>
										
									
									</tr>

								</table>


							</div>
							
							<div  class="rightdiv" id="monthlyID" style="display:none">

								<table class="monthpdt" >

									<tr>
										<td>
											<input type="radio" name="monthlyRadio" id="monthlyRadiodefault" value="1" <c:if test="${(monthRadio==1) || (monthRadio== 0) || (monthRadio== '')}">checked</c:if>>	<c:out value="${sessionScope.Scheduler_day}"/><br>
										</td>
										<td>
										
											<c:choose>
													<c:when test="${monthdayRecur!=''}">
													
												<input type="text" name="daymonthlyrecur" id="daymonthlyrecur"
												style="width: 30px;" value="<c:out value="${monthdayRecur}"/>" onkeypress="return isNumber(event)" onblur="daymonthlyrecurfun(this.value);">
												
												</c:when>
													<c:otherwise>
													
													<input type="text" name="daymonthlyrecur" id="daymonthlyrecur"
												style="width: 30px;" value="1" onkeypress="return isNumber(event)" onblur="daymonthlyrecurfun(this.value);">
													</c:otherwise>
											</c:choose>
											
											
										</td>
										<td>
											<c:out value="${sessionScope.Scheduler_OfEvery}"/>
										</td>
										<td>
										
										<c:choose>
													<c:when test="${(monthRecur!='')}">
													
													<input type="text" name="monthlyrecur" id="monthlyrecur"
														style="width: 30px;"  value="<c:out value="${monthRecur}"/>" onkeypress="return isNumber(event)" onblur="monthlyrecurfun(this.value);">
												
												</c:when>
													<c:otherwise>
													
												<input type="text" name="monthlyrecur" id="monthlyrecur"
												style="width: 30px;"  value="1" onkeypress="return isNumber(event)" onblur="monthlyrecurfun(this.value);">
													</c:otherwise>
											</c:choose>
											

										</td>
										<td colspan=2>
											<c:out value="${sessionScope.Scheduler_months}"/>
										</td>
										
									</tr>
									<tr>
										<td>
											<input type="radio" name="monthlyRadio" value="2" <c:if test="${monthRadio==2}">checked</c:if>><c:out value="${sessionScope.Scheduler_the}"/><br>
										</td>
										<td>
											<select style="width:60px;" id="monthsection">
												<c:forEach var="list" items="${monthsectionList}">
												 		<c:choose>
												  				<c:when test="${list.id==monthSection}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.name}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.name}"/></option>
												  				</c:otherwise>
												  		</c:choose>
												   </c:forEach>
																			
											</select>
										</td>
										<td>
											<select style="width:70px;" id="monthWeeksection">
											
											<c:forEach var="list" items="${weekdayList}">
												 		<c:choose>
												  				<c:when test="${list.id==monthWeekend}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.mname}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.mname}"/></option>
												  				</c:otherwise>
												  		</c:choose>
										 </c:forEach>
																	
											</select>
										</td>
										<td>
											<c:out value="${sessionScope.Scheduler_OfEvery}"/>
										</td>
										<td>
										
										<c:choose>
												<c:when test="${(monthRecur!='') && (monthRadio==2)}">
													
													<input type="text" name="monthlyrecurofevery" id="monthlyrecurofevery"
													style="width: 30px;" value="<c:out value="${monthRecur}"/>" onkeypress="return isNumber(event)" onblur="monthlyrecurofeveryfun(this.value);">
												
												</c:when>
													<c:otherwise>
													
												<input type="text" name="monthlyrecurofevery" id="monthlyrecurofevery"
												style="width: 30px;" value="1" onkeypress="return isNumber(event)" onblur="monthlyrecurofeveryfun(this.value);">
													</c:otherwise>
											</c:choose>
										

										</td>
										<td>
											<c:out value="${sessionScope.Scheduler_months}"/>
										</td>
										
									</tr>
									
									
								</table>


							</div>
							
							<div  class="rightdiv" id="yearlyID" style="display:none">

								<table class="monthpdt" >

									<tr>
										<td colspan=2>
											<c:out value="${sessionScope.Scheduler_RecurEvery}"/>
										</td>
										<td>
										<c:choose>
													<c:when test="${yearlyRecur!='0'}">
													
											<input type="text" name="daymonthlyyearrecur" id="daymonthlyyearrecur"
												style="width: 30px;" value="<c:out value="${yearlyRecur}"/>" onkeypress="return isNumber(event)" onblur="daymonthlyyearrecurfun(this.value);">
												
												</c:when>
													<c:otherwise>
													
												<input type="text" name="daymonthlyyearrecur" id="daymonthlyyearrecur"
												style="width: 30px;" value="1" onkeypress="return isNumber(event)" onblur="daymonthlyyearrecurfun(this.value);">
													</c:otherwise>
											</c:choose>
											
										</td>
										<td colspan=2>
											<c:out value="${sessionScope.Scheduler_year}"/>
										</td>
										
									</tr>
									<tr>
										<td>
											<input type="radio" name="yearmonthlyRadio" id="yearmonthlyRadiodefault" value="1" <c:if test="${(yearlyRadio==1) || (yearlyRadio== 0) || (yearlyRadio== '')}">checked</c:if>><c:out value="${sessionScope.Scheduler_on}"/>:<br>
										</td>
										<td>
											<select style="width:70px;" id="yearsectionon" colspan=2>
												<c:forEach var="list" items="${yearsectionList}">
												 		<c:choose>
												  				<c:when test="${list.id==yearlySection && yearlyRadio == 1 }">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.ymonth}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.ymonth}"/></option>
												  				</c:otherwise>
												  		</c:choose>
											 </c:forEach>						
											</select>
										</td>
										<td>
										
										
										<c:choose>
													<c:when test="${(yearlyRecur!='0') && (yearlyRadio==1)}">
											<input type="text" name="ONyearrecur" id="ONyearrecur"
												style="width: 30px;" colspan=2 value="<c:out value="${yearlyMonthRecur}"/>" onkeypress="return isNumber(event)" onblur="ONyearrecurfun(this.value);">
										
												
												</c:when>
													<c:otherwise>
													
												<input type="text" name="ONyearrecur" id="ONyearrecur"
												style="width: 30px;" colspan=2 value="1" onkeypress="return isNumber(event)" onblur="ONyearrecurfun(this.value);">
										
													</c:otherwise>
											</c:choose>
										</td>
										
										
									</tr>
									<tr>
										<td>
											<input type="radio" name="yearmonthlyRadio" value="2"  <c:if test="${yearlyRadio==2}">checked</c:if>>	<c:out value="${sessionScope.Scheduler_onthe}"/>:<br>
										</td>
										<td>
											<select style="width:60px;" id="yearmonthsection">
													<c:forEach var="list" items="${monthsectionList}">
												 		<c:choose>
												  				<c:when test="${list.id==yearlyMonthSection}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.name}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.name}"/></option>
												  				</c:otherwise>
												  		</c:choose>
												   </c:forEach>				
											</select>
										</td>
										<td>
											<select style="width:91px;" id="yearmonthWeeksection">
											<c:forEach var="list" items="${weekdayList}">
												 		<c:choose>
												  				<c:when test="${list.id==yearlyMonthWeek}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.mname}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.mname}"/></option>
												  				</c:otherwise>
												  		</c:choose>
											 </c:forEach>
																
											</select>
										</td>
										<td>
											<c:out value="${sessionScope.Scheduler_of}"/>
										</td>
										<td>
											<select style="width:70px!important;" id="yearsectiononthe" >
											
											<c:forEach var="list" items="${yearsectionList}">
												 		<c:choose>
												  				<c:when test="${list.id==yearlySection  && yearlyRadio == 2}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.ymonth}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.ymonth}"/></option>
												  				</c:otherwise>
												  		</c:choose>
											 </c:forEach>
																		
											</select>

										</td>
										<td>
											<c:out value="${sessionScope.Scheduler_months}"/>
										</td>
										
									</tr>
									
									
								</table>


							</div>
					</div>	
					  <div  class="topdiv">
							<table class="ptd">
								<tr>
									<td>
										<c:out value="${sessionScope.SchedulerDiv_starttime}"/>
									</td>
									<td>
												<select style="width:100px;" id="startTime" onchange="callEndDate(this.value)">
												  <option value="">--  select  --</option>
												  	<c:forEach var="list" items="${timeList}">
												  		<c:choose>
												  				<c:when test="${list.id==startTimeID}">
												  							<option value="<c:out value="${list.id}"/>" selected><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												  							 <option value="<c:out value="${list.id}"/>"><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
												  				</c:otherwise>
												  		</c:choose>
												  </c:forEach>
												</select>
									</td>
								</tr>
								<tr>
									<td>
										<c:out value="${sessionScope.SchedulerDiv_endtime}"/>
									</td>
									<td>
										<span id="endDatatime">
												<select style="width:100px;" id="endreflectTime" onchange="callDifference(this.value);">
													<option value="">--  select    --</option>
												 		<c:forEach var="list" items="${timeList}">
												 		<c:choose>
												  				<c:when test="${list.id==endTimeID}">
												 					 <option value="<c:out value="${list.id}"/>" selected><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
												  				 </c:when>
												  				<c:otherwise>
												 		 			<option value="<c:out value="${list.id}"/>"><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
												  				</c:otherwise>
												  		</c:choose>
												        </c:forEach>
												</select>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<c:out value="${sessionScope.SchedulerDiv_duration}"/>
									</td>
									<td>
										 <input type="text" name="getduration" id="getduration" style="width:100px;" value="<c:out value="${duration}"/>">
										 <input type="hidden" name="empID" class="form-control" value="<c:out value="${sessionScope.UserRecordID}"/>" id="empID"/>
									</td>
								</tr>

							</table>
						</div>
					
					
					
					


        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" style="display:none" data-dismiss="modal" id="cldailog"><c:out value="${sessionScope.tooltip_close}"/></button>
        <button type="button" class="btn btn-primary" onclick="saveScheduler();"><c:out value="${sessionScope.tooltip_ok}"/></button>
      </div>
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
    
        <script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
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

		var datePicker11 = $("#dateStart").
			datepicker(dpOptions).
			on('changeDate', function (e) {
                console.log(j++);
					datePicker22.datepicker('setStartDate', e.date);
					datePicker22.datepicker('update');
			});
		
  	  var datePicker22 = $("#endDate").
			datepicker(dpOptions).
			on('changeDate', function (e) {
					datePicker11.datepicker('setEndDate', e.date);
					datePicker11.datepicker('update');
			});
   
            
            });
            
         
            
            
            
            
            
        </script>

      <script type="text/javascript">

    $(function() {      
        $("#responsiblehead").autocomplete({
            source: function (request, response) {
            
            	var empID = document.getElementById("empID").value;
                $.getJSON("employeeselfnotBracketList.ajaxresponse.htm?empID="+empID, {
                    term: request.term
                }, response);
            }
        });
    });
    
  
        
</script>
    

</body>
</html>
