<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
String username = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" href="css/seller-items.css">
	
	<title>My Items</title>
	
</head>
<body>
	<header>
        <h1>Welcome to the Bidding System</h1>
    </header>

    <div class="navigation">
        <ul>
            <li><a href="index.jsp" >Home</a></li>
            <li><a href="auctions.jsp">ContactUs</a></li>
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
            
            	<a href="btn.jsp" class="active">View Item</a>
            	
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
    <h1>Item for Bidding</h1>
    <table>
        <thead>
            <tr>
                <th>Item ID</th>
                <th>Item Name</th>
                <th>Description</th>
                <th>Item Type</th>
                <th>Starting price</th>
                <th>End date</th>
                <th>Condition</th>
                <th>Reserved Price</th>
                <th>Image</th>
                <th class="action-header">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="it" items="${sitems}">
            
            <c:set var ="id" value="${it.getId()}"/>
            <c:set var ="name" value="${it.getName()}"/>
            <c:set var ="des" value="${it.getDescription()}"/>
            <c:set var ="typ" value="${it.getType()}"/>
            <c:set var ="sprice" value="${it.getStartPrice()}"/>
            <c:set var ="date" value="${it.geteDate()}"/>
            <c:set var ="cod" value="${it.getCondition()}"/>
            <c:set var ="rprice" value="${it.getRePrice()}"/>
            <c:set var ="pat" value="${it.getPath()}"/>
            
                <tr>
                    <td>${it.getId()}</td>
                    <td>${it.getName()}</td>
                    <td>${it.getDescription()}</td>
                    <td>${it.getType()}</td>
                    <td>${it.getStartPrice()}</td>
                    <td>${it.geteDate()}</td>
                    <td>${it.getCondition()}</td>
                    <td>${it.getRePrice()}</td>
                    <td><img src="images/${it.getPath()}" width="48" alt="image.jpg"></td>
                    <td class="action-buttons">
                    	<div class="button-container">
	                    <c:url value ="updateItem.jsp" var="itemUpdate">
	                    	<c:param name="id" value="${id}"/>
	                    	<c:param name="name" value="${name}"/>
	                    	<c:param name="des" value="${des}"/>
	                    	<c:param name="typ" value="${typ}"/>
	                    	<c:param name="sprice" value="${sprice}"/>
	                    	<c:param name="date" value="${date}"/>
	                    	<c:param name="cond" value="${cod}"/>
	                    	<c:param name="rprice" value="${rprice}"/>
	                    	<c:param name="path" value="${pat}"/>
	                    </c:url>
	                        <a href="${itemUpdate}"><button class="update">Update</button></a>
	                    <c:url value ="deleteItem.jsp" var="itemDelete">
	                    	<c:param name="id" value="${id}"/>
	                    	<c:param name="name" value="${name}"/>
	                    	<c:param name="des" value="${des}"/>
	                    	<c:param name="typ" value="${typ}"/>
	                    	<c:param name="sprice" value="${sprice}"/>
	                    	<c:param name="date" value="${date}"/>
	                    	<c:param name="cond" value="${cod}"/>
	                    	<c:param name="rprice" value="${rprice}"/>
	                    	<c:param name="path" value="${pat}"/>
	                    </c:url>
	                        <a href="${itemDelete}"><button class="delete">Delete</button></a>
                        </div>
                     </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
