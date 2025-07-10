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
   <%@ include file="guideheader.jsp" %>
   <!-- slider Area Start-->
        <div class="slider-area slider-height" data-background="assets/img/hero/h1_hero.jpg">
            <div class="slider-active">
                <!-- Single Slider -->
                
                
                    <div class="slider-cap-wrapper">
                      
                     <div class="col-lg-8 ">
                     
                                <center>
                        <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                    <h3>ViewTask</h3>
                                </div>
                            </div> 
                            </div>
                            <br><br>
         <div class="offset-lg-1"> 
                            <div table style=text-align:center;color:#000000;>
    <div style=margin-left:3%>    
                         <%
                         
                         
 try{        
	   
	  
	 Connection conn=GetConnection.getConnection();
	String mm=session.getAttribute("email").toString();
	 
 
	  
	  
	  
	 Statement st=conn.createStatement();
	 ResultSet rs=st.executeQuery("select * from task where email='"+mm+"'");
	 
	 out.println("<table border=1px width=80% >");
	 out.println("<tr>");
	 out.println("<th>"+"ID"+"</th>"+"<th>"+"TITLE"+"</th>"+"<th>"+"DESCRIPTION"+"</th>"+"<th>"+"DUEDATE"+"</th>"+"<th>"+"STATUS"+"</th>"+"<th>"+"DATE & TIME"+"</th>");
	 out.println("</tr>");
	  
	 while(rs.next()){
		   
		 
 			 
		 out.println("<tr>");
		 out.println("<td>"+rs.getInt(1)+"</td>"+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>");
		
 		 
		 out.println("</tr>");
		  
	 
	  
		    
	     
	 
	 }
  
	   
	 out.println("</table>");
 }           
     catch(Exception e){                    
    	 e.printStackTrace();
     }
                         
                         
                         %>
                         </div>  
            <!-- slider-footer Start -->
            </div>
            </div>
            
            </div>
             </div></div>
    </main>
 
     
 
     

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