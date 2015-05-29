var departmentapp = angular.module('controlapp', []);

departmentapp
		.config( [
				'$httpProvider',
				function($httpProvider) {
					$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
				} ]);

function addcontrolController($scope, $http) {

	$("div.leftpanelinner>ul>li#controls").css("background", "#003366");
	$("div.leftpanelinner>ul>li#controls>a").css("color", "white");
	$("div.leftpanelinner>ul>li#controls>a>span").css("color", "white");
	$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
	$("div.leftpanelinner>ul>li#regulations>ul").css("display", "block");
	$("div.leftpanelinner>ul>li#regulations>ul>li#controls").addClass("active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");

	$scope.reset = function() {

		$scope.controlid = "";
		CKEDITOR.instances.risk.setData();
		CKEDITOR.instances.controlobjective.setData();
		CKEDITOR.instances.controldesc.setData();

	};

	$scope.saveData = function() {

		var controlid = $scope.controlid;
		controlid = jQuery.trim(controlid);
		var risk = CKEDITOR.instances.risk.getData();
		var controlobjective = CKEDITOR.instances.controlobjective.getData();
		var controldesc = CKEDITOR.instances.controldesc.getData();
		var controlCat=document.getElementById("controlCatdata").value;
		var business=document.getElementById("businessProcess").value;
		
		controlCat=jQuery.trim(controlCat);
		document.getElementById("controlCatdata").value=controlCat;	
		
		business=jQuery.trim(business);
		document.getElementById("businessProcess").value=business;	
		
		var filter=/[`~!@#$%^&*()|+\-=?;:'",<>\{\}\[\]\\\/]/gi;
		
		if(controlid == '')
		{
			$('#controlidAlert').show();
			$('#controlidAlert').delay(1500).fadeOut('slow');	
		}
		else if(filter.test(controlid) == true){	
			
			$('#validcontrolid_alert').show();
		    $('#validcontrolid_alert').delay(1500).fadeOut('slow');
				
		}
		else if(controlCat == ''){
			$('#controlCatAlert').show();
		    $('#controlCatAlert').delay(1500).fadeOut('slow');
		}
		else if(business == ''){
			$('#businessAlert').show();
		    $('#businessAlert').delay(1500).fadeOut('slow');
		}
		else
		{
			 $.get("savecontrol.reg.htm?controlid=" + $scope.controlid+"&risk="+risk+"&controlobjective="
					 +controlobjective+"&controldesc="+controldesc+"&businessProc="+business+"&control="+controlCat, function(data, status) {
					
				 $('#submitSucess').show();
				 $('#submitSucess').delay(1500).fadeOut('slow');
				 window.location.href = "controls.reg.htm";
			 });
			
			
			
			
			
		}
		

	};

}




function editcontrolController($scope, $http) {

	$("div.leftpanelinner>ul>li#controls").css("background", "#003366");
	$("div.leftpanelinner>ul>li#controls>a").css("color", "white");
	$("div.leftpanelinner>ul>li#controls>a>span").css("color", "white");
	$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
	$("div.leftpanelinner>ul>li#regulations>ul").css("display", "block");
	$("div.leftpanelinner>ul>li#regulations>ul>li#controls").addClass("active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");

	$scope.reset = function() {

		$scope.controlid = $scope.resetcontrolid;
		CKEDITOR.instances.risk.setData($scope.resetrisk);
		CKEDITOR.instances.controlobjective.setData($scope.resetcontrolobjective);
		CKEDITOR.instances.controldesc.setData($scope.resetcontroldesc);

	};

	$scope.saveData = function() {
		
		var controlid = $scope.controlid;
		controlid = jQuery.trim(controlid);
		var risk = CKEDITOR.instances.risk.getData();
		var controlobjective = CKEDITOR.instances.controlobjective.getData();
		var controldesc = CKEDITOR.instances.controldesc.getData();
		var filter=/[`~!@#$%^&*()|+\-=?;:'",<>\{\}\[\]\\\/]/gi;
		var controlCat=document.getElementById("controlCatdata").value;
		var business=document.getElementById("businessProcess").value;
		var id=document.getElementById("id").value;
		controlCat=jQuery.trim(controlCat);
		document.getElementById("controlCatdata").value=controlCat;	
		
		business=jQuery.trim(business);
		document.getElementById("businessProcess").value=business;	
		if(controlid == '')
		{
			$('#controlidAlert').show();
			$('#controlidAlert').delay(1500).fadeOut('slow');	
		}
		else if(filter.test(controlid) == true){	
			
			$('#validcontrolid_alert').show();
		    $('#validcontrolid_alert').delay(1500).fadeOut('slow');
				
		}
		else if(controlCat == ''){
			$('#controlCatAlert').show();
		    $('#controlCatAlert').delay(1500).fadeOut('slow');
		}
		else if(business == ''){
			$('#businessAlert').show();
		    $('#businessAlert').delay(1500).fadeOut('slow');
		}
		else
		{
		
			$.get("updatecontrol.reg.htm?controlid=" + $scope.controlid+"&risk="+risk+"&controlobjective="
					+controlobjective+"&controldesc="+controldesc+"&id="+id+"&businessProc="+business+"&control="+controlCat, function(data, status) {
				
				$('#submitSucess').show();
				$('#submitSucess').delay(1500).fadeOut('slow');
				window.location.href = "controls.reg.htm";
				
			});

			
		}
		

	};

}
