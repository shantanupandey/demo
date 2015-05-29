var departmentapp = angular.module('legalentityapp', []);
	
	departmentapp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
	
	}]);
	
	function addlegalentityController($scope, $http) {
		    $("div.leftpanelinner>ul>li#group").css("background","#003366");
    			$("div.leftpanelinner>ul>li#group>a").css("color","white");
    		    $("div.leftpanelinner>ul>li#group>a>span").css("color","white");
	
			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#division").addClass("active");
	
	 	$("#imageloader").css("display", "none");
         $("#complete").css("display", "block");

		$scope.reset = function() {
		$scope.legalentityname="";
		CKEDITOR.instances.legalentitydesc.setData();
		};
				
 		    $scope.saveData = function() {  		    
 				var branchid = "0";			
 				var departmentid="0";
 				//var empName =document.getElementById("responsiblehead").value;
 				
 			   var divName=$scope.legalentityname;
 			   var legalentitydesc=CKEDITOR.instances.legalentitydesc.getData(); 			   
 			   divName=jQuery.trim(divName);
 				
 			    var re = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
 				var isSplChar = re.test(divName); 
 					if(divName==''){
						$('#divNameAlert').show();
						$('#divNameAlert').delay(1500).fadeOut('slow');	
					
					 }
					 else if(divName!='' && isSplChar==true)
						{
									$('#characterAlert').show();
									$('#characterAlert').delay(1500).fadeOut('slow');
						}
					 else if(legalentitydesc==''){
											$('#divDescAlert').show();
											$('#divDescAlert').delay(1500).fadeOut('slow');	
										
					 }
	 
					 
				else if(divName!=''){ 
										
					$.get("checkdivisionname.org.htm?divname=" + divName, function(data, status) {
					
						if(data == 'exist')
						{
							$('#checkNameAlert').show();
						    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
						    
						}
						
						else
						{
							
								var responsePromise = $http.post("savelegalentity.org.htm?legalentityname="+$scope.legalentityname+"&legalentitydesc="+legalentitydesc+"&companyid=0"+"&departmentid=0"+"&branchid=0"+"&companyperiodid=0"+"&isactive=true"+"&empName=0");
			                	responsePromise.success(function(data, status, headers, config) {
			                	$('#submitSucess').show();
								$('#submitSucess').delay(1500).fadeOut('slow');
			                    window.location.href = "legalentities.org.htm";
			                    });	
							
							
								
						}


					});

 					
                
                }
    		};
    		$scope.callbranch = function(id) { 		    		 	    		 			 		   	
 					var responsePromise = $http.get("callbranch.org.htm?id="+id);
                	responsePromise.success(function(data, status, headers, config) {
                		document.getElementById("branchselect").innerHTML = data;
                	
                	});
    		};
    		
	}
	function calldep()
	{
	

		var companyid=document.getElementById("companyid").value;
		var branchid=document.getElementById("branchid").value;
		
		
				 var all=$.ajax(
	 				{
	 			   		type: "GET",
	 			   		dataType: 'HTML',
	 			   		url: '<c:url value="/calldept.org.htm"/>?branchid='+branchid+'&companyid='+companyid,	 			   			 			   	
	 			  		success: function(data)
	 			  				{		 			  							  				
	 			  						document.getElementById("departmentselect").innerHTML = data;			  					
								}
								});
			
	}
	
	
	function editLegalEntityController($scope, $http) {

		$("div.leftpanelinner>ul>li#group").css("background", "#003366");
		$("div.leftpanelinner>ul>li#group>a").css("color", "white");
		$("div.leftpanelinner>ul>li#group>a>span").css("color", "white");
		$("div.leftpanelinner>ul>li#organization").addClass(
				"nav-parent nav-active");
		$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#organization>ul>li#division").addClass(
				"active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");

		$scope.reset = function() {
				$scope.legalentityname = $scope.resetlegalentity;
				CKEDITOR.instances.legalentitydescription.setData($scope.resetlegalentitydescription);
		};

		$scope.saveData = function() {
			
			var legalentityid = $scope.legalentityid;
		   var divName=$scope.legalentityname;
		   var legalentitydesc=CKEDITOR.instances.legalentitydescription.getData();
		  		   

			divName = jQuery.trim(divName);
			document.getElementById("legalentityname").value = divName;
			var namefilter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
		
			       if(divName=='' || divName==undefined){
										$('#divNameAlert').show();
										$('#divNameAlert').delay(1500).fadeOut('slow');	
									
				    }
			       else if(namefilter.test(divName) == true){	
			        	$('#characterAlert').show();
						$('#characterAlert').delay(1500).fadeOut('slow');
					   	document.getElementById("legalentityname").focus();	
			
				   }
				    else if(legalentitydesc=='' || legalentitydesc==undefined){
										$('#divDescAlert').show();
										$('#divDescAlert').delay(1500).fadeOut('slow');	
									
				    }
			else if(divName!=""){
				
				if(divName == $scope.legalentitynamecheck)
				{
					
							var responsePromise = $http
							.post("updatelegalentity.org.htm?legalentityid="
									+ $scope.legalentityid + "&legalentityname="
									+ $scope.legalentityname
									+ "&legalentitydescription="
									+ legalentitydesc + "&companyid=0"
									 + "&departmentid=0"
									+ "&isactive=true"+ "&branchid=0"
									 + "&companyperiodid=0"
									+"&empName=0");

					responsePromise.success(function(data, status, headers, config) {
						$('#submitSucess').show();
							$('#submitSucess').delay(1500).fadeOut('slow');
						window.location.href = "legalentities.org.htm";
					});
						
						
							
					
			
				}
				
				else
				{
					$.get("checkdivisionname.org.htm?divname=" + divName, function(data, status) {
						
						if(data == 'exist')
						{
							$('#checkNameAlert').show();
						    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
						    
						}
						
						else
						{
							

							var responsePromise = $http
							.post("updatelegalentity.org.htm?legalentityid="
									+ $scope.legalentityid + "&legalentityname="
									+ $scope.legalentityname
									+ "&legalentitydescription="
									+ legalentitydesc + "&companyid=0"
									 + "&departmentid=0"
									+ "&isactive=true"+ "&branchid=0"
									 + "&companyperiodid=0"
									+"&empName=0");


						responsePromise.success(function(data, status, headers, config) {
							$('#submitSucess').show();
								$('#submitSucess').delay(1500).fadeOut('slow');
							window.location.href = "legalentities.org.htm";
						});
							
							
						}


					});
				}
			}

			$scope.callbranch = function(id) {
				var responsePromise = $http.get("callbranch.org.htm?id=" + id);
				responsePromise
						.success(function(data, status, headers, config) {
							document.getElementById("branchselect").innerHTML = data;

						});
			};
           
		}
	}
	
	
	
