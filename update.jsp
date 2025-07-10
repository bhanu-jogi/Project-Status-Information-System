<!doctype html>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Finance HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/flaticon.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
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
   <%@ include file="studentheader.jsp" %>
    <main>
     <%
     try{
    	 String status="new";
    	 int id=Integer.parseInt(request.getParameter("id"));
    	String email= session.getAttribute("email").toString();
     Connection con=GetConnection.getConnection();
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from title where id='"+id+"'");
     while(rs.next()){
    	  
    		%>
    		 
    	 
 
        <!-- slider Area Start-->
        <div class="slider-area slider-height" data-background="assets/img/hero/h1_hero.jpg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-lg-8">
                        <center>
                         <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                    <h3>SubmitTitle</h3>
                                </div>
                            </div>
                            <br>
                        <form class="form-contact contact_form" action="updatedata" method="post"  >
                            <div class="col">
                                 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="id" required id="subject" type="hidden" placeholder="Enter Title" value="<%=rs.getInt(1) %>">
                                    </div>
                                  <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="title" required id="subject" type="text" placeholder="Enter Title" value="<%=rs.getString(2) %>">
                                    </div>
                                </div>   
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <textarea class="form-control" name="abstractt" required id="subject"  onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter Abstract" value="<%=rs.getString(3) %>"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="domain" required id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter Domain" value="<%=rs.getString(4) %>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="softrequire" required id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter SoftwareRequirement" value="<%=rs.getString(5) %>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="hardrequire" required id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter HardwareRequirement" value="<%=rs.getString(6) %>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="email" required id="subject" type="email" readonly onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter password'" placeholder="Enter Your Email" value="<%=rs.getString(9) %>">
                                    </div>
                                </div>
                             
                            <div class="form-group mt-3">
                                <button type="submit" class="button button-contactForm boxed-btn">UPDATE</button>
                             </div>
                             </div>
                          
                     </div>
                        </form>
                    </div>
                </div></div></div></div>
                <!-- Single Slider -->
                 	<% 
    	  
      %>
             <jsp:forward page="viewtitle.jsp"></jsp:forward>
      
             <%
     }
     }
     catch(Exception e){
    	 e.printStackTrace();
     }
             %>
    </main>
 
     
<br><br><br>
<%@ include file="footer.jsp" %>
    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>