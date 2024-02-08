<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.* "%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%
String username = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin user Profile Update</title>
<link rel="stylesheet" href="css/Vw.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">

</head>
<body>
<header>
        <h1>Welcome to the Bidding System</h1>
    </header>

    <div class="navigation">
        <ul>
            <li><a href="index.jsp" class="active">Home</a></li>
            <li><a href="contactus.jsp">ContactUs</a></li>
            <li>
            	 <%
                if (username != null) {
                %>
            
            	<a href="feedback.jsp">Feedback</a>
           		 
                <%
                }
                %>
            
            </li>
            <li>
           		 <%
                if (username != null) {
                %>
            
            	<a href="itemAdd.jsp">Add Item</a>
            	
            	<%
                }
                %>
            
            </li>
            <li>
           		 <%
                if (username != null) {
                %>
            
            	<a href="reBtn.jsp">View Item</a>
            	
            	<%
                }
                %>
            
            </li>
            <li>
                <%
				if (username != null) {
				%>
				    <lable class="navWelcome">Welcome, <%= username %>&nbsp;&nbsp;</lable>
				    <a href="userUpdate.jsp">Profile</a>
				    <a href="logout">Logout</a>
				<%
				} else {
				%>
				    <a href="Reg.jsp">Login</a>
				<%
				}
				%>

            </li>
        </ul>
    </div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">UserName</th>
				<th scope="col">Email</th>
				<th scope="col">Contact</th>
				<th scope="col">Update</th>
				<th scope="col">Delete</th>

			</tr>
		</thead>

		<%
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bidingsystem?characterEncoding=utf8", "root",
			"123456");
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from users");

			while (resultSet.next()) {
		%>
		<tr align="center">
			<th scope="row">
				<%
				out.println(resultSet.getString("id"));
				%>
			</th>
			<td>
				<%
				out.println(resultSet.getString("funame"));
				%>
			</td>
			<td scope="row">
				<%
				out.println(resultSet.getString("uemail"));
				%>
			</td>
			<td>
				<%
				out.println(resultSet.getString("umobile"));
				%>
			</td>

			<td><div class="card" style="width: v5rem;">
					<a href='update_record.jsp?u=<%=resultSet.getString("id")%>'
						class="btn tn-success"><b>Edit</b></a>
				</div></td>
			<td><b>
					<form action='delete?d=<%=resultSet.getString("id")%>'
						method="post">
						<div class="card" style="width: 5rem;">
							<input type="submit" name="delete" value="Delete"
								id="<%=resultSet.getString("id")%>" class="btn-danger">
					</form>
					</div>
					</form>
			</b></td>
		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>

</body>
</html>