<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
<main> 
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
    <%@include file="connect.jsp" %>
   <%@ include file="studentheader.jsp" %>
    <!-- Hero Start-->
   
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">projects</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
        <!--================Blog Area =================-->
        <section class="blog_area section-padding">
    <div class="container">
        <div class="row">
                            <%
                            String email=(String)session.getAttribute("email");
                            
                            try{
                            	PreparedStatement ps=con.prepareStatement("select * from  studentprojects where stemail=?");
                            	ps.setString(1,email);
                            	rs=ps.executeQuery();
                            	int count=0;
                            	while(rs.next()){
                            		count++;
                            		%>
                            	<div class="col-lg-6 col-md-6 mb-4">
                <article class="blog_item">
                    <div class="blog_item_img">
                                    <img class="card-img rounded-0" src="stdprjimg.jsp?id=<%=rs.getInt(1) %>"  style="width:570px;height:330px;" alt="">
                                    <a  class="blog_item_date">
                                        <h3><%=rs.getDate(15) %></h3>
                                       
                                    </a>
                                </div>

                                <div class="blog_details">
                                    <a class="d-inline-block">
                                        <h2><i class="fa fa-cogs fa-2x mr-1"></i><%=rs.getString(3) %></h2>
                                    </a>
                                    <p><%=rs.getString(4) %>.</p>
                                    <i style="color:skyblue;"class="fas fa-file-alt fa-2x mb-4 mr-2"></i><a href="studentprojectabstractdow.jsp?id=<%=rs.getInt(1)%>">&nbsp;Abstract</a>
                                    <ul class="blog-info-link">
                                        <li><a ><i class="fas fa-briefcase fa-lg"></i><%=rs.getString(5) %></a></li>
                                         <li><a ><i class="fas fa-cube fa-lg"></i> <%=rs.getString(6) %></a></li>
                                        <li><a><i class="fas fa-file-code fa-lg"></i> <%=rs.getString(7) %></a></li>
                                           <li><a ><i class="fas fa-laptop fa-lg"></i><%=rs.getString(8) %></a></li>
                                          
                                           
                                    </ul>
                                    <div class="container ml-5 mt-4 m-3 mx-3">
                                    <a class="genric-btn primary large" href="studentprojectupdate.jsp?id=<%=rs.getInt(1)%>">Update</a><!-- <a class="genric-btn danger large ml-3 ">Delete</a> -->
                                     <a class="genric-btn warning large" href="studentprojecttasks.jsp?id=<%=rs.getInt(1)%>">Tasks</a>
                                    </div>
                                </div>
                            </article>
                            </div>
                            		<% 
                            	}if(count==0){
                            		%>
                            		<h3 style="color:red;text-align:center;">Projects Not Added Yet..!!</h3>
                            		<%
                            	}
                            }catch(Exception e){
                            	e.printStackTrace();
                            }
                            
                            %>
                            
                           

                            

                            

                           

                           

                            <!-- <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Previous">
                                            <i class="ti-angle-left"></i>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <a href="#" class="page-link">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Next">
                                            <i class="ti-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav> -->
                            
                        </div>
                    </div>
                    
                
        </section>
        <!--================Blog Area =================-->
  
 
       
                

		
    </main>
 
     <%@include file="footer.jsp" %>
 
</body>
</html>