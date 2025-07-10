<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="studentheader.jsp" %>
<%@include file="connect.jsp" %>
 <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                     
                    <h3>Project</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s"> PRC LIST</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
  
    
    <section class="m-5">
           	<div class="cotainer">
           		<table class="table table-bordered">
           			<thead style="background-color:skyblue;color:white">
           			<tr>
           				<th>SNo</th>
           				<th>Title</th>
           				<th>Description</th>
           				<th>PCR Date</th>
           				<th>Due Date</th>
           				<th>PCR Panel Members</th>
           				<th>PCR Panel Details</th>
           				<th>Submissions</th>
           				
           			</tr>
           			</thead>
           			<tbody>
           			<%
           			String email=(String)session.getAttribute("email");
           			String gemail="";
           			try{
           				PreparedStatement pss=con.prepareStatement("select * from students where email=?");
           						pss.setString(1,email);
           				ResultSet rss=pss.executeQuery();
           				while(rss.next()){
           					gemail=rss.getString(18);
           				
           				if(gemail!=null){
           				PreparedStatement ps=con.prepareStatement("select * from prc where g1email=? or g2email=?");
           				ps.setString(1,gemail);
           				ps.setString(2,gemail);
           				
           				rs=ps.executeQuery();
           				int count=0;
           				while(rs.next()){
           					count++;
           					int pcid=rs.getInt(1);
           					%>
           					<tr>
	           					
	           					<td><%=count %></td>
	           					<td><%=rs.getString(2) %></td>
	           					<td><%=rs.getString(3) %></td>
	           					<td><%=rs.getString(4) %></td>
	           					<td><%=rs.getString(5) %></td>
	           					<td><%=rs.getString(6) %>,<%=rs.getString(8) %></td>
	           					<td><%=rs.getString(7) %>,<%=rs.getString(9) %></td>
	           					<%PreparedStatement pcr=con.prepareStatement("select * from pcrsubmission where pcrid=? and semail=?");
	           					pcr.setInt(1,pcid);
	           					pcr.setString(2,email);
	           					ResultSet rcr=pcr.executeQuery();
	           					if(rcr.next()){
	           						%>
	           						<td><a class="genric-btn warning" href="studentdownloadpcrreport.jsp?id=<%=pcid%>">Download</a></td>
	           						<% 
	           					}else{
	           					%>
	           					<td><a class="genric-btn primary" href="studentuploadprcsubmissions.jsp?id=<%=rs.getInt(1)%>">UPLOAD</a></td>
	           					<%} %>
	           					
	           				 </tr>
           					<%
           				}if(count==0){
           					%>
           					<tr><td colspan="12" style="color:skyblue;text-align:center">No Data Found!!</tr>
           					<%
           				}
           				}else{
           					%>
           					<tr><td colspan="12" style="color:skyblue;text-align:center">No Data Found!!</td></tr>
           					<%
           				}
           				}
           			}catch(Exception e){
           				e.printStackTrace(); 
           			}
           			%>
           			</tbody>
           		</table>
           	</div>
           </section>
<%@ include file="footer.jsp" %>
</body>
</html>