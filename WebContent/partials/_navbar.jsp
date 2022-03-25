<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<a class="navbar-brand" href="index.jsp">Santol Train Ticketing System</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
			<% if(session.getAttribute("authUser") != null) {%>
			<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
			<% } else {%>
				<li class="nav-item">
					<a class="nav-link" aria-current="page" href="login-register.jsp">Login/Register</a>
				</li>
			<% } %>
		</ul>
	</div>
</nav>