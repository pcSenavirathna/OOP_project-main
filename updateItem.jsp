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
    <title>Update Item</title>
    <link rel="stylesheet" href="css/updateItem.css">
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
        <h1>Update Item</h1>
        <form action = "updateItemServlet" method = "post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="itemId">Item ID</label>
                <input type="text" name="itId" value="<%= id %>" readonly required>
            </div>
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" name="itName" value="<%= name %>" required>
            </div>
            <div class="form-group">
                <label for="itemDescription">Item Description</label>
                <textarea name="itDescription" rows="4"  required><%= des %></textarea>
            </div>
            <div class="form-group">
                <label for="itemType">Item Type</label>
                <select name="itType" required>
                	<option value="<%= type %>" selected hidden ><%= type %></option>
                    <option value="electronic">Electronic</option>
                    <option value="clothing">Clothing</option>
                    <option value="furniture">Furniture</option>
                    <option value="Toys">Toys</option>
                    <option value="other">Other</option>    
                </select>
            </div>
            <div class="form-group">
				<label for="startingBid">Starting Bid</label> 
				<input type="number" id="startingBid" name="sBid" value="<%= sprice %>" required oninput="validatePrices()">
			</div>
            <div class="form-group">
    		<label for="biddingEndDate">Bidding End Date</label>
    			<input type="datetime-local" id="biddingEndDate" name="bEndDate" value="<%= date %>" required oninput="validateDateTime()">
    			<span id="dateTimeError" style="color: red;"></span>
			</div>
            <div class="form-group">
                <label for="itCondition">Item Condition</label>
                <select name="itemCondition" required>
                	<option value="<%= cond %>" selected hidden><%= cond %></option>
                    <option value="new">New</option>
                    <option value="used">Used</option>
                    <option value="refurbished">Refurbished</option>
                </select>
            </div>
            <div class="form-group">
				<label for="reservedPrice">Reserved Price</label>
				<input type="number" id="reservedPrice" name="reservedPrice" value="<%= rprice %>" oninput="validatePrices()"> 
				<span id="priceError" style="color: red;"></span>
			</div>
            <div class="form-group">
                <label for="itemPhoto">Item Photo</label>
                <input type="file" name="itemPhoto" id="itemPhotoInput" accept="image/*">
                <img id="itemPhotoPreview" src="images/<%= image %>" alt="Default Image" style="max-width: 200px;">
            </div>
            <input type="hidden" name="hiddenField" value="<%= image %>">
            <button type="submit">Update Item</button>
        </form>
    </div>
	<script>
		// JavaScript to update the image when a file is selected
		const itemPhotoInput = document.getElementById('itemPhotoInput');
		const itemPhotoPreview = document.getElementById('itemPhotoPreview');

		itemPhotoInput.addEventListener('change', function() {
			if (itemPhotoInput.files && itemPhotoInput.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					itemPhotoPreview.src = e.target.result;
				};
				reader.readAsDataURL(itemPhotoInput.files[0]);
			}
		});
		
		function validateDateTime() {
			var biddingEndDate = new Date(document
					.getElementById("biddingEndDate").value);
			var now = new Date();

			if (biddingEndDate <= now) {
				document.getElementById("dateTimeError").innerHTML = "Please select a future date and time.";
				document.getElementById("itemForm").querySelector(
						"button").disabled = true;
			} else {
				document.getElementById("dateTimeError").innerHTML = "";
				document.getElementById("itemForm").querySelector(
						"button").disabled = false;
			}
		}
		
		function validatePrices() {
		    var startingBid = parseFloat(document.getElementById("startingBid").value);
		    var reservedPrice = parseFloat(document.getElementById("reservedPrice").value);

		    if (reservedPrice <= startingBid) {
		        document.getElementById("priceError").innerHTML = "Reserved Price must be greater than Starting Bid.";
		        document.getElementById("itemForm").querySelector("button").disabled = true;
		    } else {
		        document.getElementById("priceError").innerHTML = "";
		        document.getElementById("itemForm").querySelector("button").disabled = false;
		    }
		}
	</script>
</body>
</html>

