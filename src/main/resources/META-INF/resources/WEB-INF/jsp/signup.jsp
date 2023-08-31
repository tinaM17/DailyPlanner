<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<link href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'
	rel='stylesheet'>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #00a82d;
	height: 100vh;
}

#login .container #login-row #login-column #login-box {
	margin-top: 70px;
	max-width: 600px;
	height: 400px;
	border: 1px solid #9C9C9C;
	background-color: #EAEAEA;
}

#login .container #login-row #login-column #login-box #login-form {
	padding: 20px;
}

#login .container #login-row #login-column #login-box #login-form #register-link
	{
	margin-top: -85px;
}

.text-right {
	display: flex;
	justify-content: center;
	margin:10px;
}
</style>
</head>
<body>
	<div id="login">
		<h3 class="text-center text-white pt-5">Create Account</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form:form id="login-form" class="form" action="register" method="post" modelAttribute="user">
							<h3 class="text-center text-success">SignUp</h3>
							<h5 class="text-center text-danger">${error }</h5>
							<div class="form-group">
								<label for="username" class="text-success">Username:</label><br>
								<form:input path="username" 
									class="form-control" required="required" />
									<form:errors path="username"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="email" class="text-success">Email:</label><br>
								<form:input type="email" path="email" 
									class="form-control" required="required"/>
									<form:errors path="email"
									cssClass="text-danger" />
							</div>
							<div class="form-group">
								<label for="password" class="text-success">Password:</label><br>
								<form:input type="password" path="password"
									class="form-control" required="required" />
									<form:errors path="password"
									cssClass="text-warning" />
							</div>
							<div class="form-group">
								<input type="submit" name="submit" class="btn btn-danger btn-md mt-3"
									value="Sign Up" style='width:100%;'>
							</div>

						</form:form>
						<div id="register-link" class="text-right">
							<p>Already have an account <a href="/login" class="text-success"> Login </a>here</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src='webjars/bootstrap/5.1.3/js/bootstrap.min.js'
		type="text/javascript"></script>
	<script src='webjars/jquery/3.6.0/jquery.min.js' type="text/javascript"></script>

</body>
</html>