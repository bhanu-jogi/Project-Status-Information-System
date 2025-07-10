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
	String oldpwd=request.getParameter("oldpwd");
	String newpwd=request.getParameter("newpwd");
	
	
	PreparedStatement ps=con.prepareStatement("select * from hod where email=? and password=?");
	ps.setString(1,email);
	ps.setString(2,newpwd);
	rs=ps.executeQuery();
	if(rs.next()){
		%>
		<script type="text/javascript">alert("You Have Entered Same Password As Old Password!!Please Try Again...")</script>
		<jsp:include page="hodchangepassword.jsp"/>
		<%
	}else{
		PreparedStatement pss=con.prepareStatement("update hod set password=? where email=? and password=?");
		pss.setString(1,newpwd);
		pss.setString(2,email);
		pss.setString(3,oldpwd);
		int rows=pss.executeUpdate();
		if(rows>0){
			%>
			<script type="text/javascript">alert("Password Updated Successfully!!")</script>
			<jsp:include page="hod.jsp"/>
			<%
		}else{
			%>
			<script type="text/javascript">alert("Invalid Credentials")</script>
			<jsp:include page="hodchangepassword.jsp"/>
			<%
		}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>