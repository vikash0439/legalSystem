<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	<input id="field1" />

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
	<span>Case No: </span>
	<input id="caseno" />

	<script>
		var options = {
			url : "${pageContext.request.contextPath}/caseno",
			getValue : "caseno",
			list : {
				match : {
					enabled : true
				}
			}
		};
		$("#caseno").easyAutocomplete(options);
	</script>

</body>
</html>