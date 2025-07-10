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
int sid=Integer.parseInt(multi.getParameter("sid"));
String sname=multi.getParameter("sname");
String email=multi.getParameter("email");

String fname=multi.getParameter("fname");
String rno=multi.getParameter("rno");
String stream=multi.getParameter("stream");
String mobile=multi.getParameter("mobile");
String date=multi.getParameter("dob");
String gender=multi.getParameter("gender");
String address=multi.getParameter("address");
String city=multi.getParameter("city");
int pincode=Integer.parseInt(multi.getParameter("pincode"));

Date dob=Date.valueOf(date);


PreparedStatement ps=con.prepareStatement("update  students set sname=?,fname=?,rno=?,stream=?,mobile=?,dob=?,gender=?,address=?,city=?,pincode=?,image=? where email=? and stid=?");

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
		
		ps.setString(2,fname);
		ps.setString(3,rno);
		ps.setString(4,stream);
		ps.setString(5,mobile);
		ps.setDate(6,dob);
		ps.setString(7,gender);
		ps.setString(8,address);
		ps.setString(9,city);
		ps.setInt(10,pincode);
		ps.setBinaryStream(11,(InputStream)fin,(int)(ff.length()));
		ps.setString(12,email);
		ps.setInt(13,sid);
		
		int rows=ps.executeUpdate();
		if(rows>0){
			%>
			<script type="text/javascript">alert("Profile Updated Successfully!!")</script>
			<jsp:include page="viewstudentdata.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To Update!!Please Try Again..")</script>
			<jsp:include page="viewstudentdata.jsp"/>
			<%
		}
		
	}else{
		%>
		<script>alert("Please Select Correct File Type...")</script>
		<jsp:include page="viewstudentdata.jsp"/>
		<%
	}
	
}
 
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>