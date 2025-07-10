<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,databaseconnection.*"%>
 
<%
Connection con=GetConnection.getConnection();

//String email=session.getAttribute("email").toString();
int id =Integer.parseInt(request.getParameter("id"));
out.println("id="+id);
try{

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select document,name from upload where id='"+id+"'");
byte[ ] imgData=null;
if (rs.next()) {
Blob image = rs.getBlob(2);
imgData = image.getBytes(2,(int)image.length());
}
else {
out.println("file not found for given id");
return;
}

response.setContentType(" /.pdf/.txt/.doc");
   response.setHeader("content-Disposition","inline");
   response.setContentLength(imgData.length);
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();

}
catch(Exception e){
e.printStackTrace();
}


%>