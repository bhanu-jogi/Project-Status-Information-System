<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="headlinks.jsp" %>
</head>

<body>
    <%@include file="head.jsp" %>
    <main>

       <!-- Hero Start-->
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/M.png">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Contact </h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
        <!-- ================ contact section start ================= -->
        <section class="contact-section">
            <div class="container">
              
                    
                    <div class="col-lg-12">
                        <form class="form-contact contact_form" action="contact_process.jsp" method="post" >
                            
                                <div class="col-md-6 ">
                                    <div class="form-group">
                                    
                                       <input class="form-control mb-2" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Name'" placeholder="Enter Your Name" required >
                                
                                        <input class="form-control mb-2" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address" required  >
                                  
                                       <input class="form-control mb-2" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject" required >
                                 
                                        <textarea class="form-control mb-3 w-100" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message" required ></textarea>
                                    
                                       
                                        
                                <button type="submit" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SEND</button>
                            </div>
                            </div>
                        </form>
                    </div>
                    
                </div>
            
        </section>
        <!-- ================ contact section end ================= -->

    </main>
    <%@include file="footer.jsp" %>

    </body>
    
</html>