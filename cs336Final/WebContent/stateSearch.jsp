<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CollegeSearch</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="schools.jsp">Search Schools</a></li>
      <li><a href="athletics.jsp">Search Athletic Programs</a></li>
      <li><a href="jobs.jsp">Search Job Outlook</a></li>
      <li><a href="analytics.jsp">Analytics</a></li>
    </ul>
  </div>
</nav>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Create a connection string
			String url = "jdbc:mysql://cs336project.cfvtshahrvco.us-east-1.rds.amazonaws.com:3306/CollegeCosts";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "adminadmin");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String item = request.getParameter("state");
			String str = "SELECT s.UNITID, s.INSTNM, s.CITY, s.STABBR, s.INSTURL, s.ADM_RATE, s.SAT_AVG, s.UGDS, s.TUITIONFEE_IN, s.TUITIONFEE_OUT, s.UGDS_MEN, s.UGDS_WOMEN FROM schoolData s WHERE s.STABBR = ";

			item = "\"" + item + "\"";
			str = str + item;

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table class=\"table table-striped table-bordered\">");
			out.print("<thead>");
			out.print("<tr>");
				out.print("<th>");
					out.print("General Information Unit ID");
				out.print("</th>");
				out.print("<th>");
					out.print("Institution");
				out.print("</th>");
				out.print("<th>");
					out.print("City");
				out.print("</th>");
				out.print("<th>");
					out.print("State");
				out.print("</th>");
				out.print("<th>");
					out.print("URL");
				out.print("</th>");
				out.print("<th>");
					out.print("Admission Rate");
				out.print("</th>");
				out.print("<th>");
					out.print("Average SAT");
				out.print("</th>");
				out.print("<th>");
					out.print("Total Undergraduates");
				out.print("</th>");
				out.print("<th>");
					out.print("In-State Tuition");
				out.print("</th>");
				out.print("<th>");
					out.print("Out-of-State Tuition");
				out.print("</th>");
				out.print("<th>");
					out.print("Percent of Male Students");
				out.print("</th>");
				out.print("<th>");
					out.print("Percent of Female Students");
				out.print("</th>");
			out.print("</tr>");
			out.print("</thead>");
			//parse out the results
			while (result.next()) {
				out.print("<tr>");
				out.print("<td>");
					out.print(result.getString("s.UNITID"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("s.INSTNM"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.CITY"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.STABBR"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.INSTURL"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.ADM_RATE"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.SAT_AVG"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.UGDS"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.TUITIONFEE_IN"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.TUITIONFEE_OUT"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.UGDS_MEN"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.UGDS_WOMEN"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>