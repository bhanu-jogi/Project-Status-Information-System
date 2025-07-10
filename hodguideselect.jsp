<%@include file="connect.jsp" %>
<select class="form-select" id="dropdown2" name="dropdown2" onchange="getDropCheck()"required>
<option value="select">Select The Below</option>
<%
String email=request.getParameter("gemail");
try{
	PreparedStatement ps=con.prepareStatement("select * from guides where egmail!=?");
	ps.setString(1,email);
	rs=ps.executeQuery();
	while(rs.next()){
		%>
		<option value="<%=rs.getString(2)%>,<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
</select>