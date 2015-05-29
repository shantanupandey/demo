  
  function validate()
  {
        
           
 		   var currency=document.getElementById("currency").value;
 		 
 		   var headOffice= document.getElementById("headOffice").value;
 		   var country=document.getElementById("countryid").value;
 		   var state= document.getElementById("stateid").value;
 	       var city= document.getElementById("cityid").value;
 	       city=jQuery.trim(city);
 	       var filter=/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
 	       var emailfilter = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		   document.getElementById("cityid").value=city;
 	       var zip= document.getElementById("zip").value;
 	       zip=jQuery.trim(zip);
		   document.getElementById("zip").value=zip;
 	       var zipvalid=/^\d+(-\d+)*$/;
 	       
 	       
 	       var Primary_Contact_Name= document.getElementById("Primary_Contact_Name").value;
 	       Primary_Contact_Name=jQuery.trim(Primary_Contact_Name);
		   document.getElementById("Primary_Contact_Name").value=Primary_Contact_Name;
 	       
 	       var Primary_Contact_Number= document.getElementById("Primary_Contact_Number").value;
 	        Primary_Contact_Number=jQuery.trim(Primary_Contact_Number);
		   document.getElementById("Primary_Contact_Number").value=Primary_Contact_Number;
 	       var phonefilter= /^[+-]?\d+$/;
 	       var primaryEmail= document.getElementById("primaryEmail").value;
 	        primaryEmail=jQuery.trim(primaryEmail);
		   document.getElementById("primaryEmail").value=primaryEmail;
 	       var Legal_Contact_Name= document.getElementById("Legal_Contact_Name").value;
 	         Legal_Contact_Name=jQuery.trim(Legal_Contact_Name);
		   document.getElementById("Legal_Contact_Name").value=Legal_Contact_Name;
		   
 	       var Legal_Contact_Number= document.getElementById("Legal_Contact_Number").value;
 	       
 	         Legal_Contact_Number=jQuery.trim(Legal_Contact_Number);
		   document.getElementById("Legal_Contact_Number").value=Legal_Contact_Number;
 	       var Legal_Contact_Email= document.getElementById("Legal_Contact_Email").value;
 	       
 	           Legal_Contact_Email=jQuery.trim(Legal_Contact_Email);
		   document.getElementById("Legal_Contact_Email").value=Legal_Contact_Email;
 	       var Accounts_Contact_Name= document.getElementById("Accounts_Contact_Name").value;
 	       
 	        Accounts_Contact_Name=jQuery.trim(Accounts_Contact_Name);
		   document.getElementById("Accounts_Contact_Name").value=Accounts_Contact_Name;
		   
 	       var Accounts_Contact_Number= document.getElementById("Accounts_Contact_Number").value;
 	       
 	                Accounts_Contact_Number=jQuery.trim(Accounts_Contact_Number);
		   document.getElementById("Accounts_Contact_Number").value=Accounts_Contact_Number;
 	       var Accounts_Contact_Email= document.getElementById("Accounts_Contact_Email").value;
 	       
 	          Accounts_Contact_Email=jQuery.trim(Accounts_Contact_Email);
		   document.getElementById("Accounts_Contact_Email").value=Accounts_Contact_Email;
 	    
 	     
		   var logo=document.getElementById("logo").value;
		   var extension = logo.split('.').pop().toUpperCase();
		     
		             
						            if(logo.length != 0){
						            if(extension != 'GIF' && extension != 'PNG' && extension != 'JPG' && extension != 'JPEG' ){
						             $('#imageExtensionAlert').show();
						             $('#imageExtensionAlert').delay(1500).fadeOut('slow'); 
						             return false;
						            }
						            }
 	     
 	     
								    if(currency=='' || currency == undefined){
										$('#currencyAlert').show();
										$('#currencyAlert').delay(1500).fadeOut('slow');	
									    return false;
									}
									else if(headOffice=='' || headOffice==undefined){
										$('#headAlert').show();
										$('#headAlert').delay(1500).fadeOut('slow');	
									    return false;
									}
									else if(country=='' || country==undefined){
									
										$('#countryAlert').show();
										$('#countryAlert').delay(1500).fadeOut('slow');	
									    return false;
									}
									else if(state=='' || state==undefined){
										$('#stateAlert').show();
										$('#stateAlert').delay(1500).fadeOut('slow');	
									    return false;
									}
									else if(city=='' || city==undefined){
										$('#cityAlert').show();
										$('#cityAlert').delay(1500).fadeOut('slow');
										document.getElementById("cityid").focus();	
									    return false;
									}
									else if(filter.test(city) == true){	
        								$('#validcity').show();
						   				 $('#validcity').delay(1500).fadeOut('slow');
						   				 document.getElementById("cityid").focus();	
						   				 return false;
					               }
									else if(Primary_Contact_Name=='' || Primary_Contact_Name==undefined){
										$('#pNameAlert').show();
										$('#pNameAlert').delay(1500).fadeOut('slow');	
											document.getElementById("Primary_Contact_Name").focus();	
									    return false;
									}
									else if(filter.test(Primary_Contact_Name) == true){	
        								$('#validprimarycont').show();
						   				 $('#validprimarycont').delay(1500).fadeOut('slow');
						   				 	document.getElementById("Primary_Contact_Name").focus();	
						   				 return false;
					               }
									else if(Primary_Contact_Number=='' || Primary_Contact_Number==undefined){
										$('#pNumberAlert').show();
										$('#pNumberAlert').delay(1500).fadeOut('slow');	
											document.getElementById("Primary_Contact_Number").focus();	
									    return false;
									}
									else if(primaryEmail=='' || primaryEmail==undefined){
										$('#pEmailAlert').show();
										$('#pEmailAlert').delay(1500).fadeOut('slow');	
										document.getElementById("primaryEmail").focus();	
									    return false;
									}
									else if(!emailfilter.test(primaryEmail)){	
        									$('#validprimaryemail').show();
						   					 $('#validprimaryemail').delay(1500).fadeOut('slow');
						   					 document.getElementById("primaryEmail").focus();	
						   					 return false;
										}
									else if(Legal_Contact_Name=='' || Legal_Contact_Name==undefined){
										$('#lNameAlert').show();
										$('#lNameAlert').delay(1500).fadeOut('slow');	
										document.getElementById("Legal_Contact_Name").focus();	
									    return false;
									}
									else if(filter.test(Legal_Contact_Name) == true){	
        								$('#validlegalcont').show();
						   				 $('#validlegalcont').delay(1500).fadeOut('slow');
						   				 document.getElementById("Legal_Contact_Name").focus();	
						   				 return false;
					               	}
									
									else if(Legal_Contact_Number=='' || Legal_Contact_Number==undefined){
										$('#lNumberAlert').show();
										$('#lNumberAlert').delay(1500).fadeOut('slow');	
										document.getElementById("Legal_Contact_Number").focus();	
									    return false;
									}
										
									
									else if(Legal_Contact_Email=='' || Legal_Contact_Email==undefined){
										$('#lEmailAlert').show();
										$('#lEmailAlert').delay(1500).fadeOut('slow');	
											document.getElementById("Legal_Contact_Email").focus();	
									    return false;
									}
									else if(!emailfilter.test(Legal_Contact_Email)){	
        									$('#validlegalemail').show();
						   					 $('#validlegalemail').delay(1500).fadeOut('slow');
						   					 	document.getElementById("Legal_Contact_Email").focus();	
						   					 return false;
										}
									
									else if(Accounts_Contact_Name=='' || Accounts_Contact_Name==undefined){
										$('#aNameAlert').show();
										$('#aNameAlert').delay(1500).fadeOut('slow');	
										 	document.getElementById("Accounts_Contact_Name").focus();	
									    return false;
									}
									else if(filter.test(Accounts_Contact_Name)== true){	
        								$('#validaccountcont').show();
						   				 $('#validaccountcont').delay(1500).fadeOut('slow');
						   				  	document.getElementById("Accounts_Contact_Name").focus();	
						   				 return false;
					               	}
									else if(Accounts_Contact_Number=='' || Accounts_Contact_Number==undefined){
										$('#aNumberAlert').show();
										$('#aNumberAlert').delay(1500).fadeOut('slow');	
										document.getElementById("Accounts_Contact_Number").focus();	
									    return false;
									}
									
									else if(Accounts_Contact_Email=='' || Accounts_Contact_Email==undefined){
										$('#aEmailAlert').show();
									 	$('#aEmailAlert').delay(1500).fadeOut('slow');	
									 	document.getElementById("Accounts_Contact_Email").focus();	
									    return false;
									}
									else if(!emailfilter.test(Accounts_Contact_Email)){	
        									$('#validaccountemail').show();
						   					 $('#validaccountemail').delay(1500).fadeOut('slow');
						   					 document.getElementById("Accounts_Contact_Email").focus();	
						   					 return false;
										}
									else
									{									
										 $('#submitSucess').show();
					   					 $('#submitSucess').delay(1500).fadeOut('slow');					   					 
					   					 return true;
									}
									
								
  }
 

function callState(id)
{
	$.get("statelist.ajaxresponse.htm?countryid=" + id, function(data, status) {
									document.getElementById("statelist").innerHTML = data;
								});
}								
  function callCity(stateid) {
								var countryid = document.getElementById("countryid").value;
								$.get("cityList.ajaxresponse.htm?countryid=" + countryid + "&stateid="
										+ stateid, function(data, status) {
									document.getElementById("cityList").innerHTML = data;
								});
							}

function copyprimarytoaccount()
{
	var copyfield = document.getElementById("copyaccountfield").checked;
	
	var Primary_Contact_Name= document.getElementById("Primary_Contact_Name").value;
 	var Primary_Contact_Number= document.getElementById("Primary_Contact_Number").value;
 	var primaryEmail= document.getElementById("primaryEmail").value;
 	
	if(copyfield == true)
	{		
 	    document.getElementById("Accounts_Contact_Name").value = Primary_Contact_Name;
 	    document.getElementById("Accounts_Contact_Number").value = Primary_Contact_Number;
 	    document.getElementById("Accounts_Contact_Email").value = primaryEmail;
	}
	
	
}	
function copyprimarytolegal()
{
	var copyfield = document.getElementById("copylegalfield").checked;
	
	var Primary_Contact_Name= document.getElementById("Primary_Contact_Name").value;
 	var Primary_Contact_Number= document.getElementById("Primary_Contact_Number").value;
 	var primaryEmail= document.getElementById("primaryEmail").value;
 	
	if(copyfield == true)
	{
	    document.getElementById("Legal_Contact_Name").value = Primary_Contact_Name; 	        	        	        	        	       
 	    document.getElementById("Legal_Contact_Number").value = Primary_Contact_Number;
 	    document.getElementById("Legal_Contact_Email").value = primaryEmail; 	
	}
}

function resetValue()
{		
	 var addrs=CKEDITOR.instances.headOffice.getData();
	 var resetHeadOffice_Address = document.getElementById("resetHeadOffice_Address").value;	 
	 CKEDITOR.instances.headOffice.setData(resetHeadOffice_Address);
	
}
