<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String username = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" href="css/header.css">
		<link rel="stylesheet" href="css/footer.css">
		<link rel="stylesheet" href="css/admin.css">
		
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
	

<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome to the Admin Dashboard</h1>
		<div class="boxes">
			<div class="box1">
				<div class="chutibox1"><h3>USER PROFILE</h3></DIV>
				<div class="chutiimage"><img src="images/r6.jpeg" height="200px" width="235px"></div><br>
				<center><button class="button" style="vertical-align:middle" onclick='window.location.href="view_record.jsp";'><span>MANAGE</span></button></center>
			</div>
			<div class="box2">
				<div class="chutibox2"><h3>FEEDBACK</h3></DIV>
				<div class="chutiimage2"><img src="images/r5.jpeg" height="200px" width="235px"></div><br>
				<center><button class="button2" style="vertical-align:middle" onclick='window.location.href="feedback_view.jsp";'><span>MANAGE</span></button></center>
			</div>
		</div>	
</body>
</html>
	
	
