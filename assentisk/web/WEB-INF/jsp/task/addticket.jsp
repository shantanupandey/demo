<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
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
		<script src="js/supports/ticket.js"></script>
		
		
		<link rel="stylesheet" href="css/jquery-ui.css">
 		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
 		<script src="js/jquery-ui.js"></script>
 		
		<script src="//cdn.ckeditor.com/4.4.7/basic/ckeditor.js"></script>
 		
<script type="text/javascript">
    
  $(function() {      
        $("#responsiblehead").autocomplete({
            source: function (request, response) {
            
            	var empID = '<%=session.getAttribute("UserRecordID")%>';             	         
                $.getJSON("employeeselfnotBracketList.ajaxresponse.htm?empID="+empID, {
                    term: request.term
                }, response);
            }
        });
    });
        
</script>




	</head>


<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">

<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.addTicketHeader}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.addTicketHeader}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="ticketapp"
								ng-controller="addTicketController">
								<form ng-submit="saveData()">
								
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.ticket_Category}"/><font color="red">*</font>
												</label>
												
												<select class="form-control" id="catList" name="catList" ng-model="catList" ng-init="catList=''">
													<option value="">
														-- Select Category --
													</option>
													<c:forEach var="list" items="${categoryList}">
														<option value="<c:out value="${list.id}"/>">
															<c:out value="${list.category}" />
													</c:forEach>
												</select>
												
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.ticket_title}"/><font color="red">*</font>
												</label>

												<input type="text" name="title" id="title" class="form-control"
													ng-model="title" ng-init="title=''" maxlength="100">

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									
										<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.ticket_details}"/><font color="red">*</font>
												</label>

												<input type="text" name="detail" id="detail" class="form-control"
													ng-model="detail" ng-init="detail=''" maxlength="100">
													
													<script>
											           CKEDITOR.replace( 'detail',
														{
														  removePlugins: 'toolbar',
															height: '100px',
															enterMode : CKEDITOR.ENTER_BR,
       														shiftEnterMode: CKEDITOR.ENTER_P
														} );
											        </script>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.ticket_priority}" />
												
												</label>
												<select class="form-control" id="priority" name="priority" ng-model="priority" ng-init="priority=''">
													<option value="">
														-- Select Priority --
													</option>
													<c:forEach var="list" items="${priorityList}">
														<option value="<c:out value="${list.id}"/>">
															<c:out value="${list.priority}" />
													</c:forEach>
												</select>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.ticket_assignedTo}"/><font color="red">*</font>
												</label>
												
 											<input type="text" name="responsiblehead" class="form-control" ng-model="responsiblehead" id="responsiblehead" ng-init="responsiblehead=''">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row" style="display:none;">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.IsActive}"/>
												</label>
												 <input type="checkbox" name="isactive" ng-model="isactive" ng-init="isactive=true">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->
									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit" title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}"/>
										</button>
										
										 <button onClick="location.href = 'ticket.assets.htm'"
												class="btn btn-primary" type="button" title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}"/>
									    </button>  
										<button type="reset" class="btn btn-default"
											ng-click="reset()" title="<c:out value="${sessionScope.reset}"/>">
											<c:out value="${sessionScope.reset}"/>
										</button>


									</div>
								</form>
							</div>
						</div>

					</div>





				</div>
				<!-- contentpanel -->

			</div>
			<!-- mainpanel -->

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



 

 <div  id="alertSuc" class="success">
         <span ><c:out value="${sessionScope.SubmitAlert}"/></span>
 </div>


<div  id="checkNameAlert" class="error2">
         <span > <c:out value="${sessionScope.duplicate_application_validation}"/> </span>
 </div>
  <div  id="checkResponsibleAlert" class="error2">
         <span > <c:out value="${sessionScope.responsible_head_message}"/> </span>
 </div>

<div  id="divTicketTitleAlert" class="error2">
         <span > <c:out value="${sessionScope.divTicketTitleAlert}"/> </span>
 </div>
 
 <div  id="validTicketTitle_alert" class="error2">
         <span > <c:out value="${sessionScope.validTicketTitle_alert}"/> </span>
 </div>

 <div  id="divTicketDetailAlert" class="error2">
         <span > <c:out value="${sessionScope.divTicketDetailAlert}"/> </span>
 </div>
  <div  id="divTicketAssignAlert" class="error2">
         <span > <c:out value="${sessionScope.divTicketAssignAlert}"/> </span>
 </div>
  <div  id="ticket_Category_alert" class="error2">
         <span > <c:out value="${sessionScope.ticket_Category_alert}"/> </span>
 </div>
	</body>
</html>
