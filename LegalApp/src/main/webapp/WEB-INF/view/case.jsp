<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.text.*,java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<title>Cases</title>
</head>
<body>
	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center>Welcome
			to Legal Managament System</center></span>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="home"><strong>LEGAL</strong></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarText" aria-controls="navbarText"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="case">Cases</a></li>
			<li class="nav-item"><a class="nav-link" href="document">Documents</a></li>
			<li class="nav-item"><a class="nav-link" href="reminder">Reminder</a></li>
			<li class="nav-item"><a class="nav-link" href="lawyer">Lawyer</a></li>
			<li class="nav-item"><a class="nav-link" href="case-logs">Logs</a></li>
			<li class="nav-item"><a class="nav-link" href="acts">Acts</a></li>
			<li class="nav-item"><a class="nav-link" href="user">Users</a></li>
			<li class="nav-item"><a class="nav-link" href="updates">Updates</a></li>
		</ul>
		<span class="navbar-text"> <i class="fa fa-user-circle"
			style="font-size: 1.2rem; color: #17a2b8">&nbsp; <a href="viewuser?name=${name }">${name}</a></i></span>
		&nbsp;&nbsp;&nbsp; <a href="" data-toggle="modal"
			data-target="#exampleModalCenter"><i class="fa fa-sign-out"
			style="font-size: 30px; color: red"></i></a>
	</div>
	</nav>

	<main class="main"> <!--          Breadcrumb -->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
		<li class="breadcrumb-item"><a href="case">All Cases</a></li>
		<li class="breadcrumb-item"><a href="newcase">Add New</a></li>
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
				<c:when test="${mode == 'All_Cases' }">
					<div class="dataTables">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered"
								style="width: 100%">

								<thead>
									<tr>
										<th>#Id</th>
										<th>Cateogry</th>
										<th>Court</th>
										<th>Case No</th>
										<th>Title</th>
										<th>Description</th>
										<th>Lawyer</th>
										<th>Last Date of Hearing</th>
										<th>Next Date of Hearing</th>
										<th>Current Status</th>
										<th>File No</th>		
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="cases" items="${ cases}">
										<tr>
											<td>${cases.id }</td>
											<td>${cases.cateogry }</td>
											<td>${cases.state }</td>
											<td><a href="${pageContext.request.contextPath}/view-cases?caseno=${cases.caseno }">${cases.caseno }</a></td>
											
											
											<td>${cases.title }	</td>
											<td>${cases.description }</td>
											<td><a
												href="${pageContext.request.contextPath}/viewlawyer?lawyerid=${cases.lawyer.lawyerid }"
												target="_blank">${cases.lawyer.name } </a></td>
											
											<td>${cases.updatecase.lasthearing }</td>
											<td>${cases.updatecase.nexthearing }</td>
											
											<td>${cases.updatecase.status }</td>
											<td>${cases.fileno }</td>
										</tr>

									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th>#Id</th>
										<th>Cateogry</th>
										<th>Court</th>
										<th>Case No</th>
										<th>Title</th>
										<th>Description</th>
										<th>Lawyer</th>
										<th>Last Date of Hearing</th>
										<th>Next Date of Hearing</th>
										<th>Current Status</th>
										<th>File No</th>		
										
									</tr>
								</tfoot>

							</table>
						</div>
					</div>
				</c:when>
				<c:when test="${ mode == 'Add_Cases'}">
					<form action="case-submit" method="POST" class="form-horizontal">
						<div class="row">
							<div class="col-sm-6">
								<div class="card">
									<div class="card-header">
										<strong>Case Detail</strong>
									</div>
									<div class="card-body">

										<!--/.row-->
										<div class="row">
										    <div class="col-sm-6">
														<label for="ccmonth">Case Cateogry</label> <select
															class="form-control" id="ccmonth" name="cateogry"
															value="${c.cateogry }">
															<option>--SELECT--</option>
															<option>A</option>
															<option>B</option>
															<option>C</option>
															<option>D</option>

														</select>
													</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Case Number</label> <input
														type="text" class="form-control" id="caseno"
														name="caseno" placeholder="Eg: ABC-00-2018
														value="${c.caseno }">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">File No.</label> <input type="text"
														class="form-control" id="fileno"
														placeholder="Eg: DCM-2015" name="fileno"
														value="${ c.fileno}">
												</div>
											</div>
										</div>
										<div class="row">

											<div class="col-sm-6">
												<div class="form-group">
													<label for="date">Date of Institution</label> <input
														type="text" class="form-control" id="ccnumber" placeholder="DD-MM-YYYY"
														name="dateinstitution" value="${c.dateinstitution }">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="time">Date of Summon </label> <input
														type="text" class="form-control" id="ccnumber" placeholder="DD-MM-YYYY"
														name="datesummon" value="${c.datesummon }">
												</div>
											</div>

										</div>


										<!--/.row-->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Case Title</label> <input type="text"
														class="form-control" id="title"
														placeholder="Plaintiff VS Defendent"
														name="title" value="${c.title }">

												</div>
											</div>
<!-- 											<div class="col-sm-6"> -->
<!-- 												<div class="form-group "> -->
<!-- 													<label for="ccnumber"><strong>VS</strong></label> <input -->
<!-- 														type="text" class="form-control" id="ccnumber" -->
<!-- 														placeholder="Defenders/ Replicatnt/ Non-Applicant" -->
<%-- 														name="versus" value="${c.versus }"> --%>
<!-- 												</div> -->
<!-- 											</div> -->
										</div>

										<!--/.row-->


										<!--/.row-->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Case Description</label>
													<textarea id="textarea-input" rows="6" class="form-control"
														placeholder="Brief Facts of the Case" name="description"
														value="${c.description}"></textarea>
												</div>
											</div>
										</div>

										<!--/.row-->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Details of Caveat</label> <input
														type="text" class="form-control" id="ccnumber"
														placeholder="Date of Caveat, if any" name="cavet"
														value="${updatecase.cavet }">
												</div>
											</div>
										</div>


										<!--/.row-->
										<div class="row">
											<div class="form-group col-sm-6">
												<label for="ccmonth">Connected Cases, if any<span style="color:  red; font-weight:  bolder;">*</span></label> <select
													multiple="multiple"
													class="form-control multiselect-ui form-control"
													id="ccmonth" name="connected" value="${c.connected }">

													<c:forEach var="title" items="${title }">
														<option>${title }</option>
													</c:forEach>
												</select>
											</div>

											<div class="form-group col-sm-6">
												<label for="ccmonth">Acts Applicable, if any<span style="color:  red; font-weight:  bolder;">*</span></label>
<!-- 												 <select -->
<!-- 													multiple="multiple" -->
<!-- 													class="form-control multiselect-ui form-control" -->
<%-- 													id="ccmonth" name="act" value="${c.act }"> --%>

<%-- 													<c:forEach var="section" items="${section }"> --%>
<%-- 														<option>${section }</option> --%>
<%-- 													</c:forEach> --%>
<!-- 												</select> -->
                                                  <textarea id="textarea-input"
														rows="4" class="form-control"
														placeholder="Enter acts applicable to this case.... "
														name="act" value="${c.act }"></textarea>
											</div>

										</div>
                                       <p style="color:  #dc3545;">  <span style="color:  red; font-weight:  bolder;">*</span>Click [CTRL + VALUE] to select multiple value</p>

										<!--/.row-->
									</div>
								</div>
								<br>
								<div class="card">
									<div class="card-header">
										<strong>Court</strong> Details
									</div>
									<div class="card-body">



										<div class="form-group">
											<label for="court">Judge Name</label> <input type="text"
												class="form-control" id="judgename"
												placeholder="Enter Judge Name" name="judgename"
												value="${c.judgename }">
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="date">Designation</label> <input type="text"
														class="form-control" id="designation" name="designation"
														placeholder="Enter Judge's designation"
														value="${c.designation }">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="time">Court </label> <input type="text"
														class="form-control" id="state" name="state"
														placeholder="Enter the court "
														value="${c.state }">
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
							</div>

							<!--/.col-->
							<div class="col-sm-6">

								<div class="card">
									<div class="card-header">
										<strong>Assign lawyer</strong>
									</div>
									<div class="card-body">
										<div class="form-group">
											<label for="company">Name<span style="color:  red; font-weight:  bolder;">*</span></label> <select
												class="form-control multiselect-ui form-control"
												id="ccmonth" name="advocate">
												<option>--SELECT--</option>
												<c:forEach var="l" items="${l}">
													<option>${l}</option>
												</c:forEach>
											</select>


										</div>
                                       <p style="color:  #dc3545;">  <span style="color:  red; font-weight:  bolder;">*</span>Select the lawyer from the dropdown, if not found kindly add lawyer from the menu.</p>

									</div>
								</div>

								<br>
								<div class="card">
									<div class="card-header">

										<strong>Payment Details</strong>

									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="ccnumber">Total Fees<span style="color:  red; font-weight:  bolder;">*</span></label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fa fa-inr"></i></span>
														</div>
														<input type="number" class="form-control" id="total"
															name="total"
															value="0">
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="ccnumber">Fee Paid<span style="color:  red; font-weight:  bolder;">*</span></label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fa fa-inr"></i></span>
														</div>
														<input type="number" class="form-control" id="paid"
															name="paid" value="0">
													</div>
												</div>
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="form-group col-sm-6">
												<label for="ccmonth">Payment of Fees type</label> <select
													class="form-control" id="ccmonth" name="type"
													value="${payment.type }">
													<option>--SELECT--</option>
													<option>Lumpsum</option>
													<option>Partially</option>
													<option>Per Apperance</option>
												</select>
											</div>
											<div class="form-group col-sm-6">
												<label for="ccnumber">Balance Left</label>
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="fa fa-inr"></i></span>
													</div>
													<input type="number" class="form-control" id="balance"
														
														value="0" readonly>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Bill Details</label> <input
														type="text" class="form-control" id="ccnumber"
														placeholder="Enter Invoice NO/Trancaction id/etc"
														name="bill" value="${payment.bill }">
												</div>
											</div>
										</div>
										<!--/.row-->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Remarks or Contracts, if any</label>
													<textarea id="textarea-input" name="remarks" rows="6"
														class="form-control"
														placeholder="Remark about the payment related"
														name="Remarks" value="${payment.Remarks }"></textarea>
												</div>
											</div>
										</div>
                                       <p style="color:  #dc3545;">  <span style="color:  red; font-weight:  bolder;">*</span>Enter '0' whereever NA</p>

									</div>
									
								</div>
								<br>
								<div class="card">
									<div class="card-header">
										<strong>Counter-Party's Lawyer</strong> Details
									</div>
									<div class="card-body">

										<div class="form-group">
											<label for="company">Name of the Lawyer</label> <input
												type="text" class="form-control" id="company"
												placeholder="Enter Name" name="counter"
												value="${c.counter }">
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber">Address</label>
													<textarea id="textarea-input" name="textarea-input"
														rows="6" class="form-control"
														placeholder="Enter Address of the counter-party.... "
														name="address" value="${c.address }"></textarea>
												</div>
											</div>
										</div>


									</div>

								</div>
							</div>
						</div>

						<br>
						<div class="container-fluid">
							<div class="animated fadeIn">
								<div class="row">
									<div class="col-md-12">
										<div class="card">
									<div class="card-header">
										<strong>Case Status</strong> Details
									</div>
									<div class="card-body">
									      <div class="row">
											<div class="col-md-4">
												<label  for="textarea-input">Last
													 Hearing :</label>
												<div >
													<input type="date" class="form-control" id="lasthearing"
														name="lasthearing" value="${updatecase.lasthearing }">
												</div>
											</div>
											<div class="col-md-4">
												<label  for="textarea-input">Next
													Hearing :</label>
												<div >
													<input type="date" class="form-control" id="ccnumber"
														name="nexthearing" value="${updatecase.nexthearing }">
												</div>
											</div>
											<div class="col-md-4">
												<label  for="textarea-input">Case Status :</label>
												<div >
													<input type="text" class="form-control" id="status"
														name="status" value="${updatecase.status }">
												</div>
											</div>
											 </div>
											</div>
											<div class="card-footer">
												<center>
													<button type="submit" class="btn btn-sm btn-primary">
														<i class="fa fa-dot-circle-o"></i> Submit
													</button>
													<button type="reset" class="btn btn-sm btn-danger">
														<i class="fa fa-ban"></i> Reset
													</button>
												</center>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${mode == 'View_Cases' }">
					<div class="card">
						<div class="card-body">
							<div id="accordion">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button class="btn btn-link nav-link" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true"
												aria-controls="collapseOne">Case Status</button>
										</h5>
									</div>

									<div id="collapseOne" class="collapse show"
										aria-labelledby="headingOne" data-parent="#accordion">
										<div class="card-body">

											<div class="row">
												<div class="col-sm-2">
													<label for="ccmonth"><b>Case Cateogry:</b>
														${c.cateogry }</label>

												</div>
												<div class="col-sm-3">
													<div class="form-group">
														<label for="date"><b>Date of Institution: </b>${c.dateinstitution }</label>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label for="ccnumber"><b>Case No:</b>
															${c.caseno }</label>
													</div>
												</div>
												<div class="col-sm-2">
													<div class="form-group">
														<label for="ccnumber"><b>File No: </b>${ c.fileno}</label>
													</div>
												</div>
												
												
												<div class="col-sm-3">
													<div class="form-group">
														<label for="time"><b>Date of Summon: </b>${c.datesummon }
														</label>
													</div>
												</div>


											</div>
											<div class="row">
											<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber"><b>Case Title: </b>${c.title }
															&nbsp;&nbsp;</label>
													</div>
												</div>
												<div class="col-sm-6">
											<div class="form-group">
												<label for="company"><b>Lawyers's Name:</b> &nbsp;
													${c.lawyer.name}</label>
											</div>
											</div>	

											</div>


											<!--/.row-->
											<div class="row">
											
											<div class="col-sm-6">
											<div class="form-group">
													<label for="ccnumber"><b>Last date Of Hearing:
													</b>${c.updatecase.lasthearing } </label>
												</div>
											</div>
											<div class="col-sm-6">
											<div class="form-group">
													<label for="ccnumber"><b>Next date Of Hearing:
													</b>${c.updatecase.nexthearing } </label>
												</div>
												</div>
											</div>

											

											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber"><b>Case Description: </b>${c.description}</label>

													</div>
												</div>
											</div>
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth"><b>Current case Status: </b>${c.updatecase.status }</label>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber"><b>Details of Caveat: </b>${c.updatecase.cavet }</label>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth"><b>Connected-cases No: </b>${c.updatecase.connected }</label>
												</div>
											</div>
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth"><b>Acts Applicable: </b>${c.act }</label>
												</div>
											</div>

											
											
											<div class="row">										
										   <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#caseModal"
												data-whatever="@fat">Update Case</button>
                                            </security:authorize>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#reminderModal"
												data-whatever="@fat">Set Reminder</button>
                                            </security:authorize>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModal"
												data-whatever="@fat">Update Payment</button>
                                           </security:authorize>
                                           &nbsp;&nbsp;&nbsp;&nbsp;
                                           <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#uploadModal"
												data-whatever="@fat">Upload Document</button>
                                           </security:authorize>	
                                           &nbsp;&nbsp;&nbsp;&nbsp;
                                           <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#logModal"
												data-whatever="@fat">Case Log</button>
                                           </security:authorize>	
                                           
											<!--/.row-->
										</div>								
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingTwo">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed nav-link"
												data-toggle="collapse" data-target="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo">Lawyers
												Information</button>
										</h5>
									</div>
									<div id="collapseTwo" class="collapse"
										aria-labelledby="headingTwo" data-parent="#accordion">
										<div class="card-body">
											<div class="row">
												<div class="col-sm-6">
													<div class="card">
														<div class="card-header">
															<strong>Lawyer's Detail</strong>
														</div>
														<div class="card-body">
															<div class="form-group">
																<label for="company"><b>Lawyers's Name:</b>
																	&nbsp; ${c.lawyer.name}
																	</p></label>
															</div>
															<div class="form-group">
																<label for="vat"><b>Address:</b> &nbsp;
																	${c.lawyer.address }<br>&nbsp; &nbsp;&nbsp;
																	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
																	&nbsp;${c.lawyer.line2 }<br>&nbsp; &nbsp;&nbsp;
																	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
																	&nbsp;${c.lawyer.city } &nbsp; &nbsp; ${c.lawyer.state }<br>&nbsp;
																	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
																	&nbsp;&nbsp; &nbsp;${c.lawyer.country } &nbsp;&nbsp;<b>PIN:</b>
																	${c.lawyer.pin }</label>
															</div>

															<!--/.row-->
															<div class="row">
																<div class="col-sm-12">
																	<div class="form-group">
																		<label for="ccnumber"><b>Contact No: </b>
																			&nbsp; ${c.lawyer.phone }</label>
																	</div>
																</div>
																<div class="col-sm-12">
																	<div class="form-group">
																		<label for="ccnumber"><b>Email-ID: </b> &nbsp;
																			${c.lawyer.email }</label>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>


												<div class="col-sm-6">
													<div class="card">
														<div class="card-header">Junior's Detail</div>
														<div class="card-body">

															<div class="form-group">
																<label for="company"><b>Juniors' Name:</b>
																	&nbsp; ${c.lawyer.jname}
																	</p></label>
															</div>

															<div class="row">
																<div class="col-sm-6">
																	<div class="form-group">
																		<label for="ccnumber"><b>Contact No.</b>
																			&nbsp; ${c.lawyer.jphone }</label>
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="form-group">
																		<label for="ccnumber"><b>Email-ID</b> &nbsp;
																			${c.lawyer.jemail }</label>
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
																	${c.lawyer.cname}
																	</p></label>

															</div>

															<div class="row">
																<div class="col-sm-6">
																	<div class="form-group">
																		<label for="ccnumber"><b>Contact No.</b>
																			&nbsp; ${c.lawyer.cphone }</label>
																	</div>
																</div>
																<div class="col-sm-6">
																	<div class="form-group">
																		<label for="ccnumber"><b>Email-ID</b> &nbsp;
																			${c.lawyer.cemail }</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingThree">
										<h5 class="mb-0">
											<button class="btn btn-link collapsed nav-link"
												data-toggle="collapse" data-target="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">Payment
												Details</button>
										</h5>
									</div>
									<div id="collapseThree" class="collapse"
										aria-labelledby="headingThree" data-parent="#accordion">
										<div class="card-body">
											<div align="center">
												<h5><u>Previous Payments</u></h5>
												<c:if test="${empty pay}">
														 <br> <h5 style=" text-align:  center; color: #dc3545; font-size: 20px;">No payment history found</h5><br>
												</c:if>	
											</div>
											<div class="row">

												<c:forEach var="pay" items="${ pay}">
													<div class="col-md-3">
														<div class="form-group">
															<label for="ccnumber">Amount</label>
															<div class="input-group">
																<div class="input-group-prepend">
																	<span class="input-group-text"><i
																		class="fa fa-inr"></i></span>
																</div>
																<input type="number" class="form-control" id="total"
																	placeholder="Amount Payable" name="total"
																	value="${pay.total }" readonly>
															</div>
														</div>
													</div>
													<div class="col-sm-3">
														<div class="form-group">
															<label for="ccnumber">Paid</label>
															<div class="input-group">
																<div class="input-group-prepend">
																	<span class="input-group-text"><i
																		class="fa fa-inr"></i></span>
																</div>
																<input type="number" class="form-control" id="paid"
																	placeholder="Amount Paid" name="paid"
																	value="${pay.paid }" readonly>
															</div>
														</div>
													</div>
													<div class="col-sm-3">
														<div class="form-group">
															<label for="ccnumber"><b>Bill Details</b></label>
															<div class="input-group">

																<label for="ccnumber"><b></b>${pay.bill }</label>
															</div>
														</div>
													</div>
													<div class="col-sm-3">
														<div class="form-group">
															<label for="ccnumber"><b>Remarks</b></label>
															<div class="input-group">

																<label for="ccnumber"><b></b>${pay.remarks }</label>
															</div>
														</div>
													</div>
												</c:forEach>
												
												 
											</div>
											<hr>
											<div align="center">
												<h4><u>Latest Payment</u></h4>
											</div>
											<div class="row">

												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber">Total Fees</label>
														<div class="input-group">
															<div class="input-group-prepend">
																<span class="input-group-text"><i
																	class="fa fa-inr"></i></span>
															</div>
															<input type="number" class="form-control" id="total"
																placeholder="Amount Payable" name="total"
																value="${c.payment.total }" readonly>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber">Fee Paid</label>
														<div class="input-group">
															<div class="input-group-prepend">
																<span class="input-group-text"><i
																	class="fa fa-inr"></i></span>
															</div>
															<input type="number" class="form-control" id="paid"
																placeholder="Amount Paid" name="paid"
																value="${c.payment.paid }" readonly>
														</div>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth"><b>Payment of Fees: </b>${c.payment.type }</label>
												</div>
												<div class="form-group col-sm-6">
													<label for="ccnumber">Balance Left</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fa fa-inr"></i></span>
														</div>
														<input type="number" class="form-control" id="balance"
															placeholder="INR" name="balance"
															value="${c.payment.balance }" readonly>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber"><b>Bill Details: </b>${c.payment.bill }</label>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber"><b>Remarks: </b>${c.payment.remarks }</label>
													</div>
												</div>
											</div>
											<security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModal"
												data-whatever="@fat">Update</button>
                                           </security:authorize>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" id="headingFour">
										<h5 class="mb-0">
											<button class="btn btn-link nav-link" data-toggle="collapse"
												data-target="#collapseFour" aria-expanded="true"
												aria-controls="collapseFour">Case Documents</button>
										</h5>
									</div>

									<div id="collapseFour" class="collapse"
										aria-labelledby="headingFour" data-parent="#accordion">

										<div class="row">
											<!--/.col-->

											<div class="card-body">
												<table class="table">
													<thead>
														<tr class="card-header">
															<th>Type</th>
															<th>File</th>
															<th>Brief</th>
														</tr>
													</thead>
													<c:forEach var="document" items="${document }">
														<tbody>
															<tr>
																<td>${document.type }</td>
																<td><a href ="${pageContext.request.contextPath}/${document.type}/${document.file}" target="_blank">${document.file}</</a></td>
																<td>${document.brief }</td>
															</tr>
															<tr>
															</tr>
														</tbody>
													</c:forEach>
													
												</table>
												
												 <c:if test="${empty document}">
							 <br> <h5 style=" text-align:  center; color: #dc3545; font-size: 20px;">No Document found for this case</h5><br>
					</c:if>	
											</div>
											
											
										</div>
										<div class="card-body">										
										   <security:authorize access="hasAnyRole('ADMIN')">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#uploadModal"
												data-whatever="@fat">Upload</button>
                                           </security:authorize>	
											<!--/.row-->
										</div>
										
										
										<br>
										
										
									</div>
									
								</div>
								<div class="card">
									<div class="card-header" id="headingFive">
										<h5 class="mb-0">
											<button class="btn btn-link nav-link" data-toggle="collapse"
												data-target="#collapseFive" aria-expanded="true"
												aria-controls="collapseFive">History-Dates</button>
										</h5>
									</div>

									<div id="collapseFive" class="collapse"
										aria-labelledby="headingFive" data-parent="#accordion">
										<div class="card-body">
											<table id="" class="table table-striped table-bordered">

												<thead>
													<tr class="card-header">													
														<th>Hearing</th>
<!-- 														<th>Connected Cases</th> -->
<!-- 														<th>Caveat</th> -->
                                                        <th>Status</th>
														<th>Next Date</th>
														
													</tr>
												</thead>
												<tbody>
													<c:forEach var="trigger" items="${ casesTrigger}">
														<tr>
                                                            <td>${trigger.lasthearing }</td>
<%-- 															<td>${trigger.connected }</td> --%>
<%-- 															<td>${trigger.cavet }</td>															 --%>
															<td>${trigger.status }</td>
															<td>${trigger.nexthearing }</td>
															
														</tr>

													</c:forEach>
												</tbody>
											</table>
											 <c:if test="${empty casesTrigger}">
							 <br> <h5 style=" text-align:  center; color: #dc3545; font-size: 20px;">No history yet</h5><br>
					</c:if>	
                                         </div>
											<!--/.row-->
										<br>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="uploadModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Upload
											Document</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="fileUploadForm"  method ="post" enctype="multipart/form-data">
										<div class="modal-body">

											<div class="row">
												
												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber">Case No: </label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="caseno"
																 name="caseno"
																value="${c.caseno }" readonly>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber">Document's Type</label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<select class="form-control" id="type" name="type" value="${d.type }">
													<option>--SELECT--</option>
													<option>Petition</option>
													<option>Reply(Written Statement)</option>
													<option>Interim Order</option>
													<option>Affidavit</option>
													<option>Evidence</option>
													<option>Pleadings</option>
													<option>Contracts</option>
													<option>Judgements</option>
													<option>Notification</option>
													<option>Correspondence</option>
													<option>Orders</option>
												</select>
														</div>
													</div>
												</div>
											</div>
											<!--/.row-->
											
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Browse</label> 
														<input type="file" class="form-control" id="file"		
															name="file" value="${d.file }">
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Brief</label>
														<textarea id="textarea-input" rows="5"
															class="form-control"
															placeholder="Enter detail about document"
															name="brief" value="${d.brief }"></textarea>
													</div>
												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Upload</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						<div class="modal fade" id="logModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Update Case Log</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="setlog" action="" method="">
										<div class="modal-body">

											<div class="row">
												
												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber">Case no:</label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="caseno"
																 name="caseno"
																value="${c.caseno }" readonly>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber">Type</label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<select class="form-control multiselect-ui form-control" id="ccyear" name="type"
													value="${logs.type }">
													<option>--SELECT--</option>
													<option>Critical Events</option>
													<option>Miscellanous</option>
													<option>Others</option>
													
												</select>
														</div>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth">Date</label> <input type="text"
														class="form-control" id="ccmonth" name="date" placeholder="DD-MM-YYYY"
														value="${logs.date }" >

												</div>
												<div class="form-group col-sm-6">
													<label for="ccnumber">Specify Type</label>
													<div class="input-group">
													
														<input type="text" class="form-control" id="specify"
															name="specify" value="${logs.specify }">
													</div>
												</div>
											</div>
											
											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Brief</label>
														<textarea id="froala-editor" name="brief" rows="5"
															class="form-control"
															placeholder="Enter brief about log here.."
															 value="${logs.brief }"></textarea>
													</div>
												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Update</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						<div class="modal fade" id="reminderModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Reminder for this case</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="setreminder" action="" method="">
										<div class="modal-body">

											<div class="row">
												
												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber">Case no:</label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="caseno"
																 name="caseno"
																value="${c.caseno }" readonly>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber">Type</label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<select class="form-control" id="ccyear" name="type"
													value="${r.type }">
													<option>--SELECT--</option>
													<option>Court-Fillings</option>
													<option>Meetings</option>
													<option>Hearings</option>
													<option>Miscellanous</option>
													<option>Other</option>
												</select>
														</div>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth">Date</label> <input type="text"
														class="form-control" id="ccmonth" name="date" placeholder="DD-MM-YYYY"
														value="${r.date }" >

												</div>
												<div class="form-group col-sm-6">
													<label for="ccnumber">Time</label>
													<div class="input-group">
														<div class="input-group-prepend">
															
														</div>
														<input type="time" class="form-control" id="time"
															name="time" value="${r.time }">
													</div>
												</div>
											</div>
											
											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Brief</label>
														<textarea id="textarea-input" name="brief" rows="5"
															class="form-control"
															placeholder="Enter brief about reminder here.."
															 value="${r.brief }"></textarea>
													</div>
												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Set</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Update
											Payment</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="paysubmit" action="" method="">
										<div class="modal-body">

											<div class="row">
												<input type="hidden" class="form-control" id="ccnumber"
													name="paymentid" value="${c.payment.paymentid }">
												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber">Fees Dues</label>
														<div class="input-group">
															<div class="input-group-prepend">
																<span class="input-group-text"><i
																	class="fa fa-inr"></i></span>
															</div>
															<input type="number" class="form-control" id="dues"
																placeholder="Amount Payable" name="total"
																value="${c.payment.balance }" readonly>
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label for="ccnumber">Fee Paid</label>
														<div class="input-group">
															<div class="input-group-prepend">
																<span class="input-group-text"><i
																	class="fa fa-inr"></i></span>
															</div>
															<input type="number" class="form-control" id="pay"
																placeholder="Amount Paid" name="paid"
																value="${payment.paid }">
														</div>
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="form-group col-sm-6">
													<label for="ccmonth">Payment of Fees type</label> <input
														class="form-control" id="ccmonth" name="type"
														value="${c.payment.type }" readonly>

												</div>
												<div class="form-group col-sm-6">
													<label for="ccnumber">Balance Left</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fa fa-inr"></i></span>
														</div>
														<input type="number" class="form-control" id="bal"
															name="balance" value="${payment.balance }" readonly>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Bill Details</label> <input
															type="text" class="form-control" id="ccnumber"
															placeholder="Enter Invoice NO/Trancaction id/etc"
															name="bill" value="${payment.bill }">
													</div>
												</div>
											</div>
											<!--/.row-->
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<label for="ccnumber">Remarks, if any</label>
														<textarea id="textarea-input" name="remarks" rows="5"
															class="form-control"
															placeholder="Remark about the payment related"
															name="Remarks" value="${payment.Remarks }"></textarea>
													</div>
												</div>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						<div class="modal fade" id="caseModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Update
											Case Log</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="case-update" action="case-update" method="POST">
										<div class="modal-body">
										<div class="form-group row">
										  <input type="hidden" class="form-control" id="ccnumber"
													name="updateid" value="${c.updatecase.updateid }">
												
											<div class="col-sm-12">
												<div class="form-group">
													<label for="ccnumber"><b>Current-case Status</b></label>
													<textarea id="textarea-input" name="status" rows="3"
														class="form-control"
														placeholder="Case remark and status.... " name="remark"
														value="${updatecase.status }"></textarea>
												</div>
											</div>
											<div class="col-md-12">
													<div class="form-group">
														<label for="ccnumber"><b>Details of Caveat: </b></label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="dues"
																 name="cavet"
																value="${updatecase.cavet }" >
														</div>
													</div>
												</div>
											<div class="col-md-12">
													<div class="form-group">
														<label for="ccnumber"><b>Connected-cases No: </b></label>
														<select
													multiple="multiple"
													class="form-control multiselect-ui form-control"
													id="ccmonth" name="connected" value="${updatecase.connected }">

													<c:forEach var="title" items="${title }">
														<option>${title }</option>
													</c:forEach>
												</select>
													</div>
												</div>
											<!--/.row-->
											<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber"><b>Last Hearing :</b></label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="lasthearing"
																 name="lasthearing" placeholder="DD-MM-YYYY"
																value="${c.updatecase.nexthearing }" >
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="ccnumber"><b>Next Hearing :</b></label>
														<div class="input-group">
															<div class="input-group-prepend">
																
															</div>
															<input type="text" class="form-control" id="nexthearing"
																 name="nexthearing" placeholder="DD-MM-YYYY"
																value="${updatecase.nexthearing }" >
														</div>
													</div>
												</div>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Update</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						
					</div>
				</div>
			</c:when>
			</c:choose>
		</div>
	</div>
	<br>
	<br>
	</main>

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
		<script type="text/javascript" charset="utf-8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>	
		<script type="text/javascript" charset="utf-8"
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script type="text/javascript" charset="utf-8"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
		<script type="text/javascript" charset="utf-8"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
		<script type="text/javascript" charset="utf-8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
		<script type="text/javascript" charset="utf-8"
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script>	
	$(document).ready(function() {
	    $('#example').DataTable( {
	        dom: 'Bfrtip',
	        buttons: [
	             'copy', 'excel', 'print'
	        ]
	    } );
	} );
	</script>
	
	<script>
		$('form#fileUploadForm').submit(function(e) {
			e.preventDefault();
			var formData = new FormData(this);
			$.ajax({
				url : "${pageContext.request.contextPath}/upload-document",		
				type: 'POST',
		        data: formData,
		        success: function (data) {
		        	console.log('Documents uploaded Successfully!');
		        },
		        error : function(data) {
					console.log('Not uploaded.');					
				},
		        cache: false,
		        contentType: false,
		        processData: false
		    });
			location.reload(true);
		});
	</script>
	
	<script type="text/javascript">
		$('#case-update').submit(function(e) {
			e.preventDefault();
			$.ajax({
				url : "${pageContext.request.contextPath}/case-update",
				type : "POST",				
				data : $('#case-update').serialize(),
				success : function(data) {
                      alert('Case Updated!');
				},
				error : function(data) {
					console.log('An error occurred.');
					console.log(data);
				},
			});
			location.reload(true);

		});
	</script>
	
	<script type="text/javascript">
		$('#paysubmit').submit(function(e) {
			e.preventDefault();
			$.ajax({
				url : "${pageContext.request.contextPath}/payment-update",
				type : "POST",
				data : $('#paysubmit').serialize(),
				success : function(data) {
                      alert('Payment Updated!');
				},
				error : function(data) {
					console.log('An error occurred.');
					console.log(data);
				},
			});
			location.reload(true);

		});
	</script>
	
	<script type="text/javascript">
		$('#setreminder').submit(function(e) {
			e.preventDefault();
			$.ajax({

				url : "${pageContext.request.contextPath}/set-reminder",
				type : "POST",
				data : $('#setreminder').serialize(),
				success : function(data) {
                      alert('Reminder have been set!');
				},
				error : function(data) {
					console.log('An error occurred.');
					console.log(data);
				},
			});
			location.reload(true);
		});
	</script>
	
	<script type="text/javascript">
		$('#setlog').submit(function(e) {
			e.preventDefault();
			$.ajax({

				url : "${pageContext.request.contextPath}/set-log",
				type : "POST",
				data : $('#setlog').serialize(),
				success : function(data) {
                      alert('Logs Updated!');
				},
				error : function(data) {
					console.log('An error occurred.');
					console.log(data);
				},
			});
			location.reload(true);
		});
	</script>

	<script>
		$(document).ready(function() {
			$(document).change(function() {
				var d = $("#total").val();
				var e = $("#paid").val();
				var f = d - e;
				$("#balance").val(f);
			});
		});

		$(document).ready(function() {
			$(document).change(function(){
				var a = $("#dues").val();
				var b = $("#pay").val();
				var c = a - b;
				$("#bal").val(c);
			});
		});
	</script>

</body>
</html>