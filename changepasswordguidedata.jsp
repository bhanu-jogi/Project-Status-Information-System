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
	
	String encoldpwd=Base64.getEncoder().encodeToString(oldpwd.getBytes());
	String encnewpwd=Base64.getEncoder().encodeToString(newpwd.getBytes());
	PreparedStatement ps=con.prepareStatement("select * from guides where egmail=? and pwd=?");
	ps.setString(1,email);
	ps.setString(2,encnewpwd);
	rs=ps.executeQuery();
	if(rs.next()){
		%>
		<script type="text/javascript">alert("You Have Entered Same Password As Old Password!!Please Try Again...")</script>
		<jsp:include page="changepasswordguide.jsp"/>
		<%
	}else{
		PreparedStatement pss=con.prepareStatement("update guides set pwd=? where egmail=? and pwd=?");
		pss.setString(1,encnewpwd);
		pss.setString(2,email);
		pss.setString(3,encoldpwd);
		int rows=pss.executeUpdate();
		if(rows>0){
			%>
			<script type="text/javascript">alert("Password Updated Successfully!!")</script>
			<jsp:include page="guide.jsp"/>
			<%
		}else{
			%>
			<script type="text/javascript">alert("Invalid Credentials")</script>
			<jsp:include page="changepasswordguide.jsp"/>
			<%
		}
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>