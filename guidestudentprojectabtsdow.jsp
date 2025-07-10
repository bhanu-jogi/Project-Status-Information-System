<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="connect.jsp" %>
<%
String doc_id = request.getParameter("id");
PreparedStatement ps=con.prepareStatement("select abstname, absttype, abst from studentprojects where stpid = ?");

ps.setString(1,doc_id);
  rs = ps.executeQuery();
rs.next();

// clear the response header information.
response.reset();
// check the file type and set the header contentType accordingly..
if(rs.getString(2)==".txt")
{
response.setContentType("application/octet-stream");
}else if(rs.getString(2)==".zip")
{
response.setContentType("application/zip");
}else if(rs.getString(2)==".rar")
{
response.setContentType("application/x-rar-compressed");
}
else if(rs.getString(2)==".pdf")
{
response.setContentType("application/pdf");
}
else if((rs.getString(2)==".doc")||rs.getString(2)==".docx")
{
response.setContentType("application/msword");
}
else if((rs.getString(2)==".xls")||(rs.getString(2)==".xlsx"))
{
response.setContentType("application/vnd.ms-excel");
}
// add header information to response object
response.addHeader("Content-Disposition","attachment; filename="+rs.getString(1));
// create the byte array from Blob
Blob blb = rs.getBlob(3);
byte[] bdata = blb.getBytes(1, (int) blb.length());

// get the response Output stream object to write the content of the file into header
OutputStream output = response.getOutputStream();
output.write(bdata);
output.close();
// close the obejct of ResultSet
rs.close();

// close the connection object..

%>
</body>
</html>