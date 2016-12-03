<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Athletic Program Info</title>
</head>
<body>
	

<br>
<div>
	<% out.println("Search For Schools with Athletic Programs by Name: "); %>
	<br>
	<form method="get" action="sportSchoolSearch.jsp" enctype=text/plain>
	  <input type="text" name="name"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
<br>
<div>
	<% out.println("Find Schools with Athletic Programs in Your State(By Abbreviation): "); %>
	<br>
	<form method="get" action="sportStateSearch.jsp" enctype=text/plain>
	  <input type="text" name="state"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
<div>
	<% out.println("Search Schools with Athletic Programs by General Information Unit ID: "); %>				  
	<br>
	<form method="get" action="sportIDSearch.jsp" enctype=text/plain>
	  <input type="text" name="id"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
</body>
</html>