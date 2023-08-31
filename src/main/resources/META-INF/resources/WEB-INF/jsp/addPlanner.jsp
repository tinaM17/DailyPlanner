<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Import the necessary Java classes --%>
<%@ page import="java.time.LocalDate"%>
<html>
<head>
<title>Add Plan</title>
<link
	href='${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css'
	rel='stylesheet'>
</head>
<%@ include file="navbar.jsp"%>
</head>
<style>
.main {
	width: 100vw;
	min-height: calc(100vh - 100px); 
	margin-bottom:50px;
}

.custom-input {
	width: 300px;
	height: 40px;
	border: 2px solid green;
	padding: 5px;
	appearance: none;
	/* This is important to override default browser styles */
	-webkit-appearance: none;
	-moz-appearance: none;
	outline: none;
}

.table-caption {
	text-align: center;
	font-size: 18px;
	padding-bottom: 10px;
	margin-bottom: 0;
	color: white;
	background-color: #00a82d;
	color: white;
}

.icon {
	width: 20px;
	height: 20px;
	object-fit: cover;
}

.icon2 {
	width: 35px;
	height: 35px;
	object-fit: cover;
}

.progress-cell {
    text-align: center;
    vertical-align: middle;
}

.progress-circle {
    position: relative;
    display: inline-block;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background-color: #ddd;
    overflow: hidden;
}

.progress {
    position: absolute;
    width: 100%;
    height: 100%;
    clip: rect(0, 200px, 200px, 0);
    transform: rotate(0deg);
}

.progress-inner {
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: #00a82d;
    clip: rect(0, 200px, 200px, 0);
}

.progress-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 12px;
    color: #333;
}

.progress-text span {
    font-weight: bold;
}
</style>
<body>
	<div class='main'>
		<div class='container'
			style='display: flex; justify-content: center; flex-direction: column; align-items: center'>
			<div>
				<h1 style='margin-top: 30px; color: green;'>Your Daily Plans</h1>
			</div>
			<h4 style='margin-top: 20px; color: green;'>Select a date please
				to add & check your plans</h4>
			<div>
				<form method='get' action="addPlanner">
					<input class='custom-input' type="date" name="date" value=${date }>
					<input class='btn btn-success pt-2' type='submit' value='Check'>
				</form>
			</div>

			<div class='row'
				style='display: flex; justify-content: center; flex-direction: row;'>
				<c:choose>
					<c:when test="${not empty date}">
						<c:choose>
							<c:when test="${not empty tasks}">
								<!-- Display tasks here -->
								<h3 class="text-center table-caption">${date}</h3>
								<table class="table" style="margin-top: 0;">
									<thead style='background-color: #e8e7e3'>
										<tr>

											<th scope="col">Time</th>
											<th scope="col">Task Description</th>

											<th scope="col">Status</th>
											<th scope="col">Completed?</th>
											<th scope="col">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="task" items="${tasks}">
											<tr>

												<td>${task.time}</td>
												<td>${task.description }</td>

												<td><c:choose>
														<c:when test="${task.status}">
															<img alt="done" src="/images/done.png" class='icon2'>
														</c:when>
														<c:otherwise>
															<img alt="not done" src="/images/work-in-progress.png"
																class='icon2'>
														</c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${task.status}">

															<a
																href="/user/updateTaskStatus?taskId=${task.task_id}&date=${date}&status=false">
																<img alt="remove" src="/images/remove.png" class='icon'
																style='margin-left: 20px; width: 30px; height: 30px; object-fit: cover;'>
															</a>
														</c:when>
														<c:otherwise>
															<a
																href="/user/updateTaskStatus?taskId=${task.task_id}&date=${date}&status=true">
																<img alt="check" src="/images/check.png" class='icon'
																style='margin-left: 20px; width: 30px; height: 30px; object-fit: cover;'>
															</a>
														</c:otherwise>
													</c:choose></td>
												<td><a class="btn"
													href="editPlan?task_id=${task.task_id}&date=${date }">
														<img alt="edit" src="/images/edit.png" class='icon'>
												</a> <a class="btn"
													href="deletePlan?id=${task.task_id}&date=${date }"> <img
														alt="edit" src="/images/delete.png" class='icon'></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
								<h3 class='text-center'>Productivity Rate</h3>
								<div class="productivity-circle d-flex justify-content-center">
									<div class="progress-circle">
										<div class="progress">
											<div class="progress-inner"
												style="width: ${completedPercentage}%"></div>
										</div>
										<div class="progress-text">
											<span>${completedTasks} / ${totalTasks}</span>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>

								<img src="/images/nodata.jpg" alt="No Data found"
									style='width: 300px; height: 300px; object-fit: cover;'>
								<p class='text-center'>No tasks are present for this specific date</p>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty previous }">
								<a class="btn btn-danger" href="createPlan?date=${date}"
									style='width: 30%; margin-top:10px;'>Add Plan</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<!-- Handle the case when date is not present -->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script
		src='${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js'
		type="text/javascript"></script>
	<script
		src='${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.min.js'
		type="text/javascript"></script>

</body>
<%@ include file="footer.jsp"%>
</html>