			
								var auditapp = angular.module('auditapp', []);
							
								auditapp
										.config( [
												'$httpProvider',
												function($httpProvider) {
													$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
												} ]);
							
								function addAuditController($scope, $http) {
									
									

									$("div.leftpanelinner>ul>li#assestment").addClass(
											"nav-parent nav-active");
									$("div.leftpanelinner>ul>li#assestment>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#assestment>ul>li#auditplan").addClass(
											"active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
							
									
									$scope.reset = function() {
										
										$scope.auditname = "";
										document.getElementById("locationdata").value = "";
									};
							
									$scope.saveData = function() {
									var auditname=$scope.auditname;
									var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
									var location=document.getElementById("locationdata").value;
									auditname=jQuery.trim(auditname);
									   document.getElementById("auditname").value=auditname;
								
									if(auditname==''){
										$('#auditAlert').show();
										$('#auditAlert').delay(1500).fadeOut('slow');	
										 document.getElementById("auditname").focus();	
									
									}
									else if(filter.test(auditname) == true){	
        								$('#validauditname').show();
						   				 $('#validauditname').delay(1500).fadeOut('slow');
						   				 document.getElementById("auditname").focus();	
						   				 return false;
					               }
									else if(location==''){
										$('#auditlocationAlert').show();
										$('#auditlocationAlert').delay(1500).fadeOut('slow');	
										 document.getElementById("locationdata").focus();	
									}
									else 
									{
										 if(location!='')
											{
											 $.get("checklocationname.org.htm?locationname=" + location, function(data, status)
														{	
												 			if(data == 'notexist')
												 				{
												 					$('#locationnotexistAlert').show();
												 					$('#locationnotexistAlert').delay(1500).fadeOut('slow');	
												 				}
												 			else
												 				{
												 					var responsePromise = $http
												 					.post("saveauditplan.assess.htm?auditname="
												 							+ auditname + "&isactive="
												 							+ $scope.isactive +"&location="+location);
												 							responsePromise
												 							.success(function(data, status, headers, config) {
												 								$('#submitSucess').show();
												 								$('#submitSucess').delay(1500).fadeOut('slow');
												 								
												 								var delay = 1500; //Your delay in milliseconds

																				setTimeout(function(){ window.location = "auditplan.assess.htm"; }, delay);
																				
												 								
												 							});	
												 				}
														});
											}
										 else
										 {
											 var responsePromise = $http
												.post("saveauditplan.assess.htm?auditname="
														+ auditname + "&isactive="
														+ $scope.isactive +"&location="+location);
														responsePromise
												.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													
													var delay = 1500; //Your delay in milliseconds

													setTimeout(function(){ window.location = "auditplan.assess.htm"; }, delay);
													
												});	
											 
										 }
										 
										
									}
										
								};
											
						}
								
								function editAuditController($scope, $http) {
								
									$("div.leftpanelinner>ul>li#assestment").addClass(
									"nav-parent nav-active");
									$("div.leftpanelinner>ul>li#assestment>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#assestment>ul>li#auditplan").addClass(
									"active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
									$scope.reset = function() {
										
										$("#auditname").val(document.getElementById("resetauditname").value);
										document.getElementById("locationdata").value = document.getElementById("resetlocationdata").value;
									};
							
									$scope.saveData = function() {
										
										var auditname=$("#auditname").val();
										var auditid=$scope.auditid;
										
										var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
										var location=document.getElementById("locationdata").value;
										auditname=jQuery.trim(auditname);
										   document.getElementById("auditname").value=auditname;
									
										if(auditname==''){
											$('#auditAlert').show();
											$('#auditAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("auditname").focus();	
										
										}
										else if(filter.test(auditname) == true){	
	        								$('#validauditname').show();
							   				 $('#validauditname').delay(1500).fadeOut('slow');
							   				 document.getElementById("auditname").focus();	
							   				 return false;
						               }
										else if(location==''){
											$('#auditlocationAlert').show();
											$('#auditlocationAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("locationdata").focus();	
										}
										else 
										{
											 if(location!='')
												{
												 $.get("checklocationname.org.htm?locationname=" + location, function(data, status)
															{	
													 			if(data == 'notexist')
													 				{
													 					$('#locationnotexistAlert').show();
													 					$('#locationnotexistAlert').delay(1500).fadeOut('slow');	
													 				}
													 			else
													 				{
													 				
													 					var responsePromise = $http
													 					.post("updateauditplan.assess.htm?auditname="
													 							+ auditname + "&isactive="
													 							+ $scope.isactive +"&location="+location+"&auditid="+auditid);
													 							responsePromise
													 							.success(function(data, status, headers, config) {
													 								$('#submitSucess').show();
													 								$('#submitSucess').delay(1500).fadeOut('slow');
													 								
													 								var delay = 1500; //Your delay in milliseconds

																					setTimeout(function(){ window.location = "auditplan.assess.htm"; }, delay);
																					
													 								
													 							});	
													 				}
													 				
															});
												}
											 else
											 {
												 var responsePromise = $http
													.post("updateauditplan.assess.htm?auditname="
															+ auditname + "&isactive="
															+ $scope.isactive +"&location="+location+"&auditid="+auditid);
															responsePromise
													.success(function(data, status, headers, config) {
														$('#submitSucess').show();
														$('#submitSucess').delay(1500).fadeOut('slow');
														var delay = 1500; //Your delay in milliseconds

														setTimeout(function(){ window.location = "auditplan.assess.htm"; }, delay);
														
														
														
													});	
												 
											 }
											 
											
										}
							
									};
							
								}
								
								function editAuditPlanDetailsController($scope, $http) {
									
									
								
									$("div.leftpanelinner>ul>li#assestment").addClass(
									"nav-parent nav-active");
									$("div.leftpanelinner>ul>li#assestment>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#assestment>ul>li#auditplan").addClass(
									"active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
									$scope.reset = function() {											
										$scope.countryname = $scope.resetcountry;							
									};
							
									$scope.saveData = function() {
										
									
										var auditid=document.getElementById("auditid").value;
										var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
										var location=document.getElementById("locationdata").value;
										var businessProcess=document.getElementById("businessProcess").value;
										var assignTo=document.getElementById("assignTo").value;
										var startdate=document.getElementById("startdate").value;
										var estimatedDay=document.getElementById("estimatedDay").value;
										var locationcheck="";
										var controls=document.getElementById("totalcontrol").value;
										
									
										if(location==''){
											$('#auditlocationAlert').show();
											$('#auditlocationAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("locationdata").focus();	
										
										}
										else if(location!='' && locationcheck == 'notexist'){
											$('#locationnotexistAlert').show();
						 					$('#locationnotexistAlert').delay(1500).fadeOut('slow');
										}
										else if(businessProcess==''){
											$('#auditbusinessAlert').show();
											$('#auditbusinessAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("businessProcess").focus();	
										
										}
										else if(assignTo==''){
											$('#auditassignAlert').show();
											$('#auditassignAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("assignTo").focus();	
										
										}
										else if(startdate==''){
											$('#auditstartdateAlert').show();
											$('#auditstartdateAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("startdate").focus();	
										
										}
										else if(estimatedDay==''){
											$('#auditestimatedAlert').show();
											$('#auditestimatedAlert').delay(1500).fadeOut('slow');	
											 document.getElementById("estimatedDay").focus();	
										
										}
										else 
										{
											if(controls=='0'){
													$('#properentry').show();
													$('#properentry').delay(1500).fadeOut('slow');	
													 document.getElementById("businessProcess").value="";
								 				}
								 				else
								 				{
								 					if(businessProcess!=='')
					       	 						{
					       										 $.get("checkbusinessprocessname.org.htm?businessProc=" + businessProcess, function(data, status)
																			{	
					       											
																						if(data == 'notexist')
																						{
																							$('#businessnotexistAlert').show();
																							$('#businessnotexistAlert').delay(1500).fadeOut('slow');
																							document.getElementById("businessProcess").value="";		
																							
																						}
																						else
																						{
																							
																							
																							 if(assignTo!=='')
																			       	 			{
																			       						 $.get("checkreportingname.org.htm?reporting= "+ assignTo, function(data, status)
																																	{	
																																		if(data == 'notexist')
																																		{
																																			$('#checkassignToAlert').show();
																																			$('#checkassignToAlert').delay(1500).fadeOut('slow');	
																																			document.getElementById("assignTo").value="";	
																																			
																																		}
																																		else
																																		{
																																			 var responsePromise = $http
																																				.post("addauditplandetails.assess.htm?isactive="
																																						+ $scope.isactive +"&location="+location+"&auditid="+auditid+"&businessProcess="
																																						+businessProcess+"&assignTo="+assignTo+"&startdate="+startdate+"&estimatedDay="
																																						+estimatedDay);
																																						responsePromise
																																				.success(function(data, status, headers, config) {
																																					
																																					
																																					$('#submitSucess').show();
																																					$('#submitSucess').delay(1500).fadeOut('slow');
																																					
																																					window.location.href = "auditplandetails.assess.htm?auditid="+auditid;
																																				});	
																																		}
																															});
																			       				 }
																						    
																							
																							
																							
																						}
					        												});
					        						}
					        						
								 					
								 					
								 					
																							
																							
																						}
										}
															
							
									};
							
								}