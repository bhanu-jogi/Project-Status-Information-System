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
	PreparedStatement ps=con.prepareStatement("delete from notifications where nid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Notification Deleted Successfully!!")</script>
		<jsp:include page="viewnoti.jsp"/>
		<% 
	}else{
		%>
		<script>alert("Failed To Delete!!Please Try Again..")</script>
		<jsp:include page="viewnoti.jsp"/>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>