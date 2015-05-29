								var vendorCatApp = angular.module('vendorCatApp', []);
							
								vendorCatApp
										.config( [
												'$httpProvider',
												function($httpProvider) {
													$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
												} ]);
							
								function addticketCatController($scope, $http) {
									$("div.leftpanelinner>ul>li#support").addClass(
									"nav-parent nav-active");
							$("div.leftpanelinner>ul>li#support>ul").css("display", "block");
							$("div.leftpanelinner>ul>li#support>ul>li#ticketCat").addClass(
									"active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
							
									
									$scope.reset = function() {
										
										$scope.catname = "";
									};
							
									$scope.saveData = function() {
									var catname=$scope.catname;
									var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
									catname=jQuery.trim(catname);
									   document.getElementById("catname").value=catname;
									
									if(catname==''){
										$('#cAlert').show();
										$('#cAlert').delay(1500).fadeOut('slow');	
									
									}
									else if(filter.test(catname) == true){	
        								$('#validcatname').show();
						   				 $('#validcatname').delay(1500).fadeOut('slow');
						   				 document.getElementById("catname").focus();	
						   				 return false;
					               }
									else if(catname!='')
									{
										
									$.get("checkticketcategoryname.assets.htm?catname=" + catname, function(data, status) {
										
																	if(data == 'exist')
																	{
																		$('#checkNameAlert').show();
																	    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
																	    
																	}
																	else
																	{
																											
																													
																			var responsePromise = $http
																								.post("saveticketcat.assets.htm?catname="
																										+ $scope.catname + "&isactive="
																										+ $scope.isactive);
																						responsePromise
																								.success(function(data, status, headers, config) {
																									$('#submitSucess').show();
																									$('#submitSucess').delay(1500).fadeOut('slow');
																									window.location.href = "ticketcategory.assets.htm";
																								});
																	}
																});
									}
										
								};
											
						}
								
								function editticket($scope, $http) {
									
									$("div.leftpanelinner>ul>li#support").addClass(
									"nav-parent nav-active");
							$("div.leftpanelinner>ul>li#support>ul").css("display", "block");
							$("div.leftpanelinner>ul>li#support>ul>li#ticketCat").addClass(
									"active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
							
									
									$scope.reset = function() {
									$scope.catname = $scope.resetcat;
									};
							
									$scope.saveData = function() {
									var catname=$scope.catname;
									var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
									catname=jQuery.trim(catname);
									document.getElementById("catname").value=catname;
									if(catname==''){
										$('#cAlert').show();
										$('#cAlert').delay(1500).fadeOut('slow');	
									
									}else if(filter.test(catname) == true){	
        								$('#validcatname').show();
						   				 $('#validcatname').delay(1500).fadeOut('slow');
						   				 document.getElementById("catname").focus();	
						   				 return false;
					               }
										else if(catname!="")
										{	
											
											if($scope.catnamecheck == catname)
											{
												
												var responsePromise = $http
												.post("updateticketcat.assets.htm?catname="
														+ $scope.catname + "&isactive="
														+ $scope.isactive + "&vcatid="+$scope.catid);
												responsePromise
												.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													window.location.href = "ticketcategory.assets.htm";
												});
											}
											else
											{
												
												$.get("checkticketcategoryname.assets.htm?catname=" + catname, function(data, status) {
													
													if(data == 'exist')
													{
														$('#checkNameAlert').show();
													    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
													    
													}
													else
													{
														var responsePromise = $http
														.post("updateticketcat.assets.htm?catname="
																+ $scope.catname + "&isactive="
																+ $scope.isactive + "&vcatid="+$scope.catid);
												responsePromise
														.success(function(data, status, headers, config) {
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
															window.location.href = "ticketcategory.assets.htm";
														});	
													}
												});	
											}
											
																					
												
										}
								};
											
						}