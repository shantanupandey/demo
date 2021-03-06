var businessprocessapp = angular.module('businessprocessapp', []);
				
					businessprocessapp
							.config( [
									'$httpProvider',
									function($httpProvider) {
										$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
									} ]);
				
					function addBusinessProcessController($scope, $http) {
				
						$("div.leftpanelinner>ul>li#organization").addClass(
								"nav-parent nav-active");
						$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
						$("div.leftpanelinner>ul>li#organization>ul>li#busiprocess").addClass(
								"active");
				
						$("#imageloader").css("display", "none");
						$("#complete").css("display", "block");
				
						$scope.reset = function() {
							
							$scope.businessprocessname = "";
						    $scope.responsiblehead = "";
								
						};
						
						$scope.saveData = function() {
				
							var empName = document.getElementById("responsiblehead").value;
							var businessProc = $scope.businessprocessname;
							var responsiblehead = $scope.responsiblehead;
							businessProc=jQuery.trim(businessProc);
							   document.getElementById("businessprocessname").value=businessProc;
							   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
							var divisiondata = "";
								var myDivisions = document.getElementsByClassName("description_text");
								for ( var i = 0; i < myDivisions.length; i++) {
									divDat = myDivisions[i].innerHTML.replace(
											'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
											"");
									if (i == myDivisions.length - 1) {
										divisiondata = divisiondata + divDat;
									} else {
										divisiondata = divisiondata + divDat + "','";
									}
					
								}
								
								  var locationdata="";
					              var locDat="";
					              var myLocations = document.getElementsByClassName("description_text_loc");
									for(var i = 0; i < myLocations.length; i++)
									{
													
													locDat = myLocations[i].innerHTML.replace(
															'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
															"");
									
													if (i == myDivisions.length - 1) {
														locationdata = locationdata + locDat;
													} else {
														locationdata = locationdata + locDat + "','";
													}
								}
							
									 var deptdata="";
						              var deptDat="";
						              var myDepts = document.getElementsByClassName("description_text_dep");
										for(var i = 0; i < myDepts.length; i++)
										{
														
														deptDat = myDepts[i].innerHTML.replace(
																'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
																"");
										
														if (i == myDepts.length - 1) {
															deptdata = deptdata + deptDat;
														} else {
															deptdata = deptdata + deptDat + "','";
														}
									}
				
							if (businessProc == '' || businessProc == undefined) {
								$('#busiAlert').show();
								$('#busiAlert').delay(1500).fadeOut('slow');
				
							}
							 else if(filter.test(businessProc) == true){	
									$('#validbusinessProc_alert').show();
					  				 $('#validbusinessProc_alert').delay(1500).fadeOut('slow');
					  				 document.getElementById("businessprocessname").focus();	
					       }
							
							
							 else if(businessProc!=""){
								 
								 $.get("checkbusinessprocessname.org.htm?businessProc=" + businessProc, function(data, status) {
										
										if(data == 'exist')
										{
											$('#checkNameAlert').show();
										    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
										    
										}
										
										else
										{
											if(empName!="")
											{
												$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status) {
												//$.get("checkresponsiblehead.org.htm?empName=" + empName, function(data, status) {
													
													if(data == "exist")
													{
													
														var responsePromise = $http
														.post("savebusinessprocess.org.htm?businessprocessname="
																+ $scope.businessprocessname
																+ "&location="
																+ locationdata
																+ "&division="
																+ divisiondata
																+ "&responsiblehead="
																+ empName + "&isactive=" + $scope.isactive+"&deptdata="+deptdata);
														responsePromise.success(function(data, status, headers, config) {
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
															window.location.href = "employees.org.htm";
															window.location.href = "businessprocesses.org.htm";
														});
													}
													else
													{
														$('#checkResponsibleAlert').show();
														$('#checkResponsibleAlert').delay(1500).fadeOut('slow');		
													}
											});
											}
											else
											{
												var responsePromise = $http
												.post("savebusinessprocess.org.htm?businessprocessname="
														+ $scope.businessprocessname
														+ "&location="
														+ locationdata
														+ "&division="
														+ divisiondata
														+ "&responsiblehead="
														+ empName + "&isactive=" + $scope.isactive+"&deptdata="+deptdata);
												responsePromise.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													window.location.href = "employees.org.htm";
													window.location.href = "businessprocesses.org.htm";
												});
											}
											
										}


									});
								
							}
						};
				
					}
					
					
					
					function editBusinessProcessController($scope, $http) {
						
						$("div.leftpanelinner>ul>li#organization").addClass(
								"nav-parent nav-active");
						$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
						$("div.leftpanelinner>ul>li#organization>ul>li#busiprocess").addClass(
								"active");
				
						$("#imageloader").css("display", "none");
						$("#complete").css("display", "block");
						
						$scope.reset = function() {
							$scope.location = $scope.resetlocation;
							$scope.test = $scope.resettest;
							$scope.businessprocessname = $scope.resetbusinessprocessname;
							$scope.departments = $scope.resetdepartments;
							$scope.responsiblehead = $scope.resetresponsiblehead;
				
						};
				
						$scope.saveData = function() {
							
							var empName = document.getElementById("responsiblehead").value;							
							var businessProc = $scope.businessprocessname;
							businessProc=jQuery.trim(businessProc);
							   document.getElementById("businessprocessname").value=businessProc;
							   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
							var responsiblehead = $scope.responsiblehead;
								var divisiondata="";
							    var myDivisions = document.getElementsByClassName("description_text");
								for(var i = 0; i < myDivisions.length; i++)
									{
												divDat=myDivisions[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
											  	if(i == myDivisions.length-1)
													{
														divisiondata = divisiondata  +  divDat ;	
													}
													else
													{
														divisiondata = divisiondata + divDat + "','";	
													}
											  
											 
									}
									
									
								  var locationdata="";
					              var locDat="";
					              var myLocations = document.getElementsByClassName("description_text_loc");
									for(var i = 0; i < myLocations.length; i++)
									{
													
													locDat = myLocations[i].innerHTML.replace(
															'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
															"");
									
													if (i == myLocations.length - 1) {
														locationdata = locationdata + locDat;
													} else {
														locationdata = locationdata + locDat + "','";
													}
								}
									
									 var deptdata="";
						              var deptDat="";
						              var myDepts = document.getElementsByClassName("description_text_dep");
										for(var i = 0; i < myDepts.length; i++)
										{
														
														deptDat = myDepts[i].innerHTML.replace(
																'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
																"");
										
														if (i == myDepts.length - 1) {
															deptdata = deptdata + deptDat;
														} else {
															deptdata = deptdata + deptDat + "','";
														}
									}
								
				
							if (businessProc == '' || businessProc == undefined) {
								$('#busiAlert').show();
								$('#busiAlert').delay(1500).fadeOut('slow');
				
							}
							 else if(filter.test(businessProc) == true){	
									$('#validbusinessProc_alert').show();
					  				 $('#validbusinessProc_alert').delay(1500).fadeOut('slow');
					  				 document.getElementById("businessprocessname").focus();	
					       }
													
							else if(businessProc!=""){
								 
								if($scope.businessprocessnamecheck == businessProc)
								{
										
							
							
							if(empName!="")
							{								
								$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status) {
								//$.get("checkresponsiblehead.org.htm?empName=" + empName, function(data, status) {
									
								
									if(data == "exist")
									{
									
										var responsePromise = $http
										.post("updatebusinessprocess.org.htm?businessprocessname="
												+ $scope.businessprocessname
												+ "&location="
												+ locationdata
												+ "&division="
												+ divisiondata
												+ "&responsiblehead="
												+ empName
												+ "&isactive="
												+ $scope.isactive
												+ "&businessprocessid="
												+ $scope.businessprocessid+"&deptdata="+deptdata);
								responsePromise
										.success(function(data, status, headers, config) {
											$('#submitSucess').show();
											$('#submitSucess').delay(1500).fadeOut('slow');
											window.location.href = "businessprocesses.org.htm";
										});
									}
									else
									{
										$('#checkResponsibleAlert').show();
										$('#checkResponsibleAlert').delay(1500).fadeOut('slow');		
									}
							});
							}
								}
								else
								{
										
								
								 $.get("checkbusinessprocessname.org.htm?businessProc=" + businessProc, function(data, status) {
										
										if(data == 'exist')
										{
											$('#checkNameAlert').show();
										    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
										    
										}
										

										else {
											
											if(empName!="")
											{
												$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status) {
												//$.get("checkresponsiblehead.org.htm?empName=" + empName, function(data, status) {
													
													
													if(data == "exist")
													{
													
														var responsePromise = $http
														.post("updatebusinessprocess.org.htm?businessprocessname="
																+ $scope.businessprocessname
																+ "&location="
																+ locationdata
																+ "&division="
																+ divisiondata
																+ "&responsiblehead="
																+ empName
																+ "&isactive="
																+ $scope.isactive
																+ "&businessprocessid="
																+ $scope.businessprocessid+"&deptdata="+deptdata);
												responsePromise
														.success(function(data, status, headers, config) {
															$('#submitSucess').show();
															$('#submitSucess').delay(1500).fadeOut('slow');
															window.location.href = "businessprocesses.org.htm";
														});
													}
													else
													{
														$('#checkResponsibleAlert').show();
														$('#checkResponsibleAlert').delay(1500).fadeOut('slow');		
													}
											});
											}
											else
											{
												var responsePromise = $http
												.post("updatebusinessprocess.org.htm?businessprocessname="
														+ $scope.businessprocessname
														+ "&location="
														+ locationdata
														+ "&division="
														+ divisiondata
														+ "&responsiblehead="
														+ empName
														+ "&isactive="
														+ $scope.isactive
														+ "&businessprocessid="
														+ $scope.businessprocessid+"&deptdata="+deptdata);
										responsePromise
												.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													window.location.href = "businessprocesses.org.htm";
												});
											}
											
											}


									});
								}
								
							}
							
							};
					
						}