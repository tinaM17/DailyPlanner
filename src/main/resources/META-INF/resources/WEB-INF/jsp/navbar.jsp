<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'
	rel='stylesheet'>

<style>
.links {
	text-decoration: none;
	color: black;
	font-size: 18px;
	font-weight: 600;
}

.links:hover {
	color: green;
	border-bottom: 3px solid green;
}
</style>
</head>
<body>
	<nav class="navbar bg-body-tertiary" style="background-color: #e3f2fd;">
		<div class="container-fluid">
			<div class="d-inline-flex">
				<a class="navbar-brand" href="/"
					style='text-decoration: none; color: black; font-size: 22px; font-weight: bolder;'>Daily
					Planner</a> <a class='btn links' href='/user/showPlanner'>Add Plan</a>
				<a class='btn links' href='/about'>About</a> <a class='btn links'
					href='/help'>Help</a>
			</div>
			<div class="d-flex">
				<c:choose>
					<c:when test="${not empty username}">
						<div class="dropdown">
							<a class="btn dropdown-toggle" href="#" role="button"
								id="userDropdown" data-bs-toggle="dropdown"
								aria-expanded="false"> <img src="/images/user.png"
								alt="User Icon"
								style="width: 30px; height: 30px; object-fit: cover;">
								${username}
							</a>
							<ul class="dropdown-menu" aria-labelledby="userDropdown">
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><form action="/logout" method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<button type="submit" class="dropdown-item">Logout</button>
									</form></li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<form action="register" method="get">
							<button class="btn btn-danger" style='margin-right: 5px'
								type="submit">SignUp</button>
						</form>
						<div>
							<a class="btn btn-outline-primary ml-1" type="submit"
								href="login">Login</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

	<script src='webjars/bootstrap/5.1.3/js/bootstrap.min.js'
		type="text/javascript"></script>
	<script src='webjars/jquery/3.6.0/jquery.min.js' type="text/javascript"></script>

</body>
</html>