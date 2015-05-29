
				var vendorapp = angular.module('vendorapp', []);
			
				vendorapp
						.config( [
								'$httpProvider',
								function($httpProvider) {
									$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
								} ]);
			
				function addVendorController($scope, $http) {
			
					$("div.leftpanelinner>ul>li#organization").addClass(
							"nav-parent nav-active");
					$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
					$("div.leftpanelinner>ul>li#organization>ul>li#vendor").addClass(
							"active");
			
					$("#imageloader").css("display", "none");
					$("#complete").css("display", "block");
					$(".cke_top").css("display","none");
					
					$scope.reset = function()
					{						
						$scope.vendorname = "";
						$scope.countryid = "";
						$scope.stateid = "";
						$scope.cityid = "";
						$scope.phone1 = "";
						$scope.phone2 = "";
						$scope.email1 = "";
						$scope.email2 = "";
						$scope.nameContact = "";
						$scope.designationContact = "";
						$scope.phoneContact = "";
						$scope.emailContact = "";						
						CKEDITOR.instances.address.setData();
					}
					
					$scope.saveData = function() {
			
						var vendorname = $scope.vendorname;
						var country = $scope.countryid;
						var stateid = document.getElementById("stateid").value
						var cityid = $scope.cityid;
						var phone1=$scope.phone1;
						var phone2=$scope.phone2;
						var email1=$scope.email1;
						var email2=$scope.email2;
					
						vendorname=jQuery.trim(vendorname);
						document.getElementById("vendorname").value=vendorname;
						
						cityid=jQuery.trim(cityid);
						document.getElementById("cityid").value=cityid;
						phone1=jQuery.trim(phone1);
						document.getElementById("phone1").value=phone1;
						email1=jQuery.trim(email1);
						document.getElementById("email1").value=email1;
				
						var filter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;		
						var namefilter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
						if (vendorname == '' || vendorname == undefined) {
			
							$('#vname').show();
							$('#vname').delay(1500).fadeOut('slow');
			
						} 
						else if(namefilter.test(vendorname) == true){	
        				    $('#validvendorname').show();
						   	$('#validvendorname').delay(1500).fadeOut('slow');
						   	document.getElementById("vendorname").focus();	
						   				
					    }
						else if (country == '' || country == undefined) {
							$('#cname').show();
							$('#cname').delay(1500).fadeOut('slow');
			
						} else if (stateid == '' || stateid == undefined) {
							$('#sname').show();
							$('#sname').delay(1500).fadeOut('slow');
			
						}else if (cityid == '' || cityid == undefined) {
							$('#cityname').show();
							$('#cityname').delay(1500).fadeOut('slow');
			
						}else if(namefilter.test(cityid) == true){	
        				    $('#validcityid').show();
						   	$('#validcityid').delay(1500).fadeOut('slow');
						   	document.getElementById("cityid").focus();	
					      }
						else if (phone1 == '' || phone1 == undefined) {
							$('#phone11').show();
							$('#phone11').delay(1500).fadeOut('slow');
						}
						
						else if (email1 == '' || email1 == undefined) {
							$('#email11').show();
							$('#email11').delay(1500).fadeOut('slow');
			
						}else if(!filter.test(email1)){	
        					$('#validemail11').show();
						    $('#validemail11').delay(1500).fadeOut('slow');
						}
						else if(email2!=''  && !filter.test(email2) ){	
								
        					$('#validemail11').show();
							$('#validemail11').delay(1500).fadeOut('slow');
						}				
						else if(vendorname!=""){
							
							$.get("checkvendorname.org.htm?vendorname=" + vendorname, function(data, status) {
								
								if(data == 'exist')
								{
									$('#checkNameAlert').show();
								    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
								    
								}

								else {
									 var addrs=CKEDITOR.instances.address.getData();
									var responsePromise = $http
											.post("savevendor.org.htm?vendorname="
													+ vendorname + "&country=" + country
													+ "&stateid=" + stateid + "&cityid="+cityid+"&phone1="
													+ phone1 +"&phone2=" + phone2 +"&email1="
													+ email1 +"&email2="+ email2 +"&isactive="
													+ $scope.isactive+"&address="+addrs);
													
											responsePromise
											.success(function(data, status, headers, config) {
												$('#alertSuc').show();
												$('#alertSuc').delay(1500).fadeOut('slow');
												window.location.href = "vendor.org.htm";
					
											});
								}

							});
							
							
						}
						
					};
					$scope.callState = function(id) {
						var responsePromise = $http
								.get("statelist.ajaxresponse.htm?countryid=" + id);
						responsePromise.success(function(data, status, headers, config) {
							document.getElementById("statelist").innerHTML = data;
			
						});
					};
			
			
				}
				
				
				
				
				
				
				function editVendorController($scope, $http) {
					
					$("div.leftpanelinner>ul>li#organization").addClass(
							"nav-parent nav-active");
					$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
					$("div.leftpanelinner>ul>li#organization>ul>li#vendor").addClass(
							"active");
			
					$("#imageloader").css("display", "none");
					$("#complete").css("display", "block");
					$(".cke_top").css("display","none");
					$scope.reset = function()
					{						
						$scope.vendorname = $scope.resetvendorname;
						$scope.countryid = $scope.resetcountryid;
						$scope.stateid = $scope.resetstateid;
						$scope.cityid = $scope.resetcityid;
						$scope.phone1 = $scope.resetphone1;
						$scope.phone2 = $scope.resetphone2;
						$scope.email1 = $scope.resetemail1;
						$scope.email2 = $scope.resetemail2;
						$scope.nameContact = $scope.resetnameContact;
						$scope.designationContact = $scope.resetdesignationContact;
						$scope.phoneContact = $scope.resetphoneContact;
						$scope.emailContact = $scope.resetemailContact;
						CKEDITOR.instances.address.setData($scope.resetaddress);
					}
					
					$scope.saveData = function() {
			
						var vendorname = $scope.vendorname;
					
						var country = $scope.countryid;
						var stateid = document.getElementById("stateid").value
						var cityid = $scope.cityid;
						var phone1=$scope.phone1;
						var phone2=$scope.phone2;
						var email1=$scope.email1;
						var email2=$scope.email2;
						var filter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;		

						
						vendorname=jQuery.trim(vendorname);
						document.getElementById("vendorname").value=vendorname;
						
						cityid=jQuery.trim(cityid);
						document.getElementById("cityid").value=cityid;
						phone1=jQuery.trim(phone1);
						document.getElementById("phone1").value=phone1;
						email1=jQuery.trim(email1);
						document.getElementById("email1").value=email1;
						
						var filter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;		
						var namefilter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
					    var phonefilter=/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
						if (vendorname == '' || vendorname == undefined) {
			
							$('#vname').show();
							$('#vname').delay(1500).fadeOut('slow');
			
						} 
						else if(namefilter.test(vendorname) == true){	
        				    $('#validvendorname').show();
						   	$('#validvendorname').delay(1500).fadeOut('slow');
						   	document.getElementById("vendorname").focus();	
						   				
					               }
						
						else if (country == '' || country == undefined) {
							$('#cname').show();
							$('#cname').delay(1500).fadeOut('slow');
			
						} else if (stateid == '' || stateid == undefined) {
							$('#sname').show();
							$('#sname').delay(1500).fadeOut('slow');
			
						}else if (cityid == '' || cityid == undefined) {
							$('#cityname').show();
							$('#cityname').delay(1500).fadeOut('slow');
			
						}else if(namefilter.test(cityid) == true){	
        				    $('#validcityid').show();
						   	$('#validcityid').delay(1500).fadeOut('slow');
						   	document.getElementById("cityid").focus();	
					      }
						else if (phone1 == '' || phone1 == undefined) {
							$('#phone11').show();
							$('#phone11').delay(1500).fadeOut('slow');
						}
					
					    
						else if (email1 == '' || email1 == undefined) {
							$('#email11').show();
							$('#email11').delay(1500).fadeOut('slow');
			
						}else if(!filter.test(email1)){	
        					$('#validemail11').show();
						    $('#validemail11').delay(1500).fadeOut('slow');
						}
						else if(email2!=''  && !filter.test(email2) ){	
								
        					$('#validemail11').show();
							$('#validemail11').delay(1500).fadeOut('slow');
						}				
						
						else if(vendorname!=""){
			
							if($scope.vendornamecheck == vendorname)
							{
								 var addrs=CKEDITOR.instances.address.getData();
								var responsePromise = $http
								.post("updatevendor.org.htm?vendorname="
										+ vendorname + "&country=" + country
										+ "&stateid=" + stateid + "&cityid="+cityid+"&phone1="
										+ phone1 +"&phone2=" + phone2 +"&email1="
										+ email1 +"&email2="+ email2 +"&isactive="
										+ $scope.isactive + "&vendorid="+$scope.vendorid+"&address="+addrs);
										
								responsePromise
								.success(function(data, status, headers, config) {
									$('#alertSuc').show();
									$('#alertSuc').delay(1500).fadeOut('slow');
									window.location.href = "vendor.org.htm";
		
								});	
							}
							else
							{
							$.get("checkvendorname.org.htm?vendorname=" + vendorname, function(data, status) {
								
								if(data == 'exist')
								{
									$('#checkNameAlert').show();
								    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
								    
								}

								else
								{
									 var addrs=CKEDITOR.instances.address.getData();
									var responsePromise = $http
									.post("updatevendor.org.htm?vendorname="
											+ vendorname + "&country=" + country
											+ "&stateid=" + stateid + "&cityid="+cityid+"&phone1="
											+ phone1 +"&phone2=" + phone2 +"&email1="
											+ email1 +"&email2="+ email2 +"&isactive="
											+ $scope.isactive + "&vendorid="+$scope.vendorid+"&address="+addrs);
											
									responsePromise
									.success(function(data, status, headers, config) {
										$('#alertSuc').show();
										$('#alertSuc').delay(1500).fadeOut('slow');
										window.location.href = "vendor.org.htm";
			
									});	
								}

							});
							}
							
						}
					};
					$scope.callState = function(id) {
						var responsePromise = $http
								.get("statelist.ajaxresponse.htm?countryid=" + id);
						responsePromise.success(function(data, status, headers, config) {
							document.getElementById("statelist").innerHTML = data;
			
						});
					};
			
			
				}
				
				