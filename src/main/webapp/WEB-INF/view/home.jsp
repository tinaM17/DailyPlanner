<html>

<head>
<title>Home</title>
<link href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'
	rel='stylesheet'>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	margin: 0;
	padding: 0;
}

.row {
	width: 100vw;
	background-color: 00a82d;
	padding: 25px;
}

.heading, .sub-header {
	margin-top: 55px;
	margin-left: 55px;
	margin-bottom: 10px;
}

.heading h1 {
	color: white;
	font-weight: 700;
}

.heading p {
	color: white;
	font-weight: 400;
	font-size: 24px;
}

.img1 {
	width: 500px;
	height: 500px;
	object-fit: cover;
}
</style>
</head>
<%@ include file="navbar.jsp"%>
<body>
	<div class='container m-0 p-0'>

		<!-- header section -->
		<div class="row">
			<div class='header d-flex flex-column col-md-6'>
				<div class='heading'>
					<h1>Daily Planner</h1>
					<p>Managing a daily schedule is tough. There's so much to do
						and only so much time. This daily planner Web App helps you focus
						on what's critical by the hour and use your time more efficiently.</p>
					<a class='btn btn-light links' href='/user/showPlanner' style='color:green;'>Add
						Plan</a>
				</div>
			</div>
			<div class="col-md-6">
				<img class="img1" src="/images/template.png" alt="template image">
			</div>
		</div>
       </div>
		<!-- sub section 1 -->
        <br>
        <br>
		<div class="container m-0 p-0">
			<div class="row" style='background-color:#e8e7e3;'>
				<div class=" header d-flex flex-column col-md-6">
					<!-- Left Column -->
					<div class="heading text-black">
						<h2>Manage your time</h2>
						<p style='color:black;'>Using a daily planner to organize your day lets you focus on what's 
						important. With this template, you block your time to work on specific projects, add appointments with ease, 
						and make sure you stay on top of everything that needs to get done.</p>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Right Column -->
					<img src="/images/watch.png" alt="Image" class="img-fluid" style='width:300px;height:300px;margin-left:60px;object-fit: cover;'>
				</div>
			</div>
		</div>
		<!-- sub section 2 -->
		<br>
        <br>
		<div class="container m-0 p-0">
			<div class="row bg-light">
				<div class=" col-md-6">
				   <!-- Left Column -->
					<img src="/images/asset6.png" alt="Image" class="img-fluid" style='width:300px;height:300px;margin-left:60px;object-fit: cover;'>
				
				</div>
				<div class=" header d-flex flex-column col-md-6">
					<!-- Right Column -->
					<div class="heading text-black">
						<h2>Boost productivity</h2>
						<p style='color:black;'>Making the most of your time each day starts with smart planning. 
						With the daily planner template, you can add tasks, appointments, 
						and reminders to help you be productive at work and home.</p>
					</div>
				</div>
			</div>
		</div>


		<!-- sub section 3 -->
		<!-- sub section 1 -->
        <br>
        <br>
		<div class="container m-0 p-0">
			<div class="row bg-light">
				<div class=" header d-flex flex-column col-md-6">
					<!-- Left Column -->
					<div class="heading text-black">
						<h2>Relieve stress</h2>
						<p style='color:black;'>Productivity has a positive impact on your mood. 
						You can use this daily planner to stay focused on getting stuff done. 
						When you meet goals and deadlines on time, you can breathe easier and enjoy 
						other parts of your life more fully.</p>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Right Column -->
					<img src="/images/asset7.png" alt="Image" class="img-fluid" style='width:300px;height:300px; margin-left:100px;object-fit: cover;'>
				</div>
			</div>
		</div>

		<!-- sub section 1 -->


	<script src='webjars/bootstrap/5.1.3/js/bootstrap.min.js'
		type="text/javascript"></script>
	<script src='webjars/jquery/3.6.0/jquery.min.js' type="text/javascript"></script>

</body>
<%@ include file="footer.jsp"%>
</html>