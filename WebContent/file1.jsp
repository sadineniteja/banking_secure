<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<% 
int i;
List<String> results = new ArrayList<String>();
String a1;
String a2;
i=0;

String username=request.getParameter("username");
String password=request.getParameter("password");
System.out.println("Driver  not loaded...");

Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver loaded...");

Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","");
System.out.println("Connected to the database");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM bankingcustomer");
ResultSetMetaData rsmd = rs.getMetaData();
System.out.println("before while");

while(rs.next()){
a2=rs.getString(9);
a1=rs.getString(10);

if(a2.equals(username) &&  a1.equals(password)){
	i=22;
	

}}
if(i==22){
	
	out.println("Welcome "+username+", you are now logged in ..... :)<br>");
	out.println("<a href='register.html'>Create Account</a><br>");
	out.println("<a href='transaction.html'>Transactions</a><br>");
	out.println("<a href='displaytrans.html'>Bank Statement</a><br>");
	out.println("<a href='creditcard.html'>Authorize Credit Card Transactions</a><br>");
	out.println("<a href='index.html'>Logout</a><br>");
	
}

else{
	out.print("Sorry some thing went wrong please check the credentials you entered");
	out.print("<html> <body><form action='file1.jsp'><input type='text' name='username'><input type='text' name='password'><input type='submit' value='go'></form><br><a href='register.html'>click to register</a> </body></html>");
	

}

	



rs.close();
st.close();
con.close();
System.out.println("Connection closed...");


%>

</body>
</html>