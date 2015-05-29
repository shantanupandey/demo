	var applicationapp = angular.module('applicationapp', []);

	applicationapp
			.config( [
					'$httpProvider',
					function($httpProvider) {
						$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
					} ]);

	function addApplicationController($scope, $http) {

		$("div.leftpanelinner>ul>li#organization").addClass(
				"nav-parent nav-active");
		$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#organization>ul>li#applications").addClass(
				"active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");

		
		$scope.reset = function() {
			
			$scope.applicationname = "";
				
		};
		
		$scope.saveData = function() {

			var empName = document.getElementById("responsiblehead").value;
			var location = document.getElementById("location").value;
			var division = document.getElementById("test").value;
			var applicationname = $scope.applicationname;
			applicationname=jQuery.trim(applicationname);
			   document.getElementById("applicationname").value=applicationname;
			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
			
			

			var divisiondata = "";
			var myDivisions = document.getElementsByClassName("description_text");
			
			for ( var i = 0; i < myDivisions.length; i++) {
				divDat = myDivisions[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',"");
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
								
								locDat = myLocations[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',	"");
				
								if (i == myLocations.length - 1) {
									locationdata = locationdata + locDat;
								} else {
									locationdata = locationdata + locDat + "','";
								}
			}

				var deptdata = "";
				var deptDat = "";
				var myDepts = document.getElementsByClassName("description_text_dep");
				for ( var i = 0; i < myDepts.length; i++) {

					deptDat = myDepts[i].innerHTML.replace(
							'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");

					if (i == myDepts.length - 1) {
						deptdata = deptdata + deptDat;
					} else {
						deptdata = deptdata + deptDat + "','";
					}
				}

				
				if (applicationname == '' || applicationname == undefined) {

					$('#divAppNameAlert').show();
					$('#divAppNameAlert').delay(1500).fadeOut('slow');

				} 
				 else if(filter.test(applicationname) == true){	
						$('#validapplicationname_alert').show();
		  				 $('#validapplicationname_alert').delay(1500).fadeOut('slow');
		  				 document.getElementById("applicationname").focus();	
		       }
			else if(applicationname!=""){

				$.get("checkapplicationname.org.htm?applicationname=" + applicationname, function(data, status) {
					
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
								
								if(data == "exist")
								{
								
									var responsePromise = $http
									.post("saveapplication.org.htm?applicationname="
											+ $scope.applicationname + "&location="
											+ locationdata + "&division=" + divisiondata
											+ "&responsiblehead=" + empName + "&isactive="
											+ $scope.isactive+"&deptdata="+deptdata);
							responsePromise
									.success(function(data, status, headers, config) {
										$('#alertSuc').show();
										$('#alertSuc').delay(1500).fadeOut('slow');
										window.location.href = "applications.org.htm";

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
							.post("saveapplication.org.htm?applicationname="
									+ $scope.applicationname + "&location="
									+ locationdata + "&division=" + divisiondata
									+ "&responsiblehead=" + empName + "&isactive="
									+ $scope.isactive+"&deptdata="+deptdata);
								responsePromise
							.success(function(data, status, headers, config) {
								$('#alertSuc').show();
								$('#alertSuc').delay(1500).fadeOut('slow');
								window.location.href = "applications.org.htm";

							});	
						}
						
					
							
					}
				

				});
				
				
			}
		};

	}
	
	
	
	
	function editApplicationController($scope, $http) {

		$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
		$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#organization>ul>li#applications").addClass("active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");

$scope.reset = function()
{
			$scope.applicationname = $scope.resetapplicationname;
			$scope.location = $scope.resetlocation;
			$scope.test = $scope.resettest;
			$scope.departments = $scope.resetdepartments;
			$scope.responsiblehead = $scope.resetresponsiblehead;
}
		$scope.saveData = function() {				
			
			var empName =document.getElementById("responsiblehead").value;
			var location =document.getElementById("location").value;
			var division =document.getElementById("test").value;
			var applicationname=$scope.applicationname;
			
			
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
								
								locDat = myLocations[i].innerHTML.replace('<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',"");
				
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
			
			
			
			if (applicationname == '' || applicationname == undefined) {
				
				$('#divAppNameAlert').show();
				$('#divAppNameAlert').delay(1500).fadeOut('slow');

			}			
			else if(applicationname!=""){

				if($scope.applicationnamecheck == applicationname)
				{
					
					if(empName!="")
					{
						$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status) {
							
							if(data == "exist")
							{
							
								var responsePromise = $http.post("updateapplication.org.htm?applicationname="
										+ $scope.applicationname + "&location=" + locationdata + "&division="+divisiondata+
										"&responsiblehead="+empName+"&isactive="+$scope.isactive+"&applicationid=" +
												""+$scope.applicationid+"&deptdata="+deptdata);
							
								responsePromise
								.success(function(data, status, headers, config) {
									$('#alertSuc').show();
									$('#alertSuc').delay(1500).fadeOut('slow');
									window.location.href = "applications.org.htm";

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
						var responsePromise = $http.post("updateapplication.org.htm?applicationname="
								+ $scope.applicationname + "&location=" + locationdata + "&division="+divisiondata+
								"&responsiblehead="+empName+"&isactive="+$scope.isactive+"&applicationid=" +
										""+$scope.applicationid+"&deptdata="+deptdata);
					
						responsePromise
						.success(function(data, status, headers, config) {
							$('#alertSuc').show();
							$('#alertSuc').delay(1500).fadeOut('slow');
							window.location.href = "applications.org.htm";

						});
					}
					
					
				}
				else
				{
				
				$.get("checkapplicationname.org.htm?applicationname=" + applicationname, function(data, status) {
					
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
								
								if(data == "exist")
								{
								
									
									var responsePromise = $http.post("updateapplication.org.htm?applicationname="
											+ $scope.applicationname + "&location=" + locationdata + "&division="+divisiondata+
											"&responsiblehead="+empName+"&isactive="+$scope.isactive+"&applicationid=" +
													""+$scope.applicationid+"&deptdata="+deptdata);
									responsePromise
									.success(function(data, status, headers, config) {
										$('#alertSuc').show();
										$('#alertSuc').delay(1500).fadeOut('slow');
										window.location.href = "applications.org.htm";

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
							var responsePromise = $http.post("updateapplication.org.htm?applicationname="
									+ $scope.applicationname + "&location=" + locationdata + "&division="+divisiondata+
									"&responsiblehead="+empName+"&isactive="+$scope.isactive+"&applicationid=" +
											""+$scope.applicationid+"&deptdata="+deptdata);
					responsePromise
							.success(function(data, status, headers, config) {
								$('#alertSuc').show();
								$('#alertSuc').delay(1500).fadeOut('slow');
								window.location.href = "applications.org.htm";

							});
						}
							
					}


				  });
				
				}
				
			}
			
			
		};
		
		
    		    	
	}