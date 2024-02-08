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
		<input name="firstN" type="text"   value="<%= request.getParameter("fname") %>">
		<input name="lastN" type="text"  value="<%= request.getParameter("lname") %>">
		<input name="email" type="text"  value="<%= request.getParameter("email") %>">
		<input name="phone" type="text"  value="<%= request.getParameter("phone") %>">
	</form>
</body>
</html>

</body>
</html>