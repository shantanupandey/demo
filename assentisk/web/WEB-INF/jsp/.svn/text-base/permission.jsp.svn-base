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

		<script>
	var editapp = angular.module('editapp', []);

	editapp
			.config( [
					'$httpProvider',
					function($httpProvider) {
						$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
					} ]);

	function editPermissionController($scope, $http) {
	   $("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#usergroup").addClass("active");

 	$("#imageloader").css("display", "none");
      $("#complete").css("display", "block");
		$scope.reset = function() {
		};

		$scope.saveData = function() {
			var responsePromise = $http.post("updatepermission.group.htm?name="
					+ $scope.title + "&isactive=" + $scope.isactive + "&desc="
					+ $scope.desc + "&gid=" + $scope.gid);
			responsePromise.success(function(data, status, headers, config) {
				window.location.href = "group.group.htm";
			});
		};

	}
</script>


		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
	</head>


	<body style="color: #000;"  class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="header.jsp"%>

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.Permissions}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					 <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li><a href="dashboard.login.htm">Assentisk</a></li>
						<li class="active">
							<c:out value="${sessionScope.Permissions}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body" ng-app="editapp"
								ng-controller="editPermissionController">
								<form name="gpform" id="gpform"
									action="<c:url value="/updatepermission.group.htm"/>"
									method="post" enctype="multipart/form-data">
									<input type="hidden" name="groupid" class="form-control"
										ng-model="groupid"
										ng-init='groupid = "<c:out value="${groupid}"/>"'
										value="<c:out value="${groupid}"/>">

									<table border="0" style="margin-bottom: 15px;" class="display"
										width="100%">

										<tbody>
											<c:forEach var="list" items="${getPermission}">


												<c:choose>
													<c:when test="${list.is_milestone == '0'}">
														<tr style="height: 42px;" >
															<td style="padding-left: 15px !important;" >
																<c:out value="${list.modules_name}" />
															</td>
															
															<c:choose>
																<c:when test="${list.view_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_view_mod == '1'}">
																			<td  >
																				<c:out value="${sessionScope.view}"/>&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td  >
																				<c:out value="${sessionScope.view}"/>&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td   >
																		&nbsp;
																	</td>
																</c:otherwise>

															</c:choose>

															<c:choose>
																<c:when test="${list.add_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_add_mod == '1'}">
																			<td>
																				<c:out value="${sessionScope.add}"/>&nbsp;
																				<input class="add"
																					name="add_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="add_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td>
																				<c:out value="${sessionScope.add}"/>&nbsp;
																				<input class="add"
																					name="add_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="add_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>

															</c:choose>
															<c:choose>
																<c:when test="${list.edit_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_edit_mod == '1'}">
																			<td>
																				<c:out value="${sessionScope.edit}"/>&nbsp;
																				<input class="edit"
																					name="edit_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="edit_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td>
																				<c:out value="${sessionScope.edit}"/>&nbsp;
																				<input class="edit"
																					name="edit_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="edit_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${list.delete_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_delete_mod == '1'}">
																			<td>
																				<c:out value="${sessionScope.delete}"/>&nbsp;
																				<input class="delete"
																					name="delete_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="delete_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td>
																				<c:out value="${sessionScope.delete}"/>&nbsp;
																				<input class="delete"
																					name="delete_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="delete_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>
															</c:choose>
															
														</tr>
														<tr>
														<td>
																		&nbsp;
														</td>
														<c:choose>
																<c:when test="${list.per_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_per_mod == '1'}">
																			<td >
																				<c:out value="${sessionScope.Permission}"/>&nbsp;
																				<input class="per"
																					name="per_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="per_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td > 
																				<c:out value="${sessionScope.Permission}"/>&nbsp;
																				<input class="per"
																					name="per_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="per_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																
															</c:choose>
														<c:choose>
																<c:when test="${list.sch_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_sch_mod == '1'}">
																			<td >
																				<c:out value="${sessionScope.Schedule}"/>&nbsp;
																				<input class="sch"
																					name="sch_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="sch_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td >
																				<c:out value="${sessionScope.Schedule}"/>&nbsp;
																				<input class="sch"
																					name="sch_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="sch_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																
															</c:choose>
															
														<c:choose>
																<c:when test="${list.copy_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_copy_mod == '1'}">
																			<td>
																				<c:out value="${sessionScope.Copy}"/>&nbsp;
																				<input class="copy"
																					name="copy_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="copy_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td>
																				<c:out value="${sessionScope.Copy}"/>&nbsp;
																				<input class="copy"
																					name="copy_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="copy_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>
															</c:choose>
															
														</tr>

													</c:when>
													<c:when test="${list.is_milestone == '1'}">
														<tr style="background-color:lightgrey;">
															<td >
																<c:out value="${list.modules_name}" />
															</td>
															<c:choose>
																<c:when test="${list.view_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_view_mod == '1'}">
																			<td colspan=7>
																				&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td colspan=7>&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>

															</c:choose>
														</tr>

														</c:when>
														<c:when test="${list.is_milestone == '2'}">
														<tr style="background-color:lightgrey;border-bottom:2px solid white;">
															<td >
																<c:out value="${list.modules_name}" />
															</td>
															<c:choose>
																<c:when test="${list.view_mod == '1'}">
																	<c:choose>
																		<c:when test="${list.gp_view_mod == '1'}">
																			<td colspan=7>
																				&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" checked />
																			</td>
																		</c:when>
																		<c:otherwise>
																			<td colspan=7>&nbsp;
																				<input class="view"
																					name="view_<c:out value="${list.id}"/>"
																					type="checkbox"
																					id="view_<c:out value="${list.id}"/>" />
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td>
																		&nbsp;
																	</td>
																</c:otherwise>

															</c:choose>
														</tr>

														</c:when>
														

												</c:choose>

											

											</c:forEach>




										</tbody>
									</table>
									</br>
									<div class="panel-footer">
										<button class="btn btn-primary" type="submit">
											<c:out value="${sessionScope.submit}"/>
										</button>
										<a href="group.group.htm"><button class="btn btn-primary" type="button"><c:out value="${sessionScope.cancel}"/></button></a>
									</div>


								</form>
							</div>
						</div>
					</div>

				</div>





			</div>
			<!-- contentpanel -->

		</div>
		<!-- mainpanel -->



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




	</body>
</html>
