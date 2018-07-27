<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
@media screen and (max-width: 600px) {
	#best, #ver {
		display: none;
	}
}
</style>

<title>Login</title>
</head>
<body class="app flex-row align-items-center">

	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>Welocme
			to Legal Management System</center></span>
	<nav class="navbar navbar-dark bg-primary">
		<a class="navbar-brand" href="#"> <marquee>This Software
				is a comprehensive legal case management application featuring all
				the essential elements of a quality Law Practice Management
				Solution.</marquee>
		</a>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card-group">
					<div class="card p-4">
						<div class="card-body">
							<h1>Login</h1>
							<p></p>
							<form class="form-horizontal" name='f' action="login"
								method='POST'>
								<c:if test="${not empty error}">
									<div class="alert alert-danger">${error}</div>
								</c:if>
								<c:if test="${not empty msg}">
									<div class="alert alert-warning">${msg}</div>
								</c:if>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"
											style="font-size: 24px"></i>
										</span>
									</div>
									<input type="text" class="form-control" placeholder="Username"
										name='username' value=''>
								</div>
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-lock"
											style="font-size: 24px"></i>
										</span>
									</div>
									<input type="password" class="form-control"
										placeholder="Password" name="password">
								</div>
								<div class="row">
									<div class="col-6">
										<button type="submit" class="btn btn-primary px-4">Login</button>
									</div>

									<div class="col-6 text-right">
										
											<label for="remember"> Remember me</label> 
											<input type="checkbox" name="remember" />
										
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="card text-white bg-primary py-5 d-md-down-none">
						<div class="card-body text-center">
							<div>
								<h2>Legal App</h2>
								<p>You can collect your <br>credentials from the System Department to get access.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br><br><br>
	
	

	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><i id="best" style="color: #ff0000;">&nbsp;&nbsp;&nbsp; * Best Viewed in Google Chrome</i>
		<p style="display: inline; margin: 0 20% 0 30%;">&copy; 2018, DCM Textiles</p> 
		<i id="ver" style="color: #ff0000; float: right;">Ver 1.0.0&nbsp;&nbsp;&nbsp;</i></span>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>

</body>
</html>