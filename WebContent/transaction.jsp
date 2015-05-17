<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<form action="transactionforward.jsp">

<% 

String account = request.getParameter("accno");
String amount = request.getParameter("amount");
int amt = Integer.parseInt(amount);
String trans=request.getParameter("trans");

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
String date1 = sdf.format(new Date());

System.out.println("Driver  not loaded...");
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver loaded...");

Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","");
String query ="insert into bankingtrans(account_no,amount,transaction,date) values (?,?,?,?)";



PreparedStatement st=con.prepareStatement(query);


st.setString(1,account);
st.setInt(2,amt);
st.setString(3,trans);
st.setString(4,date1);
st.addBatch();
st.executeBatch();




st.close();
con.close();

Connection con1=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","");



Statement st1=con1.createStatement();
ResultSet rs = st1.executeQuery("SELECT * FROM bankingcustomer where lname='tella'");
rs.next();
int ch;
int bal = rs.getInt(11);
if(trans.equals("credit")){
	ch = bal-amt;	
}

else{
	ch = bal+amt;
}


CallableStatement proc =
con1.prepareCall("call bankingcustomer(?)");

proc.setInt(1,ch);
System.out.println(ch);

proc.executeUpdate();

proc.close();
st1.close();
con1.close();

out.println("Transaction Executed Successfully");

out.println("<a href='file1.jsp?username=mallitela&password=malleswar1'>Home</a>");
out.println("<a href='index.html'>Logout</a>");
%>
</form>
</body>
</html>