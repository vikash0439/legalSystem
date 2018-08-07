<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/easy-autocomplete/1.3.5/easy-autocomplete.min.css"
	rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/easy-autocomplete/1.3.5/jquery.easy-autocomplete.min.js"
	type="text/javascript"></script>

</head>
<body>

<% SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy"); %>
    Date:     <%= sdf.format(new Date()) %>
    
    <br><br><br>
<span>Case No: </span>
	<input id="id" />

	<script>
		var options = {
			url : "${pageContext.request.contextPath}/id",
			getValue : "caseno",
			list : {
				match : {
					enabled : true
				}
			}
		};
		$("#id").easyAutocomplete(options);
	</script>
	
	<br><br><br>
	<h4>Name: </h4><input id="name" />

	<script>
		var options = {
			url : "${pageContext.request.contextPath}/name",
			getValue : "name",
			list : {
				match : {
					enabled : true
				}
			}
		};
		$("#name").easyAutocomplete(options);
	</script>
	<h4>Field: </h4><input id="field1" />

	<script>
		var options = {
			url : "${pageContext.request.contextPath}/field1",
			getValue : "field1",
			list : {
				match : {
					enabled : true
				}
			}
		};
		$("#field1").easyAutocomplete(options);
	</script>
    <br><br><br>
	

</body>
</html>