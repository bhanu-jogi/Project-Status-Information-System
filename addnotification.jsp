<!doctype html>
<%@ page  import="databaseconnection.*" import="java.sql.*" import="java.util.*"  import="project.*"%>

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
   <%@ include file="hodheader.jsp" %>
    <main>
     <!-- Hero Start-->
   
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Add notification</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->

        <!-- slider Area Start-->
        
                <!-- Single Slider -->
                 <div class="m-5">
                 <div class="container">
                    <div class="slider-cap-wrapper">
                        <div class="col-lg-8">
                       
                        <form class="form-contact contact_form" action="addnotificationdata.jsp" method="post"  >
                            <div class="row form-group col-md-7">
                                 
                               
                                        <input class="form-control mb-2" name="title" id="email" required type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Title'" placeholder="Enter Title">
                                 
                                        <textarea class="form-control mb-3" name="desc" id="subject" required   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter Description"></textarea>
                                
                             
                                                  
                                
                           
                           
                                <button type="submit" style="text-transform:uppercase"class="button button-contactForm boxed-btn">SUBMIT</button>
                            </div>
                            
                          
                     
                        </form>
                    </div></div>
                    </div>
                    </div>
                 
                <!-- Single Slider -->
                 
            <!-- slider-footer Start -->
             
    </main>
 
     

<%@ include file="footer.jsp" %>
   
    </body>
</html>