<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

<title>Dashboard</title>

</head>
<body >


    <!-- Modal -->
<div class="modal fade" id="welcomeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: #dc3545;">&times;</span>
        </button>
      <center style=" text-align:  center; color: #17a2b8; font-size: 20px;">
        ${msg} <br><br>
            <img src="<c:url value='../../static/img/check-icon.png'/>" alt="Checked">
            <img src="${pageContext.request.contextPath}/../../static/img/check-icon.png" alt="Checked1">
            <img src="${pageContext.servletContext.contextPath}/../../static/img/check-icon.png" alt="Checked2">
            <img src="${pageContext.request.contextPath}../../static/img/check-icon.png" alt="Checked3">
            <img src="<c:url value='${pageContext.request.contextPath}../../static/img/check-icon.png'/>" alt="Checked4">

        <br><br> ${name}
        </center>
      </div>

    </div>
  </div>
</div> 	

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
			<li class="nav-item"><a class="nav-link" href="lawyer">Lawyer</a></li>
			<li class="nav-item"><a class="nav-link" href="acts">Acts</a></li>
			<li class="nav-item"><a class="nav-link" href="case-logs">Logs</a></li>
			<li class="nav-item"><a class="nav-link" href="user">Users</a></li>
		</ul>
		<span class="navbar-text"> <i class="fa fa-user-circle" style="font-size:1.2rem;color:#17a2b8">&nbsp; ${name}</i></span> &nbsp;&nbsp;&nbsp;
		<a href="" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-sign-out" style="font-size:30px;color:red" ></i></a>
	</div>
	</nav>

  <main class="main">
        <!-- Breadcrumb-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">${name}</li>
          <li class="breadcrumb-item">
            <a href="home">Dashboard</a>
          </li>
          
          <!-- Breadcrumb Menu-->
          
        </ol>
        <div class="container-fluid">
          <div class="animated fadeIn">
            <div class="row">
              <div class="col-sm-6 col-lg-3">
               <a href="case" class="nav-link"> <div class="card text-white bg-primary" >
                  <div class="card-body pb-0">
                    
                    <div class="text-value" id="noc"></div>
                    <div>Total no of Cases</div>
                  </div>
                  <div class="chart-wrapper mt-3 mx-3" style="height:70px;">
                    <canvas id="card-chart1" class="chart" height="70"></canvas>
                  </div>
                </div> </a>
              </div>
              <!--/.col-->
              <div class="col-sm-6 col-lg-3">
               <a href="lawyer" class="nav-link"> <div class="card text-white bg-info">
                  <div class="card-body pb-0">
                   
                    <div class="text-value" id="nol"></div>
                    <div>No of Lawyers</div>
                  </div>
                  <div class="chart-wrapper mt-3 mx-3" style="height:70px;">
                    <canvas id="card-chart2" class="chart" height="70"></canvas>
                  </div>
                </div></a>
              </div>
              <div class="col-sm-6 col-lg-3">
               <a href="acts" class="nav-link"> <div class="card text-white bg-danger">
                  <div class="card-body pb-0">
                   
                    <div class="text-value" id="noa"></div>
                    <div>Total No of Acts</div>
                  </div>
                  <div class="chart-wrapper mt-3 mx-3" style="height:70px;">
                    <canvas id="card-chart4" class="chart" height="70"></canvas>
                  </div>
                </div></a>
              </div>
              <!--/.col-->
              <!--/.col-->
              <div class="col-sm-6 col-lg-3">
                <a href="user" class="nav-link"><div class="card text-white bg-warning">
                  <div class="card-body pb-0">
                    <div class="text-value" id="nou"></div>
                    <div>Total no of Users</div>
                  </div>
                  <div class="chart-wrapper mt-3" style="height:70px;">
                    <canvas id="card-chart3" class="chart" height="70"></canvas>
                  </div>
                </div></a>
              </div>
              <!--/.col-->
              
            </div>
            <!--/.row-->

            <br>
           
            <!--/.row-->
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <center><strong>Today's Reminders</strong></center>
                  </div>
                  <div class="">
                    
                    <!--/.row-->
                    <br/>
                    <table class="table table-responsive-sm table-hover table-outline mb-0">
                      <thead class="thead-light">
                        <tr style=" text-align: ;">
                            <th>Case</th>
							<th>Time</th>
							<th>Brief</th>
							<th>Type</th>
                          
                        </tr>
                      </thead>
                      
                     
					<tbody>
					
						 <c:forEach var="reminder" items="${reminder }">
						 <tr>
							<td style="color: #212529;"><strong>${reminder.caseno }</strong></td>
							<td>${reminder.time }</td>
							<td>${reminder.brief }</td>
							<td>${reminder.type }</td>
						</tr>
						</c:forEach>						
					</tbody>				
                    </table>
                    <c:if test="${empty reminder}">
							 <br> <h5 style=" text-align:  center; color: #dc3545; font-size: 20px;">No Reminders today</h5><br>
					</c:if>	
                  </div>
                </div>
              </div>
              <!--/.col-->
            </div>
            <!--/.row-->
          </div>

        </div>
      </main>
     
	<br>

	<!-- Image and text -->
	<span class="d-block p-2 bg-dark text-white"><center> &copy; 2018, DCM Textiles</center></span>
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
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script>
        $(document).ready(function(){      
        $.ajax({
        	url: "${pageContext.request.contextPath}/count",
        	
        	
        	success: function(data) {
        	$('#nol').html(data);
        	console.log(data);
        	
        	}
        	});
        
        
        $.ajax({
        	url: "${pageContext.request.contextPath}/countacts",
        	
        	
        	success: function(data) {
        	$('#noa').html(data);
        	console.log(data);
        	
        	}
        	});
        
        $.ajax({
        	url: "${pageContext.request.contextPath}/countusers",
        	
        	
        	success: function(data) {
        	$('#nou').html(data);
        	console.log(data);
        	
        	}
        	});
        
        $.ajax({
        	url: "${pageContext.request.contextPath}/countcases",
        	
        	
        	success: function(data) {
        	$('#noc').html(data);
        	console.log(data);
        	
        	}
        	});
        	});

        </script>
        <c:if test="${not empty msg}">
<script>
jQuery(function(){
   jQuery('#m').click();
});
</script>
    <p href="" id="m" data-toggle="modal" data-target="#welcomeModal"></p>
</c:if>	
</body>
</html>