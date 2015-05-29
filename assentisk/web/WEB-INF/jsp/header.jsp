<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>

 <%
				  response.setHeader("Cache-Control","no-cache");
				  response.setHeader("Cache-Control","no-store");
				  response.setHeader("Pragma","no-cache");
				  response.setDateHeader ("Expires", 0);
				
				  if(session.getAttribute("languageVal")==null){
				  
				    response.sendRedirect("login.htm"); 
				 }
				  %>


<script>
var check = 0;
var flag = false;
            		function changetoggle(value)
            		{        
            		
            		
            		
            		if(value==1){  			
            			if(flag == false)
            			{            			
            				flag = true;
            				$('div#mCSB_1_dragger_horizontal').css('display','none');
            		  		$('div#mCSB_1_container').removeAttr('style');
            		        $('div#mCSB_1_container').removeAttr('id');
            		        $('div#mCSB_1_container').removeAttr('ltr');	
            		         $('div#mCSB_1_container').css('display','none');		
            			}
            			
            			else if(flag  == true)
            			{            				
            				flag = false;
            				$('div#mCSB_1_dragger_horizontal').css('display','block');
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
            				 $('div#mCSB_1_container').css('display','block');
	 			  						
            			}
            			}
            			else if(value==0){  	
            	
            			if(flag == true)
            			{            			
            				flag = false;
            		  		 $('div#mCSB_1_container').removeAttr('style');
            		   		 $('div#mCSB_1_container').removeAttr('id');
            		  		 $('div#mCSB_1_container').removeAttr('ltr');
            		  		 $('div#mCSB_1_dragger_horizontal').css('display','none');
            		  		 $('div#mCSB_1_container').css('display','none');
            		  		 			
            			}
            			
            			else if(flag  == false)
            			{            				
            				flag = true;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  			$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  			 $('div#mCSB_1_container').css('display','block');
            			}
            			}
            			
            		
            		   
            			 var sessiondata=$.ajax(
	 						{
	 			   				type: "GET",
	 			   				dataType: 'HTML',
	 			   				url: '<c:url value="/setSess.login.htm"/>?status='+value,	 			   			 			   	
	 			  				success: function(data)
	 			  					{		 			  							  				
	 			  								  
	 			  							  		
									}
						});
            				
            		}
            		
            		function updateRisk()
            		{
            		
            				var riskID = document.getElementById("RiskID").value;
            				 var riskdata=$.ajax(
	 						{
	 			   				type: "GET",
	 			   				dataType: 'HTML',
	 			   				url: '<c:url value="/setRisk.login.htm"/>?riskID='+riskID,	 			   			 			   	
	 			  				success: function(data)
	 			  					{		 			  							  				
									}
						});
						 var leftpanel= document.getElementById("leftPanel").value;
					      if(leftpanel == 'controls'){
					      window.location.href = 'controls.reg.htm';
					      }else if(leftpanel == 'test'){
					      window.location.href = 'test.reg.htm';
					      }
            		}
            		
            		function calltask(){
            			window.location.href="task.assets.htm";
            		}
            		
            
				</script>
				
					
<div class="headerbar">
	<a href="#" style="" class="logo-thumb"><img
			src="images/logo-thumb.png" /> </a>
	<c:choose>
		<c:when test="${sessionScope.toggle=='1'}">
			<a class="menutoggle menu-collapsed" onclick="changetoggle(0)"><i
				class="fa fa-bars"></i> </a>

		</c:when>
		<c:otherwise>
			<a class="menutoggle" onclick="changetoggle(1)"><i
				class="fa fa-bars"></i> </a>

		</c:otherwise>
	</c:choose>

	<!--	<a class="menutoggle menu-collapsed"><i class="fa fa-bars"></i>-->
	<!--	</a>-->

	<a href="#" id="imageloader" class="ajax-loader"><img
			src="images/ajax-loader.gif" /> </a>
	<a href="#" id="complete" class="ajax-loader" style="display: none;"><img
			src="images/complete.jpg" style="height: 24px;" /> </a>
<form class="searchform" action="#" method="#">
		<input type="text" class="form-control" name="keyword"
			placeholder="<c:out value="${sessionScope.Header_Search}"/>" />
	</form>

		

	<div class="header-right">
		<ul class="headermenu">
			<li>
			
	<div class="btn-group">
	
	<c:if test="${sessionScope.pendingTask!='0'}">
		<div class="notification" id="pendingTask">
		<img src="images/noti.jpg" style="width:32px;height:32px;cursor:pointer;" onclick="calltask();">
			<span style="color: red;"><c:out value="${sessionScope.pendingTask}" /></span>
			
			
		</div>
	</c:if>

	</div>
						<div class="btn-group">
				
				<span style="float: right; "> <select
					class="form-control" onchange="updateRisk();" id="RiskID">

					<c:set var="counter" value="1" />
					<c:set var="sessionCounter" value="1" />
					<c:forEach var="riskList" items="${sessionScope.riskList}"
						varStatus="status">
						<c:choose>
							<c:when test="${sessionScope.riskID == riskList.Doc_name}">
								<option value="<c:out value="${riskList.Doc_name}"/>" selected>
									<c:out value="${riskList.Doc_name}" />
								</option>
							</c:when>
							<c:otherwise>
								<option value="<c:out value="${riskList.Doc_name}"/>">
									<c:out value="${riskList.Doc_name}" />
								</option>
							</c:otherwise>
						</c:choose>



						<c:set var="counter" value="${counter + 1}" />
					</c:forEach>
				</select>
			</span>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown">
						<img src="images/loggeduser.png" alt="" />
						<c:out value="${EmpName12}"></c:out>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
						<li>
							<a href="#"><i class="glyphicon glyphicon-user"></i> <c:out
									value="${sessionScope.Header_MyProfile}" />
							</a>
						</li>
						<li>
							<a href="#"><i class="glyphicon glyphicon-cog"></i> <c:out
									value="${sessionScope.Header_Accounts}" />
							</a>
						</li>
						<li>
							<a href="#"><i class="glyphicon glyphicon-question-sign"></i>
								<c:out value="${sessionScope.Header_Help}" />
							</a>
						</li>
						<li>
							<a href="logout.htm"><i class="glyphicon glyphicon-log-out"></i>
								<c:out value="${sessionScope.Header_LogOut}" />
							</a>
						</li>
					</ul>
				</div>
	
			</li>
		</ul>
	</div>
	<!-- header-right -->


</div>
<!-- headerbar -->