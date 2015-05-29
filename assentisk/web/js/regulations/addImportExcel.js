			
								var countryapp = angular.module('countryapp', []);
							
								countryapp
										.config( [
												'$httpProvider',
												function($httpProvider) {
													$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
												} ]);
							
								function addCountryController($scope, $http) {
									$("div.leftpanelinner>ul>li#library").css("background", "#003366");
									$("div.leftpanelinner>ul>li#library>a").css("color", "white");
									$("div.leftpanelinner>ul>li#library>a>span").css("color", "white");
									$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
									$("div.leftpanelinner>ul>li#regulations>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#regulations>ul>li#library").addClass("active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
							
									
									$scope.reset = function() {
										
										$scope.countryname = "";
									};
							
									$scope.saveData = function() {
									var countryname=$scope.countryname;
									var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
									countryname=jQuery.trim(countryname);
									   document.getElementById("countryname").value=countryname;
									if(countryname==''){
										$('#cAlert').show();
										$('#cAlert').delay(1500).fadeOut('slow');	
										 document.getElementById("countryname").focus();	
									
									}
									else if(filter.test(countryname) == true){	
        								$('#validcountryname').show();
						   				 $('#validcountryname').delay(1500).fadeOut('slow');
						   				 document.getElementById("countryname").focus();	
						   				 return false;
					               }
									else if (countryname!='')
									{
										$.get("checkcountry.master.htm?countryname=" + countryname, function(data, status) {
											
											if(data == 'exist')
											{
												$('#checkNameAlert').show();
											    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
											    
											}
											else
											{
												var responsePromise = $http
												.post("savecountry.master.htm?countryname="
														+ $scope.countryname + "&isactive="
														+ $scope.isactive);
										responsePromise
												.success(function(data, status, headers, config) {
													$('#submitSucess').show();
													$('#submitSucess').delay(1500).fadeOut('slow');
													window.location.href = "country.master.htm";
												});	
											}
											
										});
									}
										
								};
											
						}
								
								function editCountryController($scope, $http) {
									$("div.leftpanelinner>ul>li#group").css("background", "#003366");
									$("div.leftpanelinner>ul>li#group>a").css("color", "white");
									$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
									$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
									$("div.leftpanelinner>ul>li#master>ul").css("display", "block");
									$("div.leftpanelinner>ul>li#master>ul>li#country").addClass("active");
							
									$("#imageloader").css("display", "none");
									$("#complete").css("display", "block");
									$scope.reset = function() {
										$scope.countryname = '';							
									};
							
									$scope.saveData = function() {
							
										var countryname = $scope.countryname;
										var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
										countryname=jQuery.trim(countryname);
										   document.getElementById("countryname").value=countryname;
										if (countryname == '') {
											$('#cAlert').show();
											$('#cAlert').delay(1500).fadeOut('slow');
											 document.getElementById("countryname").focus();	
							
										}
										else if(filter.test(countryname) == true){	
	        								$('#validcountryname').show();
							   				 $('#validcountryname').delay(1500).fadeOut('slow');
							   				 document.getElementById("countryname").focus();	
							   				 return false;
						               }
										else if(countryname!="")
										{
												if($scope.countrynamecheck == countryname)
												{
													var responsePromise = $http
													.post("updatecountry.master.htm?countryname="
															+ $scope.countryname + "&isactive="
															+ $scope.isactive + "&countryid="
															+ $scope.countryid);
											responsePromise
													.success(function(data, status, headers, config) {
														window.location.href = "country.master.htm";
														$('#submitSucess').show();
														$('#submitSucess').delay(1500).fadeOut('slow');
													});
												}
												else {
													
													$.get("checkcountry.master.htm?countryname=" + countryname, function(data, status) {
														
														if(data == 'exist')
														{
															$('#checkNameAlert').show();
														    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
														    
														}
														else
														{
															var responsePromise = $http
															.post("updatecountry.master.htm?countryname="
																	+ $scope.countryname + "&isactive="
																	+ $scope.isactive + "&countryid="
																	+ $scope.countryid);
													responsePromise
															.success(function(data, status, headers, config) {
																window.location.href = "country.master.htm";
																$('#submitSucess').show();
																$('#submitSucess').delay(1500).fadeOut('slow');
															});	
														}
													});
												}
										}
										
									};
							
								}
								
								function checkValidation(){
									var fileName=document.getElementById("fileName").value;
									var myexcel=document.getElementById("myexcel").value;
									var extension = myexcel.split('.').pop().toUpperCase();
									
									if(fileName==''){
										$('#nameAlert').show();
										$('#nameAlert').delay(1500).fadeOut('slow');	
									
									}else if(myexcel==''){
										$('#excelAlert').show();
										$('#excelAlert').delay(1500).fadeOut('slow');	
									
									}else if(extension != 'XLS' && extension != 'XLSX' ){
										$('#formatAlert').show();
										$('#formatAlert').delay(1500).fadeOut('slow');	
											
									}
									else{
										
											$.get("riskLibraryList.reg.htm?fileName="
												+ fileName, function(data, status) {
													if(data == 'exist')
													{
														$('#fileNameAlert').show();
													    $('#fileNameAlert').delay(1500).fadeOut('slow');																				    
													    
													}
													else
													{
														document.getElementById("homeForm").submit();
													}
												});
									
										
									}
									
								}