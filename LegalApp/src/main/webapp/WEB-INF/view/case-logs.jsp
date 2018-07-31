<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	
<!-- Include Editor style. -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.4/css/froala_editor.min.css' rel='stylesheet' type='text/css' />
<link href='//www.tinymce.com/css/codepen.min.css' rel='stylesheet' type='text/css' />	

<title>Case Logs</title>
</head>
<body>
	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>Welocme
			to Legal Managament System</center></span>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="home"><strong>LEGAL</strong> </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarText" aria-controls="navbarText"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="case">Cases</a></li>
			<li class="nav-item"><a class="nav-link" href="document">Documents</a></li>
			<li class="nav-item"><a class="nav-link" href="reminder">Reminder</a></li>
			<li class="nav-item"><a class="nav-link" href="lawyer">Lawyer</a></li>
			<li class="nav-item"><a class="nav-link" href="acts">Acts</a></li>
			<li class="nav-item active"><a class="nav-link" href="case-logs">Logs</a></li>
			<li class="nav-item"><a class="nav-link" href="user">Users</a></li>
		</ul>
		<span class="navbar-text"> <i class="fa fa-user-circle" style="font-size:1.2rem;color:#17a2b8">&nbsp; ${name}</i></span> &nbsp;&nbsp;&nbsp;
		 <a	href="" data-toggle="modal" data-target="#exampleModalCenter"><i
			class="fa fa-sign-out" style="font-size: 30px; color: red"></i></a>

	</div>
	</nav>




	<main class="main"> <!-- Breadcrumb-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
		<li class="breadcrumb-item"><a href="case-logs">View Case Logs</a></li>
		<li class="breadcrumb-item"><a href="add-logs">Add Case Logs</a></li>
		

	</ol>
	<div class="container-fluid">
		<div class="animated fadeIn">
			<c:choose>
				<c:when test="${mode == 'Case-Logs' }">
					<div class="card align-middle">
						<div class="card-header">
							<strong>Select case for which you want to view case Logs</strong>
						</div>
						<div class="card-body" >
						<form name="logcaseno" action="get-logs" method="POST">
							<div class="form-group">
								<select 
										class="form-control multiselect-ui form-control col-md-6"
													id="ccmonth" name="caseno">
                                                        <option>--SELECT--</option>
													<c:forEach var="title" items="${title }">
														<option>${title }</option>
													</c:forEach>
												</select>
							</div>

						
						<div class="card-footer" class="align-middle">
							<button type="submit" class="btn btn-sm btn-primary">
								<i class="fa fa-dot-circle-o"></i> View Logs
							</button>
							
						</div>
						</form>
						</div>
					</div>
					<br>
					<div class="table-responsive">
						<table id="example" class="table table-striped table-bordered"
							style="width: 100%">
							<caption>All Logs</caption>
							<thead class="thead-light">
								<tr style="text-align: center;">
									
									<th scope="col" width="10%">Date</th>
									<th scope="col" width="10%">Type</th>
									<th scope="col" width="15%">Sub Type</th>
									<th scope="col" width="65%">Brief Description about the
										Logs</th>
								
								</tr>
							</thead>

							<tbody>
								<c:forEach var="logs" items="${logs}">
									<tr>

										<td>${logs.date }</td>
										<td>${logs.type }</td>
										<td>${logs.specify}</td>
										<td>${logs.brief }</td>
										
									</tr>
								</c:forEach>

							</tbody>

							<tfoot>
								<tr style="text-align: center;">
									
									<th scope="col" width="10%">Date</th>
									<th scope="col" width="10%">Type</th>
									<th scope="col" width="15%">Sub Type</th>
									<th scope="col" width="65%">Brief Description about the
										Logs</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!--/.row-->
				</c:when>
				<c:when test="${mode == 'Add-logs'}">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
								<p>${msg }</p>
									<strong>Log Entries</strong> Details
								</div>
								<div class="card-body">
									<form action="save-logs" method="POST" class="form-horizontal">
										<div class="row">
										 <div class="col-sm-4">
											<label class="col-md-12 col-form-label" for="text-input">Log
												for case</label>
											<div class="col-md-12">
												<select 
													class="form-control multiselect-ui form-control"
													id="ccmonth" name="caseno" value="${logs.caseno }" style="overflow: scroll;">
                                                        <option>--SELECT--</option>
													<c:forEach var="title" items="${title }">
														<option>${title }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										 <div class="col-sm-2">
											<label class="col-md-12 col-form-label" for="text-input">Type
												Of Logs</label>
											<div class="col-md-12">
												<select class="form-control multiselect-ui form-control" id="ccyear" name="type"
													value="${logs.type }">
													<option>--SELECT--</option>
													<option>Critical Events</option>
													<option>Miscellanous</option>
													<option>Others</option>
													
												</select>
											</div>
										</div>
										<div class="col-sm-4">
											<label class="col-md-12 col-form-label" for="text-input">Specify
												Log Type</label>
											<div class="form-group col-sm-12">
												<input	type="text" class="form-control" id="specify" name="specify"
														value="${logs.specify }">
											</div>
										</div>
										<div class="col-sm-2">
											<label class="col-md-12 col-form-label" for="text-input">Date
												</label>
											<div class="form-group col-sm-12">
												<input	type="date" class="form-control"  name="date"
														value="${logs.date }">
											</div>
										</div>
										
										</div>
										 <br>


										<div class="form-group row">
											<label class="col-md-2 col-form-label" for="textarea-input">Brief about Log:
											</label>
											<div class="col-md-10">
												<textarea id="froala-editor"  name="brief" 
													class="form-control"												
													value="${logs.brief }"></textarea>
											</div>
										</div>

										


										<div class="card-footer">
											<button type="submit" class="btn btn-sm btn-primary"
												data-toggle="modal" data-target="#exampleModal">
												<i class="fa fa-dot-circle-o"></i> Submit
											</button>
											<button type="reset" class="btn btn-sm btn-danger">
												<i class="fa fa-ban"></i> Reset
											</button>
										</div>
									</form>
								</div>
							</div>
							<!--/.col-->
						</div>
						<!--/.row-->
						<!--/.row-->
						<!--/.row-->
						<!--/.row-->
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	</main>


	<br>

	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>
			&copy; 2018, DCM Textiles</center></span>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Logging
						Out!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to Logout?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
					<a href="logout">
						<button type="button" class="btn btn-primary">Yes</button>
					</a>
				</div>
			</div>
		</div>
	</div>

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
		<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
		
		<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	
	<!-- Include JS file. -->
<script type='text/javascript' src='https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=1ay4l6nnkq400z4l517qz00jo26utxa8lblww09mpoooteni'></script>
  
   <script>
   tinymce.init({
	   selector: 'textarea',
	   height: 500,
	   menubar: false,
	   plugins: [
	     'advlist autolink lists link image charmap print preview anchor textcolor',
	     'searchreplace visualblocks code fullscreen',
	     'insertdatetime media table contextmenu paste code help wordcount'
	   ],
	   toolbar: 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
	   content_css: [
	     '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	     '//www.tinymce.com/css/codepen.min.css']
	 });
</script>
</body>
</html>