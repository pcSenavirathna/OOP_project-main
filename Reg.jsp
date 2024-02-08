<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>RegistrationForm</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

<!-- STYLE CSS -->
<link rel="stylesheet" href="css/Reg.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
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

	<div class="wrapper" style="background-image: url('images/r1.jpeg');">
		<div class="inner">
			<form method="post" action="register" class="register-form"
				id="register-form">
				<h3>Registration Form</h3>

				<div class="form-wrapper">
					<label for="name">First Name</label> <input type="text" name="fname"
						class="form-control" required>
				</div>
				<div class="form-wrapper">
					<label for="name">Last Name</label> <input type="text" name="lname"
						class="form-control" required>
				</div>

				<div class="form-wrapper">
					<label for="email">Email</label> <input type="email" name="email"
						class="form-control" required>
				</div>
				<div class="form-wrapper">
					<label for="pass">Password</label> <input type="password"
						name="pass" class="form-control" required>
				</div>
				<div class="form-wrapper">
					<label for="re_pass">Confirm Password</label> <input
						type="password" name="re_pass" class="form-control" required>
				</div>
				<div class="form-wrapper">
					<label for="contact">Contact Number</label> <input type="text"
						name="contact" class="form-control" maxlength="10" minlength="10" required>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" required> I accept
						the Terms of Use & Privacy Policy. <span class="checkmark"></span>
					</label>
				</div>

				<button>Register Now</button>
				<br>
				<center>
					<a href="Log.jsp" class="signup-image-link">I am already member</a>
				</center>
			</form>
		</div>
	</div>

	<footer>
		<p>&copy; 2023 Bidding System</p>
	</footer>
</body>
</html>