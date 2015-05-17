<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String frommonth=request.getParameter("frommonth");
String fromday=request.getParameter("fromday");
String fromyear=request.getParameter("fromyear");
String fromdate = frommonth+"/"+fromday+"/"+fromyear;
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
Date from = new Date();
from = sdf.parse(fromdate);

String tomonth=request.getParameter("tomonth");
String todays=request.getParameter("today");
String toyear=request.getParameter("toyear");
String todate = tomonth+"/"+todays+"/"+toyear;
Date to = new Date();
to = sdf.parse(todate);
	
Date dbdate = new Date();	


Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver loaded...");

Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","");
System.out.println("Connected to the database");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM bankingtrans");
ResultSetMetaData rsmd = rs.getMetaData();
System.out.println("before while");

while(rs.next()){
String a2=rs.getString(4);
dbdate = sdf.parse(a2);
 

if(dbdate.after(from) &&  dbdate.before(to)){
	out.println("<table width='100%'><tr><td width='(100/x)%'>"+rs.getString(1)+"</td><td width='(100/x)%'>"+rs.getString(2)+"</td><td width='(100/x)%'>"+rs.getString(3)+"</td><td width='(100/x)%'>"+rs.getString(4)+"</td></tr></table>");
	
}}




%>

</body>
</html>