<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="databaseconnection.*" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
int id=Integer.parseInt(request.getParameter("id"));
//GetConnection kk=new GetConnection();
Connection con=GetConnection.getConnection();
PreparedStatement ps=con.prepareStatement("delete from title where id='"+id+"'");
int n=ps.executeUpdate();
if(n>0){
	%>
	<script>alert("Delete Sucess")</script>
	<jsp:include page="viewtitle.jsp" />
	<%
}
else{
	%>
	<script>alert("Delete UnSucess")</script>
	<jsp:include page="viewtitle.jsp" />
	<%	
}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>