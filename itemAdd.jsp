<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String username = (String) session.getAttribute("name");
	String uid = (String) session.getAttribute("cusId");
%>
<!DOCTYPE html>
<html>
<head>
	
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	 <link rel="stylesheet" href="css/itemAdd.css">
		
    <meta charset="UTF-8">
    <title>Add Item to Bidding Website</title>
   
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
            
            	<a href="itemAdd.jsp" class="active">Add Item</a>
            	
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

    <div class="container">
        <h1>Add Item to Your List</h1>
        <form action="itemAddServlet" method="post" enctype="multipart/form-data" id="itemForm">
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" id="itemName" name="itemName" required>
            </div>
            <div class="form-group">
                <label for="itemDescription">Item Description</label>
                <textarea id="itemDescription" name="itemDescription" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="itemType">Item Type</label>
                <select id="itemType" name="itemType" required>
                    <option value="electronic">Electronic</option>
                    <option value="clothing">Clothing</option>
                    <option value="furniture">Furniture</option>
                    <option value="Toys">Toys</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="startingBid">Starting Bid</label>
                <input type="number" id="startingBid" name="startingBid" required oninput="validatePrices()">
            </div>
            <div class="form-group">
                <label for="biddingEndDate">Bidding End Date</label>
                <input type="datetime-local" id="biddingEndDate" name="biddingEndDate" required oninput="validateDateTime()">
                <span id="dateTimeError" style="color: red;"></span>
            </div>
            <div class="form-group">
                <label for="itemCondition">Item Condition</label>
                <select id="itemCondition" name="itemCondition" required>
                    <option value="new">New</option>
                    <option value="used">Used</option>
                    <option value="refurbished">Refurbished</option>
                </select>
            </div>
            <div class="form-group">
                <label for="reservedPrice">Reserved Price</label>
                <input type="number" id="reservedPrice" name="reservedPrice" oninput="validatePrices()">
                <span id="priceError" style="color: red;"></span>
            </div>
            <div class="form-group">
                <label for="itemPhoto">Item Photo</label>
                <input type="file" name="itemPhoto" id="itemPhotoInput" accept="image/*">
                <img id="itemPhotoPreview" src="" alt="Default Image" style="max-width: 200px; display: none;">
            </div>
            <button type="submit">Add Item</button>
        </form>
    </div>
	<script>
		function validateDateTime() {
			var biddingEndDate = new Date(document
					.getElementById("biddingEndDate").value);
			var now = new Date();

			if (biddingEndDate <= now) {
				document.getElementById("dateTimeError").innerHTML = "Please select a future date and time.";
				document.getElementById("itemForm").querySelector("button").disabled = true;
			} else {
				document.getElementById("dateTimeError").innerHTML = "";
				document.getElementById("itemForm").querySelector("button").disabled = false;
			}
		}
		function validatePrices() {
			var startingBid = parseFloat(document.getElementById("startingBid").value);
			var reservedPrice = parseFloat(document
					.getElementById("reservedPrice").value);

			if (reservedPrice <= startingBid) {
				document.getElementById("priceError").innerHTML = "Reserved Price must be greater than Starting Bid.";
				document.getElementById("itemForm").querySelector("button").disabled = true;
			} else {
				document.getElementById("priceError").innerHTML = "";
				document.getElementById("itemForm").querySelector("button").disabled = false;
			}
		}

		const itemPhotoInput = document.getElementById('itemPhotoInput');
		const itemPhotoPreview = document.getElementById('itemPhotoPreview');

		itemPhotoInput.addEventListener('change', function() {
			if (itemPhotoInput.files && itemPhotoInput.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					itemPhotoPreview.src = e.target.result;
					itemPhotoPreview.style.display = 'block';
				};
				reader.readAsDataURL(itemPhotoInput.files[0]);
			} else {
				itemPhotoPreview.style.display = 'none';
			}
		});
	</script>

</body>
</html>