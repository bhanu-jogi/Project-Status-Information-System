<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Base64"%>
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
String pwd=request.getParameter("pwd");

String encpwd=Base64.getEncoder().encodeToString(pwd.getBytes());

PreparedStatement ps=con.prepareStatement("select * from students where email=? and pwd=?");
ps.setString(1,email);
ps.setString(2,encpwd);
rs=ps.executeQuery();
if(rs.next()){
	String status=rs.getString(16);
	if(status.equalsIgnoreCase("Accepted")){
		session.setAttribute("email", email);
		%>
		<script type="text/javascript">alert("Logged In Successfully!!")</script>
		<jsp:include page="studenthome.jsp"/>
		<%
	}else if(status.equalsIgnoreCase("Rejected")){
		%>
		<script type="text/javascript">alert("Your Profile is Rejected")</script>
		<jsp:include page="student.jsp"/>
		<%
	}else if(status.equalsIgnoreCase("Deactivate")){
		%>
		<script type="text/javascript">alert("Your Profile Is Deactivated!!Please Contact Admin To Activate...")</script>
		<jsp:include page="student.jsp"/>
		<%
	}else{
		%>
		<script type="text/javascript">alert("Your Profile Is Pending!!Please Wait For Admin Response..")</script>
		<jsp:include page="student.jsp"/>
		<%
	}
	
}else{
	%>
	<script type="text/javascript">alert("Invalid Login Credentials!!")</script>
	<jsp:include page="student.jsp"/>
	<% 
}
}catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>