<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.* "%>
    <%@page import="java.sql.Statement" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.DriverManager" %>
	<%@page import="java.sql.Connection" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/update.css">
<style>
body {
 background-image: url('r2.jpg'); 
    background-size:cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    font-family: Arial, sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
    animation: fadeIn 1s ease-in-out;
    animation: PAnimation 1s forwards;
}

@keyframes PAnimation {
    0% {
        opacity: 0;
        transform: scale(0.9);
    }
    100% {
        opacity: 1;
        transform: scale(1);
    }
}

.upcont {
   background-color: rgba(255, 255, 255, 0.9);
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    width: 600px;
    max-width: 500px;
    margin: 0 auto;
    margin-top: 50px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    animation: slideIn 1s ease-in-out;

}

h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
select,
textarea {
    width: 90%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    background-color:  rgb(104, 134, 154);
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color:  rgb(74, 104, 124);
}
@keyframes slideIn {
    from {
        transform: translateY(-50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes fadeIn {
    from {
       
        opacity: 0;
    }
    to {
        
        opacity: 1;
    }
}
</style>
	<div class="wrapper" style="background-image: url('images/r1.jpeg');"></div>
</head>
<body>
<div class = "upcont">
<h2>Update Profile</h2>
<%
	String u = request.getParameter("u");
	Integer ID = Integer.parseInt(u); 
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bidingsystem?characterEncoding=utf8","root","123456");
	Statement statement = connection.createStatement();
	ResultSet resultSet = statement.executeQuery("select * from users where id='"+ID+"'");
%>


<form action="UpdateRecord" method="post">

<%
 while(resultSet.next()){
%>

<div class="from-group"><input type="hidden" class="form-control" name="UID" value=" <% out.print(resultSet.getString("id")); %>"> </div>
<div class = "form-group">
<label for = "name">Name :</label>
<input type="text" class="form-control" name="Uname" value=" <% out.print(resultSet.getString("funame")); %>"> </div><br>
<div class = "form-group">
<label for = "email">Email :</label>
<input type="text" class="form-control" name="UEmail" value=" <% out.print(resultSet.getString("uemail")); %>"> </div>
<br>
<div class = "form-group">
<label for = "mobile">Mobile :</label>
<input type="text" class="form-control" name="UMobile" value=" <% out.print(resultSet.getString("umobile")); %>"> 
</div><br>
<%
 
 }

%>
<div class="card-footer text-center">
	
	<input type="submit" name="submit" value="Update" id="update" class="form-control btn-primary">

</div>
</div>
</form>
<br><br><br>
</body>
</html>