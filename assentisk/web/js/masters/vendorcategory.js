								var vendorCatApp = angular.module('vendorCatApp', []);
							
								vendorCatApp
										.config( [
												'$httpProvider',
												function($httpProvider) {
													$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
												} ]);
							
								function addVendorCatController($scope, $http) {
								
									$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
									$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#master>ul>li#vendorCat").addClass("active");
							
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
										
									$.get("checkvendorcategoryname.master.htm?catname=" + catname, function(data, status) {
										
																	if(data == 'exist')
																	{
																		$('#checkNameAlert').show();
																	    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
																	    
																	}
																	else
																	{
																											
																													
																			var responsePromise = $http
																								.post("savevendorcat.master.htm?catname="
																										+ $scope.catname + "&isactive="
																										+ $scope.isactive);
																						responsePromise
																								.success(function(data, status, headers, config) {
																									$('#submitSucess').show();
																									$('#submitSucess').delay(1500).fadeOut('slow');
																									window.location.href = "vendorcategory.master.htm";
																								});
																	}
																});
									}
										
								};
											
						}
								
								function editVendorCatController($scope, $http) {
									
									$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
									$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#master>ul>li#vendorCat").addClass("active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
							
									
									$scope.reset = function() {
									$scope.catname = $scope.resetvendor;
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
												.post("updatevendorcat.master.htm?catname="
														+ $scope.catname + "&isactive="
														+ $scope.isactive + "&vcatid="+$scope.catid);
										responsePromise
												.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													window.location.href = "vendorcategory.master.htm";
												});
											}
											else
											{
												
												$.get("checkvendorcategoryname.master.htm?catname=" + catname, function(data, status) {
													
													if(data == 'exist')
													{
														$('#checkNameAlert').show();
													    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
													    
													}
													else
													{
														var responsePromise = $http
														.post("updatevendorcat.master.htm?catname="
																+ $scope.catname + "&isactive="
																+ $scope.isactive + "&vcatid="+$scope.catid);
												responsePromise
														.success(function(data, status, headers, config) {
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
															window.location.href = "vendorcategory.master.htm";
														});	
													}
												});	
											}
											
																					
												
										}
								};
											
						}