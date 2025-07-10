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
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Report Submission</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
            
            <%
            int tid=Integer.parseInt(request.getParameter("id"));
            
            %>
            <section class="m-5 p-5">
                <!-- Single Slider -->
                <div class="container">
                    <div class="slider-cap-wrapper">
                        <div class="col-lg-8">
                        
                         
                        <form class="form-contact contact_form" action="studentprojecttasksubdata.jsp" method="post" enctype="multipart/form-data" >
                            <div class="col-8">
                                 
                                
                                     
                               
                                    <div class="form-group">
                                        <input class="form-control valid" readonly name="tid" required type="number" value="<%=tid %>" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email Address'" placeholder="Enter Email Address">
                                    </div>
                               
                                    <div class="form-group">
                                        <input class="form-control" name="report"  accept=".pdf,.txt,.doc,.docx,.rar,.zip" required type="file" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password">
                                    </div>
                                
                             
                            
                                <button type="submit" style="text-transform:uppercase;" class="button button-contactForm boxed-btn">SUBMIT</button>
                               
                            </div>
                       
                  
                        </form>
                    </div>
                    </div>
                </div>
                <!-- Single Slidesr -->
                 </section>
<%@include file="footer.jsp" %>
</body>
</html>