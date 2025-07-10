<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
   <%@ include file="head.jsp" %>
    <main>

       <!-- Hero Start-->
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/M.png">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">GUIDE </h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->

        <!-- slider Area Start-->
       <section class="m-5 p-5">
                <!-- Single Slider -->
                <div class="container">
                    <div class="slider-cap-wrapper">
                        <div class="col-lg-8">
                        
                         
                        <form class="form-contact contact_form" action="guidedata.jsp" method="post"  >
                            <div class="col-8">
                                 
                                
                                     
                               
                                    <div class="form-group">
                                        <input class="form-control valid" name="email" id="email" required type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                    </div>
                               
                                    <div class="form-group">
                                        <input class="form-control" name="pwd" id="subject" required type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password">
                                    </div>
                                
                             
                            
                                <button type="submit" style="text-transform:uppercase;" class="button button-contactForm boxed-btn">LOGIN</button>
                                <a href="registerguide.jsp" style="text-transform:uppercase;" class="button button-contactForm boxed-btn" >REGISTER</a>
                            </div>
                       
                  
                        </form>
                    </div>
                    </div>
                </div>
                <!-- Single Slidesr -->
                 </section>
            <!-- slider-footer Start -->
             
    </main>
 
     

<%@ include file="footer.jsp" %>
   
		
        
    </body>
</html>