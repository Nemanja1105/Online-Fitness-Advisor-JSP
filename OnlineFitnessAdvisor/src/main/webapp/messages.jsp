<%@page import="org.unibl.etf.models.beans.Notification"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.unibl.etf.models.dto.AdvisorQuestion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="advisorBean"
	class="org.unibl.etf.models.beans.AdvisorBean" scope="session"></jsp:useBean>
	<jsp:useBean id="advisorQuestionBean" class="org.unibl.etf.models.beans.AdvisorQuestionBean" scope="session"></jsp:useBean>
<%
SimpleDateFormat formatter=new SimpleDateFormat("dd.MM.yyyy");
if (advisorBean == null || !advisorBean.isLoggedIn())
	response.sendRedirect("login.jsp");
String action=request.getParameter("action");
session.setAttribute("notification", null);
boolean collapse=false;
Long id=-1L;
if(action!=null && "search".equals(action)){
	String term=request.getParameter("term");
	if(!term.isBlank())
	{
		advisorQuestionBean.search(term);
	}
	else
		advisorQuestionBean.findAll();
}
else
{
	if("read".equals(action)){
		try{
			id=Long.parseLong(request.getParameter("id"));
			advisorQuestionBean.markAsRead(id);
			collapse=true;
			session.setAttribute("notification", new Notification("Message successfully viewed",true));
		}
		catch(Exception e){
			
		}
	}
	advisorQuestionBean.findAll();
}
%>
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
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="pageContent">
		<div class="d-flex align-items-center gap-2  w-100 ">
			<span class="fw-bold font-italic m-0 title">Messages</span> <img
				src="images/chatIcon64.png" style="width: 48px; height: 48px;">
		</div>
		<div class=container>
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8">
				<form method="post" action="?action=search">
					<label for="searchInput" class="fw-semibold">Search message</label>
					<div class="input-group mb-3">
						<input value="<%="search".equals(action)?request.getParameter("term"):"" %>" type="text" class="form-control" id="searchInput" name="term"
							placeholder="Enter search text"
							>
						<button class="btn btn-primary fw-semibold textImageCenter" type="submit"
							id="button-addon2">Search <img src="images/searchIcon.png"/></button>
					</div>
					</form>
				</div>
				<hr/>
			</div>
			<div class="row gy-3">
			<% for(int i=0;i<advisorQuestionBean.getAdvisorQuestions().size();i++) {
				AdvisorQuestion tmp=advisorQuestionBean.getAdvisorQuestions().get(i);
			%>
				<div class="card rounded-4 border-3 <%=!tmp.isSeen()?"border-primary":""%>">
					<div class="card-body">
						<div class="d-flex  justify-content-between">
							<div class="d-flex flex-column flex-md-row gap-3 align-items-center">

								<img src="images/profileIcon.png"
									style="height: 40px; width: 40px;" alt="Avatar"
									class="img-fluid rounded-circle">
								<div class="fs-5 fw-semibold"><%=tmp.getClientName() %> <%=tmp.getClientSurname() %></div>
								<div>
									<span class="badge text-bg-danger fw-semibold fs-6 p-2"><%=tmp.getFitnessProgramName() %></span>
								</div>
								<div class="text-secondary fw-semibold"><%=formatter.format(tmp.getCreatedAt()) %></div>

							</div>

							<div>
							 
								<a  <%=tmp.isSeen()?"data-bs-toggle=\"collapse\"":"" %> href="<%=tmp.isSeen()?"#messase"+tmp.getId():"messages.jsp?action=read&id="+tmp.getId() %>"
									
									class="btn btn-outline-primary fw-semibold textImageCenter">
									Read <img src="images/downIcon.png"
										style="width: 24px; height: 24px;" />
								</a>
							</div>
						</div>
						<div class="collapse <%=id==tmp.getId()&&collapse?"show":"" %> mt-2" id="messase<%=tmp.getId()%>">
						<%=tmp.getMessage() %>
						<div class="d-flex justify-content-center">
						<a class="btn btn-outline-warning fw-semibold textImageCenter mt-2">Reply<img src="images/replyIcon.png"/></a>
						</div>
						</div>



					</div>
				</div>
				<%} %>
			</div>
		</div>

	</div>
	<jsp:include page="Notification.jsp"></jsp:include>
</body>
</html>