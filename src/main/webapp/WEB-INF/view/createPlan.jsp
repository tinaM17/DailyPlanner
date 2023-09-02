<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Create Plan</title>
<link
	href='${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css'
	rel='stylesheet'>
<style>
.container {
 width:100vw;
 height:100vh;
}
 .img {
   width:400px;
   height:400px;
   object-fit:cover;
   margin-top:45px;
   margin-left:20px;
 }
 
 .label {
   font-weight:600;
   color:green;
   font-size:18px;
 }
</style>
</head>
<%@ include file="navbar.jsp"%>
<body>
	<div class="container">
		<div class='row'>
		 <h2 class='text-center text-success'>Consistency Is The Key Too Success</h2>
			<div class='col-md-6'>
				<img alt="" class="img" src="/images/asset11.png">

			</div>
			<div class='col-md-6'>
				<c:choose>
					<c:when test="${not empty task}">
						<form method="post" action="editPlan">
							<div class='wrapper mt-5 bg-info p-3'
								style='display: flex; justify-content: center; align-items: center; flex-direction: column; width: 500px; margin: auto; border-radius: 25px;'>

								<h4 class='mb-3 text-light'>Update your plans for ${date}</h4>
								<section
									style='display: flex; justify-content: center; align-items: center; flex-direction: column; width: 300px'>
									<div class="form-row mb-2" style='width: 100%;'>
									   <label class='pb-2 label' for="description">Task Description: </label>
										<textarea rows="2" name="description" class="form-control"
											placeholder="Description">${task.description }</textarea>
									</div>
									<div class="form-row mb-2" style='width: 100%;'>
									<label class='pb-2 label' for="date">Date: </label>
										<input type="date" value=${date } name="date"
											class="form-control" placeholder="Date" readonly>
									</div>
									<div class="form-row mb-2" style='width: 100%;'>
									<label class='pb-2 label' for="time">Time: </label>
										<input type="time" value=${task.time } name="time"
											class="form-control" placeholder="Time">
									</div>
									<input type="hidden" name="taskId" value="${task.task_id}">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								  <input type="submit" class='btn btn-success mb-4' style='width: 100%;' value="Edit">
								</section>
								
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<form method="post" action="createPlan">
							<div class='wrapper mt-5 bg-info p-3'
								style='display: flex; justify-content: center; align-items: center; flex-direction: column; width: 500px; margin: auto; border-radius: 25px;'>

								<h4 class='mb-3 text-light'>Enter your plans for ${date}</h4>
								<section
									style='display: flex; justify-content: center; align-items: center; flex-direction: column; width: 300px'>
									<div class="form-row mb-2" style='width: 100%;'>
									<label class='pb-2 label' for="description">Task Description: </label>
										<textarea rows="2" name="description" class="form-control"
											placeholder="Description"></textarea>
									</div>
									<div class="form-row mb-2" style='width: 100%;'>
									<label class='pb-2 label' for="date">Date: </label>
										<input type="date" name="date" value=${date }
											class="form-control" placeholder="Date" readonly>
									</div>
									<div class="form-row mb-2" style='width: 100%;'>
									<label class='pb-2 label' for="time">Time: </label>
										<input type="time" name="time" class="form-control"
											placeholder="Time">
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<input type="submit" class='btn btn-success mb-4' style='width: 100%;' value="Create">
								</section>
				
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script
		src='${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.min.js'
		type="text/javascript"></script>
	<script
		src='${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js'
		type="text/javascript"></script>

</body>
<%@ include file="footer.jsp"%>

</html>