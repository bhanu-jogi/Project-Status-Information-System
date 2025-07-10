<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="databaseconnection.*" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
try{
	
	String status="Reject";
	Connection con =GetConnection.getConnection();
	PreparedStatement ps=con.prepareStatement("update title set status=? where id='"+id+"'");
	ps.setString(1,status);
	int n=ps.executeUpdate();
	
	if(n>0){
		%>
		<script>alert("Reject Sucess")</script>
		<jsp:include page="viewstudenttitless.jsp"></jsp:include>
		
		<%
	}
	else{
		%>
		<script>alert("Reject UnSucess")</script>
		<jsp:include page="viewstudenttitless.jsp"></jsp:include>
		
		<%
	}
	
}
catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>