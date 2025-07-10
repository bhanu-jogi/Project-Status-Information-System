<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
String email=request.getParameter("email");
String password=request.getParameter("password");

PreparedStatement ps=con.prepareStatement("select * from hod where email=? and password=?");
ps.setString(1,email);
ps.setString(2,password);
rs=ps.executeQuery();
if(rs.next()){
	session.setAttribute("email", email);
	%>
	<script>alert("Logged In Successfully!!")</script>
	<jsp:include page="hodhome.jsp"/>
	<%
}else{
	%>
	<script>alert("Invalid Login Credentials!!Please Try Again..")</script>
	<jsp:include page="hod.jsp"/>
	<%
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>