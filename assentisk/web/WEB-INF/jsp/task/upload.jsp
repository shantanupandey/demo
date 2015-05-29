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

		else if(scheduledata=='' || scheduledata == undefined ){
			$('#taskscheduledataAlert').show();
			$('#taskscheduledataAlert').delay(1500).fadeOut('slow');	
			return false;
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
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("endoccurence").value = 1;	
  			}
  	}
  	function dailyRecur(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("dailyrecur").value = 1;	
  			}
  	
  	}
  	function weeklyRecur(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("recur").value = 1;	
  			}
  	
  	}
  	
  		function daymonthlyrecurfun(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("daymonthlyrecur").value = 1;	
  			}
  	
  		}
  		function monthlyrecurfun(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("monthlyrecur").value = 1;	
  			}
  	
  		}
  	
  	
  	function monthlyrecurofeveryfun(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("monthlyrecurofevery").value = 1;	
  			}
  	
  		}
  		function daymonthlyyearrecurfun(value){
  			if(value== 0)
  			{
  					$('#zeroalert').show();
					$('#zeroalert').delay(1500).fadeOut('slow');
					document.getElementById("daymonthlyyearrecur").value = 1;	
  			}
  	
  		}
  		
  		function ONyearrecurfun(value){
  			if(value== 0)
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
  	
  
  </script>

</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" style="color:black;"> 


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

    <div class="pageheader">
      <h2>upload</h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active">upload</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body">
            <form method="post" action="uploadPicture.assets.htm"  enctype="multipart/form-data">       
          
    
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                   Select file to upload: <input type="file" name="file" size="60" /><br />
					<br /> <input type="submit" value="Upload" />
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->

                   
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
            <span > <c:out value="${sessionScope.Submit_Successfully}"/></span>
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
   
        <script src="js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            
            
            
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
                $.getJSON("employeeBracketList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
  
        
</script>
    

</body>
</html>
