<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<script>
document.getElementById("ddate").addEventListener('input', function() {
    var selectedDate = new Date(this.value);
    var today = new Date();
    if (selectedDate < today) {
        alert('Please select a date from today onwards.');
        this.value = '';
    }
});
</script>
</head>
<body>
<%@include file="guideheader.jsp" %>
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
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Add Task</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
<section class="contact-section">
            <div class="container">

                <div class="row">
                  <%int spid=Integer.parseInt(request.getParameter("id")); %>
                    <div class="col-lg-6">
                        <form class="form-contact contact_form" action="guideaddstudenttaskdata.jsp" method="post" >
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="number" readonly  class="form-control w-100" name="spid"  value="<%=spid %>"  required/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control w-100" name="title"  onfocus="this.placeholder = 'Enter   Title'" onblur="this.placeholder = 'Enter  Title '" placeholder=" Enter  Title " required/>
                                    </div>
                                </div>
                               
                     
                                  <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" name="desc" onfocus="this.placeholder = 'Enter Description'" onblur="this.placeholder = 'Enter Description '" placeholder="Enter Description  " required ></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   	<label>DueDate:</label>
                                        <input type="date" class="form-control" id="ddate" min="<%=LocalDate.now() %>" name="ddate"  required />
                                    </div>
                                </div>
                               
                                
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                                
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
</body>
</html>