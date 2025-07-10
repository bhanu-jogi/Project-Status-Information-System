<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Base64,java.io.*,com.oreilly.servlet.*,java.util.*,java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
try{
String rtempfile=File.createTempFile("temp", "1").getParent();

MultipartRequest multi=new MultipartRequest(request,rtempfile,15*1024*1024);
Enumeration files=multi.getFileNames();
int gid=Integer.parseInt(multi.getParameter("gid"));
String sname=multi.getParameter("gname");
String email=multi.getParameter("email");


String empid=multi.getParameter("empid");
String depart=multi.getParameter("dep");
String mobile=multi.getParameter("mobile");
String date=multi.getParameter("dob");
String gender=multi.getParameter("gender");
String address=multi.getParameter("address");
String city=multi.getParameter("city");
int pincode=Integer.parseInt(multi.getParameter("pincode"));

Date dob=Date.valueOf(date);


PreparedStatement ps=con.prepareStatement("update  guides set gname=?,department=?,mobile=?,dob=?,gender=?,address=?,city=?,pincode=?,image=? where gid=? and egmail=?");

String name="";
String fileExtension="";
File ff=null;
FileInputStream fin=null;

while(files.hasMoreElements()){
	name=(String)files.nextElement();
	ff=multi.getFile(name);
	fileExtension=ff.getName().substring(ff.getName().lastIndexOf("."));
	
	boolean fileAllowed=fileExtension.equalsIgnoreCase(".jpeg")||
			fileExtension.equalsIgnoreCase(".jpg")||
			fileExtension.equalsIgnoreCase(".png");
	
	if(ff!=null && fileAllowed){
		fin=new FileInputStream(ff);
		ps.setString(1,sname);
		
		
		
		ps.setString(2,depart);
		ps.setString(3,mobile);
		ps.setDate(4,dob);
		ps.setString(5,gender);
		ps.setString(6,address);
		ps.setString(7,city);
		ps.setInt(8,pincode);
		ps.setBinaryStream(9,(InputStream)fin,(int)(ff.length()));
		ps.setInt(10,gid);
		ps.setString(11,email);
		
		int rows=ps.executeUpdate();
		if(rows>0){
			%>
			<script type="text/javascript">alert("Updated Successfully!!")</script>
			<jsp:include page="viewguidedata.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To update!!Please Try Again..")</script>
			<jsp:include page="viewguidedata.jsp"/>
			<%
		}
		
	}else{
		%>
		<script>alert("Please Select Correct File Type...")</script>
		<jsp:include page="viewguidedata.jsp"/>
		<%
	}
	
}
 
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>