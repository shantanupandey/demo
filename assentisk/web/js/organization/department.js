	var departmentapp = angular.module('departmentapp', []);
	
	departmentapp.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
	}]);
	
	function addDepartmentController($scope, $http) {
	$("div.leftpanelinner>ul>li#group").css("background","#003366");
    			$("div.leftpanelinner>ul>li#group>a").css("color","white");
    		    $("div.leftpanelinner>ul>li#group>a>span").css("color","white");
			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#department").addClass("active");
	

 		$("#imageloader").css("display", "none");
         $("#complete").css("display", "block");

		$scope.reset = function() {
		
			$scope.branchid = "";
			$scope.departmentname = "";
			CKEDITOR.instances.departmentdesc.setData();
				
		};
				
 		   $scope.saveData = function() {
 			   
 			   
 		    var departmentname=$scope.departmentname;
 		    var departmentdesc = CKEDITOR.instances.departmentdesc.getData();
 		   departmentname=jQuery.trim(departmentname);
		   document.getElementById("departmentname").value=departmentname;
		   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
 		    if($scope.departmentname == '')
 		   {
 		   	  $('#deptNameAlert').show();
			  $('#deptNameAlert').delay(1500).fadeOut('slow');	
 		   } 
 		   else if(filter.test(departmentname) == true){	
				$('#validdepartmentname_alert').show();
  				 $('#validdepartmentname_alert').delay(1500).fadeOut('slow');
  				 document.getElementById("departmentname").focus();	
       }
 		   else if($scope.departmentname!="") 			   
 		   {
 			   
 			   
 			  $.get("checkdepartmentname.org.htm?departmentname=" + $scope.departmentname, function(data, status) {
					
 				  
					if(data == 'exist')
					{
						$('#checkNameAlert').show();
					    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
					    
					}

					else
					{
						$('#submitSucess').show();
						  $('#submitSucess').delay(1500).fadeOut('slow');	
					    		 	    		 			 		   	
			 					var responsePromise = $http.post("savedepartment.org.htm?companyid="+$scope.companyid+"&departmentname="+$scope.departmentname+"&departmentdesc="+departmentdesc+"&isactive="+$scope.isactive);
			                	responsePromise.success(function(data, status, headers, config) {
			                    window.location.href = "department.org.htm";
			                });	
					}

				});
 		   	  
                
                }
    		};
    
	}
	
	
	
	function editDepartmentController($scope, $http) {
		$("div.leftpanelinner>ul>li#group").css("background","#003366");
	    	 $("div.leftpanelinner>ul>li#group>a").css("color","white");
	    	 $("div.leftpanelinner>ul>li#group>a>span").css("color","white");
			 $("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			 $("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			 $("div.leftpanelinner>ul>li#organization>ul>li#department").addClass("active");
			 $("#imageloader").css("display", "none");
	         $("#complete").css("display", "block");
			
			$scope.reset = function() {	
				
				var resetDescription = document.getElementById("resetDescription").value;	
				
				CKEDITOR.instances.departmentdesc.setData(resetDescription);
				
				$scope.departmentname = $scope.resetdepartment;
				$scope.departmentdesc = $scope.resetdepartmentdesc;	
				
			};
					
	 		  $scope.saveData = function() {
	 			  var departmentname=$scope.departmentname;
	 			  var departmentdesc = CKEDITOR.instances.departmentdesc.getData();;
	 	 		   departmentname=jQuery.trim(departmentname);
	 			   document.getElementById("departmentname").value=departmentname;
	 			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
	 	 		    if($scope.departmentname == '')
	 	 		   {
	 	 		   	  $('#deptNameAlert').show();
	 				  $('#deptNameAlert').delay(1500).fadeOut('slow');	
	 				 document.getElementById("departmentname").focus();	
	 	 		   } 
	 	 		   else if(filter.test(departmentname) == true){	
	 					$('#validdepartmentname_alert').show();
	 	  				 $('#validdepartmentname_alert').delay(1500).fadeOut('slow');
	 	  				 document.getElementById("departmentname").focus();	
	 	       }
	 		 else if($scope.departmentname!="") 			   
	 		   {
	 			   
	 			  if($scope.departmentnamecheck == $scope.departmentname) 
	 			  {
	 				 $('#submitSucess').show();
					  $('#submitSucess').delay(1500).fadeOut('slow');

					   var responsePromise = $http.post("updatedepartment.org.htm?departmentid="+$scope.departmentid+"&companyid="+$scope.companyid+"&departmentname="+departmentname+"&departmentdesc="+departmentdesc+"&isactive="+$scope.isactive);
		 		  
		                	responsePromise.success(function(data, status, headers, config) {
		                    window.location.href = "department.org.htm";
		                });
	 			  }
	 			  else
	 			  {
	 			  $.get("checkdepartmentname.org.htm?departmentname=" + $scope.departmentname, function(data, status) {
						
	 				  
						if(data == 'exist')
						{
							$('#checkNameAlert').show();
						    $('#checkNameAlert').delay(1500).fadeOut('slow');																					    
						    
						}

						 else
				 		   {
				 		   	  $('#submitSucess').show();
							  $('#submitSucess').delay(1500).fadeOut('slow');

							   var responsePromise = $http.post("updatedepartment.org.htm?departmentid="+$scope.departmentid+"&companyid="+$scope.companyid+"&departmentname="+$scope.departmentname+"&departmentdesc="+$scope.departmentdesc+"&isactive="+$scope.isactive);
				 		  
				                	responsePromise.success(function(data, status, headers, config) {
				                    window.location.href = "department.org.htm";
				                });
				                
				 		   }

					});
	 		   	  
	 		   }
	                }
	 		  
	 		 
	                
	 		  }
	    
		}