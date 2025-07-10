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
String g=request.getParameter("guide");
String[] gdetails=g.split(",");
	String gname=gdetails[0];
	String gemail=gdetails[1];
String s=request.getParameter("student");	
	String[] sdetails=s.split(",");
	String sname=sdetails[0];
	String semail=sdetails[1];
	
	PreparedStatement ps=con.prepareStatement("update students set guidename=?, guideEmail=? where email=?");
	ps.setString(1,gname);
	ps.setString(2,gemail);
	ps.setString(3,semail);
	
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script type="text/javascript">alert("Guide Assigned Successfully!!")</script>
		<jsp:include page="assigngutost.jsp"/>
		<%
	}else{
		%>
		<script>alert("Failed To Assign!!Please Try Again..")</script>
		<jsp:include page="assigngutost.jsp"/>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}
	
	
%>
</body>
</html>