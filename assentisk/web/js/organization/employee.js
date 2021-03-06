var employeeapp = angular.module('employeeapp', []);

employeeapp
		.config( [
				'$httpProvider',
				function($httpProvider) {
					$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
				} ]);

function addEmployeeController($scope, $http){

	$("div.leftpanelinner>ul>li#organization")
			.addClass("nav-parent nav-active");
	$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
	$("div.leftpanelinner>ul>li#organization>ul>li#employee")
			.addClass("active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");
$scope.reset = function() {
		
		$scope.ename = "";
		$scope.companyid = "";
		$scope.departments = "";		
		$scope.location = "";
		$scope.test = "";
		CKEDITOR.instances.address.setData("");
		$scope.countryid = "";
		$scope.stateid = "";
		$scope.cityid = "";
		$scope.zip = "";
		$scope.username ="";
		$scope.password = "";
		$scope.groupval = "";
		$scope.reportingid = "";
		$scope.phone1 = "";
		$scope.phone2 = "";
		$scope.email2 ="";
		$scope.email1 = "";

	};
	$scope.saveData = function() {

		var stateid = document.getElementById("stateid").value
		var reporting = document.getElementById("responsiblehead").value;
		
		var cityid = $scope.cityid;

		var divisiondata = "";
		var myDivisions = document.getElementsByClassName("description_text");
		for ( var i = 0; i < myDivisions.length; i++) {
			divDat = myDivisions[i].innerHTML.replace(
					'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");
			if (i == myDivisions.length - 1) {
				divisiondata = divisiondata + divDat;
			} else {
				divisiondata = divisiondata + divDat + "','";
			}

		}
		

		var locationdata = "";
		var locDat = "";
		var myLocations = document
				.getElementsByClassName("description_text_loc");
		for ( var i = 0; i < myLocations.length; i++) {

			locDat = myLocations[i].innerHTML.replace(
					'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");

			if (i == myLocations.length - 1) {
				locationdata = locationdata + locDat;
			} else {
				locationdata = locationdata + locDat + "','";
			}
		}
		

		var groupdata = "";
		var gpDat = "";
		var myGroups = document
				.getElementsByClassName("description_text_group");
		for ( var i = 0; i < myGroups.length; i++) {

			gpDat = myGroups[i].innerHTML.replace(
					'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>', "");

			if (i == myGroups.length - 1) {
				groupdata = groupdata + gpDat;
			} else {
				groupdata = groupdata + gpDat + "','";
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

		var ename = $scope.ename;

		var country = $scope.countryid;
		var phone = $scope.phone1;
		var phone2 = $scope.phone2;
		var email1 = $scope.email1;
		var uname = $scope.username;
		var pass = $scope.password;
	
		var email2 = $scope.email2;
		var zip = $scope.zip;
		var filter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var namefilter = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
		var zipvalid = /^\d+(-\d+)*$/;
		var phonefilter = /^[+-]?\d+$/;
		phone = jQuery.trim(phone);
		document.getElementById("phone1").value = phone;
		phone2 = jQuery.trim(phone2);
		document.getElementById("phone2").value = phone2;
		zip = jQuery.trim(zip);
		document.getElementById("zip").value = zip;
		zip = jQuery.trim(zip);
		document.getElementById("zip").value = zip;
		ename = jQuery.trim(ename);
		document.getElementById("ename").value = ename;
		cityid = jQuery.trim(cityid);
		document.getElementById("cityid").value = cityid;
		phone = jQuery.trim(phone);
		document.getElementById("phone1").value = phone;
		uname = jQuery.trim(uname);
		document.getElementById("username").value = uname;
		pass = jQuery.trim(pass);
		document.getElementById("password").value = pass;
		ename = jQuery.trim(ename);
		document.getElementById("ename").value = ename;
		email1 = jQuery.trim(email1);
		document.getElementById("email1").value = email1;
		email2 = jQuery.trim(email2);
		document.getElementById("email2").value = email2;
		if(jQuery('#licenseuser').is(':checked')){
			
		}
		else
		{
			uname="";
			pass="";
			groupdata="";
			reporting="";
		}
		if (ename == '' || ename == undefined) {
			$('#empAlert').show();
			$('#empAlert').delay(1500).fadeOut('slow');
			document.getElementById("ename").focus();

		} else if (namefilter.test(ename) == true) {
			$('#emp_ename_valid_alert').show();
			$('#emp_ename_valid_alert').delay(1500).fadeOut('slow');
			document.getElementById("ename").focus();
		} else if (deptdata == '' || deptdata == undefined) {
			$('#depAlert').show();
			$('#depAlert').delay(1500).fadeOut('slow');
			document.getElementById("departments").focus();

		} else if (locationdata == '' || locationdata == undefined) {
			$('#lAlert').show();
			$('#lAlert').delay(1500).fadeOut('slow');

			document.getElementById("location").focus();
		} else if (divisiondata == '' || divisiondata == undefined) {
			$('#divAlert').show();
			$('#divAlert').delay(1500).fadeOut('slow');

			document.getElementById("test").focus();

		} else if (namefilter.test(cityid) == true) {
			$('#emp_cityid_valid_alert').show();
			$('#emp_cityid_valid_alert').delay(1500).fadeOut('slow');
			document.getElementById("cityid").focus();
		}  else if (email1 != ''   && !filter.test(email1)) {
			
			$('#validEmailAlert').show();
			$('#validEmailAlert').delay(1500).fadeOut('slow');
			document.getElementById("email1").focus();
		} else if (email2 != '' && !filter.test(email2)) {
			$('#validEmailAlert').show();
			$('#validEmailAlert').delay(1500).fadeOut('slow');
			document.getElementById("email2").focus();
		}else if(jQuery('#licenseuser').is(':checked')){
			if (uname == '' || uname == undefined) {
				$('#unameAlert').show();
				$('#unameAlert').delay(1500).fadeOut('slow');

			} else if (pass == '' || pass == undefined) {
				$('#passAlert').show();
				$('#passAlert').delay(1500).fadeOut('slow');

			} else if (groupdata == '') {	
				
				$('#grpAlert').show();
				$('#grpAlert').delay(1500).fadeOut('slow');

			} else if (reporting == '') {
				
				$('#repAlert').show();
				$('#repAlert').delay(1500).fadeOut('slow');

			}
			else {
				 var addrs=CKEDITOR.instances.address.getData();
				 if(uname!='')
					{
					$.get("checkusername.org.htm?username=" + uname, function(data, status) {
					
													if(data == 'exist')
													{
													
														$('#checkNameAlert').show();
													    $('#checkNameAlert').delay(1500).fadeOut('slow');
													}
													else
													{
														
														if(reporting!='')
														{
															$.get("checkreportingname.org.htm?reporting=" + reporting, function(data, status)
																	{																		
																		if(data == 'notexist')
																		{
																			$('#reportnotexistAlert').show();
																		    $('#reportnotexistAlert').delay(1500).fadeOut('slow');	
																		}
																		else
																		{
																			var responsePromise = $http.post("saveEmployee.org.htm?ename="
																					+ $scope.ename + "&address=" + addrs
																					+ "&countryid=" + $scope.countryid + "&stateid=" + stateid
																					+ "&cityid=" + cityid + "&zip=" + $scope.zip + "&phone1="
																					+ $scope.phone1 + "&phone2=" + $scope.phone2 + "&email1="
																					+ $scope.email1 + "&email2=" + $scope.email2
																					+ "&locations=" + locationdata + "&divisions="
																					+ divisiondata + "&isactive=" + $scope.isactive
																					+ "&username=" + uname + "&password="
																					+ pass + "&group=" + groupdata + "&reporting="
																					+ reporting + "&companyid=" + $scope.companyid
																					+ "&departmentid=" + deptdata);
																			
																			responsePromise.success(function(data, status, headers, config) {

																				$('#submitSucess').show();
																				$('#submitSucess').delay(1500).fadeOut('slow');
																				window.location.href = "employees.org.htm";
																			});
																		}
																
																
																	});
															
														}

															
													}
												});
			
			  }
			}
			
		}
		

		else {
			 var addrs=CKEDITOR.instances.address.getData();
			var responsePromise = $http.post("saveEmployee.org.htm?ename="
					+ $scope.ename + "&address=" + addrs
					+ "&countryid=" + $scope.countryid + "&stateid=" + stateid
					+ "&cityid=" + cityid + "&zip=" + $scope.zip + "&phone1="
					+ $scope.phone1 + "&phone2=" + $scope.phone2 + "&email1="
					+ $scope.email1 + "&email2=" + $scope.email2
					+ "&locations=" + locationdata + "&divisions="
					+ divisiondata + "&isactive=" + $scope.isactive
					+ "&username=" + uname + "&password="
					+ pass + "&group=" + groupdata + "&reporting="
					+ reporting + "&companyid=" + $scope.companyid
					+ "&departmentid=" + deptdata);
			responsePromise.success(function(data, status, headers, config) {

				$('#submitSucess').show();
				$('#submitSucess').delay(1500).fadeOut('slow');
				window.location.href = "employees.org.htm";
			});
		}
	};

	$scope.callState = function(id) {
		var responsePromise = $http.get("statelist.ajaxresponse.htm?countryid="
				+ id);
		responsePromise.success(function(data, status, headers, config) {
			document.getElementById("statelist").innerHTML = data;

		});
	};

}






function editEmployeeController($scope, $http) {
	
	
	
	$("div.leftpanelinner>ul>li#organization").addClass(
			"nav-parent nav-active");
	$("div.leftpanelinner>ul>li#organization>ul").css("display", "block");
	$("div.leftpanelinner>ul>li#organization>ul>li#employee").addClass(
			"active");

	$("#imageloader").css("display", "none");
	$("#complete").css("display", "block");

	var groupdata = document.getElementById("usergrpid").value;

	var arr = groupdata.split(',');

	for ( var i = 0; i < arr.length; i++) {
		jQuery('#test' + arr[i]).attr('checked', true)
	}
	$scope.reset = function() {
		
		$scope.ename = $scope.resetename;
		$scope.companyid = $scope.resetcompanyid;
		$scope.departments = $scope.resetdepartments;		
		$scope.location = $scope.resetlocation;
		$scope.test = $scope.resettest;
		$scope.countryid = $scope.resetcountryid;
		$scope.stateid = $scope.resetstateid;
		$scope.cityid = $scope.resetcityid;
		$scope.zip = $scope.resetzip;
		$scope.username = $scope.resetusername;
		$scope.password = $scope.resetpassword;
		$scope.groupval = $scope.resetgroupval;
		$scope.responsiblehead = $scope.resetresponsiblehead;
		$scope.divtest = $scope.resetdivtest;
		$scope.responsiblehead = $scope.resetreportingid;
		$scope.phone1 = $scope.resetphone1;
		$scope.phone2 = $scope.resetphone2;
		$scope.email2 = $scope.resetemail2;
		$scope.email1 = $scope.resetemail1;
		CKEDITOR.instances.address.setData($scope.resetaddress);

	};

	$scope.saveData = function() {

		
		var stateid = document.getElementById("stateid").value
		var cityid = $scope.cityid;

		var location = document.getElementById("location").value;
		var division = document.getElementById("test").value;

		

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
							
							locDat = myLocations[i].innerHTML.replace(
									'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
									"");
			
							if (i == myLocations.length - 1) {
								locationdata = locationdata + locDat;
							} else {
								locationdata = locationdata + locDat + "','";
							}
		}


						 var groupdata="";
			              var gpDat="";
			              var myGroups = document.getElementsByClassName("description_text_group");
							for(var i = 0; i < myGroups.length; i++)
							{
											
											gpDat = myGroups[i].innerHTML.replace(
													'<a href="javascript:void(0);" class="aclass"><span class="remove">X</span></a>',
													"");
							
											if (i == myGroups.length - 1) {
												groupdata = groupdata + gpDat;
											} else {
												groupdata = groupdata + gpDat + "','";
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
					
					
		
var ename = $scope.ename;

var country = $scope.countryid;
var phone = $scope.phone1;
var phone2 = $scope.phone2;
var email1 = $scope.email1;
var uname = $scope.username;
var pass = $scope.password;
var reporting =  document.getElementById("responsiblehead").value;

var email2 = $scope.email2;
var zip = $scope.zip;
var filter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
var namefilter = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
var zipvalid = /^\d+(-\d+)*$/;
var phonefilter = /^[+-]?\d+$/;


phone = jQuery.trim(phone);
document.getElementById("phone1").value = phone;
phone2 = jQuery.trim(phone2);
document.getElementById("phone2").value = phone2;
zip = jQuery.trim(zip);
document.getElementById("zip").value = zip;
zip = jQuery.trim(zip);
document.getElementById("zip").value = zip;
ename = jQuery.trim(ename);
document.getElementById("ename").value = ename;
cityid = jQuery.trim(cityid);
document.getElementById("cityid").value = cityid;

uname = jQuery.trim(uname);
document.getElementById("username").value = uname;

pass = jQuery.trim(pass);
document.getElementById("password").value = pass;
ename = jQuery.trim(ename);
document.getElementById("ename").value = ename;
email1 = jQuery.trim(email1);
document.getElementById("email1").value = email1;
email2 = jQuery.trim(email2);
document.getElementById("email2").value = email2;



if (ename == '' || ename == undefined) {
$('#empAlert').show();
$('#empAlert').delay(1500).fadeOut('slow');
document.getElementById("ename").focus();

} else if (namefilter.test(ename) == true) {
$('#emp_ename_valid_alert').show();
$('#emp_ename_valid_alert').delay(1500).fadeOut('slow');
document.getElementById("ename").focus();
} else if (deptdata == '' || deptdata == undefined) {
$('#depAlert').show();
$('#depAlert').delay(1500).fadeOut('slow');
document.getElementById("departments").focus();

} else if (locationdata == '' || locationdata == undefined) {
$('#lAlert').show();
$('#lAlert').delay(1500).fadeOut('slow');

document.getElementById("location").focus();
} else if (divisiondata == '' || divisiondata == undefined) {
$('#divAlert').show();
$('#divAlert').delay(1500).fadeOut('slow');

document.getElementById("test").focus();

} else if (namefilter.test(cityid) == true) {
$('#emp_cityid_valid_alert').show();
$('#emp_cityid_valid_alert').delay(1500).fadeOut('slow');
document.getElementById("cityid").focus();
}
 else if ( email1!='' && !filter.test(email1) ) {
$('#validEmailAlert').show();
$('#validEmailAlert').delay(1500).fadeOut('slow');
} else if (email2 != '' && !filter.test(email2)) {
$('#validEmailAlert').show();
$('#validEmailAlert').delay(1500).fadeOut('slow');
}else if(jQuery('#licenseuser').is(':checked')){

	if (uname == '' || uname == undefined) {
		$('#unameAlert').show();
		$('#unameAlert').delay(1500).fadeOut('slow');

	} else if (pass == '' || pass == undefined) {
		$('#passAlert').show();
		$('#passAlert').delay(1500).fadeOut('slow');

	} else if (groupdata == '') {
		$('#grpAlert').show();
		$('#grpAlert').delay(1500).fadeOut('slow');

	} else if (reporting == '') {
		$('#repAlert').show();
		$('#repAlert').delay(1500).fadeOut('slow');

	}
	else if (reporting == ename) {
		
		$('#reportnotexistAlert').show();
	    $('#reportnotexistAlert').delay(1500).fadeOut('slow');	

	}
	else {
	 var addrs=CKEDITOR.instances.address.getData();
	 var checkusername = $scope.checkusername;
	 if(uname == checkusername)
	 {

		 if(reporting!='')
			{
			 
				if($scope.resetreportingid == reporting)
				{
				
					var responsePromise = $http
					.post("updateEmployee.org.htm?ename=" + $scope.ename
							+ "&address=" + addrs + "&countryid="
							+ country + "&stateid=" + stateid
							+ "&cityid=" + cityid + "&zip=" + $scope.zip
							+ "&phone1=" + $scope.phone1 + "&phone2="
							+ $scope.phone2 + "&email1=" + $scope.email1
							+ "&email2=" + $scope.email2 + "&locations="
							+ locationdata + "&divisions=" + divisiondata
							+ "&isactive=" + $scope.isactive + "&username="
							+ uname + "&password="
							+ pass + "&group=" + groupdata
							+ "&reporting=" + reporting
							+ "&companyid=" + $scope.companyid
							+ "&departmentid=" + deptdata
							+ "&employeeid=" + $scope.employeeid+"&userID="+$scope.userID+"&licenseuser=1");
			responsePromise
					.success(function(data, status, headers, config) {
						$('#submitSucess').show();
						$('#submitSucess').delay(1500).fadeOut('slow');
						window.location.href = "employees.org.htm";
					});
				}
				else
				{
				
				$.get("checkreportingname.org.htm?reporting=" + reporting, function(data, status)
						{	
					
							if(data == 'notexist')
							{
								$('#reportnotexistAlert').show();
							    $('#reportnotexistAlert').delay(1500).fadeOut('slow');	
							}
							else
							{
								var responsePromise = $http
								.post("updateEmployee.org.htm?ename=" + $scope.ename
										+ "&address=" + addrs + "&countryid="
										+ country + "&stateid=" + stateid
										+ "&cityid=" + cityid + "&zip=" + $scope.zip
										+ "&phone1=" + $scope.phone1 + "&phone2="
										+ $scope.phone2 + "&email1=" + $scope.email1
										+ "&email2=" + $scope.email2 + "&locations="
										+ locationdata + "&divisions=" + divisiondata
										+ "&isactive=" + $scope.isactive + "&username="
										+ uname + "&password="
										+ pass + "&group=" + groupdata
										+ "&reporting=" + reporting
										+ "&companyid=" + $scope.companyid
										+ "&departmentid=" + deptdata
										+ "&employeeid=" + $scope.employeeid+"&userID="+$scope.userID+"&licenseuser=1");
						responsePromise
								.success(function(data, status, headers, config) {
									$('#submitSucess').show();
									$('#submitSucess').delay(1500).fadeOut('slow');
									window.location.href = "employees.org.htm";
								});
							}
					
					
						});
			}
			}
			
	 }
	 else
	 {	 
	
		 
			$.get("checkusername.org.htm?username=" + uname, function(data, status) {
			
			if(data == 'exist')
			{
				$('#checkNameAlert').show();
			    $('#checkNameAlert').delay(1500).fadeOut('slow');
			}
			else
			{
				if(reporting!='')
				{
					if($scope.resetreportingid == reporting)
					{
						var responsePromise = $http
						.post("updateEmployee.org.htm?ename=" + $scope.ename
								+ "&address=" + addrs + "&countryid="
								+ country + "&stateid=" + stateid
								+ "&cityid=" + cityid + "&zip=" + $scope.zip
								+ "&phone1=" + $scope.phone1 + "&phone2="
								+ $scope.phone2 + "&email1=" + $scope.email1
								+ "&email2=" + $scope.email2 + "&locations="
								+ locationdata + "&divisions=" + divisiondata
								+ "&isactive=" + $scope.isactive + "&username="
								+ uname + "&password="
								+ pass + "&group=" + groupdata
								+ "&reporting=" + reporting
								+ "&companyid=" + $scope.companyid
								+ "&departmentid=" + deptdata
								+ "&employeeid=" + $scope.employeeid+"&userID="+$scope.userID+"&licenseuser=1");
				responsePromise
						.success(function(data, status, headers, config) {
							$('#submitSucess').show();
							$('#submitSucess').delay(1500).fadeOut('slow');
							window.location.href = "employees.org.htm";
						});
					}
					else
					{
					
					$.get("checkreportingname.org.htm?reporting=" + reporting, function(data, status)
							{																		
								if(data == 'notexist')
								{
									$('#reportnotexistAlert').show();
								    $('#reportnotexistAlert').delay(1500).fadeOut('slow');	
								}
								else
								{
									var responsePromise = $http
									.post("updateEmployee.org.htm?ename=" + $scope.ename
											+ "&address=" + addrs + "&countryid="
											+ country + "&stateid=" + stateid
											+ "&cityid=" + cityid + "&zip=" + $scope.zip
											+ "&phone1=" + $scope.phone1 + "&phone2="
											+ $scope.phone2 + "&email1=" + $scope.email1
											+ "&email2=" + $scope.email2 + "&locations="
											+ locationdata + "&divisions=" + divisiondata
											+ "&isactive=" + $scope.isactive + "&username="
											+ uname + "&password="
											+ pass + "&group=" + groupdata
											+ "&reporting=" + reporting
											+ "&companyid=" + $scope.companyid
											+ "&departmentid=" + deptdata
											+ "&employeeid=" + $scope.employeeid+"&userID="+$scope.userID+"&licenseuser=1");
							responsePromise
									.success(function(data, status, headers, config) {
										$('#submitSucess').show();
										$('#submitSucess').delay(1500).fadeOut('slow');
										window.location.href = "employees.org.htm";
									});
								}
						
						
							});
				}
				}
				
			}
		});
	}

	}
	
}
else {
	
 var addrs=CKEDITOR.instances.address.getData();
	var responsePromise = $http
			.post("updateEmployee.org.htm?ename=" + $scope.ename
					+ "&address=" + addrs + "&countryid="
					+ country + "&stateid=" + stateid
					+ "&cityid=" + cityid + "&zip=" + $scope.zip
					+ "&phone1=" + $scope.phone1 + "&phone2="
					+ $scope.phone2 + "&email1=" + $scope.email1
					+ "&email2=" + $scope.email2 + "&locations="
					+ locationdata + "&divisions=" + divisiondata
					+ "&isactive=" + $scope.isactive + "&username="
					+ uname + "&password="
					+ pass + "&group=" + groupdata
					+ "&reporting=" + reporting
					+ "&companyid=" + $scope.companyid
					+ "&departmentid=" + deptdata
					+ "&employeeid=" + $scope.employeeid+"&userID="+$scope.userID+"&licenseuser=0");
	responsePromise
			.success(function(data, status, headers, config) {
				$('#submitSucess').show();
				$('#submitSucess').delay(2000).fadeOut('slow');
				window.location.href = "employees.org.htm";
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

