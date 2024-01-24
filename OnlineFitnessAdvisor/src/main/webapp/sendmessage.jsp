<%@page import="org.unibl.etf.models.beans.AdvisorQuestionBean"%>
<%@page import="org.unibl.etf.models.beans.AdvisorBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="advisorBean"
	class="org.unibl.etf.models.beans.AdvisorBean" scope="session"></jsp:useBean>
<jsp:useBean id="advisorQuestionBean"
	class="org.unibl.etf.models.beans.AdvisorQuestionBean" scope="session"></jsp:useBean>
<%
if (advisorBean == null || !advisorBean.isLoggedIn())
	response.sendRedirect("login.jsp");
session.setAttribute("notification", null);
try {
	advisorQuestionBean.setSelected(null);
	Long id = Long.parseLong(request.getParameter("id"));
	advisorQuestionBean.findById(id);
	if (advisorQuestionBean.getSelected() == null)
		response.sendRedirect("messages.jsp");
} catch (Exception e) {
	response.sendRedirect("messages.jsp");
}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Online fitness advisor</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet" href="style/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<script src="js/email.js"></script>
</head>


<body>
	<jsp:include page="WEB-INF/navbar.jsp"></jsp:include>
	<div class="pageContent">
		<div class="d-flex justify-content-center gap-2  w-100 ">
			<span class="fw-bold font-italic m-0 title">New email</span> <img
				src="images/chatIcon64.png" style="width: 48px; height: 48px;">
		</div>
		<div class="container h-100 mt-2">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-7 card  shadow-5  rounded-5">
					<div class="card-body">
						<form id="emailForm" method="post" action="javascript:sendEmail()"
							class="needs-validation" novalidate>
							<div>
								<label for="nameLabel" class="fw-semibold">Client</label>
								<div class="input-group">
									<span class="input-group-text" id="addon-wrapping"><img
										src="images/emailIcon.png" /></span> <input readonly
										value="<%=advisorQuestionBean.getSelected().getClientEmail()%>"
										type="text" class="form-control " id="nameLabel" name="client" />
								</div>
							</div>
							<div class=mt-2>
								<label for="nameLabel" class="fw-semibold">Subject</label>
								<div class="input-group">
									<span class="input-group-text" id="addon-wrapping"><img
										src="images/searchIcon2.png" /></span> <input
										placeholder="Enter subject" type="text" class="form-control "
										id="nameLabel" name="subject" />
								</div>
							</div>
							<div class="mt-2">
								<label for="descriptionInput" class="fw-semibold">Message</label>
								<div class="input-group">
									<span class="input-group-text" id="addon-wrapping"><img
										src="images/descriptionIcon.jpeg" /></span>
									<textarea required class="form-control" id="descriptionInput"
										placeholder="Enter text message" name="messageSrc"></textarea>
									<div class="invalid-feedback">Please enter a email text.</div>
								</div>

							</div>
							<div class="mt-2 col-12 col-md-5">
								<label for="formFile" class="form-label fw-semibold">Attachment</label>
								<input class="form-control" type="file" id="formFile">
							</div>
							<div class="mt-4 d-flex justify-content-center">
								<button type="submit"
									class="btn btn-success fw-semibold fs-6 textImageCenter">
									Send email <img src="images/sendMessageIcon.jpeg" />
								</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
		<script>
							(() => {
								const forms = document.querySelectorAll('.needs-validation')
								Array.from(forms).forEach(form => {
									form.addEventListener('submit', event => {
										if (!form.checkValidity()) {
											event.preventDefault()
											event.stopPropagation()
										}

										form.classList.add('was-validated')
									}, false)
								})
							})()
						</script>
</body>
<jsp:include page="WEB-INF/Notification.jsp"></jsp:include>

</html>