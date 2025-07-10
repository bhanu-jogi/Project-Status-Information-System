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
String email=request.getParameter("email");
try{
	PreparedStatement ps=con.prepareStatement("update studentprojects set status='Accepted' where stpid=?");
	ps.setInt(1,id);
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Accepted Successfully!!")</script>
		<jsp:include page="guideviewstudentprojects.jsp"><jsp:param value="<%=email %>" name="email"/></jsp:include>
		<% 
	}else{
		%>
		<script>alert("Failed To Accept!!Please Try Again..")</script>
		<jsp:include page="guideviewstudentprojects.jsp"><jsp:param value="<%=email %>" name="email"/></jsp:include>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>