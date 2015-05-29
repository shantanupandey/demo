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
		<script src="js/regulations/controlCategory.js"></script>

		<link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
		<link rel="stylesheet" href="css/style.css">
		<script src="http://code.jquery.com/jquery-1.7.2.min.js"
			type="text/javascript">
	
</script>

		<script type="text/javascript">
	$(document).ready(function() {
		$('.tree li').each(function() {
			if ($(this).children('ul').length > 0) {
				$(this).addClass('parent');
			}
		});

		$('.tree li.parent > a').click(function() {
			$(this).parent().toggleClass('active');
			$(this).parent().children('ul').slideToggle('fast');
		});

		$('#all').click(function() {

			$('.tree li').each(function() {
				$(this).toggleClass('active');
				$(this).children('ul').slideToggle('fast');
			});
		});

		$('.tree li').each(function() {
			$(this).toggleClass('active');
			$(this).children('ul').slideToggle('fast');
		});

	});
	
	function edit(id,name,buisness,control){
	
	 $('#parent').removeAttr('disabled');
	
	 $('#controlCategory').val(name);
	 $("#buisnessProcess").val(buisness);
	 $("#parent").val(control);
	 $('#formStatus').val("update");
	 $('#controlId').val(id);
	 
	 
	 if(control==0){
	 
	  $('#parent').attr("disabled","disabled");
	 }
	 
	 document.getElementById("header").innerHTML = "Edit Control Category";
	 
	
	}
</script>
	</head>

	<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			

			<div class="pageheader">
				<h2 id="header">
					<c:out value="${sessionScope.addcontrol_page_header}" />
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out
							value="${sessionScope.DashBoard_YouAreHere}" />:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.addcontrol_page_header}" />
						</li>
					</ol>
				</div>
			</div>
            <input type="hidden" id="formStatus" value=""/>
            <input type="hidden" id="controlId" value=""/>
            
			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">

							<div class="panel-body" ng-app="controlapp"
								ng-controller="addcontrolController">
								<form ng-submit="saveData()">



									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.Control_category}" />
													<font color="red">*</font>
												</label>
												<input type="text" name="controlCategory"
													id="controlCategory" class="form-control"
													ng-model=controlCategory ng-init='controlCategory = ""'
													maxlength="25">
											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->


									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label">
													<c:out value="${sessionScope.BuisnessProcessHeader}" />
													<font color="red">*</font>
												</label>
												<select id="buisnessProcess" class="form-control" ng-model="buisnessProcess"
													ng-init="buisnessProcess=''">
													<option value="">
														-- Select Buisness Process --
													</option>
													<c:forEach var="list" items="${BusinessProcessList}">
														<option value="<c:out value="${list.BusinessProcessID}"/>">
															<c:out value="${list.BusinessProcessName}" />
														</option>
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
													<c:out value="${sessionScope.Parent}" />
													<font color="red">*</font>
												</label>

												<c:choose>

													<c:when test="${ControlCategorysListSize>0}">
														<select id="parent" class="form-control" ng-model="parent"
															ng-init="parent=''">
															<option value="">
																-- Select Control Category --
															</option>
															<c:forEach var="list" items="${ControlCategorysList}">
																<option value="<c:out value="${list.CtrlCategory_ID}"/>">
																	<c:out value="${list.CtrlCategoryName}" />
																</option>
															</c:forEach>
														</select>
													</c:when>
													<c:otherwise>
														<select id="parent" class="form-control" ng-model="parent"
															ng-init="parent=''" disabled="disabled">
															<option value="">
																-- Select Control Category --
															</option>

														</select>
													</c:otherwise>

												</c:choose>

											</div>
										</div>
										<!-- col-sm-6 -->
									</div>
									<!-- row -->




									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit"
											title="<c:out value="${sessionScope.submit}"/>">
											<c:out value="${sessionScope.submit}" />
										</button>
										<a href="controlCategory.reg.htm"><button class="btn btn-primary"
												type="button"
												title="<c:out value="${sessionScope.cancel}"/>">
												<c:out value="${sessionScope.cancel}" />
											</button> </a>
										<button type="reset" class="btn btn-default"
											ng-click="reset()"
											title="<c:out value="${sessionScope.reset}"/>">
											<c:out value="${sessionScope.reset}" />
										</button>

									</div>
								</form>

								<div id="wrapper">
									<div class="tree" style="width:1100px">
										<!--<button id="all">Toggle All</button>-->
										<ul>

											<c:forEach var="list" items="${ControlCategorysList}"
												varStatus="counter">
												<c:set var="ID" value="${list.CtrlCategory_Parent}"></c:set>
												<c:set var="parentId" value="${list.CtrlCategory_ID}"></c:set>
												<c:if test="${ID eq '0'}">
													<li>
													    
														<a onclick="edit('<c:out value="${list.CtrlCategory_ID}"/>','<c:out value="${list.CtrlCategoryName}"/>','<c:out value="${list.BusinessProcessID}"/>','<c:out value="${list.CtrlCategory_Parent}"/>');"><c:out value="${list.CtrlCategoryName}"></c:out> </a>

														<c:forEach begin="${counter.count}" var="listVal"
															items="${ControlCategorysList}" varStatus="count">
															<c:set var="innerCategoryId"
																value="${listVal.CtrlCategory_ID}"></c:set>





															<c:set var="childId"
																value="${listVal.CtrlCategory_Parent}"></c:set>
															<ul>
																<c:if test="${parentId eq childId}">
																	<c:set var="prntId" value="${listVal.CtrlCategory_ID}"></c:set>
																	<li>
																		<a onclick="edit('<c:out value="${listVal.CtrlCategory_ID}"/>','<c:out value="${listVal.CtrlCategoryName}"/>','<c:out value="${listVal.BusinessProcessID}"/>','<c:out value="${listVal.CtrlCategory_Parent}"/>');"><c:out value="${listVal.CtrlCategoryName}"></c:out>
																		</a>
																		<ul>
																			<c:forEach begin="${count.count}" var="listV"
																				items="${ControlCategorysList}" varStatus="count1">
																				<c:set var="innerCatId"
																					value="${listV.CtrlCategory_ID}"></c:set>





																				<c:set var="chdId"
																					value="${listV.CtrlCategory_Parent}"></c:set>

																				<c:if test="${prntId eq chdId}">
																					<c:set var="prntId1"
																						value="${listV.CtrlCategory_ID}"></c:set>
																					<li>
																						<a onclick="edit('<c:out value="${listV.CtrlCategory_ID}"/>','<c:out value="${listV.CtrlCategoryName}"/>','<c:out value="${listV.BusinessProcessID}"/>','<c:out value="${listV.CtrlCategory_Parent}"/>');"><c:out value="${listV.CtrlCategoryName}"></c:out>
																						</a>

																						<ul>
																							<c:forEach begin="${count1.count}" var="listV1"
																								items="${ControlCategorysList}"
																								varStatus="count2">
																								<c:set var="innerCatId1"
																									value="${listV1.CtrlCategory_ID}"></c:set>


																								<c:set var="chdId1"
																									value="${listV1.CtrlCategory_Parent}"></c:set>

																								<c:if test="${prntId1 eq chdId1}">
																									<c:set var="prntId2"
																										value="${listV1.CtrlCategory_ID}"></c:set>
																									<li>
																										<a onclick="edit('<c:out value="${listV1.CtrlCategory_ID}"/>','<c:out value="${listV1.CtrlCategoryName}"/>','<c:out value="${listV1.BusinessProcessID}"/>','<c:out value="${listV1.CtrlCategory_Parent}"/>');"><c:out
																												value="${listV1.CtrlCategoryName}"></c:out>
																										</a>
																										<ul>
																											<c:forEach begin="${count2.count}"
																												var="listV2" items="${ControlCategorysList}" varStatus="count3">
																												<c:set var="innerCatId2"
																													value="${listV2.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId2"
																													value="${listV2.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId2 eq chdId2}">
																												<c:set var="prntId3"
																										value="${listV2.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV2.CtrlCategory_ID}"/>','<c:out value="${listV2.CtrlCategoryName}"/>','<c:out value="${listV2.BusinessProcessID}"/>','<c:out value="${listV2.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV2.CtrlCategoryName}"></c:out>
																														</a>
																														<ul>
																											<c:forEach begin="${count3.count}"
																												var="listV3" items="${ControlCategorysList}" varStatus="count4">
																												<c:set var="innerCatId3"
																													value="${listV3.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId3"
																													value="${listV3.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId3 eq chdId3}">
																												<c:set var="prntId4" value="${listV3.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV3.CtrlCategory_ID}"/>','<c:out value="${listV3.CtrlCategoryName}"/>','<c:out value="${listV3.BusinessProcessID}"/>','<c:out value="${listV3.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV3.CtrlCategoryName}"></c:out>
																														</a>
																														<ul>
																											<c:forEach begin="${count4.count}"
																												var="listV4" items="${ControlCategorysList}" varStatus="count5">
																												<c:set var="innerCatId4"
																													value="${listV4.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId4"
																													value="${listV4.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId4 eq chdId4}">
																												<c:set var="prntId5" value="${listV4.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV4.CtrlCategory_ID}"/>','<c:out value="${listV4.CtrlCategoryName}"/>','<c:out value="${listV4.BusinessProcessID}"/>','<c:out value="${listV4.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV4.CtrlCategoryName}"></c:out>
																														</a>
																												<ul>
																											<c:forEach begin="${count5.count}"
																												var="listV5" items="${ControlCategorysList}" varStatus="count6">
																												<c:set var="innerCatId5"
																													value="${listV5.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId5"
																													value="${listV5.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId5 eq chdId5}">
																												<c:set var="prntId6" value="${listV5.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV5.CtrlCategory_ID}"/>','<c:out value="${listV5.CtrlCategoryName}"/>','<c:out value="${listV5.BusinessProcessID}"/>','<c:out value="${listV5.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV5.CtrlCategoryName}"></c:out>
																														</a>
																										<ul>
																											<c:forEach begin="${count6.count}"
																												var="listV6" items="${ControlCategorysList}" varStatus="count7">
																												<c:set var="innerCatId6"
																													value="${listV6.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId6"
																													value="${listV6.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId6 eq chdId6}">
																												<c:set var="prntId7" value="${listV6.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV6.CtrlCategory_ID}"/>','<c:out value="${listV6.CtrlCategoryName}"/>','<c:out value="${listV6.BusinessProcessID}"/>','<c:out value="${listV6.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV6.CtrlCategoryName}"></c:out>
																														</a>
																										<ul>
																											<c:forEach begin="${count7.count}"
																												var="listV7" items="${ControlCategorysList}" varStatus="count8">
																												<c:set var="innerCatId7"
																													value="${listV7.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId7"
																													value="${listV7.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId7 eq chdId7}">
																												<c:set var="prntId8" value="${listV7.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV7.CtrlCategory_ID}"/>','<c:out value="${listV7.CtrlCategoryName}"/>','<c:out value="${listV7.BusinessProcessID}"/>','<c:out value="${listV7.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV7.CtrlCategoryName}"></c:out>
																														</a>
																														
																														
																														
																											<ul>
																											<c:forEach begin="${count8.count}"
																												var="listV8" items="${ControlCategorysList}" varStatus="count9">
																												<c:set var="innerCatId8"
																													value="${listV8.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId8"
																													value="${listV8.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId8 eq chdId8}">
																												<c:set var="prntId9" value="${listV8.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV8.CtrlCategory_ID}"/>','<c:out value="${listV8.CtrlCategoryName}"/>','<c:out value="${listV8.BusinessProcessID}"/>','<c:out value="${listV8.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV8.CtrlCategoryName}"></c:out>
																														</a>
																														
																														
																										   <ul>
																											<c:forEach begin="${count9.count}"
																												var="listV9" items="${ControlCategorysList}" varStatus="count10">
																												<c:set var="innerCatId9"
																													value="${listV9.CtrlCategory_ID}"></c:set>

																												<c:set var="chdId9"
																													value="${listV9.CtrlCategory_Parent}"></c:set>

																												<c:if test="${prntId9 eq chdId9}">
																												<c:set var="prntId10" value="${listV9.CtrlCategory_ID}"></c:set>
																													<li>
																														<a onclick="edit('<c:out value="${listV9.CtrlCategory_ID}"/>','<c:out value="${listV9.CtrlCategoryName}"/>','<c:out value="${listV9.BusinessProcessID}"/>','<c:out value="${listV9.CtrlCategory_Parent}"/>');"><c:out
																																value="${listV9.CtrlCategoryName}"></c:out>
																														</a>
																														
																													</li>
																												</c:if>
																											</c:forEach>
																										  </ul>
																														
																													</li>
																												</c:if>
																											</c:forEach>
																										  </ul>
																														
																														
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																													</li>
																												</c:if>
																											</c:forEach>
																										</ul>
																									</li>
																								</c:if>
																							</c:forEach>
																						</ul>

																					</li>
																				</c:if>





																			</c:forEach>
																		</ul>
																	</li>


																</c:if>
															</ul>




														</c:forEach>
													</li>
												</c:if>
											</c:forEach>

											<!--<li><a>First Level</a>
			<ul>
				<li><a>Second Level</a>
					<ul>
						<li><a>Third Level</a></li>
						<li><a>Third Level</a></li>
						<li><a>Third Level</a>
							<ul>
								<li><a>Fourth Level</a></li>
								<li><a>Fourth Level</a></li>
								<li><a>Fourth Level</a>
									<ul>
										<li><a>Fifth Level</a></li>
										<li><a>Fifth Level</a></li>
										<li><a>Fifth Level</a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a>Second Level</a></li>
			</ul>
		</li>
		<li><a>First Level</a>
			<ul>
				<li><a>Second Level</a></li>
				<li><a>Second Level</a></li>
			</ul>
		</li>

-->
										</ul>

									</div>
								</div>
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

		<div id="submitSucess" class="success">
			<span> <c:out value="${sessionScope.SubmitAlert}" /> </span>
		</div>

		<div id="controlidAlert" class="error2">
			<span> <c:out value="${sessionScope.controlidalert}" /> </span>
		</div>

		<div id="controlidconfirmAlert" class="error2">
			<span> <c:out value="${sessionScope.controlidconfirmalert}" />
			</span>
		</div>

		<div id="buisnessProcessDiv" class="error2">
			<span> <c:out value="${sessionScope.buisnessProcessMessage}" /> </span>
		</div>

	</body>
</html>
