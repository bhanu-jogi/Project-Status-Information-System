<!doctype html>
<%@ page  import="databaseconnection.*" import="java.sql.*" import="java.util.*"  import="project.*"%>

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
    	 int id=Integer.parseInt(request.getParameter("id"));
    String email=session.getAttribute("email").toString();
    Connection con=GetConnection.getConnection();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from task where id='"+id+"'");
    while(rs.next()){
    	
     
%>
        <!-- slider Area Start-->
        <div class="slider-area slider-height" data-background="assets/img/hero/h1_hero.jpg">
         
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-lg-8">
                        <center>
                        <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                    <h5>Update Task</h5>
                                </div>
                            </div>
                            <br>
                        <form class="form-contact contact_form" action="updatetask" method="post"  >
                            <div class="row col-xl-2">
                             
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="email"   type="hidden"  value="<%=email%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="id"   type="hidden"  value="<%=id%>">
                                    </div>
                                </div>
                            <select name="upadtedata" > 
                                 
    
	   <option value="Active">Active</option>
	   <option value="Completed">Completed</option>
	 
   </select>
     
   
                               <br><br> 
                             
                            <div class="form-group mt-1">
                            <div class="col"> 
                                <button type="submit" class="button button-contactForm boxed-btn">UPDATE</button>
                            </div></div>
                              </div>
                          </form>
                     </div>
                         
                    </div></div></div>
                 
                <!-- Single Slider -->
                 
            <!-- slider-footer Start -->
           	<%
    }
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    %>  
    </main>
 
     
<br><br><br><br><br><br>
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