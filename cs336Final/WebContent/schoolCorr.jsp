<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analytics Results</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">College Costs</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="schools.jsp">Search Schools</a></li>
      <li><a href="athletics.jsp">Search Athletic Programs</a></li>
      <li><a href="jobs.jsp">Search Job Outlook</a></li>
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
			if(item.equals("admRate_tuitFee")) {
				str = "SELECT (sum((c.ADM_RATE - b.avgAdmRate) * (c.TUITIONFEE_IN - b.avgTuit)) / ((b.coun -1)*(b.stdAdmRate *b.stdTuit))) as corr FROM schoolData c, (SELECT AVG(a.ADM_RATE) as avgAdmRate, AVG(a.TUITIONFEE_IN) as avgTuit, count(a.ADM_RATE) as coun, std(a.ADM_RATE) as stdAdmRate, std(TUITIONFEE_IN) as stdTuit FROM schoolData a WHERE a.ADM_RATE <> 0 AND a.TUITIONFEE_IN <> 0) as b WHERE ADM_RATE <> 0 AND TUITIONFEE_IN <> 0;";
				query = "Is there a correlation between admission rate and tuition fee?";
			} else if(item.equals("admRate_SATAvg")) {
				str = "SELECT (sum((c.ADM_RATE - b.avgAdmRate) * (c.SAT_AVG - b.avgTuit)) / ((b.coun -1)*(b.stdAdmRate *b.stdTuit))) as corr FROM schoolData c, (SELECT AVG(a.ADM_RATE) as avgAdmRate, AVG(a.SAT_AVG) as avgTuit, count(a.ADM_RATE) as coun, std(a.ADM_RATE) as stdAdmRate, std(SAT_AVG) as stdTuit FROM schoolData a WHERE a.ADM_RATE <> 0 AND a.SAT_AVG <> 0) as b WHERE ADM_RATE <> 0 AND SAT_AVG <> 0;";
				query = "Is there a correlation between admission rate and SAT average?";
			} else if(item.equals("tuitFee_SATAvg")) {
				str = "SELECT (sum((c.TUITIONFEE_IN - b.avgTuit) * (c.SAT_AVG - b.avgsat)) / ((b.coun -1)*(b.stdTuit *b.stdsat))) as corr FROM schoolData c, (SELECT AVG(a.TUITIONFEE_IN) as avgTuit, AVG(a.SAT_AVG) as avgsat, count(a.TUITIONFEE_IN) as coun, std(a.TUITIONFEE_IN) as stdTuit, std(SAT_AVG) as stdsat FROM schoolData a WHERE a.TUITIONFEE_IN <> 0 AND a.SAT_AVG <> 0) as b WHERE TUITIONFEE_IN <> 0 AND SAT_AVG <> 0;";
				query = "Is there a correlation between tuition fee and SAT average?";
			} else if(item.equals("pGradEarn_SATAvg")) {
				str = "SELECT (sum((c.MN_EARN_WNE_P10 - b.avgearn) * (c.SAT_AVG - b.avgsat)) / ((b.coun -1)*(b.stdearn *b.stdsat))) as corr FROM schoolData c, (SELECT AVG(a.MN_EARN_WNE_P10) as avgearn, AVG(a.SAT_AVG) as avgsat, count(a.MN_EARN_WNE_P10) as coun, std(a.MN_EARN_WNE_P10) as stdearn, std(SAT_AVG) as stdsat FROM schoolData a WHERE a.MN_EARN_WNE_P10 <> 0 AND a.SAT_AVG <> 0) as b WHERE c.MN_EARN_WNE_P10 <> 0 AND c.SAT_AVG <> 0;";
				query = "Is there a correlation between 10yr post-grad wages and SAT average?";
			} else if(item.equals("gradDebt_tuitFee")) {
				str = "SELECT (sum((c.GRAD_DEBT_MDN_SUPP - b.avgdebt) * (c.TUITIONFEE_IN - b.avgTuit)) / ((b.coun -1)*(b.stddebt *b.stdTuit))) as corr FROM schoolData c, ( SELECT AVG(a.GRAD_DEBT_MDN_SUPP) as avgdebt, AVG(a.TUITIONFEE_IN) as avgTuit, count(a.GRAD_DEBT_MDN_SUPP) as coun, std(a.GRAD_DEBT_MDN_SUPP) as stddebt, std(TUITIONFEE_IN) as stdTuit FROM schoolData a WHERE a.GRAD_DEBT_MDN_SUPP <> 0 AND a.TUITIONFEE_IN <> 0) as b WHERE c.GRAD_DEBT_MDN_SUPP <> 0 AND c.TUITIONFEE_IN <> 0;";
				query = "Is there a correlation between average debt upon graduating and tuition fee?";
			} else if(item.equals("SATAvg_pGradEarn")) {
				str = "SELECT (sum((c.SAT_AVG - b.avgsat) * (c.MN_EARN_WNE_P10 - b.avgearn)) / ((b.coun -1)*(b.stdsat *b.stdearn))) as corr FROM schoolData c, (SELECT AVG(a.SAT_AVG) as avgsat, AVG(a.MN_EARN_WNE_P10) as avgearn, count(a.SAT_AVG) as coun, std(a.SAT_AVG) as stdsat, std(MN_EARN_WNE_P10) as stdearn FROM schoolData a WHERE a.SAT_AVG <> 0 AND a.MN_EARN_WNE_P10 <> 0) as b WHERE c.SAT_AVG <> 0 AND c.MN_EARN_WNE_P10 <> 0;";
				query = "Is there a correlation between SAT average and 10yr post-grad wages?";
			} else if(item.equals("tuitFee_pell")) {
				str = "SELECT (sum((c.TUITIONFEE_IN - b.avgtuit) * (c.PCTPELL - b.avgpell)) / ((b.coun -1)*(b.stdtuit *b.stdpell))) as corr FROM schoolData c, (SELECT AVG(a.TUITIONFEE_IN) as avgtuit, AVG(a.PCTPELL) as avgpell, count(a.TUITIONFEE_IN) as coun, std(a.TUITIONFEE_IN) as stdtuit, std(PCTPELL) as stdpell FROM schoolData a WHERE a.TUITIONFEE_IN <> 0 AND a.PCTPELL <> 0) as b WHERE c.TUITIONFEE_IN <> 0 AND c.PCTPELL <> 0;";
				query = "Is there a correlation between tuition fee and percent of students who receive Pell grants?";
			} else if(item.equals("tuitFee_fLoan")) {
				str = "SELECT (sum((c.TUITIONFEE_IN - b.avgtuit) * (c.PCTFLOAN - b.avgfloan)) / ((b.coun -1)*(b.stdtuit *b.stdfloan))) as corr FROM schoolData c, (SELECT AVG(a.TUITIONFEE_IN) as avgtuit, AVG(a.PCTFLOAN) as avgfloan, count(a.TUITIONFEE_IN) as coun, std(a.TUITIONFEE_IN) as stdtuit, std(PCTFLOAN) as stdfloan FROM schoolData a WHERE a.TUITIONFEE_IN <> 0 AND a.PCTFLOAN <> 0) as b WHERE c.TUITIONFEE_IN <> 0 AND c.PCTFLOAN <> 0;";
				query = "Is there a correlation between tuition fee and percent of students who receive federal loans?";
			}

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			result.next();
			float correlation = result.getFloat("corr");
			
			if(correlation >= 0.7 || correlation <= -0.7) {
				out.print("<div class=\"panel panel-success\"><div class=\"panel-heading\"><h4>");
				out.print(query);
				out.print("</h4></div><div class=\"panel-body\"><h5>Correlation: ");
				out.print(result.getString("corr"));
				out.print("</h5><h6>Note: A correlation between greater than 0.7 or less than -0.7 is considered a strong correlation</h6></div></div>");
			} else {
				out.print("<div class=\"panel panel-danger\"><div class=\"panel-heading\"><h4>");
				out.print(query);
				out.print("</h4></div><div class=\"panel-body\"><h5>Correlation: ");
				out.print(result.getString("corr"));
				out.print("</h5><h6>Note: A correlation between greater than 0.7 or less than -0.7 is considered a strong correlation</h6></div></div>");
			}

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>