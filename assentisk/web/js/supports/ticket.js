	var ticketapp = angular.module('ticketapp', []);

	ticketapp
			.config( [
					'$httpProvider',
					function($httpProvider) {
						$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
					} ]);

	function addTicketController($scope, $http) {

		$("div.leftpanelinner>ul>li#support").addClass(
				"nav-parent nav-active");
		$("div.leftpanelinner>ul>li#support>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#support>ul>li#ticket").addClass(
				"active");

		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");

		
		$scope.reset = function() {
			
			CKEDITOR.instances.detail.setData();
				
		};
		
		$scope.saveData = function() {

			var empName = document.getElementById("responsiblehead").value;
			
			var title = $scope.title;
			var priority=$scope.priority;
			var catList= document.getElementById("catList").value;
			
			title=jQuery.trim(title);
			 document.getElementById("title").value=title;
			 
			 var detail=CKEDITOR.instances.detail.getData();
			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
			   if (catList == '' || catList == undefined) {

					$('#ticket_Category_alert').show();
					$('#ticket_Category_alert').delay(1500).fadeOut('slow');

				} 
			   else if (title == '' || title == undefined) {

					$('#divTicketTitleAlert').show();
					$('#divTicketTitleAlert').delay(1500).fadeOut('slow');

				} 
				 else if(filter.test(title) == true){	
						$('#validTicketTitle_alert').show();
		  				 $('#validTicketTitle_alert').delay(1500).fadeOut('slow');
		  				 document.getElementById("title").focus();	
				 }
				 else if(detail == '' || detail == undefined){
					
						$('#divTicketDetailAlert').show();
						$('#divTicketDetailAlert').delay(1500).fadeOut('slow');
				 }
				 else if(empName=='' || empName == undefined){
					 	$('#divTicketAssignAlert').show();
						$('#divTicketAssignAlert').delay(1500).fadeOut('slow');
					 
				 }
				 else{
					 var newemp = empName.split('(')[0];
						if(empName!="")
						{
							$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status){
								
								if(data == "exist")
								{
								
									var responsePromise = $http
									.post("saveticket.assets.htm?title="
											+ title + "&priority="
											+ priority + "&detail=" + detail
											+ "&responsiblehead=" + empName+"&catList="+catList);
									responsePromise
									.success(function(data, status, headers, config) {
										$('#alertSuc').show();
										$('#alertSuc').delay(1500).fadeOut('slow');
										window.location.href = "ticket.assets.htm";

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
							.post("saveticket.assets.htm?title="
									+ title + "&priority="
									+ priority + "&detail=" + detail
									+ "&responsiblehead=" + empName+"&catList="+catList);
								responsePromise
							.success(function(data, status, headers, config) {
								$('#alertSuc').show();
								$('#alertSuc').delay(1500).fadeOut('slow');
								window.location.href = "ticket.assets.htm";

							});	
						}
				 }
						
					
							
			
		};

	}
	
	
	
	
	function editTicketController($scope, $http) {

		$("div.leftpanelinner>ul>li#support").addClass("nav-parent nav-active");
		$("div.leftpanelinner>ul>li#support>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#support>ul>li#ticket").addClass("active");
		$("#imageloader").css("display", "none");
		$("#complete").css("display", "block");

		$scope.reset = function()
		{
			
			var dtl=CKEDITOR.instances.detail.getData();
			var resetDetail = document.getElementById("resetDetail").value;	
			
			CKEDITOR.instances.detail.setData(resetDetail);
			 
			document.getElementById("title").value=document.getElementById("resettitle").value;	
			document.getElementById("responsiblehead").value=document.getElementById("resetresponsiblehead").value;	

		}
		$scope.saveData = function() {				
			
			var empName = document.getElementById("responsiblehead").value;
			
			var title = document.getElementById("title").value;
			var priority=$scope.priority;
			var ticketID=$scope.ticketID;
			var tasktype=$scope.tasktype;
			var catList= document.getElementById("catList").value;
			title=jQuery.trim(title);
			 document.getElementById("title").value=title;
			 
			 var detail=CKEDITOR.instances.detail.getData();
			   var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
		
			   if (catList == '' || catList == undefined) {

					$('#ticket_Category_alert').show();
					$('#ticket_Category_alert').delay(1500).fadeOut('slow');

				} 
			   else if (title == '' || title == undefined) {

					$('#divTicketTitleAlert').show();
					$('#divTicketTitleAlert').delay(1500).fadeOut('slow');

				} 
				 else if(filter.test(title) == true){	
						$('#validTicketTitle_alert').show();
		  				 $('#validTicketTitle_alert').delay(1500).fadeOut('slow');
		  				 document.getElementById("title").focus();	
				 }
				 else if(detail == '' || detail == undefined){
					
						$('#divTicketDetailAlert').show();
						$('#divTicketDetailAlert').delay(1500).fadeOut('slow');
				 }
				 else if(empName=='' || empName == undefined){
					 	$('#divTicketAssignAlert').show();
						$('#divTicketAssignAlert').delay(1500).fadeOut('slow');
					 
				 }
				 else{
					 var newemp = empName.split('(')[0];
						if(empName!="")
						{
							$.get("checkreportingname.org.htm?reporting=" + empName, function(data, status){
								
								if(data == "exist")
								{
								
									var responsePromise = $http
									.post("updateticket.assets.htm?title="
											+ title + "&priority="
											+ priority + "&detail=" + detail
											+ "&responsiblehead=" + empName+"&ticketID="+ticketID+"&tasktype="+tasktype+"&catList="+catList);
									responsePromise
									.success(function(data, status, headers, config) {
										$('#alertSuc').show();
										$('#alertSuc').delay(1500).fadeOut('slow');
										
											window.location.href = "ticket.assets.htm";
									
										

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
							.post("updateticket.assets.htm?title="
									+ title + "&priority="
									+ priority + "&detail=" + detail
									+ "&responsiblehead=" + empName+"&ticketID="+ticketID+"&tasktype="+tasktype+"&catList="+catList);
								responsePromise
							.success(function(data, status, headers, config) {
								$('#alertSuc').show();
								$('#alertSuc').delay(1500).fadeOut('slow');
								
									window.location.href = "ticket.assets.htm";
								

							});	
						}
				 }
					
			
			
				
		
			
			
		};
		
		
    		    	
	}