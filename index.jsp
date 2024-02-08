<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.List"%>
<%@ page import="com.BidingSystem.prasad.Pitem"%>
<%@ page import="com.BidingSystem.prasad.itemDBUtil"%>

<%
List<Pitem> items = itemDBUtil.getItemDetails();
String username = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<title>Bidding System</title>



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
				    <a 
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


	<main>
		<section id="featured-auctions">
			<div class="search-bar">
				<input type="text" id="search-input" placeholder="Search for items">
				<button id="search-button">Search</button>
			</div>
		</section>
			<div class="container">
            <%
            for (Pitem item : items) {
            %>
            <div class="card">
                <h2 class="card-title"><%=item.getName()%></h2>
                <p><img src="images/<%=item.getImage()%>" width="100%" height="100%" alt="Item Image"></p>
                <p><b>Type: </b><%=item.getType()%></p>
                <p><b>SellerID: </b><%=item.getCusid()%></p>
                <p><b>Description: </b><%=item.getDesc()%></p>
                <p><b>Condition: </b><%=item.getCondition()%></p>
                <p><b>Highest Price: </b><%=item.getRePrice()%>0</p>
                <p><b>Remaining Time: </b><span id="countdown_<%=item.getId()%>"  style="color:red;"></span></p>
                <p><b>Current Bid Price: </b><a style="background-color:yellow; color:black;"><%=item.getStartBid()%>0</a></p>
                <p><a href="biding.jsp?itemId=<%=item.getId()%>"><input type="button" name="submit" value="BID NOW" class="bid-button"></a></p>

            </div>
     
            <%
                 }
                 %>
        </div>
		<script>
			  // Function to update the countdown for a specific item
			  function updateCountdown(endTime, elementId) {
			    const now = new Date().getTime();
			    const distance = new Date(endTime) - now;
			
			    // Calculate days, hours, minutes, and seconds
			    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
			    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			    const seconds = Math.floor((distance % (1000 * 60)) / 1000);
			
			    // Display the countdown
			    document.getElementById(elementId).innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
			
			    // Update the countdown every 1 second
			    if (distance > 0) {
			      setTimeout(function () {
			        updateCountdown(endTime, elementId);
			      }, 1000);
			    } else {
			      document.getElementById(elementId).innerHTML = "EXPIRED";
			    }
			  }
			
			  // Loop through items and update countdown for each
			  <%for (Pitem item : items) {%>
			  updateCountdown("<%= item.getEndDate() %>", "countdown_<%= item.getId() %>");
			  <%
			  }
			  %>
		</script>

	</main>
	
	 <c:forEach var="cus" items="${cusDetails}">
	
	        <c:set var="id" value="${cus.id}"/>
			<c:set var="fname" value="${cus.getFirstName()}"/>
			<c:set var="lname" value="${cus.getLastName()}"/>
			<c:set var="email" value="${cus.getEmail()}"/>
			<c:set var="phone" value="${cus.getPhone()}"/>
	</c:forEach>

	<footer>
		<p>&copy; 2023 Bidding System</p>
	</footer>
</body>
</html>