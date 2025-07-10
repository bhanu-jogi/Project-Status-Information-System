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
String email=(String)session.getAttribute("email");
String rtempfile=File.createTempFile("temp", "1").getParent();

MultipartRequest multi=new MultipartRequest(request,rtempfile,15*1024*1024);
Enumeration files=multi.getFileNames();

int prcid=Integer.parseInt(multi.getParameter("prcid"));

PreparedStatement ps=con.prepareStatement("insert into pcrsubmission(pcrid,semail,prcreport,prcreporttype,prcreportname)values(?,?,?,?,?)");

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
		ps.setInt(1,prcid);
		ps.setString(2,email);
		ps.setBinaryStream(3,(InputStream)(fin),(int)(ff.length()));
		ps.setString(4,fileExtension);
		ps.setString(5,ff.getName());
		
		int rows=ps.executeUpdate();
		
		if(rows>0){
			%>
			<script>alert("Report Submitted Successfully !!")</script>
			<jsp:include page="studentviewprc.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To Submit!! Please Try Again..")</script>
			<jsp:include page="studentviewprc.jsp"/>
			<%
		}
	}else{
		%>
		<script>alert("Please Select Correct File Type...")</script>
		<jsp:include page="studentviewprc.jsp"/>
		<%
	}
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>