<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="images/favicon.png" type="image/png">

		<title>Assentisk</title>

		<link href="css/custom.css" rel="stylesheet">

		<script>

window.onload = function()
{
	var action = document.getElementById("action").value;
	if(action == 'error')
	{
		$('#submitError').show();
		$('#submitError').delay(1500).fadeOut('slow');
						
	}
	var language = document.getElementById("onloadlanguage").value;
	changelanguage(language);
	
	
}	
function verify()
{
	var uname= document.getElementById("uname").value;
	var password= document.getElementById("pword").value;	
	
		
					if(uname=='' || uname=='undefined'){
										$('#unameAlert').show();
										$('#unameAlert').delay(1500).fadeOut('slow');	
										return false;
									}
									else if(password=='' || password=='undefined'){
										$('#passAlert').show();
										$('#passAlert').delay(1500).fadeOut('slow');	
										return false;
									}
									
									return true;
}

function changelanguage(language)
{	
	if(language == 'Spanish')
	{
		 $("#pword").attr("placeholder", "contraseña");
		 $("#uname").attr("placeholder", "Nombre de usuario");
		 $("#headervalue").html("Inicia sesión para acceder a su cuenta");
		 $("#forgotpasword").html("<small>Olvidaste tu contraseña?</small>");
		 $("#buttonval").html("Registrarse");
		 
	
	}
	else
	{	
	 	 $("#pword").attr("placeholder", "password");
		 $("#uname").attr("placeholder", "Username");
		 $("#headervalue").html("Login to access your account");
		 $("#forgotpasword").html("<small>Forgot your password?</small>");
		 $("#buttonval").html("Sign In");
	}
	
}	
</script>
	</head>

	<body class="signin" onload="javascript:window.history.forward(1);">

		<section>

		<div class="signinpanel" id="default">

			<div class="row" style="margin: 0 auto">

				<div class="col-md-12">

					<form action="verify.login.htm" method="POST" onsubmit="return verify();">
						<h4 class="nomargin">
							<img src="images/logo.png" />
						</h4>
						<p class="mt5 mb20" id="headervalue">
							<c:out value="${sessionScope.login_header}"/>
							
						</p>
						
						
						<c:set value="${cookie['language'].value}" var="language"></c:set>			
						<input type="hidden" name="onloadlanguage" id="onloadlanguage" value="<c:out value="${language}"/>"/>
						<input type="text" class="form-control uname"
							placeholder="<c:out value="${sessionScope.login_username}"/>" name="uname" id="uname"/>
						<input type="password" class="form-control pword" placeholder="<c:out value="${sessionScope.login_password}"/>" name="pword" id="pword"/>
						
						<input type="hidden" name="action" id="action" value="<c:out value="${action}"/>"/>
						<select class="form-control" style="width: 320px; height: 40px;" name="language" onchange="changelanguage(this.value)">
						
							<c:forEach var="list" items="${languagelist}">
										<c:choose>
											<c:when test="${language == list.Name}"><option value="<c:out value="${list.Name}"/>" selected="selected"><c:out value="${list.Name}"/></option></c:when>
											<c:otherwise><option value="<c:out value="${list.Name}"/>"><c:out value="${list.Name}"/></option></c:otherwise>
										</c:choose>
																															
									</c:forEach>
						</select>
		

						<a href="#" id="forgotpasword"><small><c:out value="${sessionScope.login_forgot_password}"/></small>
						</a>
						<button class="btn btn-success btn-block" type="submit" id="buttonval">
							<c:out value="${sessionScope.login_signin}"/>
						</button>

					</form>
				</div>
				<!-- col-sm-5 -->

			</div>
			<!-- row -->


		</div>
		<!-- signin -->

		</section>





		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/jquery-migrate-1.2.1.min.js"></script>
		<script src="js/jquery-ui-1.10.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/modernizr.min.js"></script>
		<script src="js/jquery.custom.min.js"></script>
		<script src="js/toggles.min.js"></script>
		<script src="js/jquery.cookies.js"></script>
		<script src="js/left-menu.js"></script>
		
		<div id="submitError" class="error2">
			<span> <c:out value="${sessionScope.login_username_password}"/> </span>
		</div>
		<div id="unameAlert" class="error2">
			<span>  <c:out value="${sessionScope.login_enter_username}"/></span>
		</div>
		<div id="passAlert" class="error2">
			<span><c:out value="${sessionScope.login_enter_password}"/> </span>
		</div>
		<div id="invalid" class="error2">
			<span><c:out value="${sessionScope.login_correct_entry}"/> </span>
		</div>



	</body>
</html>
