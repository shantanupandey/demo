var departmentapp = angular.module('controlapp', []);

departmentapp
		.config( [
				'$httpProvider',
				function($httpProvider) {
					$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
				} ]);

 function addcontrolController($scope, $http) {

	$("div.leftpanelinner>ul>li#controlCat").css("background", "#003366");
	$("div.leftpanelinner>ul>li#controlCat>a").css("color", "white");
	$("div.leftpanelinner>ul>li#controlCat>a>span").css("color", "white");
	$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
	$("div.leftpanelinner>ul>li#regulations>ul").css("display", "block");
	$("div.leftpanelinner>ul>li#regulations>ul>li#controlCat").addClass("active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");

	$scope.reset = function() {

		$scope.controlid = "";
		CKEDITOR.instances.risk.setData();
		CKEDITOR.instances.controlobjective.setData();
		CKEDITOR.instances.controldesc.setData();

	};

	$scope.saveData = function(){
		
		var controlCategory = document.getElementById("controlCategory").value;
		var buisnessProcess = $("#buisnessProcess").val();
		var parent = $("#parent").val();
		var status=document.getElementById("formStatus").value;
		var id=document.getElementById("controlId").value;
		
		
		
		if(parent==null){
			
			parent=0;
		}
	
		
		if(controlCategory == '')
		{
			$('#controlidAlert').show();
			$('#controlidAlert').delay(1500).fadeOut('slow');	
		}
		else if(buisnessProcess == ''){	
			
			$('#buisnessProcessDiv').show();
		    $('#buisnessProcessDiv').delay(1500).fadeOut('slow');
				
		}
		else
		{
			$.get("savecontrolCategory.reg.htm?controlCategory=" + controlCategory+"&buisnessProcess="+buisnessProcess+"&parent="+parent+"&status="+status+"&id="+id, function(data, status) {
				
				$('#submitSucess').show();
				$('#submitSucess').delay(1500).fadeOut('slow');
				window.location.href = "controlCategory.reg.htm";
				
			});
			/*
			if(controlid!='')
			{
			
				$.get("checkcontrolid.reg.htm?controlid=" + $scope.controlid, function(data, status) {
											
						if(data == 'exist')
						{							
							$('#controlidconfirmAlert').show();
							$('#controlidconfirmAlert').delay(1500).fadeOut('slow');
						}
						else
						{
							$.get("savecontrol.reg.htm?controlid=" + $scope.controlid+"&risk="+risk+"&controlobjective="+controlobjective+"&controldesc="+controldesc, function(data, status) {
								
								$('#submitSucess').show();
								$('#submitSucess').delay(1500).fadeOut('slow');
								
							});
							
						}
				});
			}
			*/
			
		}
		

	};

}


