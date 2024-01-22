<%@page import="org.unibl.etf.models.beans.AdvisorQuestionBean"%>
<%@page import="org.unibl.etf.models.dto.AdvisorQuestion"%>
<%@page import="org.unibl.etf.utils.ConnectionPool"%>
<%@page import="org.unibl.etf.models.beans.AdvisorBean"%>
<%@page import="org.unibl.etf.models.dto.Advisor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%!
public void jspInit() { 
		ConnectionPool.initPool(getServletContext());
}
%>
	
<%
String loginNotification = "";
String action = request.getParameter("action");
if ("login".equals(action)) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	AdvisorBean advisorBean = new AdvisorBean();
	if (advisorBean.login(username, password)) {
		session.setAttribute("advisorBean", advisorBean);
		AdvisorQuestionBean advisorQuestionBean=new AdvisorQuestionBean();
		session.setAttribute("advisorQuestionBean", advisorQuestionBean);
		response.sendRedirect("messages.jsp");

	} else
		loginNotification = "The user with the given username and password wasn't found!";
}
else if("logout".equals(action)){
	session.invalidate();
}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Online fitness advisor</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="style/login.css" />
<link rel="stylesheet" href="css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script src="js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="vh-100 gradient-custom ">
		<div class="container h-100">
			<div
				class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card  shadow-5  rounded-5">
						<div class="card-body p-md-5 pt-md-4">
							<div class="d-flex justify-content-center">
								<img src="images/adminIcon.jpg" class="img-fluid" height="128"
									width="128" />
							</div>
							<h1 class="fw-bold mt-2 mb-2 text-uppercase text-center">Login</h1>
							<p class="text-gray-50 text-center">Please enter your
								username and password!</p>
							<form class="mt-4 needs-validation" method="post"
								action="?action=login" novalidate>
								<div class="mb-4">
									<div class="form-floating">
										<input required type="text"
											class="form-control form-control-lg" id="typeEmailX"
											placeholder="name@example.com" name="username"> <label
											for="typeEmailX">Username</label>
										<div class="invalid-feedback">Please enter a username.</div>
									</div>
								</div>
								<div class="mb-3">
									<div class="form-floating">
										<input required type="password" name="password"
											class="form-control form-control-lg" id="typePasswordX"
											placeholder="Password"> <label for="typePasswordX">Password</label>
										<div class="invalid-feedback">Please enter a password.</div>
									</div>
								</div>
								<%
								if (!"".equals(loginNotification)) {
								%>
								<div class="alert alert-danger" role="alert"><%=loginNotification%></div>
								<%
								}
								%>
								<div
									class="d-grid <%=!"".equals(loginNotification) ? "mt-1" : "mt-5"%>">
									<button
										class="btn btn-primary btn-lg fw-bold fs-5 d-flex align-items-center justify-content-center gap-3"
										name="login" type="submit">
										<span> <img src="images/loginIcon.png"
											style="width: 24px; height: 24px" />
										</span> Login
									</button>
								</div>
							</form>
						</div>
					</div>
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

</html>