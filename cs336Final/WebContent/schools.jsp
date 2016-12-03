<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Info</title>
</head>
<body>
	

<br>
<div>
	<% out.println("Search For Schools By Name: "); %>				  
	<br>
	<form method="get" action="nameSearch.jsp" enctype=text/plain>
	  <input type="text" name="name"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
<br>
<div>
	<% out.println("Find Schools in Your State: "); %>				  
	<br>
	<form method="get" action="stateSearch.jsp" enctype=text/plain>
	  <input type="text" name="state"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
<div>
	<% out.println("Find Schools By General Information Unit ID: "); %>				  
	<br>
	<form method="get" action="unitIDSearch.jsp" enctype=text/plain>
	  <input type="text" name="id"/>
	  <br>
	  <input type="submit" value="submit" />
	</form>
</div>
</body>
</html>