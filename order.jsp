<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>


* {
  box-sizing: border-box;
}

body{
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
}      

header {
    background-color: #333;
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
   
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    padding: 10px;
}

nav li {
    margin: 0 15px;
}

nav a {
    color: #fff;
    text-decoration: none;
}

ul li a.active{
	color: orange;
}

a:hover{
	color: orange;
}




* {
  box-sizing: border-box;
}

.paymentbox{
  display: flex;
  background-color: rgb(231, 231, 231);
  box-shadow: 0px 2px 2px rgba(0,0, 0, 0.60);
  margin-top: 20px;
  margin-left: 30px;
  width: 1250px;
  height: 600px;
  padding: 0px;
}
.paymentrigntside{
   margin-top: 10px;
   margin-left: 30px;

}

.paymentrigntside input[type=text],[name=text]
{
    height: 35px;
    width: 400px;
    margin-left: 0px;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 20px;
    padding: 10px;
}


.paymentleftside{
    margin-left: 0px;
    margin-top: 2px;
    background-color: #f5f5f5;
    width: 470px;
    height: 500px;
    padding-left: 20px;
    padding-top: 10px;
    
}

.paymentleftside input[type=text]
{
     height: 35px;
     width: 400px;
    margin: 10px;
    padding: 10px;
    
}

img{
    width: 150px;
    height: 50px;
}
.sortbox input[type=text] 
{
 
 width: 100px;
}

.payment_button{
     height: 45px;
     width: 260px;
     margin-left: 0px;
     margin-top: 40px;
    padding: 10px;
    background: rgb(255, 166, 0);
     color: white;
     border: none;
     outline: none;
     cursor: pointer;
     font-size: 20px;
     border-radius: 5px;
}
.payment_button:hover{
     /*background: #2c3e50;*/
     background: rgb(13, 92, 105);
}
.paymenth1{
    font-size: 25px;
    text-align: left;
    color: #000;
    margin-bottom: 20px;
}
.paymenth2{
 font-size: 25px;
 text-align: left;
 color: #000;
 margin-bottom: 20px;
 margin-top: 20px;
}
.haedingbox{
 display: flex;
 position: relative;
 margin-bottom: -20px;

}
.paymentrigntside .rightheading{
 margin-left: 100px;
}
.middleheading{
 margin-left: 70px;
}
.paymentleftside .rightheading{
    margin-left: 100px;
}

.summary{
    display:block;
    position: absolute;
    background-color: rgb(255, 255, 255);
    margin-left: 930px;
    margin-top: 2px;
    width: 320px;
    height: 500px;
    padding-left: 30px;
    padding-top: 10px;
    padding-right: 30px;

}
@media only screen and (max-width: 770px){
 .paymentbox{
     flex-direction: column;
 }
 body{
     overflow-x: hidden;
 }
}

table {
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto; /* Center the table on the page */
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
        td:last-child {
            text-align: right;
        }
        td:first-child{
            text-align: left;
        }

table.no-border {
    border: none;
    
}


    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Bidding System</h1>
    </header>

    <nav>
        <ul>
            <li><a href="index.jsp" class="active">Home</a></li>
            <li><a href="auctions.jsp">Add Bid</a></li>
            <li><a href="mybids.jsp">My Bids</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
        	
    </nav>


	<!---------update and read user details----------->
 <% if ("true".equals(request.getAttribute("showAlert"))) { %>
    <script>
        alert("Your alert message here");
    </script>
<% } %>
 
    <span style="color: white;background-color: red; display: block; margin: 0 auto; text-align: center;">${showAlert}</span>

    <span style="color: white;background-color: green; display: block; margin: 0 auto; text-align: center;">${payment}</span>


  
   
        
<div class="paymentbox">
    <div class="paymentleftside">
    
<form action="OrderInsert" method="POST">
    
        <h2 class="paymenth1">Shipping Address</h2>
        Name * <br>
        <input type="text" name="name" placeholder="Full Name" > <br>
        Phone * <br>
        <input type="text" name="phone" placeholder="Phone" maxlength="10"> <br>
        Address * <br>
        <input type="text" name="address" placeholder="Address Ex:- NO,Street,Location"> <br>
        City * <br>
        <input type="text" name="city" placeholder="City"> <br>
        <div class="haedingbox">
        <p class ="leftheding">State</p><p class ="rightheading">Zip code *</p>
        </div>
        
        <div class="sortbox">
            <input class="textboxshort" name="state" type="text" placeholder="State">
             <input class="textboxshort" name="zipcode" type="text" placeholder="Zip-Code">
        </div>
    </div>
    <div class="paymentrigntside">
    <h2 class="paymenth2">Payment Method</h2>
    Accepted Card <br> <br> 
	<img src="images\card.png"><img src="images\pp.png" style="width: 80px; height: 50px; margin-left: 5px;"><br> <br>
    Card number <br>
        <input type="text" name="cardnum" placeholder="Enter Card Number" maxlength="12"><br>
        Card holder Name <br>
        <input type="text" name="cardname" placeholder="Enter Name"><br>
        
        <div class="haedingbox">
        <p class ="leftheding">Exp month </p><p class ="middleheading">Exp year </p><p class ="rightheading">CVV </p>
        </div>
        <div class="sortbox">
        <select name="month" id="months">
            <option value="Jan">Jan</option>
            <option value="Feb">Feb</option>
            <option value="Mar">Mar</option>
            <option value="Apr">Apr</option>
            <option value="May">May</option>
            <option value="Jun">Jun</option>
            <option value="Jul">Jul</option>
            <option value="Aug">Aug</option>
            <option value="Sep">Sep</option>
            <option value="Oct">Oct</option>
            <option value="Nov">Nov</option>
            <option value="Dec">Dec</option>
          </select>   
          
          <select name="year" id="years">
            <option value="2020">2020</option>
            <option value="2019">2019</option>
            <option value="2018">2018</option>
            <option value="2017">2017</option>
            <option value="2016">2016</option>
            <option value="2015">2015</option>
          </select>
          
          <input style="margin-left: 50px;" type="text" name="cvv" placeholder="CVV" maxlength="3"> <br>

    </div> 


     
    </div>
    <div class="summary">
        <h2>Payment Summary</h2>
        <hr>
        <p>Please revew the following details for this transaction.</p>

        <table>
            <tr>
                <td>Subtotal</td>
                <td>Rs.2500.00</td>
            </tr>
            <tr>
                <td>Tax</td>
                <td>0</td>
            </tr>
            <tr>
                <td>Shipping</td>
                <td>free</td>
            </tr>
        </table>
        <br>
        <hr>

 
            <h4 style="display: inline;">Total</h4>
            <h4 style="display: inline; margin-left: 135px;">Rs.2500.00</h4>
        	

        
        <a href="landTable"><button  class="payment_button">Order Now</button></a>
		
  </form>
        
       
    </div>


</div>


</body>
</html>
    