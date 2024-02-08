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
<html lang="en">
<head>
	<link rel="stylesheet" href="css/Vw.css">
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
    background-color: #505050;
    color: #fff;
    text-align: center;
    padding: 20px;
    margin-bottom: -15px;
}

h1{
	font-size: 250%;
	color: orange;
}

nav {
    background-color: #444;
    margin-bottom: -15px;
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
  box-shadow: 0px 2px 2px rgba(0,0, 0, 0.60);  
  position: absolute;
  margin: 0;
  padding: 0;
  width: 220px;
  background-color: #ffffff;
  height: 555px;
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



.paymentbox h2{
    position: absolute;
    text-align: center;
    color: orange;
    padding-left: 80px;
    padding-top: 20px;

}

.paymentbox{
  position: absolute;
  background-color: white;
  box-shadow: 0px 2px 2px rgba(0,0, 0, 0.60);
  margin-bottom: 100px;
  margin-top: 25px;
  margin-left: 250px;
  border-radius: 10px;
  width: 1020px;
  height: 530px;
}

.paymentleftside{
    margin-left: 500px;
    margin-right: 40px;
    margin-top: 80px;
    margin-bottom: 40px;
}

.paymentleftside input[type=text]
{
     height: 40px;
     width: 400px;
    margin: 10px;
    padding: 10px;
    

}
input[name=update] {
  background-color: #E3B830;
  color: black;
  padding: 16px 20px;
  margin-left: 50px;
  margin-top: 10px;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
  font-size: 20px;
  border-radius: 10px;
  transition-duration: 0.2s;

}
.delete_button{
    position: absolute;
     z-index: 1;
    height: 50px;
     width: 200px;
     margin-top: 420px;
    margin-left: 100px;
    padding: 10px;
    background: #be0000;
     color: white;
     border: none;
     outline: none;
     cursor: pointer;
     font-size: 20px;
     border-radius: 5px;
}

.delete_button:hover{
     background: black;
}
.update_button{
     height: 50px;
     width: 400px;
     margin: 10px;
    padding: 10px;
    background: #E3B830;
     color: white;
     border: none;
     outline: none;
     cursor: pointer;
     font-size: 20px;
     border-radius: 5px;
}
.update_button:hover{
     background: #2c3e50;
}
.paymenth1{
    font-size: 25px;
    text-align: left;
    color: #000;
    margin-bottom: 20px;
}

.haedingbox{
 display: flex;

}
.rightheading{
 margin-left: 190px;
}

.profilepic{
    position: absolute;
    width: 300px;
    height: 600px;
    margin-top: 100px;
    margin-left: 100px;
}

.profilepic img{

    width: 200px;
    height: 200px;
}

    </style>
</head>
<body>
	<%
	String funame = request.getParameter("fname");
	String luname = request.getParameter("lname");
	String email = request.getParameter("email");
	String mobile = request.getParameter("phone");
	
	
	%>
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
        <a class="active" href="#home">My Bid</a>
        <a href="myOrder.jsp">My orders</a>
        <a href="#about"></a>
      </div>
            
	<!---------update and read user details----------->
        
 
   <span style="color: white;background-color: red; display: block; margin: 0 auto; text-align: center;">${showAlert}</span>


        <div class="paymentbox">
            <table class="table">
        <thead>
            <tr>
                <th scope="col">ItemID</th>
                <th scope="col">Item Name</th>
                <th scope="col">Biding Amount</th>
                <th scope="col">Status</th>     
                <th scope="col">Claim</th>
               
               <tr align="center">
                
                <td>44</td>
                <td>Iphone 11</td>
                <td>180000</td>
                <td Style="color:green;">WIN</td>
                <td>
                    <form action="order.jsp" method="post">
                        <input type="hidden" name="id" value="">
                        <input type="submit" value="Ordr Now" class="btn-danger" onclick="showAlert('Feedback deleted successfully');">
                    </form>
                </td>
            </tr>  
            </tr>
        </thead>


            
        
        </div>

  


			<!--	<form action="#" method="POST">
				<input type="submit" name="delete" class="ubtn" value="Delete Account">
			    </form>-->

</body>
</html>
     