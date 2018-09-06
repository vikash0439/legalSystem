<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

<title>Lawyers </title>
</head>
<body>
	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>Welocme to Legal Managament System</center></span>
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
			<li class="nav-item active"><a class="nav-link" href="lawyer">Lawyer</a></li>
			<li class="nav-item"><a class="nav-link" href="case-logs">Logs</a></li>
			<li class="nav-item"><a class="nav-link" href="acts">Acts</a></li>
			<li class="nav-item"><a class="nav-link" href="user">Users</a></li>
			<li class="nav-item"><a class="nav-link" href="updates">Updates</a></li>
		</ul>
		<span class="navbar-text"> <i class="fa fa-user-circle" style="font-size:1.2rem;color:#17a2b8">&nbsp; ${name}</i></span> &nbsp;&nbsp;&nbsp;
		 <a href="" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-sign-out" style="font-size:30px;color:red" ></i></a>

	</div>
	</nav>

	<main class="main"> <!-- Breadcrumb-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
		<li class="breadcrumb-item"><a href="lawyer">All Lawyer</a></li>
		<li class="breadcrumb-item"><a href="newlawyer">Add New</a></li>
        <%@ page import="java.text.*,java.util.*" %>
           <div align="right" style="margin-left:60%;font-weight: bold; color:  #343a40;"">
             <% SimpleDateFormat d=new SimpleDateFormat("dd-MM-yyyy"); %>
             <% SimpleDateFormat t=new SimpleDateFormat(" HH:mm aa"); %>
           Date:  <%= d.format(new Date()) %> &nbsp;&nbsp;Time: <%= t.format(new Date()) %>
        </div>
	</ol>
	<div class="container-fluid">
		<div class="animated fadeIn">
		
		<c:choose>
		<c:when test="${ mode == 'All_Lawyer'}">
		<div class="row">
				<div class="col-lg-12">
					<div class="">
						
                      <div  class="table-responsive">
						<table id="example" class="table">
						<caption>All Lawyers</caption>
							<thead>
								<tr>
									
									<th scope="col">Lawyer's Name</th>
									<th scope="col">State</th>
									<th scope="col">Contact No.</th>
									<th scope="col">Email-ID</th>
									<th scope="col">Clerk's Name & Contact No.</th>
									<th scope="col">Junior's Name & Contact No.</th>	
									<security:authorize access="hasAnyRole('ADMIN')"><th scope="col">Edit</th>	 </security:authorize>							
								</tr>
							</thead>
							<c:forEach var="lawyer" items="${lawyer }">
								<tbody>
									<tr>									
										<td><a href="${pageContext.request.contextPath}/viewlawyer?lawyerid=${lawyer.lawyerid }">${lawyer.name }</a></td>
										<td>${lawyer.state }</td>
										<td>${lawyer.phone }</td>
										<td>${lawyer.email }</td>
										<td>${lawyer.cname }  &  ${lawyer.cphone }</td>
										<td>${lawyer.jname }  &  ${lawyer.jphone }</td>
										<security:authorize access="hasAnyRole('ADMIN')"><td><a class="fa fa-edit" href="${pageContext.request.contextPath}/edit-lawyer?lawyerid=${lawyer.lawyerid }"></a></td></security:authorize>
									</tr>
								</tbody>
							</c:forEach>
							<tfoot>
								<tr>
									
									<th scope="col">Lawyer's Name</th>
									<th scope="col">State</th>
									<th scope="col">Contact No.</th>
									<th scope="col">Email-ID</th>
									<th scope="col">Clerk's Name & Contact No.</th>
									<th scope="col">Junior's Name & Contact No.</th>
									<security:authorize access="hasAnyRole('ADMIN')"><th scope="col">Edit</th>	 </security:authorize>							
								</tr>
							</tfoot>
						</table>
                       </div>
					</div>
				</div>

			</div>
		</c:when>
				<c:when test="${mode == 'Add_Lawyer' }">
					<form action="save-lawyer" method="POST">
						<!--/.row-->
						<div class="row">
							<div class="col-sm-6">
								<div class="card">
									<div class="card-header">
										<strong>Assign lawyer</strong> <small>Form</small>
									</div>
									<input
												type="hidden" class="form-control" id="lawyerid" name="lawyerid"
												
												value="${lawyer.lawyerid }">
									<div class="card-body">
										<div class="form-group">
											<label for="company">Name of Lawyer</label> <input
												type="text" class="form-control" id="name" name="name"
												placeholder="Enter name of the Lawyer"
												value="${lawyer.name }">
										</div>
										<div class="form-group">
											<label for="vat">Address</label> <input type="text"
												class="form-control" id="address"
												placeholder="H.No/Flat No/Building No" name="address"
												value="${lawyer.address }">
										</div>
										<div class="form-group">
											<label for="street"></label> <input type="text"
												class="form-control" id="line2" placeholder="Area/Locality"
												name="line2" value="${lawyer.line2 }">
										</div>
										<div class="row">
											<div class="form-group col-sm-6">
												<label for="city"></label> <input type="text"
													class="form-control" id="city" placeholder="Enter city"
													name="city" value="${lawyer.city }">
											</div>
											<div class="form-group col-sm-6">
												<label for="state"></label> <input type="text"
													class="form-control" id="state" placeholder="Enter State"
													name="state" value="${lawyer.state }">
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="form-group col-sm-8">
												<label for="country"></label> <input type="text"
													class="form-control" id="country"
													placeholder="Country name" name="country"
													value="${lawyer.country }">
											</div>
											<div class="form-group col-sm-4">
												<label for="postal-code"></label> <input type="text"
													class="form-control" id="pin"
													placeholder="Postal Code" name="pin" value="${lawyer.pin }">
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Contact No.</label> <input
														type="text" class="form-control" id="phone"
														placeholder="Eg: 99999999" name="phone"
														value="${lawyer.phone }">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Email-ID</label> <input type="text"
														class="form-control" id="email"
														placeholder="Eg: abcdef@ghiljkl.com" name="email"
														value="${lawyer.email }">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-sm-6">
								<div class="card">
									<div class="card-header">Add Junior Form</div>
									<div class="card-body">

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"></i>
													</span>
												</div>
												<input type="text" id="jname" class="form-control"
													name="jname" placeholder="Junior's Name" value="${lawyer.jname }">

											</div>
										</div>

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-phone"></i>
													</span>
												</div>
												<input type="tel" id="jphone" class="form-control"
													name="jphone" placeholder="Junior's Phone" value="${lawyer.jphone }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-envelope"></i>
													</span>
												</div>
												<input type="email" id="jemail" class="form-control"
													name="jemail" placeholder="Junior's Email" value="${lawyer.jemail }">
												<div class="input-group-append"></div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="card">
									<div class="card-header">Clerk Form</div>
									<div class="card-body">

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"></i>
													</span>
												</div>
												<input type="text" id="cname" class="form-control"
													name="cname" placeholder="Clerk's Name" value="${lawyer.cname }">
											</div>
										</div>

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-phone"></i>
													</span>
												</div>
												<input type="tel" id="cphone" class="form-control"
													name="cphone" placeholder="Clerk's Phone" value="${lawyer.cphone }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-envelope"></i>
													</span>
												</div>
												<input type="email" id="cemail" class="form-control"
													name="cemail" placeholder="Clerk's Email" value="${lawyer.cemail }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="card-footer">
											<button type="submit" class="btn btn-sm btn-primary">
												<i class="fa fa-dot-circle-o"></i> Submit
											</button>
											<button type="reset" class="btn btn-sm btn-danger">
												<i class="fa fa-ban"></i> Reset
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!--/.row-->
				</c:when>
				
				<c:when test="${mode == 'Edit_Lawyer' }">
					<form action="save-lawyer" method="POST">
						<!--/.row-->
						<div class="row">
							<div class="col-sm-6">
								<div class="card">
									<div class="card-header">
										<strong>Assign lawyer</strong> <small>Form</small>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label for="company">Name of Lawyer</label> <input
												type="text" class="form-control" id="name" name="name"
												placeholder="Enter name of the Lawyer"
												value="${lawyer.name }">
										</div>
										<div class="form-group">
											<label for="vat">Address</label> <input type="text"
												class="form-control" id="address"
												placeholder="H.No/Flat No/Building No" name="address"
												value="${lawyer.address }">
										</div>
										<div class="form-group">
											<label for="street"></label> <input type="text"
												class="form-control" id="line2" placeholder="Area/Locality"
												name="line2" value="${lawyer.line2 }">
										</div>
										<div class="row">
											<div class="form-group col-sm-6">
												<label for="city"></label> <input type="text"
													class="form-control" id="city" placeholder="Enter city"
													name="city" value="${lawyer.city }">
											</div>
											<div class="form-group col-sm-6">
												<label for="state"></label> <input type="text"
													class="form-control" id="state" placeholder="Enter State"
													name="state" value="${lawyer.state }">
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="form-group col-sm-8">
												<label for="country"></label> <input type="text"
													class="form-control" id="country"
													placeholder="Country name" name="country"
													value="${lawyer.country }">
											</div>
											<div class="form-group col-sm-4">
												<label for="postal-code"></label> <input type="text"
													class="form-control" id="pin"
													placeholder="Postal Code" name="pin" value="${lawyer.pin }">
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Contact No.</label> <input
														type="text" class="form-control" id="phone"
														placeholder="Eg: 99999999" name="phone"
														value="${lawyer.phone }">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Email-ID</label> <input type="text"
														class="form-control" id="email"
														placeholder="Eg: abcdef@ghiljkl.com" name="email"
														value="${lawyer.email }">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-sm-6">
								<div class="card">
									<div class="card-header">Add Junior Form</div>
									<div class="card-body">

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"></i>
													</span>
												</div>
												<input type="text" id="jname" class="form-control"
													name="jname" placeholder="Junior's Name" value="${lawyer.jname }">

											</div>
										</div>

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-phone"></i>
													</span>
												</div>
												<input type="tel" id="jphone" class="form-control"
													name="jphone" placeholder="Junior's Phone" value="${lawyer.jphone }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-envelope"></i>
													</span>
												</div>
												<input type="email" id="jemail" class="form-control"
													name="jemail" placeholder="Junior's Email" value="${lawyer.jemail }">
												<div class="input-group-append"></div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="card">
									<div class="card-header">Clerk Form</div>
									<div class="card-body">

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-user"></i>
													</span>
												</div>
												<input type="text" id="cname" class="form-control"
													name="cname" placeholder="Clerk's Name" value="${lawyer.cname }">

											</div>
										</div>

										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-phone"></i>
													</span>
												</div>
												<input type="tel" id="cphone" class="form-control"
													name="cphone" placeholder="Clerk's Phone" value="${lawyer.cphone }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="fa fa-envelope"></i>
													</span>
												</div>
												<input type="email" id="cemail" class="form-control"
													name="cemail" placeholder="Clerk's Email" value="${lawyer.cemail }">
												<div class="input-group-append"></div>
											</div>
										</div>
										<div class="card-footer">
											<button type="submit" class="btn btn-sm btn-primary">
												<i class="fa fa-dot-circle-o"></i> Submit
											</button>
											<button type="reset" class="btn btn-sm btn-danger">
												<i class="fa fa-ban"></i> Reset
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!--/.row-->
				</c:when>

				<c:when test="${mode == 'View_Lawyer' }">

					<!--/.row-->
					<div class="row">
						<div class="col-sm-6">
							<div class="card">
								<div class="card-header">
									<strong>Lawyer's Detail</strong>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="company"><b>Lawyers's Name:</b> &nbsp;
											${lawyer.name}
											</p></label>
									</div>
									<div class="form-group">
										<label for="vat"><b>Address:</b> &nbsp;
											${lawyer.address }<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
											&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${lawyer.line2 }<br>&nbsp;
											&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
											&nbsp;&nbsp; &nbsp;${lawyer.city } &nbsp; &nbsp;
											${lawyer.state }<br>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
											&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${lawyer.country }
											&nbsp;&nbsp;<b>PIN:</b> ${lawyer.pin }</label>
									</div>

									<!--/.row-->
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="ccnumber"><b>Contact No: </b> &nbsp;
													${lawyer.phone }</label>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label for="ccnumber"><b>Email-ID: </b> &nbsp;
													${lawyer.email }</label>
											</div>
										</div>
									</div>
<!-- 									<div class="form-group"> -->
<!-- 										<label for="vat"><b>All-Cases:</b> &nbsp; -->
<%-- 											${lawyer.cases }</label> --%>
<!-- 									</div> -->
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="card">
								<div class="card-header">Junior's Detail</div>
								<div class="card-body">

									<div class="form-group">
										<label for="company"><b>Juniors' Name:</b> &nbsp;
											${lawyer.jname}
											</p></label>
									</div>

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ccnumber"><b>Contact No.</b> &nbsp;
													${lawyer.jphone }</label>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ccnumber"><b>Email-ID</b> &nbsp;
													${lawyer.jemail }</label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">Clerk's Detail</div>
								<div class="card-body">

									<div class="form-group">
										<label for="company"><b>Clerks' Name:</b> &nbsp;
											${lawyer.cname}
											</p></label>

									</div>

									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ccnumber"><b>Contact No.</b> &nbsp;
													${lawyer.cphone }</label>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ccnumber"><b>Email-ID</b> &nbsp;
													${lawyer.cemail }</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="card">
						 <div class="card-header"><center>All Cases</center></div>
						  <div class="card-body">						   
						  <c:forEach var="caseno" items="${lawyer.cases }">
						  <div class="form-group">
										<label for="company"> Case No: &nbsp;
										<a target="_blank" href="${pageContext.request.contextPath}/view-cases?caseno=${caseno}">${caseno }</a>
											</label>
									</div>
						  
						 </c:forEach>
						</div>
					</div>
					<!--/.row-->
				</c:when>
			</c:choose>

			
		</div>
		<!--/.col-->

	</div>
	</div>
	<!--/.row--> <!--/.row-->
	</div>

	</div>
	</main>
	<br>


	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>
			&copy; 2018, DCM Textiles</center></span>
		<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logging Out!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to Logout?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
       <a href="logout"> <button type="button" class="btn btn-primary">Yes</button></a>
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

</body>
</html>