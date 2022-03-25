<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login/ Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="partials/_navbar.jsp"%>
	<main>
		<div class="container-fluid">
			<br> <br> <br>
			<section>
				<div class="row justify-content-center p-2">
					<div class="col-md-4 section2 border border-dark" id="myGroup">
						<%
						if (session.getAttribute("errorMessage") != null) {
						%>
						<div class="alert alert-danger" role="alert">
							<%=session.getAttribute("errorMessage").toString()%>
						</div>
						<%
						session.removeAttribute("errorMessage");
						}
						%>
			
						<div class="collapse" id="loginCollapse">
							<%
							if (session.getAttribute("successMessage") != null) {
							%>
							<div class="alert alert-success" role="alert">
								<%=session.getAttribute("successMessage").toString()%>
							</div>
							<%
							session.removeAttribute("successMessage");
							}
							%>
							<h2 class="mt-3 text-center">LOG IN</h2>
							<br>
							<form action="login" method="post">
								<div class="mb-3 row">
									<label for="inputEmail" class="col-sm-3 col-form-label">Username:
									</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="username">
									</div>
									<div class="invalid-feedback">Please enter a message in
										the textarea.</div>
								</div>
								<div class="mb-3 row">
									<label for="inputPassword" class="col-sm-3 col-form-label">Password:
									</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" name="password">
									</div>
								</div>
								<br> <input type="submit"
									class="btn btn-outline-secondary w-100" value="Submit" /> <br />
								<br />
							</form>
						</div>
						<div class="collapse" id="registerCollapse">
								<h2 class="mt-3 text-center">Register</h2>
								<br>

								<form action="register" method="post">
									<div class="mb-3 row">
										<label for="inputEmail" class="col-sm-3 col-form-label">First
											Name: </label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="firstname">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="inputEmail" class="col-sm-3 col-form-label">Last
											Name: </label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="lastname">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="inputEmail" class="col-sm-3 col-form-label">Role:</label>
										<div class="col-sm-9">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="role"
													value="student"> <label class="form-check-label"
													for="flexRadioDefault1"> Student </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="role"
													value="withDisability"> <label
													class="form-check-label" for="flexRadioDefault1">
													With Disabilities </label>
											</div>
										</div>
									</div>
									<div class="mb-3 row">
										<label for="inputEmail" class="col-sm-3 col-form-label">Username:
										</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="username">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="inputPassword" class="col-sm-3 col-form-label">Password:
										</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" name="password">
										</div>
									</div>
									<div class="mb-3 row">
										<label for="inputEmail" class="col-sm-3 col-form-label">Confirm
											Password: </label>
										<div class="col-sm-9">
											<input type="text" class="form-control"
												name="confirmPassword">
										</div>
									</div>
									<br> <input type="submit"
										class="btn btn-outline-secondary w-100" value="Register" /> <br />
									<br />
								</form>
							</div>
		
						<div class="">
							<center>
								<button class="btn btn-primary" type="button" onclick="showRegister()">Register</button>
								<button class="btn btn-primary" type="button" onclick="showLogin()">Login</button>
							</center>
						</div>

					</div>
				</div>
			</section>
		</div>
	</main>
	<br />
	<br />
	<br />
	<br />
	<br />
	<%@ include file="partials/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
		function showLogin() {
			document.getElementById('registerCollapse').style.display = 'none';
			document.getElementById('loginCollapse').style.display = 'block';
		}
		function showRegister() {
			document.getElementById('loginCollapse').style.display = 'none';
			document.getElementById('registerCollapse').style.display = 'block';
		}
	</script>
</body>
</html>