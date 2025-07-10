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

String sname=multi.getParameter("gname");
String email=multi.getParameter("email");
String pwd=multi.getParameter("pwd");

String empid=multi.getParameter("empid");
String depart=multi.getParameter("depart");
String mobile=multi.getParameter("mobile");
String date=multi.getParameter("dob");
String gender=multi.getParameter("gender");
String address=multi.getParameter("address");
String city=multi.getParameter("city");
int pincode=Integer.parseInt(multi.getParameter("pincode"));

Date dob=Date.valueOf(date);
String encpwd=Base64.getEncoder().encodeToString(pwd.getBytes());
PreparedStatement pss=con.prepareStatement("select * from guides where egmail=?");
pss.setString(1,email);
 rs=pss.executeQuery();
 if(rs.next()){
	 %>
	 <script type="text/javascript">alert("You Have Already Registered!!Please Try Again..")</script>
	 <jsp:include page="guide.jsp"/>
	 <%
 }else{
PreparedStatement ps=con.prepareStatement("insert into guides(gname,egmail,pwd,empid,department,mobile,dob,gender,address,city,pincode,image) value(?,?,?,?,?,?,?,?,?,?,?,?)");

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
		ps.setString(2,email);
		ps.setString(3,encpwd);
		
		ps.setString(4,empid);
		ps.setString(5,depart);
		ps.setString(6,mobile);
		ps.setDate(7,dob);
		ps.setString(8,gender);
		ps.setString(9,address);
		ps.setString(10,city);
		ps.setInt(11,pincode);
		ps.setBinaryStream(12,(InputStream)fin,(int)(ff.length()));
		
		int rows=ps.executeUpdate();
		if(rows>0){
			%>
			<script type="text/javascript">alert("Registered Successfully!!")</script>
			<jsp:include page="guide.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To Register!!Please Try Again..")</script>
			<jsp:include page="registerguide.jsp"/>
			<%
		}
		
	}else{
		%>
		<script>alert("Please Select Correct File Type...")</script>
		<jsp:include page="registerguide.jsp"/>
		<%
	}
	
}
 }
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>