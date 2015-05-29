var departmentapp = angular.module('testapp', []);

departmentapp
		.config( [
				'$httpProvider',
				function($httpProvider) {
					$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
				} ]);

function addtestController($scope, $http) {

	    $("div.leftpanelinner>ul>li#tests").css("background","#003366");
	    $("div.leftpanelinner>ul>li#tests>a").css("color","white");
		$("div.leftpanelinner>ul>li#tests>a>span").css("color","white");
		$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
		$("div.leftpanelinner>ul>li#regulations>ul").css("display","block");
		$("div.leftpanelinner>ul>li#regulations>ul>li#tests").addClass("active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");

	$scope.reset = function() {

		$scope.controlid = "";
		CKEDITOR.instances.teststep.setData();

	};

	$scope.saveData = function() {

	
		
		var controlid = $scope.controlid;		
		var teststep = CKEDITOR.instances.editor.getData();						
		
		if(controlid == '')
		{
			$('#controlidboxAlert').show();
			$('#controlidboxAlert').delay(1500).fadeOut('slow');	
		}

		else
		{
			
			$.ajax({
			     type : "POST",
			     url : 'savetest.reg.htm',
			     data: {"controlid": controlid,"teststep":teststep},
			     dataType : "text",
			     success : function(data) {
			    	 $('#submitSucess').show();
						$('#submitSucess').delay(1500).fadeOut('slow');
						window.location.href = "test.reg.htm";
			     }
			     }).responseText;
			
			
			
			/*$.get("savetest.reg.htm?controlid=" + controlid +"&teststep="+teststep, function(data, status) {
				
				$('#submitSucess').show();
				$('#submitSucess').delay(1500).fadeOut('slow');
				window.location.href = "test.reg.htm";
				
			});*/
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




function edittestController($scope, $http) {

    $("div.leftpanelinner>ul>li#tests").css("background","#003366");
    $("div.leftpanelinner>ul>li#tests>a").css("color","white");
	$("div.leftpanelinner>ul>li#tests>a>span").css("color","white");
	$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
	$("div.leftpanelinner>ul>li#regulations>ul").css("display","block");
	$("div.leftpanelinner>ul>li#regulations>ul>li#tests").addClass("active");

$("#imageloader").css("display", "none");
$("#complete").css("display", "block");

$scope.reset = function() {

	$scope.controlid = "";
	CKEDITOR.instances.teststep.setData();

};

$scope.saveData = function() {
   
	var controlid =document.getElementById("controlid").value;													

	var teststep = CKEDITOR.instances.editor.getData();		
	
	var testid=$scope.testid;
	if(controlid == '')
	{
		$('#controlidboxAlert').show();
		$('#controlidboxAlert').delay(1500).fadeOut('slow');	
	}

	else
	{
		$.ajax({
		     type : "POST",
		     url : 'updatetest.reg.htm',
		     data: {"controlid": controlid, "testId": testid,"teststep":teststep},
		     dataType : "text",
		     success : function(data) {
		    	 $('#submitSucess').show();
					$('#submitSucess').delay(1500).fadeOut('slow');
					window.location.href = "test.reg.htm";
		     }
		     }).responseText;
		
	
		/*$.post("updatetest.reg.htm?controlid="+controlid+"&testId="+testid+"&teststep="+teststep,
				function(data, status) {
			$('#submitSucess').show();
			$('#submitSucess').delay(1500).fadeOut('slow');
			window.location.href = "test.reg.htm";
			
		});*/
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