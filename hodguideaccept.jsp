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
int id=Integer.parseInt(request.getParameter("id"));
try{
	PreparedStatement ps=con.prepareStatement("update guides set status='Accepted' where gid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Accepted Successfully!!")</script>
		<jsp:include page="viewguide.jsp"/>
		<% 
	}else{
		%>
		<script>alert("Failed To Accept!!Please Try Again..")</script>
		<jsp:include page="viewguide.jsp"/>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>