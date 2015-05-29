						var assetapp = angular.module('assetapp', []);
								
									assetapp
											.config( [
													'$httpProvider',
													function($httpProvider) {
														$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
													} ]);
								
									function addAssetsController($scope, $http) {
								
										$("div.leftpanelinner>ul>li#asset").addClass("nav-parent nav-active");
										$("div.leftpanelinner>ul>li#asset>ul").css("display","block");
										$("div.leftpanelinner>ul>li#asset>ul>li#assets").addClass("active");
								
										$("#imageloader").css("display", "none");
										$("#complete").css("display", "block");
								
										$scope.reset = function() {
											
											$scope.assetname = "";
											$scope.category = "";
											$scope.location = "";
											$scope.application = "";
											$scope.businessprocess = "";
											$scope.responsiblehead = "";
											
										};
								
										$scope.saveData = function() {
																							
												var assetname = $scope.assetname;
												var category = $scope.category;
												var location = $scope.location;
												var application = $scope.application;
												var businessprocess = $scope.businessprocess;
												var employee =document.getElementById("responsiblehead").value;													
												var initvalue=$scope.initvalue;
											    var vendorname=document.getElementById("vendorname").value;
											    var quantity=$scope.quantity;
												var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
												var numer=/^[0-9]+$/;
												assetname=jQuery.trim(assetname);
												document.getElementById("assetname").value=assetname;
												initvalue=jQuery.trim(initvalue);
												document.getElementById("initvalue").value=initvalue;	
												quantity=jQuery.trim(quantity);
												document.getElementById("quantity").value=quantity;	
												vendorname=jQuery.trim(vendorname);
												document.getElementById("vendorname").value=vendorname;	
												
												
												
												if (assetname == '') 
												{
													$('#assetAlert').show();
													$('#assetAlert').delay(1500).fadeOut('slow');
													document.getElementById("assetname").focus();	
									   				
								
												}												
												else if(assetname!='' && filter.test(assetname) == true)
												{
													
														$('#validassetAlert').show();
														$('#validassetAlert').delay(1500).fadeOut('slow');
														document.getElementById("assetname").focus();	
																							
												}
												else if(vendorname!='' && filter.test(vendorname) == true){
													$('#validvendorAlert').show();
													$('#validvendorAlert').delay(1500).fadeOut('slow');
													document.getElementById("vendorname").focus();	
													
												}
												else if (category == '') 
												{
													$('#categoryAlert').show();
													$('#categoryAlert').delay(1500).fadeOut('slow');
								
												} 
												else if(initvalue!='' && initvalue<0)
												{													
												
														$('#validinitvalueAlert').show();
														$('#validinitvalueAlert').delay(1500).fadeOut('slow');														
																									
														
												}
												else if(initvalue!='' && filter.test(initvalue) == true)
												{													
												
														$('#validinitvalueAlert').show();
														$('#validinitvalueAlert').delay(1500).fadeOut('slow');														
																									
														
												}
												
												else if(quantity!='' && quantity<0)
												{	
												
														$('#validquantityAlert').show();
														$('#validquantityAlert').delay(1500).fadeOut('slow');															
																									
														
												}
												else if(quantity!='' && filter.test(quantity) == true)
												{													
												
													$('#validquantityAlert').show();
													$('#validquantityAlert').delay(1500).fadeOut('slow');																
																									
														
												}
												else if(assetname!="")
												{
													$.get("checkassetname.assets.htm?assetname=" + assetname, function(data, status) {
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else
														{
															
															
														
																var responsePromise = $http
																.post("saveasset.assets.htm?assetname=" + assetname
																		+ "&category="
																		+ $scope.category+"&location="+$scope.location+
																		"&application="+$scope.application+"&businessprocess="
																		+$scope.businessprocess+"&employee="+employee+"&vendors="+vendorname+"&type="+$scope.type+"&initvalue="+$scope.initvalue+"&quantity="+$scope.quantity);
														responsePromise
																.success(function(data, status, headers, config) {
																	window.location.href = "assets.assets.htm";
																	$('#submitSucess').show();
																	$('#submitSucess').delay(1500).fadeOut('slow');
																});
																
																
														}

													});
												}
												
										};
								
									}
									
									
									
									function editAssetsController($scope, $http) {
										
										$("div.leftpanelinner>ul>li#asset").addClass("nav-parent nav-active");
										$("div.leftpanelinner>ul>li#asset>ul").css("display","block");
										$("div.leftpanelinner>ul>li#asset>ul>li#assets").addClass("active");
								
										$("#imageloader").css("display", "none");
										$("#complete").css("display", "block");
								
										$scope.reset = function() {
											
											$scope.assetname = $scope.resetasset;
											$scope.vendorname = $scope.resetvendor;
											$scope.category = $scope.resetcategory;
											$scope.location = $scope.resetlocation;
											$scope.application = $scope.resetapplication;
											$scope.businessprocess = $scope.resetbusinessprocess;
											$scope.responsiblehead = $scope.resetemployee;
											$scope.initvalue = $scope.resetinitvalue;
											$scope.quantity = $scope.resetquantity;
										};
								
										$scope.saveData = function() {
											
												var assetname = $scope.assetname;
												var category = $scope.category;
												var location = $scope.location;
												var application = $scope.application;
												var businessprocess = $scope.businessprocess;
												var employee = document.getElementById("responsiblehead").value;	
												var initvalue=$scope.initvalue;
											    var vendorname=document.getElementById("vendorname").value;	
											    var quantity=$scope.quantity;
												var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
												var numer=/^[0-9]+$/;
												assetname=jQuery.trim(assetname);
												document.getElementById("assetname").value=assetname;
												initvalue=jQuery.trim(initvalue);
												document.getElementById("initvalue").value=initvalue;	
												quantity=jQuery.trim(quantity);
												document.getElementById("quantity").value=quantity;	
												vendorname=jQuery.trim(vendorname);
												document.getElementById("vendorname").value=vendorname;	

												 var type=$scope.type;
												 if(type == undefined || type==''){
													 type='';
												 }
												if (assetname == '') 
												{
													$('#assetAlert').show();
													$('#assetAlert').delay(1500).fadeOut('slow');
													document.getElementById("assetname").focus();	
									   				
								
												}												
												else if(assetname!='' && filter.test(assetname) == true)
												{
													
														$('#validassetAlert').show();
														$('#validassetAlert').delay(1500).fadeOut('slow');
														document.getElementById("assetname").focus();	
																						
												}
												else if (category == '' || category == undefined) 
												{
													$('#categoryAlert').show();
													$('#categoryAlert').delay(1500).fadeOut('slow');
													
								
												} 
												else if(initvalue!='' && initvalue<0)
												{													
												
														$('#validinitvalueAlert').show();
														$('#validinitvalueAlert').delay(1500).fadeOut('slow');														
																									
														
												}
												else if(initvalue!='' && filter.test(initvalue) == true)
												{													
												
														$('#validinitvalueAlert').show();
														$('#validinitvalueAlert').delay(1500).fadeOut('slow');														
																									
														
												}
												
												else if(quantity!='' && quantity<0)
												{	
												
														$('#validquantityAlert').show();
														$('#validquantityAlert').delay(1500).fadeOut('slow');															
																									
														
												}
												else if(quantity!='' && filter.test(quantity) == true)
												{													
												
													$('#validquantityAlert').show();
													$('#validquantityAlert').delay(1500).fadeOut('slow');																
																									
														
												}
												else if(assetname!="")
												{
													if($scope.assetnamecheck == assetname)
													{
														var responsePromise = $http
														.post("updateasset.assets.htm?assetname=" + $scope.assetname
																+ "&category="
																+ $scope.category+"&location="+$scope.location+"&application="+$scope.application+
																"&businessprocess="+$scope.businessprocess+"&employee="+employee+
																"&assetID="+$scope.assetID+"&vendors="+vendorname+"&type="+type+"&initvalue="+$scope.initvalue+"&quantity="+$scope.quantity);
												responsePromise
														.success(function(data, status, headers, config) {
															window.location.href = "assets.assets.htm";
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
														});
													}
													else
													{
													
													$.get("checkassetname.assets.htm?assetname=" + assetname, function(data, status) {
														
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else
														{
														
														var responsePromise = $http
																.post("updateasset.assets.htm?assetname=" + $scope.assetname
																		+ "&category="
																		+ $scope.category+"&location="+$scope.location+"&application="+$scope.application+
																		"&businessprocess="+$scope.businessprocess+"&employee="+employee+
																		"&assetID="+$scope.assetID+"&vendors="+vendorname+"&type="+type+"&initvalue="+$scope.initvalue+"&quantity="+$scope.quantity);
														responsePromise
																.success(function(data, status, headers, config) {
																	window.location.href = "assets.assets.htm";
																	$('#submitSucess').show();
																	$('#submitSucess').delay(1500).fadeOut('slow');
																});
														}

													});
													
													}
												}
												
										};
								
									}