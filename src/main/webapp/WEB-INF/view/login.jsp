<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
	margin-top: 50px;
	max-width: 600px;
	height: 350px;
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
		<h3 class="text-center text-white pt-5">Login to start your journey</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" name="f" action="/login" method="post">
							<h3 class="text-center text-success">Login</h3>
							<h5 class="text-center text-danger">
              <c:if test="${param.error eq 'true'}">Login failed. Please check your credentials.
              </c:if>
							</h5>
							<div class="form-group">
							    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<label for="username" class="text-success">Email:</label><br>
								<input type="email" name="username" id="username"
									class="form-control" required="required">
							</div>
							<div class="form-group">
								<label for="password" class="text-success">Password:</label><br>
								<input type="password" name="password" id="password"
									class="form-control" required>
							</div>
							<div class="form-group">
								<input type="submit" name="submit" class="btn btn-danger btn-md mt-3"
									value="login" style='width:100%;'>
							</div>

						</form>
						<div id="register-link" class="text-right">
							<p>Don't have any account <a href="/register" class="text-success"> SignUp </a>here</p>
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