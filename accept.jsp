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
 
try{
	
	
	String status="Accept";
	Connection con =GetConnection.getConnection();
	
 
	int id=Integer.parseInt(request.getParameter("id"));
	PreparedStatement ps=con.prepareStatement("update title set status=? where id=?");
	ps.setString(1,status);
	ps.setInt(2,id);
	int n=ps.executeUpdate();
	
	if(n>0){
		%>
		<script>alert("Accept Sucess")</script>
		<jsp:include page="viewstudenttitless.jsp"></jsp:include>
		
		<%
	}
	else{
		%>
		<script>alert("Accept UnSucess")</script>
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