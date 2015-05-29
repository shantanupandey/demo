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
		<script src="js/assessment/auditplan.js"></script>

		<link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css"
			href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" />

		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script
			src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/datepicker.css">
				<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
		
		<style type="text/css">
.ui-datepicker th {
	color: black !important;
}



.description_text_loc {
  border: 1px solid lightgrey;
    border-radius: 3px;
    box-shadow: none;
    color: black;
    font-size: 13px;
    height: auto;
    margin-bottom: 10px;
    margin-top: 3px;
    padding: 8px;
    width: 32px;
}
.add {
    background: none repeat scroll 0 0 #8dc63f;
 
  color: #fff;
  font-size: 18px;
  padding: 6px 13px;
  position: absolute;
  border: none;
  border-radius: 3px;
   
}

.table thead > tr > th, .table tbody > tr > th, .table tfoot > tr > th, .table thead > tr > td, .table tbody > tr > td, .table tfoot > tr > td {
    border: 1px solid #ccc;
  
}
.table th {
    background-image: none !important;
    background-position: right center;
    background-repeat: no-repeat;
    font-size: 12px !important;
    padding: 7px 5px !important;
    vertical-align: middle !important;
}

.table thead > tr > th, .table tbody > tr > th, .table tfoot > tr > th, .table thead > tr > td, .table tbody > tr > td, .table tfoot > tr > td {
    border: 1px solid #ccc;
    color: #3d3f42;
    padding: 5px;
}
.form-control {
    
}

</style>

		<style>.datepicker { z-index: 1151 !important; line-height: 12px; }</style>
<script type="text/javascript">

    
      $(function() {      
        $("#locationdata").autocomplete({
            source: function (request, response) {
                $.getJSON("locationList.ajaxresponse.htm", {
                   term: request.term
                }, response);
            }
        });
        
    });
    $(function() {      
    var auditid=	document.getElementById("auditid").value;
    
        $("#businessProcess").autocomplete({
            source: function (request, response) {
                $.getJSON("businessProcessListdata.ajaxresponse.htm?auditid="+auditid, {
                    term: request.term
                }, response);
            },
            

                        select: function(e, ui) {  
                            var business=ui.item.label;
                           $.get("totalControlsPerbp.assess.htm?businessProc=" + business, function(data, status)
									{
														
										//alert(data);	
										document.getElementById("totalcontrol").value=data;				
														
									});				
                            }

                           
        });
    }); 
    
    
     $(function() {      
        $("#assignTo").autocomplete({
            source: function (request, response) {
                $.getJSON("employeeBracketList.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
    
       $(function() {      
        $("#approver").autocomplete({
            source: function (request, response) {
                $.getJSON("employeeBracketListunique.ajaxresponse.htm", {
                    term: request.term
                }, response);
            }
        });
    });
    
    $(function () {
        $("input[id*='timeValidate']").keydown(function (event) {


            if (event.shiftKey == true) {
                event.preventDefault();
            }

            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190) {

            } else {
                event.preventDefault();
            }
            
            if($(this).val().indexOf('.') !== -1 && event.keyCode == 190)
                event.preventDefault();

        });
    });
    
    
          function isNumber(evt) {   
            evt = (evt) ? evt : window.event;   
              var charCode = (evt.which) ? evt.which : evt.keyCode; 
                  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                           return false;     }     return true; 
                           }
        
        
       function checklocation(location){
        		if(location!=='')
        			{
       										 $.get("checklocationname.org.htm?locationname=" + location, function(data, status)
														{	
															if(data == 'notexist')
															{
																$('#locationnotexistAlert').show();
																$('#locationnotexistAlert').delay(1500).fadeOut('slow');
																document.getElementById("locationdata").value="";	
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
       				 
       				 
       				   function checkassign(assignTo){
       		      			 if(assignTo!=='')
		       	 			{
		       						 $.get("checkreportingname.org.htm?reporting= "+ assignTo, function(data, status)
																{	
																	if(data == 'notexist')
																	{
																		$('#checkassignToAlert').show();
																		$('#checkassignToAlert').delay(1500).fadeOut('slow');	
																		document.getElementById("assignTo").value="";	
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
					      
					      
					         function checkassignforapprover(assignTo){
       		      			 if(assignTo!=='')
		       	 			{
		       						 $.get("checkreportingname.org.htm?reporting= "+ assignTo, function(data, status)
																{	
																	if(data == 'notexist')
																	{
																	
																		$('#checkassignToAlertforapprove').show();
																		$('#checkassignToAlertforapprove').delay(1500).fadeOut('slow');	
																		document.getElementById("approver").value="";	
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
	function callAssignTo(valuedata,id){
	var milestoneID=id.split("_");
	var id=milestoneID[1];
	  var auditid=	document.getElementById("auditid").value;
		 $.get("setAssignTo.assess.htm?milestoneID= "+ id+"&AssignTo="+valuedata, function(data, status)
																{	
																		$(".assignsingle_"+id).val(valuedata);
																		window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
														       });

	}
	
	function callSingleAssignTo(valuedata,id){
	  var auditid =	document.getElementById("auditid").value;
	
		 $.get("setSingleAssignTo.assess.htm?detailID="+id+"&AssignTo="+valuedata+"&auditid="+auditid, function(data, status)
																{	
																					window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
														       });

	}					      
			
	function sendforApprover(){
	
	  var approver =	document.getElementById("approver").value;
	  var auditid =	document.getElementById("auditid").value;
	
	  if(approver==''){
	
	  
	                            $('#filldataofapprover').show();
								$('#filldataofapprover').delay(1500).fadeOut('slow');	
								
	  }
	  else{ 
	
		       			 
		       						 $.get("checkreportingname.org.htm?reporting= "+ approver, function(data, status)
																{	
																
																	if(data == 'notexist')
																	{
																	
																		$('#checkassignToAlertforapprove').show();
																		$('#checkassignToAlertforapprove').delay(1500).fadeOut('slow');	
																		document.getElementById("approver").value="";
																		 return;	
																		
																	}
																	else
																	{
																	
																		 $.get("sendforapprover.assess.htm?approver="+approver+"&auditid="+auditid, 
																		 function(data, status){	
																		    $('#successofsendapproval').show();
																			$('#successofsendapproval').delay(1500).fadeOut('slow');	
																			window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
																	       });	
																	}
														});
		       				 
					        
		       			
		       			
		       				
		       				 }
	
	
	}	
	
	function approved(){
	  var auditid =	document.getElementById("auditid").value;
	          $.get("approve.assess.htm?auditid="+auditid,function(data, status){	
	             $('#successofapprover').show();
																			$('#successofapprover').delay(1500).fadeOut('slow');	
																		 window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
																	       });		
		       				 }
	   
		function estimateday(data,details,miles)		      {
		   
		    var time=data;
		    var detailID = details;
		    var milesID = miles;
		    var auditid  =	document.getElementById("auditid").value;
		     $.get("setTimeChange.assess.htm?detailID="+detailID+"&milesID="+milesID+"&auditid="+auditid+"&time="+time, function(data, status)
					{	
									window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
					});
		}
		
		
       				 
</script>


</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" style="color:black;">


<section>

<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			
			
    <div class="pageheader">
    
    <h3 style="min-width:700px;max-width:700px;word-wrap:break-word;">
    <c:out value="${sessionScope.editauditplanHeader}"/> :&nbsp;<c:out value="${auditName}"/></h3>
     
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.editauditplanHeader}"/></li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
     
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            
            <div class="panel-body" ng-app="auditapp" ng-controller="editAuditPlanDetailsController">
            <form ng-submit="saveData()">        
             
                
              				<div class="row">
										<div class="col-sm-2">
											<div class="form-group">
													<label class="control-label">
													 Location
													</label>			
															</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
											<label class="control-label">
													 <c:out value="${sessionScope.auditBusiness}"/>
											</label>
											
											</div>
										</div>
										<div class="col-sm-2"  style="width: 11.33333%!important;" >
										<div class="form-group">
										<label class="control-label">
										<c:out value="${sessionScope.auditControlNo}"/>
													 
											</label>
										</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.auditassignedto}"/>
												</label>
											</div>
										</div>
										  <div class="col-sm-2" 		>
						                  <div class="form-group">
						                  <label class="control-label">
						                  	<c:out value="${sessionScope.auditStartDate}"/>
						                  </label>
						                  </div>
						                </div><!-- col-sm-6 -->
						                
						                 <div class="col-sm-2">
						                  <div class="form-group">
						                  <label class="control-label">
						                  <c:out value="${sessionScope.auditestimated}"/>
						                  </label>
						                  </div>
						                </div><!-- col-sm-6 -->
						                
						               
										
										
									</div>
              
              				<div class="row">
										<div class="col-sm-2">
											<div class="form-group">
																
																<input type="hidden" id="auditid"  name="auditid" class="form-control" ng-model="auditid"  value="<c:out value="${auditid}"/>">
																<input type="text" id="locationdata"  name="locationdata" class="form-control" ng-model="locationdata" ng-init="locationdata='<c:out value="${location}"/>'" onblur="return checklocation(this.value);" readonly>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
																<input type="text" id="businessProcess" Placeholder="<c:out value="${sessionScope.auditBusiness}"/>" name="businessProcess" class="form-control" ng-model="businessProcess" ng-init="businessProcess=''" >
											
											</div>
										</div>
										<div class="col-sm-1"  style="width: 11.33333%!important;" >
										<div class="form-group">
												<input type="text"  style="align:center" id="totalcontrol"  readonly="" class="form-control" ng-model="totalcontrol" ng-init="totalcontrol='0'" readonly>
										
										</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
														<input type="text" id="assignTo"  Placeholder="<c:out value="${sessionScope.auditassignedto}"/>" name="assignTo" class="form-control" ng-model="assignTo" ng-init="assignTo=''" >
											</div>
										</div>
										  <div class="col-sm-2" 		>
						                  <div class="form-group">
						                    <input type="text" name="startdate" placeholder="<c:out value="${sessionScope.auditStartDate}"/>" class="form-control" id="startdate" value="" autocomplete="off">
						                  </div>
						                </div><!-- col-sm-6 -->
						                
						                 <div class="col-sm-2">
						                  <div class="form-group">
						                    <input type="text" name="estimatedDay" Placeholder="<c:out value="${sessionScope.auditestimated}"/>" class="form-control" id="estimatedDay" value="" onkeypress="return isNumber(event)" maxlength="5"> 
						                  </div>
						                </div><!-- col-sm-6 -->
						                
						                 <button class="add" type="submit" title="<c:out value="${sessionScope.button_submit}"/>">+</button>
						               
										
										
									</div>
									
										
										<!-- col-sm-6 -->
										
									
									
									               
						              
						         
								
						               
              <div class="row" style="display:none;">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">IsActive</label>                    
                    <input type="checkbox" name="isactive" ng-model="isactive" ng-init="isactive=true">
                   
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			</br>			
                    
            </form>
          </div>
        
            
           <div class="content demo-x">
          	<c:if test="${auditSize=='true'}">
          		<c:forEach var="milesList" items="${milestoneList}">
          		
          		
          			<table border="1" class="table table-striped table-condensed table-hover" style="background-color: whitesmoke!important;" id="<c:out value="${milesList.auditmilesID}"/>">
          					<thead>
          						
							  	 <tr>
							   		<th colspan="7" style="line-height:30px;background: #003366;color: #fff;"> 
							   		 <div class="col-sm-5"><font style="font-size:14px; font-weight:bold;"><c:out value="${sessionScope.audit_businessProcess}"/>:</font><font style="font-size:12px; font-weight:normal;">
							   		<c:out value="${milesList.BusinessProcessName}"/></font>
							   		</div>
							   		<c:out value="${sessionScope.audit_assignTo}"/>:
							   		<c:set var="casecheck"  value="0"/>
							   		<c:set var="assignTodata"  value=""/>
							   		<c:forEach var="auditAssignlist" items="${auditAssign}">
							   			<c:if test="${auditAssignlist.auditMilesID == milesList.auditmilesID}">
							   				<c:set var="casecheck"  value="1"/>
							   				<c:set var="assignTodata"  value="${auditAssignlist.assignedTo}"/>
							   			</c:if>
							   		</c:forEach>					   	
							   			
							  			<c:choose>
							  					<c:when test="${casecheck== '1'}">
							  					   <select  style="font-size:12px; font-weight:normal;padding: 8px 0;border-radius:3px;border:1px solid #ccc;" id="assignToAll_<c:out value="${milesList.auditmilesID}"/>" class="assignToAll_<c:out value="${milesList.auditmilesID}"/>"
													 onchange="callAssignTo(this.value,this.id)"  ng-init="assignToAll=''" class="form-control">
													<option value="">
														--  Select  --	
													</option>
													<c:forEach var="list" items="${userList}">
													<c:choose>
															<c:when test="${list.username == assignTodata}">
																	<option value="<c:out value="${list.username}"/>" selected>
																		<c:out value="${list.username}" />
																	</option>
															</c:when>
															<c:otherwise>
																	<option value="<c:out value="${list.username}"/>">
																		<c:out value="${list.username}" />
																	</option>
															</c:otherwise>
													
													</c:choose>
														
													</c:forEach>
												  </select>
												</c:when>
							  					<c:otherwise> 
							  					<select  style="font-size:12px; font-weight:normal;padding: 8px 0;border-radius:3px;border:1px solid #ccc;
" id="assignToAll_<c:out value="${milesList.auditmilesID}"/>" class="assignToAll_<c:out value="${milesList.auditmilesID}"/>"
													 onchange="callAssignTo(this.value,this.id)"  ng-init="assignToAll=''" >
													<option value="">
														--  Select  --
													</option>
													<c:forEach var="list" items="${userList}">
														<option value="<c:out value="${list.username}"/>">
															<c:out value="${list.username}" />
														</option>
													</c:forEach>
												</select>
												</c:otherwise>
							  			
							  			</c:choose>	
							   		
							   		&nbsp;&nbsp;&nbsp;&nbsp; <font style="font-size:14px; font-weight:bold;"><c:out value="${sessionScope.audit_startDate}"/>:</font>&nbsp;<font style="font-size:12px; font-weight:normal;"><c:out value="${milesList.startDate}"/></font>
							   		
							   		&nbsp;&nbsp;&nbsp;&nbsp; <font style="font-size:14px; font-weight:bold;"><c:out value="${sessionScope.audit_endDate}"/>:</font>&nbsp;<font style="font-size:12px; font-weight:normal;"><c:out value="${milesList.endDate}"/></font></th>
							   	</tr>
							   	 <tr>
							   		<th style="text-align: center;min-width:100px;max-width:100px;"><c:out value="${sessionScope.audit_control_id}"/></th>
							   		<th style="text-align: center;min-width:200px;max-width:200px;"><c:out value="${sessionScope.audit_control_risk}"/></th>
							   		<th style="text-align: center;min-width:300px;max-width:300px;"><c:out value="${sessionScope.audit_objective}"/></th>
							   		<th style="text-align: center;"><c:out value="${sessionScope.audit_assignTo}"/></th>
							   		<th style="text-align: center;"><c:out value="${sessionScope.audit_estimate}"/></th>
							   		<th style="text-align: center;"><c:out value="${sessionScope.audit_startDate}"/></th>
							   		<th style="text-align: center;"><c:out value="${sessionScope.audit_endDate}"/></th>
							   	
							   	</tr>
							   	<c:forEach var="detailList" items="${milestoneDetailsList}">
									   	<c:if test="${detailList.auditMilesID==milesList.auditmilesID}">
									   		<tr>
									   			<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									   					<c:out value="${detailList.controlID}"/>
									   			</td>
									   			<td style="min-width:200px;max-width:200px;word-wrap:break-word;" >
									   					<c:out value="${detailList.Riskdata}"/>
									   			</td>
									   			<td  style="min-width:300px;max-width:300px;word-wrap:break-word;">
									   					<c:out value="${detailList.Control_Objectivedata}"/>
									   			</td>
									   			<td style="text-align:center;">
									   			<select   class="assignsingle_<c:out value="${milesList.auditmilesID}"/>"  id="<c:out value="${detailList.detailID}"/>"
									   			 onchange="callSingleAssignTo(this.value,this.id)" style="font-size:12px; font-weight:normal;padding: 8px 0;border-radius:3px;border:1px solid #ccc;">
													<option value="">
														-- Select  --
													</option>
													<c:forEach var="list" items="${userList}">
													<c:choose>
															<c:when test="${list.username == detailList.assignedTo}">
																<option value="<c:out value="${list.username}"/>" selected>
																	<c:out value="${list.username}" />
																</option>
															</c:when>
															<c:otherwise>
																<option value="<c:out value="${list.username}"/>">
																	<c:out value="${list.username}" />
																</option>
															
															</c:otherwise>
													</c:choose>
													
													</c:forEach>
												</select>
									   			
									   				
									   			</td>
									   			<td style="text-align:center;">
									   			
<!--									   			<c:out value="${detailList.EstimatedTime}"/>-->
									   				<input type="text"  id="timeValidate" name="time" style="width:66px;text-align:center"
									   				  class="form-control" value="<c:out value="${detailList.EstimatedTime}"/>"  maxlength="5" onchange="estimateday(this.value,'<c:out value="${detailList.detailID}"/>','<c:out value="${detailList.auditMilesID}"/>')"> 
									   					
									   			</td>
									   			<td style="text-align:center;">
									   				<c:out value="${detailList.startDate}"/>
									   			</td>
									   				<td style="text-align:center;">
									   					<c:out value="${detailList.endDate}"/>
									   			</td>
									   			
									   		</tr>
									   	</c:if>
							   	</c:forEach>
							 </thead>
          			</table>
          			
          	   
          	   
          		
          		</c:forEach>
          	</c:if>
          </div>
      
        </div>
      </div>

<c:if test="${buttonCreated==sessionScope.UserRecordID}">  
<c:if test="${status =='0' || status=='Approved'}">
<div>
     
    <!-- contentpanel -->
    <div class="col-sm-3">&nbsp;</div>
	 	<div class="col-sm-3" align="center" style="text-align:center;">
											<div class="form-group">
														<input type="text" id="approver"  Placeholder="<c:out value="${sessionScope.approval}"/>" name="approver" class="form-control" ng-model="approver" ng-init="approver=''" >
											</div>
										</div>
              <button class="btn btn-primary"  style="margin-top:9px;" onclick="sendforApprover();" title="<c:out value="${sessionScope.approval_send}"/>"><c:out value="${sessionScope.approval_send}"/></button>

</div>
</c:if>
</c:if> 

<c:if test="${buttonApprover==sessionScope.UserRecordID}">  
<c:if test="${status=='Pending for Approval'}"> 
 <div class="col-sm-3">&nbsp;</div>
	<div class="col-sm-3" align="center" style="text-align:center;">
											<div class="form-group">  	
              <button class="btn btn-primary"  style="" onclick="approved();" title="<c:out value="${sessionScope.approve}"/>"><c:out value="${sessionScope.approve}"/></button>
	
	</div>
	</div>
	</c:if>
	</c:if>	
  </div><!-- mainpanel -->
        <input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">		
 <input type="hidden" name="datasize" id="datasize" value="<c:out value="${datasize}"/>"	>

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
		<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
		(function($){
			$(window).load(function(){

			var flag=false;		
				 var datasize=document.getElementById("datasize").value;
				if(datasize== 'true')
  					{
  						 $('#dialog-12').modal('show');
 					
  					}
				$.mCustomScrollbar.defaults.theme="light-2"; //set "light-2" as the default theme
				
				$(".demo-y").mCustomScrollbar();
				
				$(".demo-x").mCustomScrollbar({
					axis:"x",
					advanced:{autoExpandHorizontalScroll:true}
				});
				
				$(".demo-yx").mCustomScrollbar({
					axis:"yx"
				});
				
				$(".scrollTo a").click(function(e){
					e.preventDefault();
					var $this=$(this),
						rel=$this.attr("rel"),
						el=rel==="content-y" ? ".demo-y" : rel==="content-x" ? ".demo-x" : ".demo-yx",
						data=$this.data("scroll-to"),
						href=$this.attr("href").split(/#(.+)/)[1],
						to=data ? $(el).find(".mCSB_container").find(data) : el===".demo-yx" ? eval("("+href+")") : href,
						output=$("#info > p code"),
						outputTXTdata=el===".demo-yx" ? data : "'"+data+"'",
						outputTXThref=el===".demo-yx" ? href : "'"+href+"'",
						outputTXT=data ? "$('"+el+"').find('.mCSB_container').find("+outputTXTdata+")" : outputTXThref;
					$(el).mCustomScrollbar("scrollTo",to);
					output.text("$('"+el+"').mCustomScrollbar('scrollTo',"+outputTXT+");");
				});
				
				var value= document.getElementById("toggledata").value;
					
            		if(value==1){  			
            			if(flag == false)
            			{            			
            				flag = true;
            				
            		  		$('div#mCSB_1_container').removeAttr('style');
            		        $('div#mCSB_1_container').removeAttr('id');
            		        $('div#mCSB_1_container').removeAttr('ltr');
            		        	$('div#mCSB_1_dragger_horizontal').css('display','block');
            		        	   $('div#mCSB_1_container').css('display','block');			
            			}
            			
            			else if(flag  == true)
            			{            				
            				flag = false;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  				$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  				   $('div#mCSB_1_container').css('display','block');
            			}
            			}
            			else if(value==0){  			
            			if(flag == true)
            			{            			
            				flag = false;
            					
            		  		 $('div#mCSB_1_container').removeAttr('style');
            		   		 $('div#mCSB_1_container').removeAttr('id');
            		  		 $('div#mCSB_1_container').removeAttr('ltr');	
            		  		 $('div#mCSB_1_dragger_horizontal').css('display','block');	
            		  		    $('div#mCSB_1_container').css('display','block');	
            			}
            			
            			else if(flag  == false)
            			{            				
            				flag = true;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  				$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  				   $('div#mCSB_1_container').css('display','block');
            			}
            			}
				
			});
		})(jQuery);
	</script>
		


 <div id="submitSucess" class="success">
         <span > <font color="white"><c:out value="${sessionScope.success_message}"/></font> </span>
 </div>
 <div  id="auditAlert" class="error2">
         <span ><font color="white"> <c:out value="${sessionScope.auditname_alert}"/></font> </span>
 </div>
  <div  id="validauditname" class="error2">
         <span ><font color="white"> <c:out value="${sessionScope.auditname_valid_alert}"/></font> </span>
 </div>
  <div  id="validcountryname" class="error2">
         <span ><font color="white"> <c:out value="${sessionScope.validcountryname}"/></font> </span>
 </div>
   <div  id="divlocationAlert" class="error2">
         <span ><font color="white"><c:out value="${sessionScope.Application_LocationAlert}"/></font></span>
 </div>
  <div id="wrongLocs" class="error2">
         <span ><font color="white"> <c:out value="${sessionScope.Application_selectLoc_Alert}"/></font></span>
 </div>
  <div id="wrongAddLoc" class="error2">
         <span ><font color="white"><c:out value="${sessionScope.Application_addValidLoc_Alert}"/></font> </span>
 </div>
 <div id="alreadyAdd" class="error2">
         <span ><font color="white"><c:out value="${sessionScope.Application_AlreadyAddedAlert}"/></font></span>
 </div>
 <div id="locationnotexistAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditLocationNotExistAlert}"/></font>
			</span>
		</div>
		
<div id="auditlocationAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditlocationAlert}"/></font>
			</span>
</div>
<div id="auditbusinessAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditbusinessAlert}"/></font>
			</span>
</div>
<div id="auditassignAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditassignAlert}"/></font>
			</span>
</div>
<div id="auditstartdateAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditstartdateAlert}"/></font>
			</span>
</div>
<div id="auditestimatedAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.auditestimatedAlert}"/></font>
			</span>
</div>
<div id="checkassignToAlert" class="error2">
			<span><font color="white"> <c:out value="${sessionScope.checkassignToAlert}" /></font> </span>
</div>
<div id="businessnotexistAlert" class="error2">
			<span><font color="white"><c:out value="${sessionScope.businessnotexistAlert}"/></font>
		</span>
</div>
<div id="checkassignToAlertforapprove" class="error2">
			<span><font color="white"><c:out value="${sessionScope.checkassignToAlertforapprove}"/></font>
		</span>
</div>
<div id="filldataofapprover" class="error2">
			<span><font color="white"><c:out value="${sessionScope.filldataofapprover}"/></font>
		</span>
</div>
<div id="successofapprover" class="success">
			<span><font color="white"><c:out value="${sessionScope.successofapprover}"/></font>
		</span>
</div>
<div id="successofsendapproval" class="success">
			<span><font color="white"><c:out value="${sessionScope.successofsendapproval}"/></font>
		</span>
</div>
<div id="properentry" class="error2">
			<span><font color="white"><c:out value="${sessionScope.properentry}"/></font>
		</span>
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

	
			
		var datePicker11 = $('#startdate').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
       
        });
  	 
            
            });
     
            
            
        </script>

	</body>
</html>
