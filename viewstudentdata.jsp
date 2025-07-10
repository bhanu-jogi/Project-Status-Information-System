<!doctype html>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<html class="no-js" lang="zxx">
    <head>
        <%@include file="headlinks.jsp" %>
   </head>

   <body>
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
   <%@ include file="studentheader.jsp" %>
   <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">My profile</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
            
            <%String email=(String)session.getAttribute("email");
            try{
            	PreparedStatement ps=con.prepareStatement("select * from students where email=?");
            	ps.setString(1,email);
            	rs=ps.executeQuery();
            	while(rs.next()){
            		%>
            		<div class="support-company-area section-padding3 fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img mb-50">
                            <img src="studentproimg.jsp?id=<%=rs.getInt(1) %>" style="width:570px;height:650px;"alt=""><!-- 570*720 -->
                            <div class="support-img-cap">
                                <span><%=rs.getString(9) %></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle">
                                <span style="text-transform:uppercase"><%=rs.getString(6) %></span>
                                <h2 style="text-transform:uppercase"><%=rs.getString(2) %></h2>
                            </div>
                            <i class="fas fa-child">&nbsp;S/o:<span style="color:skyblue"><%=rs.getString(5) %></span></i>
                            <div class="support-caption ">
                                <p><%=rs.getString(3) %></p>
                                <i style="color:skyblue"class="fas fa-venus-mars  fa-2x m-2"></i>
            <span ><%=rs.getString(10) %></span>
            </div>
            <div class="detail-item ">
            <i style="color:skyblue" class="fas fa-mobile-alt fa-2x m-2"></i>
            <span><%=rs.getString(8) %></span>
        </div>
        <div class="detail-item ">
            <i style="color:skyblue" class="fas fa-book  fa-2x m-2"></i>
            <span> <%=rs.getString(7) %></span>
        </div>
        <div class="detail-item ">
            <i style="color:skyblue" class="fas fa-map-marker-alt  fa-2x m-2"></i>
            <span><%=rs.getString(11) %>,<%=rs.getString(12) %>,<%=rs.getInt(13) %></span>
            
                            </div>
                            <div class="ml-5 m-5">
                            <a class="genric-btn primary" href="studentprofileupdate.jsp?id=<%=rs.getInt(1)%>">Update</a><a class="genric-btn danger ml-2" onclick="return confirm('Do You Want To Deactivate?')" href="studentprofiledeactivate.jsp?id=<%=rs.getInt(1)%>">Deactivate</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
      
            		<%
            	}
            }catch(Exception e){
            	e.printStackTrace();
            }
            %>
   
   
             
 
 
     <%@ include file="footer.jsp" %>
    
    </body>
</html>