<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login page</title>
<link rel="stylesheet" href="css/Log.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">


<script src="https: //kit.fontawesome.com/c9f5871d83.js"
	crossorigin="anonymous"></script>


</head>
<body>
	<header>
		<h1>Welcome to the Bidding System</h1>
	</header>

	<div class="navigation">
		<ul>
			<li><a href="index.jsp" >Home</a></li>
			<li><a href="auctions.jsp">ContactUs</a></li>
			<li><a href="Reg.jsp" class="active">Login</a></li>
		</ul>
	</div>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="background"></div>
	<form method="post" action="LoginServlet" class="register-form"
		id="login-form">
		<section class="home">
			<div class="content">

				<h2>
					Welcome! <br>To Our Website
				</h2>

				<pre>
					<center>A Complete solution for managing online auctions, <br>selling products and bids</center>
				</pre>

			</div>

			<div class="login">
				<h2>Sign In</h2>
				<div class="input">
					<input type="text" id="username" name="username" class="input1"
						placeholder="UserName" required> <i
						class="fa-solid fa-envelope"></i><br>
				</div>

				<div class="input">
					<input type="password" id="password" name="password" class="input1"
						placeholder="Password" required> <i
						class="fa-solid fa-lock"></i>
				</div>
				<br>
				<div class="check">
					<label> <input type="checkbox" > Remember
						me
					</label>

				</div>

				<div class="button">
					<button class="btn">Sign In</button>
				</div>

				<div class="sign-up">
					<p>
						Don't have an account? <a href="Reg.jsp"> Sign up</a>
					</p>
				</div>
			</div>
		</section>
	</form>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Wrong Username or Password", "failed");
		}
	</script>
	<footer>
		<p>&copy; 2023 Bidding System</p>
	</footer>
</body>
</html>