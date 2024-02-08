<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="com.BidingSystem.prasad.Pitem"%>
<%@ page import="com.BidingSystem.prasad.Feedback"%>
<%@ page import="com.BidingSystem.prasad.itemDBUtil"%>
<%@ page import="com.BidingSystem.prasad.feedbackDBUtil"%>

<%
String username = (String) session.getAttribute("name");
String useremail = (String) session.getAttribute("email");
%>

<%
List<Feedback> feedback = feedbackDBUtil.getFeedbackList();
%>

<html>
<head>
<title>Customer Feedback</title>
<link rel="stylesheet" type="text/css" href="css/feedback.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
	<header>
		<h1>Welcome to the Bidding System</h1>
	</header>

	<div class="navigation">
		<ul>
			<li><a href="index.jsp" >Home</a></li>
			<li><a href="contactus.jsp">ContactUs</a></li>
			<li>
				<%
				if (username != null) {
				%> <a href="feedback.jsp" class="active">Feedback</a> <%
 }
 %>

			</li>
			<li>
				<%
				if (username != null) {
				%> <a href="itemAdd.jsp">Add Item</a> <%
 }
 %>

			</li>
			<li>
				<%
				if (username != null) {
				%> <a href="reBtn.jsp">View Item</a> <%
 }
 %>

			</li>
			<li>
				<%
				if (username != null) {
				%> <lable class="navWelcome">Welcome, <%=username%>&nbsp;&nbsp;</lable>
				<a <%if (username.equals("admin")) {%>
				href="admin.jsp" <%} else {%> <%}%>>
					Profile</a> <a href="logout">Logout</a> <%
				 } else {
				 %> <a href="Reg.jsp">Login</a> <%
				 }
				 %>

			</li>
		</ul>
	</div>

	<div class="container">
		<h1>Customer Feedback</h1>
		<form action="feedbackinsert" method="post">
			<label for="name">Name:</label> <input type="text" name="name"
				value="<%=username%>" readonly><br> <label for="email">Email:</label>
			<input type="email" name="email" value="<%=useremail%>" readonly><br>

			<label for="feedback">Feedback:</label>
			<textarea name="feedback" id="feedback" required></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</div>
	
	<div class="feedback-cards-container">
		<%
		for (Feedback fb : feedback) {
		%>
		<div class="feedback-card">
		    <p><strong>Name:</strong> <%=fb.getName()%></p>
		    <p><strong>Feedback Message:</strong> <%=fb.getFeedback()%> </p>
		</div>
		<%
		}
		%>
	</div>

</body>
</html>
