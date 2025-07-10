<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
int pid=Integer.parseInt(request.getParameter("spid"));
String title=request.getParameter("title");
String desc=request.getParameter("desc");
String date=request.getParameter("ddate");
System.out.println(pid);
System.out.println(title);
System.out.println(desc);
System.out.println(date);
Date duedate=Date.valueOf(date);
PreparedStatement ps=con.prepareStatement("insert into projecttasks(pid,title,description,duedate)values(?,?,?,?)");
ps.setInt(1, pid);
ps.setString(2,title);
ps.setString(3,desc);
ps.setDate(4,duedate);

int rows=ps.executeUpdate();
if(rows>0){
	%>
	<script>alert("Task Created Successfully!!")</script>
	<jsp:include page="guidestudenttasks.jsp"><jsp:param value="<%=pid %>" name="id"/></jsp:include>
	<%
}else{
	%>
	<script>alert("Failed To Create Task!! Please Try Again..")</script>
	<jsp:include page="guidestudenttasks.jsp"><jsp:param value="<%=pid %>" name="id"/></jsp:include>
	<%
}

}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>