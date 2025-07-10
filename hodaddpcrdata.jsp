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
		String title=request.getParameter("title");
		String desc=request.getParameter("desc");
		String dateprc=request.getParameter("dateprc");
		String ddate=request.getParameter("ddate");
		String d1=request.getParameter("dropdown1");
		String[] guide1details=d1.split(",");
			String guide1name=guide1details[0];
			String guide1email=guide1details[1];
		String d2=request.getParameter("dropdown2");
		String[] guide2details=d2.split(",");
			String guide2name=guide2details[0];
			String guide2email=guide2details[1];
			
			
		Date dprc=Date.valueOf(dateprc);
		Date dudate=Date.valueOf(ddate);
		PreparedStatement pss=con.prepareStatement("select * from prc where title=? and dprc=?");
		pss.setString(1,title);
		pss.setDate(2,dprc);
		rs=pss.executeQuery();
		if(rs.next()){
			%>
			<script type="text/javascript">alert("You Have Already Created PRC!!Please Check Here..")</script>
			<jsp:include page="hodviewpcr.jsp"/>
			<%
		}else{
		
						
		PreparedStatement ps=con.prepareStatement("insert into prc(title,description,dprc,ddate,g1name,g1email,g2name,g2email)values(?,?,?,?,?,?,?,?)");
		ps.setString(1,title);
		ps.setString(2,desc);
		ps.setDate(3,dprc);
		ps.setDate(4,dudate);
		ps.setString(5,guide1name);
		ps.setString(6,guide1email);
		ps.setString(7,guide2name);
		ps.setString(8,guide2email);
		 
		int rows=ps.executeUpdate();
		if(rows>0){
			%>
			<script>alert("PRC Added Successfully!!")</script>
			<jsp:include page="hodviewpcr.jsp"/>
			<%
		}else{
			%>
			<script>alert("Failed To Add !! Please Try Again..")</script>
			<jsp:include page="hodaddpcr.jsp"/>
			<%
		}
		
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>