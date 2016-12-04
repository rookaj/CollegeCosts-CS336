<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choosing the Right College For You</title>
</head>
<body>
<% out.println("CS336 Project on College Costs"); %>								  
<br>
<form action="schools.jsp">
    <input type="submit" value="Search for Schools" />
</form>
<br>
<form action="athletics.jsp">
    <input type="submit" value="Search for Athletic Programs" />
</form>
<br>
<form action="jobs.jsp">
    <input type="submit" value="View Job Outlook Info" />
</form>
<br>
<%out.println("Rate this site's effectiveness"); %>
<br>
	<form method="post" action="submitReview.jsp">
	<table>
	<tr>    
	<td>Name:</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Score:</td><td><select name="score" size=1>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select></td>
	</tr>
	<tr>
	<td>Comment(150 char max):</td><td><input type="text" name="comment"></td>
	</tr>
	</table>
	<input type="Submit" value="submit">
	</form>
<br>
</body>
</html>