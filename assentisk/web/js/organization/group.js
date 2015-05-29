										
										var groupapp = angular.module('groupapp', []);
									
										groupapp
												.config( [
														'$httpProvider',
														function($httpProvider) {
															$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
														} ]);
									
										function addGroupController($scope, $http) {
									
											$("div.leftpanelinner>ul>li#organization").addClass(
													"nav-parent nav-active");
											$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
											$("div.leftpanelinner>ul>li#organization>ul>li#usergroup").addClass(
													"active");
											$("#imageloader").css("display", "none");
											$("#complete").css("display", "block");
											$scope.reset = function() {
											};
									
											$scope.saveData = function() {
										
												var groupname = $scope.groupname;
											
												var desc = $scope.groupper;
											
												groupname=jQuery.trim(groupname);
												document.getElementById("groupname").value=groupname;
											
												desc=jQuery.trim(desc);
												document.getElementById("desc").value=desc;
												var namefilter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
												
												if (groupname == '' || groupname == undefined) {
													$('#gpAlert').show();
													$('#gpAlert').delay(1500).fadeOut('slow');
									
												}
												else if(namefilter.test(groupname) == true){	
							        				    $('#validgroupname').show();
													   	$('#validgroupname').delay(1500).fadeOut('slow');
													   	document.getElementById("groupname").focus();	
						   				
					            				   }
												 else if (desc == '' || desc == undefined) {
													$('#descAlert').show();
													$('#descAlert').delay(1500).fadeOut('slow');
													document.getElementById("desc").focus();	
												}
									
												else if(groupname!=""){
																										
													$.get("checkgroupname.org.htm?groupname=" + groupname, function(data, status) {
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else
														{
															var responsePromise = $http
															.post("savegroup.group.htm?groupname="
																	+ $scope.groupname + "&desc=" + $scope.groupper
																	+ "&isactive=" + $scope.isactive);
													responsePromise
															.success(function(data, status, headers, config) {
																$('#submitSucess').show();
																$('#submitSucess').delay(1500).fadeOut('slow');
																window.location.href = "group.group.htm";
															});
														}


													});
													
													
													
												}
											};
									
										}
										
										
										
										function editGroupController($scope, $http) {
											
											$("div.leftpanelinner>ul>li#organization").addClass(
													"nav-parent nav-active");
											$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
											$("div.leftpanelinner>ul>li#organization>ul>li#usergroup").addClass(
													"active");
									
											$("#imageloader").css("display", "none");
											$("#complete").css("display", "block");
											$scope.reset = function() {												
											$scope.title= $scope.resetgname;
											$scope.desc=$scope.resetdesc;
											
											};
									
											$scope.saveData = function() {
									
												var groupname = $scope.title;
												var desc = $scope.desc;
												groupname=jQuery.trim(groupname);
												document.getElementById("groupname").value=groupname;
												desc=jQuery.trim(desc);
												document.getElementById("desc").value=desc;
												var namefilter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
												
												if (groupname == '' || groupname == undefined) {
													$('#gpAlert').show();
													$('#gpAlert').delay(1500).fadeOut('slow');
														document.getElementById("groupname").focus();	
									
												}
												else if(namefilter.test(groupname) == true){	
							        				    $('#validgroupname').show();
													   	$('#validgroupname').delay(1500).fadeOut('slow');
													   	document.getElementById("groupname").focus();	
						   				
					            				   }
												 else if (desc == '' || desc == undefined) {
									
													$('#descAlert').show();
													$('#descAlert').delay(1500).fadeOut('slow');
														document.getElementById("desc").focus();	
												}
								
												else if(groupname!=""){
													
													if($scope.gnamecheck == groupname)
													{
														var responsePromise = $http
														.post("updategroup.group.htm?groupname=" + $scope.title
																+ "&isactive=" + $scope.isactive + "&desc="
																+ $scope.desc + "&gid=" + $scope.gid);
												responsePromise
														.success(function(data, status, headers, config) {
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
								
															window.location.href = "group.group.htm";
														});
													}
													else
													{
													
													$.get("checkgroupname.org.htm?groupname=" + groupname, function(data, status) {
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else {
															var responsePromise = $http
																	.post("updategroup.group.htm?groupname=" + $scope.title
																			+ "&isactive=" + $scope.isactive + "&desc="
																			+ $scope.desc + "&gid=" + $scope.gid);
															responsePromise
																	.success(function(data, status, headers, config) {
																		$('#submitSucess').show();
																		$('#submitSucess').delay(1500).fadeOut('slow');
											
																		window.location.href = "group.group.htm";
																	});
														}


													});
												}
													
													
												}
												
												
											};
									
										}				