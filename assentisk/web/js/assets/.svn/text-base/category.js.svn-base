								var categoryapp = angular.module('categoryapp', []);
								
									categoryapp
											.config( [
													'$httpProvider',
													function($httpProvider) {
														$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
													} ]);
								
									function addCategoryController($scope, $http) {
								
										$("div.leftpanelinner>ul>li#asset").addClass("nav-parent nav-active");
										$("div.leftpanelinner>ul>li#asset>ul").css("display","block");
										$("div.leftpanelinner>ul>li#asset>ul>li#categories").addClass("active");
								
										$("#imageloader").css("display", "none");
										$("#complete").css("display", "block");
								
										$scope.reset = function() {										
										$scope.categoryname = "";										
										};
								
										$scope.saveData = function() {
											var categoryname = $scope.categoryname;																			
											var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
											categoryname=jQuery.trim(categoryname);
											   document.getElementById("categoryname").value=categoryname;
											if (categoryname == '') {
												$('#categoryAlert').show();
												$('#categoryAlert').delay(1500).fadeOut('slow');
								
											} 
											else if(filter.test(categoryname) == true){	
		        								$('#validcategoryname').show();
								   				 $('#validcategoryname').delay(1500).fadeOut('slow');
								   				 document.getElementById("categoryname").focus();	
								   				 return false;
							               }
											
											else if(categoryname!=''){
												
												$.get("checkcategoryname.assets.htm?categoryname=" + categoryname, function(data, status) {
													
													if(data == 'exist')
													{
														$('#checkNameAlert').show();
													    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
													    
													}
													else
													{
														var responsePromise = $http
														.post("savecategory.assets.htm?categoryname=" + $scope.categoryname
																+ "&isactive="
																+ $scope.isactive);
												responsePromise
														.success(function(data, status, headers, config) {
															window.location.href = "categories.assets.htm";
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
														});
													}

												});
												
											}
										};
								
									}
									

									function editCategoryController($scope, $http) {
								
										$("div.leftpanelinner>ul>li#asset").addClass("nav-parent nav-active");
										$("div.leftpanelinner>ul>li#asset>ul").css("display","block");
										$("div.leftpanelinner>ul>li#asset>ul>li#categories").addClass("active");
								
										$("#imageloader").css("display", "none");
										$("#complete").css("display", "block");
								
										$scope.reset = function() {
											
											$scope.categoryname = $scope.resetcategory;
										};
								
										$scope.saveData = function() {
										
											var categoryname = $scope.categoryname;										
											var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
											categoryname=jQuery.trim(categoryname);
											   document.getElementById("categoryname").value=categoryname;
											if (categoryname == '' || categoryname == undefined) {
												$('#categoryAlert').show();
												$('#categoryAlert').delay(1500).fadeOut('slow');
								
											} 
											else if(filter.test(categoryname) == true){	
		        								$('#validcategoryname').show();
								   				 $('#validcategoryname').delay(1500).fadeOut('slow');
								   				 document.getElementById("categoryname").focus();	
								   				 return false;
							               }
											
											else if(categoryname!=""){
								
												if($scope.categorynamecheck == categoryname)
												{
												var responsePromise = $http
														.post("updatecategory.assets.htm?categoryname=" + $scope.categoryname
																+ "&isactive="
																+ $scope.isactive+"&categoryid="+$scope.categoryid);
												responsePromise
														.success(function(data, status, headers, config) {
															window.location.href = "categories.assets.htm";
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
														});
												}
												
												else
												{
													$.get("checkcategoryname.assets.htm?categoryname=" + categoryname, function(data, status) {
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else
														{
															var responsePromise = $http
															.post("updatecategory.assets.htm?categoryname=" + $scope.categoryname
																	+ "&isactive="
																	+ $scope.isactive+"&categoryid="+$scope.categoryid);
													responsePromise
															.success(function(data, status, headers, config) {
																window.location.href = "categories.assets.htm";
																$('#submitSucess').show();
																$('#submitSucess').delay(1500).fadeOut('slow');
															});
														}

													});
												}
											}
										};
								
									}