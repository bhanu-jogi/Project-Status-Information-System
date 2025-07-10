<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.util.*,com.oreilly.servlet.*"%>
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

int tid=Integer.parseInt(multi.getParameter("tid"));

PreparedStatement ps=con.prepareStatement("update projecttasks set status='Completed',report=?,reporttype=?,reportname=? where ptid=?");

String name="";
String fileExtension="";
File ff=null;
FileInputStream fin=null;

while(files.hasMoreElements()){
	name=(String)files.nextElement();
	ff=multi.getFile(name);
	fileExtension=ff.getName().substring(ff.getName().lastIndexOf("."));
	
	boolean fileAllowed=fileExtension.equalsIgnoreCase(".pdf")||
			fileExtension.equalsIgnoreCase(".txt")||
			fileExtension.equalsIgnoreCase(".doc")||
			fileExtension.equalsIgnoreCase(".docx");
	
	if(ff!=null && fileAllowed){
		fin=new FileInputStream(ff);
		ps.setBinaryStream(1,(InputStream)(fin),(int)(ff.length()));
		ps.setString(2,fileExtension);
		ps.setString(3,ff.getName());
		ps.setInt(4,tid);
		int rows=ps.executeUpdate();
		
		if(rows>0){
			%>
			<script>alert("Report Submitted Successfully !!")</script>
			<jsp:include page="studentviewprojects.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To Submit!! Please Try Again..")</script>
			<jsp:include page="studentviewprojects.jsp"/>
			<%
		}
	}else{
		%>
		<script>alert("Please Select Correct File Type..")</script>
		<jsp:include page="studentviewprojects.jsp"/>
		<%
	}
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>