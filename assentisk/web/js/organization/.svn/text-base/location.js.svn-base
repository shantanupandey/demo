var locationapp = angular.module('locationapp', []);

	locationapp
			.config( [
					'$httpProvider',
					function($httpProvider) {
						$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
					} ]);

	function addLocationController($scope, $http) {

		$("div.leftpanelinner>ul>li#organization").addClass(
				"nav-parent nav-active");
		$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#organization>ul>li#locations").addClass(
				"active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");
		$(".cke_top").css("display","none");
		$scope.reset = function() {			
			CKEDITOR.instances.address.setData("");
		};
		$scope.saveData = function() {
				
					
			var stateid = document.getElementById("stateid").value
	
			var locationname=$scope.locationname;			
			var countryid=$scope.countryid;
			
			var cityidVal = $scope.cityid;
			
			var contactno=$scope.contactno;
			
			var email1=$scope.email1;
			var zip=$scope.zipcode;
			var email2=$scope.email2;
			var phone1=$scope.phone1;
			var phone2=$scope.phone2;
			var fax1=$scope.fax1;
			var fax2=$scope.fax2;
			   fax1=jQuery.trim(fax1);
			   document.getElementById("fax1").value=fax1;
			   fax2=jQuery.trim(fax2);
			   document.getElementById("fax2").value=fax2;
			   phone1=jQuery.trim(phone1);
			   document.getElementById("phone1").value=phone1;
			   phone2=jQuery.trim(phone2);
			   document.getElementById("phone2").value=phone2;
			   locationname=jQuery.trim(locationname);
			   document.getElementById("locationname").value=locationname;
			   cityidVal=jQuery.trim(cityidVal);
			   document.getElementById("cityid").value=cityidVal;
			   contactno=jQuery.trim(contactno);
			   document.getElementById("contactno").value=contactno;
			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
			
			   
			 if(locationname==''){
						$('#divLocNameAlert').show();
			     		$('#divLocNameAlert').delay(1500).fadeOut('slow');	
			     		 document.getElementById("locationname").focus();	
									
			   }
			 else if(filter.test(locationname) == true){	
					$('#validlocationName_alert').show();
	   				 $('#validlocationName_alert').delay(1500).fadeOut('slow');
	   				 document.getElementById("locationname").focus();	
	   				 return false;
            }
			   else if(countryid==''){
						$('#divCountryAlert').show();
			     		$('#divCountryAlert').delay(1500).fadeOut('slow');	
									
			   }else if(stateid==''){
						$('#divStateAlert').show();
			     		$('#divStateAlert').delay(1500).fadeOut('slow');	
									
			   }else if(cityidVal==''){
						$('#divCityAlert').show();
			     		$('#divCityAlert').delay(1500).fadeOut('slow');	
			     		document.getElementById("cityid").focus();	
									
			   }
			   else if(filter.test(cityidVal) == true){	
					$('#divCityidValidAlert').show();
	   				 $('#divCityidValidAlert').delay(1500).fadeOut('slow');
	   				 document.getElementById("cityid").focus();	
	   				 return false;
			   }
			   else if(contactno==''){
						$('#divContactAlert').show();
			     		$('#divContactAlert').delay(1500).fadeOut('slow');	
			     		document.getElementById("contactno").focus();	
									
			   }
			   else if(filter.test(contactno) == true){	
					$('#Location_validcontactno').show();
	   				 $('#Location_validcontactno').delay(1500).fadeOut('slow');
	   				 	document.getElementById("contactno").focus();	
	   				 return false;
              }
			  
			   else if(email1==''){
						$('#divemail1Alert').show();
			     		$('#divemail1Alert').delay(1500).fadeOut('slow');	
									
			   }else if (!validateEmail(email1)) {
				        $('#divEmailErrorAlert').show();
				        $('#divEmailErrorAlert').delay(1500).fadeOut('slow');
			   }
			  
			   else if(email2!='' && !validateEmail(email2))
			   {
			     $('#divEmail2ErrorAlert').show();
				 $('#divEmail2ErrorAlert').delay(1500).fadeOut('slow');
			   }
			  
			   
			else if(locationname!=""){
				
				$.get("checklocationname.org.htm?locationname=" + locationname, function(data, status) {
					
					if(data == 'exist')
					{
						$('#checkNameAlert').show();
					    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
					    
					}
					else
					{
			
						addrs=CKEDITOR.instances.address.getData();

						var responsePromise = $http.post("savelocation.org.htm?locationname="
								+ $scope.locationname + "&companyid=" + $scope.companyid + "&countryid="+$scope.countryid+"&stateid="+stateid+"&cityid="+cityidVal+"&street="+$scope.street
								+"&address="+addrs+"&contactno="+$scope.contactno+"&zipcode="+$scope.zipcode+"&phone1="+$scope.phone1+"&phone2="+$scope.phone2
								+ "&email1="+$scope.email1+"&email2="+$scope.email2+"&fax1="+$scope.fax1+"&fax2="+$scope.fax2+"&url="+$scope.url+"&isactive="+$scope.isactive);
						responsePromise.success(function(data, status, headers, config) {
								$('#submitSucess').show();
								$('#submitSucess').delay(1500).fadeOut('slow');
							window.location.href = "locations.org.htm";
						});
					}

				});
				
			
			
			
			}
		};
		
		$scope.callState = function(id) { 				    		 	    		 			 		  
 					var responsePromise = $http.get("statelist.ajaxresponse.htm?countryid="+id);
                	responsePromise.success(function(data, status, headers, config) {                	
                		document.getElementById("statelist").innerHTML = data;
                	
                	});
    		};
    		    	
	}
	

	
	function validateEmail(sEmail) {
	var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if (filter.test(sEmail)) {
	return true;
	}
	else {
	return false;
	}
	}
	
	function isNumberKey(evt)
       {
		 if(e.shiftKey && e.keyCode == 189) 
	       {
	             e.preventDefault();
	             return;          
	       }
	       if((e.shiftKey && e.keyCode == 57) || (e.shiftKey && e.keyCode == 48)) 
	       {
	             return;
	       }
	       // Allow: backspace, delete, tab, escape, enter and .
	        
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13,109, 189,32]) !== -1 ||
	             // Allow: Ctrl+A
	            (e.keyCode == 65 && e.ctrlKey === true) || 
	             // Allow: home, end, left, right, down, up
	            (e.keyCode >= 35 && e.keyCode <= 40)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ) {
	            e.preventDefault();
	        }
            
       }
	
	
	function editLocationController($scope, $http) {

		$("div.leftpanelinner>ul>li#organization").addClass(
				"nav-parent nav-active");
		$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#organization>ul>li#locations").addClass(
				"active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");
		$(".cke_top").css("display","none");
	
		$scope.reset = function() {			
			$scope.locationname = $scope.resetlocation;			
			$scope.countryid = $scope.resetcountry;						
			$scope.callState($scope.countryid);
			//document.getElementById("stateid").selectedIndex = "2";		
			$scope.cityid = $scope.resetcity;
			$scope.zipcode = $scope.resetzipcode;
			$scope.contactno = $scope.resetcontactno;
			$scope.phone1 = $scope.resetphone1;
			$scope.phone2 = $scope.resetphone2;
			$scope.email1 = $scope.resetemail1;
			$scope.email2 = $scope.resetemail2;
			$scope.fax1 = $scope.resetfax1;
			$scope.fax2 = $scope.resetfax2;
			$scope.url = $scope.reseturl;
			CKEDITOR.instances.address.setData($scope.resetaddress);
		};

		$scope.saveData = function() {

			var stateid = document.getElementById("stateid").value;
			
			var locationname = $scope.locationname;
			
			var countryid = $scope.countryid;
			var cityidVal = $scope.cityid;
			var contactno = $scope.contactno;
			var email1 = $scope.email1;
			var email2=$scope.email2;
			var zip=$scope.zipcode;
			var email2=$scope.email2;
			var phone1=$scope.phone1;
			var phone2=$scope.phone2;
			var fax1=$scope.fax1;
			var fax2=$scope.fax2;
			   fax1=jQuery.trim(fax1);
			   document.getElementById("fax1").value=fax1;
			   fax2=jQuery.trim(fax2);
			   document.getElementById("fax2").value=fax2;
			   phone1=jQuery.trim(phone1);
			   document.getElementById("phone1").value=phone1;
			   phone2=jQuery.trim(phone2);
			   document.getElementById("phone2").value=phone2;
			   locationname=jQuery.trim(locationname);
			   document.getElementById("locationname").value=locationname;
			   cityidVal=jQuery.trim(cityidVal);
			   document.getElementById("cityid").value=cityidVal;
			   contactno=jQuery.trim(contactno);
			   document.getElementById("contactno").value=contactno;
			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
			  
			   
			 if(locationname==''){
						$('#divLocNameAlert').show();
			     		$('#divLocNameAlert').delay(1500).fadeOut('slow');	
			     		 document.getElementById("locationname").focus();	
									
			   }
			 else if(filter.test(locationname) == true){	
					$('#validlocationName_alert').show();
	   				 $('#validlocationName_alert').delay(1500).fadeOut('slow');
	   				 document.getElementById("locationname").focus();	
	   				 return false;
            }
			   else if(countryid==''){
						$('#divCountryAlert').show();
			     		$('#divCountryAlert').delay(1500).fadeOut('slow');	
									
			   }else if(stateid==''){
						$('#divStateAlert').show();
			     		$('#divStateAlert').delay(1500).fadeOut('slow');	
									
			   }else if(cityidVal==''){
						$('#divCityAlert').show();
			     		$('#divCityAlert').delay(1500).fadeOut('slow');	
			     		document.getElementById("cityid").focus();	
									
			   }
			   else if(filter.test(cityidVal) == true){	
					$('#divCityidValidAlert').show();
	   				 $('#divCityidValidAlert').delay(1500).fadeOut('slow');
	   				 document.getElementById("cityid").focus();	
	   				 return false;
			   }
			   else if(contactno==''){
						$('#divContactAlert').show();
			     		$('#divContactAlert').delay(1500).fadeOut('slow');	
			     		document.getElementById("contactno").focus();	
									
			   }
			   else if(filter.test(contactno) == true){	
					$('#Location_validcontactno').show();
	   				 $('#Location_validcontactno').delay(1500).fadeOut('slow');
	   				 	document.getElementById("contactno").focus();	
	   				 return false;
              }
			  
			   else if(email1==''){
						$('#divemail1Alert').show();
			     		$('#divemail1Alert').delay(1500).fadeOut('slow');	
									
			   }else if (!validateEmail(email1)) {
				        $('#divEmailErrorAlert').show();
				        $('#divEmailErrorAlert').delay(1500).fadeOut('slow');
			   }
			  
			   else if(email2!='' && !validateEmail(email2))
			   {
			     $('#divEmail2ErrorAlert').show();
				 $('#divEmail2ErrorAlert').delay(1500).fadeOut('slow');
			   }
				else if(locationname!=""){
					
					if($scope.locationnamecheck == locationname)
					{
						 var addrs=CKEDITOR.instances.address.getData();
						var responsePromise = $http
						.post("updatelocation.org.htm?locationname="
								+ $scope.locationname + "&companyid="
								+ $scope.companyid + "&countryid="
								+ $scope.countryid + "&stateid=" + stateid
								+ "&cityid=" + cityidVal + "&street="
								+ $scope.street + "&address=" + addrs
								+ "&contactno=" + $scope.contactno
								+ "&zipcode=" + $scope.zipcode + "&phone1="
								+ $scope.phone1 + "&phone2=" + $scope.phone2
								+ "&email1=" + $scope.email1 + "&email2="
								+ $scope.email2 + "&fax1=" + $scope.fax1
								+ "&fax2=" + $scope.fax2 + "&url=" + $scope.url
								+ "&isactive=" + $scope.isactive
								+ "&locationid=" + $scope.locationid);
				responsePromise
						.success(function(data, status, headers, config) {
							$('#submitSucess').show();
							$('#submitSucess').delay(1500).fadeOut('slow');
							window.location.href = "locations.org.htm";
						});
					}
					else
					{
					
					$.get("checklocationname.org.htm?locationname=" + locationname, function(data, status) {
						
						if(data == 'exist')
						{
							$('#checkNameAlert').show();
						    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
						    
						}
						else {

							 var addrs=CKEDITOR.instances.address.getData();


							var responsePromise = $http
									.post("updatelocation.org.htm?locationname="
											+ $scope.locationname + "&companyid="
											+ $scope.companyid + "&countryid="
											+ $scope.countryid + "&stateid=" + stateid
											+ "&cityid=" + cityidVal + "&street="
											+ $scope.street + "&address=" + addrs
											+ "&contactno=" + $scope.contactno
											+ "&zipcode=" + $scope.zipcode + "&phone1="
											+ $scope.phone1 + "&phone2=" + $scope.phone2
											+ "&email1=" + $scope.email1 + "&email2="
											+ $scope.email2 + "&fax1=" + $scope.fax1
											+ "&fax2=" + $scope.fax2 + "&url=" + $scope.url
											+ "&isactive=" + $scope.isactive
											+ "&locationid=" + $scope.locationid);
							responsePromise
									.success(function(data, status, headers, config) {
										$('#submitSucess').show();
										$('#submitSucess').delay(1500).fadeOut('slow');
										window.location.href = "locations.org.htm";
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