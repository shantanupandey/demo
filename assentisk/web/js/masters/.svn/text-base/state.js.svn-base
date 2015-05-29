var stateapp = angular.module('stateapp', []);
										
											stateapp
													.config( [
															'$httpProvider',
															function($httpProvider) {
																$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
															} ]);
										
											function addStateController($scope, $http) {
												$("div.leftpanelinner>ul>li#group").css("background", "#003366");
												$("div.leftpanelinner>ul>li#group>a").css("color", "white");
												$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
												$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
												$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
												$("div.leftpanelinner>ul>li#master>ul>li#state").addClass("active");
												$("#imageloader").css("display", "none");
												$("#complete").css("display", "block");
												$scope.reset = function() {
													
													$scope.country = "";
													$scope.statename = "";
												};
										
												$scope.saveData = function() {
													var countryname = $scope.country;
													var statename = $scope.statename;
													var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
													statename=jQuery.trim(statename);
													   document.getElementById("statename").value=statename;
													if (countryname == '') {
														$('#cAlert').show();
														$('#cAlert').delay(1500).fadeOut('slow');
										
													} else if (statename == '') {
										
														$('#sAlert').show();
														$('#sAlert').delay(1500).fadeOut('slow');
														 document.getElementById("statename").focus();	
													}
													else if(filter.test(statename) == true){	
				        								$('#validstatename').show();
										   				 $('#validstatename').delay(1500).fadeOut('slow');
										   				 document.getElementById("statename").focus();	
										   				 return false;
									               }
													
													else if(statename!='')
													{
													$.get("checkstate.master.htm?statename=" + statename+"&countryid="+$scope.country, function(data, status) {
														
																					if(data == 'exist')
																					{
																						$('#checkNameAlert').show();
																					    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
																					    
																					}
																					else
																					{
																						var responsePromise = $http
																						.post("savestate.master.htm?statename="
																								+ $scope.statename + "&isactive="
																								+ $scope.isactive + "&countryid="
																								+ $scope.country);
																				responsePromise
																						.success(function(data, status, headers, config) {
																							window.location.href = "state.master.htm";
																							$('#submitSucess').show();
																							$('#submitSucess').delay(1500).fadeOut('slow');
																						});
																					}
																				});
													}
													
										
												};
										
											}
											
											

											function editStateController($scope, $http) {
												$("div.leftpanelinner>ul>li#group").css("background", "#003366");
												$("div.leftpanelinner>ul>li#group>a").css("color", "white");
												$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
												$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
												$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
												$("div.leftpanelinner>ul>li#master>ul>li#state").addClass("active");
										
												$("#imageloader").css("display", "none");
												$("#complete").css("display", "block");
												$scope.reset = function() {
												
												$scope.statename= $scope.resetstate;
												$scope.country = $scope.resetcountry;
												
												};
										
												$scope.saveData = function() {
													var countryname = $scope.country;
													var statename = $scope.statename;
													var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
													statename=jQuery.trim(statename);
													   document.getElementById("statename").value=statename;
													if (countryname == '') {
														$('#cAlert').show();
														$('#cAlert').delay(1500).fadeOut('slow');
										
													} else if (statename == '') {
										
														$('#sAlert').show();
														$('#sAlert').delay(1500).fadeOut('slow');
														 document.getElementById("statename").focus();	
													}else if(filter.test(statename) == true){	
				        								$('#validstatename').show();
										   				 $('#validstatename').delay(1500).fadeOut('slow');
										   				 document.getElementById("statename").focus();	
										   				 return false;
									               }
																							
													else if(statename!='')
													{
														
														if($scope.statenamecheck == $scope.statename)
														{															
															var responsePromise = $http
															.post("updatestate.master.htm?statename="
																	+ $scope.statename + "&isactive="
																	+ $scope.isactive + "&countryid="
																	+ $scope.country + "&stateid=" + $scope.stateid);
													responsePromise
															.success(function(data, status, headers, config) {
																window.location.href = "state.master.htm";
																$('#submitSucess').show();
																$('#submitSucess').delay(1500).fadeOut('slow');
															});	
														}
														else
														{																
													$.get("checkstate.master.htm?statename=" + statename+"&countryid="+$scope.country, function(data, status) {
														
																					if(data == 'exist')
																					{
																						$('#checkNameAlert').show();
																					    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
																					    
																					}
																					else
																					{
																						var responsePromise = $http
																						.post("updatestate.master.htm?statename="
																								+ $scope.statename + "&isactive="
																								+ $scope.isactive + "&countryid="
																								+ $scope.country + "&stateid=" + $scope.stateid);
																				responsePromise
																						.success(function(data, status, headers, config) {
																							window.location.href = "state.master.htm";
																							$('#submitSucess').show();
																							$('#submitSucess').delay(1500).fadeOut('slow');
																						});	
																					}
																					
																				});
													}
													}
												};
										
											}
