<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="databaseconnection.*" import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
String status="Authorized";
try{
	Connection conn=GetConnection.getConnection();
	Statement ss=conn.createStatement();
	ResultSet rss=ss.executeQuery("select * from guide where status='"+status+"' and id='"+id+"'");
	
	if(rss.next()) {
		%>
		<script>alert("This Guide is Already Authorized ")</script>
		<jsp:include page="viewguide.jsp"></jsp:include>
		<%
	}
	else{
	PreparedStatement ps=conn.prepareStatement("update guide set status='"+status+"' where id='"+id+"'");
	int n=ps.executeUpdate();
	if(n>0){
		%>
		<script>alert("Authorized Sucess")</script>
		<jsp:include page="viewguide.jsp"></jsp:include>
		<%
	}
	else{
		%>
		<script>alert("Authorized UnSucess")</script>
		<jsp:include page="viewstudent.jsp"></jsp:include>
		<%
	}}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>