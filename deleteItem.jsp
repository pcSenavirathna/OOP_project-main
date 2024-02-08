<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%

String username = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/header.css">
    <meta charset="UTF-8">
    <title>Delete Item</title>
    <link rel="stylesheet" href="css/deleteItem.css">
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
            
            	<a href="reBtn.jsp" class="active">View Item</a>
            	
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

	<%
	
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String des = request.getParameter("des");
	String type = request.getParameter("typ");
	String sprice = request.getParameter("sprice");
	String date = request.getParameter("date");
	String cond = request.getParameter("cond");
	String rprice = request.getParameter("rprice");
	String image = request.getParameter("path");
	
	%>

    <div class="container">
        <h1>Want to Delete Item?</h1>
        <form action = "deleteItemServlet" method = "post" >
            <div class="form-group">
                <label for="itemId">Item ID</label>
                <input type="text" name="itId" value="<%= id %>" readonly required>
            </div>
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" name="itName" value="<%= name %>" required readonly>
            </div>
            <div class="form-group">
                <label for="itemDescription">Item Description</label>
                <textarea name="itDescription" rows="4"  required readonly><%= des %></textarea>
            </div>
            <div class="form-group">
                <label for="itemType">Item Type</label>
                 <input type="text" name="itType" value="<%= type %>" readonly required>
            </div>
            <div class="form-group">
                <label for="startingBid">Starting Bid</label>
                <input type="text" name="sBid"  value="<%= sprice %>" required readonly>
            </div>
            <div class="form-group">
                <label for="biddingEndDate">Bidding End Date</label>
                <input type="text" name="itName" value="<%= date %>" required readonly>
            </div>
            <div class="form-group">
                <label for="itCondition">Item Condition</label>
                 <input type="text" name="itCondition" value="<%= cond %>" readonly required>
            </div>
            <div class="form-group">
                <label for="rPrice">Reserved Price</label>
                <input type="text" name="reservedPrice" value="<%= rprice %>" readonly >
            </div>
            <div class="form-group">
                <label for="itemPhoto">Item Photo</label>
                <img src="images/<%= image %>" width="600" alt="image.jpg">
            </div>
            <button type="submit">Delete Item</button>
        </form>
    </div>
</body>
</html>

