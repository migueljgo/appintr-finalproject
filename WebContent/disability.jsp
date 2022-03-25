<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.benilde.finalproject.Model.UserBean"
%>
<%
 	UserBean authUser = (UserBean) session.getAttribute("authUser");
	if (authUser == null) {
		response.sendRedirect("login.jsp");
		return;
	} 
%> 
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
	<%@ include file="partials/_navbar.jsp"%>
	<br/>
	<main class="text-center">
		<h1>Disability</h1>
		
		
		<%
			UserBean user = (UserBean) session.getAttribute("authUser");
		%> 
		
		Hi, <%= user.getUsername() %>
	</main>
	<br />
	<br />

	<%@ include file="partials/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>