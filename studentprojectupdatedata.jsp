<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,com.oreilly.servlet.*"%>
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

MultipartRequest multi=new MultipartRequest(request,rtempfile,10*1024*1024);
Enumeration files=multi.getFileNames();

ArrayList<FileInputStream> media=new ArrayList<FileInputStream>();
ArrayList<String> ftype=new ArrayList<String>();
ArrayList<String> fnames=new ArrayList<String>();

String email=(String)session.getAttribute("email");
int pid=Integer.parseInt(multi.getParameter("pid"));
String title=multi.getParameter("title");
String desc=multi.getParameter("desc");
String domain=multi.getParameter("domain");
String techno=multi.getParameter("techno");
String sreq=multi.getParameter("srequire");
String hreq=multi.getParameter("hrequire");


PreparedStatement ps=con.prepareStatement("update  studentprojects set title=?,description=?,domain=?,techno=?,sreq=?,hreq=?,image=?,imgtype=?,imgname=?,abst=?,absttype=?,abstname=? where stpid=? and stemail=?");

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
			fileExtension.equalsIgnoreCase(".png")||
			fileExtension.equalsIgnoreCase(".pdf")||
			fileExtension.equalsIgnoreCase(".doc")||
			fileExtension.equalsIgnoreCase(".docx")||
			fileExtension.equalsIgnoreCase(".txt");
	
	
	if(ff!=null && fileAllowed){
		fin=new FileInputStream(ff);
		media.add(fin);
		ftype.add(fileExtension);
		fnames.add(ff.getName());
	
	}else{
		%>
		<script type="text/javascript">alert("Please Select Correct File Type..")</script>
		<jsp:include page="submittitle.jsp"/>
		<%
	}
	
}
	
	ps.setString(1,title);
	ps.setString(2,desc);
	ps.setString(3,domain);
	ps.setString(4,techno);
	ps.setString(5,sreq);
	ps.setString(6,hreq);
	ps.setBinaryStream(7,(InputStream)media.get(0),(int)(ff.length()));
	ps.setString(8,ftype.get(0));
	ps.setString(9,fnames.get(0));
	ps.setBinaryStream(10,(InputStream)media.get(1),(int)(ff.length()));
	ps.setString(11,ftype.get(1));
	ps.setString(12,fnames.get(1));
	ps.setInt(13,pid);ps.setString(14,email);
	
	int rows=ps.executeUpdate();
	if(rows>0){
		%>
		<script>alert("Project Updated Successfully!!")</script>
		<jsp:include page="studentviewprojects.jsp"/>
		<%
	}else{
		%>
		<script type="text/javascript">alert("Failed to Update!!Please Try Again..")</script>
		<jsp:include page="studentviewprojects.jsp"/>
		<%
	}
	

}catch(Exception e){
	e.printStackTrace();
}
	
			
			




%>
</body>
</html>