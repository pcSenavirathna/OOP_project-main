<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.BidingSystem.DBConnect" %>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>

<%
    String username = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            <li><a href="contactus.jsp">Contact Us</a></li>
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
                <label class="navWelcome">Welcome, <%= username %>&nbsp;&nbsp;</label>
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
                <th scope="col">Message</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Establish a database connection (use your DBConnect class).
                connection = DBConnect.getConnection();

                statement = connection.createStatement();
                resultSet = statement.executeQuery("SELECT * FROM feedback");

                while (resultSet.next()) {
                    int feedbackId = resultSet.getInt("id");
                    String feedbackUsername = resultSet.getString("cusName");
                    String feedbackEmail = resultSet.getString("cusEmail");
                    String feedbackMessage = resultSet.getString("cusFeedback");
        %>
            <tr align="center">
                <td><%= feedbackId %></td>
                <td><%= feedbackUsername %></td>
                <td><%= feedbackEmail %></td>
                <td><%= feedbackMessage %></td>
                <td>
                    <form action="feedbackDeleteServlet" method="post">
                        <input type="hidden" name="id" value="<%= feedbackId %>">
                        <input type="submit" value="Delete" class="btn-danger" onclick="showAlert('Feedback deleted successfully');">
                    </form>
                </td>
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