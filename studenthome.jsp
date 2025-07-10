	<!doctype html>
	<html class="no-js" lang="zxx">
    <head>
        <%@include file="headlinks.jsp" %>
   </head>

   <body>
   <main> 
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
   <!-- Hero Start-->
   <%String email=(String)session.getAttribute("email");
   String name="";
   try{
	   PreparedStatement ps=con.prepareStatement("select * from students where email=?");
	   ps.setString(1,email);
	   rs=ps.executeQuery();
	   while(rs.next()){
		   name=rs.getString(2);
	   }
   }catch(Exception e){
	   e.printStackTrace();
   }%>
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Welcome <%=name %>!!</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
           <div class="support-company-area section-padding3 fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img mb-50">
                            <img src="assets/img/st.jpg" style="height:750px"alt="">
                           
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="left-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle">
                               
                                <h2>Empowering Your Academic Journey</h2>
                            </div>
                            <div class="support-caption">
                                <p>Welcome to your Student Dashboard, a central hub designed to streamline your academic progress and ensure seamless communication with your faculty and guides. Here, you can easily submit your projects, track your progress, and access all relevant resources that help you stay on top of your academic goals. Whether you're working on a new project or reviewing feedback from your guide, everything is just a click away.</p>
                                <p>This platform is built to foster collaboration and transparency, allowing you to stay connected with your mentors and peers. You can track deadlines, access assignments, and stay informed about important updates in real-time. With this dashboard, you have all the tools you need to succeed, right at your fingertips.</p>                            
                                <div class="select-suport-items">
                                    <label class="single-items">Submit Projects Easily
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">  Receive Constructive Feedback
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Stay Connected
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items"> Track Your Academic Growth
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </main>
 
     
 
     

<%@ include file="footer.jsp" %>
   
        
</body>
</html>