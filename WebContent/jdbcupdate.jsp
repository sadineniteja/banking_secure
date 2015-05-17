<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
String vpwd=request.getParameter("vpwd");

String balance=request.getParameter("bal");
int bal = Integer.parseInt(balance);

System.out.println(bal);
String acc=request.getParameter("acc_type");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String month=request.getParameter("month");
String day=request.getParameter("day");
String year=request.getParameter("year");
String dob = month+"/"+day+"/"+year;
String street=request.getParameter("street");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zip=request.getParameter("zip");

if(  fname.length()==0 || lname.length()==0 ||dob.length()==0  ||  month.length()==0 ||day.length()==0 ||year.length()==0 ||street.length()==0 ||city.length()==0 ||state.length()==0 ||zip.length()==0 || (!pwd.equals(vpwd)) || uname.length()==0||pwd.length()==0) {
	out.println("you Need to fill all the contents of the form or the passwords did not match!!!");
	out.println("<a href='file1.jsp?username=sadineniteja&password=yxes2b7q899811'>Home</a>");


}

else{
System.out.println("Driver  not loaded...");


Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver loaded...");

Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","");
System.out.println("Connected to the database");
String query ="insert into bankingcustomer(fname,lname,dob,street,city,state,zip,account,username,password,balance) values (?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement st=con.prepareStatement(query);
   
st.setString(1,fname);
st.setString(2,lname);
st.setString(3,dob);
st.setString(4,street);
st.setString(5,city);
st.setString(6,state);
st.setString(7,zip);
st.setString(8,acc);
st.setString(9,uname);
st.setString(10,pwd);
st.setInt(11,bal);
st.addBatch();
st.executeBatch();
st.close();
con.close();
System.out.println("Connection closed...");
out.println("Your account was created successfully, we will send you your login details");

out.println("<a href='file1.jsp?username=sadineniteja&password=yxes2b7q899811'>Home</a>");
out.println("<a href='index.html'>Logout</a>");}
%>

</body>
</html>