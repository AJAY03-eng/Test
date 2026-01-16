<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD Students</title>
</head>
<body>
<h2>Add Student</h2>

<h3> ${succ} </h3>
<form action="add" method="post">
 StudentID:<input type="studentid" name="studentid" id="studentid" required><br><br>
 name:<input type="name" name="name" id="name" required><br><br>
 email:<input type="email" name="email" id="email" required><br><br>
 phone:<input type="phone" name="phone" id="phone" required><br><br>
Standard:<input type="standard" name="standard" id="standard" required><br><br>
 Address:<input type="address" name="address" id="address" required><br><br>
 <button input type="Submit" >Submit</button>
 
 
 <a href="list.jsp">Student list</a>

</form>

</body>
</html>