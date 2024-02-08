<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<%

String username = (String) session.getAttribute("name");
%>
 
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="css/header.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
* {
  box-sizing: border-box;
}

body{
    font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f3f3f3;
}      

header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 20px;
}

h1{
	font-size: 250%;
	color: orange;
}

nav {
    background-color: #444;
}



nav ul {
    list-style: none;
    display: flex;
    justify-content: left;
    padding: 10px;
}

nav li {
    margin: 0 15px;
}

nav a {
    color: #fff;
    text-decoration: none;
}

.logbtn{
    margin-left: 800px;
}
ul li a.active{
	color: orange;
}

a:hover{
	color: orange;
}


.sidebar {
  box-shadow: 0 10px 10px rgba(0,0, 0, 0.20);  
  position: absolute;
  margin: 0;
  padding: 0;
  width: 220px;
  background-color: #ffffff;
  height: 530px;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: orange;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    text-align: center;
}

h1 {
    color: #333;
}

table {
            border-collapse: collapse;
            width: 1000px;
            margin-left:250px; /* Center the table on the page */
        }

        table, th, td {
            border: 1px solid #8f8f8f;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }
img {
    max-width: 100px;
    height: auto;
}

/* Add more CSS styles as needed */


    </style>
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
				    <a class="active"
				    <%
				    	if(username.equals("admin")){
				    %>
				    	href="admin.jsp"
				    <%}else{
				 	%>
				 		<c:forEach var="cus" items="${cusDetails}">
                            <c:set var="fname" value="${cus.getFirstName()}"/>
                            <c:set var="lname" value="${cus.getLastName()}"/>
                            <c:set var="email" value="${cus.getEmail()}"/>
                            <c:set var="phone" value="${cus.getPhone()}"/>
                        </c:forEach>
                        href="userUpdate.jsp?fname=${fname}&lname=${lname}&email=${email}&phone=${phone}"

				 	<%
				    }
				    %>>
				    Profile</a>
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

    <div class="sidebar">
        <a href="userUpdate.jsp">User Profile</a>
        <a  href="mybid.jsp">My Bid</a>
        <a class="active" href="myOrder.jsp">My orders</a>
        <a href="#about"></a>
      </div>
      
            
	<!---------update and read user details----------->
    <h1>My Orders</h1>
    <table>
        <thead>
            <tr>
                <th>Order Photo</th>
                <th>Order ID</th>
                <th>Order Name</th>
                <th>Price</th>
                <th>Payment Status</th>
                <th>Shipping Cost</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><img src="order1.jpg" alt="Order 1 Photo"></td>
                <td>123456</td>
                <td>Product A</td>
                <td>$50.00</td>
                <td>Paid</td>
                <td>$5.00</td>
                <td>$55.00</td>
            </tr>
            <!-- Add more rows for additional orders -->
        </tbody>
    </table>
           



</body>
</html>
