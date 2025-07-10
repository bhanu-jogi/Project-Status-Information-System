<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="hodheader.jsp" %>
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
    <!-- Preloader End -->
<div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Project Tasks</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
            <section class="m-5">
            	<div class="container">
            		<table class="table table-bordered">
            			<thead style="color:white;background-color:skyblue">
            				<tr>
            					<th>SNo</th>
            					<th>Project Id</th>
            					<th>Title</th>
            					<th>Description</th>
            					<th>Due Date</th>
            					<th>Status</th>
            					<th>Report</th>
            					<th>Date Time</th>
            				</tr>
            			</thead>
            			<tbody>
            				
            					 <%int spid=Integer.parseInt(request.getParameter("id")); 
            					 try{
            						 PreparedStatement ps=con.prepareStatement("select * from projecttasks where pid=?");
            						 ps.setInt(1,spid);
            						 rs=ps.executeQuery();
            						 int count=0;
            						 while(rs.next()){
            							 count++;
            							 %>
            							 <tr>
            							 <td><%=count %></td>
            							
            							 <td><%=rs.getString(2) %></td>
            							  <td><%=rs.getString(3) %></td>
            							   <td><%=rs.getString(4) %></td>
            							    <td><%=rs.getString(5) %></td>
            							     <td><%=rs.getString(6) %></td>
            							     
            							 <% 
            							 String status=rs.getString(6);
            							 if(status.equalsIgnoreCase("Completed")){
            								 %>
            								 <td><a class="genric-btn primary" href="studenttaskreportdow.jsp?id=<%=rs.getInt(1)%>">Download</a></td>
            								 <%
            							 }else{
            								 %>
            								 <td style="color:red;">Not Yet Submitted</td>
            								  <%
            							 }
            							 %>
            							 <td><%=rs.getString(7) %></td>
            							 </tr>
            							 <% 
            						 }if(count==0){
            							 %>
            							 <tr>
            							 <td colspan="10" style="text-align:center;color:skyblue;"> Tasks Are Not Created Yet !!</td>
            							 </tr>
            							 <% 
            						 }
            					 }catch(Exception e){
            						 e.printStackTrace();
            					 }
            					 %>
            				
            			</tbody>
            		</table>
            		
            	</div>
            </section>
 
<%@include file="footer.jsp" %>
</body>
</html>