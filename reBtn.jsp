<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Add</title>
</head>
<body>
	<form id="itemAddForm" action="SellerItemsServlet" method="POST">
		<!-- Your form fields go here -->
	</form>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Auto-submit the form using JavaScript
			document.getElementById('itemAddForm').submit();
		});
	</script>
</body>
</html>

</body>
</html>