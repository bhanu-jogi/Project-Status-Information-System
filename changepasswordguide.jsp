<!doctype html>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<html class="no-js" lang="zxx">
    <head>
        <%@include file="headlinks.jsp" %>
   </head>

   <body>
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
   <%@ include file="guideheader.jsp" %>
    <main>
     <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Change Password</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
        <%String email=(String)session.getAttribute("email"); %>
        <section class="m-5 p-5">
        		<div class="row">
                    
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="changepasswordguidedata.jsp" method="post" >
                            <div class="row">
                                
                               
                                <div class="col-sm-7">
                                    
                                    <div class="form-group">
                                        <input class="form-control " name="email" id="email" value="<%=email %>" readonly required  type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email Address'" placeholder="Email"/>
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="oldpwd" required id="subject" type="password" onfocus="this.placeholder = 'Enter Old Password'" onblur="this.placeholder = 'Enter Old Password'" placeholder="Enter Old Password">
                                    </div>
                                </div>
                                 <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control " name="newpwd" required id="name" type="password" onfocus="this.placeholder = 'Enter New Password'" onblur="this.placeholder = 'Enter New Password'" placeholder="Enter New Password ">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                    
                </div>
                
            
             </section>
     
               
      
             
    </main>
 
     

<%@ include file="footer.jsp" %>
    
        
    </body>
</html>