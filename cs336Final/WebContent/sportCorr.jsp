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
			String item = request.getParameter("query");
			String str = "";
			String query = "";
			if(item.equals("division_tuition")) {
				str = "SELECT avg(b.TUITIONFEE_IN) as avg, b.ClassificationName as ncaa FROM (SELECT s.TUITIONFEE_IN, a.ClassificationName FROM schoolData s, athleticprograms a WHERE a.UNITID = s.UNITID) as b GROUP BY b.ClassificationName";
				query = "View the average tuition cost for each NCAA Division";
			} else if(item.equals("womenAid_menAid")) {
				str = "SELECT avg((WomensTeamAthleticStudentAid/UnduplicatedCountWomensParticipation)) as avgW, avg(MensTeamAthleticStudentAid/UnduplicatedCountMensParticipation) as avgM, ClassificationName FROM athleticprograms GROUP BY ClassificationName";
				query = "Compare the amount of athletic scholarships given per male athlete and female athlete";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if(item.equals("division_tuition")) {
				//Make an HTML table to show the results in:
				out.print("<h4>As you can see, there appears to be no link between NCAA division and tuition rates.</h4>");
				out.print("<table class=\"table table-striped table-bordered\">");
				out.print("<thead>");
				out.print("<tr>");
					out.print("<th>");
						out.print("NCAA Division");
					out.print("</th>");
					out.print("<th>");
						out.print("Average Tuition Fee");
					out.print("</th>");
				out.print("</tr>");
				out.print("</thead>");
				//parse out the results
				while (result.next()) {
					out.print("<tr>");
					out.print("<td>");
						out.print(result.getString("ncaa"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("avg"));
					out.print("</td>");
					out.print("</tr>");
				}
				out.print("</table>");
			} else if(item.equals("womenAid_menAid")) {
				//Make an HTML table to show the results in:
				out.print("<h4>Interestingly, the majority of divisions give more aid to female athletes than male-the main exception being Division 1-A, which are the principal football schools</h4>");
				out.print("<table class=\"table table-striped table-bordered\">");
				out.print("<thead>");
				out.print("<tr>");
					out.print("<th>");
						out.print("NCAA Division");
					out.print("</th>");
					out.print("<th>");
						out.print("Average Aid for Male Athletes");
					out.print("</th>");
					out.print("<th>");
						out.print("Average Aid for Female Athletes");
					out.print("</th>");
				out.print("</tr>");
				out.print("</thead>");
				//parse out the results
				while (result.next()) {
					out.print("<tr>");
					out.print("<td>");
						out.print(result.getString("ClassificationName"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("avgM"));
					out.print("</td>");
					out.print("<td>");
						out.print(result.getString("avgW"));
					out.print("</td>");
					out.print("</tr>");
				}
				out.print("</table>");
			}


			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>