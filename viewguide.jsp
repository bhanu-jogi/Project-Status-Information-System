<!doctype html>
<%@ page  import="databaseconnection.*" import="java.sql.*" import="java.util.*" %>
<html class="no-js" lang="zxx">
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
   <%@ include file="hodheader.jsp" %>
    <!-- Hero Start-->
   
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Guides</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
  
  <!--Team Ara Start -->
       <div class="team-area section-padding30">
    <div class="container">
        <div class="row justify-content-center">
            <div class="cl-xl-7 col-lg-8 col-md-10">
                <!-- Section Title -->
                <div class="section-tittle text-center mb-70">
                    <span>Our Guides</span>
                    <h2>Dedicated mentors shaping success with expertise and care.</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <% try {
                PreparedStatement ps = con.prepareStatement("select * from guides");
                rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="single-team mb-30">
                    <div class="team-img">
                        <img src="hodguideimg.jsp?id=<%= rs.getInt(1) %>" style="width:270px;height:350px" alt="">
                        <!-- Blog Social -->
                        <div class="team-social">
                            <li><a href="#" data-toggle="tooltip" style="background-color:skyblue;color:white" data-placement="right" title="<%= rs.getString(7) %>"><i class="fa fa-phone"></i></a></li>
                            <li><a href="#" data-toggle="tooltip" style="background-color:skyblue;color:white" data-placement="right" title="<%= rs.getString(3) %>"><i class="fas fa-envelope"></i></a></li>
                            <li><a href="#" data-toggle="tooltip" style="background-color:skyblue;color:white" data-placement="right" title="<%= rs.getString(10) %>,<%= rs.getString(11) %>,<%= rs.getString(12) %>"><i class="fa fa-map-marker-alt"></i></a></li>
                        </div>
                    </div>
                    <div class="team-caption">
                        <h3><a href="#" style="text-transform:uppercase"><%= rs.getString(2) %></a></h3>
                        <p><%= rs.getString(5) %></p>
                    </div>
                    <p><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-suitcase fa-lg"></i>&nbsp;</span><%= rs.getString(6) %></p>
                    <p><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-calendar-alt fa-lg"></i>&nbsp;</span><%= rs.getString(8) %></p>
                    <p><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-venus-mars fa-lg"></i>&nbsp;</span><%= rs.getString(9) %></p>
                    <% 
                    String status = rs.getString(15);
                    if (status.equalsIgnoreCase("Accepted")) {
                    %>
                    <a class="genric-btn danger ml-5" onclick="return confirm('Do You Want To Deactivate?')" href="hodguidedeactivate.jsp?id=<%= rs.getInt(1) %>">Deactivate</a>
                    <% 
                    } else if (status.equalsIgnoreCase("Rejected")) {
                    %>
                    <a class="genric-btn danger ml-5" onclick="return confirm('Do You Want To Delete?')" href="hodguidedelete.jsp?id=<%= rs.getInt(1) %>">Delete</a>
                    <% 
                    } else if (status.equalsIgnoreCase("Deactivate")) {
                    %>
                    <a class="genric-btn info ml-5" onclick="return confirm('Do You Want To Activate?')" href="hodguideactivate.jsp?id=<%= rs.getInt(1) %>">Activate</a>
                    <% 
                    } else {
                    %>
                    <a class="genric-btn primary ml-3" href="hodguideaccept.jsp?id=<%= rs.getInt(1) %>">Accept</a>
                    <a href="hodguidereject.jsp?id=<%= rs.getInt(1) %>" onclick="return confirm('Do You Want To Reject')" class="genric-btn danger ml-2">Reject</a>
                    <% } %>
                </div>
            </div>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } %>
        </div>
    </div>
</div>

        <!-- Team Ara End -->
                

		
    </main>
 
     
 
     

<%@ include file="footer.jsp" %>
   
        
</body>
</html>