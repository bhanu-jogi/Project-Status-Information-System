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
	PreparedStatement ps=con.prepareStatement("update students set status='Deactivate' where stid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Deactivated Successfully!!Please Contact Admin To Activate..")</script>
		<jsp:include page="student.jsp"/>
		<% 
	}else{
		%>
		<script>alert("Failed To Deactivate!!Please Try Again..")</script>
		<jsp:include page="viewstudentdata.jsp"/>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>