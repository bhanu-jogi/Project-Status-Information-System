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
    <!-- Preloader End -->
<div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Notifications</h1>
                           
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
           				<th>Date Time</th>
           			</tr>
           			</thead>
           			<tbody>
           			<%try{
           				PreparedStatement ps=con.prepareStatement("select * from notifications");
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
	           				</tr>
           					<%
           				}if(count==0){
           					%>
           					<tr><td colspan="7" style="color:skyblue;text-align:center">No Data Found!!</tr>
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