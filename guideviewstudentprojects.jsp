<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<%@include file="guideheader.jsp" %>
<%@include file="connect.jsp" %>

<!-- Preloader End -->
    <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Student Project</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
    <!--================Blog Area =================-->
       <!--================Blog Area =================-->
<section class="blog_area section-padding">
    <div class="container">
        <div class="row">
            <%
                try {
                	String email=request.getParameter("email");
                    PreparedStatement ps = con.prepareStatement("SELECT studentprojects.stpid, studentprojects.title, studentprojects.description, studentprojects.domain, studentprojects.techno, studentprojects.sreq, studentprojects.hreq, studentprojects.date, studentprojects.status, studentprojects.stemail, students.sname,studentprojects.status FROM studentprojects INNER JOIN students ON studentprojects.stemail = students.email where studentprojects.stemail=?");
                    ps.setString(1,email);
                    rs = ps.executeQuery();
                    int count=0;
                    while (rs.next()) {
                    	count++;
            %>
            <!-- Card 1 -->
            <div class="col-lg-6 col-md-6 mb-4">
                <article class="blog_item">
                    <div class="blog_item_img">
                        <img class="card-img rounded-0" style="width:570px;height:330px;"src="stdprjimg.jsp?id=<%= rs.getInt(1) %>" alt="">
                        <a href="#" class="blog_item_date">
                            <h3><%= rs.getDate(8) %></h3>
                        </a>
                    </div>
                    <div class="blog_details">
                        <h2 style="text-transform:uppercase"><%= rs.getString(11) %></h2>
                        <p><%= rs.getString(10) %></p>
                        <a class="d-inline-block">
                            <h2><i class="fa fa-cogs fa-2x mr-1"></i><%= rs.getString(2) %></h2>
                        </a>
                        <p><%= rs.getString(3) %>.</p>
                        <i style="color:skyblue;" class="fas fa-file-alt fa-2x mb-4 mr-2"></i><a href="guidestudentprojectabtsdow.jsp?id=<%=rs.getInt(1)%>">&nbsp;Abstract</a>
                        <ul class="blog-info-link">
                            <li><a><i class="fas fa-briefcase fa-lg"></i><%= rs.getString(4) %></a></li>
                            <li><a><i class="fas fa-cube fa-lg"></i> <%= rs.getString(5) %></a></li>
                            <li><a><i class="fas fa-file-code fa-lg"></i> <%= rs.getString(6) %></a></li>
                            <li><a><i class="fas fa-laptop fa-lg"></i><%= rs.getString(7) %></a></li>
                        </ul>
                        <%String status=rs.getString(12);
                        if(status.equalsIgnoreCase("Accepted")){
                        	%>
                        	<div class="container  mt-4 m-3 mx-3">
                           <a class="genric-btn primary large  mt-3" href="guidestudenttasks.jsp?id=<%= rs.getInt(1) %>">TASKS</a> 
                           
                            <!-- <a class="genric-btn danger large ml-3 ">Delete</a> -->
                        </div>
                        	<%
                        }else if(status.equalsIgnoreCase("Rejected")){
                        	%>
                        	<div class="container  mt-4 m-3 mx-3">
                           <button disabled class="genric-btn danger large  mt-3" >REJECTED</button> 
                           
                            <!-- <a class="genric-btn danger large ml-3 ">Delete</a> -->
                        </div>
                        	<%

                        }else{
                        	%>
                        	<div class="container  mt-4 m-3 mx-3">
                           <a class="genric-btn primary large  mt-3" href="guidestudentprojectaccept.jsp?id=<%= rs.getInt(1) %>&email=<%=email%>">ACCEPT</a>  <a class="genric-btn danger large  mt-3" href="guidestudentreject.jsp?id=<%= rs.getInt(1) %>">REJECT</a> 
                           
                            <!-- <a class="genric-btn danger large ml-3 ">Delete</a> -->
                        </div>
                        	<%
                        }
                        %>
                        
                    </div>
                </article>
            </div>
            <% 
                    }if(count==0){
                    	%>
                    	<h3 style="color:red;text-align:center">Project Not Added Yet !!</h3>
                    	<%
                    	
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>  
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>