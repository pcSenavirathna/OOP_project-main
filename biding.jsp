<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="com.BidingSystem.prasad.Pitem"%>
<%@ page import="com.BidingSystem.prasad.itemDBUtil"%>

<%
String itemIdParam = request.getParameter("itemId");
int itemId = Integer.parseInt(itemIdParam);


List<Pitem> items = itemDBUtil.getItemDetail(itemId);


if (items.size() > 0) {
    Pitem item = items.get(0);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bid Now</title>
    
    <link rel="stylesheet" type="text/css" href="css/biding.css">
    
</head>
<body>
    <div class="card">
        <h1><%= item.getName() %></h1>
		<p><img src="images/<%= item.getImage() %>" width="100%" height="100%" alt="Item Image"></p>
        <p>Item Description: <%= item.getDesc() %></p>
        <p>Item Condition: <%= item.getCondition() %></p>
       <p><b>Remaining Time: </b><span id="countdown_<%=item.getId()%>"  style="color:red;"></span></p>
 		 <p>Current Bid: <%= item.getStartBid() %>0</p>
        
        <form action="bid" method="post">
		    <input type="hidden" name="itemId" value="<%= item.getId() %>">
		    <label for="bidAmount">Bid Amount:</label>
		    <input type="number" name="bidAmount" value="<%= item.getStartBid() %>0" min="<%=item.getStartBid() + 1.00%>" max="<%= item.getRePrice()%>" required><br>
		   
		   <input type="hidden" name="itname" value="<%= item.getName() %>">
		   <input type="hidden" name="itprice" value="<%= item.getStartBid() %>">
		   
		   
		    <input type="submit" name="submit" value="Submit Bid">
		</form>
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
  <% for (Pitem currentItem : items) { %>
    updateCountdown("<%= currentItem.getEndDate() %>", "countdown_<%= currentItem.getId() %>");
  <% } %>
</script>

    
</body>
</html>

<%
} 
%>
