<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Outlook Info</title>
</head>
<body>
	<% out.println("Hello World"); %>

<br>
<div>
	<% out.println("Display Average Wages per State: "); %>								  
	<br>
	<form action="stateWages.jsp" enctype=text/plain>
	  <input type="submit" value="Average Wages by State" />
	</form>
</div>
<div>
	<% out.println("Compare Average Wage to Average 10 year Post-Grad Wages: "); %>
	<br>
	<form method="get" action="show.jsp" enctype=text/plain>
	  <input type="radio" name="command" value="beers"/>Let's have a beer!
	  <br>
	  <input type="radio" name="command" value="bars"/>Let's go to a bar!
	  <br>
	  <input type="submit" value="submit" />
	</form>

</div>

</body>
</html>